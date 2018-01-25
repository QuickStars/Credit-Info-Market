pragma solidity 0.4.9;
contract Credit_Info_Exchange_System {
    
    struct Creditor {
        string company_name;
        uint balance;
        address addr;
    }
    struct Loan {
        bytes32 borrower_name;
        bytes32 ID_No;
        string loan_goal;
        uint loan_length;
        uint loan_interest;
        uint current_balance;
        uint overdue_date;
        Creditor loan_creditor;
    }
    
    address test_admin;
    uint public unit_price = 15;
    uint public numloans = 0;
    mapping(address => Creditor) users;
    mapping(uint => Loan) loans;
    
    function let_there_be_light() public {
        test_admin = msg.sender;
        users[0xF055775eBD516e7419ae486C1d50C682d4170645] = Creditor("Theychat", 10000, 0xF055775eBD516e7419ae486C1d50C682d4170645);
        users[0x8aF9C90D7E3e27C6343C3De07A260a489872adCE] = Creditor("Blibaba", 10000, 0x8aF9C90D7E3e27C6343C3De07A260a489872adCE);
        users[0x83D1a618f37Cf08b64352755Bfad7b2a3b781F5b] = Creditor("Elevencent", 10000, 0x83D1a618f37Cf08b64352755Bfad7b2a3b781F5b);
        users[ 0x2F32a6eE63d73A16F9e50365A2e76f9f64124dee] = Creditor("Ofobike", 10000,  0x2F32a6eE63d73A16F9e50365A2e76f9f64124dee);
        users[msg.sender] = Creditor("Fudan University", 10000, msg.sender);
        loans[0] = Loan("Ailly Herrington", "310233196907142333", "Mortgage Loan", 30, 3000, 200000, 5, users[0x8aF9C90D7E3e27C6343C3De07A260a489872adCE]);
        loans[1] = Loan("Cilly Herrington", "310233196907142355", "Mortgage Loan", 30, 3000, 200000, 5, users[0xF055775eBD516e7419ae486C1d50C682d4170645]);
        loans[2] = Loan("Dilly Herrington", "310233196907142376", "Mortgage Loan", 30, 3000, 200000, 5, users[0x83D1a618f37Cf08b64352755Bfad7b2a3b781F5b]);
        loans[3] = Loan("Billy Herrington", "310233196907142333", "Mortgage Loan", 10, 1000, 50000, 0, users[0x83D1a618f37Cf08b64352755Bfad7b2a3b781F5b]);
        numloans += 4;
    }
    
    function my_account() public returns (uint balance) {
        return users[msg.sender].balance;
    }
    
    function upload_loan_info(bytes32 borrower_name, bytes32 ID_No, string loan_goal, uint loan_length, uint loan_interest, uint current_balance, uint overdue_date) public returns (uint loanID) {
        loanID = numloans++;
        loans[loanID] = Loan(borrower_name, ID_No, loan_goal, loan_length, loan_interest, current_balance, overdue_date, users[msg.sender]);
    }
    
    function search_loan_info(bytes32 target_borrower_name, bytes32 target_ID_No) public returns (uint found_loanID, string found_company_name){
        for(uint i=0; i < numloans; i++) {
            if((loans[i].borrower_name == target_borrower_name) && (loans[i].ID_No == target_ID_No)) {
                return (i, loans[i].loan_creditor.company_name);
            }
        }
    }
    
    function buy_loan_info(uint loanID) public returns (string loan_goal, uint loan_length, uint loan_interest, uint current_balance, uint overdue_date, string company_name) {
        if(users[msg.sender].balance < unit_price) return;
        users[msg.sender].balance -= unit_price;
        users[loans[loanID].loan_creditor.addr].balance += unit_price;
        Loan storage target = loans[loanID];
        return (target.loan_goal, target.loan_length, target.loan_interest, target.current_balance, target.overdue_date, target.loan_creditor.company_name);
    }
    
}
