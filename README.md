# OVH to Google Colab and Amazon SageMaker Studio Compatibility Mode

The purpose of this docker image is to make it easy to run 
Jupyter Notebooks authored on 
Google Colab or Amazon SageMaker Studio
on the OVH AI Notebook infrastructure.
For example, this allows you to try out
those Huggingface Transformers Examples
in a private european Cloud.

# How to update

In your target environment, run
```
!apt list --installed
```
and copy the result into `package-list.txt`.
Afterwards, run 
```
!pip-chill
```
and copy the result into `requirements.txt`.
Move large requirements such as torch or TensorFlow
into `requirements-large.txt` so that you 
don't have to reinstall them in case of version conflicts.

In the Dockerfile, update the CUDA and cudnn versions on top,
as needed to match the package list.

Run `packagelist2apt.py` 
to create updated `apt-install-*.sh` scripts
out of your new package list.

# License
 
Copyright 2022 by Hajo Nils Krabbenhöft
licensed under Apache 2.0

Dockerfile and jupyter.sh are based on files
Copyright 2021 by OVH SAS
licensed under Apache 2.0 
 
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
 
    http://www.apache.org/licenses/LICENSE-2.0
 
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.