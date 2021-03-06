#################################################################
# Dashboard sidebar
#################################################################

gse.input = div(style = "display:inline-block; width: 75%",
            selectizeInput('GSE', label = "Accession Number", 
		choices = NULL, width = 275,
              options = list(placeholder = "Please enter a GSE #",
                          maxOptions = 100)
            )
)

gse.button = div(style = "display:inline-block; width: 11%",
                actionButton("submitButton", "Submit", disabled = "disabled")
)

gse.platform=  conditionalPanel(condition = "output.sidebarDisplay=='PLATFORM'|output.sidebarDisplay=='ALL'",

                  div(style = "display:inline-block; width: 75%",
                        selectizeInput('platform', label = "Platform", choices = NULL, width = 275,
                                options = list(placeholder = "Please select a platform",
                                maxOptions = 10)
                        )
                  )
)

sidebar = dashboardSidebar(width = 320,
  includeCSS('www/ecsu.css'),
  includeScript('www/ecsu.js'),
	gse.input, gse.button, gse.platform,
	conditionalPanel(condition = "output.sidebarDisplay=='ALL'",
	sidebarMenu(id = "tabs",
		hr(),
    menuItem("Home / Change Dataset", tabName = "Home", icon = icon("home")),
		menuItem("Differential Expression Analysis", tabName = "DifferentialExpressionAnalysis", icon = icon("flask")),
		menuItem("Survival Analysis", tabName = "SurvivalAnalysis", icon = icon("life-ring")),
		menuItem("Sample Data Table", tabName = "FullDataTable", icon = icon("table")),
		#menuItem("Clinical Data Summary", tabName = "ClinicalDataSummary", icon = icon("table")),
		menuItem("Code", tabName = "Code", icon = icon("code")),
		menuItem("About", tabName = "About", icon = icon("info-circle"))
	     )
      )
)

