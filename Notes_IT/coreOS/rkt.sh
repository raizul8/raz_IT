# Delete all from list
sudo rkt list | awk '{print $1}' | xargs sudo rkt rm

# exclude what starts with 33
sudo rkt list | grep -v '^33' | awk '{print $1}'

# volume kind=empty shares data in the pod, delete pod delete data
# If you don't intend to persist the data and you just want to have a volume shared between all the apps in the pod, you can use an empty volume:
sudo rkt run --insecure-options=image --volume=data,kind=empty \
	--mount volume=data,target=/app/log \
	hello-container.aci log-container.aci 