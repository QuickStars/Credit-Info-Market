# Credit-Info-Market

Note:
1.先打开https://ethereum.github.io/browser-solidity/
2.把代码复制进去，点击右上角Run-Create，右下角会出现一个框框
3.框框里面会有5个按钮：
let_there_be_light：创建一个数据库。为平台添加四家虚拟的公司账户，及四条贷款信息。并创建自己的账户“公司名：Fudan University, 账户余额：10000”。
unit_price：显示平台上单个信息的价格
numloans：显示平台上贷款信息总条数
my_account：查询自己的账户余额
upload_loan_info：上传本公司客户的贷款信息，输入范例："Killy Herrington", "310233199907142333", "Car Loan", 5, 1000, 40000, 20
search_loan_info；查询贷款人贷款信息，输入范例："Billy Herrington", "310233196907142333"
返回的值为目标客户的贷款信息编号及贷款公司名称
buy_loan_info：购买贷款信息，输入贷款信息的编号，平台会输出对应贷款的详细信息。同时，会从购买者账户中扣除unit_amount的金额，并转给上传该条信息的公司账户。
输出格式为：loan_goal, loan_length, loan_interest, current_balance, overdue_date, company_name
