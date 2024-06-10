Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B88901B88
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 09:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBC0A741;
	Mon, 10 Jun 2024 09:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBC0A741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718003238;
	bh=/AvsbsUJd/zTGNO42rFXKAiiuS8ZEWlCyClzMR+cMBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dwa/vW8szlLwscaSWZCyCGS/saYyN6Guc/auG1aVq3CIow4YbLke3ADzQq8Yky32s
	 f77HPu1VmDJqvSDvYSSnPz9fvAgp8MgcHTD9LwOhbCt92YEG23V6f5W1Hyy64Lv7cy
	 3uZ8tLaZfNXQ2wyfvaHKjA+lOTyJ4H5C9jd82cfA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4823F80564; Mon, 10 Jun 2024 09:06:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EDAAF80567;
	Mon, 10 Jun 2024 09:06:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD5E4F802E8; Mon, 10 Jun 2024 09:05:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5586F800D0
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 09:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5586F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HH8nXHDN
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57c68c3f8adso2048828a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 00:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718003120; x=1718607920;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPZSLa5VJ9ZJ5ThCXQZcFW6Ti5Z+EHbBJU7SLERjk6Q=;
        b=HH8nXHDNq4W5NjEC5N5LHf3AH7OpTZ7UyP1i2RXcAMeQJN/QAqfAV296Lpg8lC4DbW
         l7Wmklh4kgZhGh1UGqvp4p7L7g2+woWo9ttFMerAGZlXMckNyDXWIkcmmBnEPRuGhW36
         LoMIYxWy2cw+ks7VVf/V+RhvXWLHr41c3b5xoZL9wvP7YoW3lFeXUn+KlQeumVa562nj
         8sdp+zegU7tQux6WOftCcxHiyZ94+rwh9ARaXvhL4fYckfLDyu23SiHT4LHnIar+QwV7
         v790JDuI8iYErpNu4/qE10I+IWife2lkC9VVuhLkHjT6et3t32HR0GwtCsYVkscU8UTm
         j0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718003120; x=1718607920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPZSLa5VJ9ZJ5ThCXQZcFW6Ti5Z+EHbBJU7SLERjk6Q=;
        b=brNYNBC+pvB+bM7vNEUDp2WQ5E83cvXyf8Cr1kadeCPp2g5k5v7XCCMOzxT7AAzBSU
         X6t+r55NSXSDAwQTuQ5L8eGWDCs4yZmOwU6u+9By3w8UHmyTIGvD3e5aTN/CwOBJqbPQ
         WDJzOkW+KPTyjfKBRXn5KSlP0+h1jged/aoqFL7xykxsE9pgF5Cu72bre559OUx5qD6M
         7R04TeSoFNvCQu1cRP8nVr+E7PpDpXUCGHYTH3KAhUlZTVV56N/vP29C4H2ssDlKtnwA
         s9j75D83nGJFFAnrO2/A0wVahgegljeBAtqOrHxjjzn+gJs8sNaGFpbJfFKoNn2lgNXg
         f8YA==
X-Gm-Message-State: AOJu0Yyqbsl2gk8YXDmdjws7qKBsjfWSfPdKXSC9v2pVeAIiaD6jCFyt
	xjPtTByrXRtKq79Bd8rNZTbCNT7tYX77EvzeYBeyCHCBKE3FVYgRbg83dYEWcGs=
X-Google-Smtp-Source: 
 AGHT+IEgv3JegFvQ+6vLGmNwNKNTfnIzW5enFDnscw96CRYsquxgRG1RrvcEtuTnAeCT9o3J9KN8iQ==
X-Received: by 2002:a17:906:4ecd:b0:a6f:7cb:6e76 with SMTP id
 a640c23a62f3a-a6f07cb723emr358812166b.51.1718003120208;
        Mon, 10 Jun 2024 00:05:20 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f2d4138ccsm7698766b.220.2024.06.10.00.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 00:05:19 -0700 (PDT)
Message-ID: <ba911ebd-aef5-46af-ace1-84d13bee6876@linaro.org>
Date: Mon, 10 Jun 2024 08:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v5 6/7] ASoC: codecs: wcd937x: add capture dapm widgets
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 quic_pkumpatl@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240527111956.444425-1-quic_mohs@quicinc.com>
 <20240527111956.444425-7-quic_mohs@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240527111956.444425-7-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3DI6NFUA3ROYEDRNGNJZ5AKVZHB4FDEY
X-Message-ID-Hash: 3DI6NFUA3ROYEDRNGNJZ5AKVZHB4FDEY
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DI6NFUA3ROYEDRNGNJZ5AKVZHB4FDEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/05/2024 12:19, Mohammad Rafi Shaik wrote:
> +static int __wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
> +					  int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	int micb_num;
> +
> +	if (strnstr(w->name, "MIC BIAS1", sizeof("MIC BIAS1")))
> +		micb_num = MIC_BIAS_1;
> +	else if (strnstr(w->name, "MIC BIAS2", sizeof("MIC BIAS2")))
> +		micb_num = MIC_BIAS_2;
> +	else if (strnstr(w->name, "MIC BIAS3", sizeof("MIC BIAS3")))
> +		micb_num = MIC_BIAS_3;
> +	else
> +		return -EINVAL;
> +
See last comment..

> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		wcd937x_micbias_control(component, micb_num,
> +					MICB_ENABLE, true);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		wcd937x_micbias_control(component, micb_num,
> +					MICB_DISABLE, true);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	return __wcd937x_codec_enable_micbias(w, event);
> +}
> +
> +static int __wcd937x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
> +						 int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	int micb_num;
> +
> +	if (strnstr(w->name, "VA MIC BIAS1", sizeof("VA MIC BIAS1")))
> +		micb_num = MIC_BIAS_1;
> +	else if (strnstr(w->name, "VA MIC BIAS2", sizeof("VA MIC BIAS2")))
> +		micb_num = MIC_BIAS_2;
> +	else if (strnstr(w->name, "VA MIC BIAS3", sizeof("VA MIC BIAS3")))
> +		micb_num = MIC_BIAS_3;
> +	else
> +		return -EINVAL;
> +
same..
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		wcd937x_micbias_control(component, micb_num, MICB_PULLUP_ENABLE, true);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		wcd937x_micbias_control(component, micb_num, MICB_PULLUP_DISABLE, true);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

...

>   static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
...> +	/* MIC_BIAS widgets */
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, 0, 0,
Please use shift here like
         SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
         SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,

to avoid doing a string compares on wideget name.

--srini

> +			    wcd937x_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, 0, 0,
> +			    wcd937x_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, 0, 0,
> +			    wcd937x_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +
>   	SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0,
>   			    wcd937x_codec_enable_vdd_buck,
>   			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> @@ -2007,11 +2312,101 @@ static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
>   	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
>   			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
>   
> +	/* TX output widgets */
> +	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("WCD_TX_OUTPUT"),
> +
>   	/* RX output widgets */
>   	SND_SOC_DAPM_OUTPUT("EAR"),
>   	SND_SOC_DAPM_OUTPUT("AUX"),
>   	SND_SOC_DAPM_OUTPUT("HPHL"),
>   	SND_SOC_DAPM_OUTPUT("HPHR"),
> +
> +	/* MIC_BIAS pull up widgets */
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, 0, 0,
> +			    wcd937x_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, 0, 0,
> +			    wcd937x_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, 0, 0,
> +			    wcd937x_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
