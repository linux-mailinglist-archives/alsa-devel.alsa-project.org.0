Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4470A218422
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 11:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E297086E;
	Wed,  8 Jul 2020 11:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E297086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594201640;
	bh=9L5ap9izPNMR0XbDracv2VPotJ0eEWw3qGR0UXDlkw8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZNeMdBs56V/Ciiui9s0lhWO8OIeTFXVM3jyesu7PrmwJ+7QOLJ8lORFFnGPlKoCH
	 axSjA3yv5Hd5a6rcxk7vkSN5Gb0NwdiExn7UpkmGcslLFrVn0sgd+LIdLr1XHLA3yr
	 7LPZwLj3Gx1K2FwEA7QNUtaJ/W1Ie+IF1PuSMA0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F0DF802BD;
	Wed,  8 Jul 2020 11:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF98F802A9; Wed,  8 Jul 2020 11:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE60F8015D
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 11:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE60F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eeQgPn+a"
Received: by mail-wr1-x441.google.com with SMTP id k6so48172387wrn.3
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=28TRzizaHBVpjH6czUv7ZtbAVDNr9yU2x2TvbmxMq78=;
 b=eeQgPn+a90jRBRUN0qWGh9W9OdKK9z446y/+iUDQtB37paKO5BrdXOEFvVmfJJl3sZ
 Y2uYynUIpfiDPWCtPkVB5ALF+mvaHUTaJWvy5+BFNJ80K9PiVJOR4vduykMQak6JZkGC
 giWqOp+dJ8oew4W993KAwHTGgWMmrJkZJRqaTFawiwA3V5MPktfYP60VBfLxuU2bHbzX
 tGuUgErzXdVj8ZRk+pMrkUDBi9O3EsOA76QE+KKHxvv+lB7tXOliRy3xWmixkM385tQ5
 x1bSaBj8vCPCQC9UFFBQszr3+8eB8G7or5nwtf4pjtg+y5Ox44W1yVeYIj0d6FZnSEo8
 ULBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=28TRzizaHBVpjH6czUv7ZtbAVDNr9yU2x2TvbmxMq78=;
 b=Han3Q4A5lZrCjfs3gUWwyjpp0Z28lmHCuhUPGG1sUCw08abP/J1iTihi0OGEnuOxjK
 14lta85vqV0E4VVm76W1S6Y+WuHrKDrbLX8qzLBO0QLyaaMVtXsABYZ6bNfabyivZBS5
 OYlYYtZ0UpZMbNYCraXVKqeNDRFY2M2amZRX4CAJYA/hrbDiFopmKknwSRpLC/xnQgiy
 DGwTXiqTJr7m5plQTSAzh1k92X5vxtK/Jeuuw/lJ+GBxruN+entaFT8UkBY2fRfqW4ne
 FOWU3pFe+D77PXx1XjOwVouG8So2eZxZElgiI6K5LPC01fRqd1CeNXn5ptREYHVP9O/+
 f7gg==
X-Gm-Message-State: AOAM533zpm09FlIYZFbD09dIYicr0zj72X2a02REivOwC/Biqr0VtjkT
 D6mAmNaM6zOltCpkBUeZoIGQoQ==
X-Google-Smtp-Source: ABdhPJwm1lt3Qt9DvGjT5KOrVNSqCsDaKUpYSqtqUMEKvXpLKrFkzTQ9W3GnGGDp/sjHQemaY7gRTw==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr57503290wrw.19.1594201473237; 
 Wed, 08 Jul 2020 02:44:33 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a22sm4788792wmb.4.2020.07.08.02.44.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jul 2020 02:44:32 -0700 (PDT)
Subject: Re: [PATCH 07/11] ASoC: q6asm: add support to gapless flag in asm open
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-8-srinivas.kandagatla@linaro.org>
 <b05e5503-6a47-5b52-1339-f1243d952cea@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b2738e18-ba99-978a-0fef-395ad9428cc6@linaro.org>
Date: Wed, 8 Jul 2020 10:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b05e5503-6a47-5b52-1339-f1243d952cea@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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


Thanks Pierre for review,

On 07/07/2020 17:57, Pierre-Louis Bossart wrote:
> 
>> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c 
>> b/sound/soc/qcom/qdsp6/q6asm-dai.c
>> index c3558288242a..8c214436a2c2 100644
>> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
>> @@ -258,7 +258,7 @@ static int q6asm_dai_prepare(struct 
>> snd_soc_component *component,
>>       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>           ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
>>                          FORMAT_LINEAR_PCM,
>> -                       0, prtd->bits_per_sample);
>> +                       0, prtd->bits_per_sample, false);
> 
> nit-pick: it's a bit ironic that is_gapless is false for PCM, when there 
> is no gap in the first place..

I think this is to do with same apis reused for both compressed and pcm.

Probably we can live with it for now!

--srini
> 
>>       } else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>>           ret = q6asm_open_read(prtd->audio_client, prtd->stream_id,
>>                         FORMAT_LINEAR_PCM,
>> @@ -685,7 +685,7 @@ static int q6asm_dai_compr_set_params(struct 
>> snd_soc_component *component,
>>       if (dir == SND_COMPRESS_PLAYBACK) {
>>           ret = q6asm_open_write(prtd->audio_client, prtd->stream_id,
>>                          params->codec.id, params->codec.profile,
>> -                       prtd->bits_per_sample);
>> +                       prtd->bits_per_sample, true);
