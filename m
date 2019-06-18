Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609534AA89
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 21:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DCC16F2;
	Tue, 18 Jun 2019 21:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DCC16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560884503;
	bh=+pXM6Pc8dlCZ4wT0VhIWvaPyemnSsesTzngbLeVXb7g=;
	h=To:From:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fBvAlSQNX+zDBBXgm06faYh/nJpvQVtv6HLeIu8EWvI+SECp2B5uAepjXA/L5B5Fs
	 WR7bMJRoqu0+as+OhL19sGJ8n+zF38NSAgjIcUQB2zKabPbr0HdtuNXjldvDbMvXeq
	 IvoQJt/47PDOsa/zgH2hpHZOv2WKVkNu++QV7y9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D8AAF896F4;
	Tue, 18 Jun 2019 20:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C4A9F896F4; Tue, 18 Jun 2019 20:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=HTML_MESSAGE,SPF_FAIL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from p3plwbeout03-04.prod.phx3.secureserver.net
 (p3plsmtp03-04-2.prod.phx3.secureserver.net [72.167.218.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B02F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B02F80CC4
Received: from p3plgemwbe03-02.prod.phx3.secureserver.net ([72.167.218.130])
 by :WBEOUT: with SMTP
 id dJKChGoYU5iD0dJKCh0ess; Tue, 18 Jun 2019 11:59:20 -0700
X-SID: dJKChGoYU5iD0
Received: (qmail 105733 invoked by uid 99); 18 Jun 2019 18:59:19 -0000
MIME-Version: 1.0
To: "Jaroslav Kysela" <perex@perex.cz>
From: "scott andrew franco" <samiam@moorecad.com>
In-Reply-To: <20190618113358.6c61c97e98fe7bb02193b2d6dca4a85a.ed0e6629be.mailapi@email03.godaddy.com>
Date: Tue, 18 Jun 2019 11:59:19 -0700
Message-Id: <20190618115919.6c61c97e98fe7bb02193b2d6dca4a85a.e791232afd.mailapi@email03.godaddy.com>
X-Originating-IP: 73.162.255.67
User-Agent: MailAPI 
X-Sender: samiam@moorecad.com
X-CMAE-Envelope: MS4wfOE2poZGfwA33aXXUzMftCACi7xMEAMzrSSEIcIn+alu0a2AFoc4MeQoK+iZRPesmv/WkIAd1/RqaCsSWqRB2/XLShJziabN5G9zmaeF04iiNSpgHOXm
 JAzIlD2kIrTUjieU53XJYBvhBxfONe//Z+anKlIDK7KxBoeXomCUGlcEd/LQaWVz1zMKRDdxZdc3m19dnT5aCgEQwe8P5/KPiHzbJdFJ8xS0JHR3qECDxWW5
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Serious bug calling ALSA lib functions from .so
 vs. .o file
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PS. I really appreciate the help, I have spent more than a week on this, it is a serious blocking issue.
 
I've gone over the example I posted quite carefully. I recommend you try the example out. You just need the
two source files below (test2.c and playwav.c). and execute the commands shown below.
 
The fact that it fails only in the .so file can explain why this bug hasn't affected more user code, since most
people don't call alsa from another library. However, it does not explain everything since I believe there must
be a few users who do put the calling code in a library.
 
Thanks,
 
Scott Franco
 
--------- Original Message --------- Subject: RE: Re: [alsa-devel] Serious bug calling ALSA lib functions from .so vs. .o file
From: "scott andrew franco" <samiam@moorecad.com>
Date: 6/18/19 11:33 am
To: "Jaroslav Kysela" <perex@perex.cz>
Cc: alsa-devel@alsa-project.org

 Hi, and thanks for the reply.
 
>I think that you must link .so to -lasound, too.
 
This was done and shows in the command line example below, IE,
 
 samiam@samiam-home-pc:~/projects/petit_ami$ gcc -fPIC -c test2.c -o test2.o
> samiam@samiam-home-pc:~/projects/petit_ami$ gcc -g3 -Iinclude linux/playwav.c ./test2.so -lasound -o playwav
> samiam@samiam-home-pc:~/projeclufthansa check reservationts/petit_ami$ ./playwav
> alsaplaywave: rate: 1
> alsaplaywave: rate: 0
> samiam@samiam-home-pc:~/projects/petit_ami$ gcc -g3 -Iinclude linux/playwav.c ./test2.o -lasound -o playwav
> samiam@samiam-home-pc:~/projects/petit_ami$ ./playwav
> alsaplaywave: rate: 1
> alsaplaywave: rate: 1
 
Note that in both the "succeeds" case and the "fails" case carry the -lasound option. It would not compile
if not.
 
Scott Franco
 
--------- Original Message --------- Subject: Re: [alsa-devel] Serious bug calling ALSA lib functions from .so vs. .o file
From: "Jaroslav Kysela" <perex@perex.cz>
Date: 6/18/19 11:18 am
To: "scott andrew franco" <samiam@moorecad.com>
Cc: alsa-devel@alsa-project.org

Dne 18. 06. 19 v 17:16 scott andrew franco napsal(a):
 > Hello,
 > 
 > The issue:
 > 
 > calling across .so (dynamic linking) produces different behavior in ALSA library calls than normal,
 > and causes ALSA to malfunction.
 > 
 > I have minimized my issue to as small a code section as possible. Note the code is from commonly available
 > internet examples, including Free Electrons "Audio in embedded linux systems".
 
 It seems like a linker issue. I think that you must link .so to -lasound, too.
 (add -lasound to the command producing your .so library to satisfy the
 versioned symbols)
 
 Jaroslav
 
 > 
 > The run is:
 > 
 > samiam@samiam-home-pc:~/projects/petit_ami$ gcc -fPIC -c test2.c -o test2.o
 > samiam@samiam-home-pc:~/projects/petit_ami$ gcc -g3 -Iinclude linux/playwav.c ./test2.so -lasound -o playwav
 > samiam@samiam-home-pc:~/projeclufthansa check reservationts/petit_ami$ ./playwav
 > alsaplaywave: rate: 1
 > alsaplaywave: rate: 0
 > samiam@samiam-home-pc:~/projects/petit_ami$ gcc -g3 -Iinclude linux/playwav.c ./test2.o -lasound -o playwav
 > samiam@samiam-home-pc:~/projects/petit_ami$ ./playwav
 > alsaplaywave: rate: 1
 > alsaplaywave: rate: 1
 > 
 > Note the only difference between the two runs of "playwave" is if the second module, test2, is linked as a .so or
 > linked as a .o.
 > 
 > The code is:
 > =======================================================================================
 > playwav.c
 > #include <alsa/asoundlib.h>
 > #include <stdio.h>
 > void alsaplaywave1(void)
 > {
 > snd_pcm_t *pcm_handle;
 > snd_pcm_hw_params_t *params;
 > unsigned int val;
 > unsigned int rate;
 > int r;
 > /* open pcm device */
 > r = snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
 > if (r < 0) printf("Cannot open PCM output device");
 > snd_pcm_hw_params_alloca(&params); /* get hw parameter block */
 > snd_pcm_hw_params_any(pcm_handle, params);
 > r = snd_pcm_hw_params_set_access(pcm_handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
 > if (r < 0) printf("Cannot set interleaved mode");
 > r = snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
 > if (r < 0) printf("Cannot set format");
 > r = snd_pcm_hw_params_set_channels(pcm_handle, params, 2);
 > if (r < 0) printf("Cannot set channels number");
 > val = 44100;
 > r = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0);
 > if (r < 0) printf("Cannot set rate");
 > snd_pcm_hw_params_get_rate(params, &rate, 0);
 > printf("alsaplaywave: rate: %d\n", rate);
 > snd_pcm_close(pcm_handle);
 > }
 > extern void alsaplaywave2(void);
 > int main(int argc, char **argv)
 > {
 > alsaplaywave1();
 > alsaplaywave2();
 > return 0;
 > }
 > 
 > ==================================================================================
 > test2.c
 > #include <alsa/asoundlib.h>
 > #include <stdio.h>
 > void alsaplaywave2(void)
 > {
 > snd_pcm_t *pcm_handle;
 > snd_pcm_hw_params_t *params;
 > unsigned int val;
 > unsigned int rate;
 > int r;
 > /* open pcm device */
 > r = snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
 > if (r < 0) printf("Cannot open PCM output device");
 > snd_pcm_hw_params_alloca(&params); /* get hw parameter block */
 > snd_pcm_hw_params_any(pcm_handle, params);
 > r = snd_pcm_hw_params_set_access(pcm_handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
 > if (r < 0) printf("Cannot set interleaved mode");
 > r = snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
 > if (r < 0) printf("Cannot set format");
 > r = snd_pcm_hw_params_set_channels(pcm_handle, params, 2);
 > if (r < 0) printf("Cannot set channels number");
 > val = 44100;
 > r = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0);
 > if (r < 0) printf("Cannot set rate");
 > snd_pcm_hw_params_get_rate(params, &rate, 0);
 > printf("alsaplaywave: rate: %d\n", rate);
 > snd_pcm_close(pcm_handle);
 > }
 > _______________________________________________
 > Alsa-devel mailing list
 > Alsa-devel@alsa-project.org
 > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
 > 
 
 
 -- 
 Jaroslav Kysela <perex@perex.cz>
 Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
 _______________________________________________
 Alsa-devel mailing list
 Alsa-devel@alsa-project.org
 https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
