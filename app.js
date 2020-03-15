const startInput = document.getElementById('start-date')
const endInput = document.getElementById('end-date')
const submitBtn = document.getElementById('submit-btn')
const downloadBtn = document.getElementById('download-btn')

function post(url, requestuestBody) {
  return new Promise(function (succeed, fail) {
    const request = new XMLHttpRequest()
    request.open("POST", url, true)
    request.setRequestHeader('Content-Type', 'application/json') // 'application/json; charset=utf-8'
    request.addEventListener("load", function () {
      if (request.status < 400)
        succeed(request.responseText)
      else
        fail(new Error("Request failed: " + request.statusText))
    })
    request.addEventListener("error", function () {
      fail(new Error("Network error"))
    })
    request.send(requestuestBody)
  })
}
function clearErrors() {
  const errorBlocks = document.querySelectorAll('.error')
  errorBlocks.forEach(b => b.parentNode.removeChild(b))
}

submitBtn.addEventListener('click', (e) => {
  e.preventDefault()
  const errorBlock = document.createElement('div')
  errorBlock.classList.add('error')
  errorBlock.style.color = 'red'
  if (startInput.value !== '' && endInput.value !== '') {
    const startDate = new Date(...startInput.value.split('-'))
    const endDate = new Date(...endInput.value.split('-'))
    if (startDate <= endDate)
      post('./app/form.php', JSON.stringify({start: startInput.value, end: endInput.value}))
        .then(data => {
          downloadBtn.href = 'app/' + data
          downloadBtn.click()
        })
    else {
      clearErrors()
      errorBlock.innerText = 'Дата начала периода должна быть раньше или равна дате окончания периода'
      document.body.append(errorBlock)
    }
  } else {
    clearErrors()
    errorBlock.innerText = 'Заполните поля начала и окончания периода'
    document.body.append(errorBlock)
  }
})

startInput.addEventListener('change', clearErrors)
endInput.addEventListener('change', clearErrors)