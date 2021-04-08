Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 803523585F1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 16:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2F91661;
	Thu,  8 Apr 2021 16:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2F91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617890892;
	bh=gL5M1NUKW++lMkd03myDPYCxRlq0ygNvBL6aJ3gYmiU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpfETlgTxYxhvbiCvsoXIwiCx23FDjyxZq1ym7jYStDvpx/x4MRbBS6LTFR2It69L
	 gVoA1F9fbh1kWuzgQhuIeK1h0/5ms/6g0yUgnG/q4nayjnh7HW3Hyk/OAymQ9k4g29
	 nWFv+4plTVIBeVu+m9aNalhuU7VGBCBhRC1zndCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D0CBF80246;
	Thu,  8 Apr 2021 16:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52BF3F8020B; Thu,  8 Apr 2021 16:06:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D5EF800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 16:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D5EF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XvPaUDRX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D3536102A;
 Thu,  8 Apr 2021 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617890790;
 bh=gL5M1NUKW++lMkd03myDPYCxRlq0ygNvBL6aJ3gYmiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XvPaUDRXsh9Kimmi5JbHDrZVpKG8gLliYgjLE2LwK/IhCi6Vz4OxCL9pl6/irLK+X
 e6QAxXutUwyh079AvnwrjIWbV2tpg8pG/+mA6Y1qaCYvC8AsRt+M5XwZXhNabuZTSU
 zmsHL7rVAi8l+OS/fAwYJGtOBMUHV8cvrOeeqoyofF6oCQtNP6MCKBoB5BWMR5e6ZI
 Cw0Mu3ujM/oo5U+pU5eCJRVgzAudnfudeDcfga1YYxidEHNpP1D+Ite7MnG+1t4SeS
 +dpjF9KBPtL2EKbSO2gGowyhRvLNDzs4kLSuHwWc524J9OXfInswDL4xjUcH4SD3Qx
 jojVA4astESvQ==
Date: Thu, 8 Apr 2021 15:06:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH v2] ASoC: codecs: tlv320aic3x: add AIC3106
Message-ID: <20210408140612.GI4516@sirena.org.uk>
References: <20210408135908.125667-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nEsDIrWrg+hrB7l1"
Content-Disposition: inline
In-Reply-To: <20210408135908.125667-1-jiri.prchal@aksignal.cz>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--nEsDIrWrg+hrB7l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 03:59:08PM +0200, Jiri Prchal wrote:
> In DT binding is mentioned that this driver is compatible with 3106.
> So added compatibility string and model number.
>=20
> -v2: Also added in switches "case AIC3X_MODEL_3106:" to have right widget=
s etc.

As covered in submitting-patches.rst inter version changelogs should
come after the ---.

--nEsDIrWrg+hrB7l1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBvDdMACgkQJNaLcl1U
h9DnvQf9HLUJEC03MBa7Xdoluji0kTtjpPkU3x38ryJK7EXDKktkX9ZaPR/5Un4/
oKhNO/sxzQ19FzoVVl7sl2fdl7kJNWjuwQm8EfI+F7kddnsPK04QTOR+JoHn6kLW
nRUAtzqwMQ97wyjngEoDzx+FVvYJ/Gzrr2cMFfktFTJ9uD6z9jWH+f17SYEwQufD
yobLbE1RRI+Xx1E8WJ+L+57S5T10NQZMwkra7D3fppwQkIn2TIyvXvs5bdDhKURl
yW2kR5uUeHvzl5Frw4FQQN0RZGZp5pbiOWO5PC4eONnC/6ZN+ZxXtVVtT73NBv6U
qD5xJHRvTUF15Bz+AR11p8r8WgWBCw==
=1Io1
-----END PGP SIGNATURE-----

--nEsDIrWrg+hrB7l1--
