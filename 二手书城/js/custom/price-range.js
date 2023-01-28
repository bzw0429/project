$((function () {
  $("#slider-range").slider({
    range: !0,
    min: 0,
    max: 500,
    values: [75, 300],
    slide: function (c, b) {
      $("#amount").val("$" + b.values[0] + " - $" + b.values[1])
    }
  }), $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1))
}));