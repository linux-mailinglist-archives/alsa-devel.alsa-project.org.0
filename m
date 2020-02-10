Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17E157CD6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 14:54:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB7B81677;
	Mon, 10 Feb 2020 14:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB7B81677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581342884;
	bh=WI9cCDqmFsSDaiTW6EmpQJYL4IoWpcFtnBHV7SMGb9k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HxraV2qug7rgr2FgRtiHWA102qLFCQqVwHIB5bm+J6VUZg+kixczOFxB0x/S4bxaP
	 Qa/oK0X1848ktPq99UDVJSaa+g+f4o4yZRndz04ss3LW0BGi5Rqq3f39eVIzf9FLhZ
	 UJwXYvHDQnJ22AqyWFm5C744Df0X29Gt8iNrHMKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF3C3F80118;
	Mon, 10 Feb 2020 14:53:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E2A8F80157; Mon, 10 Feb 2020 14:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 36622F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 14:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36622F800FD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F2091FB;
 Mon, 10 Feb 2020 05:52:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B77AB3F68E;
 Mon, 10 Feb 2020 05:52:53 -0800 (PST)
Date: Mon, 10 Feb 2020 13:52:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20200210135252.GK7685@sirena.org.uk>
References: <20200207194533.29967-1-dmurphy@ti.com>
 <20200207194533.29967-2-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200207194533.29967-2-dmurphy@ti.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: tlv320adcx140: Add the
 tlv320adcx140 codec driver family
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
Content-Type: multipart/mixed; boundary="===============7344399135009582131=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7344399135009582131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/rDaUNvWv5XYRSKj"
Content-Disposition: inline


--/rDaUNvWv5XYRSKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2020 at 01:45:33PM -0600, Dan Murphy wrote:

> +	/* interface format */
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		iface_reg1 |= ADCX140_I2S_MODE_BIT;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		iface_reg1 |= ADCX140_LEFT_JUST_BIT;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +	case SND_SOC_DAIFMT_DSP_B:
> +		break;

_DSP_A and _DSP_B are two different format so I'd expect the device to
be configured differently for them, or for only one to be supported.

> +static int adcx140_mute(struct snd_soc_dai *codec_dai, int mute)
> +{
> +	struct snd_soc_component *component = codec_dai->component;
> +	int config_reg;
> +	int mic_enable;
> +	int i;
> +
> +	/* There is not a single register to mute.  Each enabled path has to be
> +	 * muted individually.  Read which path is enabled and mute it.
> +	 */
> +	snd_soc_component_read(component, ADCX140_IN_CH_EN, &mic_enable);
> +	if (!mic_enable)
> +		return 0;

You could also just offer this control to userspace, it's not
*essential* to have this operation though it can help with glitching
during stream startup.

> +
> +	for (i = 0; i < ADCX140_MAX_CHANNELS; i++) {
> +		config_reg = ADCX140_CH8_CFG2 - (5 * i);
> +		if (!(mic_enable & BIT(i)))
> +			continue;
> +
> +		if (mute)
> +			snd_soc_component_write(component, config_reg, 0);
> +	}

How does the unmute work?

> +	internal_reg = device_property_present(adcx140->dev,
> +					       "ti,use-internal-areg");
> +
> +	if (internal_reg)
> +		sleep_cfg_val |= ADCX140_AREG_INTERNAL;

Does this actually need a specific property or could you support the
regulator API and then use regulator_get_optional() to figure out if an
external AVDD is attached?

> +static int adcx140_codec_probe(struct snd_soc_component *component)
> +{
> +	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
> +
> +	return adc5410_init(adcx140);
> +}

Does the separate init function buy us anything?

--/rDaUNvWv5XYRSKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BYDMACgkQJNaLcl1U
h9BUOAf+NPAlIw9NPESCRsZ+YSXEwkW2K1Sq//mlXmXxrrI2wHxmlwS0kuN+OL5G
+zlKtg/VOImhuklWWD2aP8Tu5/a2W0r6x4ms08xRFROy8crTbfcXob6Pt6r1l47S
ZOEHGz5/bB+XOab5k4u1nzj3e9KuMLoUy899bL84idLny9keFmWN1vvXgTX67fKB
UlmNc9bQZljHBju6UNZWJcZzKvQm2cnLSPxhebAihahWVUbbJytidXztB/rhGWLK
Mz+L7Cjk+F7S3hbGEpbRYYkRZ7utvSFQl4YgLbBQ4p9Slhd7RWc4pt+JnT/KNKnC
lOzRASGc8ls4NEUO6rRswGKP4b18Aw==
=b/Ku
-----END PGP SIGNATURE-----

--/rDaUNvWv5XYRSKj--

--===============7344399135009582131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7344399135009582131==--
