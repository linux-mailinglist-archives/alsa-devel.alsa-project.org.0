Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7477903906
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 12:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 589ABE9D;
	Tue, 11 Jun 2024 12:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 589ABE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718102236;
	bh=GRiJHJeBxHjjSrVuUZQEjtAnkrsyVP3YUixQ0bIDogY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AEut7FmV6TFXCJwXplFLRzps5TRSWlb7StKmyYyvzyUVdKsaKcoLqlGnRCG3UKYHK
	 5OQarFRc88ngWdo/avpL7kplSMf20wELt4ERJma6MYDf0zbQpE9l5O4UBFwl1K7YOl
	 r5ikEthsGoOH4qcB1a/61NW2daRGWo+YzrrYsVZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42DD1F805B4; Tue, 11 Jun 2024 12:36:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BADE2F8058C;
	Tue, 11 Jun 2024 12:36:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 263A1F8057A; Tue, 11 Jun 2024 12:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 813B2F8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 12:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 813B2F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gqnSTrD7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7243A60C71;
	Tue, 11 Jun 2024 10:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985F7C2BD10;
	Tue, 11 Jun 2024 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718102194;
	bh=GRiJHJeBxHjjSrVuUZQEjtAnkrsyVP3YUixQ0bIDogY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqnSTrD70/+vXgJD/5znDSFJoVnc7K8K6uckcQ3lWeVRuhL/70lTfzEN+6ZMRR5lU
	 QpQDparoIxqKCPK+ccn2ON/mf/aml+H+R07RM2rKDM74OfVrDpDvb32r1jk0nCddBM
	 bEfy3OIM2u+OlkNS0DYGtBXRG4SSa3ywLYgv06ekYWDSRayaANzBun4myW4uzyDWYw
	 4Mx+j0Y5GL1WQv//PFcyjnu7Mzd7jbs82fy0aK74PKm+R1B6eB+DKMasNzMylER/jO
	 KnUJJ0KBuxv00TT2P5DjcpJSoOIepMikp0zRLYUGJ4KdtBh5MMNf+FY8B/l+0rbXFa
	 E1M3eM9xJvUEw==
Date: Tue, 11 Jun 2024 11:36:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
References: <[PATCH]ASoC:fsl:Addi2sandpcmdriversforLPC32xxCPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WW949k97zQLQvi69"
Content-Disposition: inline
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: YSCUBQFBNEWIZRWKR3S2GK3ZBL4JHTQF
X-Message-ID-Hash: YSCUBQFBNEWIZRWKR3S2GK3ZBL4JHTQF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSCUBQFBNEWIZRWKR3S2GK3ZBL4JHTQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--WW949k97zQLQvi69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 11:47:51AM +0200, Piotr Wojtaszczyk wrote:

>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi |   4 +
>  arch/arm/mach-lpc32xx/phy3250.c        |  60 ++++

These architecture changes are separate and should at least be separate
commits, copied to the architecture maintainers.

> +FREESCALE SOC LPC32XX SOUND DRIVERS
> +M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linuxppc-dev@lists.ozlabs.org
> +S:	Orphan
> +F:	sound/soc/fsl/lpc3xxx-*
> +

It seems a bit odd to add yourself as a maintainer while also marking
the driver as orphan?

> +config SND_SOC_FSL_LPC3XXX
> +	tristate "SoC Audio for NXP LPC32XX CPUs"
> +	depends on ARCH_LPC32XX && SND_SOC

On a quick scan I can't see any architecture dependency for build,
please add an || COMPILE_TEST for improved coverage.  As for all the
other things enabled in this Kconfig file there is no need to explicitly
depend on SND_SOC.

> @@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_FSL_XCVR) +=3D snd-soc-fsl-xcvr.o
>  obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) +=3D snd-soc-fsl-aud2htx.o
>  obj-$(CONFIG_SND_SOC_FSL_RPMSG) +=3D snd-soc-fsl-rpmsg.o
>  obj-$(CONFIG_SND_SOC_POWERPC_QMC_AUDIO) +=3D snd-soc-fsl-qmc-audio.o
> +obj-$(CONFIG_SND_SOC_FSL_LPC3XXX) +=3D snd-soc-fsl-lpc3xxx.o
> =20
Please try to keep these files sorted alphabetically (it's not 100% at
the minute but no need to make it worse).

> --- /dev/null
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -0,0 +1,383 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Author: Kevin Wells <kevin.wells@nxp.com>
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static u32 absd32(u32 v1, u32 v2)
> +{
> +	if (v1 > v2)
> +		return v1 - v2;
> +	return v2 - v1;
> +}

Just use abs()?

> +static int lpc3xxx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned=
 int fmt)
> +{
> +	struct lpc3xxx_i2s_info *i2s_info_p =3D snd_soc_dai_get_drvdata(cpu_dai=
);
> +	struct device *dev =3D i2s_info_p->dev;
> +
> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) !=3D SND_SOC_DAIFMT_I2S) {
> +		dev_warn(dev, "unsupported bus format %d\n", fmt);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}

If we're validating for I2S we should probably validate for clock
provider too.  Or just remove the function, it's not really needed?

> +	i2s_info_p->clk =3D devm_clk_get(dev, "i2s_clk");
> +	if (IS_ERR(i2s_info_p->clk))
> +		return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can't get clock\n=
");
> +
> +	i2s_info_p->clkrate =3D clk_get_rate(i2s_info_p->clk);
> +	if (i2s_info_p->clkrate =3D=3D 0)
> +		return dev_err_probe(dev, -EINVAL, "Invalid returned clock rate\n");

Nothing ever enables this clock.

> +static int lpc32xx_i2s_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

Remove empty functions, if they can legitimately be empty the framework
will support them being absent.

> +#define _SBF(f, v) ((v) << (f))

FIELD_PREP()

> +#define _BIT(n) _SBF(n, 1)

BIT().

> +/* I2S controller register offsets */
> +#define I2S_DAO		0x00
> +#define I2S_DAI		0x04
> +#define I2S_TX_FIFO	0x08
> +#define I2S_RX_FIFO	0x0C
> +#define I2S_STAT	0x10
> +#define I2S_DMA0	0x14
> +#define I2S_DMA1	0x18
> +#define I2S_IRQ		0x1C
> +#define I2S_TX_RATE	0x20
> +#define I2S_RX_RATE	0x24

Add a prefix to all these I2S_ names in case of collisions.

--WW949k97zQLQvi69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoKKsACgkQJNaLcl1U
h9DNgQf/bVmcCufP8jvhRnYGwhJ74PYfe8uGNqVDcvOPBqyxwbAHEcBkY4os9h6R
GoQMz21Qh+ZtEks0KjHFDl3Lnd51Kac5YBeyl5s/WRciIBOxe+jSqmW0GpRYZwZ+
YEMXUIyS6zA8Tik8onJLOtFrl4wLHXafkWOOPulK5v8+mZXYqPypwKq87c43IkrI
MviOLdW4TB0CVCKvk590+1YPY+ZBBAELM6eO/D9du/AyvN+BkUnZLO/VOwQ4enRQ
r2xnb2uSXMbDtKZKr4PbNw+9NbNaw9axfSzHbwXCu1Z0y+eOEKS1Vu2613VY9Al0
VKMHNg0tTYcWMk0XTzihz60mgPSf0A==
=srbB
-----END PGP SIGNATURE-----

--WW949k97zQLQvi69--
