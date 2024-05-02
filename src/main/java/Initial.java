import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.ResourceHandler;

import javax.websocket.DeploymentException;

public class Initial {

    public static void main(String[] args) throws Exception{
        int httpPort = 8080; // HTTPサーバーのポート番号

        // HTTPサーバーの設定
        Server httpServer = new Server(httpPort);
        // 静的なコンテンツを提供するためのハンドラーを追加
        ResourceHandler resourceHandler = new ResourceHandler();
        resourceHandler.setDirectoriesListed(true);
        // resourceHandler.setWelcomeFiles(new String[]{"/mywork/jsp/home.jsp"});
        resourceHandler.setResourceBase("src/main/webapp");

        httpServer.setHandler(resourceHandler);

        // サーバーの開始
        try {
            httpServer.start();
            System.out.println("HTTP server started on port " + httpPort);
            // WebSocketサーバーを起動
            startWebSocketServer();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            httpServer.stop();
        }
    }

    public static void startWebSocketServer() throws DeploymentException {

        String HoriutiLab = "192.168.11.14";

        // WebSocketサーバーを起動
        org.glassfish.tyrus.server.Server server = new org.glassfish.tyrus.server.Server("localhost", 8025, "", null, HelloWorldEndpoint.class);
        try {
            server.start();
            System.out.println("WebSocket server started...");
            Thread.sleep(Long.MAX_VALUE);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            server.stop();
        }
    }
}
