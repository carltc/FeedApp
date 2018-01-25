function highlight(tableRow, active) {
    if (active) {
        tableRow.style.backgroundColor = '#cfc';
    }
    else {
        tableRow.style.backgroundColor = '#fff';
    }
}

function expandRow(tableRow) {
    tableRow.style.backgroundColor = '#cfc';
}

function link(Url) {
    document.location.href = Url;
}