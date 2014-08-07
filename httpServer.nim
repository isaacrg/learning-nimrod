# Basic HTTP Server, as via http://nimrod-lang.org/httpserver.html

import strutils, sockets, httpserver

var counter = 0
proc handleRequest(client, path, query): bool {.procvar.} =
  inc(counter)
  client.send("Hello for the $#th time. Your Path is:" % $counter & path & wwwNL)
  echo("Request Made: " & path & "")
  return false # do not stop processing

run(handleRequest, TPort(8080))
