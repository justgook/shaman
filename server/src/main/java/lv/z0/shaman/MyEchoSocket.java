package lv.z0.shaman;

import java.io.IOException;
import org.eclipse.jetty.websocket.api.WebSocketAdapter;

/**
 * Example of a basic blocking echo socket.
 */
public class MyEchoSocket extends WebSocketAdapter
{
    @Override
    public void onWebSocketText(String message)
    {

        if (isNotConnected())
        {
            return;
        }

        try
        {
            // echo the data back
            System.out.printf("Got msg: %s%n", message);
            getBlockingConnection().write(message);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}