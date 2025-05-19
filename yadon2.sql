Q1
create table departments(
   -> department_id int(10) unsigned auto_increment primary key,
   -> name varchar(20) not null,
   -> created_at timestamp default current_timestamp,
   -> updated_at timestamp default current_timestamp on update current_timestamp
   -> );

Q2
alter table people
    -> add department_id int(10) unsigned
    -> after email;

Q3
INSERT INTO departments (department_id, name,created_at,updated_at)
VALUES
(1,'営業','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(2,'開発','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(3,'経理','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(4,'人事','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(5,'情報システム','2025-04-26 09:30:00', '2025-04-26 09:30:00');

INSERT INTO people(person_id,name,email,department_id,age,gender,created_at,updated_at)
VALUES
(7,'営業ヤドンA','EIyadonA@co.bumi',1,20,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(8,'営業ヤドンB','EIyadonB@co.bumi',1,21,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(9,'営業ヤドンC','EIyadonC@co.bumi',1,22,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(10,'開発ヤドンA','KAyadonA@co.bumi',2,23,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(11,'開発ヤドンB','KAyadonB@co.bumi',2,24,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(12,'開発ヤドンC','KAyadonC@co.bumi',2,25,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(13,'開発ヤドンD','KAyadonD@co.bumi',2,26,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(14,'経理ヤドン','KEyadon@co.bumi',3,27,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(15,'人事ヤドン','JIyadon@co.bumi',4,23,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(16,'情シスヤドン','JOyadonA@co.bumi',5,23,1,'2025-04-26 09:30:00', '2025-04-26 09:30:00');


INSERT INTO reports(report_id,person_id,content,created_at,updated_at)
VALUES
(11,7,'営業ヤドンAの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(12,8,'営業ヤドンBの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(13,9,'営業ヤドンCの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(14,10,'開発ヤドンAの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(15,11,'開発ヤドンBの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(16,12,'開発ヤドンCの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(17,13,'開発ヤドンDの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(18,14,'経理ヤドンの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(19,15,'人事ヤドンの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00'),
(20,16,'情シスヤドンの日報','2025-04-26 09:30:00', '2025-04-26 09:30:00');

Q3修正
INSERT INTO departments (department_id, name)
VALUES
(1,'営業'),
(2,'開発'),
(3,'経理'),
(4,'人事'),
(5,'情報システム');

INSERT INTO people(name,email,department_id,age,gender)
VALUES
('営業ヤドンA','EIyadonA@co.bumi',1,20,1),
('営業ヤドンB','EIyadonB@co.bumi',1,21,1),
('営業ヤドンC','EIyadonC@co.bumi',1,22,1),
('開発ヤドンA','KAyadonA@co.bumi',2,23,1),
('開発ヤドンB','KAyadonB@co.bumi',2,24,1),
('開発ヤドンC','KAyadonC@co.bumi',2,25,1),
('開発ヤドンD','KAyadonD@co.bumi',2,26,1),
('経理ヤドン','KEyadon@co.bumi',3,27,1),
('人事ヤドン','JIyadon@co.bumi',4,23,1),
('情シスヤドン','JOyadonA@co.bumi',5,23,1);

INSERT INTO reports(person_id,content)
VALUES
(7,'営業ヤドンAの日報'),
(8,'営業ヤドンBの日報'),
(9,'営業ヤドンCの日報'),
(10,'開発ヤドンAの日報'),
(11,'開発ヤドンBの日報'),
(12,'開発ヤドンCの日報'),
(13,'開発ヤドンDの日報'),
(14,'経理ヤドンの日報'),
(15,'人事ヤドンの日報'),
(16,'情シスヤドンの日報');

Q4* 86行目に86行目にperson_idの2と3追加
UPDATE people SET department_id=1 WHERE person_id IN (1, 2, 3);
UPDATE people SET department_id=4 WHERE person_id=4;
UPDATE people SET department_id=5 WHERE person_id=6;


Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
peopleテーブルからdepartment_id（部署ID）が1（営業）のレコードを抽出後、nameカラム、emailカラム、ageカラムだけ取得し、created_at（作成日時）が早い順（昇順）にソートする。

Q7
SELECT name
FROM people
WHERE 
  (gender = 2 AND age BETWEEN 20 AND 29)
  OR
  (gender = 1 AND age BETWEEN 40 AND 49);

Q8
SELECT name FROM people where department_id=1 order by age;

Q9
SELECT AVG(age) AS average_age From people where gender=2 group by gender;

Q10
SELECT
 people.name,
 departments.name,
 reports.content
FROM
 people
INNER JOIN departments
 ON people.department_id = departments.department_id
INNER JOIN reports
 ON people.person_id = reports.person_id;

Q11*　onを使わずに取得
SELECT
  people.name
FROM
  people
LEFT JOIN reports
  USING (person_id)
WHERE
  reports.person_id IS NULL;

ON有りの時は、カラム名がバラバラの時にも使用できる。
ON無し（using）の時は、カラム名が同じ時にシンプルに使用できる。

内部結合外部結合の違い説明
内： 「両方にデータがあるものだけ」くっつけて表示
外： 「左側のテーブルのすべてのデータ」を表示し、右に合うものがあればくっつけて表示