Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE251BF26
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 14:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B15C17E9;
	Thu,  5 May 2022 14:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B15C17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651753227;
	bh=XIEIo8vB6+bdwynrUci6u8jhVuAbLP0G/E6z0wFUGvw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCNEPBa6pKus6MACCsMltVqzVAORfUPpBcSoR/Dfiyzc3CNeowMlR67AgG07EKzqj
	 XlWexkKdZ0xwSmEEtpv1A8iIQO4UJnSfTOO6ncOvXKUC4NoSg/Up8dusM1+QY/jo0e
	 GhwLECr449jG7+r+Oo7PInSBIe9XBpNu6Fc7fy8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B00EF800BF;
	Thu,  5 May 2022 14:19:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D620AF8016B; Thu,  5 May 2022 14:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DA84F800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 14:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA84F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QYNULHU7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DF4861D94;
 Thu,  5 May 2022 12:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6C6C385A4;
 Thu,  5 May 2022 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651753153;
 bh=XIEIo8vB6+bdwynrUci6u8jhVuAbLP0G/E6z0wFUGvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QYNULHU7SgtHwYK+OIty9bp/HYvtDJ+ZysnctLCnmhRdpygjnsd4HTKqL2ik4D7mw
 /KfIaWWZGZy3MKHdPXpOOMC7XF+s0Ri1FkhZOqGFtv6Yw0Cw+hv0nDaw/B9ATxH5pD
 29q55fwdhBnLrIHzsqIwDQHT6uATvmv3UXGK0O0HSjpeH1Vb2l8uGPXvJq3UI9zu25
 Zsokqu5L/YoixW3RJkvZ2eBCO5ezI8bMnmyLbpBYDgujOGmo+HGbdZXrOOQLlWdflu
 +SCHR12MwPH1iVjGNB1Zbby1zfbxtSo7M8UIAWv7nLryy54jm/QLaMsv5NYNICUlzE
 xbWpJUk/Oeasw==
Date: Thu, 5 May 2022 13:19:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/3] ASoC: cs42l42: Move CS42L42 register descriptions
 to general include
Message-ID: <YnPAvXKWtQsF2PG9@sirena.org.uk>
References: <20220504161236.2490532-1-sbinding@opensource.cirrus.com>
 <20220504161236.2490532-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="A49oNdcvS3T/SemI"
Content-Disposition: inline
In-Reply-To: <20220504161236.2490532-2-sbinding@opensource.cirrus.com>
X-Cookie: Real programs don't eat cache.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>
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


--A49oNdcvS3T/SemI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 05:12:34PM +0100, Stefan Binding wrote:
> This is to allow the hda driver to have access to the register names,
> for improved maintainability.
> Also ensure new header is aligned to 100 columns.
>=20
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  include/sound/cs42l42.h    | 810 ++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/cs42l42.h | 826 +------------------------------------
>  2 files changed, 812 insertions(+), 824 deletions(-)
>  create mode 100644 include/sound/cs42l42.h

You should use git format-patch -M for things like this, it makes the
diff more legible though in this case the fact that you've mixed content
changes in with the rename will not help - those are separate changes
and it's hard to verify things as they are.  Still, seems to be OK

Acked-by: Mark Brown <broonie@kernel.org>

--A49oNdcvS3T/SemI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJzwLwACgkQJNaLcl1U
h9BkLAf+OrsVZZEPmUrcKrQLRqlrVd/1go4OcsbERWqbpsQ2yNYSvmqoIhBiQzaD
66NmRTKs/bPVqTpHcoGJwRYojKjs82/47E8ouFV13AhAsFyYvzuHqrPtNr3EO4RV
zBaWwQ9uwjolqJ/FaPOe5oUyDByhkwAWLXyUK5E9jBv9X/7fgyt/B4Xd90PB9xS4
r+i3HoHL/OTWM8XTyOrMMCQj+vQYtGaWbSES9D2UiK97b4gIUtV2LxmX1s0Ab1+T
mBAZnHxUnHxdc4XkWEJXSLlcqPu4NUd2UzS46SsqQ8efk9pqTAlaj9ztLqOtH+tA
XGHI3MjAAcZ84SgKNbfHqGnJNPDgMw==
=CS0+
-----END PGP SIGNATURE-----

--A49oNdcvS3T/SemI--
