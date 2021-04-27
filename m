Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9FC36C7D6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 16:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1D716E0;
	Tue, 27 Apr 2021 16:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1D716E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619534229;
	bh=cfK50gneOtZ45RbcE2sg4WO2BrtfJNagZby+Gpk6azY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkMIQyre2onRmZAtJkdo76nM4PU90rvxtQxC/YbbKqU4HAXbzFpJ50M9jWseF8Vs+
	 1Km64tA8QUziEBFhJfZMLXXPc7k4EMVearCaFdxN/pAoJYDAdWZLwIZq04I9yhcriP
	 9Oi5o103oZKiJi4k2c0mSfWn6lP00BF4CF2XFUl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 800B3F801EC;
	Tue, 27 Apr 2021 16:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64AC4F801EC; Tue, 27 Apr 2021 16:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DEABF8012A
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 16:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DEABF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k8jAU6DP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62933613DA;
 Tue, 27 Apr 2021 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619534128;
 bh=cfK50gneOtZ45RbcE2sg4WO2BrtfJNagZby+Gpk6azY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k8jAU6DPeMZOv/Pz6Ti06hC3MckYp36gIZ8DXlvBxhFq/KynD9ZaeinpD5fDjy13N
 goWxl1rPG5Jb8y697p3z0wempwTLfVJFdjB83X+sU9Q2CZTTpOtz9ASfUlblbCWPfE
 aQNMi26lgeo+atPWpYJosmxXy7EWBWChJ/GYEg0vT3o5aMXmmhSVftjRadqHJ25wKR
 07Iwu7RzvDXjbq7wC+GlO+XwdV8oUtg/at/URRrQ2Va0OTZd7Akq1QzkIyftiDx+EQ
 Zs75ZZbo8/NZFu9maNuJXeoXARoWKHZ+fbB9LrCokcEkSD/m4pnwhweewkkX0eYg1J
 pn9NLNjqUb9YQ==
Date: Tue, 27 Apr 2021 15:34:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Message-ID: <20210427143457.GI4605@sirena.org.uk>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <CAHp75VeiHsk15QoG3X-OV8V8jqzCNeKkif9V=cx4nvKVHaKbKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dMdWWqg3F2Dv/qfw"
Content-Disposition: inline
In-Reply-To: <CAHp75VeiHsk15QoG3X-OV8V8jqzCNeKkif9V=cx4nvKVHaKbKA@mail.gmail.com>
X-Cookie: Don't feed the bats tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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


--dMdWWqg3F2Dv/qfw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 27, 2021 at 02:46:02PM +0300, Andy Shevchenko wrote:

> Mark, are you accepting patches for v5.14 now, or should I resend
> after v5.13-rc1 is out?

> (I have few more in my queue :-)

Send them now if you like.

--dMdWWqg3F2Dv/qfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCIIREACgkQJNaLcl1U
h9Cpywf/QFmTIfBMRvWq/Nhv5gbnKzJOVq9gqwKB99JZQXRuDaSEjPcnA0NbeNDc
wDuI19G1taNfEjh0x6n/Yeft5Uh2fS5PC8ppM/I6ymzwWp03IeNn7Q/aE+7YUbR2
GngpYGWepEeuBQNPmZ9sB4CXV0+QfK9VXadc7bEtSXOm23jhYwJzNSkqsmxYHE4/
nG8yI1CX24a5LaB4cfyFxX42ozp1Xy89KQS7JdyeEkMIu59EB5SBUTSP22coCNpp
uJ10mKgiIhMHotG7gWkddqzHnNfzBZYXtRek1UhIOQz4H9lWTOYHBzEaZbgwKs5i
XocUnAmQNQmuGNY1NwovBFbrMOm7Ag==
=eyPN
-----END PGP SIGNATURE-----

--dMdWWqg3F2Dv/qfw--
