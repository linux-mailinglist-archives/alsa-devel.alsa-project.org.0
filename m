Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67F958953
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45EA582B;
	Tue, 20 Aug 2024 16:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45EA582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724164248;
	bh=lXEEDwRzoFc+Xn7QACfiLEhpgAwRwq2ArplWqB3K3Zo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b7iVx8zs49oeqX0s4tlcamQ68RJWn+7wdFfPhLQCG/t9kmdUr/gMfg7FiWgd8qawA
	 gBYxvuRPIN85TLiQaA1kamQhrtGl9Qalyo6HamRe+gJ5E6i6KsTYuppvL72S5vfQN3
	 YxYIKBLRjgNKNT66syGW+yHBLSA9qEYtG4M/8I6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66882F805EF; Tue, 20 Aug 2024 16:29:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38766F805E3;
	Tue, 20 Aug 2024 16:29:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 807F5F80494; Tue, 20 Aug 2024 11:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6CC2F8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 11:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CC2F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FVnUadfg
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso61089741fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Aug 2024 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724146818; x=1724751618;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGdzoV4raGjUE/t8kSVhE9E8ZPs0EkYSUtLm853VbOc=;
        b=FVnUadfgXMzoEnmCAM3L3VbbOVQ3JrhA0jfZpNoImJMbTYDQKV+yMG+pYaCX4H2IUa
         xKYdSPaxNzxXYsNWUM1yoClkoBciqZnaCeBc3mhDP12AwzASwM8BbslfpfVZKanTq/Nd
         JrhiNYEQPzksLjKDG03ySq1ml9Tb5YMFc2p6lCvYwqDralbE9QB5B7uS3jQhhK+H85Xi
         7Rpk7tk3yhpP2BWhAnKuPeyznIr8i7uhJiVjid8IAl0EAg3tKtKMutoeh0VmXMGHhnDm
         Ga1TIHPiacybW5j+D2ttUkIQEXEGKGeVusa9MYdC93tZr4QLCRY95aYYQPkJE73/3cnG
         zo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146818; x=1724751618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGdzoV4raGjUE/t8kSVhE9E8ZPs0EkYSUtLm853VbOc=;
        b=A/qXkRDJ/Mipv/v01L00NI1on8tguhT60tn7LUv2aGuPFn0T75pMLqFmhaFpKr5rHE
         y7TvVW8/PlYh1AX8PYesjfz7CNYDF60deDC+W+cn4ypW9GhmHAPqeX1ZHZKMNnZlAcjx
         tiZnJ/vrsEi+eH9/XFDgDC1RYZQcRpStg742sRwB5EQFw04auXdb4GxQ6R7T9dpx8Vm+
         VFnNzFTsB2dxzseVHz8yi9N/D+piIToKP5NuOQ1rlSVrvDF5JmvM+kTzKh8XeJDCnOGs
         g58xbegcKsNcV4vt0/zFSiXUF36Cc8IN3gvq38yGnsLV8qOQ0M/mUAuHDcO5coaM1IMm
         +IEg==
X-Gm-Message-State: AOJu0YzqHOO/SMsUQut1slUyT2Gaejqd2ktvlOl2sDP6o+JOQVU8MMoK
	4+3Tjt3fP4HPwjzEAqSvqgtBOzocFdiulA4Ss+1mglMbjNpvEvWC
X-Google-Smtp-Source: 
 AGHT+IHYRs/auh9A6D5deXi9S3suCxwWcI02PT4Az0n5KToMYJ1uE1P/dVslk8K+8kXcBvwm0tVGsw==
X-Received: by 2002:a05:651c:1545:b0:2ef:2b05:2ab3 with SMTP id
 38308e7fff4ca-2f3be574d67mr103145531fa.10.1724146817182;
        Tue, 20 Aug 2024 02:40:17 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbdfbb4asm6564664a12.52.2024.08.20.02.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:40:16 -0700 (PDT)
Message-ID: <945edee7-f1c4-42ba-b4c6-c600cbdd70cc@gmail.com>
Date: Tue, 20 Aug 2024 11:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
To: Adam Skladowski <a39.skl@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: konradybcio@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XZGHCTDLDFYFWQ6JUISHEDT36H55JGU5
X-Message-ID-Hash: XZGHCTDLDFYFWQ6JUISHEDT36H55JGU5
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:26:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZGHCTDLDFYFWQ6JUISHEDT36H55JGU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31.07.2024 5:25 PM, Adam Skladowski wrote:
> Introduce support for audio card on MSM8976 platform.
> While MSM8976 falls into v1 category with MSM8916, digitial codec clock
> is not available in GCC so we have to set it in machine driver.
> For that reason for V1 clocks new boolean is added to check
> if we need to enable codec clock.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3ed35beb671a..8219d4d55625 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -35,6 +35,7 @@ struct apq8016_sbc_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
>  	enum afe_clk_api q6afe_clk_ver;
> +	bool dig_cdc_mclk_en;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -242,6 +243,16 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
> +	/*
> +	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
> +	 * so we have to request clock from machine driver using V1 API)
> +	 */
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 &&
> +	    data->dig_cdc_mclk_en) {
> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);

Double space here and below

Konrad
