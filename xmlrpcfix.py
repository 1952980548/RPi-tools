from xmlrpc.server import SimpleXMLRPCServer as SimpleXMLRPCServerPy35


class SimpleXMLRPCServer(SimpleXMLRPCServerPy35):
    def __enter__(self):
        return self

    def __exit__(self, *args):
        self.server_close()
