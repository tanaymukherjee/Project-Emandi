/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */






var cities1 = new Array();


cities1['Indore'] = new Array('Select','Krishi Mandi','Bhawarkuan Square','Bengali Square','VijayNagar');

cities1['Bhopal'] = new Array('Select','Jail Road','Baigargarh');


cities1['Gwalior'] = new Array('Itanagar');

cities1['Sagar'] = new Array('Chandigarh');








function setCities3() {
  stateSel = document.getElementById('City');
  cityList = cities1[stateSel.value];
  changeSelect('mandi', cityList, cityList);
}

function changeSelect(fieldID, newOptions, newValues) {
  selectField = document.getElementById(fieldID);
  selectField.options.length = 0;
  for (i=0; i<newOptions.length; i++) {
    selectField.options[selectField.length] = new Option(newOptions[i], newValues[i]);
  }
}




function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  setStates();
});
