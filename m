Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504AD91BA55
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 10:47:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6132365;
	Fri, 28 Jun 2024 10:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6132365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719564442;
	bh=EGFnHbSq906N7oKz8YVogJ5qSEDCTeL+B05y5ftPt7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DKZi7RolCzYibei5YqMT6x56XdRA1Jb3DBEvoTsis3FM5NyfT8xmg2vaWoz331mDF
	 aSbJFuKEb70zPBBmq6luFkOqgqAtW/9FOoTOvA3NYkZTb5sAIP+tbmQrTGXqG5IJS9
	 /8b2ynj9s4tU3lXn8H0lI2GANHM2RtXMD5hC6ALA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C829F805E3; Fri, 28 Jun 2024 10:46:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E99B1F805D9;
	Fri, 28 Jun 2024 10:46:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ABD0F80495; Fri, 28 Jun 2024 10:42:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1B21F80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 10:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B21F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rtrfRLDW
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so296371f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563950; x=1720168750;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=faqJLGcrHT2qoREGOCBGB7RrfwX4OicRX63fHXTW6pE=;
        b=rtrfRLDWz+Xfcx5OR3Op5dGeaEsX30RdCIZWE5BeZ+MuIWU8GhM3Hhi2x3+swdBPfB
         7Rs4NZMOCVssDH3XWO3MxJAP48SVYmQEpCYakh6/Ctlv4yMnsfAYMwYU+THXalT2qbh3
         BlCvMqx2ykIEpN4b0Anm3QwBz+NutomPVuEAfEkSjqN7ljtQr8b+7STcA9K6jj5gm8gA
         pEled8Sj/vZ1X2HzQvqoQT86//BqdTDXuEB36EKYdK3CTNhvBIPAj8fCVIv4Ml8t2Jz7
         K0AmAL693OVmVljvwPOiskGA+2G7kolc64MAlsG1CqAR1gdTXWNd2SnWW2S/MN7gwz23
         03zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563950; x=1720168750;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faqJLGcrHT2qoREGOCBGB7RrfwX4OicRX63fHXTW6pE=;
        b=bdIYNZEE3EFoAyG5IzMv/TUt7MStZxdvHMlC6RINqNI6uJVZqTe/SyrvXmCRqSZmuf
         exuG042ZTXI6dRAliidw5VeAEq/as0ahJE9XJ0efVStGWicMWYseQ33V8ssqoH/vNjbR
         kSoPx9CsTN6ekWaZKxRiQrtGdq3Aq9283PtHPv/mrAWH4t1p2VFRsd3VaEzwTQOEBLGO
         xEpP+ezzSWLvJG7yv5WQeQFhjhycNY7kDXnunQmz1Ky+t32vJNHz55eAPjHOm0omM3KS
         sE3mGrGYYz+qF5naUcXSXgE8kfqciJOpTN9sMXgriFDVXWUhVO+eIjrsSRuHz/mkgGic
         ztMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO//+Gz6MUlJ5GhjOcsGJaJN3MSInX1FX8Sc+zKT2V5xVM8NpWFB3SqMnvLsOjunVOP8NspdVYPAwBJTbqGvKy6y6uL+rMBMsT26I=
X-Gm-Message-State: AOJu0YycYY3Kuw8LjF5vclF4bdupUERTq3c5gPniowQBkW1U384zSPMm
	0574s748cOYiW+FkL98wy5b+g3x9D6h23Ghfcm3GEYSGMj+PkL9hWxLrrFkWdM8=
X-Google-Smtp-Source: 
 AGHT+IELQxuYpftb3+KWM7ekBkKk8cPpFjpXUPU8A6q1t+Fd7TYbD9yzJlZyXvV8OhGPzdBLyOQoJA==
X-Received: by 2002:a5d:59a5:0:b0:366:e685:d0cb with SMTP id
 ffacd0b85a97d-366e685d27dmr13937863f8f.6.1719563950170;
        Fri, 28 Jun 2024 01:39:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e1481sm1547640f8f.55.2024.06.28.01.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 01:39:09 -0700 (PDT)
Message-ID: <1fa1da22-07a5-4d76-b4c7-fc16e3df4b32@linaro.org>
Date: Fri, 28 Jun 2024 10:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
 <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <grpb57rhum4auor3n66mqd2tpmd52gzofbdog3vlmxlamfxv5a@2mhfkigl6ek2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X62TPQPN24PYS776M24REEYEK3CZD6DK
X-Message-ID-Hash: X62TPQPN24PYS776M24REEYEK3CZD6DK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X62TPQPN24PYS776M24REEYEK3CZD6DK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/06/2024 10:34, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 05:23:44PM GMT, Krzysztof Kozlowski wrote:
>> The driver has static 'struct regmap_config', which is then customized
>> depending on device version.  This works fine, because there should not
>> be two devices in a system simultaneously and even less likely that such
>> two devices would have different versions, thus different regmap config.
>> However code is cleaner and more obvious when static data in the driver
>> is also const - it serves as a template.
>>
>> Mark the 'struct regmap_config' as const and duplicate it in the probe()
>> with devm_kmemdup to allow customizing per detected device variant.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index 59fe76b13cdb..3d8149665439 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
>>  	return rx_is_rw_register(dev, reg);
>>  }
>>  
>> -static struct regmap_config rx_regmap_config = {
>> +static const struct regmap_config rx_regmap_config = {
>>  	.name = "rx_macro",
>>  	.reg_bits = 16,
>>  	.val_bits = 32, /* 8 but with 32 bit read/write */
>> @@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
>>  static int rx_macro_probe(struct platform_device *pdev)
>>  {
>>  	struct reg_default *reg_defaults;
>> +	struct regmap_config *reg_config;
>>  	struct device *dev = &pdev->dev;
>>  	kernel_ulong_t flags;
>>  	struct rx_macro *rx;
>> @@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
>>  		goto err;
>>  	}
>>  
>> -	rx_regmap_config.reg_defaults = reg_defaults;
>> -	rx_regmap_config.num_reg_defaults = def_count;
>> +	reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
>> +				  GFP_KERNEL);
>> +	if (!reg_config) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>>  
>> -	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
>> +	reg_config->reg_defaults = reg_defaults;
>> +	reg_config->num_reg_defaults = def_count;
>> +
>> +	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
>>  	if (IS_ERR(rx->regmap)) {
>>  		ret = PTR_ERR(rx->regmap);
>>  		goto err;
>>  	}
>> +	devm_kfree(dev, reg_config);
>>  	devm_kfree(dev, reg_defaults);
> 
> Seeing devm_kfree in the non-error path makes me feel strange. Maybe
> it's one of the rare occasions when I can say that __free is suitable
> here.

These would have a bit different meaning in such case. The __free would
not clean it in this spot, but on exit from the scope. I wanted to
kfree() here, because the config (and reg_defaults) are not used by past
regmap_init. I mentioned it briefly in previous patch msg.

To me this code is readable and obvious - past this point nothing uses
that allocation. However maybe instead of devm(), the code would be
easier to read if non-devm-malloc + __free()?

Best regards,
Krzysztof

