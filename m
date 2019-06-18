Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD64A9AD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 20:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 425F416D0;
	Tue, 18 Jun 2019 20:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 425F416D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560882041;
	bh=Kp7aRPfRlMSsqry9M86lnwKoTBEu9igtAyMjA99Trlw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdCnFu0DwVPyjV4kCA9n2Ruir1AnQBVENczYbcW2cZZclOM7WIcOkUn+uaffJV6Sc
	 /KQiFZE0AidD97uRmMABmXIpyxYugjE+DHnbP+gf5eGMMJTpDc1QT2oHgqfLI0Hw2q
	 qg4I8rbvDbe6y1s8CLDZXK25h1787NB9UbsqLeQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C98F89682;
	Tue, 18 Jun 2019 20:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27788F896F4; Tue, 18 Jun 2019 20:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9A36F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:18:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 092BCA0042;
 Tue, 18 Jun 2019 20:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 092BCA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1560881932; bh=1IGWyXnt8od9bRCq6Iyb/R4hTRVHKTHe9Ad5j5vHVyo=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=Hxa8uCBDgdqwovwelNTSySs6a4dB4bOryN6+V15T0I6I4H6nBS9PuzyXYQKkRACWz
 pQSUs7pzVItBcXSlHtnDBYu//eK2Jzv3xrEvV+8o96J5X5usUT1kXj9+6Iqml47+K6
 Ny8FM6p9uzmUPNt7nxlgkSWvm1RfaB6EROkeX9FA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 18 Jun 2019 20:18:49 +0200 (CEST)
To: scott andrew franco <samiam@moorecad.com>
References: <20190618081614.6c61c97e98fe7bb02193b2d6dca4a85a.a95f05e421.mailapi@email03.godaddy.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3fa68de3-c77e-7c26-b848-416cc1108c9c@perex.cz>
Date: Tue, 18 Jun 2019 20:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618081614.6c61c97e98fe7bb02193b2d6dca4a85a.a95f05e421.mailapi@email03.godaddy.com>
Content-Language: en-US
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
>  Note the only difference between the two runs of "playwave" is if the second module, test2, is linked as a .so or
>  linked as a .o.
>   
>  The code is:
>  =======================================================================================
>  playwav.c
>  #include <alsa/asoundlib.h>
> #include <stdio.h>
>  void alsaplaywave1(void)
>  {
>  snd_pcm_t *pcm_handle;
>  snd_pcm_hw_params_t *params;
>  unsigned int val;
>  unsigned int rate;
>  int r;
>  /* open pcm device */
>  r = snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
>  if (r < 0) printf("Cannot open PCM output device");
>  snd_pcm_hw_params_alloca(&params); /* get hw parameter block */
>  snd_pcm_hw_params_any(pcm_handle, params);
>  r = snd_pcm_hw_params_set_access(pcm_handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
>  if (r < 0) printf("Cannot set interleaved mode");
>  r = snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
>  if (r < 0) printf("Cannot set format");
>  r = snd_pcm_hw_params_set_channels(pcm_handle, params, 2);
>  if (r < 0) printf("Cannot set channels number");
>  val = 44100;
>  r = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0);
>  if (r < 0) printf("Cannot set rate");
>  snd_pcm_hw_params_get_rate(params, &rate, 0);
>  printf("alsaplaywave: rate: %d\n", rate);
>  snd_pcm_close(pcm_handle);
>  }
>  extern void alsaplaywave2(void);
>  int main(int argc, char **argv)
>  {
>  alsaplaywave1();
>  alsaplaywave2();
>  return 0;
> }
>   
>  ==================================================================================
>  test2.c
>  #include <alsa/asoundlib.h>
> #include <stdio.h>
>  void alsaplaywave2(void)
>  {
>  snd_pcm_t *pcm_handle;
>  snd_pcm_hw_params_t *params;
>  unsigned int val;
>  unsigned int rate;
>  int r;
>  /* open pcm device */
>  r = snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);
>  if (r < 0) printf("Cannot open PCM output device");
>  snd_pcm_hw_params_alloca(&params); /* get hw parameter block */
>  snd_pcm_hw_params_any(pcm_handle, params);
>  r = snd_pcm_hw_params_set_access(pcm_handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
>  if (r < 0) printf("Cannot set interleaved mode");
>  r = snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
>  if (r < 0) printf("Cannot set format");
>  r = snd_pcm_hw_params_set_channels(pcm_handle, params, 2);
>  if (r < 0) printf("Cannot set channels number");
>  val = 44100;
>  r = snd_pcm_hw_params_set_rate_near(pcm_handle, params, &rate, 0);
>  if (r < 0) printf("Cannot set rate");
>  snd_pcm_hw_params_get_rate(params, &rate, 0);
>  printf("alsaplaywave: rate: %d\n", rate);
>  snd_pcm_close(pcm_handle);
>  }
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
