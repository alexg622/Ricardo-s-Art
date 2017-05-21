var options = [
	{selector: '#scrollIt', offset: 100, callback: function(el) {
        Materialize.fadeInImage($(el));
      } }
    ];
Materialize.scrollFire(options);

 