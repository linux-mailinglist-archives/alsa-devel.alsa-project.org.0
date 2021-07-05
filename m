Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA413BC311
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DDEF16CA;
	Mon,  5 Jul 2021 21:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DDEF16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625512985;
	bh=CzgLO/M8aM0IVE6URq0nrafA+LqiKiGXjmvU1S6Bn1Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EN8nuz4BxqoZ4cN1WhlO+bwXjsEQxzfv7IDHGXdIzuC5fUg4XvPoDEx/E4+1EZvzj
	 8IUsznS6m/SOspAGwvzFjNCt6aRENZRLBHdw6WWDDuE00QZk6Dpxw8GbykfRWq9vOg
	 6wIZtOZN1KrdH+3Y/eiBXqWtvvOhwaQOQRlqeeKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C67FBF80134;
	Mon,  5 Jul 2021 21:21:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D133F80134; Mon,  5 Jul 2021 21:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57CB4F80134
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57CB4F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SDwK5FUJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82E8F6141C;
 Mon,  5 Jul 2021 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625512886;
 bh=CzgLO/M8aM0IVE6URq0nrafA+LqiKiGXjmvU1S6Bn1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDwK5FUJCou3ZVHhVzZpHbSxvfBHf6bMKERN5yuusTTCzEvfYnk1KBZ+sYZoCwvLb
 mA5jOAcovNcmtU5W7MzZ8/eP2/ldKJ/ZnhuqP+FsXiHSucQV7yoV2pZMgsiNPvSlZ0
 VeEMJV5Q39xkfrgxTWif/ei0/WxHsXCUB/hh+5NwYoYsdUw4oZB47dDcfkpT5Dd8xM
 R6ZveGjeS/RthP0QANMwTLIFTLfAZe1QeSRCLCj8bg1E5tuW1Gnw6QCxzovw/HSgzJ
 1++QoffNg4urd1TqyXs4kyrmmF4fn8aeArIROudEnoDw/9FQ4J3Z2F5ES2EhskZ8G0
 RwHDzP6ZcnwQQ==
Date: Mon, 5 Jul 2021 20:20:54 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210705192054.GG4574@sirena.org.uk>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PpAOPzA3dXsRhoo+"
Content-Disposition: inline
In-Reply-To: <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
X-Cookie: Star Trek Lives!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 02, 2021 at 03:51:26PM -0500, David Rhodes wrote:

This looks pretty good - a few fairly small issues and some queries
below:

> index 000000000000..7ee60ff0de26
> --- /dev/null
> +++ b/include/sound/cs35l41.h
> @@ -0,0 +1,79 @@

> +struct cs35l41_private {
> +	struct snd_soc_codec *codec;
> +	struct cs35l41_platform_data pdata;

Why does anything looking in include/sound need the driver private data?
It's not entirely clear why this is in include/sound at all.

> +	struct regulator_bulk_data supplies[2];
> +	int num_supplies;

Why might the number of supplies vary?

> +++ b/sound/soc/codecs/cs35l41-i2c.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * cs35l41-i2c.c -- CS35l41 I2C driver

Please make the entire comment a C++ one so things look more
intentional.

> +#include <linux/slab.h>
> +#include <linux/version.h>

You probably don't need at least version.h here.

> +static void cs35l41_spi_otp_setup(struct cs35l41_private *cs35l41,
> +					bool is_pre_setup, unsigned int *freq)
> +{
> +	struct spi_device *spi;
> +	u32 orig_spi_freq;
> +
> +	spi = to_spi_device(cs35l41->dev);
> +
> +	if (!spi)
> +		return;

Why might this reasonably happen, shouldn't we complain loudly?

> +#ifdef CONFIG_OF
> +static const struct of_device_id cs35l41_of_match[] = {
> +	{.compatible = "cirrus,cs35l40"},
> +	{.compatible = "cirrus,cs35l41"},
> +	{},


Coding style - spaces around the { } like everywhere else.

> +	/* Check to see if unmasked bits are active */
> +	if (!(status[0] & ~masks[0]) && !(status[1] & ~masks[1]) &&
> +		!(status[2] & ~masks[2]) && !(status[3] & ~masks[3]))
> +		return IRQ_NONE;


> +	}
> +
> +	return IRQ_HANDLED;
> +}

This seems to handle any asserted interrupt, is it clear on read?

> +	case SND_SOC_DAPM_POST_PMD:
> +		regmap_read(cs35l41->regmap, CS35L41_PWR_CTRL1, &val);
> +		if (val & CS35L41_GLOBAL_EN_MASK) {
> +			regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
> +					CS35L41_GLOBAL_EN_MASK, 0);

I can't see any references to GLOBAL_EN outside this function, why might
it not be set?

> +static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
> +{
> +	struct cs35l41_classh_cfg *classh = &cs35l41->pdata.classh_config;
> +	int ret;
> +
> +	/* Set Platform Data */
> +	/* Required */
> +	if (cs35l41->pdata.bst_ipk &&
> +			cs35l41->pdata.bst_ind && cs35l41->pdata.bst_cap) {

The indentation here is weird, normally the second line would be
indented with the (.

> +	if (cs35l41->pdata.dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK &&
> +	    cs35l41->pdata.dout_hiz >= 0)
> +		regmap_update_bits(cs35l41->regmap, CS35L41_SP_HIZ_CTRL,
> +				CS35L41_ASP_DOUT_HIZ_MASK,
> +				cs35l41->pdata.dout_hiz);

No error or warning on out of range?

> +static int cs35l41_component_probe(struct snd_soc_component *component)
> +{
> +	struct cs35l41_private *cs35l41 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	component->regmap = cs35l41->regmap;
> +
> +	return cs35l41_set_pdata(cs35l41);
> +}

Why wait until here to apply the configuration, why not just do it
immediately on the bus level probe?  I didn't notice anything that
needed the card, just the regmap.

> +static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
> +	{0x00000040,			0x00005555},
> +	{0x00000040,			0x0000AAAA},

Spaces around the { }.

> +
> +	do {
> +		if (timeout == 0) {
> +			dev_err(cs35l41->dev,
> +				"Timeout waiting for OTP_BOOT_DONE\n");
> +			ret = -EBUSY;
> +			goto err;
> +		}
> +		usleep_range(1000, 1100);
> +		regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS4, &int_status);
> +		timeout--;
> +	} while (!(int_status & CS35L41_OTP_BOOT_DONE));

It would be clearer to assign timeout at the top of the loop rather than
when declaring the variable so people don't have to search back and make
sure it was set.

> +	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL,
> +			cs35l41_irq, IRQF_ONESHOT | IRQF_SHARED | irq_pol,
> +			"cs35l41", cs35l41);
> +
> +	/* CS35L41 needs INT for PDN_DONE */
> +	if (ret != 0) {
> +		dev_err(cs35l41->dev, "Failed to request IRQ: %d\n", ret);
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	/* Set interrupt masks for critical errors */
> +	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1,
> +			CS35L41_INT1_MASK_DEFAULT);

Shouldn't this be configured prior to requesting interrupts or might
there be a race?

> +	switch (reg_revid) {
> +	case CS35L41_REVID_A0:
> +		ret = regmap_register_patch(cs35l41->regmap,
> +				cs35l41_reva0_errata_patch,
> +				ARRAY_SIZE(cs35l41_reva0_errata_patch));
> +		if (ret < 0) {
> +			dev_err(cs35l41->dev,
> +				"Failed to apply A0 errata patch %d\n", ret);
> +			goto err;
> +		}
> +		break;
> +	case CS35L41_REVID_B0:
> +		ret = regmap_register_patch(cs35l41->regmap,
> +				cs35l41_revb0_errata_patch,
> +				ARRAY_SIZE(cs35l41_revb0_errata_patch));

I'd also expect patching to be done prior to requesting interrupts so
the device is in a known good state first.  Perhaps it doesn't make any
difference but the patches are undocumented so...

--PpAOPzA3dXsRhoo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDjW5YACgkQJNaLcl1U
h9CZQAf/dQBKPUvBrtF0ee3F6wEy++Z9T80o6hgk4inQxcJpQAQ66yohoeOsDOPR
DstQLszhcEr1XWlBybHfcU8n4ZYw2Fhiqrc7x96kYWcpb4SE8efmETo8Q1pQwehD
NX2Ejkp/i2FQ2srk/usVZL2JE8R1WdDVlJWcOz7HtH5jRrxwx4RzyxVJlQQEoYzy
A+JUyBIPZ6fUAv4ynnfH5WdJudP7b5O+AUnxjn3fKlGx8Nc5T1bZfEuD07Qtujwa
ouBzgG1KtS29z6PvULeJtDp38Yb/D9x5aoSyHhViEmITkVFWfQsmJ04cVg5rhZOo
e13HC0n9cZUOM3KJOaXLpfCnU0ABoQ==
=DPHU
-----END PGP SIGNATURE-----

--PpAOPzA3dXsRhoo+--
