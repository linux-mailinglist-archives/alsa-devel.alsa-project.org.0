Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0990D6A8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 17:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF45B65;
	Tue, 18 Jun 2024 17:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF45B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718723449;
	bh=irP8W5DH60bW9lFC7JgdFGdXSSYh8TkqH7EC8ayk7+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVNd8sMHWCQUTXTV5g6nkosVch0Hby/O/FMaGrEqF/CQApBlFYQoDGVw+tVYv9jvr
	 Pnqu9BjlAMYkmHe1AAGrUZopbEtMeIXt35GprXlQRQ5S3OAOWO25YEGeJGEdsNef86
	 it7aieIh04Pw9uq+mT5tobB+KwXc8CsK50MKA5Rs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76A18F805AE; Tue, 18 Jun 2024 17:10:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D17D8F805AF;
	Tue, 18 Jun 2024 17:10:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FAA1F8023A; Tue, 18 Jun 2024 17:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D26D7F801EB
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 17:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D26D7F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fHfTPS/X
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 572B1619DD;
	Tue, 18 Jun 2024 15:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEF1C3277B;
	Tue, 18 Jun 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718723406;
	bh=irP8W5DH60bW9lFC7JgdFGdXSSYh8TkqH7EC8ayk7+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHfTPS/XzJHImo8pObdQ8aZCmJ67QgMFZT9GzXRUCLdXPLwamYy3WgEnUsxGLhH4m
	 CdVS8331UZa6MPqWSb+HEDUHhF6vsXWyoc8Eoa5IwClOqaTuBqDi/KMph9WOMNKl4I
	 G2blbjP1KSSXDWsmLTDg9xG6SU/oUwctn+FQbKlo+L8SnazcEsI15vP+V7pF5DUcBo
	 umW5rq6wZfbkWFXjHG2hgNSlw/YBjGtF0wfndJ9JIhuAAirxJwMqgq2yPIL6ZSEWvr
	 K2rr4xgED3jjsubxXPyjshdqYg98jRehBun9bDngqx/7RmNTdM2acLoukrUuTSmVCa
	 XNiblVBm2i7fA==
Date: Tue, 18 Jun 2024 16:09:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1318: Add RT1318 audio amplifier driver
Message-ID: <986001b4-58e3-4f1e-b846-0182b2bcc286@sirena.org.uk>
References: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c6XbvTrPqHaypade"
Content-Disposition: inline
In-Reply-To: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
X-Cookie: I don't get no respect.
Message-ID-Hash: POEUFU5SO4YJ5BYXL4ZILRQYYRFMMDJU
X-Message-ID-Hash: POEUFU5SO4YJ5BYXL4ZILRQYYRFMMDJU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POEUFU5SO4YJ5BYXL4ZILRQYYRFMMDJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--c6XbvTrPqHaypade
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2024 at 10:20:41AM +0000, Jack Yu wrote:
> This is the initial i2s-based amplifier driver for rt1318.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/codecs/rt1318.c:785:5: error: no previous prot=
otype
 for =E2=80=98rt1318_pll_calc=E2=80=99 [-Werror=3Dmissing-prototypes]
  785 | int rt1318_pll_calc(const unsigned int freq_in,
      |     ^~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/codecs/rt1318.c:1340:10: error: =E2=80=98struc=
t i2c_driver=E2=80=99
 has no member named =E2=80=98probe_new=E2=80=99
 1340 |         .probe_new =3D rt1318_i2c_probe,
      |          ^~~~~~~~~
/build/stage/linux/sound/soc/codecs/rt1318.c:1340:22: error: initialization=
 of =E2=80=98
const struct i2c_device_id *=E2=80=99 from incompatible pointer type =E2=80=
=98int (*)(struct i2c
_client *)=E2=80=99 [-Werror=3Dincompatible-pointer-types]
 1340 |         .probe_new =3D rt1318_i2c_probe,
      |                      ^~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/codecs/rt1318.c:1340:22: note: (near initializ=
ation for =E2=80=98rt1318_i2c_driver.id_table=E2=80=99)
cc1: all warnings being treated as errors

> +	if (lrclk =3D=3D RT1318_LRCLK_48000 || lrclk =3D=3D RT1318_LRCLK_44100 =
||
> +		lrclk =3D=3D RT1318_LRCLK_16000)
> +		regmap_update_bits(rt1318->regmap, RT1318_SRC_TCON,
> +				RT1318_SRCIN_F12288_MASK | RT1318_SRCIN_DACLK_MASK,
> +				RT1318_SRCIN_TCON4 | RT1318_DACLK_TCON4);
> +	else if (lrclk =3D=3D RT1318_LRCLK_96000)
> +		regmap_update_bits(rt1318->regmap, RT1318_SRC_TCON,
> +				RT1318_SRCIN_F12288_MASK | RT1318_SRCIN_DACLK_MASK,
> +				RT1318_SRCIN_TCON4 | RT1318_DACLK_TCON2);
> +	else if (lrclk =3D=3D RT1318_LRCLK_192000)
> +		regmap_update_bits(rt1318->regmap, RT1318_SRC_TCON,
> +				RT1318_SRCIN_F12288_MASK | RT1318_SRCIN_DACLK_MASK,
> +				RT1318_SRCIN_TCON4 | RT1318_DACLK_TCON1);
> +	else
> +		return -EINVAL;

This would be more clearly written as a switch statement.

--c6XbvTrPqHaypade
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxo0MACgkQJNaLcl1U
h9A5Jwf+IpyS2scM3bhsToCNvxQXzFCM5aUCOjYSCHE7a7YQc4N5drDK4wNWxfmx
VOISkfGCfJYAx2HOs4PHn1SQuEyz4jgqfAU3lmynFL4rETyvvfpmySWA1CFygHPb
dCiE2eU8syfZQGCo/bBEvWTEijxkzd3HsFEEN5GZ2FV5Ztw5fp0BIeSNKmxA9g07
/1Aw4Y5QKzXAuq55PQOLIIyucSIuBA9vaetl3NTgT08dH32y4qnkJP2HW2AXAC8Z
ZA+2ByzwLrFfyOlbzhjoT80dIw4mPdzHmOnejC58PePT+gAdzmxPR/yVU4gHNCMh
0Boot0NQZky1hkKdyX515iw+UP5+DQ==
=7fiP
-----END PGP SIGNATURE-----

--c6XbvTrPqHaypade--
