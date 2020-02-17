Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEA1617E2
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 17:28:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF297166C;
	Mon, 17 Feb 2020 17:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF297166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581956923;
	bh=FEfNAI1wqE+qz2Jfkr89sDSy6d1SUpbqdB/VOpqXQ7Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kVW+uuAsUr62dGYdLHTOeF7EZkArJ87mM/TB/OQXVTzBg0L0TllIn1w6J+P3J5ZKE
	 /FckDt7Py7o3DhU0GFEiCvDMCojdSzs5RIBglDPws+t6lccPRYSrJmeHarVG1J8pnD
	 ZaepwRQcxpnY6Rr10ApC/H9M/1xlN0HsJDGvE+1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FDBF8015E;
	Mon, 17 Feb 2020 17:27:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED33CF80172; Mon, 17 Feb 2020 17:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3E981F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 17:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E981F800B6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3729C30E;
 Mon, 17 Feb 2020 08:26:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD9143F68F;
 Mon, 17 Feb 2020 08:26:53 -0800 (PST)
Date: Mon, 17 Feb 2020 16:26:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217162652.GO9304@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 00/34] sun8i-codec fixes and new
	features
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
Content-Type: multipart/mixed; boundary="===============5344344788453323917=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5344344788453323917==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jozmn01XJZjDjM3N"
Content-Disposition: inline


--jozmn01XJZjDjM3N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 12:42:16AM -0600, Samuel Holland wrote:

> There are several trivial fixes in here, and there are several commits
> that just add new features without changing any existing behavior, but
> there is enough changing that I thought it would be best to send the
> whole thing as an RFC. I'm more than happy to reorganize this into one
> or several patchsets in future revisions. It doesn't have to all go in
> at once.

This could definitely use being both split up and reordered, it's a 34
patch series as things stand which is just far too big and I don't
understand the ordering within the series - there's a mix of fixes,
cleanups and new features which should come in that order but don't.
This makes it difficult to get a handle on what's going on because what
the series is doing jumps about a lot.  There's also a lot of overuse of
fixes tags and stable tags which also makes things less clear.  I'd
suggest first sending all the clear fixes as a separate series with the
cleanups and new functionality separate.

With regard to the ABI breaks they *may* be OK for mainline if we're
confident that there's not going to be anyone broken by them but we
should be looking to maintain compatibility if we can even if that's the
case.

--jozmn01XJZjDjM3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KvssACgkQJNaLcl1U
h9AFkAf+PTXKlVW0kwCz5ifw7rANYaEVuHbffAG8xTZ4xnAb6OOQp6nrRyjbeCh+
CVeQiWco9iMv0s3ViZrPNRu0cAY0q5yT9/3PtcSUnf9kdZU0j2NGgVcd8M1r36nG
rqo32+9t3pM7PVuMFxprSYIWowjL4imVnijbUr4HKqMfgcSv11/A8/vrgeFDVw7s
iaICzpZ7eEo7wz23UocFb3ZTLamvSqlUen7jJj8l2KlMZute7NlbH9WOZVV7KHoE
i/eafDrmflwnVDqYffboBROuzLF3fBWbcvyBHsqt9ox5N4YIv9+IBp9u1JORKCPX
tAZBXTMe3EN10DSbE3X0iXvk+gwzRw==
=106H
-----END PGP SIGNATURE-----

--jozmn01XJZjDjM3N--

--===============5344344788453323917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5344344788453323917==--
