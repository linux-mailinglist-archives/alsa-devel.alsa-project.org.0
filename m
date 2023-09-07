Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76665797201
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 13:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49DA983A;
	Thu,  7 Sep 2023 13:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49DA983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694087577;
	bh=zjCLSVlz5LdCpC8IOpacCvdlUauv1FO+yJco6i36Oic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rHDL+76+AcK9Cu/ZIz3NafSOWXOAw873Vc9+jdpsQDZR8gHf+K2KX2QE7sFWgb6AX
	 fhr8dYuSj749vqEd0+BA7iPidpMTJWfR4b+YAYYR6ljhxvyUbgoQSz3r7XIbFJY8df
	 yuUVRziD2iiOmKxNgQp7x8uERsAeCZHnmIcuKEaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9622EF80549; Thu,  7 Sep 2023 13:52:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FEAF8047D;
	Thu,  7 Sep 2023 13:52:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C647F80494; Thu,  7 Sep 2023 13:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32C95F800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 13:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C95F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SqUytxf6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F2E78CE1870;
	Thu,  7 Sep 2023 11:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2430EC3277F;
	Thu,  7 Sep 2023 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694087504;
	bh=zjCLSVlz5LdCpC8IOpacCvdlUauv1FO+yJco6i36Oic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqUytxf6zXbzBIIkpjtKMhcFfrmJPqHiIboWOlhpunBvqIjcLazGaEq1guZ+y0hRI
	 Bu0087gvzOUJwwaOADCNRZLmNLQIVmFe/BX/T/SFl+5+Xg9HD+L/e0JJFX2l6i/koq
	 WnvGt5s1VGrabaFiyZ2/CdJRL4+7a8WixhRxQULr7OzK3B+E3k1Gw3pOz1CKu+2GZq
	 Sd1AlnviH2HtKpNHVOrpwl1YcMdI7rdW+LctE8YH6Q8Vpd0XBFFLqXXb4754DnoLAo
	 zh61V47/eh7v3+V61IOdpGE180+ykPp2csE0qn8tlopWLb4A7wVOKOxR6VW9xMwyzz
	 nBBCZDDex/VoQ==
Date: Thu, 7 Sep 2023 12:51:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates
Message-ID: <2c3371b7-3dae-48d7-8cc8-1acfd5bd267c@sirena.org.uk>
References: <1694069533-7832-1-git-send-email-spujar@nvidia.com>
 <1694069533-7832-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HG1UHo7ZQGFGM8s+"
Content-Disposition: inline
In-Reply-To: <1694069533-7832-3-git-send-email-spujar@nvidia.com>
X-Cookie: In the next world, you're on your own.
Message-ID-Hash: RAJBLEIQHBGE6QOMRH7N4HWPO27VTBQ2
X-Message-ID-Hash: RAJBLEIQHBGE6QOMRH7N4HWPO27VTBQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAJBLEIQHBGE6QOMRH7N4HWPO27VTBQ2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HG1UHo7ZQGFGM8s+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 07, 2023 at 12:22:13PM +0530, Sameer Pujar wrote:

> Fixes: 202e2f774543 ("ASoC: tegra: Add audio graph based card driver")
> Cc: stable@vger.kernel.org

This is just a performance improvement rather than a correctness fix as
far as I can tell?

--HG1UHo7ZQGFGM8s+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT5uUoACgkQJNaLcl1U
h9CANgf/U94AHJ9kaYX/llz+gCrnDPZiKF6ybEtAU8/FafiAXB1qqhJXgW7rYlOv
w1oreyoLvt7fSSDilpCBjkB95pwSzAsqtuoGj1jvwfszhZtNuKBAILsU3TEQYuyh
ZJ9sSzvEiWM3QAYyIqSfQuPGbkQ0vZ0uHk3jE/M3t2MB6XvTzijC5HAU5lSqKf5q
KB+sHqqvMZDdQHADUKo7kgd6CqMEDriZAkoL4OSpYpBQN45gU5qDGzpZi9E9qIz8
9M5cGuEnzj4Z6Bh8KrFf4xEQOp/rKx47iz3KfkXpVJaBWASm+vqeFfSCR7DGxaKq
n/GTqlWdCZjilEbg9YapCRGiljEkVA==
=D621
-----END PGP SIGNATURE-----

--HG1UHo7ZQGFGM8s+--
