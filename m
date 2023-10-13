Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BB7C86A6
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 15:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456FB836;
	Fri, 13 Oct 2023 15:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456FB836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697203207;
	bh=tfwxO8vY/5VZ2f6n/V/bDl2PR5lkSh2hbmTloas/vbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D3LC5ovQ0Wkn0Ct+m57//4koalZAtfd7OrZ31ptUuOzyW0AjjyghX4Iss7Z4qp9Bc
	 iiK5NpRJyEsbYMxeGSi2wj3cDC7ou/GT4CcPxENBTOEnYr7TMGAtDI365X0AeOWkvR
	 Yv+WZQVZJYmQ+QcYl4M2SWOQRW5sn6ClvafjxsKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E7A1F80310; Fri, 13 Oct 2023 15:19:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2F0F8027B;
	Fri, 13 Oct 2023 15:19:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20112F802BE; Fri, 13 Oct 2023 15:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAE52F8019B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 15:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE52F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z8l/+Xh+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 07B83B82AEC;
	Fri, 13 Oct 2023 13:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B380EC433C8;
	Fri, 13 Oct 2023 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203131;
	bh=tfwxO8vY/5VZ2f6n/V/bDl2PR5lkSh2hbmTloas/vbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8l/+Xh+FfwFx+l9WHwzf+CivJ/aQqq9Ob4RuihtTBUpYiOuTy3Tr2sDTy8Hpah8a
	 6xRRSLejv5k1mSGCuNEr9qde5MZaS9RjAz7zqKULnjRQzGCyM9KAggY1mVEWE6RvrR
	 rU4XNPMhlHO8C1AoNLlpT/QoQEGY0EZS74Pkzj/GxgY/++gt4bBzD02xnAzPzYPF5D
	 rOZvCL2jrS6V3YYoJuEQu0d15U95vNTmj0N/QwdvZTctYGALnn7ATPm/GwyHAGN5BR
	 YRCs5xpVpvJzuojfHyS4mMnfWRu/75PUjo2zQHsyWLo1FhOlINZfK0f1AMYPZlGIdl
	 u2p1k4sUiA0Dw==
Date: Fri, 13 Oct 2023 14:18:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v6 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
Message-ID: <ZSlDsZ+pFoefpYKF@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TrxnhrhreJ8i5XbB"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: UB2M2B237YKFWLWFJVFJJFAJZD5CXFOF
X-Message-ID-Hash: UB2M2B237YKFWLWFJVFJJFAJZD5CXFOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UB2M2B237YKFWLWFJVFJJFAJZD5CXFOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TrxnhrhreJ8i5XbB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:55PM +0800, Shengjiu Wang wrote:
> ASRC can be used on memory to memory case, define several
> functions for m2m usage.

Acked-by: Mark Brown <broonie@kernel.org>

--TrxnhrhreJ8i5XbB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpQ7AACgkQJNaLcl1U
h9DVYgf/XvHmqiuXmRoN0U7tMZzo7WP+CLOA/DjYORoGLnjZnxp9vShIZ3Rb3yBD
zAFWBQlLSw1/NGqOUbgPbCEKjzACGAK/iDrvtmWuwK3Md03mHwm9dVlzDbHo/KsB
XEpVnISg49uAdGRDldGYcLhNUJmylglwuHdBQHUXTDXoubZlIKq3Y8lkO2UE++1F
JJWM51XbIJDShikbunKjiKnY9HwIsoIIYMzgXw26s7W3M5O/zmYJT4t9BWiOq/I/
eKiHLARnegDruQcOWp324f+MGV7eLtpOSB4oppydGT4532XH81CvdbBblFMsnyJH
h/YIjT8VFxVlIr6Wl9uEdHuKTTOPow==
=mvxU
-----END PGP SIGNATURE-----

--TrxnhrhreJ8i5XbB--
