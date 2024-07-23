USE practie_sql;

-- 거래내역 테이블
-- 거래번호 정수
-- 거래일자 날짜
-- 거래구분 가변문자열 10
-- 내역 장문의 문자열
-- 금액 정수
-- 세금 정수
-- 비고 장문의 문자열

CREATE TABLE transaction (
	transaction_number INT,
    transaction_date DATE,
    transaction_type VARCHAR(10),
    breakdown TEXT,
    amount INT,
    tax INT,
    note TEXT
);

INSERT INTO transaction VALUES (1, '2024-07-10', '구매', '모자', 1000000, 100000, '1개구매');
INSERT INTO transaction VALUES (2, '2024-07-11', '판매', '스마트폰', 1000000, 100000, '갤럭시');
INSERT INTO transaction VALUES (3, '2024-07-12', '판매', '헤드셋', 1000000, 100000, '삼성');
INSERT INTO transaction VALUES (4, '2024-07-13', '구매', '책상', 4000000, 100000, '스무디');
INSERT INTO transaction VALUES (5, '2024-07-14', '구매', '노트북', 4000000, 200000, '삼성');
INSERT INTO transaction VALUES (6, '2024-07-15', '판매', '의자', 4000000, 150000, '키즈아이');
INSERT INTO transaction VALUES (7, '2024-07-16', '펀매', '의약외품', 2000000, 150000, '종근당');
INSERT INTO transaction VALUES (8, '2024-07-17', '구매', '영양제', 1000000, 50000, '골든스타');
INSERT INTO transaction VALUES (9, '2024-07-18', '구매', '상의', 1000000, 100000, '돌체엔가바나');
INSERT INTO transaction VALUES (10, '2024-07-19', '판매', '하의', 1000000, 100000, '리바이스');

-- 산술 연산자
-- +, -, *, /, %
SELECT amount + tax, breakdown FROM transaction;

-- 비교 연산자 (WHERE 절에서 자주 사용)
-- 원하는 레코드를 정확히 조회하는데 중요한 역할을 함

-- = : 좌항이 우항과 같으면 true
SELECT * FROM transaction WHERE transaction_number = 12;


-- <>, != : 좌항이 우항과 다르면 true
SELECT * FROM transaction
WHERE transaction_number <> 13;

SELECT * FROM transaction
WHERE transaction_number != 13;

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
SELECT * FROM transaction
WHERE amount < 1000000;

SELECT * FROM transaction
WHERE amount <= 1000000;


-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true
SELECT * FROM transaction
WHERE amount > 1200000;

SELECT * FROM transaction
WHERE amount >= 1200000;

ALTER TABLE transaction
ADD complete BOOLEAN;

UPDATE transaction SET complete = true
WHERE (transaction_number % 3) = 1;

UPDATE transaction SET complete = false
WHERE (transaction_number % 3) = 2;

SELECT * FROM transaction;

UPDATE transaction SET note = null
WHERE transaction_number = 6;

-- <=> : 좌항과 우항이 모두 null 이면 true
SELECT * FROM transaction
WHERE complete <=> note;

-- IS : 좌항이 우항과 같으면 true (키워드)
-- IS NOT : 좌항이 우항과 다르면 true (키워드)
SELECT * FROM transaction WHERE complete IS TRUE;

SELECT * FROM transaction WHERE complete IS NULL;

SELECT * FROM transaction WHERE complete IS NOt NULL;


-- BETWEEN a AND b : 좌항이 a보다 크거나 같으면서 b보다 작거나 같으면 true
-- NOT BETWEEN a AND b : 좌항이 a보다 작거나 b보다 크면 true

SELECT * FROM transaction WHERE transaction_date BETWEEN '2024-07-15' AND '2024-07-20'; # a부터 b까지 값을 보고싶을때 쓰는코드

# a 부터 b를 제외한 값을 보고싶을 때 사용한다
SELECT * FROM transaction WHERE transaction_date NOT BETWEEN '2024-07-15' AND '2024-07-20';


-- IN() : 주어진 리스트 중에 하나라도 일치하면 true
-- NOT INT() : 주어진 리스트 중에 하나도 일치하지 않으면 true

SELECT * FROM transaction WHERE breakdown IN('노트북''의자');

-- 논리연산자

-- AND (&&) : 좌항과 우항이 모두 true이면 true


SELECT * FROM transaction WHERE tacsaction_type = '판매' AND amount >= 1500000;

-- OR (||) : 좌항과 우항중 하나라도 true이면 true

SELECT * FROM transaction WHERE transaction_date >= '2024-07-15' OR tacsaction_type = '판매';


-- XOR : 좌항과 우항이 서로 다르면 true

SELECT * FROM transaction WHERE transaction_date >= '2024-07-15' XOR tacsaction_type = '판매';
-- transaction_date >= '2024-07-15' AND tacsaction_type != '판매'
-- or
-- transaction_date >= '2024-07-15' AND tacsaction_type = '판매'

-- LIKE 연산자 : 문자열을 패턴을 기준으로 비교하고자 할때 사용
-- % : 임의의 개수(0 ~ 무한대)의 문자 표현
-- _ : 임의의 한 개 문자 표현



SELECT * FROM transaction WHERE transaction_date LIKE '2024-07-%';

SELECT * FROM transaction WHERE transaction_date LIKE '2024-07-_1'; # __를 쓰면 전체 조회가능

SELECT * FROM transaction WHERE breakdown LIKE '의%';

SELECT * FROM transaction WHERE transaction_date LIKE '%-10';

SELECT * FROM transaction WHERE transaction_date LIKE '2024-__-13';