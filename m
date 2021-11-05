Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4D4465EA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 16:40:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A111B166F;
	Fri,  5 Nov 2021 16:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A111B166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636126825;
	bh=n+X3HnJrn5I94lNBI4oN/v0sCIelBvNfe55+cq90v10=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bg7HuOv6RpRYps8tUzxKPdWfJ6RvBwL+4y+lrckgmui3k3c40xFl+/qWtw6Z/1e1n
	 Vmv+anErhY0AoOs76WfCn54vcWFm7ic/bgO9Jdh9BV3KIWeutytyq8PWrh250x01+/
	 iBTVInhLvr8SxeCXEgXPq8uGW289trhaRo7PDoMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2097F80279;
	Fri,  5 Nov 2021 16:39:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78DC4F8026A; Fri,  5 Nov 2021 16:39:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1589DF80224
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 16:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1589DF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e9Ucd2v6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89AC261262;
 Fri,  5 Nov 2021 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636126736;
 bh=n+X3HnJrn5I94lNBI4oN/v0sCIelBvNfe55+cq90v10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9Ucd2v6QRgwynLsGWWjsZ9DrN41cZWBcOU3fmyszspj5juzbIaCUnMbf1VmMIF6N
 OXBBbWMH3izsCDC59sQJOPq2RS8zSwSzK68HNT0IBbJbb/WvBHajwwZprNjtSw+IxC
 JAhLQ+Vd+JZKdQPaG2yuM3b88Mzm9RcoUcmXndlzWT7j0Wbcvuuqhs0gpa3rnfL+yC
 usnFsjkkMEWgP0/fsohMi+zg9pr12EzyHT5R2ZTg8G7Xj86kBwRLDN62oJ00nXm0Qj
 XRuz5Nz9l67rfJqK8ypCHB9i9HKcJpwenJLCPNjFtcszgAcvs2I158u20QJm1vJ+2Q
 CfNcVtRNRxzrg==
Date: Fri, 5 Nov 2021 15:38:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
Message-ID: <YYVQC7KLZx8oxdXT@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t/JfaRmZozyWm9hx"
Content-Disposition: inline
In-Reply-To: <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
X-Cookie: For recreational use only.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
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


--t/JfaRmZozyWm9hx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 05, 2021 at 12:11:55PM +0800, Trevor Wu wrote:
> On Thu, 2021-11-04 at 15:39 +0000, Mark Brown wrote:

> > I don't follow why the DSP support requires a new driver?  Shouldn't
> > all
> > systems with the DSP present be using it?

> We need to keep the solution without DSP, so we can replace DSP
> solution with non-DSP when it's required. But when we introduce SOF for
> DSP control, there will be more routes in machine driver and device
> tree usage is different from the original. So it's hard to share the
> same driver for these two solutions.

We shouldn't be requiring people to load completely different drivers
based on software configuration, what if a system wants to bypass the
DSP in some but not all configurations?  Can we not just have controls
allowing users to route round the DSP where appropriate?

--t/JfaRmZozyWm9hx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGFUAoACgkQJNaLcl1U
h9AcIQf/UzpTAAC3VR+zMJZTNX3wEOw/Bi2D9vxmvTBGIwB7G/FlETQmVwaUxECA
azgmnw3jnHqEQO1aNTlkf5su9mzgHkUuQTiNy0AHeQwBcxSmOk5xad6W2mTurLbf
GexsEap8koTYYrIGYaD4DkBef34y5WcEnMmm2DS9lHcpAge/XD9agMmB5QrH3PWR
dcLcfVzHVNGSZbGd6Woxi7xb8Y9wciaFuMyyEcl5YNbXpJO36x/rrxOOA5Okv2rD
McStZ5dJaOvw1juc+ndps1GwyfUSTKFre0NjTSFAVGOelVzIfL9vmIYIqo/pm2/7
weWT+28cmDv+DuB48D7CT5v1QGs11w==
=sW00
-----END PGP SIGNATURE-----

--t/JfaRmZozyWm9hx--
