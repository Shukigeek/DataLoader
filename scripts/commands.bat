# להגיע לפרוייקט
cd C:\Users\shuki\Desktop\DataLoader

# פריסה של הDeployment
oc apply -f infrastructure/k8s/mysql-deployment.yaml

#לבניית אימג'
docker build -t shuki/data .

# לתת tag
docker tag shuki/data shuki120/data

#להעלות לדוקר הוב
docker push shuki120/data

