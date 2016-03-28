shinyUI(fluidPage(
  titlePanel("Evaluate Algorithmic Complexity of Short Strings"),
  
  sidebarLayout(
    sidebarPanel(strong("Strings to evaluate"), br(), p("Strings must be of length < 12. They must be separated by blank spaces."), tags$textarea(id="string", label="test", rows=3, cols=40, "AAAAAAAAAA ATATATATAT ATGCCGGCCT"),
                 radioButtons("alphabet", label = "Alphabet size (number of possible symbols)", inline = TRUE,
                              choices = list("2" = 2, "4" = 4, "5" = 5, "6" = 6, "9" = 9), selected = 4),
                 selectInput("funct", label = "Functions used to evaluate the strings",
                             choices = list("ACSS - Kolmogorov Complexity estimated by CTM (K) and Algorithmic Probability (D)" = "acss"
                 #             "Likelihood in Turing machine distribution" = "likelihood_d"
                 #                            ,"Likelihood ratio in Turing machine distribution" = "likelihood_ratio",
                 #                            "Probability of random appearance" = "prob_random"
                              ), selected = "acss"),
                 actionButton("action", label = "Evaluate strings")
    ),
    mainPanel(
      h3("Evaluation Result:"),
      tableOutput("text1"),
      p("K.alphabetSize indicates the estimated Kolmogorov complexity for the string."), 
      p("D.alphabetSize indicates the estimated algorithmic probability, which is the output frequency of the string by small Turing Machines with the same alphabet size."),
      p("K.alphabetSize = -log2(D.alphabetSize)")
    )
    
  )
  
))