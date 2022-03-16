Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3F4DB54A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 16:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B864516E3;
	Wed, 16 Mar 2022 16:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B864516E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647445799;
	bh=o9uAYOn2mq5DEzVmr3iiw9Dz6PaVejU6HvP3goCbbeI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWbt/xnR7Js64WC9yd9CDT/cqlWLSzfQOcrZn0tSczgAMss7P/YmyA6u04t1uHAb5
	 sYzufZT+fEcCqeCMsm47nVwLXWknSKqqPJ1Qvic3BiKworGE5XHdyoqxX5kN9zmdt4
	 8sP7sFD5xsA/wwq/r8aldLJNKMBkD8JkElA47vZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35CFFF801F5;
	Wed, 16 Mar 2022 16:48:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78876F80087; Wed, 16 Mar 2022 16:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8FC5F80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 16:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8FC5F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="L9QKUD6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647445728; x=1678981728;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GudUircLqgrKK4G/097tEeYgThr0aEszZyU2Auw0xeA=;
 b=L9QKUD6Iyd/vNc747e8G/kv3v0Q0YoMUNEwodaMe0+jgxUpJEwaKa6d/
 jUMr3B5ObJ6iukjw+DpYk4AP6rqoMRdADX2qMojOsjc3qWErM3eRZxCPM
 Fs+ndfnghBiVS+UbymbRwGDmRENMIBhdapG+GldISlr1Ga50mC1ag/bRG k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Mar 2022 08:48:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 08:48:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 16 Mar 2022 08:48:40 -0700
Received: from [10.216.40.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 08:48:34 -0700
Message-ID: <61fcca7d-983d-7f87-2ca2-e68dea7bc0b4@quicinc.com>
Date: Wed, 16 Mar 2022 21:18:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v11 7/7] pinctrl: qcom: Update clock voting as optional
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
 <1647359413-31662-8-git-send-email-quic_srivasam@quicinc.com>
 <YjDFcJOA8An58iTe@builder.lan>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YjDFcJOA8An58iTe@builder.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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


On 3/15/2022 10:27 PM, Bjorn Andersson wrote:
Thanks for your time Bjorn!!!
> On Tue 15 Mar 10:50 CDT 2022, Srinivasa Rao Mandadapu wrote:
>
>> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
>> need macro and decodec clocks, as these macro and dcodec GDSC switches are
>> maintained as power domains and operated from lpass clock drivers.
>>
> Sorry for missing your reply on my question on the previous version, I
> think this sounds reasonable.
Okay. Thanks!!!
>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 12 +++++++++---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>>   3 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 0216ca1..3fc473a 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -401,9 +401,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>   				     "Slew resource not provided\n");
>>   
>> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> -	if (ret)
>> -		return dev_err_probe(dev, ret, "Can't get clocks\n");
>> +	if (data->is_clk_optional) {
>> +		ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
> Dug into the clk_bulk_get() functions, and __clk_bulk_get() will print
> an error telling you which clock it failed to get. So I don't think your
> more generic error here doesn't add any value.
>
> Just return ret;
Okay will change accordingly.
>
>> +	} else {
>> +		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
>> +	}
> Depending on your taste, you could do:
>
> 	if (data->is_clk_optional)
> 		ret = devm_clk_bulk_get_optional();
> 	else
> 		ret = devm_clk_bulk_get();
>
> 	if (ret)
> 		return ret;
Okay. Will change accordingly.
>>   
>>   	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>>   	if (ret)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> index afbac2a..3bcede6 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>>   	int ngroups;
>>   	const struct lpi_function *functions;
>>   	int nfunctions;
>> +	int is_clk_optional;
> bool here please.
Okay. Will update.
>
>>   };
>>   
>>   int lpi_pinctrl_probe(struct platform_device *pdev);
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> index d67ff25..304d8a2 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -142,6 +142,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>>   	.ngroups = ARRAY_SIZE(sc7280_groups),
>>   	.functions = sc7280_functions,
>>   	.nfunctions = ARRAY_SIZE(sc7280_functions),
>> +	.is_clk_optional = 1,
> true
Okay.
>
> Regards,
> Bjorn
>
>>   };
>>   
>>   static const struct of_device_id lpi_pinctrl_of_match[] = {
>> -- 
>> 2.7.4
>>
