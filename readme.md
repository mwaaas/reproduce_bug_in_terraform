Example of reproducing a bug in overriding provider with alias in module. 
Also in this terraform issue https://github.com/hashicorp/terraform/issues/21699

So we will reproduce by creating dynamo db locally, we have overridden the provider 
dynamodb endpoint and disabled credentials validation and requesting account id 

Success ->  table is created 

Bug -> provider is not overridden and tries to
       get aws token and fail since the credentials are invalid
       
Since the bug is intermittent, we will run a loop that keeps on running terraform apply until it fails 

I have seen scenario where it will loop like 20 times before the error appearing 

# pre-request 
docker installed 

# steps to reproduce 
1. clone this repo 
    ````
    git clone git@github.com:mwaaas/reproduce_bug_in_terraform.git

2. Run this command 
    ````
    ./run_unitil_it_fails.sh 
 