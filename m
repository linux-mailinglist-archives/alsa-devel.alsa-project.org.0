Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A070431971
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 14:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DDA91AAB;
	Mon, 18 Oct 2021 14:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DDA91AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634560787;
	bh=WlwTg1yw9IU67cIXcQRUw5IENTxjXIpyBwSrgAoG3LY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwq/0NjdEDn11kmmguqCC+7GuJJqoeGu+bJ6wE7q3ha4+PIvjC6rxVVfm+sSxs6Jz
	 xVj0LaKApWW7kZQTI/E7ARpCId9O0GYmr5xnz0B7ijbgu3REgoEwbLWOjmcMO5lzrV
	 RV2Q71SiBFrc0804M5YdnyYkUWHdYHYsS1KErJWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A83CF80217;
	Mon, 18 Oct 2021 14:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFCC9F80224; Mon, 18 Oct 2021 14:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3895AF801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 14:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3895AF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dSDLVK2N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D28AE60EE9;
 Mon, 18 Oct 2021 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634560701;
 bh=WlwTg1yw9IU67cIXcQRUw5IENTxjXIpyBwSrgAoG3LY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dSDLVK2Nfrp4O1GjyiCFeEiIJ5cFkO0aS00mjQ50A0mvXbkxTFyPJyPA14HNbKSWE
 a+5ERbiqah4Zlixb18lW+Z/dV9tmrKtxNCwowPgwCJA2OsH/22e2ekjv7MGkzB+hee
 5Cpcvj2ye7m9A85sDnbgxLH/PATaM9ZG2E+g7Bu212bgIdbyGpkrWMWb+xjPGv3htx
 XDsS72j+OJsCmz+CX6BdlX0Vr9+/F1jwQVrq7NXcHt8qSzdl9PDub7b8WifqoXuAf+
 Bx7GqfxFmic3DCKZWnxmETym12rWXcx5xigTH0CVHQf/D+MgtVeM9UyhEUFDtJujrb
 d5trEhXlGRvoA==
Date: Mon, 18 Oct 2021 13:38:18 +0100
From: Mark Brown <broonie@kernel.org>
To: George Song <george.song@maximintegrated.com>
Subject: Re: [v3 2/2] ASoC: max98520: add max98520 audio amplifier driver
Message-ID: <YW1quluaCzsUpET0@sirena.org.uk>
References: <20211018083554.5360-1-george.song@maximintegrated.com>
 <20211018083554.5360-2-george.song@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m3G3LtiB/A3jRHZR"
Content-Disposition: inline
In-Reply-To: <20211018083554.5360-2-george.song@maximintegrated.com>
X-Cookie: Here there be tygers.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org
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


--m3G3LtiB/A3jRHZR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 05:35:54PM +0900, George Song wrote:

> +	case SND_SOC_DAPM_POST_PMD:
> +		dev_dbg(component->dev, " AMP OFF\n");
> +
> +		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 0);
> +		usleep_range(30000, 31000);
> +		max98520->tdm_mode = false;
> +		break;

Why would stopping the DAC put us out of TDM mode?  Not that I can see
anything which ever sets tdm_mode to anything other than false or checks
the value...

> +static const struct snd_soc_dapm_widget max98520_dapm_widgets[] = {
> +	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
> +			   MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,
> +	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),

I can't help think that the global enable ought to be a _SUPPLY widget,
it would get enabled before the DAC rather than after it but it's not
clear that the ordering is critical here.

> +static DECLARE_TLV_DB_SCALE(max98520_digital_tlv, -6300, 50, 1);
> +static const DECLARE_TLV_DB_RANGE(max98520_spk_tlv,
> +	0, 5, TLV_DB_SCALE_ITEM(600, 300, 0),
> +);

Why is _digital_tlv not const?  It's also a bit weird that _spk_tlv is a
range with one entry not a scale.

> +	count = 0;
> +	while (count < 3) {
> +		usleep_range(10000, 11000);
> +		/* Software Reset Verification */
> +		ret = regmap_read(max98520->regmap, MAX98520_R21FF_REVISION_ID, &reg);
> +		if (!ret) {
> +			dev_info(dev, "Reset completed (retry:%d)\n", count);
> +			return;
> +		}
> +		count++;

Does this really need to be logged?

> +	/* Software Reset */
> +	max98520_reset(max98520, component->dev);
> +	usleep_range(30000, 31000);

Shouldn't that delay be in the reset routine?  Perhaps between the
attempts to read the ID register?

> +	/* L/R mix configuration */
> +	regmap_write(max98520->regmap, MAX98520_R2043_PCM_RX_SRC1, 0x2);
> +
> +	regmap_write(max98520->regmap, MAX98520_R2044_PCM_RX_SRC2, 0x10);

These should be exposed to the user, not hard coded - different systems
may need different configurations.

> +	/* Disable Speaker Safe Mode */
> +	regmap_update_bits(max98520->regmap,
> +			   MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);

This seems like something that should be left as is by default given the
name (or forced on if it were disabled by default)?

> +	/* Hard coded values for the experiments */
> +	regmap_write(max98520->regmap, MAX98520_R21FF_REVISION_ID, 0x54);
> +	regmap_write(max98520->regmap, MAX98520_R21FF_REVISION_ID, 0x4d);
> +	regmap_write(max98520->regmap, MAX98520_R2161_BOOST_TM1, 0x2);
> +	regmap_write(max98520->regmap, MAX98520_R2095_AMP_CFG, 0xc8);

This doesn't seem suitable for upstream.

> +	/* Power on device */
> +	if (gpio_is_valid(max98520->reset_gpio)) {
> +		ret = devm_gpio_request(&i2c->dev, max98520->reset_gpio,
> +					"MAX98520_RESET");

You should use the gpiod APIs for new code, not the legacy GPIO
interface.  This GPIO wasn't mentioned in the DT bindings but should
have been described there.

> +		if (ret) {
> +			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
> +				__func__, max98520->reset_gpio);
> +			return -EINVAL;
> +		}
> +		gpio_direction_output(max98520->reset_gpio, 0);
> +		msleep(50);
> +		gpio_direction_output(max98520->reset_gpio, 1);
> +		msleep(20);
> +	}

Shouldn't the disable/enable of the reset GPIO be in the reset function?

--m3G3LtiB/A3jRHZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFtarkACgkQJNaLcl1U
h9BT4gf/QR6w7LabHCZNodaVu3kffkYWlvtTouzKSwvEEr3Zt4qnTKEUfNM+KIN9
uP6PejCluvtRppGy0m+nXmeGh8VRrwo5bGFY5I4w2uYFcroBttkdinSpzjbqxYrJ
9pMBpB82b/0HdDxNBaDEmuKCiRuaYksr/Cc/ck/Mb6VWYQMm/4OC9L5rxfPKG92z
VfuvGSnNmlTP0nUCJRY+ZP7OxXG5iDqg3TYheJ+VgBEn1AX2g6XDVMbMERMf/v2Q
kyHkQsibQNeOhXgSncGqVBRgoAVq7F5NPyVw6DRGSLkl4klibmfdaW0EmJvtkIfc
ZrlPXVbufHz/Npk+10ubvRdiu3IYdQ==
=h8hz
-----END PGP SIGNATURE-----

--m3G3LtiB/A3jRHZR--
