Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A313D3FDDE7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 16:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E0B416CA;
	Wed,  1 Sep 2021 16:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E0B416CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630507319;
	bh=gW7gQRqtu48//sdUXUb60qqTbaW4Xb1X9H2hO7nOZ2w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1hVhMdxTTS1oIGz0LLFoES5gbLu2rbfhM57Su1RSLlIfJWmayDguiseuoB8v0qye
	 n+Qi5d9xFhZfVvOYkaOtrZWfzxr5oxX1qTipJjeVqGW2UFwLy795PeJyvUawkfNhTf
	 /OoLZ70aw0mQh6PTiyT5KIjsGbhza+3r2kHkp13Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E5DF8020D;
	Wed,  1 Sep 2021 16:40:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F0B1F8020D; Wed,  1 Sep 2021 16:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECBAFF8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 16:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECBAFF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mO8SBRhB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FD236103A;
 Wed,  1 Sep 2021 14:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630507225;
 bh=gW7gQRqtu48//sdUXUb60qqTbaW4Xb1X9H2hO7nOZ2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mO8SBRhBWVI0fL76IzyqQYUKgUOKn6KUgUUThnriQj5Nd97FL5zYL/YhqJCVha6s4
 zv18x+pUY/CcF+e6WRd2TJMbLxQuenGKiH78xj3BuA5ZxcIUSd2Z1FBTofmHdiySDV
 ZkmcrvtRsW3CB5Cg8HBIUg2oxi6HLLVhf0UaMjdxlQG58uQsK996ppMIr8aCsdxdGU
 3ZIKJDYdAqmYtmuG4Im+lTBIb1RNbbXSoQfPUV574QQfVBM1lXrCr2XPEOQPCgAQi+
 HAw2kbpAkW7VB+n6sw+fnUR44Vu6o1gp9pWyvaB+chmbt5p/QfNcG6oPdc87F1jgpc
 4REP9xj23chAw==
Date: Wed, 1 Sep 2021 15:39:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 01/52] ASoC: dt-bindings: Add WM8978 Binding
Message-ID: <20210901143950.GE5976@sirena.org.uk>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-2-maxime@cerno.tech>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, patches@opensource.cirrus.com,
 linux-sunxi@googlegroups.com,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 01, 2021 at 11:18:01AM +0200, Maxime Ripard wrote:
> Even though we had the wm8978 driver for some time and a number of
> boards using it already, we never had a binding for it. Let's add it
> based on what the driver expects and the boards are providing.

What's the story with dependencies here?  I don't have a cover letter or
anything and there seem to be a bunch of tangentially related patches in
a series here.

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEvkLYACgkQJNaLcl1U
h9COjgf/fijxSc6om+F3lPh/ILpcm5YNkeHiwuGd2TmlFOi6zDZeXDwiybEHRkbH
ZmU32/tzm9PAR4yOJi4KNUojOtJTFF3leZ8aEsxzdHzcfIeYUabUIDQOaK/MhxvA
3je7g87V/sSKnH42SWdWlXQRedNYqIsgldGiaG8yBqqK9RKoKv+GXUONjeMolCiq
i7faNvg1DcfxdLGT7SOL42eQNNPUr7/Dn9hP+mDapYMQ644tY2/ShqzCOr1tMmvi
ylN1/xe8BdIZCLKT8O8Swu5s6lYDCw+BFPA4ZBix0fds4G+ANU63U8XMDfE9qHKh
aETbtlWwCRiqEAYQtlX2hvdmz6Sr+g==
=Z6PP
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
