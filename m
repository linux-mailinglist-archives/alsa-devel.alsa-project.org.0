Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF211873C92
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A38C846;
	Wed,  6 Mar 2024 17:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A38C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709743742;
	bh=gyK3Oa2EgaOEcRwH1bFm2IMU4x6SIH8TB4MiAN3Tmtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFAJOf4g+wn2J3JCm6CdttfwFGT1h+saB8jMVNzqL7z9ZzFDLNlt3ssXyFHneFURy
	 O+o+ZIL5SP/TDvvzKrZvTSnRrLfdoNy5soSFpJMXNRQV4d3FyeWAiy8R8ug7TsviwB
	 gz+yMEv6GiCP26u2Ni5hS48LqERa6VZ8kz+Xnfwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89273F80087; Wed,  6 Mar 2024 17:48:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83AFBF8059F;
	Wed,  6 Mar 2024 17:48:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA16F8024E; Wed,  6 Mar 2024 17:48:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D4E4F80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4E4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XqX0qM0A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEE91616D7;
	Wed,  6 Mar 2024 16:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41257C433F1;
	Wed,  6 Mar 2024 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709743678;
	bh=gyK3Oa2EgaOEcRwH1bFm2IMU4x6SIH8TB4MiAN3Tmtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqX0qM0A8xM6CjT/E02/ozWGPWddzvlAD1SKPZeeIYniqf3O/apGGdbEKSK+SBlgd
	 Us3mWwgAleZtLRQgKt7ZyXBYeVoOsmu0cLQKejzFSFwo5rKx2H08Am3sSXzmSnsNhK
	 tSVhj6VDf1pP7fFSvFBHpYolt/DqYy+QHA2cUKv2teTcn4g6V16BEdO6EXLuUpNyvz
	 FCSCeD3h3MIS9JZ0JkxO6KXBgJkMJ8y7alGEUHCOEbsH3K5Cv7VxDyCdWn3ITiI11K
	 BevR8F6K47bChOgGsHQ+p20R+PAo/LVQBcQiHJ94mFPV8OEIbDZJs2mwc1FJ4tTgLs
	 oLQY2Z2JhDWWQ==
Date: Wed, 6 Mar 2024 16:47:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/5] ASoC: wm8962: Enable both SPKOUTR_ENA and
 SPKOUTL_ENA in mono mode
Message-ID: <1db18205-64ec-4235-964d-89cfd198a5b9@sirena.org.uk>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
 <20240306161439.1385643-2-stuarth@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EoYH/R4wBBEJKnZL"
Content-Disposition: inline
In-Reply-To: <20240306161439.1385643-2-stuarth@opensource.cirrus.com>
X-Cookie: Have at you!
Message-ID-Hash: ASAF2DVLWKMT3MBPASGGHW27LK3PAZBR
X-Message-ID-Hash: ASAF2DVLWKMT3MBPASGGHW27LK3PAZBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASAF2DVLWKMT3MBPASGGHW27LK3PAZBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EoYH/R4wBBEJKnZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2024 at 04:14:36PM +0000, Stuart Henderson wrote:
> Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>

Because...?

--EoYH/R4wBBEJKnZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXonjkACgkQJNaLcl1U
h9CKDAf9GubyuS+G38uH6EeHSpRuTVyLfwf8KGTJQNFNlfLpma07D2/LU3K1KqvT
dsSPV1QE2jlr7kwLXdQIZj8qOpFRRAS6Md3L3Lrlzct5wNf2w0KPE3fiCKTHHka2
eqYvKcTTYpboaN+rkG3N65z7La4aaNv/8cTcfe8yd5LNbqfceuun3El1EdxXfn2B
dnaIVSyXBCzAURjbnwONWlVGcqhRUboLAQ1ePukh2/zWNv5oY2XKvwmtIFpdf4iF
6aUbFPdU+F7oeq/xdGCuDgVUepJVc/Y1coSw6FdaFoojAlWErr/VCxh5IFTvVKlH
uzN9wCsXix9cKZrZxKrdYaRiXyEvmQ==
=/g8g
-----END PGP SIGNATURE-----

--EoYH/R4wBBEJKnZL--
