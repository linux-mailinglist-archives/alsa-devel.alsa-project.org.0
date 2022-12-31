Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621265A3C4
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 12:39:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D296C338C;
	Sat, 31 Dec 2022 12:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D296C338C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672486786;
	bh=dzBzH4/NEnw+4Os6Qh9c1EStlXLaB/dbjb/EfFrWfRQ=;
	h=Date:From:To:References:Subject:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KfRKMRtX4Ka4cs5M7fE2+7BquxHDDrh/Pb4g6ZZ0kt06gyXiuyRjEbPhGck/a8+wz
	 W9fOjFtocZVThVWeebz8ZmX66edO3rP/Z7CDAKM2UdQCopUN5EZrWyuFdPv4QKLYaV
	 NKiswVmEcDGTgGpPjWaB5A99+z0OR0dZ4Q7/7Y8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE97F802A0;
	Sat, 31 Dec 2022 12:38:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41103F804E7; Sat, 31 Dec 2022 12:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mailout08.hostingdiscounter.nl (mailout08.hostingdiscounter.nl
 [IPv6:2a00:1478:200:0:f:1099:0:1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE4BF80310
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 12:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE4BF80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=veniogames.com header.i=@veniogames.com
 header.a=rsa-sha256 header.s=default header.b=iz56gFSO
Received: from localhost (localhost [127.0.0.1])
 by mailout08.hostingdiscounter.nl (Postfix) with ESMTP id EF22768A;
 Sat, 31 Dec 2022 12:38:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mailout08.hostingdiscounter.nl
Received: from mailout08.hostingdiscounter.nl ([127.0.0.1])
 by localhost (mailout08.hostingdiscounter.nl [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id NDhkTyJLeUxf; Sat, 31 Dec 2022 12:38:45 +0100 (CET)
Received: from mail201.hostingdiscounter.nl (mail201.hostingdiscounter.nl
 [77.95.248.144])
 by mailout08.hostingdiscounter.nl (Postfix) with ESMTPS;
 Sat, 31 Dec 2022 12:38:45 +0100 (CET)
Received: from [192.168.1.105] (250-170-250-62.ftth.glasoperator.nl
 [62.250.170.250])
 by mail201.hostingdiscounter.nl (Postfix) with ESMTPSA id 2E3BF5AF6A;
 Sat, 31 Dec 2022 12:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veniogames.com;
 s=default; t=1672486725;
 bh=V2ZUL5POBJWbD5uuS82uuL9Xi+owRjc5LnFMGRxSUIM=;
 h=Date:From:To:Cc:References:Subject:In-Reply-To:From;
 b=iz56gFSOBK2JSMaja7Q7SH5zMlzNUd1n8WEsFXrU6gk3vMv7cEHgvv/cKbtnw/ri0
 8DH0yZLbD9MmN+6c0US0vrvt/F4Kq6uRBryV3ZpY1aK+jzLMlNpmVns2KwuqoQXYtC
 H/5NB9kPwMB90Vrnr+ij8cQxcc4ri+ncDpau9USKIbv7PHVLeyCQPrQttPO8DmX/2G
 QALpHA4hN3mmv2S+QSgRirCr+imOVFu+vtV/h7/7njGcTZhB2z76lySFHMwQWUJg9a
 V3jgba7AQIkE6S76aVVE1slHp3KOreHT0j+cci6Cm7+sfx6s50KiarulQcSBHm7j0N
 gDKmhnKBfhUPQ==
Message-ID: <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
Date: Sat, 31 Dec 2022 12:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: Ruud van Asseldonk <ruud@veniogames.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Takashi Iwai <tiwai@suse.com>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday> <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
 <9d663e28-88fb-aa96-574b-e92d6214aefe@veniogames.com>
Content-Language: nl, en-US
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
In-Reply-To: <9d663e28-88fb-aa96-574b-e92d6214aefe@veniogames.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

I bisected this and identified e4ea77f8e53f9accb9371fba34c189d0447ecce0 
(ALSA: usb-audio: Always apply the hw constraints for implicit fb sync) 
as the first commit where it is no longer possible to change the sample 
rate. On the parent commit, my sample program successfully changes the 
sample rate from 44100 Hz to 96000 Hz, but on e4ea77f8e53f9, the second 
call to snd_pcm_hw_params fails.

Kind regards,
Ruud

Ruud van Asseldonk wrote:
> After diving into this some more, I managed to create a minimal 
> reproducing C program. I discovered:
> 
>      * The bit depth is not relevant.
>      * It is not a problem with 96 kHz, but a problem with switching 
> sample rates.
> 
> If I call snd_pcm_hw_params, the first call always succeeds. But when I 
> first call it with hw_params with rate 44100 and then again with 48000 
> or 96000, the second call fails. If I call it with 96000 first and then 
> with 44100, the first call for 96000 succeeds and changing to 44100 
> fails. I'll add the full program at the end of this mail. Changing the 
> bit depth does succeed by the way, to it’s not that the hw_params can’t 
> be changed at all.
> 
> 
> Thorsten Leemhuis wrote:
> 
>>> Sorry for your troubles. You could use "git bisect" to try to pinpoint
>>> the exact commit that introduces failure for you.
>>
>> Yeah, that would be helpful. But 5.15 is quite old by now. Before going
>> down that route you might want to try the latest kernel (e.g. Linux
>> 6.1), as the problem might have been fixed in between, without the fix
>> being backported.
>> You also talk about a "rpi-" kernel. Is that a vanilla kernel, or at
>> least close to it?
> 
> It is not vanilla, it is from 
> https://github.com/raspberrypi/linux/tree/rpi-5.15.y. However, in 
> addition to the Raspberry Pi I also have an x86_64 laptop that runs a 
> vanilla 6.1.1 kernel, and the minimal reproducing program below does 
> fail here as well with an UMC204HD. When I downgrade to 5.10.16 (also 
> vanilla), the program does succeed. So it’s unrelated to the Raspberry 
> Pi. This should also make it a lot easier for me to bisect this as I 
> don’t have to do it on the Raspberry. I will try to bisect next then.
> 
> 
> Jaroslav Kysela wrote:
> 
>  > It seems like a problem in the hw_params constraints / refining. There
>  > are lot of changes in the USB audio driver between 5.10/5.15. There is
>  > also HW_CONST_DEBUG define in sound/usb/pcm.c which enables the debug
>  > output for the refining.
>  >
>  > Just curious: What's behind the value 513 (period size)? It does not
>  > match the time (5.34ms for 96kHz) nor a binary value. I would use 480
>  > (5ms) or so.
> 
> I think I put this in at some point trying to see if it made a 
> difference, in my main application I was using different values. After 
> some more trying, it looks like the period size and buffer size are not 
> relevant for reproducing, see also the program below.
> 
>  > And the final note: I gave a quick test with UMC204HD with the 6.0.9
>  > kernel and it appears that this problem is not present in the recent
>  > kernel:
> 
> After writing the reproducer, it looks like the failure only happens 
> when changing the sample rate, so it makes sense that aplay would not 
> reproduce it.
> 
>  > I would also use S32_LE native format in your app, the S24_3LE is not
>  > supported with your hw directly. The alsa-lib does conversion.
> 
> Thanks for the heads-up! Yeah I am being lazy, I am also relying on 
> alsa-lib to expand the channels from 2 to 4 (since the UCM404 only 
> supports 4 channels).
> 
> 
> Minimal reproducing program:
> 
> #include <assert.h>
> #include <alsa/asoundlib.h>
> 
> void set_format(snd_pcm_t* pcm, unsigned int rate) {
>      int err;
>      snd_pcm_hw_params_t* hwp;
>      err = snd_pcm_hw_params_malloc(&hwp);
>      assert(err == 0);
>      err = snd_pcm_hw_params_any(pcm, hwp);
>      assert(err == 0);
>      err = snd_pcm_hw_params_set_rate(pcm, hwp, rate, 0);
>      assert(err == 0);
>      err = snd_pcm_hw_params(pcm, hwp);
>      assert(err == 0);
> }
> 
> int main(void) {
>      int err;
>      snd_pcm_t* pcm;
> 
>      int mode = 0;
>      err = snd_pcm_open(&pcm, "hw:U192k", SND_PCM_STREAM_PLAYBACK, mode);
>      assert(err == 0);
> 
>      set_format(pcm, 44100);
>      printf("44.1k ok\n");
>      set_format(pcm, 96000);
>      printf("96k ok\n");
> }
> 
> Kind regards,
> Ruud
