Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C6E681239
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 15:19:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AFAA4F;
	Mon, 30 Jan 2023 15:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AFAA4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675088361;
	bh=BoAd/dKX7IACvabxYxpJfQaoNGvllErMGf43qKtZz94=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hlhrKJz5yLlZyiKWhjwSKQtXkiKMaEm8xM2l9icNk4e4rnSJebuNy8Zrwv7cIVjVs
	 P6dNr2g/qJ+Je2nmshAW/fjEVRnfrAnrDEVV6qdbdHF/8p08BIFucnAv5sTy1dTjdk
	 BiYW0XJgNlGN9ppx5WREiLCW0Gxt/G9cmIU+VcP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61771F8007C;
	Mon, 30 Jan 2023 15:18:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AA47F8032B; Mon, 30 Jan 2023 15:18:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E128FF800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 15:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E128FF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bUsXe6KR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7B34610FB;
 Mon, 30 Jan 2023 14:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93169C4339C;
 Mon, 30 Jan 2023 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675088295;
 bh=BoAd/dKX7IACvabxYxpJfQaoNGvllErMGf43qKtZz94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUsXe6KRs9pTFEsk5LQlzvTKvbVoIRg3kNqmP9zT0cA53hQ786P2gT+1KA9vZXSmb
 4b8NhdNfIdCsR7FEkd4yeAPbPuqkmO8cw8P9aV3dhp53IY273wnpP+wpnCt6nY/0cN
 lIzCYctHI+geh35jpABAsGkZx9H3+YETKwA/qF6Y4IQVDs2Rhz1r3HxJighSMrywxY
 TKlq80jm60MWBBn9nPrXVIBXRBH6VjHYc+GOlwMjhETp9a5GTEC9xVYY2Vjip792la
 AXtuE4uz9b9zdB3yRxH8ftw58ZtqQ81gzMA2tfbbgPbCgv0SksAEK3NEZLvUviVFxo
 +S9fmcxqQkXLQ==
Date: Mon, 30 Jan 2023 14:18:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 09/25] ASoC: rt: use helper function
Message-ID: <Y9fRoxR1E/OdmLvN@sirena.org.uk>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
 <87lelsu1gz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uUEtMnuSV5T0nWuN"
Content-Disposition: inline
In-Reply-To: <87lelsu1gz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: A good memory does not equal pale ink.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--uUEtMnuSV5T0nWuN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 02:10:20AM +0000, Kuninori Morimoto wrote:
>=20
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> Current ASoC has many helper function.
> This patch use it.

This breaks an x86 allmodconfig build (missing use of the helper):

/build/stage/linux/sound/soc/codecs/rt1318-sdw.c: In function =E2=80=98rt13=
18_set_sdw_stream=E2=80=99:
/build/stage/linux/sound/soc/codecs/rt1318-sdw.c:578:12: error: =E2=80=98st=
ruct snd_soc_dai=E2=80=99 has no member named =E2=80=98stream=E2=80=99
  578 |         dai->stream[direction].dma_data =3D stream;
      |            ^~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:252: sound/soc/code=
cs/rt1318-sdw.o] Error 1

--uUEtMnuSV5T0nWuN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPX0aIACgkQJNaLcl1U
h9AdTAf7BePLKarIshvDyUx09D1KHfYfQ7FiJDrTPwUI3BwZ0/M1DUSl/4yKmIlX
TWtwXh7wXGZBL9/dhgw3OugVS49IUwQ2E+adwLmyq0BDzpsj83s3LUNCypWN1+S8
07VYQZUvAy17kmhJHIezJq24i+wiauvynikV4RzcOYFBQTYmh2gHAarrijZnJmsj
AJmHk99HRbpK8fkb6k6obXDHa8glohPLEjoc+P2e9qD/MM2wvWKXpupJuCTos+D1
BbHi8riNNyk/xL6pLx50VanIgpzFa+MILuj8BC54RnH2tmZKkxb32bFLKuSexPE0
Bkii4CKG+tz+biN6RlHXEaURKdh6Qg==
=Fcbe
-----END PGP SIGNATURE-----

--uUEtMnuSV5T0nWuN--
