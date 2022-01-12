function checkName(){
    n=document.getElementById('name');
    value=n.value;
    console.log(value);
    if(value=='')
    {
        console.log("Name cannot be empty ")
    }
    let pattern=/[^a-z A-Z]/g;
    result=value.match(pattern);
    if(result){
        console.log("only letters are allowed");
    }
    }

    function checkDOB() {

        d= document.getElementById('dob');
      
        d.classList.remove("is-invalid");
      
        value = d.value;
      
        console.log(value);
      
        if (value == "") {
      
          console.log("DOB is a mandatory field");
      
        }
      
        let today=new Date();
      
        let compDay=new Date(value);
      
        console.log(today);
      
        if (today<=compDay) {
      
    d.classList.add("is-invalid");
      
        }
    }
