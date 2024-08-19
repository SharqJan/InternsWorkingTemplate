
$(document).ready(function () {
    GetEmployeeList();
    $('#formAddEmployee').submit(function (e) {
        e.preventDefault();
        AddEmployee();

    });
    $('#btn1').click(function () {
        GetEmployeeById();
    });
});





function AddEmployee() {
    try {
        $.ajax({
            method: 'POST',
            url: '/Employee/AddEmployee',
            data: $('#formAddEmployee').serialize(),
            success: function (response) {
                swal({
                    title: "Added Successfully!",
                    text: response.toString(),
                    icon: "success"
                }); 
                GetEmployeeList();
            }
        });
    }
    catch (e) {
        console.log(e);
    }
    
}



function GetEmployeeById() {

    const jsonData = { empIdentityCode: $('#txt1').val() };
    try {
        $.ajax({
            method: 'GET',
            url: '/Employee/GetEmployeeById',
            data: jsonData,
            success: function (response) {

                var id = response.employeeId;
                var name = response.name;

                swal(id + " ----------- " + name);

            }
        });
    }
    catch (e) {
        console.log(e);
    }

}

function GetEmployeeList() {
    try {
        $.ajax({
            method: 'GET',
            url: '/Employee/GetEmployeeList',
            data: null,
            success: function (response) {
                var result = '';
                window.$(response).each(function (i, item) {
                    result += ` <tr class="even">
                                        <td class="table-user">
                                            ${item.employeeId}
                                        </td>
                                        <td>
                                            ${item.name}
                                        </td>
                                        <td>
                                            ${item.phoneNumber}
                                        </td>
                                        <td>
                                           ${item.description}
                                        </td>
                                         <td>
                                           ${item.email}
                                        </td>
                                           <td>
                                           ${item.address}
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);" class="action-icon"> <i class="mdi mdi-square-edit-outline"></i></a>
                                            <a href="javascript:void(0);" onclick="DeleteEmployee(${item.employeeId})" class="action-icon"> <i class="mdi mdi-delete"></i></a>
                                        </td>
                                    </tr>`;
                });
                $('#employeeTableBody').empty().append(result);

            }
        });
    }
    catch (e) {
        console.log(e);
    }
   
}

function DeleteEmployee(employeeId) {
    swal({
        title: "Are you sure?",
        text: "You want to delete this file?",
        icon: "warning",
        buttons: ["Cancel", "Yes"]
    }).then(async function (isConfirm) {
        if (isConfirm) {
            try {
                $.ajax({
                    method: 'POST',
                    url: '/Employee/DeleteEmployeeById',
                    data: { employeeId: employeeId },
                    success: function (response) {
                        swal({
                            title: "Deleted Successfully!",
                            text: "id : " + response,
                            icon: "success"
                        }); 
                        GetEmployeeList();
                    }
                });
            }
            catch (e) {
                console.log(e);
            }
        }
    });



}


