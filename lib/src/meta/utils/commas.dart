library add_comma;

typedef NoFormat = String Function(num value);

/// To add a separator to the value provided
/// use the [separator] parameter to set the separator you wish to use.
NoFormat addCommas({
  String placeholder = '',

  /// Separator is what appears after every 3 digits
  String separator = ',',
}) =>
    (num value) {
      int length = value.toString().length;

      ///generates a list of the numbers as strings from value
      List arr = value.toString().split('');

      String finished = '';

      /// finished number with separators is got iterating through value from the end
      /// to the first and concatenating the separator every after 3 digits.

      for (int i = 1; i <= length; i++) {
        /// this IF helps identify if 3 digits have been concatenated.
        /// if so, a comma(or chosen separator) is added before concatenating the 4th digit.
        /// if not, then keep concatenating another digit for every iteration.
        if ((i - 1) % 3 == 0) {
          ///we use modulus to check if the current position is a multiple of 3
          ///that is every after 3 digits.

          if ((length - i) == length - 1) {
            finished = (arr[length - i]) + finished;
          } else {
            finished = (arr[length - i]) + separator + finished;
          }
        } else {
          finished = (arr[length - i]) + finished;
        }
      }

      return finished;
    };

///Using the Indian number system
NoFormat addCommasIndian({
  String placeholder = '',

  /// Separator is what appears after every 3 digits
  String separator = ',',
}) =>
    (num value) {
      int length = value.toString().length;

      ///generates a list of the numbers as strings from value
      List arr = value.toString().split('');

      String finished = '';

      /// finished number with separators is got iterating through value from the end
      /// to the first and concatenating the separator every after 3 digits.

      for (int i = 1; i <= length; i++) {
        ///To check if we are still dealing with thousands
        ///else we procced to lakhs and then crores.
        if (i < 5) {
          /// this IF helps identify if 3 digits have been concatenated.
          /// if so, a comma(or chosen separator) is added before concatenating the 4th digit.
          /// if not, then keep concatenating another digit for every iteration.
          if ((i - 1) % 3 == 0) {
            ///we use modulus to check if the current position is a multiple of 3
            ///that is every after 3 digits.

            if ((length - i) == length - 1) {
              finished = (arr[length - i]) + finished;
            } else {
              finished = (arr[length - i]) + separator + finished;
            }
          } else {
            finished = (arr[length - i]) + finished;
          }
        } else {
          //to start dealing with lakhs
          if ((i) % 2 == 0) {
            if ((length - i) == length - 1) {
              finished = (arr[length - i]) + finished;
            } else {
              finished = (arr[length - i]) + separator + finished;
            }
          } else {
            finished = (arr[length - i]) + finished;
          }
        }
      }

      return finished;
    };
