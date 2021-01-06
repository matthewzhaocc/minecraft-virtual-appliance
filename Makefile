all:
	packer build . 2>&1 | tee output.txt
	./prepdata.sh

clean:
	rm -rf ami.txt output.txt

copy2ssm:
	export AMI_ID=$(cat ami.txt)
	aws ssm put-parameter --name "mcvappami" --value $AMI_ID --type String