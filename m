Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94F6FE40
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 13:00:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C798E1769;
	Mon, 22 Jul 2019 12:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C798E1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563793214;
	bh=5p645AtoXi/7unMjbvM2EJE2tYgqHaXDVpULmjyzUyo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLi6c2AXc/hlyb0HyS39i8x3JohEqwPqoCwl+V+QRsIQiyqduLD1FkRSFyTXQk3IT
	 +E+s96GIQg/mH8LV15iTIl1286QmSbBHTx1jgmvoTYRu799OKE7Qe+SY7t/XhXKQKv
	 Zxo1Mp1m+InJxUcNPYfSyekLJiQrYrxzdM1MCFhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA43F803D7;
	Mon, 22 Jul 2019 12:58:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7133F803D5; Mon, 22 Jul 2019 12:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C25DCF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 12:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C25DCF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="igVvVNdh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVkK8XhUVjQkixDyVYktKeeMKIHlmnbYChBMtmcxm28=; b=igVvVNdhVOuRGxGoJ44m6pqW6
 LzPnh83/grITAdDxVJASRgS+go5u4LsYhaadtd/sUYhGm9IZUn9apRorWaobL2fkUvy5r1XLw/ZSI
 95IoQMTSQ24kNnCxr7m6TvXYQSn+vcg8i+aMWV9/L//+iA1/+1tbtW1vx9pu8Uu5wZpCY=;
Received: from [2001:470:1f1d:6b5:45d5:3055:7a1f:9468]
 (helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpW1N-0007LX-Ve; Mon, 22 Jul 2019 10:58:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3BDA92742BAD; Mon, 22 Jul 2019 11:58:21 +0100 (BST)
Date: Mon, 22 Jul 2019 11:58:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Message-ID: <20190722105821.GA4756@sirena.org.uk>
References: <20190719063302.18858-1-shumingf@realtek.com>
 <20190719164623.GA14800@sirena.org.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BBE03D@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <10317AB43303BA4884D7AF9C2EBCFF4002BBE03D@RTITMBSVM07.realtek.com.tw>
X-Cookie: No skis take rocks like rental skis!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: rt1308: Convert headers to SPDX
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
Content-Type: multipart/mixed; boundary="===============7902776512893919765=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7902776512893919765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 02:07:47AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:
> > On Fri, Jul 19, 2019 at 02:33:02PM +0800, shumingf@realtek.com wrote:

> > > @@ -1,12 +1,10 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > >  /*
> > >   * rt1308.c  --  RT1308 ALSA SoC amplifier component driver
> > >   *

> > Please convert the entire comment block to a C++ one so this looks more
> > intentional.

> I convert the comment like below.
> -// SPDX-License-Identifier: GPL-2.0
> +/* SPDX-License-Identifier: GPL-2.0 */

That's a C comment, not a C++ comment.  I'm saying convert the whole
block there to C++ rather than add one random line that's C++ next to
some C comments.

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl01lsoACgkQJNaLcl1U
h9AoiAf/auFYz4RjtbylZXfauNgPiXzsCzybUEt6/F3FPmXllUIEoyt0wrVwfSzF
ajReoiS/oo+FKuTIyTDhkqb2QkVyyBP9pYp5+JVHHj/By0YLCCafG4v0t7Gm+yP/
H+KvmNMms0uQdNmGKu8sYtcRTEyXFZhfsaKdGpDR6dgcppYE3Fx7PTDC4JX0uh3S
FX5igvVQ6YdHzDrbZkap4kIVAI+y1QP0P+lW4IR/KI5NPGJJlj5ToBrjQI6YJY09
gnXJrBfHOIyz0cbP9NMAlEgkekqwwwCtAIeGwJpS+O/yZqnUBvtkcn2VqnQa9Zx4
bt+vkavl8SMVmS5B2qGk0R+aYJQbww==
=J7vK
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

--===============7902776512893919765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7902776512893919765==--
