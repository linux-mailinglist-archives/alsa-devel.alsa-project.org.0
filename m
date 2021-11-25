Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE745D9B0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 13:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 222EC1877;
	Thu, 25 Nov 2021 13:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 222EC1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637841824;
	bh=BWGMZCrHH6xxi12p5oO7mIRasp8rFf7thNKaWsGdakg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3LUqADHKW4W9KWkXGpONAuizFUBwfy9naUaRA4TBM8ajKPwisH9bqchUJCX/urZ8
	 H+IiYjcoFKGd9BlmAWMlAq+9YQ/b6C1hVqrAEkY8JEQeMeqC1cOiLd7mZ0ors1eWi5
	 RS0LtMuMk4MOrzdbXh24jo6GxvWmUuZ7aAWsYbeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78476F804AB;
	Thu, 25 Nov 2021 13:02:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA62F8049E; Thu, 25 Nov 2021 13:02:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93355F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93355F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WinQ1hlB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E59260F50;
 Thu, 25 Nov 2021 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637841736;
 bh=BWGMZCrHH6xxi12p5oO7mIRasp8rFf7thNKaWsGdakg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WinQ1hlBhbKrnSPiGWFGvYPT0LPQ2KOzqOipkUVzFhHPQeyzv/vkK68EtinskPqYD
 D3IOPvpUWgeTTnc2L5pVOxlDnd2BhvPi3jK62FDoZN2wxtFEgi2O8+bAJRt80zCtSX
 O2mdYW0u/S4sY8MpxlSHNKaliK+VixWhizpl2jt5yMoGGp1IuOo1r5Ep5u+qZ4Agzt
 IA0LO+jRra170vOR3QP9m7Z3dF8ENPEIvmt2WXiRh1/rLrBMtq4DG5Qcgo2YGiyQpA
 va2PFUpABj6D0ftdKmvAi7HvwwVsZ+tObZg15Ez2ue0V9oNg/sSS71x+q0s9zGYiSZ
 xOVXNjK79SIHQ==
Date: Thu, 25 Nov 2021 12:02:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YZ97Qo500CrSmhXu@sirena.org.uk>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9M5ShoIPHrxjoCgm"
Content-Disposition: inline
In-Reply-To: <20211124220057.15763-8-digetx@gmail.com>
X-Cookie: This bag is recyclable.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--9M5ShoIPHrxjoCgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
> Program FIFO trigger level properly to fix x4 accelerated playback.

Fixes like this should really go before any new stuff so they can be
sent as fixes and backported.

--9M5ShoIPHrxjoCgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfe0EACgkQJNaLcl1U
h9CjcAgAg9IvrDEWAOwL3WYl7S3HkK2dMw76b1z6wB1iQW4pAmj8r+/wVBjfQ0Qf
xQl5b/a4Bho/sLhKkSo3zeR6gM0V9cxM5xqGeMi4faGNYPNVQyhqzMkAs8SCSj81
GWJ1S1xThLnY/VHcScXLXxh1bCz5KxCMg9AI1SxDnWvXbMd+MnGtJMa3cEE68Gls
jWUBtNNNBiC0GWl3kdlardl/0sfvH9w1kDYDNmd1ZBx3yNOO8rWKQPnS94NJaRSP
xcYyoDZZQueifuXSiKWDQLbqLQgiXXOGS1EEr9QGefjpZq95WutVv+gMQGHM1lQ8
9CR+Aau1jB2PG1PDq5c0jL7/58QcQw==
=kuKW
-----END PGP SIGNATURE-----

--9M5ShoIPHrxjoCgm--
