import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.DefaultHandler;
import org.eclipse.jetty.server.handler.ResourceHandler;

public class Initial {

    public static void main(String[] args) {
        int httpPort = 8080; // HTTPサーバーのポート番号

        // HTTPサーバーの設定
        Server httpServer = new Server(httpPort);
        // 静的なコンテンツを提供するためのハンドラーを追加
        ResourceHandler resourceHandler = new ResourceHandler();
        resourceHandler.setDirectoriesListed(true);
        resourceHandler.setWelcomeFiles(new String[]{"home.jsp"});
        resourceHandler.setResourceBase("src/main/webapp");

        httpServer.setHandler(resourceHandler);


        // サーバーの開始
        try {
            httpServer.start();
            System.out.println("HTTP server started on port " + httpPort);
            httpServer.join();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // } finally {
        //     httpServer.stop();
        // }
    }
}
