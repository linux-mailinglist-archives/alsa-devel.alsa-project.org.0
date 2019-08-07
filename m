Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66CB83EB6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 03:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561C2166B;
	Wed,  7 Aug 2019 03:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561C2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565140734;
	bh=SiE3mhKwLk1HNN6N5Es24S27wCI5Fb6dpkKoidCiMjE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmEX9onwEcokcBmGN9dgQBm1jMCqEJfEyqgNwe/SG5zxG3hDOlo3E8+/yeatnztfv
	 X8Sa4oqyXgXYJE1K2Do29ZVUkUeR5BuLPdWxXQQcfshmXsO2K+JoulIBgkbf/6GacV
	 KHX2rcxRa8Rz50ZFLApQ1cfS2cN13MbEHMfpds/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 824D3F804CA;
	Wed,  7 Aug 2019 03:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23BFBF80483; Wed,  7 Aug 2019 03:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58343F800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 03:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58343F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OOkY2mEC"
Received: by mail-pf1-x443.google.com with SMTP id 19so42465538pfa.4
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 18:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GV9JQ2WNxKL1bjWx+vcWnlZmSRoCTmSS+egaYnjbX4o=;
 b=OOkY2mECq07ay0Xkn5jKnjidQD7Y8rAbUg9yszwJK3KpW6U4gotRh9fOqwSowU5+w3
 JcKu2uOfiRVZU8AUaC25yzBkfW3T0nn0j43EDVl8MOnataHeQdj5vcF8HtYZM/82gsB1
 70bJuVf2VmFVX7KGZmLx4zx6CuDjpfDVMHaZfPzSuUBjAjXN2LlVLQ76C9PmPyIAF9JA
 fVfBlvx6TRx0j8TxbxthDg8nBHDi9khm2aqPPHODo10L5pGFFyCAM3umhlnFchlJxyi3
 Ycmnf72zDRGCVYXHcttAeOiovnJ2bnf+d3qRP1t29a4pnYk9br6LQ85uAFa4t986slHW
 ZnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GV9JQ2WNxKL1bjWx+vcWnlZmSRoCTmSS+egaYnjbX4o=;
 b=Jkux4wv5Vzv3yXqe+6/minoyuDRKq77gVhKcSOllexxLNGeEniNMo3ZO+w+yyziMfw
 fDO6Xn00mT/nxApPMuA1F5ZTOp1Q5ueMLtTFt6TNPbPwqPInGzIiUyW3aDBhWi93v4Fl
 ZQv4exnMCisxxkSYSEI+5RGJ/SuQZQrsYC5EJdSHUORyLm6afIgVo6Ui6U6vYo5Ccp6m
 h49eLEMTG4Tyt6PjSVp1BKZmcxTJcZIG/nh4fzekF5kuV6RIyPfNShhuhNW8erKZ9L1u
 matf6Z9RmHPkNywx5F76OhVeqnX20y0sKTznZXoOo23popIc9PhMQLbkL9aPhtrixrSM
 S8JA==
X-Gm-Message-State: APjAAAWXVqooCD2pQ+gKbugiE3FKU4EvF5gw0Vo3CHvR1hJKCy7eIDmc
 HyzGG4PrDA+H5vVR/s9HwTA=
X-Google-Smtp-Source: APXvYqzHxmD8/7fJHI1GyT8D5iX+ET4Lx7na0hWQTte/JA6UCTeTD/qIcg8V0R6hoOtkUu8aYGy1Ig==
X-Received: by 2002:a63:5765:: with SMTP id h37mr5358736pgm.183.1565140624218; 
 Tue, 06 Aug 2019 18:17:04 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id n5sm94563063pfn.38.2019.08.06.18.17.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 18:17:03 -0700 (PDT)
Date: Tue, 6 Aug 2019 18:17:59 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190807011758.GE8938@Asurada-Nvidia.nvidia.com>
References: <20190806151214.6783-1-daniel.baluta@nxp.com>
 <20190806151214.6783-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806151214.6783-3-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v3 2/5] ASoC: fsl_sai: Update Tx/Rx channel
	enable mask
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 06, 2019 at 06:12:11PM +0300, Daniel Baluta wrote:
> Tx channel enable (TCE) / Rx channel enable (RCE) bits
> enable corresponding data channel for Tx/Rx operation.
> 
> Because SAI supports up the 8 channels TCE/RCE occupy
> up the 8 bits inside TCR3/RCR3 registers we need to extend
> the mask to reflect this.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
>  sound/soc/fsl/fsl_sai.c | 6 ++++--
>  sound/soc/fsl/fsl_sai.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 17b0aff4ee8b..637b1d12a575 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -599,7 +599,8 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	int ret;
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE,
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
> +			   FSL_SAI_CR3_TRCE_MASK,
>  			   FSL_SAI_CR3_TRCE);
>  
>  	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
> @@ -614,7 +615,8 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
>  	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  
> -	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE, 0);
> +	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
> +			   FSL_SAI_CR3_TRCE_MASK, 0);
>  }
>  
>  static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 4bb478041d67..20c5b9b1e8bc 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -110,6 +110,7 @@
>  
>  /* SAI Transmit and Receive Configuration 3 Register */
>  #define FSL_SAI_CR3_TRCE	BIT(16)
> +#define FSL_SAI_CR3_TRCE_MASK	GENMASK(23, 16)
>  #define FSL_SAI_CR3_WDFL(x)	(x)
>  #define FSL_SAI_CR3_WDFL_MASK	0x1f
>  
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
