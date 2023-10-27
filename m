Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B437F7D9DC9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 18:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7221ADEB;
	Fri, 27 Oct 2023 18:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7221ADEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698423022;
	bh=32DaPpQ2+GGDuCnPPq4gjkvUJNBaDefp5jSQJmVDdM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSBSRxl9mZ6Y8zVIFMRGF8rwwrFDG39Hz0E7lU0tYS0rBGa84vXqxaQIZxgdnx3NB
	 j0v9GMm1X23hS3UphGrXs+KnurWx6BGJmHdYw0jCe9ZN9IN0Dj1u6gJoxWhoo+3JxC
	 idpOZuiqt5ACiqBTH1otJkdpYM/yN9nPirRmgVoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7052F8024E; Fri, 27 Oct 2023 18:09:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A782F80165;
	Fri, 27 Oct 2023 18:09:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C9EEF8019B; Fri, 27 Oct 2023 18:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12FD4F8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 18:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12FD4F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T44TYV8p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B37B8B829AB;
	Fri, 27 Oct 2023 16:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7833EC433C9;
	Fri, 27 Oct 2023 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698422963;
	bh=32DaPpQ2+GGDuCnPPq4gjkvUJNBaDefp5jSQJmVDdM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T44TYV8pgAjl04XUPa/dTxwEtXG3ZzogUt4Q7uHtIFH9WU+2J8gyA77H3BpXD3p1g
	 526/A0xz0Hbc3fi7o6rjJgn8Vqxpgjo0X5ZxDlQEzSC8gLFC7asIAdSRPOKlByJTzf
	 0vSOgdyZTtCWk6Ts6hAWEPVqSpITEm4Vy4FLBjAwv0uL+R1IGiRBZ+v+CY8710mu/B
	 pjXe8FvvccGKsjfmsdFJMbjrrgMU4UYO11ZRVMVJNcIph7+hP4+jmha20u6cLm/gzL
	 AhQ5neluUalg0xAZAKzcOXKFpGvgecRHP/YqslBuxz0QRcxqPyyCoK/bZ//kcvL/Wd
	 3FOPp8QQRmWSA==
Date: Fri, 27 Oct 2023 17:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: kernel test robot <lkp@intel.com>, Eberhard Stoll <estl@gmx.net>,
	Han Xu <han.xu@nxp.com>, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 4/4] spi: spi-fsl-qspi: Add support for rx data sample
 point adjustment
Message-ID: <ZTvgJMsPgxfqxY2S@finisterre.sirena.org.uk>
References: <20231026152316.2729575-5-estl@gmx.net>
 <202310270332.mcbckKCr-lkp@intel.com>
 <abf335aa-1366-4c66-80f1-86e273143702@kontron.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DPWNaVop7Q2nZF4X"
Content-Disposition: inline
In-Reply-To: <abf335aa-1366-4c66-80f1-86e273143702@kontron.de>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: TA4X3J2IGJZ4F2KC5NLXB4EIVHI72YZK
X-Message-ID-Hash: TA4X3J2IGJZ4F2KC5NLXB4EIVHI72YZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TA4X3J2IGJZ4F2KC5NLXB4EIVHI72YZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DPWNaVop7Q2nZF4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 27, 2023 at 08:51:49AM +0200, Frieder Schrempf wrote:
> On 26.10.23 22:03, kernel test robot wrote:

> >    drivers/spi/spi-fsl-qspi.c: In function 'fsl_qspi_select_mem':
> >>> drivers/spi/spi-fsl-qspi.c:558:38: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
> >      558 |         if (chip->rx_sample_delay_ns != spi->rx_sample_delay_ns |
> >          |             ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~

> IIRC, when I prepared the patches for sending "checkpatch.pl --strict"
> suggested to remove the parentheses here. Seems a bit inconsistent...

Ignore chekpatch, and it does look like as well as parentheses you
should have used || not | here.

--DPWNaVop7Q2nZF4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU74CMACgkQJNaLcl1U
h9BnVgf9GY8BWySvtZ5d2AGwW76SozOSOKRpaczcNAXQI15bsOPsCiF9Yi2K6sej
hrx1DGKrtfZMiEINFgU47bM1Jm7B9DcI7LO1QZD26xcdBw0xkupHoPmiGjdHk3nw
Gb4tpZTci6NJAwbmCBvPRVrLEMjqQQKI0zYNC3O02s5dDbKnm9HMsuVCQ87UgUG7
uY2mkDZLEtceLojHnaS//JuUxGiGqRnBz2z3gwHg8RWUlzTV68ZH2Tb/fgQzc66B
PHfbWMFtQ5esveWTsp5/sqhMgD+RfMtc7xtZmqMBz43AxpBpJGlHLL6mhcCPVotw
kunJyE2e5jm7GKVCVt+w9nFATLDM+w==
=pjbf
-----END PGP SIGNATURE-----

--DPWNaVop7Q2nZF4X--
