Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0010C9D7
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 14:50:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8453B16E0;
	Thu, 28 Nov 2019 14:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8453B16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574949054;
	bh=lheF6rymx5R3Q2ZmnWvH4b/79+TBDmKpXoD/uj/2h44=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQjbpweO8vBcMXBM2Lsjs7AbolM/LlVbq9Vbn+e25k7Dotf6oTzLIoC3nAAo0G84I
	 n089KIb0vOICyT0rkqCA3PzfZn9BXycUsAhsnFIuI5CC5s0kRGmcDVUc2o1NE6rSKC
	 jIB9yYpDf7lU3kMpRlnBYkN6NuVhLm4PqOywKkjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4262F8013A;
	Thu, 28 Nov 2019 14:49:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06981F80149; Thu, 28 Nov 2019 14:49:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5FE1CF800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 14:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE1CF800CB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 664DB30E;
 Thu, 28 Nov 2019 05:49:03 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D823C3F52E;
 Thu, 28 Nov 2019 05:49:02 -0800 (PST)
Date: Thu, 28 Nov 2019 13:49:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191128134901.GE4210@sirena.org.uk>
References: <20191128011358.39234-1-cujomalainey@chromium.org>
 <s5hlfs0ld25.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hlfs0ld25.wl-tiwai@suse.de>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: only flush inited work during
 free
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
Content-Type: multipart/mixed; boundary="===============0176882342113950370=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0176882342113950370==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Content-Disposition: inline


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2019 at 07:39:30AM +0100, Takashi Iwai wrote:

> For this delayed_work, the situation is a bit complex, though.
> Usually the work is set up to point to a fixed function, but in the
> case of ASoC, it seems serving for different purposes depending on the
> component type.  I guess the cleaner way would be a redirect call
> like:

Yes, or just separate fields for each.

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3f0EwACgkQJNaLcl1U
h9DMvgf/ThfD5h2n/tywrBVjuD2ixPq+r4zzUZbU+ey/Im5JMI8jWsBvWmkcYh+C
pcdzA+hmP9GA0Fg9UYm05a/w966P4ZuDNZRUoNx2/jyyDEIDL56abg6LDoa1yRVY
GACxH+GcKooBEf3+EN864TxEZSXAzQ10eiK0Ng5v+zDlUE6mKJtO/2evTtbrIg2H
rP85NNsWpKAC8z14DxW824iTjAlNh8ICCotJrEmxfzho3HPdANVwj50emFy6IoL2
fDBBV1p1EKm9XRzx58Cl2fNEnkwKVgvd3dYzDLVU2npVXzj1InpEaoB1PW8+buBh
VRlcF6/PX05HED6EYqdu5gKtMqY4fg==
=x4VQ
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--

--===============0176882342113950370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0176882342113950370==--
