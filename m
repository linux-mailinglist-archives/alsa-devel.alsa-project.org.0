Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA3424297
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B58820;
	Wed,  6 Oct 2021 18:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B58820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537610;
	bh=yMaIO/vd9u6EImrWxqcYNEJlDSKGJFG3owN7iCX+71A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LGN59AA4klbPqJ3fqYv6v15o43UpQXXrHKi51PsFWJ2Wy3nNkcdtcatUciNFlALG2
	 1QBJdynti0zZ6KkX+jflKE154PmIZ5Gz9a5ILmEv3IDdYZqCxfyYkf7uJumv8KFEUF
	 75CuxA/MTsYBPqorcKFZxZGcdJrQ99M/eZC+7f5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38851F804E5;
	Wed,  6 Oct 2021 18:25:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19360F80424; Wed,  6 Oct 2021 18:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64CD6F800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64CD6F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jFazALmV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2D61610E5;
 Wed,  6 Oct 2021 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633537546;
 bh=yMaIO/vd9u6EImrWxqcYNEJlDSKGJFG3owN7iCX+71A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jFazALmVxw2rZ1+El/acDelSWVyVEpwrxEZeSIgfwQKuM7JseeOjQNchG09/jBLeI
 z7mTJ74NRPa+btJsFJgjsqow1fkKJuo4AjqMDm24FN5GFAbkuvHhBu9Went3/sDt9p
 MFUYP+WdInjYC51xT4BXNLmahT3yPpBcpZ9g/L0GB0TQfpSCqRsjDTRqABB7eRr3iO
 7tBYXX/M68BXbwB4bm9X/lVkvF/5yHyJUjYvuaXbRaLA5vXQi4EmqqwdP5RcU4YjpS
 KFUrboC5dYv7Xk5LeoFLeSS9wViYI4P4Bo59j/oFy0FUCZ1XyHhpA0BVPX1g6dWZN5
 tm6b4I4kQtLMQ==
Date: Wed, 6 Oct 2021 17:25:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
Message-ID: <YV3OCDEgsy1NywTT@sirena.org.uk>
References: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
 <c8b85524-6b9f-8fd3-3978-1d26b92660fd@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cLozU3SCA/iEvNWJ"
Content-Disposition: inline
In-Reply-To: <c8b85524-6b9f-8fd3-3978-1d26b92660fd@linux.intel.com>
X-Cookie: A is for Apple.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


--cLozU3SCA/iEvNWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 10:52:54AM -0500, Pierre-Louis Bossart wrote:
> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
> > Access to platform data via dev_get_platdata() getter to make code cleaner.

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> For the series

> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.com>

> FWIW Marc likes a cover letter that's kept in the merge logs.

And for Mark it's more about the fact that it means that b4 can figure
out that any tags like Acked-by apply to all the patches in the series
instead of needing manual editing to add the tags.

--cLozU3SCA/iEvNWJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFdzgcACgkQJNaLcl1U
h9CUXgf+JIYwxgw/R8tGnzq26yu7CEbph09Q5/lfkYm0whq7yFISmL5sD3CPsCJE
1mQTpd36K2XUMv6bTN6AKyY8JCn/TilBde9vp1oCfX3Rb+be734HtY8m3EeLpAx3
+/epxCXM08ac2gf5dHbtzj6gjNL+uwtwTCCNOAwjwT+n2A2tlXl2Y0bNKfTYpPlD
tCcHbEkGhK84zSwymSOaSre3GC4QcGquf6Wl+aibNvOwqt2SONH+M9kXsObdesVo
swIHZsbywgaahkWXhrGUVRcE/uHUDUmZctSnQ/IlMXP21waUFLfA6ZkUdr1vX3rH
9iJbD+psO7AaVe4U+bmUzQCgbS+qtQ==
=4kTl
-----END PGP SIGNATURE-----

--cLozU3SCA/iEvNWJ--
