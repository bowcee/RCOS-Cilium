# Cilium Onboarding / Pre-requisites
**Preface:**  
This markdown file should allow you to quickly and effectively learn the basics of networking and Cilium. 

**Cilium:**  
Cilium is a networking plugin for Kubernetes, designed to provide efficient networking and security services. It operates at the Linux kernel level, leveraging eBPF (extended Berkeley Packet Filter) technology to handle network traffic. Cilium offers features like network policy enforcement, load balancing, and observability, making it a powerful solution for containerized environments.  
[What is Cilium](https://cilium.io/get-started/)

**Kubernetes:**  
Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It provides a framework for deploying and managing applications across a cluster of machines, abstracting away the underlying infrastructure complexity and enabling developers to focus on building and running their applications.  
[What is kubernetes](https://kubernetes.io/docs/concepts/overview/)


**eBPF:**  
eBPF, or extended Berkeley Packet Filter, is a technology in the Linux kernel that allows for programmatically handling network packets and system events at runtime, without needing to modify the kernel itself. It's commonly used for tasks like network monitoring, security enforcement, and performance optimization. In the context of Kubernetes, eBPF is often used by networking plugins like Cilium to efficiently handle network traffic and enforce policies at the kernel level.  
[What is eBPF](https://ebpf.io/what-is-ebpf/)


**CNI:**  
CNI stands for Container Network Interface. It's a specification in the Kubernetes ecosystem that defines how networking is configured for containerized workloads. Essentially, CNIs enable different networking plugins, like Cilium, to integrate with Kubernetes clusters, providing network connectivity and services to containers running on the cluster.  
[Intro to CNI video](https://kube.academy/courses/kubernetes-in-depth/lessons/an-introduction-to-cni#:~:text=CNI%20stands%20for%20container%20network,provides%20a%20specification%20for%20this)


**An intro to AWS:**  
Amazon Web Services (AWS) is a comprehensive and widely used cloud computing platform offered by Amazon.com. It provides a variety of cloud services, including computing power (with services like EC2), storage (S3), databases (RDS, DynamoDB), networking (VPC), machine learning (SageMaker), analytics (Redshift), and many others. AWS allows businesses and individuals to access these services on-demand, enabling them to build and deploy applications and infrastructure without the need to invest in physical hardware. For testing and standing up out Kubernetes cluster, we are utilizing EC2 instances.  
[AWS](https://aws.amazon.com/what-is-aws/)

**EC2:**  
An EC2 instance is a virtual server on Amazon Web Services (AWS) that users can rent and configure to run their applications. It offers flexibility, scalability, and pay-as-you-go pricing, making it a popular choice for deploying various workloads in the cloud.   
[EC2](9https://aws.amazon.com/ec2/)  
[AWS Pricing Calculator](https://calculator.aws/#/addService)  

**What is EBS and why is it needed:**  
EBS (Elastic Block Store) is a scalable block storage service provided by Amazon Web Services (AWS) for use with EC2 instances. It offers persistent storage volumes that can be attached to EC2 instances, providing high performance and durability for storing data. EBS volumes are independent and can be easily resized or attached/detached from EC2 instances, offering flexibility and reliability for storing data in the AWS cloud. EBS is essential for Kubernetes because it provides persistent and durable storage for stateful workloads running on Kubernetes clusters, ensuring data availability and reliability in the cloud.  
[EBS](https://docs.aws.amazon.com/ebs/latest/userguide/what-is-ebs.html)  

**EKS:**  
Amazon EKS (Elastic Kubernetes Service) is a managed Kubernetes service on AWS. It simplifies Kubernetes deployment and management, integrates with AWS services, ensures scalability and reliability, and offers built-in security features, making it ideal for running containerized workloads in the cloud.  
We will not be using it for Cilium due to cost, but it is important to know its functionalities.  
[EKS](https://aws.amazon.com/eks/)  

**Service Mesh:**  
A service mesh in Kubernetes is a dedicated infrastructure layer for managing communication between microservices. It employs lightweight network proxies to handle traffic management tasks, offering features like load balancing, routing, security, and observability. It simplifies service-to-service communication, enhances reliability, and improves observability within Kubernetes environments.  
[definition](https://avinetworks.com/glossary/kubernetes-service-mesh/)  

**VPC:**  
A VPC (Virtual Private Cloud) is a virtual network environment in the cloud that closely resembles a traditional network infrastructure. It allows users to define their own virtual network topology, including IP address ranges, subnets, route tables, and network gateways. Within a VPC, users can deploy resources such as EC2 instances, RDS databases, and Lambda functions while having control over network access and security settings. VPCs provide isolation and segmentation, enabling organizations to create private, secure environments for their cloud-based applications and services.  

**Subnets (Private and Public):**  
Subnets are subdivisions of a network that enable better organization and management of network resources. Within a Virtual Private Cloud (VPC) environment, subnets play a crucial role in defining the boundaries and characteristics of different segments of the network.  
[explanation](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html)

**Private** subnets are designated for hosting internal resources that do not require direct access from the internet. These might include backend servers, databases, or other components that need to communicate with each other within the VPC. Instances in private subnets typically do not have public IP addresses and rely on network address translation (NAT) gateways or instances to access the internet indirectly if necessary. This setup enhances security by limiting direct exposure to external threats.

On the other hand, **public** subnets are intended for hosting resources that need to be accessible from the internet, such as web servers, load balancers, or API gateways. Instances in public subnets can have public IP addresses and are directly reachable from the internet. This facilitates communication with external clients or users accessing the application or service hosted within the VPC.

The distinction between private and public subnets lies primarily in their connectivity to the internet. Private subnets prioritize internal communication within the VPC and restrict direct internet access to enhance security. In contrast, public subnets allow resources to communicate with the internet, enabling external access to services hosted within the VPC. Properly configuring subnets within a VPC ensures that network resources are appropriately isolated and accessible based on their intended use cases and security requirements.

**IAM:**  
IAM (Identity and Access Management) is a system for securely managing user access to resources in cloud platforms like AWS. It enables defining user identities, specifying permissions for resource access, implementing multi-factor authentication, and monitoring user activity for security and compliance purposes.  
[IAM Guide](https://www.techtarget.com/searchsecurity/definition/identity-access-management-IAM-system)

**NAT:**  
NAT (Network Address Translation) is a technique used in computer networking to translate IP addresses between different networks. It conserves IP addresses, enhances security by hiding internal IP addresses, and facilitates communication between devices with different address schemes.  
[NAT Guide](https://avinetworks.com/glossary/network-address-translation/#:~:text=Network%20Address%20Translation%20(NAT)%20is,private%20network%20a%20public%20address.)

**Routing Tables:**  
Routing tables are data structures used in networking to determine where network traffic should be directed. They contain information about available network destinations and the next hop or gateway to reach them, enabling efficient routing of packets across networks.  
[Routing Tables Guide](https://www.techtarget.com/searchnetworking/definition/routing-table#:~:text=A%20routing%20table%20is%20a,as%20routers%20and%20network%20switches.)

**IGW:**  
An IGW (Internet Gateway) in AWS enables communication between instances in a VPC and the internet. It serves as a gateway for outbound internet access from instances within the VPC and inbound traffic from the internet to instances in public subnets.  
[AWS Internet Gateway Guide](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)

**Terraform:**  
Terraform is an open-source Infrastructure as Code (IaC) tool that allows users to define and provision infrastructure resources using a declarative configuration language. It supports multiple cloud providers and simplifies infrastructure management through automated dependency handling and a plan-apply workflow. 

[AWS Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

Terraform commands to run (in order):  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform workspace new "name"  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform workspace list  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform workspace select "name"  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;terraform workspace show  

**Ansible:**  
Ansible is an open-source automation tool used for configuration management, application deployment, and task automation. It allows you to manage multiple servers from a single control node, making it easier to deploy changes and manage infrastructure efficiently. Ansible uses YAML syntax for its configuration files and operates over SSH, making it agentless and simple to set up and use.  
[Ansible](https://www.ansible.com/)  

**KubeCTL uses and importance:**  
`kubectl` is a command-line tool used to interact with Kubernetes clusters. Kubernetes is an open-source platform designed to automate deploying, scaling, and managing containerized applications. With `kubectl`, users can perform various operations on Kubernetes clusters, such as deploying applications, inspecting cluster resources, scaling deployments, and managing networking and storage.

Here are some common tasks that `kubectl` can perform:

1. **Managing Resources**: You can use `kubectl` to create, delete, update, and view Kubernetes resources such as pods, deployments, services, configmaps, and secrets.

2. **Accessing Cluster**: `kubectl` allows you to interact with Kubernetes clusters, whether they are running locally (e.g., with Minikube), in the cloud (e.g., on AWS, GCP, Azure), or in on-premises environments.

3. **Debugging**: It provides various commands to inspect the state of resources, view logs, and debug issues within pods and containers.

4. **Scaling**: You can scale your deployments and replica sets up or down.

5. **Networking**: It helps manage network policies, services, and ingresses within the Kubernetes cluster.

6. **Configuration**: `kubectl` allows you to manage configurations, contexts, and authentication settings for accessing Kubernetes clusters.

7. **Plugins**: It supports plugins, allowing you to extend its functionality with custom commands.

Example usage (basic): `kubectl get nodes` or `kubectl cluster-info`

**ONCE YOU HAVE COMPLETED THIS DOCUMENT --> SEE startup.md**