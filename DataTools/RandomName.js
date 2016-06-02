var randomName =
(function() {
	var firstNames = ["John", "Ian", "Juan", "Johannes", "Ivan", "Jean", "Giovanni", "Jon", "Sean", "Hans", "Jan", "Evan", "Hone", "Eoin", "Jens", "Xoan", "Han"];
	var firstnameA = ["Johny", "Tommy", "Jimmy", "Anthony", "Skippy", "Ronny"];
	var firstnameB = ["Mehmet", "Xian", "Ivan", "Vladmir", "Francois", "Giovanni", "Pablo", "Cletus"];

	var surnameA = ["Smith", "Jones", "Williams", "Mammadov", "Aliyev", "Hasanov", "Peeters", "Janssens", "Maes"];
	var surnameB = ["Yamato", "Wong", "Kim", "Quinn", "Giradon", "Sanchez", "Gonzalez", "Guildenstern"];

	var getRandom = function(arr) { var ix = Math.floor(Math.random() * (arr.length)); return arr[ix]; }

	return {
	    generateName: function() {
            var firstname = getRandom(firstnameA) + "-" + getRandom(firstnameB);
            var surname = getRandom(surnameA) + "-FakeClient-" + getRandom(surnameB) ;
            return {
                firstname: firstname,
                surname: surname,
                fullname: firstname + " " + surname                
            };
	    }
	};
})();
