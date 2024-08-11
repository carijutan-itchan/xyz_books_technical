import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  initialize(){
    this.validatedIsbnNumber = 0
    this.searcValue = ''
    this.error_message = ''
  }

  searchBookNumber(event){
    this.showLoader()

    const searcValue = event.target.value
    const is_valid = this.validateBookNumber(searcValue)

    if(searcValue == ''){
      this.showIndex()

      return NaN;
    }

    if(is_valid){
      this.search_value = searcValue
      const validatedSearchNumberArr = this.validatedIsbnNumber.split("")
      const isbn_number = this.calculate_book_number(validatedSearchNumberArr)

      this.showIsbnDetails(isbn_number)
    } else {
      this.showErrorDetails()
    }
  }

  validateBookNumber(value){
    const new_search_value = value.replace(/-/g, "");

    if((new_search_value.trim().length < 10) || (new_search_value.trim().length > 13 )){
      this.error_message = 'Invalid ISBN, please try another book number'
      return false;
    }

    this.validatedIsbnNumber = new_search_value

    return true;
  }


  calculate_book_number(validatedSearchNumberArr){
    if(validatedSearchNumberArr.length == 13){
      return this.convertToIsbn10(validatedSearchNumberArr)
    } else {
      return this.convertToIsbn13(validatedSearchNumberArr)
    }
  }

  convertToIsbn10(validatedNumber){
    const product = []
  
    // remove first three digits
    const remainingTenNumbers = validatedNumber.slice(3);

    // remove the last digits, no find the check_digit (because check digit is the 10th number of the ISBN)
    const remainingNineNumbers = remainingTenNumbers.slice(0, -1);

    remainingNineNumbers.forEach((number, index) => {
      const multiplier  = (10 - index)
      
      product.push(Number(number) * multiplier)
    });

    const sum = product.reduce((accumulator, currentValue) => {
      return accumulator + currentValue
    },0);

    const checkDigit = 11 - (sum % 11)

    remainingTenNumbers[9] = checkDigit == 10 ? 'X' : checkDigit

    return remainingTenNumbers.join("")
  }

  convertToIsbn13(validatedNumber){
    const product = []
    const prefix_number = [9, 7, 8]

    const remainingNineNumbers = validatedNumber.slice(0, -1);

    let concated_numbers = prefix_number.concat(remainingNineNumbers)

    concated_numbers.forEach((number, index) => {
      if((index +1) % 2 == 0) {
        product.push(Number(number) * 3)
      }else {
        product.push(Number(number) * 1)
      }
    });

    const sum = product.reduce((accumulator, currentValue) => {
      return accumulator + currentValue
    },0);

    const checkDigit = 10 - (sum % 10)
    concated_numbers[13] = checkDigit

    return concated_numbers.join("")
  }

  showErrorDetails(){
    setTimeout(() => {
      get('/error?' + new URLSearchParams({ message: this.error_message}).toString(), { responseKind: "turbo-stream" })
    }, "100");
  }

  showLoader(){
    get(`/loader`, { responseKind: "turbo-stream" })
  }

  showIndex(){
    setTimeout(() => {
      get(`/`, { responseKind: "turbo-stream" })
    }, "100");
  }

  showIsbnDetails(number){
    setTimeout(() => {
      get(`/books/${number}?` + new URLSearchParams({ search_value: this.searcValue}).toString(), { responseKind: "turbo-stream" })
    }, "100");
  }
}