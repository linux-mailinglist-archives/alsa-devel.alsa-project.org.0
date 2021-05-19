Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27656388D47
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 13:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99751167E;
	Wed, 19 May 2021 13:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99751167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621425182;
	bh=LCwFHlTJz0AnhSIerE3Ypbcem+GyVUtPZIRox34DFCc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQjy2z6Phbk5n7btw3BtIDhHbc8jDf2DgYeKyuN91RslIFu1HGRIe0Ugem7M5pCeJ
	 RatJkmD5x6+sYgzM5a/0hSkxg3Xz6J0n+0YtXm0Y/Zkhse3Z4BTbhTAw3f54qRlx2W
	 0wqlbHBU9AshFHLye/+lXN2g9pJ4MOlyne93v8qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41993F8014C;
	Wed, 19 May 2021 13:51:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1C48F8016E; Wed, 19 May 2021 13:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3ADFF80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 13:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3ADFF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jvJA9bhD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2870F61004;
 Wed, 19 May 2021 11:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621425081;
 bh=LCwFHlTJz0AnhSIerE3Ypbcem+GyVUtPZIRox34DFCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvJA9bhD60fanAxFRRSCd5doEJf5pimls4dgs5HDoeW+zNLu05yisjNGd/1sM0Xoq
 FoCdexWd5aAmw3LqmQ55Cu977areu0jQNwm6ahpJb0OSTAZ3sQLRNWUGNiLc2jX/N0
 v6yIVx71ePnzFxSJFNEb0Szua5EWRwqhmFZUJNcKnyZFEcrfcFs6xx0YnGutWGNJAK
 eVB7NaDjZu9wHNrCk5t/0B8uERi8PZoBuEa3roq3qVMCgd0QlFCjP7COOL8ipvZMK2
 f7hgOGuJNiqPK/DOcxbBlrM+lqOlZz0ytNi+a/qp0dilVzkTwqheCiXoPxNiTmeXUW
 Hrq0PgBZRKUpw==
Date: Wed, 19 May 2021 12:50:36 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: wm8750: convert to the json-schema
Message-ID: <20210519115036.GB4224@sirena.org.uk>
References: <20210512205926.780-1-zajec5@gmail.com>
 <20210518185511.GF4358@sirena.org.uk>
 <edc9e00f-1074-8a9b-1666-ba4a0b9a08f6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <edc9e00f-1074-8a9b-1666-ba4a0b9a08f6@gmail.com>
X-Cookie: There's no time like the pleasant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:45:17PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:

> Oops, "ASoC: " prefix is quite unique, no many subsystems use any prefix
> before the "dt-bindings:". I didn't think of checking that, sorry.

It's also the sound: bit - it's not just that you got things a
surprising way round.

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCk+4sACgkQJNaLcl1U
h9AJjAf/arnLlf/QBgia7MxKUszY2GV6AlQuBaX3RFaxvBPFUhX3FsqF8m+9D4PM
VPsHUuIt9luyJsWpcJlvO3Mcf6jgpN5oGXrsaarWBOisHRqTOlKI5MNfYTKkIRDC
uyGtWyZgthH7hL/B7N7bb143vCslHTgdeKpaj28noyHpRKbbIBIjMfkEV1ncsyPK
yTeum7FEPhnUbKp5TCYDMP1yRdx3BiPeqmwHYXpw1k8WA3yvTpp6Yniu5gbCE4yK
RZhGjDQhR7p38ydRVdAyYeASHzPxUCu91Porj2xls2rd28Ajd16vXycQ14m1C0aJ
tmU0CNiNJuu+ymevujLUl7inomCTow==
=Inyw
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
