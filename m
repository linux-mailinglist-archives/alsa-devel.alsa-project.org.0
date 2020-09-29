Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0927C072
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92C2B1891;
	Tue, 29 Sep 2020 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92C2B1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601370280;
	bh=1fuiQB5VJJlRbhWsfSDuNWsO8gqIBvoLIq5ZJ4RfUkU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnVuPtRAZEsPsw0qb9WVAfihHr48IFY67W0UVrOvzzKhVnP5mCCfDd11JtYPk2D0m
	 oAif8juHV7g3RbRHKV5TKkEbiM7qKxO6MmIKJZhbBsk40FpR2u0I8HDMoWZMHi9Cwe
	 LU8+oDNSLKAAtD7L9iHuFN+qjiuCv+xiklgnpNaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9658EF800DD;
	Tue, 29 Sep 2020 11:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EE16F8022D; Tue, 29 Sep 2020 11:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8C93F800DD
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C93F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DO2qH4j9"
Received: by mail-wr1-x444.google.com with SMTP id j2so4444749wrx.7
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/A7aNSm3cdga1VZaRmJ05RVUoqJfegPG8Brx5Ka5WGE=;
 b=DO2qH4j9aG8GSMVOMJ14DMKAPsmoURMiGLFD2cXSDA+rFlLU3RUvtnvdUxZyjZEWoE
 hUeYHGiMv8zI1FteDtN13NQhpVyXsnmryARr5aCX2SHQHKCrHFpsy5qcO3ciYgZZFlKD
 mF+l+dH3+fPIN80ML1NEtd0s11s9qbDf7Qw4Ffik03AAY7VthUMA0Rac32EEO8lN4q59
 zqxhasPIrscXXMn/fuRFuWHNk3ams+hG4O1HKi39AjFLCJYLObl/2mm5qG60vub7QOPY
 mdG/7YxhwmCg5aSRqrr9IkdXIIHMXmE9KlKEWOJyHPnYO+v56Rf+xHaeFfEUPzEVrgvR
 0J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/A7aNSm3cdga1VZaRmJ05RVUoqJfegPG8Brx5Ka5WGE=;
 b=dmwm+c6JTEDrmy8hgxnIvaHju89BxJXWMpaiiy11baiHhVuWvYeT1z8v2ksX6lS8Ew
 vb93LPC/A/Ita/Py7ydaW9iYECFNVAUvyUyMW4w8VmGDk+wd2F+0ZVWgetJ61g3vDpwa
 QjHbdgs/6bANc6BlMWIprV+6bJ3IB2nQ4LkXjjdON/pPmF9/2e26+M1pJukmr6ve4h6K
 VkTg3u/QaZZQn6/CA0Iv3B5UuUc69hnyuBXX0draPznOpK1mgSs15FtCwGbqWFbCip6H
 1s7WOl+qL5z/tgskBBNVs0CV6ZJLd13/Nbji/OvHRVkwARb49aNsLHeYp3hZXZ7oyc+X
 Fxgw==
X-Gm-Message-State: AOAM532BQX9jVLPQW0O+oP7lbBS72bAjKyX+rCLiC+ZXZrYoHHtiTdjB
 tMjxbBxQP2qLHjGVGLLs2/vqKg==
X-Google-Smtp-Source: ABdhPJzQKyr2tz/uJM9dF4tNkWt1NDTUANm3HQkHYNhXxHlAf3Gx3/6+nhwrh7etV+RVPrZyqC407Q==
X-Received: by 2002:adf:c188:: with SMTP id x8mr3236405wre.201.1601370126436; 
 Tue, 29 Sep 2020 02:02:06 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u12sm5199475wrt.81.2020.09.29.02.02.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 02:02:05 -0700 (PDT)
Subject: Re: [PATCH v7 4/6] Asoc: qcom: lpass:Update lpaif_dmactl members order
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
 <1601286811-25962-5-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8059e28b-39c5-d71b-3e22-357d4d121f7e@linaro.org>
Date: Tue, 29 Sep 2020 10:02:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601286811-25962-5-git-send-email-srivasam@codeaurora.org>
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



On 28/09/2020 10:53, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update the lpaif_dmactl struct members order to match
> HDMI reg map members sequence. Separate Interface reg map
> as it is used for I2S control but not for HDMI control,
> to make use of bulk API, which makes code more readable.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-platform.c | 8 ++++----
>   sound/soc/qcom/lpass.h          | 6 +++---
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index e7cf4e5..db0d959 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -71,13 +71,13 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
>   	rd_dmactl = drvdata->rd_dmactl;
>   	wr_dmactl = drvdata->wr_dmactl;
>   
> -	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->bursten,
> -					    &v->rdma_bursten, 6);
> +	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
> +					    &v->rdma_intf, 6);
>   	if (rval)
>   		return rval;
>   
> -	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->bursten,
> -					    &v->wrdma_bursten, 6);
> +	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
> +					    &v->wrdma_intf, 6);
>   }
>   
>   static int lpass_platform_pcmops_open(struct snd_soc_component *component,
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 51c9991..7089d4c 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -31,9 +31,9 @@ struct lpaif_i2sctl {
>   
>   
>   struct lpaif_dmactl {
> +	struct regmap_field *intf;
>   	struct regmap_field *bursten;
>   	struct regmap_field *wpscnt;
> -	struct regmap_field *intf;
>   	struct regmap_field *fifowm;
>   	struct regmap_field *enable;
>   	struct regmap_field *dyncclk;
> @@ -110,17 +110,17 @@ struct lpass_variant {
>   	struct reg_field bitwidth;
>   
>   	/* RD_DMA Register fields */
> +	struct reg_field rdma_intf;
>   	struct reg_field rdma_bursten;
>   	struct reg_field rdma_wpscnt;
> -	struct reg_field rdma_intf;
>   	struct reg_field rdma_fifowm;
>   	struct reg_field rdma_enable;
>   	struct reg_field rdma_dyncclk;
>   
>   	/* WR_DMA Register fields */
> +	struct reg_field wrdma_intf;
>   	struct reg_field wrdma_bursten;
>   	struct reg_field wrdma_wpscnt;
> -	struct reg_field wrdma_intf;
>   	struct reg_field wrdma_fifowm;
>   	struct reg_field wrdma_enable;
>   	struct reg_field wrdma_dyncclk;
> 
