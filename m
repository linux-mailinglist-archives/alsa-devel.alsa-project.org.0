Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB9613D62
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 19:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D80A1681;
	Mon, 31 Oct 2022 19:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D80A1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667241052;
	bh=t5lid12CJGIdiFtHbqBAOOuz2rmbonGfsixXSMfYuCQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NuQeiR8cLlQ8+PUZa4EA+Z/GdvKHi5uqhJYw8g6FGDFes38Bba6wQfZIiAuQOwGw2
	 +Pds88dE2timzPJzdn3eT1psaz5O6DrL4aspEAlYee1r0/VLDklWlnNVDkfvsqKjOT
	 kfPR4bizJMoyYwXLKDknlfBmPYLFG2NwwZSHhTg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B1AF8055C;
	Mon, 31 Oct 2022 19:29:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1031F8055B; Mon, 31 Oct 2022 19:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C3AAF80558
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C3AAF80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HZ/0UJ8w"
Received: by mail-wm1-x335.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so8556451wmb.3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LlUfkjYYiQUn+hV5fhdZbKU09G31Rb+nq+V7VvzQ2Fs=;
 b=HZ/0UJ8wkTGZ/sCQeiRZoBv52Db+m0n8A3KfzelK5fr4LXUcAMToPZ7R7FfWtUVw4a
 za9cQ5L+iQYLdYSD0Y84NljCjxTqe/uSH/8CIHWAakb/Galvyx0733h3HTD8as01M+ZW
 EZC1Fnp6qRtvbrrADEIZ1v8Mfi+Hr4NegLHLFJ/VwjHKBX13OVzX9qOYyszmARfjZy1d
 wizxDraCQfrxtSIatUxunX+VHKU2aSuRf1VqAPLA2CSsp72/LkDpRB0MrawrGXfSL590
 QdaFL2kmDz8rjbSkvYbka9fMQRco/y+nSO7h2XnneQ3FrNgWj9MSsENgDPcV3U5jqUTe
 vbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LlUfkjYYiQUn+hV5fhdZbKU09G31Rb+nq+V7VvzQ2Fs=;
 b=uhXI5L5FY/VnBbnkeQBdSJu0QhnHc3fMxk9J6o8UOy9tnAHFLgKQoPRa4Qj6AJEeOk
 /px4OXZ7+V39vWJpaNuIosAwZid/pQLHAF2NyPZE8asAKK2gWNc4NxkcIY+StJCSrWHQ
 VrZViCdwhHAxWWctSSLCueMNN72PwRRADLp0cj2odOg+cE0Z2bQ8xsXuwT5ECVZ1Bp7A
 IKCQaM0e+dWGcIfqC5ebJFSe4WrrqZ/NZ6IjB1n7R/NLxnT4i88LYprEGULpfD1teGpz
 GWapwQmj6qcjUevCGIK8XMHdu+CFFKL8woYt10Fqh3A8HgvLQlJPT83vJn5kRJC5nkLT
 p+Bw==
X-Gm-Message-State: ACrzQf2sEJbMKFuOmh7M3qg3hYTdTGkRriDR4Eyu1AkViGPC3ihMip54
 553gBsDXCGPn0XmO4Qsu6IzklQ==
X-Google-Smtp-Source: AMsMyM78R6nUUr+MeluBZtUpWGSDuxd/FMrN+uJmxzmIigg7TLZxDyukSL5adbjFn2RdeWVvBW8qpg==
X-Received: by 2002:a05:600c:695:b0:3c6:b7f1:6f39 with SMTP id
 a21-20020a05600c069500b003c6b7f16f39mr9385279wmn.5.1667240947769; 
 Mon, 31 Oct 2022 11:29:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 bj29-20020a0560001e1d00b002366b241cf3sm7746285wrb.35.2022.10.31.11.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 11:29:07 -0700 (PDT)
Message-ID: <8e3bd948-6649-742b-ea4c-4f7236d156a5@linaro.org>
Date: Mon, 31 Oct 2022 18:29:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] slimbus: qcom-ngd-ctrl: check for device runtime PM
 status during ISR
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
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



On 28/09/2022 14:20, Krzysztof Kozlowski wrote:
> Slimbus core interrupt is getting fired after suspend. At this point
> ADSP slimbus hardware is off with gated clocks which is leading to an
> unclocked access when HLOS slimbus tried to read the interrupt
> status register in the ISR.
> 
> Co-developed-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied both,

--srini
>   drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index cec11aa106bf..ba36eb5c0de3 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -763,7 +763,14 @@ static irqreturn_t qcom_slim_ngd_interrupt(int irq, void *d)
>   {
>   	struct qcom_slim_ngd_ctrl *ctrl = d;
>   	void __iomem *base = ctrl->ngd->base;
> -	u32 stat = readl(base + NGD_INT_STAT);
> +	u32 stat;
> +
> +	if (pm_runtime_suspended(ctrl->ctrl.dev)) {
> +		dev_warn_once(ctrl->dev, "Interrupt received while suspended\n");
> +		return IRQ_NONE;
> +	}
> +
> +	stat = readl(base + NGD_INT_STAT);
>   
>   	if ((stat & NGD_INT_MSG_BUF_CONTE) ||
>   		(stat & NGD_INT_MSG_TX_INVAL) || (stat & NGD_INT_DEV_ERR) ||
