Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1821D950B16
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 19:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9E02392;
	Tue, 13 Aug 2024 19:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9E02392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723568687;
	bh=zjXhHY/dyo+ZEmSXQqKLQj5vnsg6JIFP0iMe4ldIFIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UZELs/l00i8qa/JmyVtlN3Jcu7IGIm43Ni6jQd2HAIL//X9zhDvI+PgKfdCVg5eKL
	 0JyCrh4HTzqrsbF16b+4WD+XF1HniRflvc93k2VSRqx53kSdvXwPhJJEc0lBdb+G0h
	 Z3fAHvGlqiV/447B3mq3tKMlbs9OrSq1/S8CUGV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5413F8058C; Tue, 13 Aug 2024 19:04:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4835FF805AC;
	Tue, 13 Aug 2024 19:04:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9268F80423; Tue, 13 Aug 2024 19:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B358EF800B0
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 19:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B358EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IFSoJQXR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 362CFCE13A3;
	Tue, 13 Aug 2024 17:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9836AC4AF09;
	Tue, 13 Aug 2024 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723568598;
	bh=zjXhHY/dyo+ZEmSXQqKLQj5vnsg6JIFP0iMe4ldIFIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFSoJQXRBWHFY/t9qO7LZe9yyZD/OwS4UJdsAZo/Kyirre/FEGxZslCtSnnBcef18
	 Z0KkcJtCZZ0L3ddz3rTC3HwpuSxPeALCA0yrI2VqNiXKJXy6Gby4XiWspY5kea2Gt9
	 Ru1oH5UshfYe3fhIpRdDTCquzm0QxRY3i7WahYjenmsRxmZZfpshvSvuwaofIMS/bq
	 qp9RWfN8NV3NsSaCFf3G4tx48myrvttlh5//zYtTSoXi0eTL4ds02aDFnzUvZlTEAw
	 tKEo8Yi8deDA3PuLASXhslYnwTv522lbUGSCS1Y8J8IiA//iCtg5PY7LIpedC8VKlh
	 4ummdmGG7jIUA==
Date: Tue, 13 Aug 2024 18:03:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <1ce67190-0905-4895-af42-13f44b4b638d@sirena.org.uk>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
 <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
 <20240813152243.2H3-mnx5@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vlnUGC53pdqRsVmq"
Content-Disposition: inline
In-Reply-To: <20240813152243.2H3-mnx5@linutronix.de>
X-Cookie: Say no, then negotiate.
Message-ID-Hash: UX5DUR55DBSKJ7KGUCWOGNN5FGWKE5BA
X-Message-ID-Hash: UX5DUR55DBSKJ7KGUCWOGNN5FGWKE5BA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UX5DUR55DBSKJ7KGUCWOGNN5FGWKE5BA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vlnUGC53pdqRsVmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2024 at 05:22:43PM +0200, Sebastian Andrzej Siewior wrote:
> On 2024-08-13 15:43:54 [+0100], Mark Brown wrote:

> > [1/1] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
> >       commit: 5003d0ce5c7da3a02c0aff771f516f99731e7390

> Didn't you already apply v2 of this?

Perhaps?  There's a decent chance my copy of b4 just didn't spot a
difference between the two versions and acked both.

--vlnUGC53pdqRsVmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma7kdAACgkQJNaLcl1U
h9AdDwf/RPJNLc/NcopRgM8Ry8xsd9sWTOlXjL62AnYXLeXm9YANI8w3jGiKg1Iz
UvOL9uVAXVGLOxR/WWODaD5j6n0gfEhvI25Bh+f+zoXMPamj0nB4VtlD22tMUCJH
TmS/9VN4V2ndNXYOD+jBQ84bnzurUPyBRysJC2NAPRyHAGTIaV58rBTXiJfMgKMx
z0FwHxXoZy6g6XgzgCTfaegSSe1q2P0b8Jx3EstoRcS/Zk2oepb3FFWzwId2LjKz
gHiaI5NYH1UP1YyQFAPJV0vjqF0EzhcXB/03k6B9KKCxMdqZtETNppmDUH3YGH6j
I3baEoGjJxxkw51mRhHxsqinYZ/NKA==
=1J0B
-----END PGP SIGNATURE-----

--vlnUGC53pdqRsVmq--
