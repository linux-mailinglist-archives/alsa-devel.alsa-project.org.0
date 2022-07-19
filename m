Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D365798AD
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 13:43:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E9816D2;
	Tue, 19 Jul 2022 13:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E9816D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658230985;
	bh=v8PeHN2Ygs1u/dbSFwAhEUja3BF2PY9zOYVkyVdHkxM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Edr9ds9wNypa7wWAqa1qJ0tY6gc3WsdF6U0fy6Efi7W9jyH7u33mg9oRteVmDrvAk
	 FUfO7sHnavQD9eHsHdc7D4+zWaSOAmh+UWltLRbTBf3SbXxmMHVJ70U4ccBvyprArf
	 DcEn/Z3Ith/VigITASpTuPfzL8ferXb21/eGU6AA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 456B4F80224;
	Tue, 19 Jul 2022 13:42:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0726F801EC; Tue, 19 Jul 2022 13:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35641F80118;
 Tue, 19 Jul 2022 13:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35641F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o6MNwPLl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE7F9615D2;
 Tue, 19 Jul 2022 11:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CE0C341C6;
 Tue, 19 Jul 2022 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658230915;
 bh=v8PeHN2Ygs1u/dbSFwAhEUja3BF2PY9zOYVkyVdHkxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o6MNwPLlI3Ub9l2pHHovhTKP+I7WcOFoGXkzad+taoDaiJCfuEfnzALN3hRxXABao
 wozsBjs/4s2UdYn/+F4uOg84mWsIwPC8xTVVc7twH3IFUy37Qiv1jws9GJlfvBfYkG
 i2WYhyLJgVuRtB0rYLIEfPradMwFDelXJJAas0nWDA6qORk8BuvCGUnk7PORrJTAOl
 7vQWOKbMwF7YSPp4DLuL8byoxNFiNt6yM67UDQ8w3aU7ujvnQvB2gPGSfcKGxKXPUp
 +Hb6lI/2dCiiUunzHRCzVa9uJzZ0rV0VRMIZdZx2JE0M4/UPfWJk81CfhT+Uxsu70y
 YwH+wXFjBgAoA==
Date: Tue, 19 Jul 2022 12:41:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add i.MX8ULP HW support
Message-ID: <YtaYe58xS4ynZ+A4@sirena.org.uk>
References: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Gfkuz1LFkvb5qJgu"
Content-Disposition: inline
In-Reply-To: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 sound-open-firmware@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 festevam@gmail.com, ranjani.sridharan@linux.intel.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 peter.ujfalusi@linux.intel.com, robh+dt@kernel.org, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org
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


--Gfkuz1LFkvb5qJgu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 19, 2022 at 01:26:06PM +0800, Shengjiu Wang wrote:

Not a thorough review, just a few nitpicks:

> +#define MBOX_SIZE		0x1000
> +
> +struct arm_smccc_res		smc_resource;

This should be static shouldn't it?

> +static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> +{
> +	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
> +
> +	imx8ulp_get_reply(priv->sdev);
> +	snd_sof_ipc_reply(priv->sdev, 0);
> +	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);

Minor nitpick but a blank line before the unlock to match the one after
the lock would be a bit easier to read.

> +	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> +	usleep_range(1, 2);
> +
> +	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);

You need linux/arm-smccc.h for this (as 0day said).

> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to init reserved memory region %d\n", ret);
> +		goto exit_pdev_unregister;
> +	}
> +
> +	priv->clks->dsp_clks = imx8ulp_dsp_clks;
> +	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8ulp_dsp_clks);
> +
> +	ret = imx8_parse_clocks(sdev, priv->clks);
> +	if (ret < 0)
> +		goto exit_pdev_unregister;
> +
> +	ret = imx8_enable_clocks(sdev, priv->clks);
> +	if (ret < 0)
> +		goto exit_pdev_unregister;

We're registering the platform device before we enable the clocks - is
that safe?

> +static int imx8ulp_remove(struct snd_sof_dev *sdev)
> +{
> +	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> +
> +	platform_device_unregister(priv->ipc_dev);
> +
> +	return 0;
> +}

Could we just use devm?  I'm not seeing an ordering issue but I might be
missing something.

--Gfkuz1LFkvb5qJgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLWmHoACgkQJNaLcl1U
h9C2gQf/cgh8vX+NSAVJKcFpo8TGYQkH6ILglXaaVQyN7G9PGgvBvaMK7gyCH2PS
eidTok4O5f6KCB3wDcLc9wIzO7M6K6iAlU/HTphK0wCizWtpEMZ+N9Hv20w141kx
O77/69rr687IfYRekqkka1438ED2L1AMYz/4bt3mDD/9XxuxLmKkZCvcCfyzgn8q
WyhbDCKNOgswfgyxEwMJecQ8wCS1amf99hx103P0xAejrT4V2uwdqptJ1AOz9dL0
iEp79naTEpE0uBX/4LM3bOTLaim1AOMOk3yPPaCBOIX8lu0QmapcXgigVt8iaQCM
PhxtfFs93bcc32VrmeqIXvWsCRF9fw==
=RXwS
-----END PGP SIGNATURE-----

--Gfkuz1LFkvb5qJgu--
