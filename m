Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8C4B0E70
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:30:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5DBC18B9;
	Thu, 10 Feb 2022 14:29:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5DBC18B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644499831;
	bh=1DwUq7RIYQm8udrJkhokXVG//5cUWIfeguf7stIQViI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL9Ed58CsxOaJIuJqbEgNIY40ZLXhTR2o45HrSlWxjvAtGQov6/pWcI40e57uRK4d
	 w3SXRd7C8O0xMTdu8Pv1V2nDQnM3wxNtiMuD3oygxQLW+H5n20MUuI+y50mmckgGT5
	 OYwVy1+Pimamb8pXmBbbg0jtIhI2IQ/mPTEe3FC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9703F80302;
	Thu, 10 Feb 2022 14:29:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05DEFF8028B; Thu, 10 Feb 2022 14:29:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93C35F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C35F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dDo2QnLy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69BD4B82542;
 Thu, 10 Feb 2022 13:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF278C004E1;
 Thu, 10 Feb 2022 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644499753;
 bh=1DwUq7RIYQm8udrJkhokXVG//5cUWIfeguf7stIQViI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dDo2QnLy1bBULtmMeho8GZaMVBdLDpKsgm/q4u9nLjcZlHVgORGWuFTGWOPQnEWDb
 WB9gHjP0J0OeM8dNb7DyaqZTd0eYsz+RKxzKtv5UjyvuaXO/2m2sC+bz3AvWU5AgGw
 Px4NU+72FlWT/Yu+ggJNhE+7AvzYi79WW31ROqo5kJXw/sUQ2wJG4SUxUJZ5yfblqf
 SXU8chOgWUPvNLVuFezHaoHKubLqKbjLKo3Sb4JMmQgWzh3M8XlHzKNE/239fEv3uG
 LPZYtYK5hXWetadjfwLDgSLr3G0Ih3LBFFkCHVSZtuajj46VdjCIcXHaeAnxRSati8
 cNByXr3eawcXw==
Date: Thu, 10 Feb 2022 13:29:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Apertis package maintainers <packagers@lists.apertis.org>
Subject: Re: [PATCH 1/2] ASoC: bindings: fsl-asoc-card: Add compatible for
 tlv320aic31xx codec
Message-ID: <YgUTImUs470jVdYs@sirena.org.uk>
References: <20220207164946.558862-1-packagers@lists.apertis.org>
 <YgUSEvMGMoSQYy5v@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YLFsHYkxWKuQwxsz"
Content-Disposition: inline
In-Reply-To: <YgUSEvMGMoSQYy5v@sirena.org.uk>
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


--YLFsHYkxWKuQwxsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 01:24:34PM +0000, Mark Brown wrote:
> On Mon, Feb 07, 2022 at 01:49:45PM -0300, Apertis package maintainers wro=
te:
> > From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> >=20
> > Commit 8c9b9cfb7724 ("ASoC: fsl-asoc-card: Support
> > fsl,imx-audio-tlv320aic31xx codec")' added support for tlv320aic31xx
> > codec to fsl-asoc-card, but missed the related device-tree compatible
> > string documentation. Fix this.
> >=20
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > ---
>=20
> This has a signoff from Ariel but the mail comes from something called
> "Apertis package maintainers" and I really can't tell if there's a good
> signoff chain here, please see Documentation/process/submitting-patches.r=
st
> for details on what this is and why it's important.  The submission
> really needs to come from an actual person who's providing a signoff.

=2E..and in fact the address for this group(?) isn't even deliverable :(

--YLFsHYkxWKuQwxsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIFEyIACgkQJNaLcl1U
h9B/Ywf9EqP7whzzNL2Uso8FORWO2d2z5HQhklyv9TumCpmhCGDlJ1ClJRt0/073
2sQ+e4rSTfp5pcTjFQeCCoZ7+2waeH90+mhzZnUvbn0S++x0vY2gRsqpNz6gpAZZ
b3qyxjUlisl61t9pxufe96Jluj2RDQVC274IUh2ia3CRZxWsExR08aG2k8sNRJkx
W6pg0t7U7pu16rMppTAHgtP4hwHc4xEaNuWl0mpu5UZSF4kCbaJHvOVUc9OdzXf4
zor1fVCrO1JENWj7KBcIWjiTmtc+o6SK1D4rvZrsFPaX6sXz6NYf9KjO9oYrHQQc
yX2SAurKvl6mCu5wdlKw0Yp9MrG0rA==
=9wIg
-----END PGP SIGNATURE-----

--YLFsHYkxWKuQwxsz--
