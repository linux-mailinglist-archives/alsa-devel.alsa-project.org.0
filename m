Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBD493E55
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 17:31:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08587825;
	Wed, 19 Jan 2022 17:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08587825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642609913;
	bh=NPkrUgRYzcxwa3lnZh2dJ3qyPo1V5StcWneeKtWaOTI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hj0+GNy4EMiIF/i7Pg71uX9r/MoPQNgaWykLjPNyi0TAuzZU3UCaQzXymFTPW8J7j
	 MmDpeNOk0KIZKq4XAUyPdHEgYILCg5cdfcOM7rCfTIYvxcOHGISa55rHuCLVUwq/OR
	 AvbpOWgb5/2dr1PJE4uYw3Al+xCUVrSP9i3flRpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71738F80212;
	Wed, 19 Jan 2022 17:30:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA251F801F7; Wed, 19 Jan 2022 17:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C33A3F800F8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 17:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33A3F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GMhWu7C3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E46661581;
 Wed, 19 Jan 2022 16:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955B2C004E1;
 Wed, 19 Jan 2022 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642609836;
 bh=NPkrUgRYzcxwa3lnZh2dJ3qyPo1V5StcWneeKtWaOTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMhWu7C3B60BdL8/99pPFWzH0CB7LU7Dz7GFXyQtbGWeKeKQJEE+V2fEbRhv/QrJW
 yYagtUm7pysfgqkJMyR27/xktDwbdWcoif82n5bf4F716uAgvyW4CrM7nnlUKhGZf0
 FU8zZ8ZvZl+QEyzj+ByrVczubpcuk9CdfXWCIEjg23SntmAfLaHiquJ5KbvTGWQWfn
 Hr8GUX32FKay/k82RyllkJOyRWhWEFPpRz5SEs7TiLsMcVgix5+RDcoF6No3Mm8HeE
 dgP9NlrSSG2qLfoDBPumyLb9lbK1A0ADtU3DkLXQ9hZS91Urze/uzDqpkaas6/c5dZ
 OCMIIrEVF0X5A==
Date: Wed, 19 Jan 2022 16:30:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Message-ID: <Yeg8pWYUwWKqOjhe@sirena.org.uk>
References: <20220119015325.2438277-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pa3KE12yHs9Xnd2D"
Content-Disposition: inline
In-Reply-To: <20220119015325.2438277-1-robh@kernel.org>
X-Cookie: This bag is recyclable.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, - <patches@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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


--pa3KE12yHs9Xnd2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 07:53:25PM -0600, Rob Herring wrote:
> For a single pinctrl mode, it is not necessary to define pinctrl
> properties as the tools always allow pinctrl properties.

Acked-by: Mark Brown <broonie@kernel.org>

--pa3KE12yHs9Xnd2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHoPKQACgkQJNaLcl1U
h9CK5ggAgSoOi6gEd+9fFCP6FCxOQatzUUojOHSGhmWyvIDZNwu17IQjUqhzZ5Lk
8Z9Or7iFzVcEVfaKQ0w1HRWHQIrPLjnGtm1pnD26p3iqmdDC/1hDvKb/kd7EjOmF
NEx6LRQoJL0LQX9I/c8rkwoW5mXpxaBck270IlQAaOI5/iOQFHp2oDn02Csbli0e
XtJH3S6dPtjKQN/+SC9ruVF3usw6u4Vxi5FNXA1ABQYeKP+4/lyft2SWzGZEShhy
Kmn6JJCH6fa4Aqbz85d4dpvuG9t9ukvdK8zrRCpsH2xw8AlHDeJtcDG6/LXw5hPG
u+NgtzFSWl0tPBvoyeSNpNi3YEkbyg==
=vG1Q
-----END PGP SIGNATURE-----

--pa3KE12yHs9Xnd2D--
