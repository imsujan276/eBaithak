package NextRtc;

import org.nextrtc.signalingserver.NextRTCConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;
import org.springframework.web.socket.server.standard.TomcatRequestUpgradeStrategy;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

@Configuration
@Import(NextRTCConfig.class)
public class EndpointConfig {
    @Bean
    public MyEndpoint myEndpoint() {
        return new MyEndpoint();
    }

    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
    
//    public void registerStompEndpoints(StompEndpointRegistry registry) {
//    	registry.addEndpoint("/ws")
//    	.setHandshakeHandler(new DefaultHandshakeHandler(new TomcatRequestUpgradeStrategy()))
//    	.withSockJS();
//    }
}