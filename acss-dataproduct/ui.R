shinyUI(fluidPage(
  titlePanel("Evaluate Algorithmic Complexity of Short Strings"),
  
  sidebarLayout(
    sidebarPanel(strong("Evaluated strings"), br(), tags$textarea(id="string", label="test", rows=3, cols=40, "GATTGCA GCTAATT AAAAAAA CGCGCGC"),
                 radioButtons("alphabet", label = "Alphabet size (number of possible symbols)", inline = TRUE,
                              choices = list("2" = 2, "4" = 4, "5" = 5, "6" = 6, "9" = 9), selected = 4),
                 selectInput("funct", label = "Select the function used to evaluate the strings",
                             choices = list("ACSS - Kolmogorov Complexity estimated by CTM (K) and Algorithmic Probability (D)" = "acss",
                                            "Likelihood in Turing machine distribution" = "likelihood_d",
                                            "Likelihood ratio in Turing machine distribution" = "likelihood_ratio",
                                            "Probability of random appearance" = "prob_random"
                             ), selected = "acss"),
                 actionButton("action", label = "Get output")
    ),
    mainPanel(
      h3("Evaluation Result:"),
      tableOutput("text1")
    )
    
  )
  
))