Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0B368212
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 16:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E20585D;
	Thu, 22 Apr 2021 16:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E20585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619100152;
	bh=KUh8hXIjYjOj4mgR5P4gI1ccwtROS8BAI0irsnEGaI4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hYYzLHCc3/nCwUTjJNhuRkBHC1bq+uInl2uTdPf2B6YYYeVNwXcjCyT8xLX8x7nMw
	 ULYfFaHEpbKLTzFD5zqN79QOhoskqu4EMVQJ3xAGNZ+1voC7/yb9yK6w676YdWQcbI
	 a43bQGjDn54j4LBKoiCeNw7JWKF1eDnME8WTgszg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B966AF800AE;
	Thu, 22 Apr 2021 16:01:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0BBDF80168; Thu, 22 Apr 2021 16:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B75F80134
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 16:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B75F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DIu/8G4h"
Received: by mail-lf1-x12b.google.com with SMTP id d27so15475493lfv.9
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XdTPGn7kzAorIr31woOO1tDdE9k/iAgH+AUBZEWaSZc=;
 b=DIu/8G4heEQpnd2a9G8555GAdp0ibkzerNqC9MB+kxrCMVIg7o3QlMSOxWn2d8SsOP
 CqkKorof3OhQHPsQ/R5lJFu/hHXNzP5hz79y4axFD2Mo7V4l9xZgVU3iK+GAZl7fS+oG
 BlsV3vPFKvAxE1ENEqdElp4rEOiLtReErBWCuWD5ztUxJuzA9McS8i2EC9UTl0HhuttK
 rrmh6h+jG+We/ju6k+TdPMvxrDStsZ0JuDx7G9UFMQAgbCPZER2h36/0qUJJ4Qn+XaYY
 Qvtnz02659/63cr2W1hjl4hR3LPcp9r8rslcE60vh0ghevXJPoxPRasg6GSUSa24it1L
 iT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XdTPGn7kzAorIr31woOO1tDdE9k/iAgH+AUBZEWaSZc=;
 b=JRtnu3cEqglRzlVJOBFlVMAI0VLlpUXxD5I4hT79pE01X5e5Y1UjOumMaS+FDjOdzT
 /OWPMJloZg4owFd+0w3welyDtjPUTJaISfwQYFAjv7cNzHiQmTDsPVzhMJCqmZ+x9oPd
 oFMaFvQPlX/I7JNpv6jxC3w0gmHM1SJmsKcvPmFmswre3qaxXNw/hTnsdAIJdVVn3mUd
 s/BJSSkXx+joR4SF1D32mc3Va64/O/oxSz+U9i0CGn5MyZFS6r5feyDayKYXAerXoBNZ
 oLukI9LjmbCS8Ujbz+UJ1HWYi76p12pCcJs0HKk6Ly3i4ji862k/elWtAFiHJjKxIQ3d
 BmMg==
X-Gm-Message-State: AOAM533QY50iRGKcZ9U82vPG05TqypUde83lu5lDfNMUC82TynkM0jsE
 1CkmAWGI0fPOcPWUja0gn+k=
X-Google-Smtp-Source: ABdhPJwl8QialC+zzPTpzKmoo6LEbOcOFAGBvMFA/Qt3hWHr+uxRjVckQr0ki6fcGFGL+Zm9+MNIAQ==
X-Received: by 2002:a05:6512:3f9d:: with SMTP id
 x29mr2533777lfa.363.1619100043598; 
 Thu, 22 Apr 2021 07:00:43 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id a25sm290782ljp.38.2021.04.22.07.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 07:00:43 -0700 (PDT)
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
To: htl10@users.sourceforge.net,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
 <212419469.6653726.1618928398310@mail.yahoo.com>
 <425493399.6730534.1618934642983@mail.yahoo.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <ec99afd0-fa6b-71a5-653d-f1ef9687d5ed@gmail.com>
Date: Thu, 22 Apr 2021 17:01:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <425493399.6730534.1618934642983@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 4/20/21 7:04 PM, Hin-Tak Leung wrote:
>  Hi,
> 
> I agree with Peter's change. Raspbian - the raspberry pi distribution - is currently shipping v5.10.x (jumping from v5.4.x in February), which has changed a lot since v5.5.x. Nonetheless, as a proof of concept, I reverted the idea of Peter's change in v.5.10.x, with this:
> 
> <diff-start>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 91bf33958..20077dd8c 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1042,7 +1042,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  case SNDRV_PCM_TRIGGER_START:
>  case SNDRV_PCM_TRIGGER_RESUME:
>  case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> - ret = snd_soc_link_trigger(substream, cmd);
> + ret = snd_soc_pcm_dai_trigger(substream, cmd);
>  if (ret < 0)
>  break;
>  
> @@ -1050,8 +1050,9 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  if (ret < 0)
>  break;
>  
> - ret = snd_soc_pcm_dai_trigger(substream, cmd);
> + ret = snd_soc_link_trigger(substream, cmd);
>  break;
> +
>  case SNDRV_PCM_TRIGGER_STOP:
>  case SNDRV_PCM_TRIGGER_SUSPEND:
>  case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> <diff-end>
> 
> and was able to restore the functionality of Seeed Studio's respeaker driver against v5.10.x. That it relies on the previous behavior is a bit broken. I think I'd like some dev_dbg() inside soc-pcm.c, and perhaps some help in modifying the out-of-tree audio device driver to cope?


If you start the DAI first and later the DMA then it works again?
I'm still behind of the patch which introduced different sequences for
start and stop.

From my commit the start sequence is:
dai_link, DMA, CPU DAI then the codec

Is it make any difference if you try:
dai_link, DMA, codec then the CPU DAI

But the codec is usually not handled in trigger, it can not be atomic
most of the time.

Can you point me to the out of tree driver and the related dts files?
Can it be reproduced with rpbi w/o any hat? I have one hifiberry but
that is playback only and if I'm not mistaken the 3.5 on the board also?


> 
> Thanks a lot.
> 
> Regards,
> Hin-Tak 
> 
> On Tuesday, 20 April 2021, 15:19:58 BST, Hin-Tak Leung <htl10@users.sourceforge.net> wrote:
> 
>> Hi Peter:
> 
>> I found the commit of a rather unusual regression between kernel v5.4 and v5.5, for an out-of-tree driver on the 
>> raspberrypi. Everything looks identical between v5.4 and 5.5, within accountable differences, even with debugging in > sound/ +p and the driver side. 5.4 records fine, 5.5 stucks on recording. The commit is one of yours:
> 
>> commit 4378f1fbe924054a09ff0d4e39e1a581b9245252
>> Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Date: Fri Sep 27 10:16:46 2019 +0300
> 
>> ASoC: soc-pcm: Use different sequence for start/stop trigger
> 
> ...
> 
>> The problem was initially at https://github.com/respeaker/seeed-voicecard/issues/290 
>> then over to https://github.com/raspberrypi/linux/issues/4279 and finally here. The "seeed-8mic-voicecard-
>> overlay.dts" is the dts corresponds to the problematic device ; The one with similar hardware but okay is "seeed-
>> 4mic-voicecard-overlay.dts" .
> 
> ...
>> The Raspberry Pi distribution raspbian jumped directly from 5.4.x to 5.10.x at the beginning of February. Considering 
>> the change has been in since the v5.5 merge window, I guess I'd like some help to correct / workaround on the 
>> out-of-tree driver side? And probably some new dev_err() message in the kernel for problematic driver helping to 
>> diagnose similar problems in the future would be nice. 
> 
>   
> 

-- 
Péter
