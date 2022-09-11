Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F565B507A
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Sep 2022 20:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6FF16B8;
	Sun, 11 Sep 2022 20:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6FF16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662919804;
	bh=elbf4wBKyGeYbXE8RvGIjv4ClGP9GURJuoOYKBx0uyk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bSy1a0AkgWO/0G/QVy3lbX27sCCGAxlE1kLGh0st8Pzi7wkBrSUIURqm6wNvvEv5/
	 iLojAi/EXCf/P6uQIq8OuJHuxC6FzkXQRzWhIV31s9nVyQ1qQOoYEVda4oAk3sMA3B
	 WeMOIEETR3ahBbooWWUbMGKCgA+NU2xFkzaIB0tY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE32F800B8;
	Sun, 11 Sep 2022 20:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37759F80256; Sun, 11 Sep 2022 20:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D897AF800FE
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 20:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D897AF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SfLCFiny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662919735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdmpXsjZuQE6k+1DRkCr+Ts61rlgc+nSmqe7XEFfekE=;
 b=SfLCFinyXBtFwZzMTF8B8hsnBrjv1Y3V+K4v9JWF2+G7O3CIhm2jrsiAQP4S0pJjbY0Aya
 wDHGKLhxjjbV4Mz3wj5Fht8BiSyWQzsu8IEwSJF0nGxVHuLqKXdchJOANgO7emYpB1k7k2
 KVyb7JhpdewErxNDVCrh/BPslNnMM30=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-pD-GN3BfOX6yQSw9UjjO2w-1; Sun, 11 Sep 2022 14:08:53 -0400
X-MC-Unique: pD-GN3BfOX6yQSw9UjjO2w-1
Received: by mail-ed1-f70.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso918625edc.18
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 11:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UdmpXsjZuQE6k+1DRkCr+Ts61rlgc+nSmqe7XEFfekE=;
 b=InUDGm433B9BKaLXkwTYSv/TXsDK6ZVXRfUZV3kHFncCEqQpvN/Az0QlsDXQ1Ve1+W
 9wMe4W1pXyTbSX+37Ylqhjbflv0Zk2iMfrKk7+ELhJMkrqN+6FVN8k0jy9vwcuUAYDSI
 wokSxAIaQ1KtI6bisEyp+kiSTnj9meONgZEKweN81q2xT5ogCJmgaDxt+kJI+7JDAUdD
 ahf7iU2jKlGFpbiNhDTzjb0bYdXy3s3IXVJdTSDA4oxmvbLxdF4gQNw312e6cSmO3XDD
 eCHJ0oxZN6aVBKjetGDhGlgKCM30yqHja8dGjZPbPun5ZmrRLgkqWS/cfF8By95bTZaE
 QwXg==
X-Gm-Message-State: ACgBeo1eQ15BRXbjqSrd1KY/UTW7duB4rDirq6WRsXMTehNqEQs9ZOg7
 sjVBx1pM1+yC6f7qAwQJmxsHi1R7Sr5HuTjvWy/EFPQD7fYPZmjpPpPZjz9iOi6nBdTfX3sBhK1
 dG3BTgkGrWD/5zNZ9Wu+KJnE=
X-Received: by 2002:a17:907:e94:b0:77a:a4cb:a78b with SMTP id
 ho20-20020a1709070e9400b0077aa4cba78bmr6409354ejc.135.1662919732216; 
 Sun, 11 Sep 2022 11:08:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Mzw7q56nEFy8j9xXhvlcUfvsZfogKA/bL0ALGf6EOfypHCSDn1pggy5+R1fS++l8/ZYZj+A==
X-Received: by 2002:a17:907:e94:b0:77a:a4cb:a78b with SMTP id
 ho20-20020a1709070e9400b0077aa4cba78bmr6409344ejc.135.1662919732040; 
 Sun, 11 Sep 2022 11:08:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a05640214da00b00445e930e20esm4201093edx.64.2022.09.11.11.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 11:08:51 -0700 (PDT)
Message-ID: <36275921-169f-408d-0493-e10359f036d4@redhat.com>
Date: Sun, 11 Sep 2022 20:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Buffers used in ASoC Intel Atom SST driver
To: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <874jy98snd.wl-tiwai@suse.de>
 <fdfd19f4-436b-bc1b-65f2-7b60f8e59277@intel.com>
 <87zgg17d4s.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87zgg17d4s.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 8/18/22 18:03, Takashi Iwai wrote:
> On Thu, 18 Aug 2022 17:59:36 +0200,
> Cezary Rojewski wrote:
>>
>> On 2022-08-18 5:42 PM, Takashi Iwai wrote:
>>> Hi,
>>>
>>> while cleaning up / fixing the memory allocation code, I noticed that
>>> Intel SST driver is the only driver that currently uses the
>>> SNDRV_DMA_TYPE_CONTINUOUS pages for its PCM buffer.
>>>
>>> Is there any reason not to use the standard device buffer
>>> (SNDRV_DMA_TYPE_DEV)?  i.e. the change like below.
>>
>>
>> Hello,
>>
>> Does not hurt to check the change out. I'm not aware of such
>> limitation for any of Intel's AudioDSP solutions. I cannot test this
>> change though as ATOM devices are not part of my CI. Pierre, do you
>> have any devices where this change could be tested?
>>
>> Adding Hans as he is the key intel/atom maintainer too and I'm pretty
>> sure he has few devices on his own.
> 
> Oh yeah, thanks, Hans might be able to check.
> FWIW, the patch I asked is like below.

I know this has already been merged, but still I have just given this
a quick test-spin and it works ok for me.

Regards,

Hans


> 
> 
> Takashi
> 
> -- 8< --
> 
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ASoC: Intel: sst: Switch to standard device pages
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index a56dd48c045f..c75616a5fd0a 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -676,10 +676,9 @@ static int sst_soc_pcm_new(struct snd_soc_component *component,
>  
>  	if (dai->driver->playback.channels_min ||
>  			dai->driver->capture.channels_min) {
> -		snd_pcm_set_managed_buffer_all(pcm,
> -			SNDRV_DMA_TYPE_CONTINUOUS,
> -			snd_dma_continuous_data(GFP_DMA),
> -			SST_MIN_BUFFER, SST_MAX_BUFFER);
> +		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +					       pcm->card->dev,
> +					       SST_MIN_BUFFER, SST_MAX_BUFFER);
>  	}
>  	return 0;
>  }

