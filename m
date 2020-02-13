Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECE15BE6B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 13:28:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A42A11673;
	Thu, 13 Feb 2020 13:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A42A11673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581596937;
	bh=4qVn7YU+FDFdSXW2EdeerdCC5qpbrEA3tacH98/hXt0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmaDe7TzRHP4lAHYn/gP8EA4F+4SFVz2WcPfp77lDCdtlRhAV8LXRH+bA4yP7caJf
	 thCyy+dgaBHoDnjNbtvxYr9OPm2/TNt/qVvWAlWeis5XY3WQujfAYBO9oN9ms5vA25
	 F2jKf7ld00RzICn/8l8wKkBWrIPzB4IIw1oaXGUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C73EAF8013E;
	Thu, 13 Feb 2020 13:27:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E5E4F80145; Thu, 13 Feb 2020 13:27:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DFA29F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 13:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA29F80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73D3A1FB;
 Thu, 13 Feb 2020 04:27:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB91F3F6CF;
 Thu, 13 Feb 2020 04:27:09 -0800 (PST)
Date: Thu, 13 Feb 2020 12:27:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20200213122708.GE4333@sirena.org.uk>
References: <20200213032728.199462-1-tzungbi@google.com>
 <20200213112003.4.Ia542007f51d3de753a9e0a83135ee074581dbf71@changeid>
MIME-Version: 1.0
In-Reply-To: <20200213112003.4.Ia542007f51d3de753a9e0a83135ee074581dbf71@changeid>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, cychiang@google.com
Subject: Re: [alsa-devel] [RESEND PATCH 4/4] ASoC: mediatek: mt8183-da7219:
 apply some refactors
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
Content-Type: multipart/mixed; boundary="===============2432486108027511647=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2432486108027511647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 11:27:28AM +0800, Tzung-Bi Shih wrote:
> 1. Moves headset jack to card-specific storage.
> 2. Removes trailing blank line.
> 3. Moves card registration to the end of probe.

I'll apply this but it feels like it should be at least two patches - if
you're writing a changelog with numbered changes like this it's a big
warning sign.

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5FQJsACgkQJNaLcl1U
h9Aidgf+JwrAqdcozzfnMI6mZlMZXWd5pDVALFrkeGrP0hSK0gI4U4Fj4G6tIzvV
C2Yx83socKmi5lGDsAGsWCYZk9uzzqziCpkzVe9hk4sleRKClHcsWyr4gija4K1o
AVNsQxNghzdU+ATZ9A2frExvYoKo9T1P1TNlhOz4gyMRZwAIBgVHGIcF6WHfisEB
z0Ll/I24+pT8vj99s0ubtwrKmotS2UMMGy404sEQSI8Wpnv/RUtGShSUPBvlqwk+
YG4m3wje9+7jhw4M86bliJi7fteRkZNQPhGKLAYy8PuSUZk4fnSFrCB+hNuVBxcj
lKJOeFrdHO1NWtvmyYZRjmQDUJCcWA==
=3AId
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--

--===============2432486108027511647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2432486108027511647==--
