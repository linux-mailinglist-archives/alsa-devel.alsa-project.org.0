Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640ECF3817
	for <lists+alsa-devel@lfdr.de>; Mon, 05 Jan 2026 13:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E61C601F1;
	Mon,  5 Jan 2026 13:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E61C601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767615997;
	bh=reZkTnkauUPt+68z3x4jD1ZescPrjoeXrSLfHhIMKYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rV9XEa6d0lGYr2nwO/T6LwUq7Nzi33WRIKcZZ5Kd6QdwOlzv150yh9CRdRGhQBG1+
	 6lhl+E1matXY3WW0ztikqL6aNCf1ujc5tSjVmYkJJbROMIGOeTMKbYyIhOWPAamJGm
	 wfT/dYQ3KVGbwwAApYjuirGgbnJ1/OftZNIreE7Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A028F805E5; Mon,  5 Jan 2026 13:26:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3BC1F8016E;
	Mon,  5 Jan 2026 13:26:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9174F802DB; Mon,  5 Jan 2026 13:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02C74F80154
	for <alsa-devel@alsa-project.org>; Mon,  5 Jan 2026 13:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C74F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BueVvLXb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98E164363E;
	Mon,  5 Jan 2026 12:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A1DC116D0;
	Mon,  5 Jan 2026 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767615876;
	bh=reZkTnkauUPt+68z3x4jD1ZescPrjoeXrSLfHhIMKYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BueVvLXb2YZbdvXdbe+18M1q5cj1fcBvekjVJnLXwdPFHdN3Bay+XM/IWt3UQR1yx
	 w7uG0GKlwHMrhIcjlE3WFHHWkBwLVo+tmN9mj+KZ23jlzvrfwNREYwhxcymgo3to2O
	 1YafsMSpTa6NVAgrzR/OQcckD04Pbfk/xZWz4a8ZLiAjJMvFkpqIMtsuTDu9LGrU+e
	 sJYFRYREjHglJU65j/mc3Yhml77qdI6uyJ/uL7JwbmTiq9QYIHjAeugDa/uL4RViej
	 sCMa1C+v1AmzxMHya+bB7XZpuxByTpD8LztwjYofiDojbX3b8QZJ6AQ6dSXIychVPj
	 /JnjimWJMCQgg==
Date: Mon, 5 Jan 2026 12:24:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Andres Ballesteros Gallegos <andres.ballesterosgallegos@gmail.com>
Cc: alsa-devel@alsa-project.org, marian.postevca@gmail.com
Subject: Re: [PATCH] ASoC: amd: acp: Add support for Huawei Matebook D14
 (NBM-WXX9)
Message-ID: <3a076c9f-14cd-467b-948b-c576c890cd7a@sirena.org.uk>
References: 
 <CAOFJBMEqXqcwzUBNv0VJqw9eZ4vfbeXZBPJrKaUpyaL1-VVsXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="15ep/LZxDsP0sKkJ"
Content-Disposition: inline
In-Reply-To: 
 <CAOFJBMEqXqcwzUBNv0VJqw9eZ4vfbeXZBPJrKaUpyaL1-VVsXQ@mail.gmail.com>
X-Cookie: So many women
Message-ID-Hash: D22VT62E726FKWADGQGB7MDEJ7SDB2O6
X-Message-ID-Hash: D22VT62E726FKWADGQGB7MDEJ7SDB2O6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D22VT62E726FKWADGQGB7MDEJ7SDB2O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--15ep/LZxDsP0sKkJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 04:53:18PM -0800, Andres Ballesteros Gallegos wrote:

> This patch adds the DMI quirk entries for the Huawei Matebook D14
> (2020 AMD Renoir model), identified as NBM-WXX9.

> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 8e45f2a..1234567 100644 --- a/sound/soc/amd/acp-config.c +++
> b/sound/soc/amd/acp-config.c @@ -148,6 +148,17 @@ static const struct
> config_entry config_table[] =3D { {} }, },
>=20
> {
>   .flags =3D FLAG_AMD_LEGACY,

This has been badly mangled by your mail client, it looks like at a
minimum all tabs have been converted into spaces.  If it's hard to sort
your mail client it might be easier to use b4's web submission:

   https://b4.docs.kernel.org/en/latest/

>=20
> Signed-off-by: ANDR=C9S BALLESTEROS GALLEGOS ANDRES.BALLESTEROSGALLEGOS@G=
MAIL.COM

This should come at the end of the changelog before the actual patch.

--15ep/LZxDsP0sKkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlbrYAACgkQJNaLcl1U
h9D++Qf/VBENbt+PEJFntBMEWCZGBlpNJj7cB6ri4VWhN8+vpqQdLpRSivfB2vCX
6fsvxEsRrcPC4xBgB7wq5yok8wT/RfETPEh3gltuK3kKD1GTXp9lKKi3MNfeg2o9
W60gFp+0sS5ClHqnIxaX/Sfnw9DauiwTj9X+0Qv/IN1f6yI12Ffjl6KMRlEj6QTO
vXp+0b4hJ4Y9nVHV5iNvPr9HNOYgWaatQWPz/4zoz/27zamj5SEYk05y5I/6+sIF
g5OmM4EJHDaVAnaLW4UW0COnD/QAQ6t6WVCEZU2CFDxAIzv3dZnsEukh1s0QP0jb
rr4SAyoK+C25LMW1DoC9GSGkVke7uA==
=0kcI
-----END PGP SIGNATURE-----

--15ep/LZxDsP0sKkJ--
