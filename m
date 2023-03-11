Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECA6B5B20
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 12:26:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35DCF189E;
	Sat, 11 Mar 2023 12:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35DCF189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678533989;
	bh=noU2UZ+zY0PPSHXj+Qhv6KP+3VkiDROJetbf1AWR6yY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qIkh0q0D5WLKEwaHGKvhbs5B1aeq2Avr0miDFAaVR4P9H0/RPqnD0ld/IP1Hf2dba
	 wiKX6Yw3jy+G/Y7kRN/Q/1KPrkHKKWWJSDpK2xH/2YikOGihPSuTxFwMu3ZNdFevla
	 30LwChaGxX1a5ZqkmieehKLxPNnOWn1rOaMa7sXI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A5CF804B1;
	Sat, 11 Mar 2023 12:24:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AABD5F800DF; Sat, 11 Mar 2023 12:24:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 310C5F800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 12:24:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 310C5F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Hh4ZeOCU
Received: by mail-wr1-x430.google.com with SMTP id r18so7337248wrx.1
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Mar 2023 03:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533883;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4S3fpbxvlb7vecpt9Hto2orpDQNfSYRZ6kHelmpqnlk=;
        b=Hh4ZeOCUtyl4wTS63hDa0z7rk6opFTeKQ0XWB9QXmeRtfpo8vG4vVEB/Osxyxc4HdZ
         UwdAyZBXw0FaV6iC8GOFQDFBAZhd0D39ncujO96nLWYX38+PjHIijCFBCCbyEwtQO4TF
         Hr2WWJtvVg1w4DUaAw1dnF2yLLH1wyklIGLXj0PWSAH9CK1ojxmOpI/hbAdC1I1nYyLI
         c5bgG9a5xt4G5r6IPXb/Kl2IQU5Q2TE7+VxpvOYA79q2yod306oLDW9qj+xFeAtwXz0K
         B+EBMXyM2QU/+tdODJDb99wm828wIXdU36l7Zp0fxNxKm/6JH2JxItPNGp8tD2XOtD6C
         mRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533883;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4S3fpbxvlb7vecpt9Hto2orpDQNfSYRZ6kHelmpqnlk=;
        b=fMnXiTv5YjGKBEqoYxq8j2UMEhbeBEHiRblyU7iu8mgs+yDJHzr3EehQ8BOk9GgL1a
         UpepSuxf0O5HVICMDEo5sBaoyb20+OKH8XiSrYZyb2YM9yapnsBiP2tTa8r++EffM9hQ
         O8iHzs7Ffpvka98JQ8DrzlfwsQ9Zt2U2rXB5v+cGn0JbGrUDuw0g7wU8/W9+2TK+TWFf
         1mD27DaqfWFmfhxpiItbuCjYT1lz6QHFdpaAIouQpfojF5Z3EGTA4UGcpfBx9i8QqGSO
         V8rIXNi2gNzT821jCSHNbTCNw5V9ydsCZtM/CUEzTOlEY/ujZW9eLdUli7Y11OShbLEN
         JdEA==
X-Gm-Message-State: AO0yUKUfGhsk1M526bh4weJ3btN2mvwBduP4x0gZX0N0AmX8lsEXOdJX
	mhpAMpWMslGy7skd+hr4YBMmTw==
X-Google-Smtp-Source: 
 AK7set/wOBkMS1eYPDTG/VWBTdTxpyOHdR3rjM4CnjpSbrDQikBiv0tlPS9rE6gmULGJ8xu75C09wQ==
X-Received: by 2002:adf:ef8b:0:b0:2ce:a7df:c115 with SMTP id
 d11-20020adfef8b000000b002cea7dfc115mr432579wro.41.1678533883352;
        Sat, 11 Mar 2023 03:24:43 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 u13-20020a5d434d000000b002c57384dfe0sm2145312wrr.113.2023.03.11.03.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:24:42 -0800 (PST)
Message-ID: <492bc15c-a59c-92f5-3d57-d6bfcf03c4ce@linaro.org>
Date: Sat, 11 Mar 2023 11:24:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] ASoC: codecs: lpass-tx-macro: add support for SM8550
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
 <20230310132201.322148-7-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230310132201.322148-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 724FMBKJ4CE4OWMR4YBSD5CZFQ7SMQTV
X-Message-ID-Hash: 724FMBKJ4CE4OWMR4YBSD5CZFQ7SMQTV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/724FMBKJ4CE4OWMR4YBSD5CZFQ7SMQTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/03/2023 13:21, Krzysztof Kozlowski wrote:
> Add support for the TX macro codec on Qualcomm SM8550.  SM8550 does not
> use NPL clock, thus add flags allowing to skip it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/lpass-tx-macro.c | 38 ++++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 473d3cd39554..23371b21505e 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -205,6 +205,9 @@
>   #define TX_MACRO_AMIC_HPF_DELAY_MS	300
>   #define MCLK_FREQ		19200000
>   
> +/* NPL clock is expected */
> +#define TX_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
> +

Same nit as 3/9

Once done,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   enum {
>   	TX_MACRO_AIF_INVALID = 0,
>   	TX_MACRO_AIF1_CAP,
> @@ -1915,7 +1918,10 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
>   	struct clk_init_data init;
>   	int ret;
>   
> -	parent_clk_name = __clk_get_name(tx->npl);
> +	if (tx->npl)
> +		parent_clk_name = __clk_get_name(tx->npl);
> +	else
> +		parent_clk_name = __clk_get_name(tx->mclk);
>   
>   	init.name = clk_name;
>   	init.ops = &swclk_gate_ops;
> @@ -1946,10 +1952,13 @@ static int tx_macro_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
> +	kernel_ulong_t flags;
>   	struct tx_macro *tx;
>   	void __iomem *base;
>   	int ret, reg;
>   
> +	flags = (kernel_ulong_t)device_get_match_data(dev);
> +
>   	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
>   	if (!tx)
>   		return -ENOMEM;
> @@ -1966,9 +1975,11 @@ static int tx_macro_probe(struct platform_device *pdev)
>   	if (IS_ERR(tx->mclk))
>   		return PTR_ERR(tx->mclk);
>   
> -	tx->npl = devm_clk_get(dev, "npl");
> -	if (IS_ERR(tx->npl))
> -		return PTR_ERR(tx->npl);
> +	if (flags & TX_MACRO_FLAG_HAS_NPL_CLOCK) {
> +		tx->npl = devm_clk_get(dev, "npl");
> +		if (IS_ERR(tx->npl))
> +			return PTR_ERR(tx->npl);
> +	}
>   
>   	tx->fsgen = devm_clk_get(dev, "fsgen");
>   	if (IS_ERR(tx->fsgen))
> @@ -2145,10 +2156,21 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
>   };
>   
>   static const struct of_device_id tx_macro_dt_match[] = {
> -	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
> -	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
> -	{ .compatible = "qcom,sm8450-lpass-tx-macro" },
> -	{ .compatible = "qcom,sc8280xp-lpass-tx-macro" },
> +	{
> +		.compatible = "qcom,sc7280-lpass-tx-macro",
> +		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,sm8250-lpass-tx-macro",
> +		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,sm8450-lpass-tx-macro",
> +		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,sm8550-lpass-tx-macro",
> +	}, {
> +		.compatible = "qcom,sc8280xp-lpass-tx-macro",
> +		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
