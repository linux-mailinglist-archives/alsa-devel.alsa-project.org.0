Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E8867A8B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 16:43:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27978A4A;
	Mon, 26 Feb 2024 16:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27978A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708962208;
	bh=eL3Sq0didjuZIcQ0uUGAVgBF4oFDIInfGkYzwsFtZ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lo1MQW2LcSEwkxH6eRDdiVwSbzJyjZF/lXStmMvhMYXqBId4cFcxkmOiqwIvVWvLT
	 MFXqQGuhM63h+RdVyl4fLUCtIKNWWocg5eSDAkf6TYDp09JIi/TvB4VMKQMF/Dhx6l
	 WlNcatt9bix/BUjlSd/n4+6RpVyLjWp+IuneAeHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E67A7F8057F; Mon, 26 Feb 2024 16:42:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B0BAF8047D;
	Mon, 26 Feb 2024 16:42:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0895EF80246; Mon, 26 Feb 2024 16:42:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7DC6F8012B
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 16:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7DC6F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UPxjAqrN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65788CE17B2;
	Mon, 26 Feb 2024 15:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBAEC433F1;
	Mon, 26 Feb 2024 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708962157;
	bh=eL3Sq0didjuZIcQ0uUGAVgBF4oFDIInfGkYzwsFtZ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UPxjAqrNQZU6c56kJP7tvRbFozDBHAeT/Ki1LV0YiumSxdtDrvz13EA0H4KhswR51
	 Y42pqnYvuSEXWhAKu4zJrAmA8dw+IOspFIpDgy6jeF2aEgXXVp9/fvvcOsIv/jBcUy
	 YhIhoVAOY6nJfSFI+2lm3thxc5OE85qOK+MQehEgLbvRGa+Svu8CDqcfTDADH9x6rR
	 pg/tC6RN35XNFt+HtOLHmfFbl2MXWFx9MpCZtMhxfskVDrRf9UbmgltQResfhSEAAo
	 CKKCen9AItd4FaRcKTIgeh2LYngENnSn7DBcZla/oSg1zzI7SZd/MaNh1n4LdxQMAr
	 w/AWH3h/w19WQ==
Date: Mon, 26 Feb 2024 15:42:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Message-ID: <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
 <20240223175116.2005407-7-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="US/dKDUluQQUZ0hF"
Content-Disposition: inline
In-Reply-To: <20240223175116.2005407-7-jbrunet@baylibre.com>
X-Cookie: Your mileage may vary.
Message-ID-Hash: MMUQUMZOGBSTJ43CO2F2UJYDWE4ZVHUX
X-Message-ID-Hash: MMUQUMZOGBSTJ43CO2F2UJYDWE4ZVHUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMUQUMZOGBSTJ43CO2F2UJYDWE4ZVHUX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--US/dKDUluQQUZ0hF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 06:51:12PM +0100, Jerome Brunet wrote:

> Use FIELD_GET() and FIELD_PREP() helpers instead of doing it manually.

This breaks the build for me:

/build/stage/linux/sound/soc/meson/axg-fifo.c: In function =E2=80=98axg_fif=
o_pcm_hw_para
ms=E2=80=99:
/build/stage/linux/sound/soc/meson/axg-fifo.c:149:28: error: implicit decla=
ratio
n of function =E2=80=98FIELD_PREP=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
  149 |                            FIELD_PREP(CTRL0_INT_EN, irq_en));
      |                            ^~~~~~~~~~
/build/stage/linux/sound/soc/meson/axg-fifo.c: In function =E2=80=98axg_fif=
o_pcm_irq_blo
ck=E2=80=99:
/build/stage/linux/sound/soc/meson/axg-fifo.c:207:18: error: implicit decla=
ratio
n of function =E2=80=98FIELD_GET=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
  207 |         status =3D FIELD_GET(STATUS1_INT_STS, status);
      |                  ^~~~~~~~~
cc1: all warnings being treated as errors

--US/dKDUluQQUZ0hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXcsWgACgkQJNaLcl1U
h9DIlgf/fnA/FeDBqMLROkPy3MIwMuQ3ZxxLtkBhK7VmoZBxa9cH7MWNDQ84B1pt
Ed/CFYuM8JzavBhDYl1s+qGi7RRsz36Zk/FAPftRdm/zCTl7L0oXH5a26CgU2WHJ
DiB6tY1QkkAFWj6nHAlNlNUeIkAXBa8py0pOOv7JKNGiGMVZnEcsRZKtgyhbUdK7
jvUE3YvTXnjxDtBVKat0fe2/rOVqtefqpnKL94l7BkjlIeRgJ8DmWfGH6gibUm1t
GFY9mTOE5niV34ypQlId8dCtJEP6tbplAssdgnw0GbMceZ/xlztKtKNy3wMv+W3m
27/rAv8zQA4CUE078XdfAcxYGntAug==
=GD+7
-----END PGP SIGNATURE-----

--US/dKDUluQQUZ0hF--
