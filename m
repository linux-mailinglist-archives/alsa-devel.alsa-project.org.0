Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A95B02CD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 13:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 066AB1660;
	Wed,  7 Sep 2022 13:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 066AB1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662549758;
	bh=K6TqhkZr3N/QZagfnVUSPa54URRZ69RaS62UtniR5fA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKBGEN2PgIgiySCGvF8yW2RXsLF+/8onutqIEMnNJZSuTdvPzeLnwlWTrKoUuBW9X
	 GD+/anMTKbO/exGzZqByqNQ9vL6qbRi4Wt6KLQlWpX3DPgSWJT91neHT4qh9iWVKl8
	 HUEvn/MdELlT6f29ing7koUUbQMMDxJhTjGca5Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 531CEF8011C;
	Wed,  7 Sep 2022 13:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DD4EF8011C; Wed,  7 Sep 2022 13:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D0D5F8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 13:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D0D5F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XYR1FDAd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85C12B81C44;
 Wed,  7 Sep 2022 11:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8667DC433D6;
 Wed,  7 Sep 2022 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662549686;
 bh=K6TqhkZr3N/QZagfnVUSPa54URRZ69RaS62UtniR5fA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XYR1FDAdACKX99GLbnhwQ0G7Qt2K9/qv1mXBdM+JTMehoYSwUNd2Xnje2yNUlM8Cc
 /s7PXwfulTx5SHtWiNaVKesLZ1oHVscGvIX4qhSkqX9AF3ymGXnTaHJDpH4cJOk/Ef
 QTMqj8rTotuUEAdTzkhjeUkae5M8aMTlydvJ39FkQ3VDvzebiFLmiD0wumGsxzBzLT
 v3FnKyChMSp8ppQDSjIf9BWCD1BjiOjfVz022G6Bcc7hyggMn/kmgnhDdjDFrW44cL
 cXbB+6yeqOOceCUGDRB+7D7EOt0W4fW5PnVMuK68lY/I6lCS9T8UvuxuA/RGx62X6b
 A2xcxLmL9L19Q==
Date: Wed, 7 Sep 2022 12:21:21 +0100
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8825: Add ADCOUT IO drive strength control
Message-ID: <Yxh+seNpKW5lxhjp@sirena.org.uk>
References: <20220907065126.406208-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y3YuxPMTeSqTg3g9"
Content-Disposition: inline
In-Reply-To: <20220907065126.406208-1-CTLIN0@nuvoton.com>
X-Cookie: You have a truly strong individuality.
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


--y3YuxPMTeSqTg3g9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 02:51:27PM +0800, David Lin wrote:
> Add a property to control the driving of ADCOUT.
>=20
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---
>  Documentation/devicetree/bindings/sound/nau8825.txt | 2 ++
>  sound/soc/codecs/nau8825.c                          | 6 ++++++
>  sound/soc/codecs/nau8825.h                          | 3 +++
>  3 files changed, 11 insertions(+)

Binding and driver patches should normally be separate patches.

> +  - nuvoton,adcout-drive-str: ADCOUT IO drive strength. 0 - normal, 1 - =
stronger.

Why not just make this a boolean property rather than requiring values?

> +	nau8825->adcout_ds =3D device_property_read_bool(dev, "nuvoton,adcout-d=
rive-str");

It looks like it's being parsed as a boolean.

--y3YuxPMTeSqTg3g9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMYfrAACgkQJNaLcl1U
h9CIgQf/RmIjxCqHN0ms9ApCi9oAM7fXHlKACLO3AI6WSQKU+poPOApo4TuGvY7e
eysMjlZtjpjZeksMdbiu8Zmf/tZYysr33CtBnSnLnCfYCzrWxbw0p3ywxZRwi8qR
v1+NJ63qeFNy0LpmiUUxu9K/fLKvbONOpnK4f4FFivGr/5vMhIHyi/xEgbFxxqC5
MLefAZvWMsW+QlpO4dPNMYd+OyiT21xiojK53FcuYXvW81x4YfNyrGLsVdzH8wnP
4UjuTtzYZkiAiYeQOduTvuwwxbXUm4dRF4NZYNnq2nqk3GZvh5JmrhF9EPm2aJf9
tdHKp7O7R1Wn6nO7A0mnZ267hbdHWg==
=+SLw
-----END PGP SIGNATURE-----

--y3YuxPMTeSqTg3g9--
