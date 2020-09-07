Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862A25F8B8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 12:45:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E189F17A9;
	Mon,  7 Sep 2020 12:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E189F17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599475505;
	bh=NukaR66YE4YJFrq7GtYPvnbt9w3DTQqaAwU84vrW1M8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPsh66afmDxcQ34CPN1zGPxwcU4/08jSuhQ4GzEEheDmSeGqN68k2wNogmdMohu09
	 V85GTg/BGHPBapdczFHiFfQ94ofRO2fc7WqiBajU6Ny8aydFWh1TkTLcgV8VIHj8z3
	 bRCnn8wL2HJEpmYsD7vP29WJU2CUQeUQ0p5Qa994=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF68F80256;
	Mon,  7 Sep 2020 12:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9249F80240; Mon,  7 Sep 2020 12:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA95DF800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 12:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA95DF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mZHk4O3T"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A18F720738;
 Mon,  7 Sep 2020 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599475386;
 bh=NukaR66YE4YJFrq7GtYPvnbt9w3DTQqaAwU84vrW1M8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZHk4O3TZK/BvnYiyEmjUhRjlLG6YO1AjDsAh96ad13X04ovy9KAnfmx2RV0VroS7
 Mz7d95CrR5iY7oQzFo14J8+RhL0oTHrFu/mAwBhmbxnnSaO6uiC9sTWbB59tEggeIa
 oDJ1JTVHd+UUSxPr/NAZONe9KLVGjsfNp27L20Tg=
Date: Mon, 7 Sep 2020 11:42:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] [RFC] ASoC: core: Do not cleanup uninitialized dais on
 soc_pcm_open failure
Message-ID: <20200907104222.GA4907@sirena.org.uk>
References: <20200904123854.26742-1-cezary.rojewski@intel.com>
 <c7d05b64-5e1e-e4a8-0685-5693ecfb8c91@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <c7d05b64-5e1e-e4a8-0685-5693ecfb8c91@intel.com>
X-Cookie: Elevators smell different to midgets.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, pierre-louis.bossart@linux.intel.com
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


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2020 at 08:55:58AM +0200, Cezary Rojewski wrote:

> Mark, may I re-send this patch with a quick update - append 'Fixes' and
> remove '[RFC]' tags - before this gets merged? Change would fill complete
> with these updates.

Sure.  For something like this it's better to just go ahead and do the
resend whatever, worst case it'll get ignored best case less waiting.

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9WDo0ACgkQJNaLcl1U
h9AZPAf/TNOuSxz2Jch5DKFFugpJfCC91SrQ9ad9nI6+RASxSkIuvMWEWZHwL5nS
Bx/X5rth3akEN72+rCU6a3Fd4aMraD4xr/gstvRb24olVhOqwePLHGde7/gGZ+sC
UV0pNVhy4+T6KrWSsSEDw94Kkk7fpRjebN2dRRCoXFsymUihwh55zUir/DFtdrDe
yLVX8hqxtynaEaVKdc9LtFwg9SRasr4QFj7jtk4QTkVDQiXF4yIHRfdcCvx+x8Yz
N/n7JNe/LCQwuvEPIdg6oao9kd/W4OsKR5/hR44cs7AU0TIP8kSlKaiPjoEGYDcR
Vt4tFidv/CkfqyvqAjRRH7A04CFR4w==
=CMHU
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
