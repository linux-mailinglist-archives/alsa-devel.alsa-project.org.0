Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9C944B15
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9CF40E4;
	Thu,  1 Aug 2024 14:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9CF40E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514492;
	bh=hSVSRrz3fsl8s+TtTum1SWINf7gjHKl5ODNPOppJJBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKGdz1HV2FScdRpAKlrNLxRfaG2VeEFyt5AtQ9+k/6FU3aJGKbmsAhvJrPt4T9j1k
	 G7ih3ikVhxQggycqsMipxikUKJZeaEP5q++C5U5v8EVGKJBrjxG5mEHszmMktSjiiX
	 OKdpzo7jVb7R8TBCGZqRSh5aWApczdJIJ92vN5vM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE8E6F80771; Thu,  1 Aug 2024 14:12:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 614BDF8076C;
	Thu,  1 Aug 2024 14:12:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DC3FF8026A; Thu,  1 Aug 2024 12:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88251F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 12:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88251F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kPObaqEf
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so10916964a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722509262; x=1723114062;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z85y/g+9vb81jKmcafP4dvn4vFmY5QR0yXRNZFSsnR8=;
        b=kPObaqEfoNwR7UFoUtUoAdRJDGMXOEZ2zZUuoinkxgHIXUrMiDZG2pLNTrwpHWFGoL
         lS8MfkjE3hZH69dpjZvTFZEI3YoQ7pqS1iYyhTlZ1qtwU9aBXQn0xhcdnGjXtuYiqVTE
         pkVuZ6esz55JvgmWye5GZgfLeMr0b3e1LB3GcIwq6S8QGG+XVEQkHE7rnwAEZ8UPkwyY
         uVrek+jEde6nxz+EZN97TgK+KB1heObSRGoFMJlnz7qj647hx5U+mibzS9yclBgDsOhN
         S+O29Q0bonV6WhWipVHRFJhotomIAbp8M5oWrc729EbEiFQJ6TfmhuErbxT/B8eJTZg0
         t8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722509262; x=1723114062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z85y/g+9vb81jKmcafP4dvn4vFmY5QR0yXRNZFSsnR8=;
        b=Kwz9uAf/DatXvHmpkjTLlCoitcQiwS6qh663znk8zfSr4P5R1RfkSzdHYtMbh6WgzR
         GA0LZr1gQfX6KrW84pEI53h12PiHdklW8uxPj8DUyddLAmiSRBvmY84gIUrgQ8l5IZ9x
         8qZW/xjRsKreBwUATce+Q8mQXRAOVYPdkWevfwFCv4Eoxy8bvvKtO6OfzQKSpXZ1RFZO
         4JtV+CoVk6KJRLQ/aYr5ggmU+7BXkJzrZhbX2Q+6jQoQYXPNV0wkdJ/sNrMbP+vYV5dS
         NBn7mwIWiQgxKC8jqaMWrApCFkqoDFtqemIxxtF+GYS+R5oHoz7PS5VWcK560fag2++R
         XnHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4skieonqfCk8GCspPRGQynwcIqZkHewND1xva4juuKcIbaAWpI51zw24Tbaul4V1YGX0HecY08fJcH1xmYbPk1GNglvNLsXXgyRM=
X-Gm-Message-State: AOJu0YzRN/Q759s7aYJjr9zbKF/nwiCM5r7wlQ0HE+G70uBGbdXEe33P
	Z3YcRUPp1PtyfaCNgOD4fA3pNQI/a3wYw22xNJGRP5/RoepdplU0Q+Z1Ibc88RM=
X-Google-Smtp-Source: 
 AGHT+IETKes+z6wG81VpgxVv6mHim0SINXPJ9ewGaBVr6boePMQ9az0QkbZ1hzXP5XqyWc05zbL4WA==
X-Received: by 2002:a17:906:c108:b0:a7d:391f:17af with SMTP id
 a640c23a62f3a-a7daf65a227mr145607566b.51.1722509261910;
        Thu, 01 Aug 2024 03:47:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:31d2:aeb1:18cd:e482])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de7asm880932766b.66.2024.08.01.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:47:41 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:47:37 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
Message-ID: <ZqtnyWAXTsSGAg0i@linaro.org>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
X-MailFrom: stephan.gerhold@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7EVRCH7QFXB7VZO5PUR7RHLHJW35IAZZ
X-Message-ID-Hash: 7EVRCH7QFXB7VZO5PUR7RHLHJW35IAZZ
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:08:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EVRCH7QFXB7VZO5PUR7RHLHJW35IAZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:30PM +0200, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953 platform.
> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
> supported by firmware which influence way we set codec clocks.
> SoCs shipping on at least msm-3.18 should use v2 clocks.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: rename functions, add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 5a29adbd3f82..3ed35beb671a 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -22,6 +22,11 @@
>  
>  #define MI2S_COUNT  (MI2S_QUINARY + 1)
>  
> +enum afe_clk_api {
> +	Q6AFE_CLK_V1,
> +	Q6AFE_CLK_V2
> +};
> +
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
> @@ -29,6 +34,7 @@ struct apq8016_sbc_data {
>  	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> +	enum afe_clk_api q6afe_clk_ver;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -192,6 +198,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
>  	}
>  }
>  
> +static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
> +{
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
> +		switch (mi2s_id) {
> +		case MI2S_PRIMARY:
> +			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
> +		case MI2S_SECONDARY:
> +			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
> +		case MI2S_TERTIARY:
> +			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
> +		case MI2S_QUATERNARY:
> +			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
> +		case MI2S_QUINARY:
> +			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
> +		default:
> +			break;
> +		}
> +	}
> +	/* If AFE CLK isn't V2 return V1 */
> +	return LPAIF_BIT_CLK;
> +}
> +
>  static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> @@ -215,7 +243,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>  	return ret;
> @@ -236,7 +264,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	if (--data->mi2s_clk_count[mi2s] > 0)
>  		return;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
>  }
> @@ -265,10 +293,12 @@ static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  {
>  	struct snd_soc_dai_link *link;
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
>  	int i;
>  
>  	/* Make it obvious to userspace that QDSP6 is used */
>  	card->components = "qdsp6";
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
>  
>  	for_each_card_prelinks(card, i, link) {
>  		if (link->no_pcm) {
> @@ -279,6 +309,14 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	msm8916_qdsp6_add_ops(card);
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
> +}

Is there a particular reason why you decided to hardcode the
q6afe_clk_ver for the SoCs rather than finishing up the dynamic
detection Otto proposed [1]?

This works for MSM8953 but there are a few SoCs like MSM8909 where
both clock API versions exist (depending on the firmware versions).
If we want to support them at some point, we will need the dynamic
detection anyway. It would be nice to finish up that patch set.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20231029165716.69878-1-otto.pflueger@abscue.de/
