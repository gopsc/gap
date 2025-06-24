package urlr
import stdx.net.http.*
import std.net.*
main(): Int64 {
    while (true) {
        let url = rand(10).genUrl()
        try {
            let rsp = ClientBuilder().build().get(url)
            if (rsp.status == 200) {
                println(url)
            }
        } catch (exp: HttpException) {
            ;
        } catch (exp: SocketException) {
            ;
        }
    }
    return 0
}