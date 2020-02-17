Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEB4161588
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 16:06:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 258A3166D;
	Mon, 17 Feb 2020 16:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 258A3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581951992;
	bh=9jporvRTxcWTlgMCKcy73orcdMfobfGBESZPiwEwM6Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hz8zWLvpBaL990r7Or9MPJ8pBs0Y6K5vjRxUzzGH62eJS93Mt4QToSJIVPTcfHW6l
	 +qQxQR2N6UeV0+sxQBJ3DwHcSczEddgBqnZJcSKfOa9eKtPEq82VUoiO35Gohcza7h
	 uJazOdx1D69dgpunH0iHKHHxLeFos83I4eZRHtXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AAA6F8015E;
	Mon, 17 Feb 2020 16:04:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AAFEF80172; Mon, 17 Feb 2020 16:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BE23AF80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 16:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE23AF80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D586B30E;
 Mon, 17 Feb 2020 07:04:44 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 599683F703;
 Mon, 17 Feb 2020 07:04:44 -0800 (PST)
Date: Mon, 17 Feb 2020 15:04:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217150442.GH9304@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-5-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20200217064250.15516-5-samuel@sholland.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 04/34] ASoC: sun8i-codec: Remove unused
 dev from codec struct
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
Content-Type: multipart/mixed; boundary="===============3520353786367960913=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3520353786367960913==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Content-Disposition: inline


--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 12:42:20AM -0600, Samuel Holland wrote:
> This field is not used anywhere in the driver, so remove it.

> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")

This is in no way a bug fix, it's a random cleanup.  This means that the
Fixes tag isn't really appropriate and it should be done after the
subsequent changes in the series that fix real bugs.  You should always
put bug fixes first so that they don't have any unneeded depenencies on
other things and can be merged without them.

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Kq4oACgkQJNaLcl1U
h9A9Vgf9HMozS/Ywu0JGI1L5GM/qN7H8wiz+zVCv1G3I0c+5ZQ+1uicI8yt2ECLS
IBLZEnRacg0QqjVmh9Ht3Ar/Z1j8ZWEFHKW/633TvvKsd+sCGUxhdruB9h54TAuP
Zp+7hjdRerC9Qwm9mZUohiIL/SYarUiuw7rOuaky+K9uhQTfq9XRtQX7AebIuXNh
Zrg/+DrbfQriYkwAvLcS7Adk8LrJ1bDw4WGmBP1zhDFwLCXQ6E2abkf4NltY+TeY
9F481r+90owgmj4x8/yFy+oD0HPgqU3fRXVgXB6H3P4L4HJylgrfjwLXwr3Sg6ln
SR4qJz3ixLII+/p8RcAUkach3NRrww==
=RpUW
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--

--===============3520353786367960913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3520353786367960913==--
