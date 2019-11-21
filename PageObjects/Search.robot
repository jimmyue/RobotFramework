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
    点击元素    id=su
    等待    2
    断言标题    RobotFramework_百度搜索
    关闭浏览器

智库
    登录    TEST    ways123
    等待
    断言标题    Dash Board
    点击元素    xpath=//*[@id="modules"]/table/tbody/tr[1]/td[1]/a
    ${text}    获取Text    xpath=//*[@id="summary"]/tbody/tr/td[1]/p
    断言数据库    select to_char(sum(t.bq_sales),'fm999,999,999,999,999') \ from fdm_state_sales_sub_model t where t.data_type_id=3 and t.ym=201910    ${text}
    截图
    跳转URL    http://car.waysdata.com/price/overMarketPrice?locale=zh_CN
    等待    3
    关闭浏览器
