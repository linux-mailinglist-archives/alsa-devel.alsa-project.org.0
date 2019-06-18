Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343834AA02
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 20:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C53FC16D2;
	Tue, 18 Jun 2019 20:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C53FC16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560882989;
	bh=IPt9BoFTrMLqbGs/V2SGVBf8F0AaC7dVonHIu2ss520=;
	h=To:From:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i3Da0lVC6F372rCCbk5KCpcqrC8PwY1OQJj0mGs3sVZ3Bwu0g1Fb2M/J2iPR/nMCY
	 BHWASecXCh0gAQtZuvZE0PADc0GHjxzPBHVhO15ZdzlS4dh1FaV8MK1Z9o8uzoq2Qf
	 pyZms4jTMZ8Ak6XriXLzWKGeZ9C+5Qsg2EimNugY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B72CF8971F;
	Tue, 18 Jun 2019 20:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31C63F89724; Tue, 18 Jun 2019 20:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=HTML_MESSAGE,SPF_FAIL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from p3plwbeout03-04.prod.phx3.secureserver.net
 (p3plsmtp03-04-2.prod.phx3.secureserver.net [72.167.218.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2A65F896F4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A65F896F4
Received: from p3plgemwbe03-01.prod.phx3.secureserver.net ([72.167.218.129])
 by :WBEOUT: with SMTP
 id dIvehGmQ25iD0dIveh0eQW; Tue, 18 Jun 2019 11:33:58 -0700
X-SID: dIvehGmQ25iD0
Received: (qmail 83530 invoked by uid 99); 18 Jun 2019 18:33:58 -0000
MIME-Version: 1.0
To: "Jaroslav Kysela" <perex@perex.cz>
From: "scott andrew franco" <samiam@moorecad.com>
In-Reply-To: <3fa68de3-c77e-7c26-b848-416cc1108c9c@perex.cz>
Date: Tue, 18 Jun 2019 11:33:58 -0700
Message-Id: <20190618113358.6c61c97e98fe7bb02193b2d6dca4a85a.ed0e6629be.mailapi@email03.godaddy.com>
X-Originating-IP: 73.162.255.67
User-Agent: MailAPI 
X-Sender: samiam@moorecad.com
X-CMAE-Envelope: MS4wfAcCQJ8qlGIV5ug1PsYkghJK83/iVwB+tvdtuwgV4mzXQ7YJzJKhNAl0vH7+Xd+YwF/l2dFegaLpmA3TDUdmuu1rdl4ONi3czidVk0YQ9AxN+eAz7GKI
 +rajK1PrPtYgGJouy6y2zr6uvYjc30jYvmCwnXGh9vUKdnhccfifwP4/LbRDQCyYKbGEHOQBLuusmLGrFTr0w57Qnyw69WEf3o1gmzXRhlKarlHIpNiOQ/Dr
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
