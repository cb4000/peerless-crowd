for file in ../core-services/*.yaml
do
  cat "$file" | microk8s.linkerd inject - | microk8s.kubectl apply -f -
done
