Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93B12767
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 08:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D4001870;
	Fri,  3 May 2019 07:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D4001870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556863239;
	bh=iUEBobhA/I0VZTD9jWHkt/sWUA4km39qvy75S4hroeQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LlAeByDNqURjVtCfmlmf5nBH1pcYNptUfAmvH50uYCoqL4yhlDJVhL5ILi+rTIBCf
	 S3+DYTR1jkULfP++5I/odaKx5Zlv94ylcwlnOVDdng29CnapqJMrbTofN1+fTVUWcz
	 39FjCKE1D20/MNarZc4sGCqfHX4Aun72Xa+VKL+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32801F896B6;
	Fri,  3 May 2019 07:58:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5F8DF896B7; Fri,  3 May 2019 07:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CF60F80722
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 07:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF60F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GmdTJXgm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ib6EGiqGZs0cx0BP5zTIwv4T+gNe/EmI7hgleO5jVI=; b=GmdTJXgmhkiSwrhI+2N0wdBW3
 lmN0w63R8X5+GF0Pux4dkFSH32I1em1FTXPK3FSta2RRt6nsLtmOcSpU5Wh0dCWpG+3SAdq0MEVMB
 +9ow8z2J5AEg6xGyXOQNSeyaPcWmYrkyktmYr8NxvkRxgfsejJc0NXTf8JG1IahkzMSpM=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMRDA-0000R4-I5; Fri, 03 May 2019 05:58:21 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 204C2441D3C; Fri,  3 May 2019 06:58:09 +0100 (BST)
Date: Fri, 3 May 2019 14:58:09 +0900
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Message-ID: <20190503055809.GC14916@sirena.org.uk>
References: <20190502121041.8045-1-fparent@baylibre.com>
 <20190502121041.8045-4-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190502121041.8045-4-fparent@baylibre.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 shunli.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, kaichieh.chuang@mediatek.com
Subject: Re: [alsa-devel] [PATCH 3/5] ASoC: mediatek: Add MT8516 PCM driver
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
Content-Type: multipart/mixed; boundary="===============0268084856529207600=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0268084856529207600==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e7WmlSfQJTtHfSol"
Content-Disposition: inline


--e7WmlSfQJTtHfSol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 02, 2019 at 02:10:39PM +0200, Fabien Parent wrote:

> +static irqreturn_t mt8516_afe_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_base_afe *afe = dev_id;
> +	unsigned int reg_value;
> +	unsigned int memif_status;
> +	int i, ret;
> +
> +	ret = regmap_read(afe->regmap, AFE_IRQ_STATUS, &reg_value);
> +	if (ret) {
> +		reg_value = AFE_IRQ_STATUS_BITS;
> +		goto exit_irq;
> +	}

...

> +exit_irq:
> +	regmap_write(afe->regmap, AFE_IRQ_CLR, reg_value & AFE_IRQ_STATUS_BITS);
> +
> +	return IRQ_HANDLED;
> +}

This unconditionally says it handled an interrupt regardless of what
happened.  This means that the interrupt line can't be shared and that
the error handling code in the generic interrupt subsystem can't tell if
something goes wrong and the interrupt gets stuck.

> +	ret = devm_request_irq(afe->dev, irq_id, mt8516_afe_irq_handler,
> +			       0, "Afe_ISR_Handle", (void *)afe);
> +	if (ret) {
> +		dev_err(afe->dev, "could not request_irq\n");
> +		return ret;
> +	}

Are you sure the interrupt handler can safely use managed resources,
especially given...

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(afe->base_addr))
> +		return PTR_ERR(afe->base_addr);
> +
> +	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
> +		&mt8516_afe_regmap_config);
> +	if (IS_ERR(afe->regmap))
> +		return PTR_ERR(afe->regmap);

...that things like the register map and the I/O resources for the chip
are allocated after and therefore freed before before the interrupt is
freed.  Normally the interrupt should be one of the last things to be
allocated.

> +static int mt8516_afe_pcm_dev_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

In general if functions can legitimately be empty they should just be
omitted, if they are required that usually means they have to do
something.

--e7WmlSfQJTtHfSol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzL2HAACgkQJNaLcl1U
h9CyAwf9G6RLyjC0l1jZ7PuvlyUWgPa0meffYGQwZm5IRVLUCEfYjhxodTO5hKh2
fFN64GvyEDq68fgDpF1ILhSFWZFRBLkdFwJ2/e2tknzzQ3QWpWA3mvzrzEzyZlOB
Z0ocR20bgbYxO+OAas//SnwCaY+Hm14Dho0oQooGlWHWGfQtxF7OcKKVTYnf1uij
GHYwqmasG50ldZZ+Lwu8tgueOohnt53QpM5L8wx33IBSYmmAdpCw6C6raql8bQAe
9dyCLUtxkI+dUhvn9cemnDD6VTPhPvj7AGL+L8Xp2/3T8GQQkYTyskjPWt/3nCan
5wADxvamyeOpeEhFqke6O33PxGD2jA==
=0nPV
-----END PGP SIGNATURE-----

--e7WmlSfQJTtHfSol--

--===============0268084856529207600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0268084856529207600==--
