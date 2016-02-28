$.getScript('/assets/application.js',function(){
  // calls for the ready function (first loading)
  $(document).ready(ready);
  // (secondary loadings)
  $(document).on('page:load',ready);
});
