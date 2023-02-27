*** Settings ***
Library     OperatingSystem
Library     Process


*** Tasks ***
Using unoconv convert Word document into PDF
    #Run    unoconv -f pdf ${CURDIR}${/}example.docx
    ${result}=    Run Process    unoconv --stdout -f pdf ${CURDIR}${/}example.docx
    ...    shell=True
    ...    cwd=${CURDIR}

    Log To Console    RESULT CODE: ${result.rc}
    Create File    ${OUTPUT_DIR}${/}process_stdout.txt    content=${result.stdout}
    Create File    ${OUTPUT_DIR}${/}process_stderr.txt    content=${result.stderr}

    Log    Done.

Using soffice convert Word document into PDF
    # soffice --headless --convert-to pdf example.docx --outdir ./
    ${result}=    Run Process
    ...    soffice --headless --convert-to pdf:writer_pdf_Export --outdir ${OUTPUT_DIR} ${CURDIR}${/}example.docx
    ...    shell=True
    ...    cwd=${CURDIR}

    Log To Console    RESULT CODE: ${result.rc}
    Create File    ${OUTPUT_DIR}${/}process_stdout.txt    content=${result.stdout}
    Create File    ${OUTPUT_DIR}${/}process_stderr.txt    content=${result.stderr}

    Log    Done.
