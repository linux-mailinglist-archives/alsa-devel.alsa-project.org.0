Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96354B8BB1
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 15:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 286441949;
	Wed, 16 Feb 2022 15:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 286441949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645022569;
	bh=3RW2SY4VoJ7YnAyAA6Amrr2XaSKSDtxESgRl8wY4Ewc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqrVcGe2Y8J/NAYWTvjp41ottfvjS8g4/hxFlkGowtfjz0kzxOocFcFweP3udSRRT
	 aLi3+zXh96I2cirTlPaDv7OzouvfTuILOjEvSpTdq6eNzwy5zld0ubzJPlWWM6evc8
	 L++BqlkRYcdJRdxHAaskezdfQGQLuk9ct/y67SOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98ACEF8012E;
	Wed, 16 Feb 2022 15:41:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5BD0F80128; Wed, 16 Feb 2022 15:41:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C4FDF80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4FDF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="fic/gb9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645022497; x=1676558497;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NTr5l/kjPw/+EYpzQlgU6KSNc69rhpWj63Jfbws9zPY=;
 b=fic/gb9mYDKj0ICRBOj8MSkpAiBzGXuDUapmWt29XQ0Krj+PmpqXNAXF
 IPItqLM6HJ2/l6npavxs7lFYP8t21WcLWcRmorakezWbI0r7QQp0ESWQ5
 6TZzFoPHWxGYx860Wk771nzHLKBV0G5XsnzP6JoYmvs60N8qq4gfghvbV U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 06:41:31 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 06:41:30 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 06:41:30 -0800
Received: from [10.216.55.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 06:41:24 -0800
Subject: Re: [PATCH v6 7/7] pinctrl: qcom: Update clock voting as optional
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, <agross@kernel.org>, 
 <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>, 
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@codeaurora.org>, 
 <perex@perex.cz>, <tiwai@suse.com>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-8-git-send-email-quic_srivasam@quicinc.com>
 <a209336a-9108-f1ac-ee6d-a838df115c6d@linaro.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <b663f63f-4a5a-3a2a-9be7-fa7258ce93c5@quicinc.com>
Date: Wed, 16 Feb 2022 20:11:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a209336a-9108-f1ac-ee6d-a838df115c6d@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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


On 2/16/2022 7:50 PM, Srinivas Kandagatla wrote:
Thanks for Your Time Srini!!!
>
> On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
>> Update bulk clock voting to optional voting as ADSP bypass platform 
>> doesn't
>> need macro and decodec clocks, these are maintained as power domains and
>> operated from lpass audio core cc.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 16 +++++++++-------
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>>   3 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c 
>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 8a82fd9..103f0a6c 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -407,13 +407,15 @@ int lpi_pinctrl_probe(struct platform_device 
>> *pdev)
>>           return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>                        "Slew resource not provided\n");
>>   -    ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> -    if (ret)
>> -        return dev_err_probe(dev, ret, "Can't get clocks\n");
>> -
>> -    ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>> -    if (ret)
>> -        return dev_err_probe(dev, ret, "Can't enable clocks\n");
>> +    if (!data->is_clk_optional) {
>> +        ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +        if (ret)
>> +            return dev_err_probe(dev, ret, "Can't get clocks\n");
>> +
>> +        ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>> +        if (ret)
>> +            return dev_err_probe(dev, ret, "Can't enable clocks\n");
>> +    }
>>         pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
>>       pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h 
>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> index a511d72..c1079bf 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>>       int ngroups;
>>       const struct lpi_function *functions;
>>       int nfunctions;
>> +    int is_clk_optional;
>>   };
>>     int lpi_pinctrl_probe(struct platform_device *pdev);
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c 
>> b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> index 5bf30d97..4277e31 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -143,6 +143,7 @@ static const struct lpi_pinctrl_variant_data 
>> sc7280_lpi_data = {
>>       .ngroups = ARRAY_SIZE(sc7280_groups),
>>       .functions = sc7280_functions,
>>       .nfunctions = ARRAY_SIZE(sc7280_functions),
>> +    .is_clk_optional = 1,
>
> This is forcefully set assuming that sc7280 is always used in ADSP 
> bypass mode. Which is not correct.
>
> Can't you use devm_clk_bulk_get_optional instead?

Yes. Agreed. Initially used devm_clk_bulk_get_optional, but Bjorn 
suggested for conditional check instead of optional.

Again Shall we go for optional clock voting?

>
> --srini
>
>>   };
>>     static const struct of_device_id lpi_pinctrl_of_match[] = {
