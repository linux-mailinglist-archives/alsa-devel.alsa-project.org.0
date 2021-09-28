Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A141AAA3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CDB1695;
	Tue, 28 Sep 2021 10:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CDB1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632817959;
	bh=MMMzR5cLQW+1lGaPMJH9qXVocUgo0KB5fgvMQ0YWPkA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcQ9qcGAbCeHLzP0LpNUVbPlCNk3Rl03mcX2eamHw3mEA2Zt7iqVFLqR99LheqP9V
	 yo+c+AzD/pspeicMazXcyoEx9xYwkp7sbIjNG4f2IBYN4piE5cbTaR9p7UOhwfJS9q
	 I0IoRHKHTYOt0KYHWElH2QT8Xa0imkTvY8jU9U9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F86BF804D1;
	Tue, 28 Sep 2021 10:31:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD082F80105; Tue, 28 Sep 2021 10:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B877F80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 10:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B877F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Iw9B8dZq"
Received: by mail-wm1-x32f.google.com with SMTP id v127so2762664wme.5
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YmNYTNBGpZvwgNJ/3llhM6f6fKai+uXQmO5CueqZOHU=;
 b=Iw9B8dZqcRBTDvMkHFJwYFI6cS196dXNMLcqp+SpVn27CUxZ72207rqrBMBRVmYSdS
 AKWkGAC2ASDfYg9nsHaSeou/w02RfowYKr6/Gp1KOQIHNdF1fO1dg4V31ml4gDZR5sSy
 AMYRXIPaD0TMoab+JHxtXFwVrIOM8pbq6D4xrYqSIOeUR9p2IyYWMxORLxroadaJE/6b
 Ez9W1dY2gAzaIlhNdM5yest9yeGSsAMEUBOtpTnbqa7I6XxchvtgadxlX7g7s9iNvyWk
 9Ka0VxbN4MHmEH/gYfJXb6u4O1dj2O67RwNsYiiMNy0zV+oSCeEh2QV1uiO0YjsHGNLQ
 JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YmNYTNBGpZvwgNJ/3llhM6f6fKai+uXQmO5CueqZOHU=;
 b=6AsKAyyWGqP7/QMODM3ksE0simj5fH6FPDiQS4odN+R8WCNtuC4Qn5dufrPVoPw3Mq
 7XdrvEDigp0eUpy9hqrWvh+bW9SSL2k59A9jvPygcA6TTytQkIKzgm/6qHCD9epntBc+
 KH+IM+l6WP9AwuIZHmEkrYEsI0NaTiVbubnzdUx5NSaIsa03c5IqO79n9pURTzPurZop
 zi9Yc3qi/umPSUmHOq0BjK3YnckKq7QyA8wwtmNKiI+19+WtkCRLN1+7AM2cO8SJGkv+
 QWeNGU76feAT3Wl3bj9MiOp69V/vy94FTh0+IRkSDsmwvlQ4Y91kjaNsA41RPsPIeWX0
 V8WQ==
X-Gm-Message-State: AOAM5317SjjCP+zvbB8ao7YYeSg0NLC1kkTNjsfD6OIGsCaOVQwXG0vA
 ffqI3MwVo5HbNFVW+7KlsjCFaQ==
X-Google-Smtp-Source: ABdhPJz6fv4dVDrrADbMFfj+UPr/oF1PoftGT0gkA4xkC1zU4drUe8tTSfrMzDQxXRS90YiKxN0lKA==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr2103589wmc.15.1632817881868;
 Tue, 28 Sep 2021 01:31:21 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y13sm1331454wrm.48.2021.09.28.01.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 01:31:21 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
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
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <da23bfce-23cd-0869-d752-b0713136072a@linaro.org>
Date: Tue, 28 Sep 2021 09:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20ddc4ea-e99c-5492-1931-be1999655563@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 27/09/2021 17:42, Srinivasa Rao Mandadapu wrote:
> 
> On 9/27/2021 4:12 PM, Srinivas Kandagatla wrote:
> Thanks for your time Srini!!
>>
>> On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
>>> Update mic control register default values to hardware reset values
>>>
>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>> lpass tx macro)
>>>
>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>> ---
>>>   sound/soc/codecs/lpass-tx-macro.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>> b/sound/soc/codecs/lpass-tx-macro.c
>>> index e980b2e..66c39fb 100644
>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>> @@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
>>>       { CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>>       { CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
>>>       { CDC_TX_TOP_CSR_ANC_CFG, 0x00},
>>> -    { CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
>>> +    { CDC_TX_TOP_CSR_SWR_CTRL, 0x60},
>>
>> This does not make sense as this register only has one bit to control.
>> Why do we even need to change this, can you please explain what 
>> happens if we do not change this?
> 
> This register change is not making any impact. But when verified , reset 
> state of this register is 0x60. so is the reason for change.
> 
> Will revert it and post again.
> 
>>
>>>       { CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
>>>       { CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
>>>       { CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
>>> @@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
>>>       { CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
>>>       { CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
>>>       { CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
>>> -    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
>>> -    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
>>> +    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
>>> +    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},
>>
>> These two registers should have default value of 0x06 as this has only 
>> one clk selection field with bits 2:1.
> 
> In Kodiak document reset state 0x0E and clk selection field is with bits 3:1
> 
> *LPASS_TX_TX_TOP_CSR_SWR_MIC1_CTL*|0x32200D4
> Offset: 	0x54 	Reset State: 	0x0000000E 

In that case you should probably consider using regmap_register_patch() 
for corrections to the default registers in sm8250 case.

--srini

> 
>>
>> -srini
>>
>>
>>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
>>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
>>>       { CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
>>>
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
