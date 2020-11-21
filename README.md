# SAS Stop/Start

Project to stop and/or start SAS Campaing

## Variables
The project is run through the Ansible Tower. A project was created, with two job templates, one for the stop and one for the start.
The stop job template must contain in the extra vars, the variable "state" with the value "stop" and respectively the job template of start must have the variable with the value "start".

## Inventory
The machines of the SAS cluster for execution, are passed by Tower through a smart inventory. A hard inventory can also be used only with the machines in the cluster.

## License
[MIT](https://choosealicense.com/licenses/mit/)
