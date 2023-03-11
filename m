Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0B6B5B36
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 12:31:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91F71412;
	Sat, 11 Mar 2023 12:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91F71412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678534283;
	bh=xzIoW7pFQkDGUJ6p5Qz66cJO2CZGrkxdMlV8r5SEEnc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PTS5OshVJX3dnVqmil8kVjt8VlEadRTMQfnjtH7BHQqDLsEF/lHy40BTLyVuzDVbR
	 K03GqNDl1aOM6Kn+ZUvRqxl6wDDmUl2MHBAyKWY+yPHhI7hiFMljacA2ujj83dmBKY
	 ZTovDdMzL95Qzv/TgUqp5vXOUCLGNkz/bqyatpOc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C0E5F80236;
	Sat, 11 Mar 2023 12:30:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98A76F804FE; Sat, 11 Mar 2023 12:28:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DA7DF80482
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 12:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA7DF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y6fhnsSr
Received: by mail-wr1-x42e.google.com with SMTP id l25so7334809wrb.3
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Mar 2023 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678534102;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDMAzPVGWaW2YqhCLxx5Xr14Zn9rwUVyczdQ2OeXd7I=;
        b=y6fhnsSrEgQsstfpWqjDwJogogEcQNx8m4O3ID0vcK44x859+0PjMTdKh7GhBrg8Rv
         oRQmEEetEaW2ijNqSK64ioCBSw4WijTWGxsn8e2gdm5aJcrCMJuHmCwBA0gZ36/4CoID
         vKtVp41kS4+Oj8M1Xuhsnbds1ZFv8noivoMeGD0AdFEUJYJ5ZhA0e8Lpp4PViWvNbKem
         TnlJGCg1e70AxFxViWiG4bHFLWzQdfCHdjLmTj3wjf7Kf8I784AUhkarQ/05BoGqs7If
         nd8HYMeT+eLsnk1gK01/EfSQ3Yvk3NVp7X/nSJ7CmC/Ho4G//iq8lT/NXC2ylOxWZrPL
         Fnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678534102;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDMAzPVGWaW2YqhCLxx5Xr14Zn9rwUVyczdQ2OeXd7I=;
        b=6wVmu/leBOcgbFjIHLsC7VUjuEKbCnAncMYpON6MNWB1ZZLLhMYaqLSS4Wb5i4gnrR
         qkLnyXbA8BGgu4mO4kE16BbyKX10gUf80pm4iWhU2iR8pyJqbEZ/acdhOKaj3A0YwaDk
         VJHlSZKljRJ8gVgynyOYDcZfWDlz9+byp7toI+48rqe9bXEZRPCXsAzj7520QBd8qGYb
         wRnUkSAEF2WdLtKjaYPYBHXcDiwgB+tp7l7vt8AySmhg5TRxSFEgY5YnJDRwwfVsgcn5
         8z2b0JbW+TWXgEtOSJvWwF2zOZdw4GIGypQxav1tVfN7gRA0jnLldU/JS98UA+KszK5s
         0Xqw==
X-Gm-Message-State: AO0yUKWIItiFBPmghgaKZOVRaOZKcJdCWT9q8fk00CUQ5GFJOHF/uPSU
	NozzEvT+suqzzuIobaefpS0Fxg==
X-Google-Smtp-Source: 
 AK7set+ILtHB+iI50WOHx6Ly0RIbpaYq3bu/QFN6T1Ki2GT7UvOs3HlFmGpSOYj9IWfqP+TZyP5aog==
X-Received: by 2002:adf:e452:0:b0:2ce:a8a2:37d7 with SMTP id
 t18-20020adfe452000000b002cea8a237d7mr87809wrm.27.1678534102573;
        Sat, 11 Mar 2023 03:28:22 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 h16-20020adffd50000000b002c56af32e8csm2214201wrs.35.2023.03.11.03.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:28:21 -0800 (PST)
Message-ID: <e99b2c89-c9c4-8d79-d14e-221ff106798f@linaro.org>
Date: Sat, 11 Mar 2023 11:28:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: codecs: lpass-wsa-macro: add support for SM8550
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
 <20230310132201.322148-10-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230310132201.322148-10-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AOKW6DV5BV7JVXLOHP6LNPMOJ54KBXZL
X-Message-ID-Hash: AOKW6DV5BV7JVXLOHP6LNPMOJ54KBXZL
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOKW6DV5BV7JVXLOHP6LNPMOJ54KBXZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/03/2023 13:22, Krzysztof Kozlowski wrote:
> Add support for the WSA macro codec on Qualcomm SM8550.  SM8550 does not
> use NPL clock, thus add flags allowing to skip it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/lpass-wsa-macro.c | 38 +++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index ba7480f3831e..5155362de111 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -246,6 +246,9 @@
>   #define WSA_MACRO_EC_MIX_TX1_MASK 0x18
>   #define WSA_MACRO_MAX_DMA_CH_PER_PORT 0x2
>   
> +/* NPL clock is expected */
> +#define WSA_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
> +


Same nit as 3/9

Once done,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   enum {
>   	WSA_MACRO_GAIN_OFFSET_M1P5_DB,
>   	WSA_MACRO_GAIN_OFFSET_0_DB,
> @@ -2346,7 +2349,10 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
>   	struct clk_init_data init;
>   	int ret;
>   
> -	parent_clk_name = __clk_get_name(wsa->npl);
> +	if (wsa->npl)
> +		parent_clk_name = __clk_get_name(wsa->npl);
> +	else
> +		parent_clk_name = __clk_get_name(wsa->mclk);
>   
>   	init.name = "mclk";
>   	of_property_read_string(dev_of_node(dev), "clock-output-names",
> @@ -2379,9 +2385,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct wsa_macro *wsa;
> +	kernel_ulong_t flags;
>   	void __iomem *base;
>   	int ret;
>   
> +	flags = (kernel_ulong_t)device_get_match_data(dev);
> +
>   	wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
>   	if (!wsa)
>   		return -ENOMEM;
> @@ -2398,9 +2407,11 @@ static int wsa_macro_probe(struct platform_device *pdev)
>   	if (IS_ERR(wsa->mclk))
>   		return PTR_ERR(wsa->mclk);
>   
> -	wsa->npl = devm_clk_get(dev, "npl");
> -	if (IS_ERR(wsa->npl))
> -		return PTR_ERR(wsa->npl);
> +	if (flags & WSA_MACRO_FLAG_HAS_NPL_CLOCK) {
> +		wsa->npl = devm_clk_get(dev, "npl");
> +		if (IS_ERR(wsa->npl))
> +			return PTR_ERR(wsa->npl);
> +	}
>   
>   	wsa->fsgen = devm_clk_get(dev, "fsgen");
>   	if (IS_ERR(wsa->fsgen))
> @@ -2553,10 +2564,21 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>   };
>   
>   static const struct of_device_id wsa_macro_dt_match[] = {
> -	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
> -	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
> -	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
> -	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
> +	{
> +		.compatible = "qcom,sc7280-lpass-wsa-macro",
> +		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,sm8250-lpass-wsa-macro",
> +		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,sm8450-lpass-wsa-macro",
> +		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,sm8550-lpass-wsa-macro",
> +	}, {
> +		.compatible = "qcom,sc8280xp-lpass-wsa-macro",
> +		.data = (void *)WSA_MACRO_FLAG_HAS_NPL_CLOCK,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
