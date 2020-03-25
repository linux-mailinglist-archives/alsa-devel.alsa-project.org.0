Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BD1931F6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 21:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EB2167F;
	Wed, 25 Mar 2020 21:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EB2167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585168381;
	bh=4iBBjVp7TkKNNjfsBWMIzuEgE0E/XLBlFWHQsPkw/lg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/q6gLn/J2e3USBZjO3XxEDl/fe/8Js+efDRE8fyezRpOrnPUSU00csarp4/JMnaQ
	 irPW0ZJHmX8kx85zva0gxlfO1/lVBy1EUWH5DlMG5YDDLeX69n9ygAnAFdgqXS4lDg
	 F2ywfGRJG3kOGloPy3+omxHART7ell/wEia7k4R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D70DF8015A;
	Wed, 25 Mar 2020 21:31:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74BA4F80158; Wed, 25 Mar 2020 21:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 06341F8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 21:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06341F8011E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35B9830E;
 Wed, 25 Mar 2020 13:31:09 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC0D23F71E;
 Wed, 25 Mar 2020 13:31:08 -0700 (PDT)
Date: Wed, 25 Mar 2020 20:31:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/36] ASoC: remove rtd->cpu/codec_dai{s}
Message-ID: <20200325203107.GC12169@sirena.org.uk>
References: <877dzbk5wm.wl-kuninori.morimoto.gx@renesas.com>
 <0700fce9-7225-8a0a-7aee-1adcd494cc91@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <0700fce9-7225-8a0a-7aee-1adcd494cc91@linux.intel.com>
X-Cookie: Do not stamp.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2020 at 02:13:45PM -0500, Pierre-Louis Bossart wrote:

> The only open in my mind is whether the last patch removes cpu/codec_dais
> immediately or is applied with a bit of delay.

I'm kind of inclined to go with no delay so that we don't get new usages
added.  It's annoying for backports but that pain is going to happen at
some point anyway...

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl57v4oACgkQJNaLcl1U
h9AoGAf/R/P1ZdfS8udAs8VxdFFWnr7VZe3IwSBWWVeEI5JuvRfEgkQIy3Ab7kar
iFyoq/ahprNi8TrtpGnISSJ9ROUB/BSAWcYVGS//NAPnLZxGmL4rPFopOj4b+gDL
jNS3LP3FqhZUN2u6fIoBxF7FUfRwaK/daySd6tWrBumGJBK4+/Pjm0OMtILqsUAe
RkecnUg4xyZIAyIhedvKdpC4US6qUuUZawHSIX0B+gHyr/JQGwM+5vmbGyDP1Xrc
1z3GxanOif8fyugX7OA9uYSb5l87Ig4nSxO3ezt2ZXi1GsU99xM+0uspnRKUOmzo
uVfu4lBV67PeLhsbU7VkFHDs8Iblww==
=J3FA
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
