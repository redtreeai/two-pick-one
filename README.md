# two-pick-one

一款支持本地双人对战的棋类游戏,基于love2d(lua)引擎开发。

A chess game that supports local two-player warfare is developed based on the love 2D (lua) engine.

游戏的规则很简单：

1. 整个棋盘的落子点共24处，开局后双方各拥有9个棋子。

2. 棋子的行动规则为任意所除直线上的空点。

3. 当玩家A落子完毕后若形成 AAB/ABA/BAA的形式，则消灭B子

4. 最终将对方消灭到1子以下者获胜

The rules of the game are simple:

1. The whole chessboard has 24 falling points. After the opening, each side has 9 pieces.

2. The rules of action of chess pieces are empty points on any dividing line.

3. When Player A falls out and forms AAB/ABA/BA A, it will destroy Player B.

4. The winner is the one who wipes out the other party to one son or less.

![]show1.png
![]show2.png
![]show3.png
