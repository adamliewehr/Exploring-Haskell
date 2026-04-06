

data CustomerInfo = CustomerInfo String String Int Int

customerGeorge :: CustomerInfo
customerGeorge = 
    CustomerInfo "Georgie" "Bird" 10 100

-- we can access this data using pattern matching

showCustomer :: CustomerInfo -> String
showCustomer (CustomerInfo first last count balance) = 
    let fullName = first <> " " <> last
        name = "name: " <> fullName
        count' = "count: " <> (show balance)
        balance' = "balance: " <> (show balance)
    in name <> " " <> count' <> " " <> balance'


-- we can also match values in specific fields
-- this is a function that applies a discount for customers based on their first and last name

applyDiscount :: CustomerInfo -> CustomerInfo
applyDiscount customer = 
    case customer of
        (CustomerInfo "Georgie" "Bird" count balance) ->
            CustomerInfo "Georgie" "Bird" count (balance `div` 4)
        (CustomerInfo "Porter" "Pupper" count balance) ->
            CustomerInfo "Porter" "Pupper" count (balance `div` 2)
        otherCustomer -> otherCustomer 
