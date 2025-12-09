create database Library_Database_Analysis;
use Library_Database_Analysis;
-- Table: tbl_publisher
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(255) PRIMARY KEY,
    publisher_PublisherAddress TEXT,
    publisher_PublisherPhone VARCHAR(15)
);

-- Table: tbl_book
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY,
    book_Title VARCHAR(255),
    book_PublisherName VARCHAR(255),
    FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName)
);

-- Table: tbl_book_authors
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT PRIMARY KEY auto_increment,
    book_authors_BookID INT,
    book_authors_AuthorName VARCHAR(255),
        FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID)
);

-- Table: tbl_library_branch
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT PRIMARY KEY auto_increment,
    library_branch_BranchName VARCHAR(255),
    library_branch_BranchAddress TEXT
);

-- Table: tbl_book_copies
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT PRIMARY KEY auto_increment,
    book_copies_BookID INT,
    book_copies_BranchID INT,
    book_copies_No_Of_Copies INT,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID)
);

-- Table: tbl_borrower
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY,
    borrower_BorrowerName VARCHAR(255),
    borrower_BorrowerAddress TEXT,
    borrower_BorrowerPhone VARCHAR(15)
);

-- Table: tbl_book_loans
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT PRIMARY KEY auto_increment,
    book_loans_BookID INT,
    book_loans_BranchID INT,
    book_loans_CardNo INT,
    book_loans_DateOut DATE,
    book_loans_DueDate DATE,
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo)
);

select * from tbl_book;
select * from tbl_book_authors;
select * from tbl_book_copies;
select * from tbl_book_loans;
select * from tbl_borrower;
select * from tbl_library_branch; 
select * from tbl_publisher; 



-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
select bc.book_copies_no_of_copies from tbl_book b
join tbl_book_copies bc 
on b.book_bookid = bc.book_copies_bookid
join tbl_library_branch lb 
on bc.book_copies_branchid = lb.library_branch_branchid
where b.book_title = 'the lost tribe'
and lb.library_branch_branchname = 'sharpstown';

-- How many copies of the book titled "The Lost Tribe" are owned by each library branch?
select lb.library_branch_branchname,bc.book_copies_no_of_copies from tbl_book b
join tbl_book_copies bc on b.book_bookid = bc.book_copies_bookid
join tbl_library_branch lb on bc.book_copies_branchid = lb.library_branch_branchid
where b.book_title = 'the lost tribe';

-- Retrieve the names of all borrowers who do not have any books checked out.
select br.borrower_borrowername
from tbl_borrower br
left join tbl_book_loans bl 
on br.borrower_cardno = bl.book_loans_cardno
where bl.book_loans_loansid is null;

-- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address. 
select b.book_title,br.borrower_borrowername,br.borrower_borroweraddress
from tbl_book_loans bl
join tbl_book b 
on bl.book_loans_bookid = b.book_bookid
join tbl_borrower br 
on bl.book_loans_cardno = br.borrower_cardno
join tbl_library_branch lb 
on bl.book_loans_branchid = lb.library_branch_branchid
where lb.library_branch_branchname = 'sharpstown'
and bl.book_loans_duedate = '2018-02-03';

-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
select lb.library_branch_branchname,
count(bl.book_loans_loansid) as total_loans
from tbl_library_branch lb
left join tbl_book_loans bl 
on lb.library_branch_branchid = bl.book_loans_branchid
group by lb.library_branch_branchname;

-- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
select br.borrower_borrowername,br.borrower_borroweraddress,
count(bl.book_loans_loansid) as books_checked_out
from tbl_borrower br
join tbl_book_loans bl 
on br.borrower_cardno = bl.book_loans_cardno
group by br.borrower_cardno
having count(bl.book_loans_loansid) > 5;

-- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
select b.book_title,bc.book_copies_no_of_copies
from tbl_book b
join tbl_book_authors ba 
on b.book_bookid = ba.book_authors_bookid
join tbl_book_copies bc 
on b.book_bookid = bc.book_copies_bookid
join tbl_library_branch lb 
on bc.book_copies_branchid = lb.library_branch_branchid
where ba.book_authors_authorname = 'stephen king'
and lb.library_branch_branchname = 'central';



