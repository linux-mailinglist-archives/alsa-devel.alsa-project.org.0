Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1675A9268
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 10:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAEB015F9;
	Thu,  1 Sep 2022 10:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAEB015F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662022310;
	bh=IYN5w147mEPIh7+I3ZHSNKJex5y+dk+1RgmLsnyQbNc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+NA9zRAUG+xOjtEFFuFga4i/xfs/RvyPqHFCZBtMhMcDS8ZqhP0t4Z6yXwjfNAv6
	 VrDrTltedbEmIUb6B09DrDssvdcxa9IBu4cxjPOjF+2VCgSzCudmYLi5j5TKTPP70M
	 vK5N6ryy8lMRw8eFBL9Bij/8qxiKu26N5rT5RS6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF32F804A9;
	Thu,  1 Sep 2022 10:50:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE65F8026D; Thu,  1 Sep 2022 10:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 726F4F80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 10:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 726F4F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H3Q+6UfM"
Received: by mail-wr1-x429.google.com with SMTP id n17so21373156wrm.4
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=A2FQLHZdgWMY5+2Vy68SDBQe0FvAsdbyc6G5rfD5/5o=;
 b=H3Q+6UfMvhjnOZlqFelmwDsjl2tA0NTYiE9PmJtYHvY0LVTmXtIP2h/5hldu0NLOke
 GUdEhxQ8A5CNlVtjPMoBCDpVBxrydnv0fOd8T+Hm5Ly4j2/KDWuzIxCK54Ar8HNNb5Wn
 wjER3HrAPCSHJm9gdDna5GrBcUGrSA77QaY7ufo9UtlQcjxu0AhC0APzK5vtYjHjcT7S
 EH513Nl875hXgcaC9IaX4N/DFQxsZCL5XH0VBf7hk4Hm6IUohR1SrLYOtYFt6qlCu6Qg
 CaefkXCVKT3LXzXk7IGSJDo7gqcZjce1tWP5AZmqd/eC1hiQUPLNLgE04w2YV+w3KO3s
 M4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=A2FQLHZdgWMY5+2Vy68SDBQe0FvAsdbyc6G5rfD5/5o=;
 b=CcdoC4x0hiVk0dmE4J1fe4phqmtfFwognTbauL5Z+izkjnz1IQP+s8v7kxgW8Xa/12
 YgLislrEt+uDQjiQrHsWABXieLAmCS3Jo6eDSrNzbWoQ5xO+WO64420fcs9bEUBJOCZF
 mWOYHKbZPbwzCKi61B/qVpvhdlsmwUaNAT86BoHByr+D+k/oD5xsySZ8VpShwTVQCRKP
 Rhx5FWGywJyEND6Klw7wXMVxl/mh/DzW4tx07GGirbUHZNYhFsLZkTWu2Q4Oc/p7lLy0
 8LY6iJCuiPVtkQ4QQKHMrxRm7O/dO7rKbtixu/R9MqTYHi9DznbqBlK9uOJ2iDmQtEWi
 kIDw==
X-Gm-Message-State: ACgBeo0JdetR7uENWg6D+3AAYzzMPOzDggMtxpO4NLwSDN2tMuAS5CX3
 VQoRZydkjbZwCAVVB8sxziUnEg==
X-Google-Smtp-Source: AA6agR757jBQEEOMnzTvdrhLU2kaUT9IXbba0+T96klBBO4KX2U+sFZeASnIiyiMLtKuCJfyOQcPdw==
X-Received: by 2002:a5d:5b08:0:b0:226:f421:79ba with SMTP id
 bx8-20020a5d5b08000000b00226f42179bamr1486062wrb.44.1662022238566; 
 Thu, 01 Sep 2022 01:50:38 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020adffed0000000b00226d1821abesm13352278wrs.56.2022.09.01.01.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:50:37 -0700 (PDT)
Message-ID: <8f907b3f-b02f-774a-f3f7-844527795fbd@linaro.org>
Date: Thu, 1 Sep 2022 09:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] ASoC: codecs: tx-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-7-srinivas.kandagatla@linaro.org>
 <aac3942d-bc0b-7763-0d12-f5d6c585cc97@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <aac3942d-bc0b-7763-0d12-f5d6c585cc97@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 01/09/2022 08:30, Krzysztof Kozlowski wrote:
> On 18/08/2022 16:46, Srinivas Kandagatla wrote:
>> LPASS VA Macro now has soundwire master to deal with access to
>> analog mic in low power island use cases.
>>
>> This is added after sc8280xp, add support for this.
>> Along with this also add compatibles for sm8450 and sc8280xp.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-va-macro.c | 64 ++++++++++++++++++++++++++++++-
>>   1 file changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
>> index a35f684053d2..f8b0c8caa1db 100644
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -25,6 +25,10 @@
>>   #define CDC_VA_FS_CONTROL_EN			BIT(0)
>>   #define CDC_VA_FS_COUNTER_CLR			BIT(1)
>>   #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
>> +#define CDC_VA_SWR_RESET_MASK		BIT(1)
>> +#define CDC_VA_SWR_RESET_ENABLE		BIT(1)
>> +#define CDC_VA_SWR_CLK_EN_MASK		BIT(0)
>> +#define CDC_VA_SWR_CLK_ENABLE		BIT(0)
>>   #define CDC_VA_TOP_CSR_TOP_CFG0			(0x0080)
>>   #define CDC_VA_FS_BROADCAST_EN			BIT(1)
>>   #define CDC_VA_TOP_CSR_DMIC0_CTL		(0x0084)
>> @@ -66,6 +70,8 @@
>>   #define CDC_VA_TOP_CSR_SWR_MIC_CTL0		(0x00D0)
>>   #define CDC_VA_TOP_CSR_SWR_MIC_CTL1		(0x00D4)
>>   #define CDC_VA_TOP_CSR_SWR_MIC_CTL2		(0x00D8)
>> +#define CDC_VA_SWR_MIC_CLK_SEL_0_1_MASK		(0xEE)
>> +#define CDC_VA_SWR_MIC_CLK_SEL_0_1_DIV1		(0xCC)
>>   #define CDC_VA_TOP_CSR_SWR_CTRL			(0x00DC)
>>   #define CDC_VA_INP_MUX_ADC_MUX0_CFG0		(0x0100)
>>   #define CDC_VA_INP_MUX_ADC_MUX0_CFG1		(0x0104)
>> @@ -194,6 +200,8 @@ struct va_macro {
>>   	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
>>   	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
>>   	u16 dmic_clk_div;
>> +	bool has_swr_master;
>> +	bool reset_swr;
>>   
>>   	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>>   	struct regmap *regmap;
>> @@ -325,6 +333,9 @@ static bool va_is_rw_register(struct device *dev, unsigned int reg)
>>   	case CDC_VA_TOP_CSR_DMIC2_CTL:
>>   	case CDC_VA_TOP_CSR_DMIC3_CTL:
>>   	case CDC_VA_TOP_CSR_DMIC_CFG:
>> +	case CDC_VA_TOP_CSR_SWR_MIC_CTL0:
>> +	case CDC_VA_TOP_CSR_SWR_MIC_CTL1:
>> +	case CDC_VA_TOP_CSR_SWR_MIC_CTL2:
>>   	case CDC_VA_TOP_CSR_DEBUG_BUS:
>>   	case CDC_VA_TOP_CSR_DEBUG_EN:
>>   	case CDC_VA_TOP_CSR_TX_I2S_CTL:
>> @@ -1306,12 +1317,40 @@ static const struct snd_soc_component_driver va_macro_component_drv = {
>>   
>>   static int fsgen_gate_enable(struct clk_hw *hw)
>>   {
>> -	return va_macro_mclk_enable(to_va_macro(hw), true);
>> +	struct va_macro *va = to_va_macro(hw);
>> +	struct regmap *regmap = va->regmap;
>> +	int ret;
>> +
>> +	ret = va_macro_mclk_enable(va, true);
>> +	if (!va->has_swr_master)
>> +		return ret;
>> +
>> +	if (va->reset_swr)
>> +		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
>> +				   CDC_VA_SWR_RESET_MASK,
>> +				   CDC_VA_SWR_RESET_ENABLE);
>> +
>> +	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
>> +			   CDC_VA_SWR_CLK_EN_MASK,
>> +			   CDC_VA_SWR_CLK_ENABLE);
>> +	if (va->reset_swr)
>> +		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
>> +				   CDC_VA_SWR_RESET_MASK, 0x0);
>> +	va->reset_swr = false;
>> +
>> +	return ret;
>>   }
>>   
>>   static void fsgen_gate_disable(struct clk_hw *hw)
>>   {
>> -	va_macro_mclk_enable(to_va_macro(hw), false);
>> +	struct va_macro *va = to_va_macro(hw);
>> +	struct regmap *regmap = va->regmap;
>> +
>> +	if (va->has_swr_master)
>> +		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
>> +			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
>> +
>> +	va_macro_mclk_enable(va, false);
>>   }
>>   
>>   static int fsgen_gate_is_enabled(struct clk_hw *hw)
>> @@ -1459,6 +1498,11 @@ static int va_macro_probe(struct platform_device *pdev)
>>   
>>   	dev_set_drvdata(dev, va);
>>   
>> +	if (of_device_is_compatible(dev->of_node, "qcom,sm8450-lpass-va-macro") ||
>> +		of_device_is_compatible(dev->of_node, "qcom,sc8280xp-lpass-va-macro")) {
>> +		va->has_swr_master = true;
>> +		va->reset_swr = true;
> 
> This should go to driver_data. Either via quirks/flags or device type
> (enum for each device). Usually the first (flags) is more flexible if
> you want to support many devices.

Yes, at-least this case is easily doable with driver_data, let me try to 
add this in next spin.


--srini
> 
> This also explains Rob's concerns about unneeded entries in of_device_id
> table.
> 
> 
> Best regards,
> Krzysztof
