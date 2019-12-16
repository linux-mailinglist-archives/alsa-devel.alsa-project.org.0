Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565D5120890
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 15:25:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78AA826;
	Mon, 16 Dec 2019 15:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78AA826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576506304;
	bh=8lvc0PzouO18kOmcy8ZpqJaP1xr1GqGWhiHgsYcfOlw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCpXZ+AnbTMYDK3L4nk5kpWy0Z+WGyXidPRFjKYAmpKgjOShHE0Idly+Rq5mwOQZy
	 T0lsAl/BcAcgaX2aT+I7DdBexyynbelbD0u6XuY2jx/L39UnnMuNL5FklN1HidaTkx
	 +ltx4xUqEojMKyYePto89HXLgmzZZKLSe045v2GQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C50F80256;
	Mon, 16 Dec 2019 15:23:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 367F2F80255; Mon, 16 Dec 2019 15:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6C929F800AD
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 15:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C929F800AD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39B091FB;
 Mon, 16 Dec 2019 06:23:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC44E3F718;
 Mon, 16 Dec 2019 06:23:14 -0800 (PST)
Date: Mon, 16 Dec 2019 14:23:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Message-ID: <20191216142313.GD4161@sirena.org.uk>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-12-daniel@zonque.org>
X-Cookie: Backed up the system lately?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 pascal.huerst@gmail.com, lee.jones@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
	nodes
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
Content-Type: multipart/mixed; boundary="===============0068977458287235692=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0068977458287235692==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2019 at 07:35:11PM +0100, Daniel Mack wrote:

> +	/*
> +	 * Setting clock inversion is only supported globally for both DAIs,
> +	 * so we ignore the settings made for DAI1 here.
> +	 */
> +	if (index == 0) {
> +		switch (format & SND_SOC_DAIFMT_INV_MASK) {
> +		case SND_SOC_DAIFMT_NB_NF:

I dunno if it's a blocker but it'd feel nicer to try to verify that the
settings are the same and warn if not.

> +static int ad242x_set_dai_fmt_dai0(struct snd_soc_dai *codec_dai,
> +				   unsigned int format)
> +{
> +	return ad242x_set_dai_fmt(codec_dai, format, 0);
> +}
> +
> +static int ad242x_set_dai_fmt_dai1(struct snd_soc_dai *codec_dai,
> +				   unsigned int format)
> +{
> +	return ad242x_set_dai_fmt(codec_dai, format, 1);
> +}

You don't need separate ops, just look at dai->id.

> +module_platform_driver(ad242x_platform_driver);
> +
> +MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
> +MODULE_DESCRIPTION("AD242X ALSA SoC driver");
> +MODULE_LICENSE("GPL");

Should have a MODULE_ALIAS() as well for autoloading.

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl33k1AACgkQJNaLcl1U
h9CJzAf5AVSyR1/mSM1ETDWuCIYuCIEFlu7/ooDTySWL/oz8g/+17UrUPo4t74Kv
vEBYnAiDtdNss2zAjSK4TGyvVRqIH+PRdOpEyJcaGK23yLD8tr/MzD3iYvVxXnhP
4rd555BKIjpXedGoFoVUMsqYq6elyLawB42m2kVesOxlY2YxGw76dpcNJH061vjM
M8YttjOvZdbN4maecBVI6tq1gTttZ+ap+k/T3CqAEa6A701pg6GlQR0ZX/rsKl84
BTYGk9C2XDYoJrwMp6cPRr93AyxAf/pAzYqhju0Co1VxnvnDxk0r6gfSW4EYn18n
kIHoPy2cHMeADFhK7n4j0Sc1c79h4g==
=eeff
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--

--===============0068977458287235692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0068977458287235692==--
