Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FE7EF89A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 21:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902A69F6;
	Fri, 17 Nov 2023 21:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902A69F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700252549;
	bh=6kWbUec2vNPLzBAifXthIFUfHalLUWmEkimnUqjKqEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vtlVQuSwNE3miJQMV3A/MC0lTcPw+aPpL8yFdYkyZwZ4apqDbUVGYHP4iHavkJ+O1
	 woqYsNe+RKScI6KJxLJIbu/PotdGbNseOITWWns8rVsx17xqeH+wjSd4idn6pE7xYg
	 +c1VOtXd5r1qYTdEXob+EOHOEkZR/Jrp242pjv0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 257B0F801D5; Fri, 17 Nov 2023 21:21:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C57B0F8016E;
	Fri, 17 Nov 2023 21:21:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC6B1F801D5; Fri, 17 Nov 2023 21:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66378F80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 21:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66378F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BUILNHC2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C69861DD3;
	Fri, 17 Nov 2023 20:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D83C433C8;
	Fri, 17 Nov 2023 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700252467;
	bh=6kWbUec2vNPLzBAifXthIFUfHalLUWmEkimnUqjKqEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUILNHC2ssKkG8uhrL9stAje1hf/ECM1DWKoQc4BqdV1E+TajxE4VZK+2R8GFiUcX
	 N0xHEFdpTBEPr5CbsmJu3kzi9aghy+DU7btdWnxMnqsSKAdNQ6RZRNaIiIuMqR3XEi
	 Ff4lVFDNEByTdN4l6fxaS0aRmO2Mzbavu0yzA1bhZUkY1PN8bsoznE79wyIedLZp70
	 eFYY7AZdtSKOBOOlGt6sgnJJTLgCPguTn0lEQJarFqfP6URPr6vVfKGyABiq9Q9jbS
	 aoglYiwaTYR9Fvj0wibWmt/Az9KR3d+jZWJJJ/w1Nz0nu+7q59tI9OhA8FX4UWrx9r
	 RaVKtfqcXYXZA==
Date: Fri, 17 Nov 2023 20:21:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: cs43130: Allow configuration of bit clock and
 frame inversion
Message-ID: <ZVfLMIbCpShVAYBf@finisterre.sirena.org.uk>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
 <20231117141344.64320-4-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXGxTGDM5lWFigCq"
Content-Disposition: inline
In-Reply-To: <20231117141344.64320-4-mstrozek@opensource.cirrus.com>
X-Cookie: I'm ANN LANDERS!!  I can SHOPLIFT!!
Message-ID-Hash: ECKZPOS2PWCLGK5445WW4SCHJ5TMYYYE
X-Message-ID-Hash: ECKZPOS2PWCLGK5445WW4SCHJ5TMYYYE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECKZPOS2PWCLGK5445WW4SCHJ5TMYYYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OXGxTGDM5lWFigCq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 02:13:40PM +0000, Maciej Strozek wrote:
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>

This breaks an x86 allmodconfig build:

In file included from /build/stage/linux/include/linux/device.h:15,
                 from /build/stage/linux/include/linux/platform_device.h:13,
                 from /build/stage/linux/sound/soc/codecs/cs43130.c:16:
/build/stage/linux/sound/soc/codecs/cs43130.c: In function =E2=80=98cs43130=
_pcm_set_fmt=E2=80=99
:
/build/stage/linux/sound/soc/codecs/cs43130.c:1519:32: error: =E2=80=98stru=
ct cs43130_pr
ivate=E2=80=99 has no member named =E2=80=98dev=E2=80=99
 1519 |                 dev_err(cs43130->dev, "Unsupported invert mode 0x%x=
\n",
      |                                ^~
/build/stage/linux/include/linux/dev_printk.h:110:25: note: in definition o=
f mac
ro =E2=80=98dev_printk_index_wrap=E2=80=99
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
    =20
\
      |                         ^~~
/build/stage/linux/sound/soc/codecs/cs43130.c:1519:17: note: in expansion o=
f macro =E2=80=98dev_err=E2=80=99
 1519 |                 dev_err(cs43130->dev, "Unsupported invert mode 0x%x=
\n",
      |                 ^~~~~~~

--OXGxTGDM5lWFigCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVXyy0ACgkQJNaLcl1U
h9DeRwf+KIpYlfkMyt9MmI83/N6mLFgUrX9iljFpCxPqw+pMruJQXx1VPrhE5qRC
Ew5LK6C0ZG7fL4hb91OWfZc23VQdnLGF3Lif+4lQf6RIuSOt2uIITL0avcW+y8uu
ONKKXdrXELRjOZMd0LG/zZbxUpArS4c2MN/hZhGPBl19HUPwE5mh/FR+wFqb6gdI
rON7pEU5d2u5Bq0QtrmXq8CxqRkqAECYmnZSak4ji8gZ2O80ujqBW2GGAsb4UlUf
HgR7bXDmjroP6X1V8apf0+X+SnOGXQ46lalOJo6DlhsR9lvmiVhf69hHrTfXGK40
QqlkK7rIr3GdzDlhW7eWRTQxD51d+A==
=4iUp
-----END PGP SIGNATURE-----

--OXGxTGDM5lWFigCq--
