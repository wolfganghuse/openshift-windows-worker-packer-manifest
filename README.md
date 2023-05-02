# openshift-windows-worker-packer-manifest

This Packer Manifest will create a Windows base image which can be used with WMCO on OpenShift 4.14+ and Nutanix Cloud Platform.

Validate the Manifest before building, keep in mind to provide all variables by copying and customizing the secret-template file.

If Windows ISO is already available in your Nutanix Image Service you can provide the Name, otherwise you can also populate the URI variable to download it into your image service.

```
packer validate .
```

To build the base image:

```
packer build .
```