Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7742128F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 17:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11456168C;
	Mon,  4 Oct 2021 17:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11456168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633360891;
	bh=NG/Wy5XIrpVSoMYEmEB2A64wk7yYUtdnVHnG1Itjeb8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxgB+JaB9h8PsxdTpDFuDC5qZFS7ryAosX0umF7heBakStM0p9wevKKXGb3YrSUzu
	 aqHKtCXHzqq2ZcvoZMDG6Y6cPosxk01F4RJwOHNuwOmUYMiY0SkKrBD8LWv9UC6B6C
	 cW427DjgwXTUW3yueZktC/fXQsyutsCfOrdkwtDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CEAAF8010B;
	Mon,  4 Oct 2021 17:20:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1459F80240; Mon,  4 Oct 2021 17:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 815F7F80171
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 17:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 815F7F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fl61qGbE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B15A361213;
 Mon,  4 Oct 2021 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633360803;
 bh=NG/Wy5XIrpVSoMYEmEB2A64wk7yYUtdnVHnG1Itjeb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fl61qGbE43aaXJB16PkDauG+7QifrchZOcJ8Q1UIv0KhMEEAG0gLHD58BCtjOQDnl
 b4kCe1t5aK4K/QBK/ZgLtzMtbkh69rWWB5Tnfykf2ifdIQbEOUqUTlV6u9xxC5FPaN
 CJ6Yai/KKRHJLslXxkzTu+gWaKZ15xRmdeKobfV0kPrWZk8OhvyR0Os8Z/1/PSIMXL
 sGyDEbsA96Br6jPhRh/qv3GvoFtq29F0Q9Y8xHyIXbuSQSn9JCY0DEM6YAXSdjE5+X
 YT+TvaY8ff9UYHCoUfhAek0D4TSGQRPg3pBtde0y4FXzGhDRPrzz7sBZDC/uaPy7Uv
 SNiL2RR1AZCeQ==
Date: Mon, 4 Oct 2021 16:20:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: tlv320adc3xxx: New codec driver
Message-ID: <YVsboGxNmu1aMgS/@sirena.org.uk>
References: <alpine.DEB.2.21.2110041115070.14472@lnxricardw1.se.axis.com>
 <YVr8tqRoyyiWR4xl@sirena.org.uk>
 <alpine.DEB.2.21.2110041656220.14472@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="swq8DQvSRbS3kp74"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110041656220.14472@lnxricardw1.se.axis.com>
X-Cookie: If it heals good, say it.
Cc: devicetree@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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


--swq8DQvSRbS3kp74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 05:16:04PM +0200, Ricard Wanderlof wrote:
> On Mon, 4 Oct 2021, Mark Brown wrote:
> > On Mon, Oct 04, 2021 at 11:17:47AM +0200, Ricard Wanderlof wrote:

> > > +  ti,pll-mode:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum:
> > > +      - 0 # ADC3XXX_PLL_DONT_SET - leave mode unchanged
> > > +      - 1 # ADC3XXX_PLL_ENABLE - use the on-chip PLL
> > > +      - 2 # ADC3XXX_PLL_BYPASS - do not use the on-chip PLL
> > > +      - 3 # ADC3XXX_PLL_AUTO - use on-chip PLL if possible

> > Why is this configured through the DT binding and not via the machine
> > driver as done for other drivers?

> The reason is that I want to be able to use this driver with the=20
> simple-card machine driver which doesn't have any PLL control options=20
> AFAIK, as the .set_sysclk callback clk_id parameter is always set to 0=20
> by simple-card.

That's not a good reason to define ABI.  If you absolutely can't arrange
for your machine driver to do something sensible then you could make the
CODEC driver default to auto mode.  This is configuration, not hardware
description.

--swq8DQvSRbS3kp74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFbG58ACgkQJNaLcl1U
h9AoNwf+MRnncNdTj123hjjeS6rrwA7o+66KuwNTIk1j8OTX4DEaJpBCcRG5dWaX
1wSI+rYODNQZJSL34nqZOgAZ4g45gJdo26XUGdPfeL5VHLSRBLtHWS/xD3nHKo47
vzVHpzmie4Jy38LpiaA0iLu4/AcI/cM5i18q1f/VcnWcpXGNoEZrlrqgalOX0sLv
3kxtK3es8v2m5gWbgSXHdPdG32DcntmTy8Degr/7BHgSjq3WuGEW93IkA+MWmcpv
riEOKKdxdhp6t3cJSuOgTetce/k8kOlkNizJkDiGq/1bXFkrlBBLRv4qhjB7JRyW
F9IziIARjCeWlkg9VM/LYtjzwUO9tA==
=EbzI
-----END PGP SIGNATURE-----

--swq8DQvSRbS3kp74--
