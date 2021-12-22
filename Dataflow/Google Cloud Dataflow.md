#### Created By: Indranil Pal
#### Created Date: 22/12/2021

## Google Cloud Dataflow

### Ref: https://cloud.google.com/dataflow/docs/concepts


#### 1. Pipeline
    > Apache beam starts with the Pipeline object. Inside pipeline, needs to create dataset which is PCollection.
    > Each pipeline represents a single, repeatable job.
#### 2. Pipeline I/O
    > Apache Beam I/O connectors let you read data into your pipeline and write output data from your pipeline. 
    > An I/O connector consists of a source and a sink
#### 3. PCollection
    > Apache Beam transforms use PCollection objects as inputs and outputs for each step in your pipeline. 
    > A PCollection can hold a dataset of a fixed size or an unbounded dataset from a continuously updating data source.
#### 4. Transformation
    > A transform represents a processing operation that transforms data.
    > A transform takes one or more PCollections as input, performs an operation that you specify on each element in that collection, and produces one or more PCollections as output
    > Can perform mathematical computation, grouping, filtering, converting data formates, reading and writing. 
#### 5. ParDo
    > ParDo is the core parallel processing operation in the Apache Beam SDKs, invoking a user-specified function on each of the elements of the input PCollection. ParDo collects the zero or more output elements into an output PCollection. 
    > The ParDo transform processes elements independently and possibly in parallel.
#### 6. Aggregation
    > The primary computational pattern for aggregation in Apache Beam is to group all elements with a common key and window. Then, it combines each group of elements using an associative and commutative operation.
#### 7. User-defined functions (UDFs)
#### 8. Runner
    > Runners are the software that accepts a pipeline and executes it.
    >Most runners are translators or adapters to massively parallel big-data processing systems. Other runners exist for local testing and debugging.

#### Event time
    > The time a data event occurs, determined by the timestamp on the data element itself. 
#### Processed time

#### Windowing
#### Watermarks
#### Trigger

### Dataflow Practice/Demo
#### Ref: https://cloud.google.com/dataflow/docs/quickstarts/quickstart-python
# -------------------------------------------
#Enable Dataflow in a Google Cloud project
#-------------------------------------------
gcloud services list | grep dataflow
gcloud services enable dataflow.googleapis.com
gcloud services enable compute.googleapis.com

#-------------------------------------------
#Create a virtual environment to isolate the dependencies and activate it
#-------------------------------------------
pip3 install virtualenv
python3 -m virtualenv env 
source env/bin/activate

#-------------------------------------------
# Install the Apache Beam SDK in Cloud Shell.
#-------------------------------------------
pip3 install apache-beam[gcp]

#-------------------------------------------
# Set up a Cloud Storage bucket for output data.
#-------------------------------------------
gsutil mb -c standard -l us-central1 -b off gs://$DEVSHELL_PROJECT_ID

#-------------------------------------------
# Run a Beam pipeline in Dataflow as a job.
#-------------------------------------------
python3 -m apache_beam.examples.wordcount --region us-central1 \
    --input gs://dataflow-samples/shakespeare/kinglear.txt \
    --output gs://$DEVSHELL_PROJECT_ID/results/output \
    --runner DataflowRunner \
    --project $DEVSHELL_PROJECT_ID \
    --temp_location gs://$DEVSHELL_PROJECT_ID/temp/


#-------------------------------------------
# Deactivate the virtual environment
#-------------------------------------------
deactivate

#-------------------------------------------
# Clean up to avoid billing charges.
#-------------------------------------------
gsutil rm -r gs://$DEVSHELL_PROJECT_ID
gsutil rb gs://$DEVSHELL_PROJECT_ID
rm -rf env
#-------------------------------------------
#### Monitor Dataflow job.
##### View the output of your job.
![image.png](attachment:image.png)
#### Cloud Storage
![image-4.png](attachment:image-4.png)
#### The temp folder 
##### contains binaries that were created for the job execution.
![image-2.png](attachment:image-2.png)
#### The results folder 
##### contains the count of all the unique words in the input text. Click the file that starts with output, then click Download to read the results.
![image-3.png](attachment:image-3.png)

### Direct local runner vs Cloud-based runner such as Dataflow

#### Direct local runner:


#### Cloud-based runner:




