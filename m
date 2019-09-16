Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4CB443E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 00:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8087166F;
	Tue, 17 Sep 2019 00:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8087166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568674275;
	bh=ogQxFqRFDlZ9BI1k1McHRngMzQle44reU5HkWQiZI1g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFLP5NYTJpcxdaMir9iABemMeNz5slgsl6aFPaIeLO78Z2uPuZNyzg0o2mNt+rGOw
	 NUDzy0cl42Sfx3o8eIYeDfZkP/nL4pXS7PqgHlYEx6jwl/M7JjoEFtvHedYSjezhDo
	 Jvz8rID90o+K/vAJdQGBvBF0yCXQB2TW7M1F1Bk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71149F80534;
	Tue, 17 Sep 2019 00:49:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4CA4F80506; Tue, 17 Sep 2019 00:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31D74F80148
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 00:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31D74F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KYTlY74K"
Received: by mail-pf1-x443.google.com with SMTP id q10so845590pfl.0
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 15:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kENGSqKmUqPPdpHJ6m4GwChtS1EbaBEMgzUsVpqeX1U=;
 b=KYTlY74KGSWbho4hQT1Kz82jdfOZ08vd1IhAQfCPuEcB4xZTP3z/C9rAnkmFp1JoAo
 gedBCFiDQTnXsZgbXrBCiGGdkSJFfPq+XWVE54HBL8CTVR0AEkyFd/QTUPKZVNXBe9Fd
 QcFCPfmbvXIuaqCeeDI/lnLsMwthaUuTCxCLyK+MoF8FOWi0NgdgQtB9UJ9rzf9SBd8p
 Zl8rVKIOO7ORISi5P5uJ/ZtceGBrc7H8r7zT2AwfU2IgYkhh59k19jRWxDduIOeZJmyu
 v/pqhBQ1+LnLnNNNo4JhWPg/zHc+OBwamLbmzEuVnMjQNwp/xio4ydA3yBFeSRplafn8
 6YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kENGSqKmUqPPdpHJ6m4GwChtS1EbaBEMgzUsVpqeX1U=;
 b=K6QJ2Pd6YF7hFSaBO0TVMuz+zzHrw63jD0U9N/wdPIcxucOTRAikvXv4T4zGXOb1c0
 ++NJFxnu1tNvEXbrOIzHU29OyGa+dPdhZPBwrRipHVUmi0Xd0yUEKnwPy4EEUgycsOSq
 MaUcv2VUmvG9aU15nC6YCyqz4jiR/Iu2sfYxQlS6Kr7n5cdPt6HYQFrTFFft/yseDLhG
 lyhgY7mZz4crC+xHTzeHPcVxzdkwPFj3K1KX3fJ13SWo5tFL9ZQ54tGIJXWPt84kLIgJ
 ytvYeFpbJwcLNhNkKaXWoXAxMIHdH/qiMCap8HDCYf/nwUs8bk1Xx/RiRai9MPfpWaQN
 RmCg==
X-Gm-Message-State: APjAAAXPtRncreLW8xW3q2SEpTijif+iFOVmkcg959oPowC3xiEzOWT/
 TY/kUDfJWWFiXfL7MsCvHeQ=
X-Google-Smtp-Source: APXvYqwXeCRM152vISeSYObMSYFrVO5M8aKoHJ+Xbpqr49/LWf0mNi7lZ+lzTGlj/FuHFzmkelX9vA==
X-Received: by 2002:a62:1b85:: with SMTP id b127mr813216pfb.56.1568674164260; 
 Mon, 16 Sep 2019 15:49:24 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id l23sm118212pgj.53.2019.09.16.15.49.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Sep 2019 15:49:24 -0700 (PDT)
Date: Mon, 16 Sep 2019 15:49:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190916224905.GB12789@Asurada-Nvidia.nvidia.com>
References: <20190913192807.8423-1-daniel.baluta@nxp.com>
 <20190913192807.8423-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913192807.8423-2-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, Mihai Serban <mihai.serban@nxp.com>, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 1/3] ASoC: fsl_sai: Fix noise when using
	EDMA
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

On Fri, Sep 13, 2019 at 10:28:05PM +0300, Daniel Baluta wrote:
> From: Mihai Serban <mihai.serban@nxp.com>
> 
> EDMA requires the period size to be multiple of maxburst. Otherwise the
> remaining bytes are not transferred and thus noise is produced.
> 
> We can handle this issue by adding a constraint on
> SNDRV_PCM_HW_PARAM_PERIOD_SIZE to be multiple of tx/rx maxburst value.
> 
> Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
> Changes since v1:
> * rename variable to use_edma as per Nicolin's suggestion.
> 
>  sound/soc/fsl/fsl_sai.c | 15 +++++++++++++++
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index ef0b74693093..b517e4bc1b87 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -628,6 +628,16 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
>  			   FSL_SAI_CR3_TRCE_MASK,
>  			   FSL_SAI_CR3_TRCE);
>  
> +	/*
> +	 * EDMA controller needs period size to be a multiple of
> +	 * tx/rx maxburst
> +	 */
> +	if (sai->soc_data->use_edma)
> +		snd_pcm_hw_constraint_step(substream->runtime, 0,
> +					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +					   tx ? sai->dma_params_tx.maxburst :
> +					   sai->dma_params_rx.maxburst);
> +
>  	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
>  			SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
>  
> @@ -1026,30 +1036,35 @@ static int fsl_sai_remove(struct platform_device *pdev)
>  
>  static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
>  	.use_imx_pcm = false,
> +	.use_edma = false,
>  	.fifo_depth = 32,
>  	.reg_offset = 0,
>  };
>  
>  static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
>  	.use_imx_pcm = true,
> +	.use_edma = false,
>  	.fifo_depth = 32,
>  	.reg_offset = 0,
>  };
>  
>  static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
>  	.use_imx_pcm = true,
> +	.use_edma = false,
>  	.fifo_depth = 16,
>  	.reg_offset = 8,
>  };
>  
>  static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
>  	.use_imx_pcm = true,
> +	.use_edma = false,
>  	.fifo_depth = 128,
>  	.reg_offset = 8,
>  };
>  
>  static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
>  	.use_imx_pcm = true,
> +	.use_edma = true,
>  	.fifo_depth = 64,
>  	.reg_offset = 0,
>  };
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index b12cb578f6d0..76b15deea80c 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -157,6 +157,7 @@
>  
>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
> +	bool use_edma;
>  	unsigned int fifo_depth;
>  	unsigned int reg_offset;
>  };
> -- 
> 2.17.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
