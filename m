Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D974115B1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 15:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C7816A4;
	Mon, 20 Sep 2021 15:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C7816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632144438;
	bh=UG50o8Y63o45nDb1Fi3/Tgj5EmHlqJ8LYPGotAZRnxo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocyrHqwCmWzcrzQLZ0k4GEfdh9PWhtoyV+0HWe5I7oA+l/2H4Z8SG7W5XoPhdGeIO
	 nSzk4VT0oQFdtbeStZ5Jt7vhkrcmm2CJG423fFHIB03Jsv78v/Gv2WTwI1ISH3C/Du
	 qcwKwoB3ZzwlUnUj3USzoRxBmLVYlr9j+kbYWv0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D910F804EC;
	Mon, 20 Sep 2021 15:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87982F804EB; Mon, 20 Sep 2021 15:25:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 640D4F804E6
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 15:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 640D4F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PnuSR2v6"
Received: by mail-ed1-x52e.google.com with SMTP id eg28so38606005edb.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fnQFPyNQnVgzXIVUEHXtp70eiyNNUDqOkLiOuvUzb64=;
 b=PnuSR2v6OiCOGSzVEEKQpKpgIhXG5EoZ+Ev0QbiebTaL2dbwvVb3deWYVcwZM04o9S
 fnriGnHJfqDSMvPQY8msyWKDE7s2Tal6Yd9DsyEurT/dPU5e/wceL2vMwXyMJ8zEdpmL
 uAoFR28OgyGd9B7hbDUxKJms5KjQ4iswwzV044IUbEZ6HCIAKv7i7/Ml+fWaLMsoaTo+
 0/TA3XArpGwBy7Scn/n2dQsVSbkXSMwcNxgpNuJJF2XH2Vcxr+6i5DIF5O7LGjlTENdq
 TANahzgWrIu0T9dEIo/SvTufHoeMmqnnTzZ0s0r4ezSSsi6LVs/dw4CwEGAaMh2LS0Hs
 R4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fnQFPyNQnVgzXIVUEHXtp70eiyNNUDqOkLiOuvUzb64=;
 b=r+H7zrvNyZ/wTDhgUIOTaOBBkSP+1/hHTcZHRsIWyOcimdYo+fVHOtivv4be8xC+7a
 2kUqYiIeRLCh2RMOjAx4epSIA4VXffe7Dy2ThQ7ABb1rWKavaiHvQGak69CdojCwO87M
 cImsVFN2ahBnwGy3BkXZmu7FJy8/xWki9CAPTkjpemVCKntshOYmbv7C77cZH6tNSIT9
 sfbxlacei8Hscav80FC+9DZ5T8RWungi2j4xxeO84f7x9h1f4dl7GEoQuMNk6N+pWH85
 XKyCSrWNYozsRo537W0kG6z4TCdUCDKoqxmUCZsY+OMXTOGxxuoMI0mlUDokJQcsIwRC
 XzLw==
X-Gm-Message-State: AOAM530SEp1T19ZNjCWhXZ4Md695LVEX/KyjPOSUecw23k+shHk+GpAU
 0PCqvB5l7MzxqyvL5W7nsqaz/Q==
X-Google-Smtp-Source: ABdhPJwFRm04TtqLKziX/WoySMiRVV/jdimq1erlSAB7wjzNz7QWT/dYAeSUIh6enE0Nz39x24l/qA==
X-Received: by 2002:a05:6402:c8b:: with SMTP id
 cm11mr28988017edb.368.1632144313857; 
 Mon, 20 Sep 2021 06:25:13 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id dn28sm7045619edb.76.2021.09.20.06.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:25:13 -0700 (PDT)
Subject: Re: [PATCH 4/7] ASoC: codecs: lpass-va-macro: Change bulk voting to
 individual clock voting
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5f915592-0ca6-2839-43fc-6d9aef1484b7@linaro.org>
Date: Mon, 20 Sep 2021 14:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
> Change bulk clock frequency voting to individual voting.
> 
Can you please explain why do we need to move out using clk bulk apis?

Am not seeing any thing obvious behavior changing as part of this patch, 
more details please..
> Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to VA Macro)

Why this has Fixes tag? Are we fixing any bug with this patch?

> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-va-macro.c | 46 ++++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index d312a14..0ea39ae 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -193,7 +193,10 @@ struct va_macro {
>   
>   	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>   	struct regmap *regmap;
> -	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
> +	struct clk *mclk;
> +	struct clk *macro;
> +	struct clk *dcodec;
> +
>   	struct clk_hw hw;
>   
>   	s32 dmic_0_1_clk_cnt;
> @@ -1321,7 +1324,7 @@ static const struct clk_ops fsgen_gate_ops = {
>   
>   static int va_macro_register_fsgen_output(struct va_macro *va)
>   {
> -	struct clk *parent = va->clks[2].clk;
> +	struct clk *parent = va->mclk;
>   	struct device *dev = va->dev;
>   	struct device_node *np = dev->of_node;
>   	const char *parent_clk_name;
> @@ -1404,15 +1407,18 @@ static int va_macro_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	va->dev = dev;
> -	va->clks[0].id = "macro";
> -	va->clks[1].id = "dcodec";
> -	va->clks[2].id = "mclk";
>   
> -	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
> -	if (ret) {
> -		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
> -		return ret;
> -	}
> +	va->macro = devm_clk_get_optional(dev, "macro");
> +	if (IS_ERR(va->macro))
> +		return PTR_ERR(va->macro);
> +
> +	va->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	if (IS_ERR(va->dcodec))
> +		return PTR_ERR(va->dcodec);
> +
> +	va->mclk = devm_clk_get(dev, "mclk");
> +	if (IS_ERR(va->mclk))
> +		return PTR_ERR(va->mclk);
>   
>   	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
>   				   &sample_rate);
> @@ -1426,10 +1432,11 @@ static int va_macro_probe(struct platform_device *pdev)
>   	}
>   
>   	/* mclk rate */
> -	clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
> -	ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
> -	if (ret)
> -		return ret;
> +	clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
> +
> +	clk_prepare_enable(va->mclk);
> +	clk_prepare_enable(va->macro);
> +	clk_prepare_enable(va->dcodec);
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base)) {
> @@ -1457,8 +1464,9 @@ static int va_macro_probe(struct platform_device *pdev)
>   	return ret;
>   
>   err:
> -	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
> -
> +	clk_disable_unprepare(va->mclk);
> +	clk_disable_unprepare(va->macro);
> +	clk_disable_unprepare(va->dcodec);
>   	return ret;
>   }
>   
> @@ -1466,8 +1474,10 @@ static int va_macro_remove(struct platform_device *pdev)
>   {
>   	struct va_macro *va = dev_get_drvdata(&pdev->dev);
>   
> -	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
> -
> +	of_clk_del_provider(pdev->dev.of_node);

fsgen clk is registered using devm_* variant of clk apis, so why do we 
need this here?


--srini
> +	clk_disable_unprepare(va->mclk);
> +	clk_disable_unprepare(va->macro);
> +	clk_disable_unprepare(va->dcodec);
>   	return 0;
>   }
>   
> 
