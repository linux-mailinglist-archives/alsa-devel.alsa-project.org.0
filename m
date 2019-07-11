Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8965E0F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 18:58:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825999F6;
	Thu, 11 Jul 2019 18:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825999F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562864318;
	bh=4aC+ewpd9IAeGjnQvx57MmdE/nJRALwQYZmrcg/d6L0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ouR2+5KJKllw/vPE8yOwYo5AqauFcmyB1OQZo24DEWyeePJJWplYDtKsVsh1vxUBr
	 JmUwDp4BexiMc7xS6rT8NmGdQjpXUehnprtNYZgrSXKYWmAWpDA/NLIsck1WkUHIN5
	 Meu4j8E/SBQqjGnZtVcii2jfo7fLW807ZeGQHiRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA5EF80307;
	Thu, 11 Jul 2019 18:56:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FC0F802FB; Thu, 11 Jul 2019 18:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11372F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 18:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11372F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LA7j/cO4"
Received: by mail-pg1-x544.google.com with SMTP id g15so3229687pgi.4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fq6WHQqIPWVCMU7ZkFfC4oSgGVvcorBZ3Dq6pBzcxHo=;
 b=LA7j/cO4M89kcVx3e6n4nfhoFhINbRv6vd7JT7WJFzQOUPxwSckcJ2rYqU0v25WI5S
 Nyu5P+fdvPArJtJiIRE4OtkE0R1mRE53Oy+cJ7vQhTEvC5EcUfIVHjn5ivS0d3IMVvSn
 H5paRse+u29OFk6/lI0zgNuYMtXB+YcG+hOn+ogRkN85B2ldAtfhs7Su1fS9QqNyRq2I
 Cg9cDAGjAy34fvB0WMKnUbGuLtm5YeIehXbJbqyRZYJ7yRXHl6WAjgPk+i22kMxSv12N
 vaaJdmrwDM30Ly4SACH6+d0qgs1QMUEif0V+ygVHgVxTGla7U5Vtfnfqy3l5MiRbjsOj
 wyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fq6WHQqIPWVCMU7ZkFfC4oSgGVvcorBZ3Dq6pBzcxHo=;
 b=RJCpvTa+LYp/IKwqHKD4QjUVBy6aWfON56jdD/oghHZ9tZ4QAUMVa5eAO0zLcQvZAr
 SuiV2XIlisO7TBQljfaKJGOOacQr7xykldcro4r7W+XV57RbxlvQ/FxK8GgaNr2FjSwk
 cftufZOzELEXU2FADjNe1AdmxJ9tq5LVweFg9T6H4kS3yRUHAEx8dv+I2kAuduDFPqbN
 +1lLPRMUkkC8eEqrx4+Med2EIfN+BPQGNlpPfNxc5TOUYOyLW2av9+HuyU2RNJj8AomK
 APPl4nR3bYFKy+HbaOsI76Xf4fPgadSkRHzW8xXzVVXqBkPNDN9P8MjuZHR4SvML2Czl
 UssQ==
X-Gm-Message-State: APjAAAUY38wxgCy1Ry06Bl/VpoKcs++BS2KMGqcVbrclK7ar+/fGtbK/
 TGfe3BnaQz8KaElEQxK5ero=
X-Google-Smtp-Source: APXvYqyC06UAsgjIIOFjc1j8lXIWIQBK1kitqWKAvKUudWZ44wALY9Iy7uk5Az9zegjynRwH9ESbRw==
X-Received: by 2002:a17:90a:f488:: with SMTP id
 bx8mr5899804pjb.91.1562864067277; 
 Thu, 11 Jul 2019 09:54:27 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h26sm6256695pfq.64.2019.07.11.09.54.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jul 2019 09:54:27 -0700 (PDT)
Date: Thu, 11 Jul 2019 09:54:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Message-ID: <20190711165458.GA17728@Asurada-Nvidia.nvidia.com>
References: <cover.1562842206.git.shengjiu.wang@nxp.com>
 <326035cb99975361699d9ed748054b08bc06a341.1562842206.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <326035cb99975361699d9ed748054b08bc06a341.1562842206.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V4 2/2] ASoC: fsl_esai: recover the channel
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

On Thu, Jul 11, 2019 at 06:49:46PM +0800, shengjiu.wang@nxp.com wrote:
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

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
>  sound/soc/fsl/fsl_esai.c | 74 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index ab460d6d7432..4ce8ac769244 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -32,6 +32,7 @@
>   * @extalclk: esai clock source to derive HCK, SCK and FS
>   * @fsysclk: system clock source to derive HCK, SCK and FS
>   * @spbaclk: SPBA clock (optional, depending on SoC design)
> + * @task: tasklet to handle the reset operation
>   * @fifo_depth: depth of tx/rx FIFO
>   * @slot_width: width of each DAI slot
>   * @slots: number of slots
> @@ -42,6 +43,7 @@
>   * @sck_div: if using PSR/PM dividers for SCKx clock
>   * @slave_mode: if fully using DAI slave mode
>   * @synchronous: if using tx/rx synchronous mode
> + * @reset_at_xrun: flags for enable reset operaton
>   * @name: driver name
>   */
>  struct fsl_esai {
> @@ -53,6 +55,7 @@ struct fsl_esai {
>  	struct clk *extalclk;
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
> +	struct tasklet_struct task;
>  	u32 fifo_depth;
>  	u32 slot_width;
>  	u32 slots;
> @@ -65,6 +68,7 @@ struct fsl_esai {
>  	bool sck_div[2];
>  	bool slave_mode;
>  	bool synchronous;
> +	bool reset_at_xrun;
>  	char name[32];
>  };
>  
> @@ -73,8 +77,16 @@ static irqreturn_t esai_isr(int irq, void *devid)
>  	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
>  	struct platform_device *pdev = esai_priv->pdev;
>  	u32 esr;
> +	u32 saisr;
>  
>  	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
> +
> +	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
> +	    esai_priv->reset_at_xrun) {
> +		dev_dbg(&pdev->dev, "reset module for xrun\n");
> +		tasklet_schedule(&esai_priv->task);
> +	}
>  
>  	if (esr & ESAI_ESR_TINIT_MASK)
>  		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
> @@ -635,10 +647,17 @@ static void fsl_esai_trigger_start(struct fsl_esai *esai_priv, bool tx)
>  			   ESAI_xSMB_xS_MASK, ESAI_xSMB_xS(mask));
>  	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
>  			   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
> +
> +	/* Enable Exception interrupt */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
> +			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);
>  }
>  
>  static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
>  {
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
> +			   ESAI_xCR_xEIE_MASK, 0);
> +
>  	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
>  			   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
>  	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
> @@ -653,6 +672,51 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
>  			   ESAI_xFCR_xFR, 0);
>  }
>  
> +static void fsl_esai_hw_reset(unsigned long arg)
> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	bool tx = true, rx = false, enabled[2];
> +	u32 tfcr, rfcr;
> +
> +	/* Save the registers */
> +	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
> +	enabled[tx] = tfcr & ESAI_xFCR_xFEN;
> +	enabled[rx] = rfcr & ESAI_xFCR_xFEN;
> +
> +	/* Stop the tx & rx */
> +	fsl_esai_trigger_stop(esai_priv, tx);
> +	fsl_esai_trigger_stop(esai_priv, rx);
> +
> +	/* Reset the esai, and ignore return value */
> +	fsl_esai_hw_init(esai_priv);
> +
> +	/* Enforce ESAI personal resets for both TX and RX */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> +
> +	/* Restore registers by regcache_sync, and ignore return value */
> +	fsl_esai_register_restore(esai_priv);
> +
> +	/* Remove ESAI personal resets by configuring PCRC and PRRC also */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +			   ESAI_PRRC_PDC_MASK, ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +			   ESAI_PCRC_PC_MASK, ESAI_PCRC_PC(ESAI_GPIO));
> +
> +	/* Restart tx / rx, if they already enabled */
> +	if (enabled[tx])
> +		fsl_esai_trigger_start(esai_priv, tx);
> +	if (enabled[rx])
> +		fsl_esai_trigger_start(esai_priv, rx);
> +}
> +
>  static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			    struct snd_soc_dai *dai)
>  {
> @@ -857,6 +921,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  	esai_priv->pdev = pdev;
>  	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
>  
> +	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
> +	    of_device_is_compatible(np, "fsl,imx35-esai"))
> +		esai_priv->reset_at_xrun = true;
> +
>  	/* Get the addresses and IRQ */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	regs = devm_ioremap_resource(&pdev->dev, res);
> @@ -956,6 +1024,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	tasklet_init(&esai_priv->task, fsl_esai_hw_reset,
> +		     (unsigned long)esai_priv);
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	regcache_cache_only(esai_priv->regmap, true);
> @@ -969,7 +1040,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  
>  static int fsl_esai_remove(struct platform_device *pdev)
>  {
> +	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
> +
>  	pm_runtime_disable(&pdev->dev);
> +	tasklet_kill(&esai_priv->task);
>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
