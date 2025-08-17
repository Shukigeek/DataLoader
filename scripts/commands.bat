# להגיע לפרוייקט
cd C:\Users\shuki\Desktop\DataLoader

# פריסה של הDeployment
oc apply -f infrastructure/k8s/mysql-deployment.yaml
oc apply -f infrastructure/k8s/data-loader-deployment.yaml

#לבניית אימג'
docker build -t shuki/data .

# לתת tag
docker tag shuki/data shuki120/data

#להעלות לדוקר הוב
docker push shuki120/data

# יצירת טבלה
create table data (
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(100)
);

#הוספת אנשים
INSERT INTO data
(first_name, last_name)
VALUES
('Aiko', 'Tanaka'),
('Liam', 'O’Connor'),
('Fatima', 'Al-Hassan'),
('Diego', 'Martinez'),
('Zuri', 'Okafor'),
('Sofia', 'Rossi');

