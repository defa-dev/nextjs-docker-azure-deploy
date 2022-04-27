# CI/CD with Next.js (Dockerized) and Azure

Here's the components:
1. React.js
2. Next.js
3. Jest
4. Docker
5. GitHub Actions
6. Azure Container Registry
7. Azure App Service
    _ Deployment slots 

Bonus: 
7. __*Terraform*__ creates the Azure resources

:boom::boom::boom::boom::boom::boom::boom::boom::boom::boom::boom::boom::boom::boom::boom::boom:

Here's the concept:
- [x] Application developed using Next.js framework, and its robust infrastructure encapsulated on a Doker container. 
- [x] Simple tests applied using Jest 
- [x] The docker image is saved on Azure Container Registry by GitHub Actions pipeline
- [x] The same pipeline automatically build, test and deploy the container app in both qa and prod enviroments (using deployment slots)
- [x] Azure resources created by a Terraform script

Next steps...
- [ ]  Bind the Terraform created resources to the deploy pipeline so nothing need to be created manually

Made with :orange_heart:	
[Get in touch](https://www.linkedin.com/in/felipe-defacio-806695106/) :call_me_hand:	


## NTTLab
This application were developed for a workshop presented for NTT Applications Team.

