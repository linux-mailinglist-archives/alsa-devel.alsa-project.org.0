Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1411D043
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC66216F0;
	Thu, 12 Dec 2019 15:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC66216F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576162523;
	bh=qUOpyEFVwKp5c2seOir2AF+LnbEHJHM5oErmWETGZDM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGMFnA65aD9TlX8LJdgE4Cl6RyVl1peB3xN24wh0HxeRf7iop3CniDGDxORZFeabK
	 u2CJ6FOmf5Kc4ugKm3I3fft9p76U75FhIfole4gl2sJfiAqtviLUgllP/2on+CVqqB
	 Aonb3XC2uAqvYBdQEpPEmePAYouYsr+N4um9qrVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDBA2F800EC;
	Thu, 12 Dec 2019 15:53:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AC8CF8020C; Thu, 12 Dec 2019 15:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C96E4F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 15:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C96E4F800EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEE1CDA7;
 Thu, 12 Dec 2019 06:53:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E5B03F6CF;
 Thu, 12 Dec 2019 06:53:32 -0800 (PST)
Date: Thu, 12 Dec 2019 14:53:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20191212145330.GC4310@sirena.org.uk>
References: <1576152740-11979-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1576152740-11979-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============0700892921981797468=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0700892921981797468==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2019 at 08:12:20PM +0800, Jeff Chang wrote:

> sense, which are able to be monitored via DATAO through proper
>=20
> ---
>=20
> [PATCH v2] :
> 	1. remove unnecessary space from commit message
> 	2. add Signed-off-by info
>=20
> Signed-off-by: Jeff Chang <richtek.jeff.chang@gmail.com>
> ---

You should place the Signed-off-by before the first --- as covered by
submitting-patches.rst.  Please, slow down a bit before resending and
make sure you've checked what you're doing thoroughly.  Look at what
you're sending and how it compares to what others are sending.

> +config SND_SOC_MT6660
> +	tristate "Mediatek MT6660 Speaker Amplifier"
> +	depends on I2C
> +	select CRC32
> +	select CRYPTO_SHA256
> +	select CRYTO_RSA
> +	help

These selects of crypto stuf appear entirely unrelated to anything in
the driver?

> +++ b/sound/soc/codecs/mt6660.c
> @@ -0,0 +1,1063 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static int mt6660_dbg_io_write(void *drvdata, u16 reg,
> +			       const void *val, u16 size)
> +{
> +	struct mt6660_chip *chip =3D (struct mt6660_chip *)drvdata;
> +	int reg_size =3D mt6660_get_reg_size(reg);
> +	int i =3D 0;
> +	unsigned int regval =3D 0;
> +	u8 *_val =3D (u8 *)val;

This is duplicating standard regmap functionality.

> +static bool mt6660_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return true;
> +}

There's no need to do this, there's no cache configured.

> +static unsigned int mt6660_component_io_read(
> +	struct snd_soc_component *component, unsigned int reg)
> +{
> +	struct mt6660_chip *chip =3D snd_soc_component_get_drvdata(component);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(chip->regmap, reg, &val);
> +	if (ret < 0) /* ret success -> >=3D 0, fail -> < - */
> +		return ret;
> +	pr_err("%s val =3D 0x%x\n", __func__, val);
> +	return val;
> +}

This function appears to be redunddant, ASoC has wrappers for I/O on
components, same for writes.

> +static int data_debug_show(struct seq_file *s, void *data)
> +{
> +	struct dbg_info *di =3D s->private;
> +	struct dbg_internal *d =3D &di->internal;

regmap has standard support for dumping the register map via debugfs, no
need to write your own.  You should be able to just remove all the
debugfs code.

> +/*
> + * MT6660 Generic Setting make this chip work normally.
> + * it is tuned by Richtek RDs.
> + */
> +static const struct codec_reg_val generic_reg_inits[] =3D {
> +	{ MT6660_REG_WDT_CTRL, 0x80, 0x00 },
> +	{ MT6660_REG_SPS_CTRL, 0x01, 0x00 },
> +	{ MT6660_REG_AUDIO_IN2_SEL, 0x1c, 0x04 },

The writes to reserved registers should be fine but things like this
which looks like it's configuring the input path should just be left at
the chip default, we don't want to be configuring for particular boards
since the same driver will be used for every board with the chip.

> +	{ MT6660_REG_HPF1_COEF, 0xffffffff, 0x7fdb7ffe },
> +	{ MT6660_REG_HPF2_COEF, 0xffffffff, 0x7fdb7ffe },

Similarly here.

> +static int mt6660_component_init_setting(struct snd_soc_component *compo=
nent)
> +{
> +	int i, len, ret;
> +	const struct codec_reg_val *init_table;
> +
> +	pr_info("%s start\n", __func__);

These pr_info() calls are going to be too noisy.

> +	switch (level) {
> +	case SND_SOC_BIAS_OFF:
> +		ret =3D regmap_read(chip->regmap, MT6660_REG_IRQ_STATUS1, &val);
> +		dev_info(component->dev,
> +			"%s reg0x05 =3D 0x%x\n", __func__, val);
> +		break;

This is just making noise, it looks like there's nothing to do in this
function at all and the above is only for debugging.  There's lots of
these throughout the driver.

> +static int mt6660_component_put_volsw(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D
> +		snd_soc_kcontrol_component(kcontrol);
> +	int put_ret =3D 0;
> +
> +	pm_runtime_get_sync(component->dev);
> +	put_ret =3D snd_soc_put_volsw(kcontrol, ucontrol);
> +	if (put_ret < 0)
> +		return put_ret;
> +	pm_runtime_put(component->dev);
> +	return put_ret;
> +}

It would be *much* better to just use a register cache here rather than
open code like this, and given that the device is suspended via the
register map it is more than a little surprising that there's any need
to do anything special here.

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yVGkACgkQJNaLcl1U
h9AdBgf/Txq2F8UErlJS7V2ETpVBmA7z2H4huGjRBF5D9tDQD5uNbT/pA25/Oe5D
VFt+1dRHKpk3TU3MUFiIwkZNH0UzD2MC8RmK3UvxGZP51HCE9R8SkleH8cDoSbJc
aZqys/4lsz0DVc+qzhyuxHA2dckYOyqRTrn+4RNT1Q3reiJfYDDk5ziZRpqohril
8e9lNqyTewpob7SrL5zUtHbn0cIGuSFt/mo6Iweocy6+J7hYMEZEBb7kd84LAhRP
H3S3ggEEGC32CS0ez0Qdgm+tq6DF2+UGkZOU6AGk9aOgjbGoBZxvWlXTQS/qPX1C
04OcQ5JFv5kv6Sr/okYs23KuYYQrLg==
=2dQa
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--

--===============0700892921981797468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0700892921981797468==--
