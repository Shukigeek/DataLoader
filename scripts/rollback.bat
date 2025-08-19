oc delete deployment data-loader --ignore-not-found=true
oc delete svc data-loader --ignore-not-found=true
oc delete pvc mysql-pvc --ignore-not-found=true
oc delete deployment mysql --ignore-not-found=true
oc delete svc mysql --ignore-not-found=true

echo rollback done!
