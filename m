Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2652734D6
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 23:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B4516C0;
	Mon, 21 Sep 2020 23:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B4516C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600723338;
	bh=facjH35NZabwJ9v2Nw07deRnC90G5xd0yFBvEApuS2U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgM8rjuI8GjCLAxjApO1b5I6ELFj5wXt06WAff+Og/AvnHkBMqJMDI11x5ezgFFFT
	 akMf8bxw1wg/ZaI3dY/1OFLFmmR54bHJlqeOAPm5ORBEmIzLERHxU1esUz12cAKmOj
	 sVyTZlGipo1Hs/8MFJzcZFeDVMejyH2abC1qif74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1117EF801EC;
	Mon, 21 Sep 2020 23:20:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C1CF80171; Mon, 21 Sep 2020 23:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 660C4F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 23:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660C4F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xCdO1gRc"
Received: by mail-wr1-x444.google.com with SMTP id o5so14400474wrn.13
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kIlLYItMEH57/OIqphwHXbMgNacdFFxpGWnfPMYalYM=;
 b=xCdO1gRcr6I9/MbCD0uw5F/eP5g5juh4KmwgJ74QrZi7bp9XafkV52CkCDZyuPvywJ
 klFDm00snWt05m5t0d6GVartPTQnXWWgSeVqT0GLO42aNW4NaSU2qlr4iAIO8nAcwav9
 Kd6FnvQtYG/wDbGoxOEL/k7OvVlLsAtPNpMyXxgLufJmto4gi9VtkwXbCVCd8mZ+iOBW
 y+iDOd8TImm7iFI9b9o2WEkK+x81XTI8f9sa3lpdPV/0oAyLeGhy2JAYNKG4j5YwJ6PJ
 CVho83FUl9DcMa0mWLy5Adn9Dkzorkkyh9P65qDGGkEAb4F5AT5yL74NYtt6LT5v5UGB
 9ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kIlLYItMEH57/OIqphwHXbMgNacdFFxpGWnfPMYalYM=;
 b=tG43nTcOB7gUrKLszbsiBLoiyIg+vnpw2w1J1ECpWQczIUZC2mpb6KqSBYpvtWmRbe
 tsGuT2KqJVMotyATNNjKQ4ylUPpBvzb56I9o6+9QkVxBQZBtCHXv7LMxtIjRfiX1XzbA
 8VDzn8x9CZvDO/4h2K5UM8knkaGAs4HJ+iT9jq0rjId+l/rCu6SKfwuxC5qnvruDox1m
 EXEFuS+zhTHky1hML3krO//SGXjQg0kUFwe5xAXYyPL+vWcZ5NBQ3xJxQWQkkVAp+PUT
 Yn3RQK/peppNjjTs9CD1HYjvobUWWjitz3vBA3jdiRw9iqR8ESAXOUZ4qQQRZgRWAcxd
 dtWg==
X-Gm-Message-State: AOAM532t6qAfDflcUAAJELfZVCJNe2C4JNkOpwUz1zjTC5UDnGb6kfgU
 ubb70gKo/CshmhVkMOyuVnjVpw==
X-Google-Smtp-Source: ABdhPJyF0BsM1hu0mJu+3NmgGTwLh8BB1+qR4UB77Xt7FosUKuVI2AExucUuS/VzfoNIEgGOPKDDPw==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr1722763wru.318.1600723224330; 
 Mon, 21 Sep 2020 14:20:24 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i83sm1202081wma.22.2020.09.21.14.20.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 14:20:23 -0700 (PDT)
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
Date: Mon, 21 Sep 2020 22:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 18/09/2020 07:04, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-cpu.c      | 2 +-
>   sound/soc/qcom/lpass-platform.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 1ee6d8b..5d84f63 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");

Interesting!! this patch 
https://lore.kernel.org/alsa-devel/1597402388-14112-11-git-send-email-rohitkr@codeaurora.org/ 
just took it out and you add it back in!

Index is always preferred over name w.r.t device tree bindings, so lets 
stick with that for now!
Unless you have any strong reason to lookup resource by name?

--srini


>   
>   	drvdata->lpaif = devm_ioremap_resource(dev, res);
>   	if (IS_ERR((void const __force *)drvdata->lpaif)) {
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index df692ed..35aead1 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -638,7 +638,7 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
>   	struct lpass_variant *v = drvdata->variant;
>   	int ret;
>   
> -	drvdata->lpaif_irq = platform_get_irq(pdev, 0);
> +	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
>   	if (drvdata->lpaif_irq < 0)
>   		return -ENODEV;
>   
> 
