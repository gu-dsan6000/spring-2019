library(tibble, quietly = T,warn.conflicts = F)
library(dplyr, quietly = T,warn.conflicts = F)
library(stringr, quietly = T, warn.conflicts = F)


noclass <- as.Date(c("2018-01-21", "2018-02-18", "2018-03-04", "2018-04-22"))
sched <- 
  tibble(date = c(as.Date("2018-01-09"),
                  seq.Date(from = as.Date("2018-01-14"), 
                           to = as.Date("2018-04-29"),
                           by = "week"))) %>%
  filter(!date %in% noclass) %>%
  mutate(session = as.integer(1:nrow(.)))

l01 <- tibble(
#  title = "Welcome to Massive Data Analytics",
  topics = "Course Overview, Big Data, Cloud Computing",
  lab = "Create cloud accounts, create GitHub account, provide account information to Professors",
  paper = "",
  reading = "",
  notes = "")

l02 <- tibble(
#  title = "The Infrastructure of the Cloud",
  topics = "Cloud Computing providers: AWS and Azure, IAAS, PAAS and SAAS, Linux/Command Line review",
  lab = "Setup environment, create SSH keys, start and connect to an instance in the cloud",
  paper = "paper 1",
  reading = "",
  notes = "A1 released (Python script) - due xxxx"
)


l03 <- tibble(
#  title = "Introduction to Hadoop & MapReduce",
  topics = "Distributed computing, HPC, Hadoop, Distributed filesystems, MapReduce programming model",
  lab = "Start and connect to a cluster, Run built-in Hadoop examples on cluster, Examine the different user interfaces",
  paper = "",
  reading = "Bengfort & Kim: Chapter 2",
  notes = ""
)

l04 <- tibble(
#  title = "Hadoop Streaming",
  topics = "Hadoop Streaming",
  lab = "Run the \"Hello World\" of Hadoop, the word count using Hadoop Streaming",
  paper = "",
  reading = "Bengfort & Kim: Ch. 3",
  notes = "A2 released (Hadoop Streaming) - due xxxx"
)


l05 <-  tibble(
#  title = "Database Systems",
  topics = "Overview of scalable database systems, Massively Parallel Processing databases, Neteeza, Greenplum, RedShift",
  paper = "",
     lab = "TBD",
  reading = "",
  notes = "")


l06 <- tibble(
#  title = "Higher Level APIs",
  topics = "Pig and Hive",
  lab = "Store a dataset in a Hive table, Run and example Pig job",
  paper = "",
  reading = "Bengfort & Kim: Ch. 6,8",
  notes = "A3 released (Hive/Pig) - due xxxx"
)

l07 <- tibble(
#  title = "Introduction to Spark",
  topics = "Spark introduction, Resilient Distributed Datasets, PySpark",
  lab = "Start a PySpark session, Create RDDs, Operate on RDDs",
  paper = "",
      reading = "Chambers & Zaharia: Ch. 1-3, 12, 32",
  notes = "A4 released (RDD) - due xxxx"
)

l08 <- tibble(
#  title = "SparkSQL",
  topics = "SQL Review, Intro to SparkSQL",
  lab = "Perform operations on Spark dataframes using SparkSQL",
  paper = "",
    reading = "Chambers & Zaharia: Ch. 10",
  notes = ""
)

l09 <- tibble(
#  title = "Machine Learning on Big Data",
  topics = "SparkML, Issues with ML algorithms on large datasets",
  lab = "Build a model",
  paper = "",
    reading = "Chambers & Zaharia: Ch. 24, 25",
  notes = ""
  
)

l10 <- tibble(
#  title = "Working with Streaming Datasets",
  topics = "Spark Streaming",
  lab = "TBD",
  paper = "",
    reading = "Chambers &  Zaharia: Ch. 20, 21",
  notes = ""
  
)

l11 <- tibble(
#  title = "NoSQL",
  topics = "NoSQL",
  lab = "Store data in a NoSQL data store",
  paper = "",
      reading = "",
  notes = ""
  
)

l12 <- tibble(
#  title = "Working with Graph Datasets",
  topics = "GraphX API for Spark",
  lab = "Analyze a large graph",
  paper = "",
  
    reading = "Chambers & Zaharia: Ch. 30",
  notes = ""
  
)

l13 <- tibble(
#  title = "Other tools of interest",
  topics = "Apache Drill, other topics TBD",
  lab = "",
  paper = "",
  
    reading = "",
  notes = ""
  
)

sessions <- paste0("l", str_pad(as.character(1:13), 2, pad = "0"))
sched <- sched %>%
  bind_cols(lapply(sessions, get) %>%  bind_rows()) 

sched %>%
  mutate(date = format(date, "%b %d")) %>%
  select(session, date, topics, lab, paper, reading, notes) %>%
  knitr:::kable(., "markdown",
                col.names = c("Class", "Date", "Topics", "Paper",
                              "Lab", "Reading", "Notes")
  )

