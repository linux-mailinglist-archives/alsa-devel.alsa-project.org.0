Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EE17EB08
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 22:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AB7F1667;
	Mon,  9 Mar 2020 22:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AB7F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583788814;
	bh=DtXKlc/0IwIJ4W+Dw/Rxf4cl8x8k1kmsy2VrIIeLaZE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OBfmgipC8Cgusjd+F6SH0dPOB7VXMDezAOnnle+7GNYfquQSyvllCqoNb3Vugu2ox
	 l3GUEQubG6KBzuFKAyXsz8QmQsrL5kE/vtXungiP3H5Sk9NpvcsG6cELpSmXGTr+Bz
	 mj4+z1jld0qSpF6/JvWL62RED4fXD3ZFgaDsLOb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90DF6F801A3;
	Mon,  9 Mar 2020 22:18:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E79F801EB; Mon,  9 Mar 2020 22:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E28F6F800B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 22:18:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E28F6F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mc3f2TGu"
Received: by mail-pj1-x1043.google.com with SMTP id a18so435376pjs.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=75BMaXcAmO4F5Wh+UkrqpyAJEuiai75tQOLAGLzUruc=;
 b=Mc3f2TGua+mzWZqhqcBFy8xGR4f62bMfkZ533/dtz8uiLUdJhj/KUeALKn1cfWNrgL
 fIQti2Sr9jF85Y+rnxx4+60P16SUP3noRF2AljLUI1D2TFMmP1bonRiTwzjx4xNJ9Qwe
 5ZwVhdVsIL82iYY0GFFZP9ck6Ccro9zA/NCVMYqPyiZzOtN5c7Gv+TLxZguS9lB7Xon4
 hDadFff6ReYzd5WneH3sHbliE6rYSdrwuC0imPmRhArAKnt1MskwGQAGVLXRnAlhKQtL
 kwBImHlUMMDcum7ZL8MZBJ/YPV3RAGp0y3mQHGzC9a7UWHTJnrktv2CJw6iWWZrfotr5
 SlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=75BMaXcAmO4F5Wh+UkrqpyAJEuiai75tQOLAGLzUruc=;
 b=MTmjxp8rxVv/FH0aLYyOAAWqROuCYvyP1+oNNiYkqnpVYcbXYWc8+fUYtUI+jR0oYZ
 9Z66expylP9XID2YeIom9jgtCQC0skqKOzf/GjM1+/p47m2zjN3OYXsHJZZxiMubLxiJ
 UonLMdDLQOtXtgzIkfLOUTiyNKmfcNprDsC2d1qdU1yeYJGmEVnj36CFoaELoZZrZzg3
 6fX3CtByLtqWnWPQ1iuGS1VhJcM9O5+V+VaF46bfTxsYNBV/O5ktHAQLwxCGls3jbQMo
 SprYRas/E6+7Pb8rblwGovIoCULv9IxrncB24ta7vqzw/+A6RYiKZjn72LSBTBIkXEJn
 v+kA==
X-Gm-Message-State: ANhLgQ15RElXPbX8pm3MbSIIMbMVmwXmkKVGYpMvmZ4uA0FtnWd34RN0
 nL9vXTv7vjK7aKjG49DXud4=
X-Google-Smtp-Source: ADFU+vt2yYWX7gJknQLuNcwuQzhGdS8aInh7+JZ9Mbaq0Z7M0IITbFjuVTv3VCNQfp0cXyneROITtg==
X-Received: by 2002:a17:902:864a:: with SMTP id
 y10mr17943042plt.2.1583788704865; 
 Mon, 09 Mar 2020 14:18:24 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u24sm44614851pgo.83.2020.03.09.14.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 14:18:24 -0700 (PDT)
Date: Mon, 9 Mar 2020 14:18:32 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 2/7] ASoC: fsl-asoc-card: Support new property
 fsl,asrc-format
Message-ID: <20200309211831.GA11333@Asurada-Nvidia.nvidia.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <266dccc836c11165ad91a301f24fe4f7ad2557be.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <266dccc836c11165ad91a301f24fe4f7ad2557be.1583725533.git.shengjiu.wang@nxp.com>
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

On Mon, Mar 09, 2020 at 11:58:29AM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 9ce55feaac22..32101b9a37b9 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -680,17 +680,19 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  			goto asrc_fail;
>  		}
>  
> -		ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
> +		ret = of_property_read_u32(asrc_np, "fsl,asrc-format", &priv->asrc_format);
>  		if (ret) {
> -			dev_err(&pdev->dev, "failed to get output rate\n");

Nice that your patch fixed my copy-n-paste typo here :)

> -			ret = -EINVAL;
> -			goto asrc_fail;
> -		}

It'd be nicer to have a line of comments:
			/* Fallback to old binding; translate to asrc_format */

> +			ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
> +			if (ret) {
> +				dev_err(&pdev->dev, "failed to get output width\n");
> +				return ret;
> +			}
>  
> -		if (width == 24)
> -			priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> -		else
> -			priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
> +			if (width == 24)
> +				priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
> +			else
> +				priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
> +		}
