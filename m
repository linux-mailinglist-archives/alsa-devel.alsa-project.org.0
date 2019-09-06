Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24EAB018
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 03:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31BBF1671;
	Fri,  6 Sep 2019 03:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31BBF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567733189;
	bh=sQOO2dkj/+lW3tKtcoYx7T7Uk1yfY0xu2DO5D8Ki/3U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sbKtRidAprF7cZSJQgvYjaWpWKMMzWLcPTOUagRTisqz0lU7YovCN/GYmFoNsBBWw
	 op8X4HoF5QvKy2vO/QEBMpgG6Ws6LKOh5MwQHRu3w50JTzIrZ73p7da9fwXylQnm2B
	 VLigBeIiXxlyD87gz8vZD4q84BPG9FgcQaR6eRyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25498F80448;
	Fri,  6 Sep 2019 03:24:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 628D4F80448; Fri,  6 Sep 2019 03:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD76FF80227
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 03:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD76FF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MseIdCPT"
Received: by mail-pf1-x444.google.com with SMTP id y72so3134036pfb.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 18:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DVF2xhHbHg2j29LblU1CgBEDCkpvcBZ4AEHewXas5gw=;
 b=MseIdCPTJrTQJXOW2UzidBAhUmOeTrXnBtOR+3fZX0Z7OI2kykLR9y//15fPmkKV9a
 jR/BczxeqD7rUjgQQtjkNUcxys3QOUJc7m8djl78qIGtAVV9LZ6bm9aWXdUCqLgInU6o
 i9r57ZkOn4/OhHPgZ5D3aGFe0fmySrPPszYeYdqfpbD/SDAyfBbzX/yXBFHXcpGU0IKo
 GfLNTt5RHSp9N+2sNsG4vC44jSkL6ecF30cXzAYX5XPTNB2vJC2ShzAre40QKDu+lAKf
 fvN95tMY86KO3LdrIPbdYE/dMaKSziOm04axHBWu3fD3UGgRb4ouDRgQ4KIgNpgnrbRg
 H4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DVF2xhHbHg2j29LblU1CgBEDCkpvcBZ4AEHewXas5gw=;
 b=RcPC//5sV2e5Nx7o+96gAdTgE/L+NfDAZoc24whYWo528CN7HzEStTu8z1p7mJIREG
 zaGUqmNZmA18eUbWRrHduAe9oD5QqrgU4T9bEbkYUtF0T6kDuFSHYaUDrWT8lioVqg6Y
 Zmp0T294WnCGRxk3rwj5UoI3BdXEXPFjeg67ZiWbVzGPGGYxD87BkvJ/QJeyqBnWgvXD
 kriFAeIyZc++XwqbVUqeKXBUXNN2fZQ40lEUqJ1LRvqaoBuTHkOwn6PryWcx8TYmZGW7
 dUNwuaDmRGi3mSbRvi0/1ed/powqJ7BXaD07RlXmC3ocLplWYEzWG5sY+LLCOAGlgyT+
 DhJw==
X-Gm-Message-State: APjAAAUb7JZYRVKljtKP/EqPnxEXv3qB/dwUNrOUk5oB/SxB2JgJa/z+
 6O1PT26CqO3NdUzJKwqHM0I=
X-Google-Smtp-Source: APXvYqwqglByW+NsVpmNz31XHRSPZh2xUQuRAXEuUO67Oz/RsBaNjU+V97Dds8Akz3dZzec4uAhMGg==
X-Received: by 2002:a62:26c4:: with SMTP id m187mr7721569pfm.49.1567733075155; 
 Thu, 05 Sep 2019 18:24:35 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r18sm3222688pfc.3.2019.09.05.18.24.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Sep 2019 18:24:34 -0700 (PDT)
Date: Thu, 5 Sep 2019 18:24:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190906012438.GA17926@Asurada-Nvidia.nvidia.com>
References: <20190830200900.19668-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830200900.19668-1-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, Mihai Serban <mihai.serban@nxp.com>,
 festevam@gmail.com, mihai.serban@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Fix noise when using EDMA
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

On Fri, Aug 30, 2019 at 11:09:00PM +0300, Daniel Baluta wrote:
> From: Mihai Serban <mihai.serban@nxp.com>
> 
> EDMA requires the period size to be multiple of maxburst. Otherwise the
> remaining bytes are not transferred and thus noise is produced.
> 
> We can handle this issue by adding a constraint on
> SNDRV_PCM_HW_PARAM_PERIOD_SIZE to be multiple of tx/rx maxburst value.
> 
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 15 +++++++++++++++
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 728307acab90..fe126029f4e3 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -612,6 +612,16 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
>  			   FSL_SAI_CR3_TRCE_MASK,
>  			   FSL_SAI_CR3_TRCE);
>  
> +	/*
> +	 * some DMA controllers need period size to be a multiple of
> +	 * tx/rx maxburst
> +	 */
> +	if (sai->soc_data->use_constraint_period_size)
> +		snd_pcm_hw_constraint_step(substream->runtime, 0,
> +					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +					   tx ? sai->dma_params_tx.maxburst :
> +					   sai->dma_params_rx.maxburst);

I feel that PERIOD_SIZE could be used for some other cases than
being related to maxburst....
  
>  static const struct of_device_id fsl_sai_ids[] = {
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index b89b0ca26053..3a3f6f8e5595 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -157,6 +157,7 @@
>  
>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
> +	bool use_constraint_period_size;

....so maybe the soc specific flag here could be something like
	bool use_edma;

What do you think?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
