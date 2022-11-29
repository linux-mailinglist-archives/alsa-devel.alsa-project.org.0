Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3763C516
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 17:25:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140B61666;
	Tue, 29 Nov 2022 17:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140B61666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669739151;
	bh=dLQEflsUvo5LEl0AlQija2iFki6kDQNQhHT+jFHOjZg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIWxgeKfPHMlonNHmbzpfX0GhPzcqK+e0TkIbEwtU87vbm12vZlzW+pbMvaQjFA2T
	 ztVODUPOfFXD8nYS8ANpnfgD7jCYHRTAhHdAfKhFv0OVPzSwu/CEE8Zcggy5+Jo0tT
	 osiM0aSBHmTz5W2xES1YN9I0/gPpyspGr3At90so=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA0A3F80212;
	Tue, 29 Nov 2022 17:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE400F801F7; Tue, 29 Nov 2022 17:24:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B544AF800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 17:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B544AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mAzRk/Q8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5CB0617E4;
 Tue, 29 Nov 2022 16:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B065CC433C1;
 Tue, 29 Nov 2022 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669739085;
 bh=dLQEflsUvo5LEl0AlQija2iFki6kDQNQhHT+jFHOjZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAzRk/Q8pYpzFtK9hRITswWF1hyIIU/Jyo2X9gtbPQyIlttSbV5WrjFoMqw4ctw+l
 OwrykBDl6X5DZsscjBeFmgW7qCx6jrUd+wLzSekwNJA1UhAi7wqjJswV9qtF3p2XSF
 QV+DH+20wNX4ubkQqcJDO+lj3J3Hlxra7P049ydkj9lYNkjUFcHS/Q/MfhXmv7+qQh
 Dy8kUcpcxrjDTFt1H5mgduXeB+PNw1oFWC2EJGZbWlJzOJAaNb3Rh/+GzbXJx42moy
 Ag645LGOMsuXwZv23ir3bKJ+oU2D/5J/Qe5RRZaFiJfBO3ISfAKO73+UmcR3h6nC68
 wyAX5U4FO+2Kg==
Date: Tue, 29 Nov 2022 16:24:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 10/11] ASoC: Intel: avs: rt5682: Add define for codec DAI
 name
Message-ID: <Y4YySIFSZB5/NfYh@sirena.org.uk>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
 <20221125184032.2565979-11-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PtDy2VbqywO78IBz"
Content-Disposition: inline
In-Reply-To: <20221125184032.2565979-11-cezary.rojewski@intel.com>
X-Cookie: I invented skydiving in 1989!
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--PtDy2VbqywO78IBz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 07:40:31PM +0100, Cezary Rojewski wrote:
> From: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
>=20
> Following commits will make use of it to find codec DAI, define it
> first.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/intel/avs/boards/rt5682.c: In function =E2=80=
=98avs_create_dai_link=E2=80=99:
/build/stage/linux/sound/soc/intel/avs/boards/rt5682.c:198:20: error: =E2=
=80=98avs_rt5682_codec_exit=E2=80=99 undeclared (first use in this function=
); did you mean =E2=80=98avs_rt5682_codec_init=E2=80=99?
  198 |         dl->exit =3D avs_rt5682_codec_exit;
      |                    ^~~~~~~~~~~~~~~~~~~~~
      |                    avs_rt5682_codec_init

and looks out of place in this commit, it at least deserves calling out
in the commit log?

--PtDy2VbqywO78IBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGMkcACgkQJNaLcl1U
h9Ar+Af/b8YAFKuu5pB9PReLKVnKxBirf4iZjlUbwh5Q/Oi39ALHLtBy4ZyMAVUI
kpwPAeQfTZwFvhwY632B/RyNbM0mvaMhsy+qDmHO6S97nac08N8OlETxR0YSazs/
qTE8xsUZnKFbuoGAfO7nSlmTXpzjo+TQBBtT4CeLcT8ug48iFIjaneB9QRdAOLk0
xnLc/0KjR+mORNEmJw2UsRRFgiANK/tq04wZXiTj1eUbj4p0vd1sJm2DnY7NVYQ9
46pZSKva9kMOj8fg5isO3hnfAhY5x1bmtXe6OYK1L1prkqyKWYphp29Nv9/ptUsl
3PR3CyzZ7doi9kMcIQ+XLHRGJ6nhNg==
=XBPj
-----END PGP SIGNATURE-----

--PtDy2VbqywO78IBz--
