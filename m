Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D19273ED8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 11:49:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE4D16CD;
	Tue, 22 Sep 2020 11:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE4D16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600768192;
	bh=QSNZZdWghjMdTCu5w4Ake1FY6e6LLkyXLp5ObVBEQDM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AmRT3u0177MP2FfmtHgajTPvMXSRf3nf1JgL2hoVjWTEb5uu8iNuvMNCiaJS52c1g
	 djXWtctI5cAd5FwR1wCCugP8izfZaZRjQlY7RUxboq41ZbqbYIIMmsrfUSiJ0TH71C
	 0Adw0sWah2b4VfalH1HQkMAjTXIFoZx7KdrmRUBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 211B3F8010A;
	Tue, 22 Sep 2020 11:48:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12A05F80232; Tue, 22 Sep 2020 11:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E144AF8010A
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 11:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E144AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c2/VE8EF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27E9A2145D;
 Tue, 22 Sep 2020 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600768078;
 bh=QSNZZdWghjMdTCu5w4Ake1FY6e6LLkyXLp5ObVBEQDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c2/VE8EFEaKNzuNRiQoUIiO+pq4+y5hjTRf0wkTJ3CI8QM3xY+TOyDls7xX9Fe0Lr
 lhMNs58CxPhIZDXUIobz6R3AGR4+wm977XWyH/BC6YUI3Thh3A+YO+I0XBMbfIzo+i
 9x9/o/03oSyN1zS8u6RFxrfzgr9B+2OZeydLGx+I=
Date: Tue, 22 Sep 2020 10:47:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 6/9] ASoC: tas2770: Convert bit mask to GENMASK in header
Message-ID: <20200922094705.GM4792@sirena.org.uk>
References: <20200918190548.12598-1-dmurphy@ti.com>
 <20200918190548.12598-6-dmurphy@ti.com>
 <20200921190437.GJ4792@sirena.org.uk>
 <bea218c8-c71d-2ce8-da92-14af73ac4da5@ti.com>
 <2ca0647d-1ebf-1290-0f75-61bb97324165@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="75WsOQSofUOhcSOp"
Content-Disposition: inline
In-Reply-To: <2ca0647d-1ebf-1290-0f75-61bb97324165@ti.com>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--75WsOQSofUOhcSOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2020 at 02:19:36PM -0500, Dan Murphy wrote:

> Forgot to ask are you going to take 1-5? If so I can rebase on top of
> for-5.10 and re-submit.

I think managed to apply everything with manual picking things, there
weren't any actual dependencies.

--75WsOQSofUOhcSOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9pyBgACgkQJNaLcl1U
h9DsiwgAgInlwOJ7/tF5NZd+FEFgPUEhP9z0vVk2EZCK7PNy1OQDyroVCdpjBuxb
8vl5D3Tv2AEwwWhjhCch/jCMnlSoju5t/Uf/eGbPHP5nHs91s+6jEP08jDHSS+jB
VJGfyNNc0R8Gzl8Ld8EVgBgC75nhWLe6tWo0aIMTU7JHG31dzM+ZQgVG1EJ+qwm8
XSZOBBoP7Hp3+DhrL7EoXi33GuO3pZjiSChTB8CVzTPjXRisXld/DgZEzuXTUSxP
VC5DkZPgWkIJzHHp3o1mfkH6tZWPq7pMC7dP2cpXtNE2l0hKf/wXNna76puApVxL
9DbZLAgOdYWUPEfY/4UF87Z7mvIpXw==
=g78R
-----END PGP SIGNATURE-----

--75WsOQSofUOhcSOp--
