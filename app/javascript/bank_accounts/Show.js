let Show = ( () =>  {
        let $btnNewTransaction;
        let $modalTransaction;
        let $btnSave;
        let $inputAmount;
        let $selectTransactionType;
        let $parameters;
        let $bankAccountId;
        let $notification;

        const url = "/api/v1/bank_accounts/new_transaction";

        const fetchElements = () =>{

            $btnNewTransaction = document.getElementById('btn-new-transaction');
            $modalTransaction = document.getElementById('modal-transaction');
            $btnSave = document.getElementById('btn-save');
            $inputAmount = document.getElementById('input-amount');
            $selectTransactionType = document.getElementById('select-transaction-type');
            $parameters = document.getElementById('parameters');
            $bankAccountId = $parameters.dataset.bankAccountId;
            $notification =  $('.notification');
        };

        const disableControls = () => {
            $btnSave.disabled = true;
            $inputAmount.disabled = true;;
            $selectTransactionType.disabled = true;;
        }

        const enableControls = () => {
            $btnSave.disabled = false;
            $inputAmount.disabled = false;
            $selectTransactionType.disabled = false;
        }
      

        const initializeEvents = () => {

            $btnNewTransaction.addEventListener('click', () => {
                if ($modalTransaction.classList.contains('fade')) { 
                    $modalTransaction.classList.remove('fade');
                    $modalTransaction.style.display = "block";
                }

            }); 

            $btnSave.addEventListener('click', () =>{

            const amount = $inputAmount.value;
            const transaction = $selectTransactionType.value;

               disableControls();

               console.log(`Amount: ${amount} Transaction Type: ${transaction} Bank Account: ${$bankAccountId}`)

               $notification.html('');

               $.ajax({
                   url: url,
                   method: 'POST',
                   dataType: 'json',
                   data: {
                       amount: amount,
                       transaction_type: transaction,
                       bank_account_id: $bankAccountId
                   }, success: () => {
                       window.location.href = `/bank_accounts/${bankAccountId}`;
                   },
                   error: () => {
                       $notification.html(JSON.parse(response.responseText).errors.join());
                   }
               });
            });
        };
    
        var init = () => {
            fetchElements();
            initializeEvents();
        };
        
        return {
            init: init
        };
    }

)();

document.addEventListener('turbolinks:load', Show.init);