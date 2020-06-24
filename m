Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC1207AB5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 19:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DF7B189C;
	Wed, 24 Jun 2020 19:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DF7B189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593021003;
	bh=Rd247W4TlIFIqRUN5CZBQ8pW1nn1BEnuDzx5LIv9uI8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NaRI3gEEZ4AhX6S9fJGNH0JgKHv0EWJMoElfzGZwG3RWOjkVE4Quf8z9i4ae0/4zf
	 D3MfeFCXwgVfKE7q2lD9v7o7+DC3Xt28BF/co3si75oQw2XuwA9qw4aKF53pq6ihss
	 9SgRHI3ZQw7w+olFhwqLgy71QpyBuqM21RpW74kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A8A2F80162;
	Wed, 24 Jun 2020 19:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CDF5F80084; Wed, 24 Jun 2020 19:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB816F80084
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 19:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB816F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WHonIhZp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EF5C2078E;
 Wed, 24 Jun 2020 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593020896;
 bh=Rd247W4TlIFIqRUN5CZBQ8pW1nn1BEnuDzx5LIv9uI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHonIhZpQRO6pS5tR+zcazZe1jOhNFxYvXDk6eAdoTbH3BNsqIIlG+pq1OikN4aPa
 8gmcGODIm7euoJ8SRylxEaugyZ5kTmjfTBt48WqwQqyybdqaYpWCv9jyVlU0zg/1u9
 VTi6n7Jlh2ewFIkm4rfZ2iclpmJiH9IzM/kDnT2w=
Date: Wed, 24 Jun 2020 18:48:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v5 3/7] ASoC: tas2562: Fix format issue for extra space
 before a comma
Message-ID: <20200624174813.GN5472@sirena.org.uk>
References: <20200624161459.19248-1-dmurphy@ti.com>
 <20200624161459.19248-4-dmurphy@ti.com>
 <20200624162917.GK5472@sirena.org.uk>
 <c4a26be8-88cc-1dfa-61e0-844b9c19eb52@ti.com>
 <370c71e3-731b-3549-adb0-597abb217cfc@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gWRamliw218YCZO9"
Content-Disposition: inline
In-Reply-To: <370c71e3-731b-3549-adb0-597abb217cfc@ti.com>
X-Cookie: So this is it.  We're going to die.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, devicetree@vger.kernel.org
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


--gWRamliw218YCZO9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 12:36:02PM -0500, Dan Murphy wrote:

> Can this patchset get a review as well so I can fix before I post v6?

> Not sure what the current work load is for review or merge.

Well, it's less work to review if it's been fixed...

--gWRamliw218YCZO9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zkd0ACgkQJNaLcl1U
h9AskQf+MHoC8Q+bNQ74k5lFb02jagQQ+UAisttcMWDwOQ808pYGt8LXnHlt5W3u
hO26+agp0uMPxr3pczemvo8mp8Thsk3Skc4xYb7ZsT3oP+QNN/g6/vy54TXhDozo
lGk+SqpHUqm7jFMQV/aGlaghfhDPs24QVlj8ixrTkYevBznFtr23oETtfcd20Twg
2R2P94DZXDLgn8mj8a/djQopE309CxT1BZn36yZZN+GZeVBEPKBlTVLrBa+gVL1q
dy+dWL9mTbauDvH2kZij+wbc4r3PJ55KSGEqSCIFqVmNtkKo2OGt9Bb5TKdOtvLS
YfI8rp7hO+451SN+h5UO+wGpv8CFUA==
=AnCC
-----END PGP SIGNATURE-----

--gWRamliw218YCZO9--
