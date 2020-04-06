Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51BA1A0197
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 01:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DEF91616;
	Tue,  7 Apr 2020 01:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DEF91616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586215292;
	bh=gbIM8AmWdapqTdTlPUqtZqzGyitGX4Y8s6y5mUsVmww=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=im+B8pjrKFc5AGjhah7MQKH/ktZkq9HOlChQJonmx9bEfE7yMk+l48SFUTzyuYEPT
	 Jcf2U8OqgbJowsHxMxO2BVQqgczd9US4xgSDDWU7Tu7UfTNdC1JAxysOYUj4sV46Al
	 cUpl7x5vntHrhj1FEQa3S2YTOO3X3NIEscdhkV40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87FB2F80121;
	Tue,  7 Apr 2020 01:19:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28494F80143; Tue,  7 Apr 2020 01:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56900F80121
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 01:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56900F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wh907092"
Received: by mail-pj1-x1044.google.com with SMTP id z3so574276pjr.4
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qiEMQ3MnZPBtfcN59NTsvK6kDONkxcqt/LljkK1BS58=;
 b=Wh9070924djEGtjlOfMWm3UFGyjc2B4vmxZxdcBAFkiAc1QiSjxqTx9d0m8DBopdP7
 HuDT/VhNJC+8tM727HYCqdlOtJZVUQ8xhLKP2twBf5CUd4KQ15FMv7A9rkzcX3JPOUpe
 MV6It+FIRA2BIRSbq/bI6iw3+sXW8cqRPbwa7Y9KrRro2K3Nv0TiNBsKtmLZ2SErQfJl
 YJcpMjKVh/0EVzznKwspgZgcDJLvG/D4bnd9eBi1I62eZKe5iKtbub4+5EnPwyRRTtC5
 TIZskK/zQ/mhyIhM7l8BYnFwGJTpp6KELsy9FFTvN0Uq67B2kLRPOSKlceAnBHUE/iAw
 sPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qiEMQ3MnZPBtfcN59NTsvK6kDONkxcqt/LljkK1BS58=;
 b=iU3kfXR8pyVXCLQfGVenL3//LrNCPMFLGv7j5U1ySGaGLPT4+E9fa4C0Dt6LUfkwen
 MMdzPCqz2UNqQ+vWoxGLxK31YcCtPDHZ1LEVn4VMXFXHhqjRvO7p2v6k6zgBSU3NBr8s
 04n2YZQqVlz4e2FH8bf5UabtAxhMWEzk4ZdvdxxTZBP/pTsuYdLfRYLcyigWWaMWRjz6
 8apGRGV6Mb4JDOp/rX7jxofglnbWYlFYvf+RSZoMKboCSub8HNDoYcZIrw2niaXtJQ10
 u99Dl0itSVUOjkHN8W6biBmnGZaIEAmD9qtbPoMcmfA557AvFGlH3dvE6Nfvv8mlqGa/
 V8RQ==
X-Gm-Message-State: AGi0PuZm47vXTHoEyGg+74hKPtnVnUksQLyUT4VI7buSgVzFIXBK5ulc
 NwNSs+337Rz8Y4ICGqqREAY=
X-Google-Smtp-Source: APiQypKNp8VZ9mr4GVNmcAt4ce9e6kNxf3ZHvIuLkebI0RqZykks7BQ7hyl/mOXDC3laCG4n/sp25w==
X-Received: by 2002:a17:90a:324b:: with SMTP id
 k69mr1963136pjb.50.1586215183169; 
 Mon, 06 Apr 2020 16:19:43 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c126sm12625459pfb.83.2020.04.06.16.19.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 16:19:43 -0700 (PDT)
Date: Mon, 6 Apr 2020 16:19:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 4/7] ASoC: fsl_asrc: Support new property
 fsl,asrc-format
Message-ID: <20200406231945.GA20945@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <496f49f1fe20b969f4456b591f62223d430c6d74.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <496f49f1fe20b969f4456b591f62223d430c6d74.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

Just some small comments.

On Wed, Apr 01, 2020 at 04:45:37PM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     | 40 ++++++++++++++++++++++--------------
>  sound/soc/fsl/fsl_asrc.h     |  4 ++--
>  sound/soc/fsl/fsl_asrc_dma.c | 15 +++++++++++---
>  3 files changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 4d3e51bfa949..eea19e2b723b 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1052,16 +1047,31 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = of_property_read_u32(np, "fsl,asrc-width",
> -				   &asrc->asrc_width);
> +	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
>  	if (ret) {
> -		dev_err(&pdev->dev, "failed to get output width\n");
> -		return ret;
> +		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get output width\n");

Similar to the comments against sound card driver:
"failed to decide output format"

> +			return ret;
> +		}
> +
> +		switch (width) {
> +		case 16:
> +			asrc->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
> +			break;
> +		case 24:
> +			asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> +			break;
> +		default:
> +			dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");

Should match what the code does after the change:
+			dev_warn(&pdev->dev,
+				 "unsupported width, use default S24_LE\n");

> +			asrc->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> +			break;
> +		}
>  	}
>  
> -	if (asrc->asrc_width != 16 && asrc->asrc_width != 24) {
> -		dev_warn(&pdev->dev, "unsupported width, switching to 24bit\n");
> -		asrc->asrc_width = 24;
> +	if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
> +		dev_warn(&pdev->dev, "unsupported format, switching to S24_LE\n");

Could fit 80 characters:
+		dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 5fe83aece25b..b15946e03380 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -230,10 +230,19 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  		return -EINVAL;
>  	}
>  
> -	if (asrc->asrc_width == 16)
> +	bits = snd_pcm_format_physical_width(asrc->asrc_format);

Can we just use 'width' to match the function name?
