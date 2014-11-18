
var app = require('http').createServer(handler)
  , io = require('socket.io').listen(app)
  , fs = require('fs')

io.set('origins','*lindneo.com*:*');
//io.set('heartbeat timeout', 200000);
//io.set('heartbeat interval', 20000);

function get_random_color() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.round(Math.random() * 15)];
    }
    return color;
}

app.listen(1881);

function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
       res.writeHead(500);
      return res.end('Error loading index.html');
    }

    res.writeHead(200);
    res.end(data);
  });
}


function userList(pageId){
  
  console.log(users);
   var newUserList={};
    for (var prop in users)
    { 
      if (users[prop].pageid==pageId){
        newUserList[prop]=users[prop];
      }
    }
    console.log(newUserList);
    return newUserList;

}

function bookUserList(bookId){
  
  console.log(users);
   var newBookUserList={};
    for (var prop in users)
    { 
      if (users[prop].bookid==bookId){
        newBookUserList[prop]=users[prop];
      }
    }
    console.log(newBookUserList);
    return newBookUserList;

}


function ChatSend(line,socket){
    var  response={
      line:line,
      user: users[socket.id]
    };
    console.log(users[socket.id].name +": "+line);
    io.sockets.in(users[socket.id].bookid ).emit('chatBroadcast', response);
}

function makeItSelected(componentId,socket){
  var  select_item={
      componentId:componentId,
      user: users[socket.id]
    };
    
    
    socket.broadcast.to(users[socket.id].pageid ).emit('emitSelectedComponent', select_item);
}

var users=[];

io.sockets.on('connection', function (socket) {

  socket.on('changePage', function (data) {
    if(users[socket.id])  { 
           socket.leave(users[socket.id].pageid );      
           socket.leave(users[socket.id].bookid );      
    }
    if(data){
      data.color=get_random_color();
      users[socket.id]=data;
      socket.join(data.pageid);
      socket.join(data.bookid);
        
        
      var newUserList=userList(data.pageid);
     
      io.sockets.in( users[socket.id].pageid ).emit('userListUpdate',newUserList);
      var newBookUserList=bookUserList(users[socket.id].bookid);
      io.sockets.in( users[socket.id].bookid ).emit('userBookListUpdate',newBookUserList);
    }

  });

  socket.on('newComponent', function (component) {
    console.log('page_id:'+users[socket.id].pageid);
    socket.broadcast.to( users[socket.id].pageid ).emit('newComponent', component);


    socket.broadcast.to( users[socket.id].bookid ).emit('pagePreviewUpdate', users[socket.id].pageid );

  });
 
  socket.on('updateComponent', function (component) {
    console.log('page_id:'+users[socket.id].pageid);
    socket.broadcast.to( users[socket.id].pageid ).emit('updateComponent', component);
    socket.broadcast.to( users[socket.id].bookid ).emit('pagePreviewUpdate', users[socket.id].pageid );
     makeItSelected(component.id,socket);

  });


  socket.on('destroyComponent', function (componentId) {
    console.log('page_id:'+users[socket.id].pageid);
    socket.broadcast.to( users[socket.id].pageid ).emit('destroyComponent', componentId);
    socket.broadcast.to( users[socket.id].bookid ).emit('pagePreviewUpdate', users[socket.id].pageid );

  });

	socket.on('emitSelectedComponent', function (componentId) {
    makeItSelected(componentId,socket);

	});

  socket.on('chatBroadcast', function (line) {
    ChatSend(line,socket);
  });

  socket.on('disconnect', function() {
    console.log('disconnect');
    
      if(users[socket.id])  { 
        var pageid = users[socket.id].pageid;
        var bookid = users[socket.id].bookid;
        delete users[socket.id];
        var newUserList=userList(pageid);
        var newBookUserList=bookUserList(bookid);        
        io.sockets.in( pageid ).emit('userListUpdate',newUserList);
        io.sockets.in( bookid ).emit('userBookListUpdate',newBookUserList);
         
      }
  });


});
  
