library(tibble, quietly = T, warn.conflicts = F)
library(dplyr, quietly = T, warn.conflicts = F)
library(stringr, quietly = T, warn.conflicts = F)


noclass <-
  as.Date(c("2019-01-21", "2019-02-18", "2019-03-04", "2019-04-22"))


sched_vec <- c(
  as.Date("2019-01-09"),
  seq.Date(
    from = as.Date("2019-01-14"),
    to = as.Date("2019-04-29"),
    by = "week"
  ),
  as.Date("2019-02-19")
) %>%
  .[!(. %in% noclass)] %>%
  sort(.)


sched <-
  tibble(date = sched_vec) %>%
  mutate(session = as.integer(1:nrow(.)))

l01 <- tibble(
  #  title = "Welcome to Massive Data Analytics",
  topics = "Course Overview, Big Data, Cloud Computing",
  #  lab = "Create cloud accounts, create GitHub account, provide account information to Professors",
  lab = "",
  paper = "" ,
  reading = "",
  notes = ""
)

l02 <- tibble(
  #  title = "The Infrastructure of the Cloud",
  topics = "Cloud Computing providers: AWS and Azure, IAAS, PAAS and SAAS, Linux/Command Line review",
  #  lab = "Setup environment, create SSH keys, start and connect to an instance in the cloud",
  lab = "",
  paper = "Jin, Wah, et al. Significance and Challenges of Big Data Research",
  reading = "",
  notes = "**A1 (Python script) released** due Jan-28"
)


l03 <- tibble(
  #  title = "Introduction to Hadoop & MapReduce",
  topics = "Distributed computing, HPC, Hadoop, Distributed filesystems, MapReduce programming model",
  #  lab = "Start and connect to a cluster, Run built-in Hadoop examples on cluster, Examine the different user interfaces",
  lab = "",
  paper = "TBD",
  reading = "Bengfort & Kim: Chapter 2",
  notes = "**A1 (Python script) due today**, **Q1 released** due Feb-11"
)

l04 <- tibble(
  #  title = "Hadoop Streaming",
  topics = "Hadoop Streaming",
  #  lab = "Run the \"Hello World\" of Hadoop, the word count using Hadoop Streaming",
  lab = "",
  paper = "TBD",
  reading = "Bengfort & Kim: Ch. 3",
  notes = "**A2 (Hadoop Streaming) & Q2 released** due Feb-19"
)


l05 <-  tibble(
  #  title = "Database Systems",
  topics = "Overview of scalable database systems, Massively Parallel Processing databases, Neteeza, Greenplum, RedShift",
  paper = "TBD",
  lab = "",
  #     lab = "TBD",
  reading = "",
  notes = "**Q1 due today**, Irina teaches, Marck is out."
)


l06 <- tibble(
  #  title = "Higher Level APIs",
  topics = "SQL Review. Pig and Hive",
  #  lab = "Store a dataset in a Hive table, Run and example Pig job",
  paper = "TBD",
  lab = "",
  reading = "Bengfort & Kim: Ch. 6,8",
  notes = "**A2 (Hadoop Streaming) & Q2 due today**, **A3 (Hive/Pig) & Q3 released** due Mar-11, Marck teaches, Irina is out."
)

l07 <- tibble(
  #  title = "Introduction to Spark",
  topics = "Spark introduction, Resilient Distributed Datasets, PySpark",
  #  lab = "Start a PySpark session, Create RDDs, Operate on RDDs",
  paper = "TBD",
  lab = "",
  reading = "Chambers & Zaharia: Ch. 1-3, 12, 32",
  notes = "**A4 (RDD) released** due Mar-18"
)

l08 <- tibble(
  #  title = "SparkSQL",
  topics = "Spark DataFrames, SparkSQL",
  #  lab = "Perform operations on Spark dataframes using SparkSQL",
  paper = "TBD",
  lab = "",
  reading = "Chambers & Zaharia: Ch. 10",
  notes = "**A3 (Hive/Pig) & Q3 due today**, **Q4 released** due Mar-25"
)

l09 <- tibble(
  #  title = "Machine Learning on Big Data",
  topics = "SparkML, Issues with ML algorithms on large datasets",
  #  lab = "Build a model",
  paper = "TBD",
  lab = "",
  reading = "Chambers & Zaharia: Ch. 24, 25",
  notes = "**A4 (RDD) due today**"
  
)

l10 <- tibble(
  #  title = "Working with Streaming Datasets",
  topics = "Spark Streaming, GraphX API",
  lab = "",
  paper = "TBD",
  reading = "Chambers &  Zaharia: Ch. 20, 21, 30",
  notes = "**A5 & Q5 released** due Apr-8"
  
)

l11 <- tibble(
  #  title = "NoSQL",
  topics = "NoSQL",
  #  lab = "Store data in a NoSQL data store",
  lab = "",
  paper = "",
  reading = "",
  notes = "**Mini project released, due Friday Apr-26**"
  
)

l12 <- tibble(
  #  title = "Working with Graph Datasets",
  topics = "Other topics TBD",
  lab = "",
  paper = "TBD",
  reading = "",
  notes = "**A5 & Q5 due today**"
  
)

l13 <- tibble(
  #  title = "Other tools of interest",
  topics = "Other topics TBD",
  lab = "",
  paper = "TBD",
  reading = "",
  notes = ""
  
)

l14 <-  tibble(
  #  title = "Other tools of interest",
  topics = "Guest speaker. Wrap Up",
  lab = "",
  paper = "TBD",
  reading = "",
  notes = "**Q6 in class closed book**"
  
)

sessions <- paste0("l", str_pad(as.character(1:14), 2, pad = "0"))
sched <- sched %>%
  bind_cols(lapply(sessions, get) %>%  bind_rows())

sched <- 
  
  sched %>%
  mutate(date = format(date, "%a %b-%d")) %>%
  select(session, date, topics, lab, paper, reading, notes)

