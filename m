Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35F5C0189
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EEB441;
	Wed, 21 Sep 2022 17:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EEB441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663774167;
	bh=+KYl7Pb58TtjbzgP4nDz7xcYEHqhnXxGN919MItsQP4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGdNDYkEiELwm8aukCTzT/76gWeQeQDCjB0WzCUuzdSer/mYXECfuTkjR/1kWGPxB
	 LGcqCJiEJtEelNoHologbSwKu19bXgja7Q8sN4+mKTabOnD5f486dJjj7NPohoZcuH
	 1kUAMAvygvYnYSVlbDueeVtw80kqxomuPnm7gX/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C817CF80425;
	Wed, 21 Sep 2022 17:28:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C20DF80256; Wed, 21 Sep 2022 17:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DA2F800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DA2F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="svch8Vd6"
Received: by mail-lj1-x233.google.com with SMTP id p5so7407281ljc.13
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4fyDdd6hcvCfFZT9i19QE30bk4gB/G2w/iEESMxgbKA=;
 b=svch8Vd6r5prc+EGUm5IRQ9iK6HudwOgs+E0/t3t6ZepH24yrJ3rb2q47vhpC/hSa5
 eePSlz7Zb9Lw/5kBu1F+jrYiKW7u52M1oCGfMoxtxNcI7w52YP4ggol4vHs61087fQPn
 zkxiUfstNdQLdKfuWntvkdn1pHs/VU98DT/nkc+fv9e+Ftq30wa8TJirz10+nLEQ2ViN
 klJweBcRNlRpLGskSeJfL+qoawD1pAP/J3TUiQ+9G8AWEAWBch5rrkVYmw3a4n8m7z8D
 Lw/hWf8MxPimo84973uQKVzW4JGaWScCmK/FaP7kjWGNqXvuYj0rKOpgn5Uy4E/17WQD
 3YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4fyDdd6hcvCfFZT9i19QE30bk4gB/G2w/iEESMxgbKA=;
 b=iUofILpylt21dbi+ywboSnD4T+28DPsEPJP3Hmsea5+em32vtNTKyHl6zbw4E313wS
 mQLak/DjTV5CcmoTMlUlid2zUHGTrueW8z0BcKWEM9CMRodRDJDtbC//Pbn5ySvE/jVd
 TEYDwk3oQIjypbr6uEBoxf5x0xc9JZk9lD5XCpq9fw+3oZo61q4vGIujfT6u+YqXh1ZZ
 r9rpNkiWTPBCOjAZJ6TL/QIJwqCGubP2c0flbSYpefzGHHuyHyort+S4jai6J4gPcnuh
 rFvSp2IFYBRXcf2dKo9bNvYRhmF6a9xkKyd5pdPTVv3Pap3OspGnbLLYGB5nPebcnwZU
 4tlw==
X-Gm-Message-State: ACrzQf2nfZYN7F14ANz90B0YpLKE1xLbufjifosH6WgHGEkDaB7LzQrO
 3Rl/IoJhTGnDxt8bz0rmmfRDWg==
X-Google-Smtp-Source: AMsMyM4kgLEzuRCbwB9NE7eQli7CQSYE21f8z+xxXzyue6Db7mHLo03HzBf6cA9GZU7GrFsDfz3CmA==
X-Received: by 2002:a2e:9d94:0:b0:26b:de12:7c9 with SMTP id
 c20-20020a2e9d94000000b0026bde1207c9mr9055575ljj.244.1663774098321; 
 Wed, 21 Sep 2022 08:28:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05651203f500b00494a8fecacesm474505lfq.192.2022.09.21.08.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 08:28:17 -0700 (PDT)
Message-ID: <df350235-3c50-c7ac-eb62-5fbc501fed0a@linaro.org>
Date: Wed, 21 Sep 2022 17:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
 <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
 <af3bd3f4-dcd9-8f6c-6323-de1b53301225@linaro.org>
 <9a210b04-2ff2-df98-ad1a-89e9d8b0f686@linaro.org>
 <fd74e77c-f3d3-1f09-2e5a-0a94e2a3eeea@linux.intel.com>
 <5e34eadc-ef6a-abeb-6bce-347593c275b7@linaro.org>
 <dd61f44e-8d4a-ac2e-0af4-56ced642c4bd@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dd61f44e-8d4a-ac2e-0af4-56ced642c4bd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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

On 21/09/2022 17:25, Pierre-Louis Bossart wrote:
>>>>
>>>> Wait, no, this is correct. Please point to what is wrong in kernel doc.
>>>> I don't see it. :(
>>>
>>> the TRIGGER_STOP and TRIGGER_PAUSE_PUSH do the same thing. There is no
>>> specific mapping of disable() to TRIGGER_STOP and unprepare() to
>>> TRIGGER_PAUSE_PUSH as the documentation hints at.
>>
>> Which TRIGGER_STOP and TRIGGER_PAUSE_PUSH? In one specific codec driver?
>> If yes, I don't think Slimbus documentation should care how actual users
>> implement it (e.g. coalesce states).
> 
> In both of the patches you just modified :-)

Yeah, but this is just some implementation. How this implementation
calls, e.g. whether they split STOP from PAUSE is not the concern of
Slimbus.

> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 06c6adbe5920..d2548fdf9ae5 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct
> snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		slim_stream_unprepare(dai_data->sruntime);
>  		slim_stream_disable(dai_data->sruntime);
> +		slim_stream_unprepare(dai_data->sruntime);
>  		break;
>  	default:
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index f56907d0942d..28175c746b9a 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -1913,8 +1913,8 @@ static int wcd934x_trigger(struct
> snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		slim_stream_unprepare(dai_data->sruntime);
>  		slim_stream_disable(dai_data->sruntime);
> +		slim_stream_unprepare(dai_data->sruntime);
>  		break;
>  	default:
>  		break;
> 
> the bus provides helpers to be used in well-defined transitions. A codec
> driver doing whatever it wants whenever it wants would create chaos for
> the bus.

True, but it's the problem of the codec, not the Slimbus.

Best regards,
Krzysztof

