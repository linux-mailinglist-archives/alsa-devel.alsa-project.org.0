Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099EE1AC19B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 14:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 938B61663;
	Thu, 16 Apr 2020 14:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 938B61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587041071;
	bh=umyc9davKjGqXHYPYEvThedj9clicVOmBqruhPJYEFg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=baiHZ2d8Jo4sU1TJqJejuTuC1GHXkEjDrdP8U9LNek4CYoJ5wrKIfr7mSBch68lpK
	 E/9UUeid75u805BnCQMerl8l+zk6QHeg0Px6+QuWm16N9TnOLUJSZCz0eupGwoYs/A
	 vCM1bAuUhrEWn0bIs0aXYQjE9LJUECWC4duzq7Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE8A7F8013D;
	Thu, 16 Apr 2020 14:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8E81F8014E; Thu, 16 Apr 2020 14:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69758F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 14:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69758F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zp7ebm6D"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49352217D8;
 Thu, 16 Apr 2020 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587040962;
 bh=umyc9davKjGqXHYPYEvThedj9clicVOmBqruhPJYEFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zp7ebm6DopU7sArZWdGxQggJE37jsvDiwSqQhp2ZslVXLlsAtZP9PFkv7rVHZcf6p
 K79sqKU/ej7aOzUyBp6HI0SOB71YVYluma2yTvrzfsOxWKMwUrigfDB21UNHHCqQAl
 m1nMjTZ29M+hj/kIKx/HGl5MNrPVPeYUMrecer6U=
Date: Thu, 16 Apr 2020 13:42:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: Add initial ZL38060 driver
Message-ID: <20200416124239.GH5354@sirena.org.uk>
References: <20200416001414.25746-1-TheSven73@gmail.com>
 <20200416001414.25746-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l06SQqiZYCi8rTKz"
Content-Disposition: inline
In-Reply-To: <20200416001414.25746-2-TheSven73@gmail.com>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>
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


--l06SQqiZYCi8rTKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 08:14:14PM -0400, Sven Van Asbroeck wrote:

> +++ b/sound/soc/codecs/zl38060.c
> @@ -0,0 +1,643 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Codec driver for Microsemi ZL38060 Connected Home Audio Processor.
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +			err = zl38_fw_send_data(regmap, addr, rec->data, len);
> +		} else if (len == 4) {
> +			/* execution address ihex record */
> +			err = zl38_fw_send_xaddr(regmap, rec->data);
> +		} else
> +			err = -EINVAL;
> +		if (err)

If any part of an if/else has { } then all of them should.

> +skip_setup:
> +	if (priv->amp_en_gpio && tx) {
> +		/* enable the external amplifier before playback starts */
> +		gpiod_set_value_cansleep(priv->amp_en_gpio, 1);
> +		if (priv->amp_startup_delay_ms)
> +			msleep(priv->amp_startup_delay_ms);
> +	}

This external amplifier support shouldn't be here, if there's other
devices in the system then they will have their own drivers and the
machine driver will take care of linking things together.

> +	/* take chip out of reset, if a reset gpio is provided */
> +	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset_gpio))
> +		return PTR_ERR(reset_gpio);
> +	if (reset_gpio) {
> +		/* according to the datasheet, chip needs 3ms for its digital
> +		 * section to become stable.
> +		 */
> +		usleep_range(3000, 10000);
> +	}

It would be better to explicitly put the chip into reset and then bring
it out of reset if there's a GPIO, that way the chip is in a known
state.

> +	priv->regmap = devm_regmap_init(dev, &zl38_regmap_bus, spi,
> +					&zl38_regmap_conf);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);

devm_regmap_init_spi()

> +	if (device_property_present(dev, "mscc,load-firmware")) {
> +		err = zl38_load_firmware(dev, priv->regmap);
> +		if (err)
> +			return err;
> +	}

I'm assuming this is for the case where the device has a flash attached
to the master SPI port I can see described on the web site and can boot
off it - if that's the case I think it'd be clearer for the DT to
explicitly say that rather than this indirected property.

--l06SQqiZYCi8rTKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YUr8ACgkQJNaLcl1U
h9ABcgf/Tj/IGLfLFKTvEn5EJsyFi3tGt5Xy/ZQ29ZIbyGZC+8Gj/85vqttsDvSg
zP2RRJg+LiI2SiuvcT0tXKqZiDJxYTdFWHtfNtQa27h5WWeQUsaaRXBAvhqsO7ST
dkwkYy4HrPqUgCS3C1rZTeWIQpW/T4YvOoWxFdfnlvx71gWeTH+i3KFo6hL3XaxK
meKVm+++KWEaj1Xs+XXyN4mSM3qFOkX0zEvuoGa70UntYXKLMiXKL4F2mXJ0alg9
odPSEnzCtSfguo1tQuoh2h1/zN4kHJ93hJ3i2VciLegnOEom4FOBG+TuNnY6fLfp
Kw/npw1Cv0onjL4GrMLF6DBBC4PtCw==
=0cFL
-----END PGP SIGNATURE-----

--l06SQqiZYCi8rTKz--
