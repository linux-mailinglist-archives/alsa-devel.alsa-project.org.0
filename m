Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8105E11B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 11:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E0D16A0;
	Wed,  3 Jul 2019 11:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E0D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562146451;
	bh=GbWVKqx0eK5m0tuP1q7/IWArl/i1vKIs0HDqo80fVUU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1WCW5f+t2meb94V99/8gZIcH1vbJkomft9JYsJdvNbChADpARwNjGG550kBjNwtX
	 FshWduOpBH9/DCB56wALqT9Aq14ZtnAtW38Tn+4I/XdamnwtxtVdnGcAE1wgaEdiiu
	 It1ocT1wg2/emmrVGQohbsGj2d0LlgianU/4GcnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4918F800E8;
	Wed,  3 Jul 2019 11:32:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE9B8F800E9; Wed,  3 Jul 2019 11:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_135, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FBA9F800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 11:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBA9F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mEzXQP7R"
Received: by mail-pg1-x541.google.com with SMTP id i8so911807pgm.13
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/0Sf7T61uUKW8C8wXwdWCRDXeImdhIeyIR/3laF3HyM=;
 b=mEzXQP7R1V8XIbe8Lr0s+G/4kNC5xNjBNZzmeTIBTzqFw5xaqVNElsXEEOYrMq1Eni
 V689Dl9KTZ6Hwpmn83oe5KBFfg7l/UtnBW5mqkwD3Elx30bWLTsHJM+fhDLK6XcJgG0K
 LmWi9ed8LgLEYQ9jKpZ44X3z6fM/VSLiRcfAjJslpRWN/YZ4ly0HSbA/AA6MoBM41MsB
 Zzeg9cgwhS8XLGxOjG52x/uWYE+TOSegRwu6eJ01dy0Z9yzGY9VuROJIgUFFXgr8j4/2
 v/AXHf1AO+csh1CN22EISwqC7PLlEn7z5y4615Fo7pVFDGx+no3x62CVNajF3F1xLEXy
 iQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/0Sf7T61uUKW8C8wXwdWCRDXeImdhIeyIR/3laF3HyM=;
 b=h1PHorq2Rzcq3uGPcICLPr1iZXaHXdLhpqFp7smU7wRkj+RkjAuXboCnBa8Z2xsqB1
 u1LzmJ+iWlyCIgTjtWmsekpnjQ+OYQWVQr3F/T8rVGj1Puoxkx8k9uAya0GAWqaO3RXd
 3SsvrIsFBB+DSvq8mtoIEgcjk+nq8ihZTSbEkIMhhVOB5yaG3vjhiN0bkDD8ccX/opny
 9ipRBp6G44ISAwB5X7CG2J3P/JbNEJ1VW6194FAecSZVmGX544AMQSK1R+19lQgAeTBj
 ceNsVbSevMy6pCr89tI5xItaT9j4+AKHe8cKKGL9X19Q/bUF84LC3qGAhLPIn3rdWJa9
 ruUQ==
X-Gm-Message-State: APjAAAVhcK+8TM3dWzWqNc4xONiu+crAg/YfdRPQhnVRvvnLRdQ3BuHj
 cPcj4jdS1Lu9iLS8G9lX5PU=
X-Google-Smtp-Source: APXvYqxuYgiPEMSSeAJFu6CoA4QkEN5zm/N5GCJXbzOHPuioaAvpMm82K79rki3FzM3p31TVnAtxXw==
X-Received: by 2002:a17:90a:9f08:: with SMTP id
 n8mr11713529pjp.102.1562146338970; 
 Wed, 03 Jul 2019 02:32:18 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 a3sm2234049pfi.63.2019.07.03.02.32.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 02:32:18 -0700 (PDT)
Date: Wed, 3 Jul 2019 02:32:10 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Message-ID: <20190703093209.GB8764@Asurada>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
 <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH V2 2/2] ASoC: fsl_esai: recover the channel
 swap after xrun
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

On Wed, Jul 03, 2019 at 02:42:05PM +0800, shengjiu.wang@nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> There is chip errata ERR008000, the reference doc is
> (https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),
> 
> The issue is "While using ESAI transmit or receive and
> an underrun/overrun happens, channel swap may occur.
> The only recovery mechanism is to reset the ESAI."
> 
> This issue exist in imx3/imx5/imx6(partial) series.
> 
> In this commit add a tasklet to handle reset of ESAI
> after xrun happens to recover the channel swap.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_esai.c | 76 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 20039ae9893b..8c92e49ad6d8 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c

> +static void fsl_esai_reset(unsigned long arg)

Similarly fsl_esai_hw_reset? This one isn't really that bad though,
yet it feels better to have function naming in a similar style.

> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	u32 saisr, tfcr, rfcr;
> +
> +	/* save the registers */
> +	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);

Instead of having this implicit comments, we could have:
+	bool tx = true, rx = false, enabled[2];
+
+	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
+	enabled[tx] = tfcr & ESAI_xFCR_xFEN;
+	enabled[rx] = rfcr & ESAI_xFCR_xFEN;

> +
> +	/* stop the tx & rx */
> +	fsl_esai_trigger_stop(esai_priv, 1);
> +	fsl_esai_trigger_stop(esai_priv, 0);

And we could reuse the boolean 'tx' and 'rx' here.

> +
> +	/* reset the esai, and restore the registers */
> +	fsl_esai_init(esai_priv);
> +

[...]
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK,
> +			   ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK,
> +			   ESAI_xCR_xPR);

Mask and value might fit into one line?

> +
> +	/* restore registers by regcache_sync */
> +	fsl_esai_register_restore(esai_priv);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, 0);

And just for curious, can (or shall) we stuff this personal reset
to the reset() function? I found this one is a part of the reset
routine being mentioned in the RM -- it was done after ESAI reset
is done via ECR register.

[...]
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +			   ESAI_PRRC_PDC_MASK,
> +			   ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +			   ESAI_PCRC_PC_MASK,
> +			   ESAI_PCRC_PC(ESAI_GPIO));

Mask and value might fit into one line?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
