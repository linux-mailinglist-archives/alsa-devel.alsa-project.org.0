Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8981B4575
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D01BB16BD;
	Wed, 22 Apr 2020 14:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D01BB16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587560016;
	bh=pybmVfG50fMMVZW6HPcx+fnsLHiFY0WqD6ci+hKFXQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EC3LXgbwh7MjvwO8ByKcf1pmVLz/JjiuOwdhwEnCYeSnu3XFoO/4W1O1vxqifbdy0
	 CrOcRBWYG52N2NZygVPEfE6Gmr61Gbu2augir1EdPHP5g3vLF2srn1WvThWmnygzy7
	 VbttAmYwR1czemj7jFRNhREIhLMMaMUKWqeShAGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C70B3F80108;
	Wed, 22 Apr 2020 14:51:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53490F801D9; Wed, 22 Apr 2020 14:51:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7EBF800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7EBF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vxC1f6xT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 379C320787;
 Wed, 22 Apr 2020 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587559908;
 bh=pybmVfG50fMMVZW6HPcx+fnsLHiFY0WqD6ci+hKFXQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vxC1f6xThl3MJgH7DJaTTsFn3rvXYV25scxbvNtnc+z8sk2tdHGGJ7Jn2hCYiDDeu
 iSUfzI/29vpb+9TarDs3eqcHt7yF0J/t3NWyWcRXD78seakLXfYbrlL7swftaxrrAF
 IzSvVjmNdCGgzM7CRpPIe7gLEeBLJ7hFnz2q54Dw=
Date: Wed, 22 Apr 2020 13:51:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix build
Message-ID: <20200422125145.GE4898@sirena.org.uk>
References: <20200422112602.13109-1-broonie@kernel.org>
 <2c307fac-077e-6692-a57a-2c2084a4742f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Content-Disposition: inline
In-Reply-To: <2c307fac-077e-6692-a57a-2c2084a4742f@linux.intel.com>
X-Cookie: A stitch in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2020 at 07:11:26AM -0500, Pierre-Louis Bossart wrote:
> On 4/22/20 6:26 AM, Mark Brown wrote:

> > The recent batch of SOF changes failed to build on some x86
> > configurations including an allmodconfig, revert the commits:

> Not sure what happened here, these patches were held for a rather long time
> in the SOF tree, I haven't seen any kbuild report or email on this?

This was reported by Stephen:

   https://lore.kernel.org/linux-next/20200421121130.44423958@canb.auug.org.au/

with you in CC and the failures have been visible on kernelci.

> We'll fix 'this' but if there's a pointer on what configurations failed that
> would be nice to know.

As the above and Stephen's report said it shows up in allmodconfig,
that's the one I tested.  I'm guessing it should show up in most
configurations where that code gets built.

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6gPeEACgkQJNaLcl1U
h9CONQf/VtBzHOzTsLZQCboJr1RXbo+lbFsyHcCs++7QlyPFxR9nzoN1f2O/hLc4
Q9kdeHqCcmfw1Kue6GV4S4YH8B52VG8ZIGNdJDYFr0pxGUPfufPunV8qCsjh6pVZ
QX3WzPStaSMJOyXmzlf8H4bi3T2KzNVzM/3Fo67QWVqEiZRye5Hnl9Y0IH7xeWll
ZPL6G9aEH4YkcB0hLvuGsu6NSoYvRYg8P75CemV5DARgctgKsUhzs7K4RSgbnH8n
1jjoQPEMH6xtf71DfY2Xd72k0jXvvfOeGi3WqNWBaWz+0dfFLOSJ/TkqaLqk9qMs
6EmIVshiWzstrqqILplSU/cLwM/h0Q==
=fgHB
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
