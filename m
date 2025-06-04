Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 801ADACDC6B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jun 2025 13:22:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2281F601D5;
	Wed,  4 Jun 2025 13:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2281F601D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749036122;
	bh=h/KUWIgYO8cG0DbrNg97Ztaexk2hljzFh0mhEK4m8PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lF7EDQ2eGRDWcw7m1zA92SHzPHCnZJWsA5yCx+I15OW2LU3xaznFIdfWMj+p0OPvh
	 ZSNwo1toBgwrlzOwrwfVIrhnshIybaSdQYiTO1XdANiBXx2GwIZ2SOiYCfEComBTF+
	 OPQmgLLxepQBxPDA6SiV4NFGia8h9CbVrybPUgZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDAE2F805B6; Wed,  4 Jun 2025 13:21:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C16C2F805B6;
	Wed,  4 Jun 2025 13:21:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D953F8028B; Wed,  4 Jun 2025 13:21:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AF32F800FA
	for <alsa-devel@alsa-project.org>; Wed,  4 Jun 2025 13:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF32F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M6Y2eTvN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58E2EA50260;
	Wed,  4 Jun 2025 11:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AA1C4CEE7;
	Wed,  4 Jun 2025 11:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036081;
	bh=h/KUWIgYO8cG0DbrNg97Ztaexk2hljzFh0mhEK4m8PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6Y2eTvN1BUoy5qQO8btnMZlkIhZb5mSQdYdwDokIB3hMO3XR2NPqn6ynUw5hu4/o
	 MdYZWP1lJDyD4P7Lawtb8qfR3YmPYCr7uCaOGay/u/N9035nan92/lcmYMpZR90EQ4
	 kOTcCH5ych/AhFRyZWr1FFIB9EUxaTHNunbhQImgkRRVsiBT67b2PYqpsY1lvUNpOn
	 rE6e5zujr/dTyxcWlZEwg4WK7bRvwPBrJxsmA7cgf1ANH9iKGazQNfp63KOtALxmj2
	 WcNLhDX7AojdXZBK/3xz1P6SkCU2wYUocxl0dVI9TH1F423f0VJbcM+iKqRXJVSOvv
	 bj4SJzssVlnVQ==
Date: Wed, 4 Jun 2025 12:21:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com
Subject: Re: [PATCH] ASoC: codecs: ES8326: Modify initialization configuration
Message-ID: <daa68668-e4c5-4e3f-a6ea-29079ee7e9b5@sirena.org.uk>
References: <20250604061821.2678-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9f+QMTarpFc4NW+H"
Content-Disposition: inline
In-Reply-To: <20250604061821.2678-1-zhangyi@everest-semi.com>
X-Cookie: Non-sequiturs make me eat lampshades.
Message-ID-Hash: JYLGTA3ODW5D4A7FW3RSQMPIQDWSFZ43
X-Message-ID-Hash: JYLGTA3ODW5D4A7FW3RSQMPIQDWSFZ43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYLGTA3ODW5D4A7FW3RSQMPIQDWSFZ43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9f+QMTarpFc4NW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 02:18:21PM +0800, Zhang Yi wrote:
> Modify the value of ES8326_SDINOUT1_IO in the initialization
>=20
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>

> -	regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
> -		    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
> +	regmap_write(es8326->regmap, ES8326_SDINOUT1_IO, ES8326_IO_INPUT);

Why - will this impact existing users?

--9f+QMTarpFc4NW+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhALCsACgkQJNaLcl1U
h9B0WQf/VawxLINA1Scm2F8yyLC5vgDos/wFxYjsXKarZ4RoeLM1yUrlqS4JcWtW
a+uJGR3052u3G3tak0qwldqJ5h+HVJnmfDqLUrF3Ksnvs66NDObcYJW63zFVTAoG
YZzRUT9/lkPg3ho8bmiszIgINs0b4MJBmr7QjIG9FP5bmx7utEoJhkzlKYbF+E/K
19Ez/1TIpdOgj5HD0CQbZrMBwRHf92sQ3ac6EYRVH0hjH0cjoxE8u8a3/T/h/36y
YVhNaZI6A3MMXBUG35g6id0TNBaWilZoWWwo/eBXvvXsBxesoCfAAa7xY5utCXTA
xYmATd8LmlkS9oyYFmUAga8JRUqDcA==
=tM28
-----END PGP SIGNATURE-----

--9f+QMTarpFc4NW+H--
