Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45242426C69
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 16:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CED168B;
	Fri,  8 Oct 2021 16:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CED168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633702150;
	bh=+hYfD8GE6YDqB5EWQCvmjtm6lC+COtpeb/na5hkT3yI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSc9j/cXP7Deg/HBRQ5dIuX+vKeZ3uh0VYQPaBb/IzMpfGSkB9dnkKmLlZuVtq/EJ
	 R3VX+TEV3ikN7j0N024Q/N9DloX8UBUvZ7kRx48k+e2YkUiy7NQDdBJY5fEul7E3Hj
	 YWaECCxSvvLUMv6hiy07oqVjTseyiyRAkko/qWNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CE82F80124;
	Fri,  8 Oct 2021 16:07:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3580DF80246; Fri,  8 Oct 2021 16:07:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476C2F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 16:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476C2F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="ls8rFAjK"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633702067; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0AUwiHljy/Jsgx0Ckk5s71QCrmfpt6geV2aG8yQfxKQ=;
 b=ls8rFAjKIx0RQMLL9qbmmH+gm/V3Cs9tpRXB4wlTNvuFoZZKtRn2hw9ZodhzyTq9hxFlTps+
 LBRO6wNTI5NncxZDBCcE84jua9biXQUMYHwkNxJt4ZtQX3Yila8UHsL0xy4ekNSvVWysj2Ri
 LaQskvdEvxeSRyVTPNZsqVfoCgE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6160509bf1c689606183aaea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:07:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4705BC4360C; Fri,  8 Oct 2021 14:07:23 +0000 (UTC)
Received: from [192.168.1.100] (unknown [157.48.163.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7ADAEC43460;
 Fri,  8 Oct 2021 14:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7ADAEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
 <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
 <20ddc4ea-e99c-5492-1931-be1999655563@codeaurora.org>
 <da23bfce-23cd-0869-d752-b0713136072a@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <5748236d-7db2-9d19-a113-6e66b3dee81f@codeaurora.org>
Date: Fri, 8 Oct 2021 19:37:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <da23bfce-23cd-0869-d752-b0713136072a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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


On 9/28/2021 2:01 PM, Srinivas Kandagatla wrote:
>
>
> On 27/09/2021 17:42, Srinivasa Rao Mandadapu wrote:
>>
>> On 9/27/2021 4:12 PM, Srinivas Kandagatla wrote:
>> Thanks for your time Srini!!
>>>
>>> On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
>>>> Update mic control register default values to hardware reset values
>>>>
>>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>>> lpass tx macro)
>>>>
>>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>   sound/soc/codecs/lpass-tx-macro.c | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>>> b/sound/soc/codecs/lpass-tx-macro.c
>>>> index e980b2e..66c39fb 100644
>>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>>> @@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
>>>>       { CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>>>       { CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
>>>>       { CDC_TX_TOP_CSR_ANC_CFG, 0x00},
>>>> -    { CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
>>>> +    { CDC_TX_TOP_CSR_SWR_CTRL, 0x60},
>>>
>>> This does not make sense as this register only has one bit to control.
>>> Why do we even need to change this, can you please explain what 
>>> happens if we do not change this?
>>
>> This register change is not making any impact. But when verified , 
>> reset state of this register is 0x60. so is the reason for change.
>>
>> Will revert it and post again.
>>
>>>
>>>>       { CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
>>>>       { CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
>>>>       { CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
>>>> @@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
>>>>       { CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
>>>>       { CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
>>>>       { CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
>>>> -    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
>>>> -    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
>>>> +    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
>>>> +    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},
>>>
>>> These two registers should have default value of 0x06 as this has 
>>> only one clk selection field with bits 2:1.
>>
>> In Kodiak document reset state 0x0E and clk selection field is with 
>> bits 3:1
>>
>> *LPASS_TX_TX_TOP_CSR_SWR_MIC1_CTL*|0x32200D4
>> Offset:     0x54     Reset State:     0x0000000E 
>
> In that case you should probably consider using 
> regmap_register_patch() for corrections to the default registers in 
> sm8250 case.
As regmap_register_patch() not working in this use case, updating 
defaults in probe for sc7280 specific differences.
>
> --srini
>
>>
>>>
>>> -srini
>>>
>>>
>>>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
>>>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
>>>>       { CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
>>>>
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation 
>> Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative 
>> Project.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

