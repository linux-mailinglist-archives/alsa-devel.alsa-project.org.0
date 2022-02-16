Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623DB4B8CA2
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 16:39:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0861918EB;
	Wed, 16 Feb 2022 16:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0861918EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645025962;
	bh=2Fx6N7b0Twwq3sX+a8I7HdDhtEqYzjXcIdv0RubSs5w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqg2WahhAw7kvNXmTbeayQXZaGw7YiIcR2JE3xlhNz4N2/vYVR8FEhvyfZkJ+82hC
	 kKI8GAfdgeIH81mYdGFkSMFBoGZxn7T72BB2wkLdy7r5mjfIm2PdBkOvCiJa1TOFUf
	 FXP6HNH3ApKJ16+JDB9pX/SNFN3wc3jRcLDMpjq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD13F80134;
	Wed, 16 Feb 2022 16:38:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FB95F800D8; Wed, 16 Feb 2022 16:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F547F800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 16:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F547F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZH3t3Vjo"
Received: by mail-wr1-x436.google.com with SMTP id e3so4191007wra.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4D8vkLWPsB+L5NVGMdhKjexz7qk9u2esSIMnsRYj4yw=;
 b=ZH3t3VjooA0WMKhqp/ZjVeXyOXGVqiAfn7O1tA87Uj+1ncONnemMgy3RuoMPrWErOn
 I3aHn+NFoulMcZCMFNDCh5t6uuQF9Z/XWn98klHsiY32L45yb8tdKoR2526NEQ4eJ5Lk
 xo7SD80kHm1YeAsh18wiPuwtaKUJjDoiXQmsO4tkwR87eCJAlPTX8X/RwY7ar7I4sfxu
 3lVB42wzr5NDJW2X0mSYt31UjNAA83Rp4E2Fr4GpVBJA4YFvRKhVYNnLYJcDm6k1COae
 HUBU59F0LDM+12oAqQWSGuASDICxU7uLIj79gyCgtJVXcG1qzwBHz8xrM8oqAaM3Fw0C
 NI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4D8vkLWPsB+L5NVGMdhKjexz7qk9u2esSIMnsRYj4yw=;
 b=5RQbl+z+XjiKA2Oa8mmNUH91WPLCg1TKwEdaeEhRibz/oUAkxIjr+Ex/8JVsr6eI2H
 vj3RAhcAEi8Q6Y00JSsr1tblU22yw7E2XjGEUEwsaQzY8X1Qzjhen0oMhZOgQ9EuqUVp
 CJ5faVVakBf6XSqjqyqgy6idRebabQI8bcu/1ppWx1D+wTuyvFEZfkJ0DilyUdAUp35i
 PShIELtGvAyMbUYNHA0EEq7rKIM9qHNrRyPihvIfN1iBq1mN/SaUOUZdE7M8nSZbeRdm
 Gx67mSZP3Ij112fk2VXPWbM4WBuUxwpwv5oOHwWdrfQd6ZJVbBIjIjaB1Sxd6uaT4FF6
 8Gng==
X-Gm-Message-State: AOAM532OpVVAEW/LDinXvpQY7ZjgKw39RRuN5ggNg1iL1mo17i3+98Yf
 1ZNCAbssqIxEPraqCBvfjKRz0A==
X-Google-Smtp-Source: ABdhPJzwHrl5EQgylw3JeoAybMGg4Xtm2WpU9q/hqKvoLx1ryIPLVXKSfbFhx9NIFxZSg7OvNw7AjA==
X-Received: by 2002:a05:6000:36b:b0:1e3:8a3b:add8 with SMTP id
 f11-20020a056000036b00b001e38a3badd8mr2675144wrf.283.1645025884614; 
 Wed, 16 Feb 2022 07:38:04 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id az2sm28127598wmb.2.2022.02.16.07.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:38:04 -0800 (PST)
Message-ID: <09b00fe9-1770-1723-3c4c-6c494da87e8d@linaro.org>
Date: Wed, 16 Feb 2022 15:38:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 7/7] pinctrl: qcom: Update clock voting as optional
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-8-git-send-email-quic_srivasam@quicinc.com>
 <a209336a-9108-f1ac-ee6d-a838df115c6d@linaro.org>
 <b663f63f-4a5a-3a2a-9be7-fa7258ce93c5@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b663f63f-4a5a-3a2a-9be7-fa7258ce93c5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 16/02/2022 14:41, Srinivasa Rao Mandadapu wrote:
> 
> On 2/16/2022 7:50 PM, Srinivas Kandagatla wrote:
> Thanks for Your Time Srini!!!
>>
>> On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
>>> Update bulk clock voting to optional voting as ADSP bypass platform 
>>> doesn't
>>> need macro and decodec clocks, these are maintained as power domains and
>>> operated from lpass audio core cc.
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>> ---
>>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 16 +++++++++-------
>>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>>>   drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>>>   3 files changed, 11 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c 
>>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>>> index 8a82fd9..103f0a6c 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>>> @@ -407,13 +407,15 @@ int lpi_pinctrl_probe(struct platform_device 
>>> *pdev)
>>>           return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>>                        "Slew resource not provided\n");
>>>   -    ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>>> -    if (ret)
>>> -        return dev_err_probe(dev, ret, "Can't get clocks\n");
>>> -
>>> -    ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>>> -    if (ret)
>>> -        return dev_err_probe(dev, ret, "Can't enable clocks\n");
>>> +    if (!data->is_clk_optional) {
>>> +        ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>>> +        if (ret)
>>> +            return dev_err_probe(dev, ret, "Can't get clocks\n");
>>> +
>>> +        ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>>> +        if (ret)
>>> +            return dev_err_probe(dev, ret, "Can't enable clocks\n");
>>> +    }
>>>         pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
>>>       pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h 
>>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>>> index a511d72..c1079bf 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
>>> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>>>       int ngroups;
>>>       const struct lpi_function *functions;
>>>       int nfunctions;
>>> +    int is_clk_optional;
>>>   };
>>>     int lpi_pinctrl_probe(struct platform_device *pdev);
>>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c 
>>> b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>> index 5bf30d97..4277e31 100644
>>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>> @@ -143,6 +143,7 @@ static const struct lpi_pinctrl_variant_data 
>>> sc7280_lpi_data = {
>>>       .ngroups = ARRAY_SIZE(sc7280_groups),
>>>       .functions = sc7280_functions,
>>>       .nfunctions = ARRAY_SIZE(sc7280_functions),
>>> +    .is_clk_optional = 1,
>>
>> This is forcefully set assuming that sc7280 is always used in ADSP 
>> bypass mode. Which is not correct.
>>
>> Can't you use devm_clk_bulk_get_optional instead?
> 
> Yes. Agreed. Initially used devm_clk_bulk_get_optional, but Bjorn 
> suggested for conditional check instead of optional.
> 
> Again Shall we go for optional clock voting?

That means that the condition has to be dynamic based on the platform 
using DSP or not. Which is impossible to deduce without some help from DT.

I would prefer to stay with optional clock unless Bjorn has some strong 
objection on not using int.

--srini

> 
>>
>> --srini
>>
>>>   };
>>>     static const struct of_device_id lpi_pinctrl_of_match[] = {
