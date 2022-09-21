Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3005C00C7
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8B9163E;
	Wed, 21 Sep 2022 17:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8B9163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663772947;
	bh=JdNRQvU13m5qN4+hrkeGKOZgpyrC/B4tflMVXNw6rnY=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZt+gNpirQWJ/4lmEEm+/bMVxHmsUnnaS2vL1fa5jr57G56NKJ7rxTzcN1doNFjgD
	 CQY9T35RaYYBdWz6D8q/tJ+CkKkkaGGvtQi3Tg4dNFheJ7tzQ8HTGjlY602gmvPXts
	 dpZR0tFzy4b4B+D1c5T1z8CKz0bTMPiydDAgBXW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42206F8047C;
	Wed, 21 Sep 2022 17:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0AF2F80256; Wed, 21 Sep 2022 17:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC2F2F800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC2F2F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Bgb+iEOe"
Received: by mail-lf1-x134.google.com with SMTP id a2so9722969lfb.6
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RF9pE1XqBaCkFujXuhCj/YrM4VUzgwG2BT/TUrX/TQs=;
 b=Bgb+iEOe9wB7sYiTFOX2L4NoZHqArQD+KjhaktUTxRoqMOR7ETeLMVom22TQH6w/iB
 at55Y30/CDPtMsNUDzLUpckengtH+aKcMBIUymjHumbY5Wyqaq4CDTJ6UyZugqvxcnj/
 NroVkcIrCvjn0eqE1R2xRIBlHp3dwf2WitEcDT1INMmzOnM6rAr77ER65QARn2u/0B/N
 PGDyD5ShJI9cTZMDm5w8mwaxoJgTZoCC7imKOxKrPgNNIvHPHUPEBQ4ow1gubY17I5P9
 7uwYXQjX/eVZaYXKQ9804Jk266dh3Pibzjpdv7j4CZvS+IQmIacT3wih3O3X3YGtqpmp
 Tujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RF9pE1XqBaCkFujXuhCj/YrM4VUzgwG2BT/TUrX/TQs=;
 b=xA83VxaCMwm01DWAmduj4t0+fzoDMsjklzKMKCZpbveS84eOa8BlVAlfQsV57aQsYY
 a3d2WkGwUFfqMM5+SLsFkYZtr4aTb8pu2GUSIK2ZFY67JKS7UddVgHDbc9SpiEIVTq5T
 7g9iR1fv+k22dVtuS8LRz6GjmghVrCuLpHol6PKdLdzaE0UiYIkSueKPqKgLIW5JrNk+
 f5uXqBLGP/FsIUXVaRRA/mKUaRmVeNR+pdFj4feDL1UKCzlOXQplxipNi2ylKuqld6rY
 EcRygOkct4vgDpxe8aePNyvIEJxrf5OAC+tAKcTXLEYevEhCMZrQRwT7c2gc1NmIU/Nv
 ID4w==
X-Gm-Message-State: ACrzQf0n8ycQ4k9tjG+HcY0eX1vlvo3jWJa1S0wPM6e93oznZGQbA4XI
 RXzJKeCjEGlvWLt5WaYrm8b5vA==
X-Google-Smtp-Source: AMsMyM6LiMMw9ZyS7tgrWaPytuR+QBRjPIZREoDo1FdiuatxHS0wsN9I/0scWOUEj/XR3+sFYsn3pA==
X-Received: by 2002:ac2:52b1:0:b0:499:f7ac:14da with SMTP id
 r17-20020ac252b1000000b00499f7ac14damr11247218lfm.597.1663772881791; 
 Wed, 21 Sep 2022 08:08:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b0049f9c732858sm462533lfg.254.2022.09.21.08.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 08:08:01 -0700 (PDT)
Message-ID: <9a210b04-2ff2-df98-ad1a-89e9d8b0f686@linaro.org>
Date: Wed, 21 Sep 2022 17:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
 <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
 <af3bd3f4-dcd9-8f6c-6323-de1b53301225@linaro.org>
In-Reply-To: <af3bd3f4-dcd9-8f6c-6323-de1b53301225@linaro.org>
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

On 21/09/2022 17:06, Krzysztof Kozlowski wrote:
> On 21/09/2022 17:05, Pierre-Louis Bossart wrote:
>>> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
>>> index 06c6adbe5920..d2548fdf9ae5 100644
>>> --- a/sound/soc/codecs/wcd9335.c
>>> +++ b/sound/soc/codecs/wcd9335.c
>>> @@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
>>>  	case SNDRV_PCM_TRIGGER_STOP:
>>>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>>>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>> -		slim_stream_unprepare(dai_data->sruntime);
>>>  		slim_stream_disable(dai_data->sruntime);
>>> +		slim_stream_unprepare(dai_data->sruntime);
>>
>> This looks logical but different from what the kernel doc says:
>>
>> /**
>>  * slim_stream_disable() - Disable a SLIMbus Stream
>>  *
>>  * @stream: instance of slim stream runtime to disable
>>  *
>>  * This API will disable all the ports and channels associated with
>>  * SLIMbus stream
>>  *
>>  * Return: zero on success and error code on failure. From ASoC DPCM
>> framework,
>>  * this state is linked to trigger() pause operation.
>>  */
>>
>> /**
>>  * slim_stream_unprepare() - Un-prepare a SLIMbus Stream
>>  *
>>  * @stream: instance of slim stream runtime to unprepare
>>  *
>>  * This API will un allocate all the ports and channels associated with
>>  * SLIMbus stream
> 
> You mean this piece of doc? Indeed looks inaccurate. I'll update it.

Wait, no, this is correct. Please point to what is wrong in kernel doc.
I don't see it. :(

Best regards,
Krzysztof

