Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756531D2C5D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 12:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5482166F;
	Thu, 14 May 2020 12:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5482166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589451507;
	bh=6Tu3XwoQsW+jvk2j/hmdnVuJyzrVZujLB9szn1NBVnE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X4VPTOTK3XSMCLM6ClEsiwd/3tsB0opVkBviypG1WfjSbHCXmSSg/M6Tt7Ab62yvY
	 I7t+q+5e3mWmhipdL0f4NTrvfIKC4DstdU2sgENJHV/HAGiqmT2qwh4OWyvkRe1YMZ
	 gNnkxEMj1V6zyvNszpG5fc3dJ87RpNI9t1OGwCYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB9E7F8015A;
	Thu, 14 May 2020 12:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F21BEF80158; Thu, 14 May 2020 12:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93429F800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 12:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93429F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yq7GRQWA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5FE42065D;
 Thu, 14 May 2020 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589451394;
 bh=6Tu3XwoQsW+jvk2j/hmdnVuJyzrVZujLB9szn1NBVnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yq7GRQWAZvtUVCiIohiZMr6jTql7w8zDSii/4xvUEmTZ3H2efmW1yveK+lfmm7DVM
 06pgXgfS9fTXpT35jXDiOOmEPhbAQ9HlfZHeePextM6PFVHCuD4XNhWRBSl4NjC6Ln
 fgzMslNOmCj1hoV7529C2qdv7kwG+YZ3HtxdCgWU=
Date: Thu, 14 May 2020 11:16:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [V3 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200514101631.GB5127@sirena.org.uk>
References: <20200513074523.21086-1-steves.lee@maximintegrated.com>
 <CA+Px+wV7o1P41ZdidpwNFtwWL1-RYcwV3dU9R7PG+66k1L_p_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <CA+Px+wV7o1P41ZdidpwNFtwWL1-RYcwV3dU9R7PG+66k1L_p_A@mail.gmail.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com, Liam Girdwood <lgirdwood@gmail.com>,
 steves.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steve Lee <steves.lee.maxim@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, geert@linux-m68k.org, dmurphy@ti.com,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, nuno.sa@analog.com,
 rf@opensource.wolfsonmicro.com
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


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 03:31:52PM +0800, Tzung-Bi Shih wrote:
> On Wed, May 13, 2020 at 3:47 PM Steve Lee <steves.lee.maxim@gmail.com> wr=
ote:
> > +++ b/sound/soc/codecs/max98390.c
> > @@ -0,0 +1,1030 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * max98390.c  --  MAX98390 ALSA Soc Audio driver
> > + *
> > + * Copyright (C) 2020 Maxim Integrated Products
> > + *
> > + */

> My previous comments on Gerrit may confuse you.  Please use C++ style
> comments (i.e. // for all lines) here as the maintainer asked.

> Mark, may I ask why we need to do so?  Is it also applicable to header fi=
les?

It's to make things look neater - having the two comments immediately
next to each other doesn't look intentional.  Header files require a=20
/* */ comment for the SPDX stuff so should do that.

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69Gn8ACgkQJNaLcl1U
h9AqXggAhm3L2eRyNG6E19XxQRco+G0tJt1EnQCWdxI1Pix4/kWDCHbEgxXaVM/S
9wlvtdMtoj8qNEOZbRxXGp+PPc1W6ycRd3e88CEm5do58fsVV+Dt1bHRY99IkdbH
QkYD65uS8mkjpynhTCASvWPD2FnkHDTtp/3WYGQdmT4yUvUc/GPaySbEr7pmij8O
qLLn6Ul+rexrjGs1b7yG+UxwYu76LEHH+Dsp6ZDCHK1EkQXr+r7F95Ha+vJKwOp+
A2prkPEQVFZyQ3hGA8TeHBGfY820SKoBerIHZyav5G59GfUYiGNtnRpgG54YylQ0
dmCDcRL6qUOt21EOH5Y8qQG1vNQwqQ==
=6iKp
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
