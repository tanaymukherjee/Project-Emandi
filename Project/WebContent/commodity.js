
var commodityType = new Array();
commodityType['Select'] = new Array('Please select a State');

commodityType['vegetable'] = new Array(  'Amranth','Arrowroot','Asparagus','Bell Pepper','Bitter Gourd','Bottle Gourd','Cabbage','Carrot','Cauliflower','Chili','Cluster Beans','Colocasia','Coriander Cilantro','Cucumber','Drumstick leaves','Gherkins','Green chilli','Lettuce','Lemon','Maize','Mushrooms','Olives','Onion','Peas','Potato','Pumpkin','Radish','Spinach','Sweet potato','Tomato');

commodityType['cereal'] = new Array('Barley',
                    
                    'Broken Wheat',
                   
                    'Maize',
                    
                    'Pearl Millet',
                   
                    'Rice',
                    
                    'Rice Flakes',
                    
                    'Sago',
                    
                    'Semolina',
                   
                    'Sorghum',
                    
                    'Vermicilli',
                   
                    'Wheat',
                   
                    'Pigeon Peas',
                    
                    'Split Chick Peas',
                   
                    'Black Gram',
                    
                    'White Chick Peas',
                    
                    'Split Green Gram');

commodityType['fruit'] = new Array('Apple',
                    
                    'Apricot',
                   
                    'Banana',
                   
                    'Black Berry',
                    
                    'Chickoo',
                    
                    'Custard apple',
                    
                    'Dates',
                    
                    'Figs',
                   
                    'Grapes',
                   
                    'Guavas',
                    
                    'Jackfruit',
                    
                    'Mango',
                    
                    'Orange',
                   
                    'Pappaya',
                    
                    'Pear',
                    
                    'Plum',
                    
                    'Pineapple',
                   
                    'Watermelon');

function setType() {
  ros = document.getElementById('commodity');
  commodityList = commodityType[ros.value];
  changeSelect('type', commodityList, commodityList);
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
  setType();
});
