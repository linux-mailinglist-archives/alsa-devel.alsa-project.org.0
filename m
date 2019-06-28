Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27A5A0DB
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 18:30:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C621676;
	Fri, 28 Jun 2019 18:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C621676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561739407;
	bh=n9Rngf7KkbhFsEYOkcNzItnf6qjCiYejJ+trTCzIpr0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNEoH2ovGapXx4PX80Wt6aDi9qSVbau/BjHL+bg/zP72cyRr8QVb77xOkNfUyAL6b
	 1zkeHRzmTkEoj8S6bhMy0LI7yp7PfLReTB5Vwc6fEHK3GdB0mJ/uHhRlzIFVmyWhy/
	 siUVncSh1HSW1o4aFJ2xDFPip8Fq2W/ebS55nq6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5D3F896CC;
	Fri, 28 Jun 2019 18:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E00AF896B9; Fri, 28 Jun 2019 18:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87094F80C0B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87094F80C0B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dGiOgcrf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m//Qtq9gFmgDDqUd5HowLAI6QPmKrAl77Pvv4hXKito=; b=dGiOgcrflH/7ZIczaUI3BQ8Dx
 Cda8tGAwAfQY+pc84UQXVHXj/ctb9eNinseqZZM9hXmF9PfSw1i3tY1pjSwbXhDc7LfyAivnic9sB
 08PtAWVoPGwVmSWTYqSdM0Y09ohQ5gVwKYxN2d6UWHcV2SUNtnve2UyMpVKjRqV3ZqpTA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hgtjO-00075I-PU; Fri, 28 Jun 2019 16:28:10 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8503544004C; Fri, 28 Jun 2019 15:30:37 +0100 (BST)
Date: Fri, 28 Jun 2019 15:30:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Message-ID: <20190628143037.GH5379@sirena.org.uk>
References: <20190628123416.16298-1-nikolaus.voss@loewensteinmedical.de>
MIME-Version: 1.0
In-Reply-To: <20190628123416.16298-1-nikolaus.voss@loewensteinmedical.de>
X-Cookie: You need not be present to win.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "Andrew F. Davis" <afd@ti.com>,
 linux-acpi@vger.kernel.org, nv@vosn.de, Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [alsa-devel] [PATCH] sound/soc/codecs/tas5720.c: add ACPI
	support
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
Content-Type: multipart/mixed; boundary="===============7911696800675695555=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7911696800675695555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TBNym+cBXeFsS4Vs"
Content-Disposition: inline


--TBNym+cBXeFsS4Vs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2019 at 02:34:16PM +0200, Nikolaus Voss wrote:
> Add support for ACPI enumeration for tas5720 and tas5722.
> Use device_match API to unify access to driver data for DT and ACPI.
> Aggregate variant stuff into its own struct and directly reference
> it in variant data for i2c/of/acpi_device_id.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

There's a huge amount of refactoring in here as well as the enumeration
changes, please split this up into a patch series as covered in
submitting-patches.rst for review.

--TBNym+cBXeFsS4Vs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0WJIwACgkQJNaLcl1U
h9Bvewf+JKdAlitakvrWEvLfVQ1ffjq8q2owD1IJsFcSFOLRl7mlZG1Hoq03PBBZ
lpYSKn/+9tbAlpNf6WYSCaNX9zvzGX0CJoHuOkVEap6zPFkWlYTqg8AlqEuFhM3c
di65cqFmifwWxkbRgHnl05I9cJXwCnm49Jkdd3dyNMpBhVtCVVk6W8NRt87/ODpR
b1iYRsLgSODnRju4Bs7H9NRmUhcNm8u0UFuV/WYfJLQB26Gsw9OrzBtvrjOssLOj
94HOzJlteXbHSpHKfL4SUliE7E3f+eRMjqTkxyswoJOUuwx/z9aKVlkDk2MiltRG
Uj9hG/2v/ooD/eenWJWkK082wI0FYg==
=LAqe
-----END PGP SIGNATURE-----

--TBNym+cBXeFsS4Vs--

--===============7911696800675695555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7911696800675695555==--
