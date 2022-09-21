Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B635C00BB
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 796291614;
	Wed, 21 Sep 2022 17:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 796291614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663772875;
	bh=PJA5PJ0QUEjX5QUMOV6Lq3ccm4CR6epwvaKflnoUINo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDJ42Bk7tMoGufLhdZAcpA9SB3VBTvFruYivtn3dXzomGJevIfz+E2OpqyS49Gfsp
	 1ZgWBdS/t+G4fUT9iTeYWsZQRVN6cxkljAy1/9Q0H73KgxS/vjTg5Vlz2d1KAuIS2X
	 GYeC9j35BG+HjbRgHHIvwPvqZ8gKglvWFkKjPUZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFA2F800F3;
	Wed, 21 Sep 2022 17:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D48E9F80256; Wed, 21 Sep 2022 17:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C90BF800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C90BF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ff422eHa"
Received: by mail-lj1-x235.google.com with SMTP id b6so7348735ljr.10
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=tJKrtCSfY5+gXFH9PIdDK9WMlvI30WQos0mPVhqlA9o=;
 b=Ff422eHalDyP9HUwFztILx1z91A9EzHUWkCChcEhFzC5Kd/eINPusYDhHHVwbl7Ave
 qKEQ09muCSC9VySNZDRt1jLzzSdQrxTvMNapx247RDG4sjks1I9rrTvZ4YyAX3L8rW9W
 h2RiTiHUviGcbPX3j1ImQOVIP3mG9aeXzcH2ZsZruI+JwnTJrGYVo3Q5zSPXzxuyCTtC
 NtyN6P3my+hVhZQ7d3Y9auX+15WDgq1sgYezKSSDqC5bDrH6bvVQC1s3t/H+KlQmnY8B
 5fXbG7C2ZLQeb9JSjYeqVgi4iLveddlIMB/E2WSlPHTI8/e/kt0V2XsHI7A/QzBIvQRS
 xWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tJKrtCSfY5+gXFH9PIdDK9WMlvI30WQos0mPVhqlA9o=;
 b=qcGW+DOuyh3kJ654Q6SRbrBSTUG02R3IHT9ZVawIUFisXj2kx8teVBrIISyDW/oZoU
 QZSLEmXVwe2RwAwpOIQgF3sRMmrCVioElM6sZbjuWD54nA3tgvLsUjLkCBG4TA+ZKzEd
 e6YaT4qfdfz1SIeDcxf15tsu6J5OEwh3cd2tAsaSjqxg784+leaMQQgbuO6mh0R9ykx7
 S4b2vqj+PalJm6syf9xkpolqNi4het38KHMvlrAoNwhZADYMIXrzMBmg1KgfI2Z2fhYj
 D1TcWtnVhkfAnCvuSAVNKOXLb98YyNLlhIzaYcyE8sYNPrpCjHKKlDuJ+FPssx2nLXXf
 ELhg==
X-Gm-Message-State: ACrzQf0SZOeQO0EoyRcbnzZtK4GD3j3xvAD1Tv6Jz/NgQcScxvWtEsNk
 BPImNIrMVM3vBG2Fs8i3laWAGA==
X-Google-Smtp-Source: AMsMyM42X8A4oTmPBQ8Y36y0GUkP2BOkeRURa4f8MnioUONe4PO9EGGNr6bkOkpgO2WreFDeLMyUXw==
X-Received: by 2002:a05:651c:11cc:b0:26c:14c5:5b8f with SMTP id
 z12-20020a05651c11cc00b0026c14c55b8fmr9141160ljo.450.1663772811163; 
 Wed, 21 Sep 2022 08:06:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v4-20020a2e9f44000000b0026ac7cd51afsm477050ljk.57.2022.09.21.08.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 08:06:50 -0700 (PDT)
Message-ID: <af3bd3f4-dcd9-8f6c-6323-de1b53301225@linaro.org>
Date: Wed, 21 Sep 2022 17:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
 <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
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

On 21/09/2022 17:05, Pierre-Louis Bossart wrote:
>> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
>> index 06c6adbe5920..d2548fdf9ae5 100644
>> --- a/sound/soc/codecs/wcd9335.c
>> +++ b/sound/soc/codecs/wcd9335.c
>> @@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
>>  	case SNDRV_PCM_TRIGGER_STOP:
>>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> -		slim_stream_unprepare(dai_data->sruntime);
>>  		slim_stream_disable(dai_data->sruntime);
>> +		slim_stream_unprepare(dai_data->sruntime);
> 
> This looks logical but different from what the kernel doc says:
> 
> /**
>  * slim_stream_disable() - Disable a SLIMbus Stream
>  *
>  * @stream: instance of slim stream runtime to disable
>  *
>  * This API will disable all the ports and channels associated with
>  * SLIMbus stream
>  *
>  * Return: zero on success and error code on failure. From ASoC DPCM
> framework,
>  * this state is linked to trigger() pause operation.
>  */
> 
> /**
>  * slim_stream_unprepare() - Un-prepare a SLIMbus Stream
>  *
>  * @stream: instance of slim stream runtime to unprepare
>  *
>  * This API will un allocate all the ports and channels associated with
>  * SLIMbus stream

You mean this piece of doc? Indeed looks inaccurate. I'll update it.

Best regards,
Krzysztof

