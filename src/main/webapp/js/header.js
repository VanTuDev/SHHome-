$(document).ready(function() {
  function populateDropdown($dropdown, data, valueKey, textKey) {
    console.log(data)
    $dropdown.empty();
    $dropdown.append($('<option>').val('').text('Select an option'));

    $.each(data, function(key, value) {
      $dropdown.append($('<option>').val(value[valueKey]).text(value[textKey]));
    });
  }

  // Function to load data using AJAX and populate a dropdown
  function loadDataAndPopulateDropdown($dropdown, action, data = {}, valueKey, textKey) {
    $.ajax({
      type: 'GET',
      url: '${pageContext.request.contextPath}/addressServlet',
      data: { action: action, ...data },
      success: function(response) {
        populateDropdown($dropdown, response, valueKey, textKey);
      },
      error: function(xhr, status, error) {
      }
    });
  }

  // Load provinces when the page loads
  loadDataAndPopulateDropdown($('#province'), 'getProvinces', {}, 'provinceCode', 'provinceName');

  $('#province').on('change', function() {
    var selectedProvinceCode = $(this).val();
    if (selectedProvinceCode) {
      loadDataAndPopulateDropdown($('#district'), 'getDistricts', { provinceCode: selectedProvinceCode }, 'districtCode', 'districtName');
    } else {
      $('#district').empty();
      $('#ward').empty();
    }
  });

  $('#district').on('change', function() {
    var selectedDistrictCode = $(this).val();
    if (selectedDistrictCode) {
      loadDataAndPopulateDropdown($('#ward'), 'getWards', { districtCode: selectedDistrictCode }, 'wardsCode', 'wardsName');
      $('#wardsCode').val(selectedWardsCode);
    } else {
      $('#ward').empty();
    }
  });




});
// Js input datePicker
document.addEventListener("DOMContentLoaded", function () {
  var fromInput = document.getElementById("input_from");
  var toInput = document.getElementById("input_to");

  var viOptions = {
    format: 'DD/MM/YYYY', // Định dạng ngày tháng Việt Nam
    i18n: {
      previousMonth: 'Tháng trước',
      nextMonth: 'Tháng sau',
      months: ['Tháng 1',
               'Tháng 2',
               'Tháng 3',
               'Tháng 4',
               'Tháng 5',
               'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
      weekdays: ['Chủ Nhật', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7'],
      weekdaysShort: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7']
    }
  };

  var fromPicker = new Pikaday(Object.assign({
    field: fromInput,
    yearRange: [moment().year(), moment().year() + 10],
    minDate: new Date(),
    maxDate: moment().add(10, 'years').toDate()
  }, viOptions));

  var toPicker = new Pikaday(Object.assign({
    field: toInput,
    yearRange: [moment().year(), moment().year() + 10],
    minDate: new Date(),
    maxDate: moment().add(10, 'years').toDate()
  }, viOptions));
});


