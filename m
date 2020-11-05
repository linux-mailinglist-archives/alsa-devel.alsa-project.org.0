Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C22A7510
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 02:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F84A166E;
	Thu,  5 Nov 2020 02:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F84A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604540956;
	bh=ie10vjbawui0ivtQpPzPEQNBCKzh2o3V4Ae0jKuOvEM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWCSN/R8TQOhhdqNcX+pcJeM4QuNd6E0M+Ss/ZL9cxQu8/P6AtF6LgN6o4h/m88RG
	 F5ASrFpJFl1W4RIJqE2+znhHL72KUI9Jk12A0pXotJpXdLKJGnrPbqyIJKQpN6TR9c
	 6pvYFC7zrdJulNHLyzPpzmp5A5EKua9JhrUMBSaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E4FF8023E;
	Thu,  5 Nov 2020 02:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 960EAF80234; Thu,  5 Nov 2020 02:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96BE3F8015A
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 02:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BE3F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C3KFKDSk"
Received: by mail-pf1-x443.google.com with SMTP id 133so54549pfx.11
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 17:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OCTxfpsphzxslAOqNQCh/cdk0CoQXDuv6GMoNdJRd5A=;
 b=C3KFKDSkz8PewNH1jl/sP84lpxdqfKrg0VJoTP1+puWG7ySV+gTJkxexOQcONJq9sN
 Ov6tBqvITJXazba66PI2+9AiQBbWk92CPcuz7+OVt+u1DM77atUE+KM7qEfwKuoEh/Pq
 H57luRoyXAlMC8uEH9u3ey10S4uAlnK5rTU3PPiEnLuhwiBi2ggPPrUuA6Nf03bM88mW
 D7iUUAW667Xzea/DmvPtbnxA/KgQ8p6pplYmOwtv+YUUfQMcaq0N/98pi2Dgqlb5rNho
 C0aZjwD1+QDlEvSHqiHsdWdueHDChaBsOmXYmcZLY1pkLm/kmMH8RreeSIYLrV/7OHF2
 GXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OCTxfpsphzxslAOqNQCh/cdk0CoQXDuv6GMoNdJRd5A=;
 b=DRz/+dqPF+vrrA9xc55c9TDdBGwpLWzo3rpCjZf+n1iKMharX1UBxraUiym5T0qIJm
 vVPK5NZwLZQpFnOJhskvwz4m3VmvwHE4JKTo0dYQ3StxyVeJ+TfYEyWFSxiAHdxrjTZe
 6gxRMRmNtZ5lOK5WJvMIGSeO9XNpyIgMwp1K644kSqpAKvgZmEAMZKRZ8JZbhhfQXnHI
 ccPaA+dLeMIn5DMmDFutjsBeprff3bi1xn7dz9YH1sv8mLjbZFCDwRZXpw+13rZLxslN
 b1Ji0aNzvSB8G8E4JlcNHPooOysuDkHVQFgWHKnCuD0dmF37CXRBZAlLjWgE1c+rMT7c
 I/8Q==
X-Gm-Message-State: AOAM531s1FfSTQDqLoMlmWN17yJGFkChWsEeFGXRAo+3DfF9I+zlkqYN
 /MHvN1vNpz5YelNNFer9u+A=
X-Google-Smtp-Source: ABdhPJzYRJ54bpr7y5aGP5sXGN6tDVE4C64FR/ZVNJa5T6GGER3l/r0hcDTBiMTAovWtsz5k9zEixA==
X-Received: by 2002:a17:90b:1011:: with SMTP id gm17mr346pjb.73.1604540852758; 
 Wed, 04 Nov 2020 17:47:32 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id b3sm132830pfd.66.2020.11.04.17.47.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Nov 2020 17:47:32 -0800 (PST)
Date: Wed, 4 Nov 2020 17:35:40 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
Message-ID: <20201105013539.GA16459@Asurada-Nvidia>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <1604281947-26874-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604281947-26874-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
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

On Mon, Nov 02, 2020 at 09:52:27AM +0800, Shengjiu Wang wrote:
> The AUD2HTX is a digital module that provides a bridge between
> the Audio Subsystem and the HDMI RTX Subsystem. This module
> includes intermediate storage to queue SDMA transactions prior
> to being synchronized and passed to the HDMI RTX Subsystem over
> the Audio Link.
> 
> The AUD2HTX contains a DMA request routed to the SDMA module.
> This DMA request is controlled based on the watermark level in
> the 32-entry sample buffer.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Despite some small comments inline.

> +static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
> +{
> +	struct fsl_aud2htx *aud2htx = dev_get_drvdata(cpu_dai->dev);
> +
> +	/* DMA request when number of entries < WTMK_LOW */
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_DT_MASK, 0);
> +
> +	/* Disable interrupts*/
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_IRQ_MASK,
> +			   AUD2HTX_WM_HIGH_IRQ_MASK |
> +			   AUD2HTX_WM_LOW_IRQ_MASK |
> +			   AUD2HTX_OVF_MASK,
> +			   AUD2HTX_WM_HIGH_IRQ_MASK |
> +			   AUD2HTX_WM_LOW_IRQ_MASK |
> +			   AUD2HTX_OVF_MASK);
> +
> +	/* Configure watermark */
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_WL_MASK,
> +			   AUD2HTX_WTMK_LOW << AUD2HTX_CTRE_WL_SHIFT);
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_WH_MASK,
> +			   AUD2HTX_WTMK_HIGH << AUD2HTX_CTRE_WH_SHIFT);

If there isn't a hard requirement from hardware, feels better to
combine all the writes to AUD2HTX_CTRL_EXT into one single MMIO.

> +static irqreturn_t fsl_aud2htx_isr(int irq, void *dev_id)
> +{
> +	return IRQ_HANDLED;

Empty isr? Perhaps can drop the request_irq() at all?

> +static int fsl_aud2htx_probe(struct platform_device *pdev)
> +{
> +	struct fsl_aud2htx *aud2htx;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int ret, irq;
> +
> +	aud2htx = devm_kzalloc(&pdev->dev, sizeof(*aud2htx), GFP_KERNEL);
> +	if (!aud2htx)
> +		return -ENOMEM;
> +
> +	aud2htx->pdev = pdev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(regs)) {
> +		dev_err(&pdev->dev, "failed ioremap\n");
> +		return PTR_ERR(regs);
> +	}
> +
> +	aud2htx->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
> +						&fsl_aud2htx_regmap_config);
> +	if (IS_ERR(aud2htx->regmap)) {
> +		dev_err(&pdev->dev, "failed to init regmap");
> +		return PTR_ERR(aud2htx->regmap);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no irq for node %s\n",
> +			dev_name(&pdev->dev));

dev_err() already prints dev_name, so not necessary to print again.
