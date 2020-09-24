Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B827765C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 18:14:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06BC1812;
	Thu, 24 Sep 2020 18:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06BC1812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600964095;
	bh=HATEJboxOjdhNSGz2l0g/RJsS3n5T59PRj0uzzAMhUw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8nSr930yrcnnOUult2E48bB+UvBD6srxP0e2e8uJvS4cOLij4kNV5Z4Nuag+cIZr
	 MGlVv8wVrqnKyQ5vHNxvrnDHjx4uGCUzDZl7b9vsLKZuFaj+pPzPS9UbdeVpRFZWCY
	 lUFI4AcSYPVhD2NamSZP1RGLkjNk497ymC9ZN8Zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C8E7F8023E;
	Thu, 24 Sep 2020 18:14:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE3FF80229; Thu, 24 Sep 2020 18:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C89E9F800DA
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 18:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C89E9F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YI4ID7HR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CA9B206C3;
 Thu, 24 Sep 2020 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600964024;
 bh=HATEJboxOjdhNSGz2l0g/RJsS3n5T59PRj0uzzAMhUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YI4ID7HR/7kd0ZthQQQUyaGlQTvG2r/Cx+xE7NC4h4PcP07HTaDxJZzh0q9HYW1k+
 tbmydK5TdZAjo0UXyEZcWBawBRfFhwxHtnQArM6BfObTklpYmSuSfcESrwUQ80NLw2
 Oje3lqWzirG6S9OqTyS0petbKKTMY8unvSpjUXbo=
Date: Thu, 24 Sep 2020 17:12:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] sound/soc/codecs: fix spelling typo in comments
Message-ID: <20200924161249.GG4754@sirena.org.uk>
References: <1600929860-28862-1-git-send-email-wangqing@vivo.com>
 <20200924123346.GE4754@sirena.org.uk>
 <062568971307793dcc80337f85545c4765241933.camel@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline
In-Reply-To: <062568971307793dcc80337f85545c4765241933.camel@perches.com>
X-Cookie: Programmers do it bit by bit.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Wang Qing <wangqing@vivo.com>
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


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 09:01:21AM -0700, Joe Perches wrote:
> On Thu, 2020-09-24 at 13:33 +0100, Mark Brown wrote:

> > and compliment appears to be the one that
> > is used in the datasheet for this part...=20

> It's difficult to fix datasheet typos.

Right, and if we search for the thing in the datasheet we should find
the thing in the datasheet so it's best to follow the datsheet even if
we don't think it's correct.

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9sxYAACgkQJNaLcl1U
h9CCaQf+LLzkqnUGpFjawsKtPZWnUeywEzgLkvxTAL3xcZnTzLmuaJ5/fUJV4Fox
gDppXiRJMYzk4OfMOR+VFbgzIn4q9ePxRSlJAFOsSmZv8YWUAtpfB17R07Av/Kgz
+pAiXLXLBj+jgUiSUP26gKa4GJ1Pfd/Y52UKs8HK+E6dJ6KIzR/NXb1rY9BlYUy2
AXERvogxODOAd2JkSU3au5gv4OhqM9Bfi7y3UZ+uU804vVSWU+3MjiWCiFbYMLSS
/IEtHjK20TxChyGLjy3e2pF4X7ntIovx3aqfklSSNW/e+n0FnYzEFWsgQeQ8AoIO
FqQysHyj5A4ww0mUPmS/ZZite0Zgww==
=H+Mo
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
