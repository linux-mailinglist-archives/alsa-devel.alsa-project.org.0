Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A86E33F16A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 14:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B8818CF;
	Wed, 17 Mar 2021 14:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B8818CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615988827;
	bh=owZirdzjevkgJvg1/FolZDyUm8Xp5x7OthQx9T/naN8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vsu83xEUbv4lgVq9+cWmYSiYVhKrDIU9rNiQ1muwwedzrzYvRY7U4D9IihQRJO+2R
	 U2ynb21ibT2GuK42MQwmqY+7AGR9Fh+f4tpqaMtYNIYPECt9oCsSztqjfbON0eCZ4f
	 qg7fNXbxH27VOeV9vixOh7SWFyPwIunbCXYMpE2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E7BBF8013F;
	Wed, 17 Mar 2021 14:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EAF7F8013F; Wed, 17 Mar 2021 14:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C366AF8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 14:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C366AF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i5d0cCMA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 952F964F0F;
 Wed, 17 Mar 2021 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615988728;
 bh=owZirdzjevkgJvg1/FolZDyUm8Xp5x7OthQx9T/naN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5d0cCMAhCZigZZFy+b2uU5pXYHfGMTY4+xFZIGtFHyoVNOkjug4iP92EUXMKgVxm
 38ciB2Yp/TFd7cQbol7rd94wbXgaArc70z62+fTeHBEK2drQHUGPxc2jEUqZRLQw/u
 ji9hlyckwNZjMIl0qAmP7znYlf0e5a06/lTaF9rxWTBhdtEzBo+83sdBVabP+/cWpf
 3sj+rlfo2GckeZZtJpgpzs/6PFkx/InXiqbIlLfUHhVwAoGlVe1fYUP9lq0MyXDwlj
 O+kKnhplvOqDbIY5l0/+uv6jgCfuNJ8Mo/pHZW2tkn8490quq0NqogeU5xEuWYdMgf
 SfnIUSyvZocYg==
Date: Wed, 17 Mar 2021 13:45:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] [RFCv3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210317134524.GB5559@sirena.org.uk>
References: <SN6PR06MB53428DB202A47AE12C039742A56B9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB53428DB202A47AE12C039742A56B9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 02:53:45PM -0500, Chris Morgan wrote:

> +static int rk817_init(struct snd_soc_component *component)
> +{
> +	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
> +
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);

These should be pushed into a set_pll() call, even if it just accepts
only fixed arguments.

> +	snd_soc_component_write(component, RK817_CODEC_DMIC_PGA_GAIN, 0x99);

This looks like it should be a user visible gain control.

> +	snd_soc_component_init_regmap(component, rk817->regmap);
> +	rk817->component = component;
> +
> +	clk_prepare_enable(rk817->mclk);

Should check the return value of clk_prepare_enable().

> +
> +	clk_prepare_enable(rk817_codec_data->mclk);
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_rk817,

The driver is enabling the clock in both component and device level
probes - I'd just leave it in the device level probe only if you're not
actively managing it.  You'd need to add a remove() function with the
matching disable.

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBSB/QACgkQJNaLcl1U
h9B+yQf/fABmHKBg3NWxJIjk3E162xn4sbSOh63FPnBHUOoyhY54QiXmEMqvPX9g
5FcQdi+9K+m+i8pvMOWH2IFDaRGynpzRV19vAbySJPTLcDISXSbddRdx/SQ89qcz
3X2pOynd/ixkLJOHfKzH5ha9cS7wtlxfFoMcjwHh7V7mxHa9A/Ont41aiDJcuxT3
8JBxzNgmmGrENrRHQwee8F3ykfAMQ1a8Myp8xIpEGdPbzMswnOARGzOjBE0isjMZ
6+/xgiDyNFRUdxQtqBTHcoPfZSBSqf8IWCYsYMOsWv2LqYg3fA8DsI+tBEC/hPuO
yz4iLm1CCo59B3Be4NS3slT9FA/kBw==
=45hH
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
