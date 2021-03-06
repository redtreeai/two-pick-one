---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by chs.
--- DateTime: 19-1-7 下午3:03
--- 绘画逻辑控制器
require('loader')
require('core.love_engine')
require('gdata.basedata')
require('utils.math_tool')
painter = {}
--cur_scene为当前场景/状态
function painter.dojob(cur_scene,cur_mouse_x,cur_mouse_y,game_timer)
    --绘制前设置字体
    love_engine.graphics.setFont(loader.FONT_TYPE.MSYH34)
    love_engine.audio.play(loader.RESOURCE.bgm_m)
    --绘制游戏标题页面
    if cur_scene == basedata.SCENE_CODE.TITLE.code then
        --播放音乐
        --绘制按钮
        love_engine.graphics.print('start',800,20)
        love_engine.graphics.print('help',1000,20)
        love_engine.graphics.print('exit',1200,20)
        if basedata.SCENE_CODE.TITLE.is_on_start ==true then
            love_engine.graphics.rectangle("line",  795, 20, 85, 45)
        end
        if basedata.SCENE_CODE.TITLE.is_on_help ==true then
            love_engine.graphics.rectangle("line",  995, 20, 80, 45)
        end
        if basedata.SCENE_CODE.TITLE.is_on_exit ==true then
            love_engine.graphics.rectangle("line",  1195, 20, 75, 45)
        end
        --分割线
        love_engine.graphics.line(0, 100, 1440, 100)
        --棋盘绘制
        love_engine.graphics.rectangle("line",  360, 150, 720, 720)
        love_engine.graphics.rectangle("line",  480, 270, 480, 480)
        love_engine.graphics.rectangle("line",  600, 390, 240, 240)
        love_engine.graphics.line(360, 150, 600, 390)
        love_engine.graphics.line(720, 150, 720, 390)
        love_engine.graphics.line(1080, 150, 840, 390)
        love_engine.graphics.line(840, 510, 1080, 510)
        love_engine.graphics.line(840, 630, 1080, 870)
        love_engine.graphics.line(720, 630, 720, 870)
        love_engine.graphics.line(600, 630, 360, 870)
        love_engine.graphics.line(360, 510, 600, 510)
        --根据数组绘制棋子
        --如果移动到help上,则显示help
        if basedata.SCENE_CODE.TITLE.is_on_help == true then
            love_engine.graphics.draw(loader.RESOURCE.rules_img,300,150)
        end
    end

    --绘制开始游戏界面
    if cur_scene == basedata.SCENE_CODE.GAME.code then
        --绘制按钮
        if gamedata.turn ==1 then
            love_engine.graphics.print('turn:  superbear',25,20)
        elseif gamedata.turn ==2 then
            love_engine.graphics.print('turn:  batcat',25,20)
        end
        love_engine.graphics.print('restart',800,20)
        love_engine.graphics.print('help',1000,20)
        love_engine.graphics.print('exit',1200,20)
        if basedata.SCENE_CODE.GAME.is_on_restart ==true then
            love_engine.graphics.rectangle("line",  795, 20, 120, 45)
        end
        if basedata.SCENE_CODE.GAME.is_on_help ==true then
            love_engine.graphics.rectangle("line",  995, 20, 80, 45)
        end
        if basedata.SCENE_CODE.GAME.is_on_exit ==true then
            love_engine.graphics.rectangle("line",  1195, 20, 75, 45)
        end
        --分割线
        love_engine.graphics.line(0, 100, 1440, 100)
        --棋盘绘制
        love_engine.graphics.rectangle("line",  360, 150, 720, 720)
        love_engine.graphics.rectangle("line",  480, 270, 480, 480)
        love_engine.graphics.rectangle("line",  600, 390, 240, 240)
        love_engine.graphics.line(360, 150, 600, 390)
        love_engine.graphics.line(720, 150, 720, 390)
        love_engine.graphics.line(1080, 150, 840, 390)
        love_engine.graphics.line(840, 510, 1080, 510)
        love_engine.graphics.line(840, 630, 1080, 870)
        love_engine.graphics.line(720, 630, 720, 870)
        love_engine.graphics.line(600, 630, 360, 870)
        love_engine.graphics.line(360, 510, 600, 510)
        --根据数组绘制棋子
        for i=1,24 do
            if gamedata.PAN_RUN[i] == 1 then
                love_engine.graphics.draw(loader.RESOURCE.p1_img,basedata.PAN_XPOINT[i]-45,basedata.PAN_YPOINT[i]-45)
            elseif gamedata.PAN_RUN[i] ==2 then
                love_engine.graphics.draw(loader.RESOURCE.p2_img,basedata.PAN_XPOINT[i]-45,basedata.PAN_YPOINT[i]-45)
            end
        end

        --执子过程中
        if gamedata.is_keepchess==true and gamedata.last_point~=0 then
            love_engine.audio.play(loader.RESOURCE.jump_m)
            if gamedata.last_type==1 then
                love_engine.graphics.draw(loader.RESOURCE.p1_img,cur_mouse_x-45,cur_mouse_y-45)
            elseif gamedata.last_type==2 then
                love_engine.graphics.draw(loader.RESOURCE.p2_img,cur_mouse_x-45,cur_mouse_y-45)
            end

            --绘制落子提示
            cr = basedata.ROUTE[gamedata.last_point]
            crl = math_tool.table_leng(cr)
            for s=1,crl do
                if gamedata.PAN_RUN[cr[s]] ==0 then
                    love_engine.graphics.draw(loader.RESOURCE.togo_img,basedata.PAN_XPOINT[cr[s]]-45,basedata.PAN_YPOINT[cr[s]]-45)
                end
            end
        end

        --如果有错误执子行为，则提示
        if gamedata.error_point ~=0 then
            love_engine.graphics.draw(loader.RESOURCE.error_img,basedata.PAN_XPOINT[gamedata.error_point]-45,basedata.PAN_YPOINT[gamedata.error_point]-45)
            love_engine.audio.play(loader.RESOURCE.error_m)
        end

        --如果有棋子被吃，则引爆
        if math_tool.table_leng(gamedata.destroy_point_list) ~=0 then
            for b=1,math_tool.table_leng(gamedata.destroy_point_list) do
                love_engine.graphics.draw(loader.RESOURCE.fire_img,basedata.PAN_XPOINT[gamedata.destroy_point_list[b]]-45,basedata.PAN_YPOINT[gamedata.destroy_point_list[b]]-45)
            end
            love_engine.audio.play(loader.RESOURCE.bomb_m)
        end

        --如果分出胜负
        if basedata.SCENE_CODE.GAME.is_gameover==true then
            if gamedata.winner==1 then
                love_engine.graphics.draw(loader.RESOURCE.p1win_img,360,90)
            elseif gamedata.winner==2 then
                love_engine.graphics.draw(loader.RESOURCE.p2win_img,360,90)
            end
            love_engine.audio.play(loader.RESOURCE.win_m)
        end

        --如果移动到help上,则显示help
        if basedata.SCENE_CODE.GAME.is_on_help == true then
            love_engine.graphics.draw(loader.RESOURCE.rules_img,300,150)
        end
    end
end

