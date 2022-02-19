Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C104BC9F9
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 19:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322121699;
	Sat, 19 Feb 2022 19:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322121699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645295897;
	bh=a6kJOJpN+a6t5OFhrDyEaygcPei3t/eK8TW/yrqnBA0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7m+GlkfKPY4NKdUPBl5zoDNr7zbBk3KAMnFfi7m7puBU2Py9U334Ku8OH8GTu1nn
	 5RZgMG4Ccrj+p64zHrVNJ86ONuH5ruRnIVoK5WpMnenFWsMN1/Qa1kU97NuuBDN0gu
	 vTdhds09EkrVoijDY2fDIRTZh+8cvuv2oC+5Su0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F29F80118;
	Sat, 19 Feb 2022 19:37:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 354B8F8016A; Sat, 19 Feb 2022 19:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511E0F80118
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 19:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511E0F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Rbae3GcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645295828; x=1676831828;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GhY3fDCHu53ziSnkTw5eFSyoPC2rhAzNSF2CnP6JEi4=;
 b=Rbae3GcLM1Krwb/fNo0Kmihf9YgDPVuniJ9OBFORDA67em5x/8U5c2nt
 vxgYjEume/wHd71gxBiHcykPb3OENzRmMTpToxocSd9fdKj5CwkiLUbQu
 mX/drlkjuZ0SCj2Edh2taFiDKBx3ogcyEAOtmMkL7wDjp3Sz+VuBq65nM U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 19 Feb 2022 10:37:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 10:37:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 19 Feb 2022 10:36:51 -0800
Received: from [10.216.20.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sat, 19 Feb
 2022 10:36:44 -0800
Message-ID: <a3bb48ec-1174-ba2f-eca5-0fed78c55799@quicinc.com>
Date: Sun, 20 Feb 2022 00:06:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6 7/7] pinctrl: qcom: Update clock voting as optional
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <perex@perex.cz>, <quic_plai@quicinc.com>, <robh+dt@kernel.org>,
 <rohitkr@codeaurora.org>, <tiwai@suse.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-8-git-send-email-quic_srivasam@quicinc.com>
 <a209336a-9108-f1ac-ee6d-a838df115c6d@linaro.org>
 <b663f63f-4a5a-3a2a-9be7-fa7258ce93c5@quicinc.com>
 <09b00fe9-1770-1723-3c4c-6c494da87e8d@linaro.org>
 <CAE-0n5009g2WwnTsmUeKs5jgrnrUf21SgEL1s65C3FL+HJefkQ@mail.gmail.com>
From: "Srinivasa Rao Mandadapu (Temp)" <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n5009g2WwnTsmUeKs5jgrnrUf21SgEL1s65C3FL+HJefkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


On 2/19/2022 8:16 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivas Kandagatla (2022-02-16 07:38:02)
>>
>> On 16/02/2022 14:41, Srinivasa Rao Mandadapu wrote:
>>> On 2/16/2022 7:50 PM, Srinivas Kandagatla wrote:
>>> Thanks for Your Time Srini!!!
>>>> On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
>>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>>>> b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>>>> index 5bf30d97..4277e31 100644
>>>>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>>>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>>>> @@ -143,6 +143,7 @@ static const struct lpi_pinctrl_variant_data
>>>>> sc7280_lpi_data = {
>>>>>        .ngroups = ARRAY_SIZE(sc7280_groups),
>>>>>        .functions = sc7280_functions,
>>>>>        .nfunctions = ARRAY_SIZE(sc7280_functions),
>>>>> +    .is_clk_optional = 1,
>>>> This is forcefully set assuming that sc7280 is always used in ADSP
>>>> bypass mode. Which is not correct.
>>>>
>>>> Can't you use devm_clk_bulk_get_optional instead?
>>> Yes. Agreed. Initially used devm_clk_bulk_get_optional, but Bjorn
>>> suggested for conditional check instead of optional.
>>>
>>> Again Shall we go for optional clock voting?
>> That means that the condition has to be dynamic based on the platform
>> using DSP or not. Which is impossible to deduce without some help from DT.
>>
>> I would prefer to stay with optional clock unless Bjorn has some strong
>> objection on not using int.
> I think we need the combination of optional API and bool flag. My
> understanding is it's optional on sc7280, but not on the previous
> revision, so we want to be very strict on previous revision and less
> strict on sc7280. Hence the flag. Maybe we should change it to
> clk_required and then assume optional going forward. Then the callsite
> can use one or the other API?
Okay.Will change accordingly.
