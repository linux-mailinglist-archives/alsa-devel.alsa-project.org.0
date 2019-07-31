Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649D7CE21
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 22:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0736E169E;
	Wed, 31 Jul 2019 22:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0736E169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564604523;
	bh=cpOAEKIdatwxXPx+GodqSKgB41glnR8ZOD+B7L+2iNw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2SOThVAHFEVlXCDf2+8UmJNNkyRZq3D5XOfgWeTRsuESXa7zT41lomAjRGobSRx4
	 LAPBhGWVxiaHUnL/lw0w6GIP+qiHnIyD+HdF5X5fcKY4J3n7J3gAomAyyfIdY1xxdG
	 I/6zCkvdBO9T8QInnGsX19SttRnZRy9jglWv7MC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 416D3F800C0;
	Wed, 31 Jul 2019 22:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED98DF80483; Wed, 31 Jul 2019 22:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3791F800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3791F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YYhiErzL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSpZl/myp0wLmres0SzdL8uz08rnblNQITo3VV+tXno=; b=YYhiErzLfdL7neEK7d0phFEhA
 9rYVeR7x7t8t6paB3ZYVvcpsMo/itLyxCB2hOJT8gnOe2xOO8iAjeWRiY7cTpKhSE6/BN2x8m4rMQ
 cSB16hNa+oZ9qF3mqcbLxgvqdCuQVoTjgi1w17GQcvLfcOoOipIPzkfbVKuqdLoY5fX+c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsv4y-0003F9-G4; Wed, 31 Jul 2019 20:20:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 634FD2742C99; Wed, 31 Jul 2019 21:20:07 +0100 (BST)
Date: Wed, 31 Jul 2019 21:20:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20190731202007.GI4369@sirena.org.uk>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <20190731141734.1fa9ce64@lwn.net>
MIME-Version: 1.0
In-Reply-To: <20190731141734.1fa9ce64@lwn.net>
X-Cookie: FEELINGS are cascading over me!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 alsa-devel@alsa-project.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-cifs@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, samba-technical@lists.samba.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, Steve French <sfrench@samba.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/6] ReST conversion patches not applied yet
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
Content-Type: multipart/mixed; boundary="===============0303284380116307887=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0303284380116307887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9s922KAXlWjPfK/Q"
Content-Disposition: inline


--9s922KAXlWjPfK/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 02:17:34PM -0600, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> > As promised, this is the rebased version of the patches that were not a=
pplied
> > from the /26 patch series because you had merge conflicts.
> >=20
> > They're all based on your docs-next branch, so should apply fine.
> >=20
> > The first one fixes all but one error with a broken reference.
> >=20
> > The only broken reference right now is due to a DT patch with was not
> > accepted (no idea why), but whose driver is upstream.

> All but 5/6 applied, thanks.

Oh, I still hadn't reviewed this version of the SPI stuff :(

There were outstanding questions about where it was going to get moved
to but if I read the diff correctly it looks like it didn't actually get
moved in the end?

--9s922KAXlWjPfK/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1B9/YACgkQJNaLcl1U
h9Bg/wf5AdzUWJa+NJteGVMxcv2AdvS61I9agmCR6mMbPERTL3lRkGvteyyk4FqS
OLlGCoSv8ytbJJ7mVGt28aBLCB7cHeDQGGmdf7OM3nJGun9yy4mmhOUIWxgjWRCl
SgO2qZpfOz121zfa2goqOfdNzbPOotjeuIyVJxvNH0NLLvRjjDZ1+4rXUjvMZf26
cVK4dXIu7+m0Kh6N6EFG9vmpNjbh23zfkd89kH8bMBGaOHdhj/3cRmCw2ZxK8Uiz
Z+xwRCyTI0CIegyUp0ZKheAqubruDFR7y0F9sYcI5KR+w0cDrfxYjOUgZa2JJKn7
Rdr1TAWXS/LG/aYR09ZGPHQsIsDKIw==
=V4AT
-----END PGP SIGNATURE-----

--9s922KAXlWjPfK/Q--

--===============0303284380116307887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0303284380116307887==--
