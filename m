Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F6C58C78F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 13:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB54683A;
	Mon,  8 Aug 2022 13:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB54683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659958424;
	bh=B/lf+y9KSXHOmcIiau+/+qYTZoGaSar7p/kP9jD7Blc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=It6x2yC0fWD7DJUZcl+O9EEXduozTAWn+CNghaguxXkpDB373tzEdmDH0pFJG97qZ
	 GClZSbTRaQ3ejvtzNf8XGMKxQMSMOFeO8AcHQEirLP14ROg9C0gNIzKNZm+P8KxpcZ
	 zTf00NJB1VguudN+wfeXWQqSebbesoHUioMmep3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EE1F804B1;
	Mon,  8 Aug 2022 13:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE773F8049C; Mon,  8 Aug 2022 13:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA4FCF800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 13:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA4FCF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IlFprKBz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07AB06113B;
 Mon,  8 Aug 2022 11:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F66C433D6;
 Mon,  8 Aug 2022 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659958352;
 bh=B/lf+y9KSXHOmcIiau+/+qYTZoGaSar7p/kP9jD7Blc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlFprKBzEhLmet0rBga94xdZJ29s6pZM1FNGR6Ud/EIEjiajIzqMGyO+HLNyIgVWi
 G4Sd6yP+lzQK23DoW/mL3PxWC6x+cKLpVRPryvm/rM63VqP/WnLp86xnN3r0Narr6f
 Iu30tRaWbe5pJ3rhDbQ6wx0eXOTQLUn+xMNhkhSbkw7n0Ai/RsnhYALukZt0bN1PX/
 2+21BX9rpXIVMt3wgCvpxuLfi5ldlHvNJxIBq6dsGjbL9WecyQWZV0oJQflZiIzus+
 cJUliJ3+q+O6zYFb8eBx2lkvGqTMmEFt9tTJU5bhixkUkIaecs6sYYOWUVVgPIpHhO
 CVxpuMFPqjR7w==
Date: Mon, 8 Aug 2022 12:32:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Subject: Re: [PATCH] ASoC: codecs: add support for the TI SRC4392 codec
Message-ID: <YvD0Sy7SJsiPaZPd@sirena.org.uk>
References: <20220808071952.2432253-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VOmgWxGw8XkhSlTc"
Content-Disposition: inline
In-Reply-To: <20220808071952.2432253-1-flatmax@flatmax.com>
X-Cookie: Are we running light with overbyte?
Cc: alsa-devel@alsa-project.org
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


--VOmgWxGw8XkhSlTc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 08, 2022 at 05:19:52PM +1000, Matt Flax wrote:
> The src4xxx keyword is used for	future capability to integrate
> other codecs similar to the src4392 to the same	code base.

Formating here is really weird.

> +	tristate "Texas Instruments SRC4XXX DIR/DIT and SRC codecs"
> +	help
> +		Enable support for the TI SRC4XXX family of codecs. These include the
> +		scr4392 which has digital receivers, transmitters, and
> +		a sample rate converter, including numerous ports.

Please keep this to 80 columns.

> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for SRC4XXX codecs
> + *
> + * Copyright 2021-2022 Deqx Pty Ltd
> + * Author: Natt Flax <flatmax@flatmax.com>

Please make the entire comment a C++ one so things look more
intentional.

> +static const struct of_device_id src4xxx_of_match[] = {
> +	{ .compatible = "ti,src4392", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, src4xxx_of_match);

This is adding a DT binding, that binding should be documented.

> +static const struct snd_kcontrol_new dit_mux_control =
> +	SOC_DAPM_ENUM("Dig. Out src", dit_mux_enum);

Please write words out fully as is idiomatic for ALSA.

> +static const char * const src_mclk_text[] = {
> +	"Master (MCLK)", "Master (RXCLKI)", "Recovered receiver clk",
> +};
> +static SOC_ENUM_SINGLE_DECL(src_mclk_enum, SRC4XXX_SCR_CTL_2D, 2,
> +	src_mclk_text);
> +static const struct snd_kcontrol_new src_mclk_control =
> +	SOC_DAPM_ENUM("SRC master clock select", src_mclk_enum);

I would normally expect this to be controlled by the machine driver -
why expose it to userspace?

> +static int src4xxx_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct src4xxx *src4xxx = snd_soc_component_get_drvdata(component);
> +	unsigned int ctrl;
> +
> +	dev_info(dai->dev, "__func__ enter 0x%x id=%d\n",
> +		fmt, dai->id);

This is way too noisy, in general this sort of print is redundant and it
certainly shouldn't be something like dev_info() which is often printed
to the console by default.  In general the driver should be silent in
normal operation, especially on the console.

> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +	ctrl |= SRC4XXX_BUS_I2S;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		ctrl |= SRC4XXX_BUS_LEFT_J;

The indentation here is weird and inconsistent...

> +	int reg = SRC4XXX_PORTA_CTL_04;
> +	int ret;
> +
> +	if (dai->id == SRC4XXX_PORTB)
> +		reg = SRC4XXX_PORTB_CTL_06;

Write a switch statement to select the register, it would be a lot
clearer.

> +		if (ret) {
> +			dev_err(component->dev,
> +		"Couldn't set the TX's div register to %d << %d = 0x%x\n",

Again really strange indentation.

> +	/* enable the BTI and TSLIP interrupts */
> +	ret = regmap_update_bits(src4xxx->regmap, SRC4XXX_SRC_DIT_IRQ_MSK_0B,
> +		SRC4XXX_SRC_BTI_EN | SRC4XXX_SRC_TSLIP_EN,
> +		SRC4XXX_SRC_BTI_EN | SRC4XXX_SRC_TSLIP_EN);
> +	if (ret < 0)
> +		dev_err(dev,
> +			"Failed to enable BTI and TSLIP interrupts : %d\n",
> +			ret);

The driver never requests an interrupt?

> +	if (ret == 0)
> +		dev_info(dev, "src4392 probe ok %d\n", ret);
> +	return ret;
> +}
> +EXPORT_SYMBOL(src4xxx_probe);

This is using _GPL() APIs from ASoC and regmap, it should be _GPL too.

> +void src4xxx_remove(struct device *dev)
> +{
> +	dev_info(dev, "__func__\n");
> +}
> +EXPORT_SYMBOL(src4xxx_remove);

This is just noise, remove the function entirely.

--VOmgWxGw8XkhSlTc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLw9EsACgkQJNaLcl1U
h9D+4gf/Ztbp4VhuAU4zlZqKoPmJ1Aoj3eBOZ/7vh//H+ZYtNEYcYrf4jxx5kUzM
fg5BagWVgLTQrG5icS85ogCVvII7D8JtUhKwyeBdSQe60ZjKyGeIrryrXs67jXrX
4ouoDlpFD1vey2AcNTggGCKoL0dX/ZTBRouz8a4tuwv4zDupW95WVQ2gXunukVSf
zgnGPEQPA4R/YXKjPNQfRriHMXwidZmjf8X1YEqqGXIpLmNZ5HVVXg0ZWbpJhr61
JYme3ExCVFPn798lH3S2l9TCVSlHgfxWs1xR6AwC43K4u3fDXc64jdy2KJck3wt9
bKiJRimxhsGWSl/c5KX2CTw+zDtU/Q==
=bGCd
-----END PGP SIGNATURE-----

--VOmgWxGw8XkhSlTc--
