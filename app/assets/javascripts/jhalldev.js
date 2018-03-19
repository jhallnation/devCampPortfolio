$(document).on('turbolinks:load', function(){
  $('#responsiveness').hide(); 
  $('#maintenance').hide(); 
  $('#quote').hide();
  $('#design_link').addClass("jhalldevlinkactive");

  $('.jhalldevlink').click(function(x){
    if (x.target.innerText.toLowerCase() == "responsiveness"){
      $('#responsiveness').show();
      $('#design').hide();
      $('#maintenance').hide(); 
      $('#quote').hide();

      $('#responsiveness_link').addClass("jhalldevlinkactive");
      $('#maintenance_link').removeClass("jhalldevlinkactive");
      $('#design_link').removeClass("jhalldevlinkactive");
      $('#quote_link').removeClass("jhalldevlinkactive");
    }else if (x.target.innerText.toLowerCase() == "request a quote"){
      $('#quote').show();
      $('#design').hide();
      $('#responsiveness').hide(); 
      $('#maintenance').hide();

      $('#quote_link').addClass("jhalldevlinkactive");
      $('#responsiveness_link').removeClass("jhalldevlinkactive");
      $('#design_link').removeClass("jhalldevlinkactive");
      $('#maintenance_link').removeClass("jhalldevlinkactive");
    }else if(x.target.innerText.toLowerCase() == "maintenance"){
      $('#maintenance').show();
      $('#design').hide();
      $('#responsiveness').hide(); 
      $('#quote').hide();

      $('#maintenance_link').addClass("jhalldevlinkactive");
      $('#responsiveness_link').removeClass("jhalldevlinkactive");
      $('#design_link').removeClass("jhalldevlinkactive");
      $('#quote_link').removeClass("jhalldevlinkactive");
    }else if(x.target.innerText.toLowerCase() == "design"){
      $('#design').show();
      $('#maintenance').hide();
      $('#responsiveness').hide(); 
      $('#quote').hide();

      $('#design_link').addClass("jhalldevlinkactive");
      $('#responsiveness_link').removeClass("jhalldevlinkactive");
      $('#maintenance_link').removeClass("jhalldevlinkactive");
      $('#quote_link').removeClass("jhalldevlinkactive");
    }
  }) 
})