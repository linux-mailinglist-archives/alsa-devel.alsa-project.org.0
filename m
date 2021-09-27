Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC88641926F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 12:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2391693;
	Mon, 27 Sep 2021 12:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2391693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632739495;
	bh=pMKVS+GjUGF8NLs3k6H5ucU3rX9vz5e+PU0C8rLDd5w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcPCNZDfEvUL+va1OEL9mOLP4MK8D/iLvHFdGLe/eFYIjKVkduKaN5JubbPrE5wA1
	 5XrNIcJRwGEPW3RDFKkpxf5l8JIo6q89H4UJe2WjFvkpeFPI9E399Ct6Ol4Qrwn1Zl
	 ifuRycgr1UGyCh2iLOcKKJYBaayrSoRkS4dtI9iY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E49F80301;
	Mon, 27 Sep 2021 12:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66239F802C4; Mon, 27 Sep 2021 12:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6742EF80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 12:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6742EF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ke3i1yko"
Received: by mail-wm1-x336.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so79720wmb.3
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 03:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qXNuvpJlyjSNrgzOqRqsp7gQ1I5PBxPfkM0hf91W8lY=;
 b=Ke3i1ykoPbGEAAEA4nUyXqJpkf2ynn+0FDzRDaoFigBy5Mw8qFbOauhlbROJ3lnzWG
 pM3p3zbREIOSs0XG5wnTUNhQPcOQrBUSDRK1GeGm6y/QTpUulN7mzMfaYqf4t3jHWWk5
 c2CDdOxTAdHeeEmjEIuUPvRG1tqM6zPV764wt63J6rOCX+OkI4iJJjrbEJw3yS/348IA
 lwBYA1np4+430aNrhcJS46DdVoqSX8gkZkkuiPIHTz9f8eBv83SQsEEbdQdI5ttuIY8G
 g8VZB/97UL4EscYW4M2bO82HZAC4Q0GRYzh0M46h1xs8FJoMxAu8aq2bu5khZtc3/6+X
 VuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qXNuvpJlyjSNrgzOqRqsp7gQ1I5PBxPfkM0hf91W8lY=;
 b=TpNj/ULnuCYeHlxYRXKW++9U2/9aO5qumPCZ183CbH5LmCmxE0esfeGbsDdeTSFqrO
 oQZnC2Gds1pEcUgkcRStFzUOx0mJh+zndwk0Nv4rJ8mqqX8dgM0v+X+u+EdSjYV5mqVA
 KaPkr3MWXj2nA746xdjYHDt2VIEDWnQeDmKAKmAvAEu90duzMTW4o7Ca371DQ0Wl5UiZ
 kA6opdLgKEsVtSOLWzg6wNIsTKoeWMc2VtJ9jnz3Qnaw1jIS81dSEVg2p5ye8J8Sl98s
 sImpt7OoJZU9LaMgy9u0irKcG80sKwtM5t9sWCXJGGerY724n91V1WxnZ6RB4nUePDQK
 sI2w==
X-Gm-Message-State: AOAM532zNvTIEvo4W5hOTuJgIMEtAcp/ccQC7cmm4exB+xDahgxT6Egw
 7sEJOO2En75pHrDLYtpCGsoFcjUErODp3A==
X-Google-Smtp-Source: ABdhPJwNBcpoxdG0Xf6e3LsdVnmfnOjtFC7vYinvbFoeRcsD16ENxLXAafyb9zhpHqxxcSVSQGSa6g==
X-Received: by 2002:a05:600c:28e:: with SMTP id
 14mr2938720wmk.88.1632739381393; 
 Mon, 27 Sep 2021 03:43:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g17sm6278181wru.62.2021.09.27.03.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 03:43:00 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] ASoC: codecs: Change bulk clock voting to optional
 voting in digital codecs
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
 <1632313878-12089-6-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2b401e05-ae34-846e-8e1d-b5db3e0df40e@linaro.org>
Date: Mon, 27 Sep 2021 11:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632313878-12089-6-git-send-email-srivasam@codeaurora.org>
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



On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
> Change bulk clock frequency voting to optional bulk voting in va, rx and tx macros
> to accommodate both ADSP and ADSP bypass based lpass architectures.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Reviwed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



>   sound/soc/codecs/lpass-rx-macro.c | 2 +-
>   sound/soc/codecs/lpass-tx-macro.c | 2 +-
>   sound/soc/codecs/lpass-va-macro.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index c2b9333..2bed5cf 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3531,7 +3531,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>   	rx->clks[3].id = "npl";
>   	rx->clks[4].id = "fsgen";
>   
> -	ret = devm_clk_bulk_get(dev, RX_NUM_CLKS_MAX, rx->clks);
> +	ret = devm_clk_bulk_get_optional(dev, RX_NUM_CLKS_MAX, rx->clks);
>   	if (ret) {
>   		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
>   		return ret;
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 66c39fb..c288471 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1794,7 +1794,7 @@ static int tx_macro_probe(struct platform_device *pdev)
>   	tx->clks[3].id = "npl";
>   	tx->clks[4].id = "fsgen";
>   
> -	ret = devm_clk_bulk_get(dev, TX_NUM_CLKS_MAX, tx->clks);
> +	ret = devm_clk_bulk_get_optional(dev, TX_NUM_CLKS_MAX, tx->clks);
>   	if (ret) {
>   		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
>   		return ret;
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 70f09b4..11147e3 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1408,7 +1408,7 @@ static int va_macro_probe(struct platform_device *pdev)
>   	va->clks[1].id = "dcodec";
>   	va->clks[2].id = "mclk";
>   
> -	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
> +	ret = devm_clk_bulk_get_optional(dev, VA_NUM_CLKS_MAX, va->clks);
>   	if (ret) {
>   		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
>   		return ret;
> 
