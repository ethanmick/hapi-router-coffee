module.exports.myRoute = {
  path: '/test4',
  method: 'GET',
  handler: function (request, reply) {
    reply({aRoute: 'ok'});
  }
}

