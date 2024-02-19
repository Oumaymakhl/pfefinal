function getCSRFToken() {
    const cookie = document.cookie.split(';').find(cookie => cookie.trim().startsWith('CSRF-TOKEN='));
    if (cookie) {
        return cookie.split('=')[1];
    }
    return null;
}

const csrfToken = getCSRFToken();
console.log(csrfToken);
