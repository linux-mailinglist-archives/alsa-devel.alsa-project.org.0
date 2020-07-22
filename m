Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA40229450
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2FB41657;
	Wed, 22 Jul 2020 11:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2FB41657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595408504;
	bh=coDi2kv6d6oz7B42Q+Mv2Tfc+EI548fKvLU5MIjUX/k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDvmenAaTseSdDdPDTZZYTRG4af0RT+o9Kwds/2N96cnoWwHMsLnxyjRbeNaUA1ym
	 DZQebFKXq0Xinrc7RHrR4mgoiko6Krn//EppOrM1l2KGVkOq5Dm4XplYOmOxTnuYNj
	 H2ndzepg5aQgKI6z693xrVbgzsPHsQBnIJTrcan8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA6EF8014C;
	Wed, 22 Jul 2020 11:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25641F8014C; Wed, 22 Jul 2020 11:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24F24F802BE
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F24F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F8CTMULF"
Received: by mail-wr1-x443.google.com with SMTP id y3so1111295wrl.4
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F5fdDXlwfjwIinCr8su6jkG9d0SAhaK9tLXOO3l7hIE=;
 b=F8CTMULFLzaFjIJ7+GwGlU2MUkJ1AUy0wyKX5EjDTQRi0H7mDwjpZdhr2w7fl993fA
 gPQEqFDtN8Md7QihaN/WgOiTyR4PUX7IK8UMiBa4BIQATy1996tbDMDaQoTj7gTsp6yr
 ka0cb7nMcIHpxihoPxxO4JjzjsRqnjTK8Ao2yOckwYFGzKOLLOJP3dgJ+J5tgT7noQ2z
 MIC9Ns2MIs3bRqR+Ul6yfnvgfZopdO/N95oioHCMbj3nm/S5qn3GRx1TAl5ZoD9pr6KL
 jDx1IFyJ3P6S1ggft6hDordP2BgEn/YnTIzL2vw6e0DY5Kl6XX/6zU9HUpLMCskUeL/E
 PUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F5fdDXlwfjwIinCr8su6jkG9d0SAhaK9tLXOO3l7hIE=;
 b=CaRJPRoxUfTKgshdQhYuhH0dk5HKbhf5Y/IUBLIe0HgwOfaj3uNIzJODDeDrwRqbQd
 GX8G34bl/7uZM3ePFHskpTbjcrTNs7BRPe1blpdkzF5VSx/dTzer0s+KhtYkp3wPBiwM
 Ti6m0JAywFhOB9+7bik6IQ6UNfYjSHhGz2qMWVK44neFrnolSd6y+A8Wg27s+46ggV6q
 eQeFoEGWClcfMtbE0uo2g882L3vHqYZjs6rbsbw/4pVM8ca5zOF7Y6G5fSYhrUGOBUQn
 5uXNiEVr+/C23sE6wstobZ4vj/KYAacU/KWOTHg1iWK0tmPap+rz3tf5UYNVP/SdF1FZ
 rn4w==
X-Gm-Message-State: AOAM531rBYerB5bn2UHqunUFTybqNccnm2S5SlHtakr3b33+e0FXL6II
 vWa0e2/ZSO1Taggqmk8KPSQ97Q==
X-Google-Smtp-Source: ABdhPJz5pnDLlqGufOGNaHfWViUPSnadwn3IJj6U3cxvEwG4ZWCyJKVpmL3uCTm09bH2LYUGThMBjw==
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr32364208wrx.180.1595408393160; 
 Wed, 22 Jul 2020 01:59:53 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 1sm6402337wmf.0.2020.07.22.01.59.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 01:59:52 -0700 (PDT)
Subject: Re: [RFC PATCH v2 6/6] ASoC: q6asm-dai: add support to
 set_codec_params
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
 <20200721170007.4554-7-srinivas.kandagatla@linaro.org>
 <970e7065-4731-e553-f07f-896aaa57c5dc@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <13cb597d-996a-1772-e3db-ffece4a70fb8@linaro.org>
Date: Wed, 22 Jul 2020 09:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <970e7065-4731-e553-f07f-896aaa57c5dc@linux.intel.com>
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



Thanks Pierre for quick review.

On 21/07/2020 21:09, Pierre-Louis Bossart wrote:
> 
> 
> On 7/21/20 12:00 PM, Srinivas Kandagatla wrote:
>> Make use of new set_codec_params callback to allow decoder switching
>> during gapless playback.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6asm-dai.c | 33 ++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c 
>> b/sound/soc/qcom/qdsp6/q6asm-dai.c
>> index b5c719682919..a8cfb1996614 100644
>> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
>> @@ -876,6 +876,37 @@ static int 
>> __q6asm_dai_compr_set_codec_params(struct snd_soc_component *componen
>>       return 0;
>>   }
>> +static int q6asm_dai_compr_set_codec_params(struct snd_soc_component 
>> *component,
>> +                        struct snd_compr_stream *stream,
>> +                        struct snd_codec *codec)
>> +{
>> +    struct snd_compr_runtime *runtime = stream->runtime;
>> +    struct q6asm_dai_rtd *prtd = runtime->private_data;
>> +    int ret;
>> +
>> +    ret = q6asm_open_write(prtd->audio_client, 
>> prtd->next_track_stream_id,
>> +                   codec->id, codec->profile, prtd->bits_per_sample,
>> +                   true);
>> +    if (ret < 0) {
>> +        pr_err("q6asm_open_write failed\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = __q6asm_dai_compr_set_codec_params(component, stream, codec,
>> +                         prtd->next_track_stream_id);
>> +    if (ret < 0) {
>> +        pr_err("q6asm_open_write failed\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = q6asm_stream_remove_initial_silence(prtd->audio_client,
>> +                           prtd->next_track_stream_id,
>> +                           prtd->initial_samples_drop);
>> +    prtd->next_track_stream_id = 0;
> 
> same comment as in the other patchset, the stream_id toggles between 1 
> and 2, it's not clear to me what 0 means.

Valid stream ids start from 1. to achieve gapless we toggle between 1 and 2.

--srini


> 
> off-by-one bug or feature?
