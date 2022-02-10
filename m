Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6744B0E5C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640C917C5;
	Thu, 10 Feb 2022 14:25:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640C917C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644499562;
	bh=ViynvLIQDsJVAJBLbYN5w/IOJ3P4Uxv4v6juOv+xZyk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dF1lI1iuOFnpd2k4VGHdS1wlsFMVfbMS859cDwfKGGvIPTjgfjpxPnSv0lcljt4t4
	 uBlF44Xsf3J5nnlEcr1OfOD+m04/5Hrquy1nykNx9lLAfBpGlvphNW+g/a8T4zDfNx
	 9giGqSyeuKC6HSfr0TCvqhg6JVn6+CRa5F7akUJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 591BFF80302;
	Thu, 10 Feb 2022 14:24:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C94F6F8028B; Thu, 10 Feb 2022 14:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B305DF800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B305DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gItkCPtK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81DA860F2A;
 Thu, 10 Feb 2022 13:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97DEC004E1;
 Thu, 10 Feb 2022 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644499481;
 bh=ViynvLIQDsJVAJBLbYN5w/IOJ3P4Uxv4v6juOv+xZyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gItkCPtKoy6GdMXg82CIa87ENm4a3P3P9M+aF0xm3hfzRif0qZPfQgr+UnNMZL/Ds
 KAYO/5+G2nfRuMg44tsmx8PYtt2PO5xWuCiuJEwGvj+W4PO9jAt2Kn2oG8B026iKpr
 pkQfi/N8iQgdy9vsOwLgj/ljjroVLCvUCPJA6tJ+HuvjHhGMPBj1WZCPm5M/rcboiS
 Y0NR/iF09U+VYu4gj5OoD9Tkj9YYZ/14obS7bOXYXxYKAiEx7vODQIwKXAO+LunibS
 08Y7YOtWxrrBoD5YDKwHLYy5H42R3VcZxKa5ThCJWKC0ZH0eblm/nx/5hrjrv4SAiu
 lTh2xd9mmXKyQ==
Date: Thu, 10 Feb 2022 13:24:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Apertis package maintainers <packagers@lists.apertis.org>
Subject: Re: [PATCH 1/2] ASoC: bindings: fsl-asoc-card: Add compatible for
 tlv320aic31xx codec
Message-ID: <YgUSEvMGMoSQYy5v@sirena.org.uk>
References: <20220207164946.558862-1-packagers@lists.apertis.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CYrnMS08Bmr4w452"
Content-Disposition: inline
In-Reply-To: <20220207164946.558862-1-packagers@lists.apertis.org>
X-Cookie: Only God can make random selections.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ariel.dalessandro@collabora.com, krzysztof.kozlowski@canonical.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, michael@amarulasolutions.com, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--CYrnMS08Bmr4w452
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 01:49:45PM -0300, Apertis package maintainers wrote:
> From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>=20
> Commit 8c9b9cfb7724 ("ASoC: fsl-asoc-card: Support
> fsl,imx-audio-tlv320aic31xx codec")' added support for tlv320aic31xx
> codec to fsl-asoc-card, but missed the related device-tree compatible
> string documentation. Fix this.
>=20
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---

This has a signoff from Ariel but the mail comes from something called
"Apertis package maintainers" and I really can't tell if there's a good
signoff chain here, please see Documentation/process/submitting-patches.rst
for details on what this is and why it's important.  The submission
really needs to come from an actual person who's providing a signoff.

--CYrnMS08Bmr4w452
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIFEhEACgkQJNaLcl1U
h9DDqgf8CJDwEojZnDvk8O6VbLMqNsI7vZnNWIite24PPFflMdCzOcl2IVhXN4T5
apANt9Yr2O8JzrVxlcFO2rfi0cRDtZoF7Vx/jnpLuVm9jlsLmO+K+HlHUZBUL2XZ
YUyCW4rigVG6DEoecWrb5Qn6aEqiJ1LAg6G8MLXo9cxe1e2qLZoMVQqcxrbsuFrv
yo0cAeBtxUqdShl5BZPi6kdT46fHEXMyosHIDNjpN+82h89Bi9ZwHety4rUYGRA9
civSqSx4+uVuCih0WZJWUNc2U2Mu0RVWjX6HXMrbL3WZxEXNh1nJpv8YIp4jbush
8DxcuUQz2QS9oyXliknsdIJdLIkCsg==
=8Brv
-----END PGP SIGNATURE-----

--CYrnMS08Bmr4w452--
