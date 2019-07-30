Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4B7ABC2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 17:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E6017AE;
	Tue, 30 Jul 2019 16:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E6017AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564498837;
	bh=uM8Td+QwfBj9COI5lwK4uNaeCynx4s4utUWmh4KqBUA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sN2utppS3LqWUeebdPNUvfkFSSZwo8qTmuB5h2No9xZ1mkFohrR4RXclgoBB3PTGA
	 lYdAGJhf6zP35ZnjdRn59ZQS10ye9Jzjk+mW+90p7gjKRdnTzwWgQ/6bAZzQ14/FS4
	 CLaQ/TXX6KlGn8xB+6z/Mx5iBMt5RXN1f8Ptyc/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F963F804CC;
	Tue, 30 Jul 2019 16:58:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87228F804CA; Tue, 30 Jul 2019 16:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9B2F800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9B2F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sUh6HbsL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q2mZoui6udBRuKFOD8sPcNVwLKdo8WonOPR0Qr0qLl4=; b=sUh6HbsLaMglxXUyFaT4PAHWh
 vaWqy21YTyot3IWcSwMCKn4FZtxyh7WK34XkfZYzHfhF+xUbR38l615/+14u5hWOAzzOFDaC6FJgP
 ffnYJkCqITJOnP9Xm1a++tPWjMkes1yrONBiFp3GY3OHwl3T21WNi7+xsNfLz0gdwI90A=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsTaP-0007nU-8e; Tue, 30 Jul 2019 14:58:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 540752742CB5; Tue, 30 Jul 2019 15:58:44 +0100 (BST)
Date: Tue, 30 Jul 2019 15:58:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730145844.GI4264@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-3-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190730120937.16271-3-thomas.preston@codethink.co.uk>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Nate Case <ncase@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Patrick Glaser <pglaser@tesla.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Add codec driver for ST
	TDA7802
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
Content-Type: multipart/mixed; boundary="===============5622605493081947641=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5622605493081947641==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="poJSiGMzRSvrLGLs"
Content-Disposition: inline


--poJSiGMzRSvrLGLs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 01:09:36PM +0100, Thomas Preston wrote:

> index 000000000000..0f82a88bc1a4
> --- /dev/null
> +++ b/sound/soc/codecs/tda7802.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * tda7802.c  --  codec driver for ST TDA7802

Please make the entire comment a C++ one so this looks intentional.

> +static int tda7802_digital_mute(struct snd_soc_dai *dai, int mute)
> +{
> +	const u8 mute_disabled = mute ? 0 : IB2_DIGITAL_MUTE_DISABLED;

Please write normal conditional statements to make the code easier to
read.

> +	case SND_SOC_BIAS_STANDBY:
> +		err = regulator_enable(tda7802->enable_reg);
> +		if (err < 0) {
> +			dev_err(component->dev, "Could not enable.\n");
> +			return err;
> +		}
> +		dev_dbg(component->dev, "Regulator enabled\n");
> +		msleep(ENABLE_DELAY_MS);

Is this delay needed by the device or is it for the regulator to ramp?
If it's for the regulator to ramp then the regulator should be doing it.

> +	case SND_SOC_BIAS_OFF:
> +		regcache_mark_dirty(component->regmap);

If the regulator is going off you should really be marking the device as
cache only.

> +		err = regulator_disable(tda7802->enable_reg);
> +		if (err < 0)
> +			dev_err(component->dev, "Could not disable.\n");

Any non-zero value from regulator_disable() is an error, there's similar
error checking issues in other places.

> +static const struct snd_kcontrol_new tda7802_snd_controls[] = {
> +	SOC_SINGLE("Channel 4 Tristate", TDA7802_IB0, 7, 1, 0),
> +	SOC_SINGLE("Channel 3 Tristate", TDA7802_IB0, 6, 1, 0),
> +	SOC_SINGLE("Channel 2 Tristate", TDA7802_IB0, 5, 1, 0),
> +	SOC_SINGLE("Channel 1 Tristate", TDA7802_IB0, 4, 1, 0),

These look like simple on/off switches so should have Switch at the end
of the control name.  It's also not clear to me why this is exported to
userspace - why would this change at runtime and won't any changes need
to be coordinated with whatever else is connected to the signal?

> +	SOC_ENUM("Mute time", mute_time),
> +	SOC_SINGLE("Unmute channels 1 & 3", TDA7802_IB2, 4, 1, 0),
> +	SOC_SINGLE("Unmute channels 2 & 4", TDA7802_IB2, 3, 1, 0),

These are also Switch controls.  There are *lots* of problems with
control names, see control-names.rst.

> +static const struct snd_soc_component_driver tda7802_component_driver = {
> +	.set_bias_level = tda7802_set_bias_level,
> +	.idle_bias_on = 1,

Any reason to keep the device powered up?  It looks like the power on
process is just powering things up and writing the register cache out
and there's not that many registers so the delay is trivial.

> +	tda7802->enable_reg = devm_regulator_get(dev, "enable");
> +	if (IS_ERR(tda7802->enable_reg)) {
> +		dev_err(dev, "Failed to get enable regulator\n");

It's better to print error codes if you have them and are printing a
diagnostic so people have more to go on when debugging problems.

--poJSiGMzRSvrLGLs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AWyMACgkQJNaLcl1U
h9CSRAf+JnRHblFvE8wz05/KmaqsoJ72DsJH6tOksd0/ifd52UjtRhoB3jIhVaR2
lJtx2+K9jHM8Q/tEBDNGXlzFt7MoUcvfgHfvAZ0Mfbkfvoox60KTJnh2C1B+Yr7i
TIVNSQJSN+NtdtSYs2BaFkk/Zrj7Q9kDj7BHHOBeK7fDkq8PTRdLHU1YjB+HlrTT
nRXLv1mXRa1cI+caoQRIXcQEOmW+VLlMasEFiSNS/0I3UtHgn2UHezS3Z+MHUJ4F
TOmV2MyA/S4wW70Cus6iZs7BO0aCYLQFJmFgtd0t+C3nMKvSILwBWidIzK9WYuc6
CeQAgukY5VCt+NmFvl4l2irCODm7Bg==
=Gl9u
-----END PGP SIGNATURE-----

--poJSiGMzRSvrLGLs--

--===============5622605493081947641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5622605493081947641==--
