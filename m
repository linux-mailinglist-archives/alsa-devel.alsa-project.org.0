Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 088234D9ECF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 16:34:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F1B188A;
	Tue, 15 Mar 2022 16:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F1B188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647358480;
	bh=dBGW7MeizHkpNGCiMznPv1jWL+7CdRTEt6swBeBBGew=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRIhwuAk7/yGOuMxDqJczvPtX2x0/eb6FuMGiIj8yDoImigTps6kx0vtXT20wQEvc
	 HP1QCKhgT24tSzWK+JJKz6j2WNjzaRKnkhzbOawiZI7cFBKSHEYVnhhr8FE15FdWRq
	 543NAuwDCXAL9HJTvg0xMZ7oESo8xsCsJR+mRhMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF2FF801F7;
	Tue, 15 Mar 2022 16:33:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 914B6F80162; Tue, 15 Mar 2022 16:33:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055BFF800FF
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 16:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055BFF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="YtNEPV+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647358406; x=1678894406;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BrkCwsrMScpDdULJP2t9eWLoVN/539qVzRcEKcaOnQY=;
 b=YtNEPV+3fD54fR3VSekscjJihgi5ud/GHl4rFreQ2PlVfGWgUeDA4erU
 VcM84jkhovHcmNap6CwDZkh1XfYwRzE3OjanosyAWcTWiL0HX3hoRwGWE
 8HFUbgrYaOOp4MGH+NcmLhif/umMUPABex/4DYMxAqDHo/eI7dXPC8/QV Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 08:33:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:33:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 08:33:21 -0700
Received: from [10.216.59.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 15 Mar
 2022 08:33:15 -0700
Message-ID: <919b576d-8074-8c78-106e-af2c769413be@quicinc.com>
Date: Tue, 15 Mar 2022 21:03:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v10 7/7] pinctrl: qcom: Update clock voting as optional
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
 <1646737394-4740-8-git-send-email-quic_srivasam@quicinc.com>
 <Yieczzo96xSaA7jp@ripper>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <Yieczzo96xSaA7jp@ripper>
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


On 3/8/2022 11:43 PM, Bjorn Andersson wrote:
Thanks for your time Bjorn!!!
> On Tue 08 Mar 03:03 PST 2022, Srinivasa Rao Mandadapu wrote:
>
>> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
>> need macro and decodec clocks,
> Even I am not sure what "ADSP bypass platform" means, so please express
> this better.

Actually LPASS contains internal DSP for post processing and other 
activities. Some vendors are

provided LPASS HW without enabling DSP. That's why, we call ADSP Bypass.

>
> Are they optional because sc7280 typically come with ADSP based audio,
> but it might not and if not then we shouldn't control those clocks?

They are GDSC switches. In ADSP based solution, HLOS intiate as clock to 
DSP firmware and it

handles GDSC switch. In case of ADSP bypass solution,  kernel Clock 
drivers handles them as power domains.

These GDSCs in genaral gets on if we vote for any clock which depends on 
them.

>
>> these are maintained as power domains and
>> operated from lpass audio core cc.
>>
> So there are clocks, but they are exposed as power-domains? Or are you
> just trying to say that the LPASS LPI pinctrl block is always in a
> power-domain controlled by the audio clock-controller?
>
> Regards,
> Bjorn

Yes, They are actually GDSC switches, but they are controlled as power 
domains in case of ADSP bypass case and

as clocks in ADSP based solutions.

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
>> index 1ab572f..c618b74 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -407,9 +407,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
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
>> +	} else {
>> +		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
>> +	}
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
>>   };
>>   
>>   static const struct of_device_id lpi_pinctrl_of_match[] = {
>> -- 
>> 2.7.4
>>
