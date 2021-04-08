Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B13582DE
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 14:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE14A1662;
	Thu,  8 Apr 2021 14:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE14A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617883626;
	bh=afXTCtARz9Gmj7IjD/ZmH4dX6cQEUNfqiPtU97/H75w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJi/BCwyDMnjLJXEyeE3XSlcz6sb1pTqo2+qOzJtZHTk5MEHnyy7aUDTILMwLjfp9
	 WreLicGWb3sMOHoUNfyNJGcITXD9+FbBBS2GVzc8ymG5u539caN+IbVmLugvQPl78o
	 l2/GW4WriuUXijCwaaI48su+uq+iMByGpi26ge2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54616F80169;
	Thu,  8 Apr 2021 14:05:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D29AEF8020B; Thu,  8 Apr 2021 14:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC195F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 14:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC195F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h/suy8mJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19DBD611EF;
 Thu,  8 Apr 2021 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617883520;
 bh=afXTCtARz9Gmj7IjD/ZmH4dX6cQEUNfqiPtU97/H75w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/suy8mJ6so+yXKCralDGHC7fkSPoNyqQ2IgKRYjC3e3l1zZC2u0L2ysyUeTuo/rY
 3RY9AlEmzdTgg+lt/YzaFyQ7jXAmE1h5eV0Bukqes3cI0uFMyxseM2Zhi6ouPbZIUq
 ZPJW+DgAKcqg34SAElB21QuY/MrHnxLtyfsp0TXufP7taTmm4ZX4MWmWQH71ngyB8j
 mhR2IPmvfNRyAFLwNRlj9VaJL03xkz77u/LlSeTgeTp2a/JqBBYbKAkzZcJqw5+ZEm
 TJFTu/UoD9mSYWJRzv0gGV/t0lLpt+eATwGocagMY6pCG2mM7gW72TDtjb3pfuZZYV
 uO9DmCr9uTBfw==
Date: Thu, 8 Apr 2021 13:05:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
Message-ID: <20210408120502.GA4516@sirena.org.uk>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 01:21:52PM +0200, Jaroslav Kysela wrote:

> Yes, it's for UCM, but even if we don't consider this purpose, the kernel API
> should return some reasonable information rather than very generic (or empty)
> strings which are used in the native ALSA utilities for example. So, I think
> that we should allow to "fix" this info also from the user space rather than
> to extend the existing API.

Half the point with UCM was supposed to be to rewrite the control names
we get from the devices into standard things that are useful for
userspace, having to remap things for UCM doesn't sound right.

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBu8W4ACgkQJNaLcl1U
h9Awcwf+NBwQtJflBAgMOJvvuAiBVxerBbjkCjS7hcK/kpT7p3AbcnvppIK7DsPH
vZ1ADVJP0o4my1v3ihQKGj0OAnoFZ1bKxF0l4iY98Hw0fnb0fiLdaZbKmQma7sFS
dG6H+1nf7ixzdlSUikzZLPxMW20w3GIc7zZcyxtQ4dCrgsIp0qSqCzxX74tGEisP
smtTyCOgKNmcm8W6uJ6eM3C3uYhYWGfGb2KFHRhJb8ehNNmbotx4WEShz7U8QQzo
adgbdK3jmzDT7GFeYpWngbkGhvsJRPGXQwRTrnkKykhObymezmdgpH1UYxzMGynr
yGYJzc2orGLl4JVXAuyhTV5q8P45MA==
=5LjR
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
