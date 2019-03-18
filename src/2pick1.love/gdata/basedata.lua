---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by chs.
--- DateTime: 19-1-2 下午4:23
--- 游戏基础数据

basedata = {}
--游戏场景编号
basedata.SCENE_CODE = {
    --位于初始界面
    TITLE = {
      code = 'title',
      --鼠标是否位于开始游戏按钮
      is_on_start =false,
      --鼠标是否位于离开游戏按钮
      is_on_exit =false,
      --鼠标是否位于帮助
      is_on_help=false
    }
    ,
    GAME = {
        code = 'game',
        --游戏是否结束
        is_gameover =false,
        --鼠标是否位于开始游戏按钮
        is_on_restart =false,
        --鼠标是否位于离开游戏按钮
        is_on_exit =false,
        --鼠标是否位于帮助
        is_on_help=false
    },
}

basedata.PAN_INIT = {1,1,1,1,1,1,1,1,1,0,0,0,2,2,2,2,2,2,2,2,2,0,0,0}

basedata.PAN_XPOINT = {360,480,600,720,720,720,1080,960,840,1080,960,840,1080,960,840,720,720,720,360,480,600,360,480,600}

basedata.PAN_YPOINT = {150,270,390,150,270,390,150,270,390,510,510,510,870,750,630,870,750,630,870,750,630,510,510,510}

--提供路线导航，后期做
basedata.ROUTE = {
    {4,7,22,19,2,3},{1,3,23,20,5,8},{6,9,24,21,2,1},
    {1,7,5,6},{2,8,4,6},{4,5,3,9},
    {1,4,8,9,10,13},{7,9,2,5,11,14},{3,6,7,8,12,15},
    {7,13,12,11},{12,10,8,14},{9,15,11,10},
    {7,10,14,15,16,19},{13,15,8,11,17,20},{13,14,12,9,18,21},
    {13,19,18,17},{16,18,14,20},{15,21,16,17},
    {16,13,1,22,21,20},{17,14,21,19,23,2},{19,20,24,3,18,15},
    {1,19,23,24},{2,20,22,24},{3,21,22,23}
}
