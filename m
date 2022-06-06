Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EF53EEE0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19581B2D;
	Mon,  6 Jun 2022 21:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19581B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654545017;
	bh=UzryUnnGvZZBNEMB0odKe1O3TvXeLuFqBrHf32g9aVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adXXrmytzOR3GkZRCvwAakDN8LzSSfVuZS+JgDrsnLNVeje1nMou99Jg4qvyg0c7m
	 NJaBY1zooDQBh9DKT88GwBGGvND/doADaoRNr55mTbpgW+L8xpok+iflz+xxcs7gSp
	 KhAoVDn3RW9EB88plnAIdZmmgSUAkD0qFabdrrl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 493ABF80310;
	Mon,  6 Jun 2022 21:49:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78F0BF80116; Mon,  6 Jun 2022 21:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2934FF80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2934FF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iSyhAlsl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFCACB81B44;
 Mon,  6 Jun 2022 19:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC115C3411D;
 Mon,  6 Jun 2022 19:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654544952;
 bh=UzryUnnGvZZBNEMB0odKe1O3TvXeLuFqBrHf32g9aVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSyhAlslzDDLj/7+Ko7uPEdCPdRI4c8xh7YsepEmcyIlfyiKhprn2+f9X5Uqkymuv
 4tkQNb1dIa13VQQdvzszUg+0yNoXARS3zWuu5hq4Ak+Y5B21nhDSSlU991gfMTO144
 /MU9S1P/yQSnhBdRvcSuLFSaHDuzSF+ttkze0lVvkJX5YykMaNKl21+daYla1GWA9N
 9yhKNQSQpMSBiBhR7/I+00PZvgapPRk2hgHEJ2PHV3KOuTUj5ngjvx1kROjhoDwmw1
 jnZhZ7BP3uEkBiupsa6PUosb/egFxyIVpPk7SQqgh9o+Ry9lSeop6vKXQ4VDZETtv5
 25y1JxiHsQUUg==
Date: Mon, 6 Jun 2022 20:49:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 2/5] dt-bindings: sound: Add Apple Macs sound
 peripherals
Message-ID: <Yp5aMi0sSfBQzk0p@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-3-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vLLkHsME4UnMDWvc"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-3-povik+lin@cutebit.org>
X-Cookie: Have an adequate day.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--vLLkHsME4UnMDWvc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:07PM +0200, Martin Povi=C5=A1er wrote:

> +      dai-link@1 {
> +        reg =3D <1>;
> +        link-name =3D "Headphones Jack";

Incredibly trivial bikeshed but normally that'd be "Headphone Jack"
(singular).

--vLLkHsME4UnMDWvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeWjEACgkQJNaLcl1U
h9BZ3wgAhIlgRunaKB0X+XBqE2TxgOKqeJ9dsZt0OJULGSwYFsGmFVb+calG3r2T
TnKHqrx30urVJntDF1UmZu4m6Z31PMR5NXDvmMTy1DLb/LHyjOG/kAdRI1DW1zZm
xVQFXD4QgCsyB10o+UL+Xl8AfWrj7FqoGXGioG3nYMWmtqsldUI2FinUDZKLZ5ef
kqWVr17QjYvQSS/HbxlDfwQV4x+7JcMoVXn53oP21uOuYtg1peXr1ST50UpY+ixU
fSGC+tIq7h/zTiKoXcbB8kPyLxZrAHMW8d+KolWhZzfq0ff06SMb0nfS4t7vT8Vy
tbWwjbvUTkF7PRrrwCW6KCXI19BxWQ==
=9TYE
-----END PGP SIGNATURE-----

--vLLkHsME4UnMDWvc--
