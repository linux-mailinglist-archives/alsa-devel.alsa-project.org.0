Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC6B4A50B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 17:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5685E16D8;
	Tue, 18 Jun 2019 17:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5685E16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560871118;
	bh=U7gqvhuDg/j9GmigFsZ3qQSbz7Qpjskmr7z91I3sT98=;
	h=To:From:In-Reply-To:Date:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=k6HIR/uSBCpS76a2VJFV/+Ua1UczG6j2yVA3RQvudRQGvzwF5gvgn13wXLcV5DB7H
	 8OzW41d38u5wCI6YyxDhQm84dZffEgysBioX61N1Fju6GlgsxXqshCfke9WwvoUdIg
	 RSKlwhB5bMJX4yebebKXJ1t6P93iIRwLAXPlk1IQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FE6AF896F4;
	Tue, 18 Jun 2019 17:16:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 944A9F896F4; Tue, 18 Jun 2019 17:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=HTML_MESSAGE,SPF_FAIL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from p3plwbeout03-03.prod.phx3.secureserver.net
 (p3plsmtp03-03-2.prod.phx3.secureserver.net [72.167.218.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A67F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 17:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A67F8075C
Received: from p3plgemwbe03-04.prod.phx3.secureserver.net ([72.167.218.132])
 by :WBEOUT: with SMTP
 id dFqIh6IcmIoaadFqIhX9Nb; Tue, 18 Jun 2019 08:16:14 -0700
X-SID: dFqIh6IcmIoaa
Received: (qmail 77682 invoked by uid 99); 18 Jun 2019 15:16:14 -0000
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
From: "scott andrew franco" <samiam@moorecad.com>
In-Reply-To: <20190617232429.6c61c97e98fe7bb02193b2d6dca4a85a.19b5fd637d.mailapi@email03.godaddy.com>
Date: Tue, 18 Jun 2019 08:16:14 -0700
Message-Id: <20190618081614.6c61c97e98fe7bb02193b2d6dca4a85a.a95f05e421.mailapi@email03.godaddy.com>
X-Originating-IP: 73.93.93.31
User-Agent: MailAPI 
X-Sender: samiam@moorecad.com
X-CMAE-Envelope: MS4wfIWjFv7YfSAcDsLiiX8/fczrSFJXQZ73KlQ62Voti+fmDT/KP/oRlDn941x8oFHJFdG0LYCCQWxT1GJecWjXsYud62apWcmuCucdZe+o1flRI1zrHvOB
 zV6m6/thGZtUMtCebao41S8BIG/9RLejGW7O9EfDTSjr/V0kSOaCc2lzLTphzcR8enMXyxA/Lj++ix5kj/Ik1H5L97GxAie6GgrYrEblqMdHYe9eOOz+oK8t
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello,
 
The issue:
 
calling across .so (dynamic linking) produces different behavior in ALSA library calls than normal,
and causes ALSA to malfunction.
 
I have minimized my issue to as small a code section as possible. Note the code is from commonly available
internet examples, including Free Electrons "Audio in embedded linux systems".
 
The run is:
 
samiam@samiam-home-pc:~/projects/petit_ami$ gcc -fPIC -c test2.c -o test2.o
samiam@samiam-home-pc:~/projects/petit_ami$ gcc -g3 -Iinclude linux/playwav.c ./test2.so -lasound -o playwav
samiam@samiam-home-pc:~/projects/petit_ami$ ./playwav
alsaplaywave: rate: 1
alsaplaywave: rate: 0
samiam@samiam-home-pc:~/projects/petit_ami$ gcc -g3 -Iinclude linux/playwav.c ./test2.o -lasound -o playwav
samiam@samiam-home-pc:~/projects/petit_ami$ ./playwav
alsaplaywave: rate: 1
alsaplaywave: rate: 1
  
 Note the only difference between the two runs of "playwave" is if the second module, test2, is linked as a .so or
 linked as a .o.
  
 The code is:
 =======================================================================================
 playwav.c
 #include <alsa/asoundlib.h>
#include <stdio.h>
 void alsaplaywave1(void)
 {
 snd_pcm_t *pcm_handle;
 snd_pcm_hw_params_t *params;
 unsigned int val;
 unsigned int rate;
 int r;
 /* open pcm device */
 r = snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
 if (r < 0) printf("Cannot open PCM output device");
 snd_pcm_hw_params_alloca(&params); /* get hw parameter block */
 snd_pcm_hw_params_any(pcm_handle, params);
 r = snd_pcm_hw_params_set_access(pcm_handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
 if (r < 0) printf("Cannot set interleaved mode");
 r = snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
 if (r < 0) printf("Cannot set format");
 r = snd_pcm_hw_params_set_channels(pcm_handle, params, 2);
 if (r < 0) printf("Cannot set channels number");
 val = 44100;
 r = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0);
 if (r < 0) printf("Cannot set rate");
 snd_pcm_hw_params_get_rate(params, &rate, 0);
 printf("alsaplaywave: rate: %d\n", rate);
 snd_pcm_close(pcm_handle);
 }
 extern void alsaplaywave2(void);
 int main(int argc, char **argv)
 {
 alsaplaywave1();
 alsaplaywave2();
 return 0;
}
  
 ==================================================================================
 test2.c
 #include <alsa/asoundlib.h>
#include <stdio.h>
 void alsaplaywave2(void)
 {
 snd_pcm_t *pcm_handle;
 snd_pcm_hw_params_t *params;
 unsigned int val;
 unsigned int rate;
 int r;
 /* open pcm device */
 r = snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
 if (r < 0) printf("Cannot open PCM output device");
 snd_pcm_hw_params_alloca(&params); /* get hw parameter block */
 snd_pcm_hw_params_any(pcm_handle, params);
 r = snd_pcm_hw_params_set_access(pcm_handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
 if (r < 0) printf("Cannot set interleaved mode");
 r = snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
 if (r < 0) printf("Cannot set format");
 r = snd_pcm_hw_params_set_channels(pcm_handle, params, 2);
 if (r < 0) printf("Cannot set channels number");
 val = 44100;
 r = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0);
 if (r < 0) printf("Cannot set rate");
 snd_pcm_hw_params_get_rate(params, &rate, 0);
 printf("alsaplaywave: rate: %d\n", rate);
 snd_pcm_close(pcm_handle);
 }
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
