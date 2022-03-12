*** Settings ***
Documentation     A bot created to automate daily reporting of virus spreading
...               creates and records daily reports
...               creates db that stores and sends scraped data
Library           RPA.Browser.Selenium    auto_close=${FALSE}
Library           RPA.HTTP
Library           html_tables.py
Library           db_create.py
Library           RPA.Database
Library           RPA.Excel.Files
Library           RPA.Excel.Application
Library           RPA.Desktop.Windows

*** Variables ***
${filename1}      countries.xlsx
${filename2}      american_states.xlsx

*** Tasks ***
Read HTML table as Table_1
    ${html_table1}=    Get HTML tables
    ${table1}=    Read Table From Html    ${html_table1}
    FOR    ${row}    IN    @{table1}
        Log To Console    ${row}
    END

Read HTML table as Table_2
    ${html_table2}=    Get HTML tables
    ${table2}=    Read Table From Html    ${html_table2}
    FOR    ${row}    IN    @{table2}
        Log To Console    ${row}
    END
    #Collect usa data by state
    #Scrape individual state data
    #Save state data
    #Create powerpoint report
    #Navigate to state specific pages
    #Take graph screenshots
    #Create powerpoint for top 10 states
    #Send db to chief officer

*** Keywords ***
Get HTML tables
    Open Available Browser
    ...    https://www.worldometers.info/coronavirus/
    ${html_table1}=    Get Element Attribute    css:table#main_table_countries_today    outerHTML
    [Return]    ${html_table1}

Go to USA page
    Open Available Browser
    ...    https://www.worldometers.info/coronavirus/country/us/
    ${html_table2}=    Get Element Attribute    css:table#usa_table_countries_today    outerHTML
    [Return]    ${html_table2}
