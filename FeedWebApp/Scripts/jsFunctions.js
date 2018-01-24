function highlight(tableRow, active) {
    if (active) {
        tableRow.style.backgroundColor = '#cfc';
    }
    else {
        tableRow.style.backgroundColor = '#fff';
    }
}

function link(Url) {
    document.location.href = Url;
}