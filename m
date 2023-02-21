Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6069EA0C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 23:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CA684A;
	Tue, 21 Feb 2023 23:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CA684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677018261;
	bh=m4xd55FJZ2TFrfhomdp1xq42bgvOVIIPvxwzKIFHpqc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z5Sy2dBcKjyV/SQdb0BZNys/NV+5TmS1eJHbpaAv1DaVaGkSSRbfO5pUyrKbngKy+
	 vp3G4D2lpBRNkCa6e7n2m8VMV7RUw/S9s4GV/VxIRV/2PFq+t1VeGQWhDRNHWWzqfj
	 bwlY5wP2hqxBUEsQ7NdLLhIn7K5K1AilCS3+3GBM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D4F6F8025A;
	Tue, 21 Feb 2023 23:23:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7955CF80266; Tue, 21 Feb 2023 23:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34F6BF80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 23:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34F6BF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sCoMWGuc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 77518CE1BF3;
	Tue, 21 Feb 2023 22:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AF7C433EF;
	Tue, 21 Feb 2023 22:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677018196;
	bh=m4xd55FJZ2TFrfhomdp1xq42bgvOVIIPvxwzKIFHpqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCoMWGucPwXtiWdo75mO0tuuTUAqauh3L7tVCTsdGBJFuFB0dUV62jsLgSirb42GP
	 QLSVWSCbNXE7HRdneHZj73PltQIr4NxcpIEKre2V9us7O4YNdhnQorIfGIlOSATfBt
	 pins3t/rfECz9Pk+IACulJ7DhTEfwbWFa+HJAhQCNV92YzSRlchDaATmvQyK2wKslC
	 XBDrVpsgHPYxPsF9p8njDWhYA16Lu8YZY1sG/kgr6t6W6HC0dh6aLMPobyCtKJaa0W
	 DhO+vOO9SLFWl42jsr+KtF25bxQLjzH90vvyW4mJ4FP6IODXxd1zyttNxIF0UsUEFA
	 JpZyb1/BB97AA==
Date: Tue, 21 Feb 2023 22:23:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
Message-ID: <Y/VEUaOIE1mk1utt@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tOijhv7Qqz92bCVE"
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-5-clamor95@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: YCVSCHCU7WEJGMLVVB2EEAIP5SK7ZELT
X-Message-ID-Hash: YCVSCHCU7WEJGMLVVB2EEAIP5SK7ZELT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCVSCHCU7WEJGMLVVB2EEAIP5SK7ZELT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--tOijhv7Qqz92bCVE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:

> Add Realtek ALC5631/RT5631 codec support to the Tegra ASoC machine driver.
> The RT5631 codec is found on devices like ASUS Transformer TF201, TF700T
> and other Tegra-based Android tablets.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>

Your signoff should be last if you're the one sending this.

> +static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
> +{
> +	unsigned int mclk;
> +
> +	switch (srate) {
> +	case 64000:
> +	case 88200:
> +	case 96000:
> +		mclk =3D 128 * srate;
> +		break;
> +	default:
> +		mclk =3D 256 * srate;
> +		break;
> +	}
> +	/* FIXME: Codec only requires >=3D 3MHz if OSR=3D=3D0 */
> +	while (mclk < 6000000)
> +		mclk *=3D 2;

It feels like this is complicated enough and looks like the
clocking is flexible enough that it might be easier to just have
a table of values or otherwise enumerate standard rates, seeing
the code I feel like I need to worry about what happens if we
pick a clock rate over 6MHz (the loop could give a value over
that), and it's not clear why we have the switch statement rather
than just starting at a multiple of 128 and looping an extra time.

I suspect there's going to be no meaningful downside for having
the clock held at over 3MHz on a tablet form factor, the usual
issue would be power consumption but between the larger battery
size you tend to have on a tablet and the power draw of the
screen if that's on it's likely to be into the noise practially
speaking.

--tOijhv7Qqz92bCVE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1RFEACgkQJNaLcl1U
h9DpVAf+M2ffAYNVaX4PwMJKysdDwMn46T5Tf1y5pjJ3FoZjeN7IGuqSZ3iXo1WT
ms1bDTeUvHNIIUkUj90R9j5az1vTLboWFwsQRSQmkPkhkE/pD/R9skhgEh0Z0Kb0
zkXVEjEjtPddDwC8enKFqDqvNrcegZV9pOna2z21aG+Ao66HPQtayfuC8FblBS3m
2vFLIM5zMvuBgyeuSB++5pqcCZAdli4nDxijZT7+wlqesNVsjqDX+V0kClN3lfoK
nEpUH6u4MMmtcude37chUrPP0KKW/+h0dfgh3QG5C956xi8D9zo86q9q7B95MMPO
v4a40jcUysWb/dQcogit1e2we4NNYw==
=sbPL
-----END PGP SIGNATURE-----

--tOijhv7Qqz92bCVE--
