Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E312C42F56F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 16:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6530817F1;
	Fri, 15 Oct 2021 16:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6530817F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634308298;
	bh=AEtWb/xpPvXYdf5GA4X8ida+83gqErYx/NpU8kM27To=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9SdaUf7zfow2jblAgv2EB3L2p4Ng37onKxn6m44DGcEUdyKMLLi0G+iXY7qFg6bT
	 uxd7sK7gYiNMbn3BNrXqyCdtXq4Vanb/tcyoxRSF+iziEXIO07o5rtQz56VL3RL7UX
	 GWn1am/RvCdn/NcC3o7DtK23zNwpehp7tGgxNg2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3717F8028D;
	Fri, 15 Oct 2021 16:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75CC8F80269; Fri, 15 Oct 2021 16:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7125EF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 16:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7125EF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ueP0q1Ga"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70DF8610E5;
 Fri, 15 Oct 2021 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634308211;
 bh=AEtWb/xpPvXYdf5GA4X8ida+83gqErYx/NpU8kM27To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ueP0q1Ga0z7mOhcyKp/GuEGLiCZThinNlPsNosw9QnHZaOMvYTqeJ4lwBMzuP68vV
 GgEVup4n4FW2P7NGUwUyiygSyPT4lg5tl9tM4cljUmC9AYEyKRQhE2VIYqCM8315pB
 DzyyXz9yelcP9M5njE+39pYX7w8RSLgwalaSJbCqN29U54OJStSQU10lNR7Af/ERZQ
 W7sbJRdE1FRiULJJrxhDKIE50jsaR1IJbx533jER8wUbGTteia+vy8x1KmhZ5B1KPE
 y3UMpKckf4vipJ68+B/aAdlmt5Ht6NSJPuiFcvc7NNkLwVE8q9NQGKamq1RQQI2dTB
 fZYFB28Gf93aw==
Date: Fri, 15 Oct 2021 15:30:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 06/16] ASoC: cs42l42: Reset GPIO is mandatory
Message-ID: <YWmQb8oudyZr8tsz@sirena.org.uk>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
 <20211015133619.4698-7-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jSS0e2uIyUoUwoHo"
Content-Disposition: inline
In-Reply-To: <20211015133619.4698-7-rf@opensource.cirrus.com>
X-Cookie: I'm having an emotional outburst!!
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--jSS0e2uIyUoUwoHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 15, 2021 at 02:36:09PM +0100, Richard Fitzgerald wrote:

> The hard RESET must be used to correctly power-up the cs42l42, as
> described in the datasheet.

> The code was getting the GPIO with devm_gpiod_get_optional(). Change
> this to devm_gpiod_get().

Does that power sequencing have to be done by the CPU though?  Usually
if a GPIO is not supplied it's because the sequencing is done during the
general power up sequence (PMICs can be programmed to assert GPIOs as
part of the their sequencing for example).

--jSS0e2uIyUoUwoHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFpkG8ACgkQJNaLcl1U
h9Dyqgf+LJrZXj+uSKJIZ0JT5Qh4ifQCqaIfbbYyPJ4Bdnq2KyOv9i8KNczYj8sS
yfb2lRfd0I5iFDg9gKshaeER4HsgD/AetI9Ndz+AI4pYQHtyj7GEU0jj2rw4jQbO
EgjqNobNWM8BkIbwZf4de/e7oL44wlgq4REspzgFUDO7nfbsfc8y5F40VOSeLbat
B+tv99B7EKofPRlx6gFVdXdWn5LW//8SMyDcFpRqLWX/iKeYBcPGc/P9Q2NCIi1Z
+Xz9J4XOZ3VH5n2nXrA7E9GYYM7G0s1er2tJs7pXFW8k5RPAD+ONMJ/bPz9flX/f
7eKJLWkhyRLt5F8ekZmY7nNPNJBERQ==
=cfD/
-----END PGP SIGNATURE-----

--jSS0e2uIyUoUwoHo--
