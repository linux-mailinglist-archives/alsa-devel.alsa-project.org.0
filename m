Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0DD127ACC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 13:13:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF2B1667;
	Fri, 20 Dec 2019 13:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF2B1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576844025;
	bh=l4SiG5Do3taU62ejND4qgS2G7guRCbgUiLHqs/lNcuo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9FJZzeZQ6G7xJc9Fz/n/bjjbHTtJgkILKKmd1Mz071EnioaP9/8GehLObZB5Wzxf
	 3NDxQay07pH8WRM08VjIfhMh5WPLecAPhlHjJkSVjO4tUM3y+uY4cVRze+6blnstjJ
	 hD1pCbdWAjGlUjBHRLTEvBv0Vh7lZ3VbIO/UmN/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90432F8015A;
	Fri, 20 Dec 2019 13:12:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ED01F8014F; Fri, 20 Dec 2019 13:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E5D5FF80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 13:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D5FF80059
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA40830E;
 Fri, 20 Dec 2019 04:11:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 683BC3F719;
 Fri, 20 Dec 2019 04:11:54 -0800 (PST)
Date: Fri, 20 Dec 2019 12:11:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20191220121152.GC4790@sirena.org.uk>
References: <1576836934-5370-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1576836934-5370-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Cookie: I think we're in trouble.
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
Content-Type: multipart/mixed; boundary="===============1051287562156117635=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1051287562156117635==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2019 at 06:15:34PM +0800, Jeff Chang wrote:

> +++ b/sound/soc/codecs/mt6660.c
> @@ -0,0 +1,653 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +	{ MT6660_REG_DEVID, 2},
> +	{ MT6660_REG_TDM_CFG3, 2},
> +	{ MT6660_REG_HCLIP_CTRL, 2},
> +	{ MT6660_REG_DA_GAIN, 2},

Missing space before the } (the same thing happens in some of the
other tables).

> +static int mt6660_component_get_volsw(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct mt6660_chip *chip = (struct mt6660_chip *)
> +		snd_soc_component_get_drvdata(component);
> +	int ret = -EINVAL;
> +
> +	if (!strcmp(kcontrol->id.name, "Chip_Rev")) {

Why would this be used on a different control?

> +	SOC_SINGLE_EXT("BoostMode", MT6660_REG_BST_CTRL, 0, 3, 0,
> +		       snd_soc_get_volsw, snd_soc_put_volsw),

Boost Mode.  You've also got a lot of these controls that are _EXT but
you then just use standard operations so it's not clear why you're using
_EXT.

> +	SOC_SINGLE_EXT("audio input selection", MT6660_REG_DATAO_SEL, 6, 3, 0,
> +		       snd_soc_get_volsw, snd_soc_put_volsw),

Audio Input Selection, but this looks like it should be a DAPM control
if it's controlling audio routing.  A simple numerical setting
definitely doesn't seem like the right thing.

> +	SOC_SINGLE_EXT("AUD LOOP BACK Switch", MT6660_REG_PATH_BYPASS, 4, 1, 0,
> +		       snd_soc_get_volsw, snd_soc_put_volsw),

This sounds like it should be a DAPM thing too.

> +static int mt6660_component_probe(struct snd_soc_component *component)
> +{
> +	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +
> +	dev_info(component->dev, "%s\n", __func__);

dev_dbg() at most but probably better to remove this and the other
similar dev_info()s.

> +static inline int _mt6660_chip_id_check(struct mt6660_chip *chip)
> +{
> +	u8 id[2] = {0};
> +	int ret = 0;
> +
> +	ret = i2c_smbus_read_i2c_block_data(chip->i2c, MT6660_REG_DEVID, 2, id);
> +	if (ret < 0)
> +		return ret;
> +	ret = (id[0] << 8) + id[1];
> +	ret &= 0x0ff0;
> +	if (ret != 0x00e0 && ret != 0x01e0)
> +		return -ENODEV;

It'd be better to print an error message saying we don't recognize the
device to help people doing debugging.

> +	if (of_property_read_u32(np, "rt,init_setting_num", &val)) {
> +		dev_info(dev, "no init setting\n");
> +		chip->plat_data.init_setting_num = 0;

You should be adding a DT binding document for any new DT bindings.

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl38uogACgkQJNaLcl1U
h9B+kQf6AzhZSat7mqBSwJVubwAXZcJ6ApJ29GlB2ypbTdOhUOTKKR8ytA2kMg6l
Ifw88ajLzpL4jAIHwwS3NOMonMD/9KgNLfQVgMxzuzsYyRYBmj7p9lXsYICNIvoe
nSn2nPJfw5g5PlMZ+qwxyNNMTOkui6qKCFoFS77TJq0hsbTh+x6azMfn8VVRwrL+
VRXPN2C9mAdyrVPw/XPjkTyCrXw8P6brXK6qW23Y14FRQ8dXke0rhMumWytquybM
ebURG75CUEXyykGbNGHoJa4ycypd5AA/LYR86mzRbs7Mxiqlmw3co8/C44n4XKM0
QungC3A3a98p1kNSIiBM9g2Ie+cgBw==
=pOxx
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--

--===============1051287562156117635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1051287562156117635==--
