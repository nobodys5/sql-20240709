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
WHERE note <=> complete;