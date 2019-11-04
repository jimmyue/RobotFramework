*** Settings ***
Resource          业务关键字.txt
Resource          基础关键字.txt

*** Test Cases ***
baidu1
    百度搜索    robot    robot_百度搜索

baidu2
    百度搜索    Framework    Framework_百度搜索

baidu3
    百度搜索    RobotFramework    RobotFramework_百度搜索

baidu4
    @{search}    Create List    Robot    Framework    RobotFramework
    : FOR    ${i}    IN    @{search}    #FOR IN 需大写，否则识别不了
    \    百度搜索    ${i}    ${i}_百度搜索

baidu5
    打开浏览器    https://www.baidu.com
    输入框    id=kw    RobotFramework
    点击按钮    id=su
    等待    2
    标题验证    RobotFramework_百度搜索
    关闭浏览器

IW
    登录IW    TEST    ways123
    等待    3
    标题验证    Dash Board
    截图
    关闭浏览器
