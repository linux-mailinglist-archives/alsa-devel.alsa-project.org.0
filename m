Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84637A9B2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54BC817D9;
	Tue, 11 May 2021 16:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54BC817D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620744022;
	bh=KtAqqyCSD2/PMLUzMvk41vJZrkttmXflY20N0F0OLzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nla2QRwNXH+W11jYGVaFKwaH3oc+EE3tvp29C5bhDq2WTFJVt8sRafBzYp2PgVTBL
	 1/iOT5R9nDYxz3JlYurD5iypu0JedonOn0V2nP6+HAgaIrP6UuEv7quA5vn7B4pO3T
	 JbHcjYYDm0PGtDI6JtEWLzIKxbFfjeicqiK2b6no=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B84BAF8016B;
	Tue, 11 May 2021 16:38:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73172F80163; Tue, 11 May 2021 16:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A501F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A501F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ukIHJxTA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A295A61285;
 Tue, 11 May 2021 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620743928;
 bh=KtAqqyCSD2/PMLUzMvk41vJZrkttmXflY20N0F0OLzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ukIHJxTAu5BdyDy26nRYBGqWvO3onyx7l0X21OdTqi/KlZyTduAn7XWowP0CAfu8+
 OG2eO1SymeMJJ2M5tPKX7UHkxkKMxXhkWbI6Koo7CfA4VdbJDMlyNmdvkJGVGkPItc
 hpxmcumSirQkUGhj6Q3/yC+RYRwsfQ4M/j6rembcWbJXFPEzX5TG6uL1OC4HWfUgD1
 6Qv547lGeds/8lxChC8e6pdfWd6bs34hQbk5H7IsRbEIEs8voSbRPQwRYqwd/PBxE7
 n4/py/eF1XXlbkiSg0Sbq6mM42PNLjoOk5aOk6TLIJWMHNurtOPHTXQ0oLTUfxX3lJ
 3W7ek9xxUWNLw==
Date: Tue, 11 May 2021 15:38:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Message-ID: <20210511143807.GL4496@sirena.org.uk>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
 <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
 <YJqRBIdTlvnsCYsn@smile.fi.intel.com>
 <20210511142433.GK4496@sirena.org.uk>
 <CAHp75Vfh4AViMMSm6MKAGP7s_ANOSyHVDj5qG=j5YrLPjH+Y8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline
In-Reply-To: <CAHp75Vfh4AViMMSm6MKAGP7s_ANOSyHVDj5qG=j5YrLPjH+Y8w@mail.gmail.com>
X-Cookie: Beam me up, Scotty!
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


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 05:28:13PM +0300, Andy Shevchenko wrote:
> On Tue, May 11, 2021 at 5:25 PM Mark Brown <broonie@kernel.org> wrote:

> > Please stop.

> Okay, what should I do?

Nothing.  Just stop sending this out until I've had a chance to handle
the current version.

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCals4ACgkQJNaLcl1U
h9BEtQf+LrhwInOnS02oNHeKCYITflUNiWjMOxLrG+jowVO1vmSX1VMcMXPGKoA+
xfs2m2RZaDqieSsFszwMuwVsHPcG2OrApe2Je7lEihLv5SLkZWozt5o3ocNsQCoM
kBLF8siXnYB+nTrhMRLqu06h/1XW7dxYaRJp/XB2ABAaAcEOdMy5OxmfR4AkqtCG
IhoyzcLWMNpOqV21a+r1haRcIafy8ceaPXl+MVECP/HjLQ9N3VUiE5pnDvROOgz9
e7bIo2zelMSwERb/zjpROKo0c2ExluviDv3lWbySNmU65wRbAbHcJs/3xJLJGXyw
x0zHMkSCpa/eIkDqym432py3P3Y5fg==
=JIiX
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--
