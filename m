Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7604DB562
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 16:54:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E0316E3;
	Wed, 16 Mar 2022 16:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E0316E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647446064;
	bh=8uTovg0cL/soSbGFJzF3vOce45HNkLeHwq7MQV43bbI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJMXhpz/vDshDJHRRga1znb5VlyEEBbMxI+NUEVwLOKykOSudWiU3naQLjc9QwrHi
	 cPT2pbILsywtCoXJ4rewcPZYR9L/hwD0+4OcsAc/atNHZBrrZtqORLlnC0VZ9X7EWK
	 9IT7iDaGztHbsFDIvHcq/6sqcXWqC9ZXbWCPqO6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FF8F80084;
	Wed, 16 Mar 2022 16:53:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04CE5F8019D; Wed, 16 Mar 2022 16:53:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABADBF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABADBF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DHnjWcQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647445989; x=1678981989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ytX2SFvM53HE0N3pYke/nVlK3T7iEr7di47zL9BakSQ=;
 b=DHnjWcQNXRWBW3872Do73kSSofR2EzvfKMdCEdZXJFf7ZVqIzj0YbDWH
 cF70tSxRt/Pe72zAk06Ks3nH40un4bRlyEr6GxKouoG4zqp8vilYtZwen
 hz8BsrEkREcOhafEoAwu9ZDw5t6HWiYwCuPCvsNipKd8yULTHPKW1zGKr c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Mar 2022 08:53:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 08:53:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 08:53:05 -0700
Received: from [10.216.40.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 08:52:59 -0700
Message-ID: <0b68bc4c-62e3-d40f-3114-0c6864c01f1a@quicinc.com>
Date: Wed, 16 Mar 2022 21:22:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v11 4/7] pinctrl: qcom: Update lpi pin group custiom
 functions with framework generic functions
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
 <1647359413-31662-5-git-send-email-quic_srivasam@quicinc.com>
 <YjDCs9AEJTJNIawj@builder.lan>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YjDCs9AEJTJNIawj@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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


On 3/15/2022 10:15 PM, Bjorn Andersson wrote:
Thanks for your time Bjorn!!!
> On Tue 15 Mar 10:50 CDT 2022, Srinivasa Rao Mandadapu wrote:
>
>> Update custom pin group structure members with framework generic group_desc structure
>> and replace the driver's custom pinctrl_ops with framework provided generic pin control
>> group functions to avoid redundant code written in lpass lpi driver.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |  1 +
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 98 +++++++++++++++-----------------
>>   2 files changed, 48 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index ca6f68a..31c4aa6 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -351,6 +351,7 @@ config PINCTRL_LPASS_LPI
>>   	select PINMUX
>>   	select PINCONF
>>   	select GENERIC_PINCONF
>> +	select GENERIC_PINCTRL_GROUPS
>>   	depends on GPIOLIB
>>   	help
>>   	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 3c15f80..5e27a38 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -51,11 +51,11 @@
>>   
>>   #define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
>>   	{						\
>> -		.name = "gpio" #id,			\
>> -		.pins = gpio##id##_pins,		\
>> +		.group.name = "gpio" #id,			\
>> +		.group.pins = gpio##id##_pins,		\
>>   		.pin = id,				\
>>   		.slew_offset = soff,			\
>> -		.npins = ARRAY_SIZE(gpio##id##_pins),	\
>> +		.group.num_pins = ARRAY_SIZE(gpio##id##_pins),	\
>>   		.funcs = (int[]){			\
>>   			LPI_MUX_gpio,			\
>>   			LPI_MUX_##f1,			\
>> @@ -67,9 +67,7 @@
>>   	}
>>   
>>   struct lpi_pingroup {
>> -	const char *name;
>> -	const unsigned int *pins;
>> -	unsigned int npins;
>> +	struct group_desc group;
>>   	unsigned int pin;
>>   	/* Bit offset in slew register for SoundWire pins only */
>>   	int slew_offset;
>> @@ -150,20 +148,20 @@ enum sm8250_lpi_functions {
>>   	LPI_MUX__,
>>   };
>>   
>> -static const unsigned int gpio0_pins[] = { 0 };
>> -static const unsigned int gpio1_pins[] = { 1 };
>> -static const unsigned int gpio2_pins[] = { 2 };
>> -static const unsigned int gpio3_pins[] = { 3 };
>> -static const unsigned int gpio4_pins[] = { 4 };
>> -static const unsigned int gpio5_pins[] = { 5 };
>> -static const unsigned int gpio6_pins[] = { 6 };
>> -static const unsigned int gpio7_pins[] = { 7 };
>> -static const unsigned int gpio8_pins[] = { 8 };
>> -static const unsigned int gpio9_pins[] = { 9 };
>> -static const unsigned int gpio10_pins[] = { 10 };
>> -static const unsigned int gpio11_pins[] = { 11 };
>> -static const unsigned int gpio12_pins[] = { 12 };
>> -static const unsigned int gpio13_pins[] = { 13 };
>> +static int gpio0_pins[] = { 0 };
>> +static int gpio1_pins[] = { 1 };
>> +static int gpio2_pins[] = { 2 };
>> +static int gpio3_pins[] = { 3 };
>> +static int gpio4_pins[] = { 4 };
>> +static int gpio5_pins[] = { 5 };
>> +static int gpio6_pins[] = { 6 };
>> +static int gpio7_pins[] = { 7 };
>> +static int gpio8_pins[] = { 8 };
>> +static int gpio9_pins[] = { 9 };
>> +static int gpio10_pins[] = { 10 };
>> +static int gpio11_pins[] = { 11 };
>> +static int gpio12_pins[] = { 12 };
>> +static int gpio13_pins[] = { 13 };
>>   static const char * const swr_tx_clk_groups[] = { "gpio0" };
>>   static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
>>   static const char * const swr_rx_clk_groups[] = { "gpio3" };
>> @@ -250,38 +248,10 @@ static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>>   	return 0;
>>   }
>>   
>> -static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
>> -{
>> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> -
>> -	return pctrl->data->ngroups;
>> -}
>> -
>> -static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
>> -					   unsigned int group)
>> -{
>> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> -
>> -	return pctrl->data->groups[group].name;
>> -}
>> -
>> -static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
>> -				   unsigned int group,
>> -				   const unsigned int **pins,
>> -				   unsigned int *num_pins)
>> -{
>> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> -
>> -	*pins = pctrl->data->groups[group].pins;
>> -	*num_pins = pctrl->data->groups[group].npins;
>> -
>> -	return 0;
>> -}
>> -
>>   static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
>> -	.get_groups_count	= lpi_gpio_get_groups_count,
>> -	.get_group_name		= lpi_gpio_get_group_name,
>> -	.get_group_pins		= lpi_gpio_get_group_pins,
>> +	.get_groups_count	= pinctrl_generic_get_group_count,
>> +	.get_group_name		= pinctrl_generic_get_group_name,
>> +	.get_group_pins		= pinctrl_generic_get_group_pins,
>>   	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
>>   	.dt_free_map		= pinctrl_utils_free_map,
>>   };
>> @@ -582,6 +552,28 @@ static const struct gpio_chip lpi_gpio_template = {
>>   	.dbg_show		= lpi_gpio_dbg_show,
>>   };
>>   
>> +static int lpi_build_pin_desc_groups(struct lpi_pinctrl *pctrl)
>> +{
>> +	struct group_desc *lpi_groups;
>> +	int i;
>> +
>> +	lpi_groups = devm_kcalloc(pctrl->dev, pctrl->data->npins,
>> +					 sizeof(*lpi_groups), GFP_KERNEL);
>> +	if (!lpi_groups)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < pctrl->data->npins; i++) {
>> +		const struct pinctrl_pin_desc *pin_info = pctrl->desc.pins + i;
>> +		struct group_desc *group = lpi_groups + i;
>> +
>> +		group->name = pin_info->name;
>> +		group->pins = (int *)&pin_info->number;
>> +		pinctrl_generic_add_group(pctrl->ctrl, group->name, group->pins, 1, NULL);
> I've not used this generic interface before, but I believe you need to
> pair your add with pinctrl_generic_remove_group(), both in error paths
> and driver remove.
Okay. Will add pinctrl_generic_remove_group() accordingly.
>
> Makes me wonder about the usefulness of this, as you will end up with
> a bit more code than you remove and you have the additional heap
> allocation. Feels like I'm missing something...
Here Heap allocation can be avoided.  will do accordingly and re post.
>
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int lpi_pinctrl_probe(struct platform_device *pdev)
>>   {
>>   	const struct lpi_pinctrl_variant_data *data;
>> @@ -647,6 +639,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>>   		goto err_pinctrl;
>>   	}
>>   
>> +	ret = lpi_build_pin_desc_groups(pctrl);
>> +	if (ret)
>> +		return ret;
> A few lines up the code does error handling by goto err_pinctrl, you
> should do the same.
Okay. will update accordingly.
>
> Regards,
> Bjorn
>
>> +
>>   	ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
>>   	if (ret) {
>>   		dev_err(pctrl->dev, "can't add gpio chip\n");
>> -- 
>> 2.7.4
>>
