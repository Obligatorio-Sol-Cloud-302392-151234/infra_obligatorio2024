Obligatorio Soluciones Cloud Diego Vazquez (302392) y Giovanni Storti (151234)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Consigna 

La startup “e-shop Services” ha decidido expandir sus operaciones por todo el mundo,
haciendo llegar sus servicios de e-commerce y retail, a todo el continente de América.

Para ello se requiere modernizar y desplegar la arquitectura e
infraestructura de su aplicación. Para
esto, se requiere el despliegue de las aplicaciones, en ambientes basados en containers

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Pre-requisitos instalados 📋

AWS CLI
Docker Desktop V2.15.0
Terraform v1.9.8
Bash (en caso de realziar la instalacion en windows)
Git 2.47.0
kubctl Kustomize Version: v5.4.2

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Modo de uso del repositorio🔧

Con este repositorio se podran realizar despligues de una pagina web constitudia por diferentes microservicios que interactuan entre si.
Para ello utilizaremos archivos de terraform donde se definiran los recursos, variables y modulos necesarios para realizar el despliegue.

Comandos a utlizar en terraform:

Terraform init - Para descargar los modulos a utilizar.

Terraform plan - Validacion previadel correcto funcionamineto de terraform.

Terrafor apply - Para comenzar a correr los comandos de los archivos terraform del repositorio para realizar el deploy.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Despliegue 📦

Modulos utilizados:

 

Providers utilizados:

Aws
Docker
Kubectl

Diagramas:


Manejo de imagenes de docker:


Automatismos implementados:


Ejemplos de uso:


Consideraciones a tener en cuenta:

