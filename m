Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F1219D08
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FBCD1658;
	Thu,  9 Jul 2020 12:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FBCD1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594289325;
	bh=L+Guaq4v3dmWSgmiT9HtBMhpuV4VcnQJt++P5sC0jtM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBuiObIxP9pA3AXRjiecuOPYI58+6K38pHU7wClesrdLXNf54bEULAJQZZo4pa2s4
	 Vdyp5qzsswzUSpa5KDceN5JWssVd61tyfZJpJHUKj4KvjyPfNWjrJueZXX4y8ca0Bf
	 zi3QKYg1LD/0ukvhB1ajvh718CqTD3CWbl9lIH5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A5BF8011F;
	Thu,  9 Jul 2020 12:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B7B3F801F9; Thu,  9 Jul 2020 12:07:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02A09F800AE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02A09F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pUotuoYO"
Received: by mail-wm1-x341.google.com with SMTP id o8so1190469wmh.4
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 03:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mgJE0XoR5d83uGU1jCZHB+PytvN1N1Tmw76/eTcxBew=;
 b=pUotuoYOUIxjOoIzicmjbFiylS68wnrKTegL+jEsjCt0D85yzccOwtkSD3tc4tujEx
 SdokhcM9zFdv3aB4EXOyUzjXE4sHo62CmbSGPMy2lyrRhYt5ChcEg6QA7imGGuq3q0wG
 OOj2oyT6JWzBNNt3jrOrNzeZ8wZzYVGa2Ma8RZC2x08Q/oRKerEgI2HtVs51afftopy1
 nsXscmRzQCLQ2pFrQJasVzsJ/68WaK83El5rhn3r9sDerpmg9c4NdNyfzaVcW4uO3/kS
 2iCd+fH40EhNdYRxWi4BG+DMHuzKWpjWApOkrADA1bg5gSWfV4k2ghmNWQRE0EMDx6Qb
 GROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgJE0XoR5d83uGU1jCZHB+PytvN1N1Tmw76/eTcxBew=;
 b=rdbkufJGGFu5I0AD0hcVG/bApw1QAGPghK1L/q9t8AFVMZ6Pp6+bs4pX5czqDyYpxr
 WdUNQy1/0yKpMEzk/tefi68FXjgvhec56QgLA14LNFoju7RR2/JSbUtJDeuXqC4DkC6O
 Ii2tXy3tnbgHvKp5MVEfXHqLYLpdZWqbQoJpmuWC/0GqnUrawLGo/jPkIrN/jmmiM3mE
 u5N2Fvx76IeCyY6Y1dpsZSdbj8v0GEc3Hv4+QRpN2UGGteANwj8VoaVQ5EaM3fUO9iJv
 pFPLVtZswz/dhjuFXxONFP/8dT5mFon2jL/JV8G3nLsPBwsXABNmNOxHgbq2O5XqZstr
 g6ew==
X-Gm-Message-State: AOAM531EUdJvDQKdfTAd40/shx11djNeBSJngyKWUA3z4XnLBvcAOWi5
 hgoBibJtqK0ZC+8hTJ+w9cITZg==
X-Google-Smtp-Source: ABdhPJzPmNy+2MBiwjS9kosjLSQW6esYGN0duAec40gVAKhLEMzHgAAEWYwQkfwWdJULE2AraSgX+w==
X-Received: by 2002:a1c:2041:: with SMTP id g62mr13205469wmg.172.1594289214586; 
 Thu, 09 Jul 2020 03:06:54 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c11sm3675543wmb.45.2020.07.09.03.06.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:06:53 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] ASoC: qcom: lpass: Use regmap_field for i2sctl and
 dmactl registers
To: Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-4-git-send-email-rohitkr@codeaurora.org>
 <a59dc25f-cac2-5540-f1f4-78fd749c65c9@linaro.org>
 <3b849440-091e-bbd3-4944-8a196e181af7@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ac634d4d-527a-7262-2744-203c04ee0982@linaro.org>
Date: Thu, 9 Jul 2020 11:06:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3b849440-091e-bbd3-4944-8a196e181af7@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 09/07/2020 10:57, Rohit Kumar wrote:
> Thanks Srini for reviewing.
> 
> On 7/9/2020 2:56 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/07/2020 06:08, Rohit kumar wrote:
>>> I2SCTL and DMACTL registers has different bits alignment for newer
>>> LPASS variants of SC7180 soc. Use REG_FIELD_ID() to define the
>>> reg_fields in platform specific file and removed shifts and mask
>>> macros for such registers from header file.
>>>
>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>
>> Thanks Rohit for doing this, this looks much better now!
>> I have few minor comments..
>>
>>> ---
>>>   sound/soc/qcom/lpass-apq8016.c   |  24 ++++++
>>>   sound/soc/qcom/lpass-cpu.c       | 163 
>>> +++++++++++++++++++++++----------------
>>>   sound/soc/qcom/lpass-ipq806x.c   |  24 ++++++
>>>   sound/soc/qcom/lpass-lpaif-reg.h | 157 
>>> +++++++++++++++++++------------------
>>>   sound/soc/qcom/lpass-platform.c  | 151 
>>> +++++++++++++++++++++++++++---------
>>>   sound/soc/qcom/lpass.h           |  53 +++++++++++++
>>>   6 files changed, 398 insertions(+), 174 deletions(-)
>>>
>>
>> index f0c7e93..f358d12 100644
>>> --- a/sound/soc/qcom/lpass-cpu.c
>>> +++ b/sound/soc/qcom/lpass-cpu.c
>>> @@ -29,6 +29,32 @@
>>>   #define LPASS_CPU_I2S_SD0_1_2_MASK    GENMASK(2, 0)
>>>   #define LPASS_CPU_I2S_SD0_1_2_3_MASK    GENMASK(3, 0)
>>
>>
>>>   }
>>>   -static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream 
>>> *substream,
>>> -        struct snd_soc_dai *dai)
>>> -{
>>> -    struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
>>> -    int ret;
>>> -
>>> -    ret = regmap_write(drvdata->lpaif_map,
>>> -               LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
>>> -               0);
>>> -    if (ret)
>>> -        dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
>>> -
>>> -    return ret;
>>> -}
>>
>> Any particular reason why this function remove
> 
> This was causing issue in playback/capture concurrency. It sets I2SCTL 
> register value to 0
> 
> when usecase ends. However, playback/capture specific bits are already 
> cleared during trigger() stop
> 
> function. So, this is not needed.

This should be sent as separate fix with fixes tag!

> 
>
>>
>>> diff --git a/sound/soc/qcom/lpass-lpaif-reg.h 
>>> b/sound/soc/qcom/lpass-lpaif-reg.h
>>> index 72a3e2f..5258e60 100644
>>> --- a/sound/soc/qcom/lpass-lpaif-reg.h
>>> +++ b/sound/soc/qcom/lpass-lpaif-reg.h
>>> @@ -12,15 +12,12 @@
>> ...
>>>   #endif /* __LPASS_LPAIF_REG_H__ */
>>> diff --git a/sound/soc/qcom/lpass-platform.c 
>>> b/sound/soc/qcom/lpass-platform.c
>>> index 34f7fd1..445ca193 100644
>>> --- a/sound/soc/qcom/lpass-platform.c
>>> +++ b/sound/soc/qcom/lpass-platform.c
>>> @@ -50,6 +50,53 @@ static const struct snd_pcm_hardware 
>>> lpass_platform_pcm_hardware = {
>>>       .fifo_size        =    0,
>>>   };
>> ...
>>>   static int lpass_platform_pcmops_open(struct snd_soc_component 
>>> *component,
>>>                         struct snd_pcm_substream *substream)
>>>   {
>>> @@ -59,9 +106,9 @@ static int lpass_platform_pcmops_open(struct 
>>> snd_soc_component *component,
>>>       struct lpass_data *drvdata = 
>>> snd_soc_component_get_drvdata(component);
>>>       struct lpass_variant *v = drvdata->variant;
>>>       int ret, dma_ch, dir = substream->stream;
>>> -    struct lpass_pcm_data *data;
>>> +    struct lpass_pcm_data *data = NULL;
>>>   -    data = devm_kzalloc(soc_runtime->dev, sizeof(*data), GFP_KERNEL);
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>
>> Does this change belong in this patch?
> 
> 
> As part of this change, I fixed memory leak too by adding kfree() in 
> close()
> 
> However, this was causing issue as memory was allocated using 
> devm_kzalloc().
> 
> Should I move it to different patch?

That would be the right thing to do, can also add fixes tag!


> 
>>
>>>       if (!data)
>>>           return -ENOMEM;
>>>   @@ -111,13 +158,13 @@ static int lpass_platform_pcmops_close(struct 
>>> snd_soc_component *component,
>>>       struct snd_pcm_runtime *runtime = substream->runtime;
>>>       struct lpass_data *drvdata = 
>>> snd_soc_component_get_drvdata(component);
>>>       struct lpass_variant *v = drvdata->variant;

>>
>> Above two along with rddma members can be removed, these become 
>> redundant after adding regmap field!
>>
> wrdma_channels is used in alloc_dma_channel() to get the channel id.
> 
> Also, both are used for other DMA registers such as LPAIF_RDMABASE_REG,
> 
> LPAIF_RDMABUFF_REG, LPAIF_RDMACURR_REG, etc.
> 
Ah I see we are still using this in lpass_cpu_regmap_writeable!
ignore my previous comments about removing them!

--srini
