//Скрипт для выбора услуг на основе мастера

const inputSelectMaster = document.getElementById('sel1');

inputSelectMaster.addEventListener('change', event => {

    const masterId = event.target.value

    let url = '/Home/GetServises/?masterId=' + masterId;

    fetch(url)
        .then(response => response.json())
        .then(data => {
            let options = '<option>Выберите услугу</option>'

            for (let service of data) {
                options += `<option value='${service.id}'>${service.name_of_service}</option>`
            }

            let inputSelectServise = document.getElementById('sel2');
            inputSelectServise.innerHTML = options
        })
})