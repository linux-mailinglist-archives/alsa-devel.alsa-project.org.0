Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F85A904F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 09:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BAF31E8;
	Thu,  1 Sep 2022 09:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BAF31E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662017497;
	bh=nTWlXOEzlMG7A6WMy0e3n2dBzbnqkuwwKbVqnyKs0bo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tm8EOJ2+J/QRrcViFUqfst3rIgk+/EtK42foCXoZVOt9EjEjLAcMw/SyFcqGthen3
	 qH1Ee5RYUpd6RX5I+PN+3WKoLyYLpaLAEPWc47yrykJNvUDjU3l+o2485qloKj2CHN
	 W0jJBmPIEaDo+RsaiC0Zf2oMFQe9FN1h3rezqmOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B38B4F800EB;
	Thu,  1 Sep 2022 09:30:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7CC8F8026D; Thu,  1 Sep 2022 09:30:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CC37F800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 09:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC37F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="djMelikW"
Received: by mail-lf1-x132.google.com with SMTP id br21so17387728lfb.0
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Yq1f5sXSl9dJBBsa4JJtzhgEzf3Vcbcgdkoadank0UY=;
 b=djMelikWbC/lJ29b+RcknkU1Y10YBy9OxcmWeKREbcDJZ7sIMbL7ZYDHEtfg7WWj/e
 C3PYlYa3kq3VB8KYoyf9BFYkRuA92YeiaVrBAE7jPxx90EZaorcQn4NE7uKUwV+x87ci
 4+EE7VD/aU1mjDn5J4ZjZoDb/drWpjXr0y9Dgnbpz124meHVprM6tAfv3z3P4IxXIwQi
 H8mZ/M9p+vrlDwmZNgDeZGS9rYUMB98eJP+9QXE25bCbHVOziulP5lvdpsZhI/6WnGDa
 k6SrtklCLROaDxYaqRxIe/BfgB96gPTfuLve0ZIP1B4LRFM95B5IDAbwI+SXdvVZY+Rd
 uDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Yq1f5sXSl9dJBBsa4JJtzhgEzf3Vcbcgdkoadank0UY=;
 b=JNp+hLakmyV33pyN1DFgiMEcZqAG/F16ha2K/pOEzgKlgvEZ2tMKynY09vQJtFYor/
 ZUctIrJbmVBOBHIiXLXnHiGAULWBfRIbpJeK4nnYdqY7+Hx2fiUBE27FM1DPoOUaEgvX
 pyyFd+ATgdD6yH3M/7jDO8H89lgCj1hNEjGHnbv7sJGEZS8cNw/u+EjjkEeYkqgD0aRW
 v6WTc9ImXayfvle82ATMMFCfL+qFarzZl48hHokjiqzKKPCoRg9hThwvLbRfpC+nwWLt
 6VilGOQXED3tuWXvfIViS11CTj3rSa52tZBmrZaEljb+p2JHew7FIK7JiDYRYxf6llEY
 HWEA==
X-Gm-Message-State: ACgBeo3lWokB7LnoA8lY4tJzI9Nbsi9X9PItDmDN5RZFZIA4b1FFZrEU
 5fsYtC7J9T9/B7H1JZDDdOV7aA==
X-Google-Smtp-Source: AA6agR7yPEX4lBca6MaRVV7FLC8JsJi9f1Qnc5BJpKL2yg/lvtRzib/see+UUQqoafpytn52CBFq6A==
X-Received: by 2002:a05:6512:1395:b0:48d:81c:5159 with SMTP id
 p21-20020a056512139500b0048d081c5159mr11687844lfa.375.1662017426392; 
 Thu, 01 Sep 2022 00:30:26 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 h6-20020a2ea486000000b00268bc2c1ed0sm151744lji.22.2022.09.01.00.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 00:30:25 -0700 (PDT)
Message-ID: <aac3942d-bc0b-7763-0d12-f5d6c585cc97@linaro.org>
Date: Thu, 1 Sep 2022 10:30:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/6] ASoC: codecs: tx-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-7-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220818134619.3432-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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

On 18/08/2022 16:46, Srinivas Kandagatla wrote:
> LPASS VA Macro now has soundwire master to deal with access to
> analog mic in low power island use cases.
> 
> This is added after sc8280xp, add support for this.
> Along with this also add compatibles for sm8450 and sc8280xp.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 64 ++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index a35f684053d2..f8b0c8caa1db 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -25,6 +25,10 @@
>  #define CDC_VA_FS_CONTROL_EN			BIT(0)
>  #define CDC_VA_FS_COUNTER_CLR			BIT(1)
>  #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
> +#define CDC_VA_SWR_RESET_MASK		BIT(1)
> +#define CDC_VA_SWR_RESET_ENABLE		BIT(1)
> +#define CDC_VA_SWR_CLK_EN_MASK		BIT(0)
> +#define CDC_VA_SWR_CLK_ENABLE		BIT(0)
>  #define CDC_VA_TOP_CSR_TOP_CFG0			(0x0080)
>  #define CDC_VA_FS_BROADCAST_EN			BIT(1)
>  #define CDC_VA_TOP_CSR_DMIC0_CTL		(0x0084)
> @@ -66,6 +70,8 @@
>  #define CDC_VA_TOP_CSR_SWR_MIC_CTL0		(0x00D0)
>  #define CDC_VA_TOP_CSR_SWR_MIC_CTL1		(0x00D4)
>  #define CDC_VA_TOP_CSR_SWR_MIC_CTL2		(0x00D8)
> +#define CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK		(0xEE)
> +#define CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1		(0xCC)
>  #define CDC_VA_TOP_CSR_SWR_CTRL			(0x00DC)
>  #define CDC_VA_INP_MUX_ADC_MUX0_CFG0		(0x0100)
>  #define CDC_VA_INP_MUX_ADC_MUX0_CFG1		(0x0104)
> @@ -194,6 +200,8 @@ struct va_macro {
>  	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
>  	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
>  	u16 dmic_clk_div;
> +	bool has_swr_master;
> +	bool reset_swr;
>  
>  	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>  	struct regmap *regmap;
> @@ -325,6 +333,9 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
>  	case CDC_VA_TOP_CSR_DMIC2_CTL:
>  	case CDC_VA_TOP_CSR_DMIC3_CTL:
>  	case CDC_VA_TOP_CSR_DMIC_CFG:
> +	case CDC_VA_TOP_CSR_SWR_MIC_CTL0:
> +	case CDC_VA_TOP_CSR_SWR_MIC_CTL1:
> +	case CDC_VA_TOP_CSR_SWR_MIC_CTL2:
>  	case CDC_VA_TOP_CSR_DEBUG_BUS:
>  	case CDC_VA_TOP_CSR_DEBUG_EN:
>  	case CDC_VA_TOP_CSR_TX_I2S_CTL:
> @@ -1306,12 +1317,40 @@ static const struct snd_soc_component_driver va_macro_component_drv = {
>  
>  static int fsgen_gate_enable(struct clk_hw *hw)
>  {
> -	return va_macro_mclk_enable(to_va_macro(hw), true);
> +	struct va_macro *va = to_va_macro(hw);
> +	struct regmap *regmap = va->regmap;
> +	int ret;
> +
> +	ret = va_macro_mclk_enable(va, true);
> +	if (!va->has_swr_master)
> +		return ret;
> +
> +	if (va->reset_swr)
> +		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
> +				   CDC_VA_SWR_RESET_MASK,
> +				   CDC_VA_SWR_RESET_ENABLE);
> +
> +	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
> +			   CDC_VA_SWR_CLK_EN_MASK,
> +			   CDC_VA_SWR_CLK_ENABLE);
> +	if (va->reset_swr)
> +		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
> +				   CDC_VA_SWR_RESET_MASK, 0x0);
> +	va->reset_swr = false;
> +
> +	return ret;
>  }
>  
>  static void fsgen_gate_disable(struct clk_hw *hw)
>  {
> -	va_macro_mclk_enable(to_va_macro(hw), false);
> +	struct va_macro *va = to_va_macro(hw);
> +	struct regmap *regmap = va->regmap;
> +
> +	if (va->has_swr_master)
> +		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
> +			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
> +
> +	va_macro_mclk_enable(va, false);
>  }
>  
>  static int fsgen_gate_is_enabled(struct clk_hw *hw)
> @@ -1459,6 +1498,11 @@ static int va_macro_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(dev, va);
>  
> +	if (of_device_is_compatible(dev->of_node, "qcom,sm8450-lpass-va-macro") ||
> +		of_device_is_compatible(dev->of_node, "qcom,sc8280xp-lpass-va-macro")) {
> +		va->has_swr_master = true;
> +		va->reset_swr = true;

This should go to driver_data. Either via quirks/flags or device type
(enum for each device). Usually the first (flags) is more flexible if
you want to support many devices.

This also explains Rob's concerns about unneeded entries in of_device_id
table.


Best regards,
Krzysztof
