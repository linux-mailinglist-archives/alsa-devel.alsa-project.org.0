Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B618044A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 18:05:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F51167B;
	Tue, 10 Mar 2020 18:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F51167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583859908;
	bh=98iyt5xGvhYb8jz+MkMOCLsFeljF5mhcaTPA5M6hPKs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jns82u1lSG9PrFdoryo0gPsWmY6kcHHXyW8bGw1uIBmoM7lnKQZgfH12FR9blYeHf
	 Nmv8z1pgGeKm4s1d7+sJfhRqyjP3GgkHSskJ/q4S1ZTolv+rv9IDylax+huXZ9oQBw
	 W8vig/2vJ1KGaeb+omLG+tzpHbirK/ZHDAGMj5gU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E86BBF800BC;
	Tue, 10 Mar 2020 18:03:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24AE1F80217; Tue, 10 Mar 2020 18:03:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6CCC3F800DA
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCC3F800DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0181FB;
 Tue, 10 Mar 2020 10:03:19 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5D5E3F67D;
 Tue, 10 Mar 2020 10:03:18 -0700 (PDT)
Date: Tue, 10 Mar 2020 17:03:17 +0000
From: Mark Brown <broonie@kernel.org>
To: "Schulman, James" <James.Schulman@cirrus.com>
Subject: Re: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Message-ID: <20200310170317.GJ4106@sirena.org.uk>
References: <alpine.DEB.2.21.2003061508150.32557@james-tower>
 <20200310123711.GA53842@sirena.org.uk>
 <alpine.DEB.2.21.2003101141560.11219@james-tower>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wHh0aNzodMFDTGdO"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003101141560.11219@james-tower>
X-Cookie: In space, no one can hear you fart.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 ckeepax@opensource.cirrus.com, "Austin, Brian" <Brian.Austin@cirrus.com>,
 "Handrigan, Paul" <Paul.Handrigan@cirrus.com>, "Rhodes,
 David" <David.Rhodes@cirrus.com>
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


--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2020 at 04:44:36PM +0000, Schulman, James wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Sorry Mark, our corporate email server makes it hard to send SMTP
> emails. I'll figure out a better way to do it.

Some of your colleagues are using opensource.cirrus.com for this,
copying in Charles.

--wHh0aNzodMFDTGdO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5nyFQACgkQJNaLcl1U
h9Dsvgf+NU/Mwc8fHd00j1N8yXjuTZRK40Nt+gKFyXRPNI1BhtnkxfCM3zbkxIUe
tJTsnl55d0136/E26ighU+eq4T+gP9n7GLRQE/Jb72TkWlltO6XsPZGKvmfv/MF0
vkkYJTaH/hviOY3KuAmSVWxVIq7EfWDODE3qb803l9kZHihM+pG6zVreRxck7vef
CKG55xskKpxWaHw1D082RUhSy5lRpS1va4RbfiRR/lhsOHEq/8dCMgw1Y0AbJt1C
qFd09bpxdKwTM6c9sXXiWGpj3D7AxY2AsOzxz5cnkuHqFwft22HiRkZkj94Xvmrm
8VU8mJlxLO31Ryp4oNGgR5UyYgtoPA==
=yYry
-----END PGP SIGNATURE-----

--wHh0aNzodMFDTGdO--
