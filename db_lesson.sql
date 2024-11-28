Q1
CREATE TABLE departments (department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, name VARCHAR(20) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
DESC departments;

Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;
DESC people;

Q3
INSERT INTO departments (name) VALUES ('営業'), ('開発'), ('経理'), ('人事'), ('情報システム');
INSERT INTO people (name, email, department_id) VALUES ('山田太郎', 'yamada@example.com', 1), ('佐藤次郎', 'sato@example.com', 1), ('鈴木三郎', 'suzuki@example.com', 1), ('田中四郎', 'tanaka@example.com', 2), ('高橋五郎', 'takahashi@example.com', 2), ('伊藤六郎', 'ito@example.com', 2), ('渡辺七郎', 'watanabe@example.com', 2), ('松本八郎', 'matsumoto@example.com', 3), ('吉田九郎', 'yoshida@example.com', 4), ('中村十郎', 'nakamura@example.com', 5);
INSERT INTO reports (person_id, content) VALUES (1, '営業チームの進捗が順調です。今週中に目標を達成で きそうです。'), (2, '開発のテストが完了し、次のフェーズに進みました。'), (3, '経理業務はスムーズに進行中です。今月の締め処 理も問題なく終わりました。'), (4, '人事の面接がうまくいき、新しいメンバーが加わります。'), (5, '情報システムのシステム更新 が完了しました。'), (6, '営業チームの会議で新しい戦略が決まりました。'), (7, '開発の進捗が予定より遅れているが、問題は解決 しました。'), (8, '経理の月次報告書を提出しました。'), (9, '人事の新しい人材採用プランを立てました。'), (10, '情報システム のセキュリティ強化が完了しました。');

Q4
SELECT * FROM people;
UPDATE people SET department_id = (SELECT department_id FROM departments ORDER BY RAND() LIMIT 1) WHERE department_id IS NULL;

Q5
SELECT name, age FROM people WHERE gender = '1' ORDER BY age DESC;

Q6
peopleテーブルからdepartment_idが1であるレコードを検索し、その結果からname、email、ageのデータを取得し、取得したデータをcreated_atカラムの値を基に昇順に並べ替えて表示。

Q7
SELECT name FROM people WHERE (gender = 2 AND age BETWEEN 20 AND 29) OR (gender = 1 AND age BETWEEN 40 AND 49);

Q8
SELECT name, age FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

Q10
SELECT p.name, d.name AS department_name, r.content AS report_content FROM people p INNER JOIN departments d ON p.department_id = d.department_id INNER JOIN reports r ON p.person_id = r.person_id;

Q11
SELECT p.name FROM people p LEFT JOIN reports r ON p.person_id = r.person_id WHERE r.person_id IS NULL;
