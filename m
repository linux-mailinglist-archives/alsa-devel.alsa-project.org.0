Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 667BF50A101
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 15:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBB671934;
	Thu, 21 Apr 2022 15:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBB671934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650548462;
	bh=nWbtXgK7/CVegeW2Yp7MomHizbpndd2rroiTXzZgDXA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFPG03r/9FDhsUXJ3ZXdeq1/se4UXWLVMXBmGQGSPCUEuAOWRlPtIi/6e4NfP8hj0
	 x+A3TekzNo7L5eyAFd4CeL7dR5Zl24u8tK6fiV2ykVslRKp8LlhV0N6LTmGkGWb9lA
	 lH7EklRLg5Nx4FUFdDyG3cdbqwQRcJCipP/xCCiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F3AF8047D;
	Thu, 21 Apr 2022 15:40:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23C16F8032D; Thu, 21 Apr 2022 15:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C01DF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 15:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C01DF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jiDzyyT8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0178E61D23;
 Thu, 21 Apr 2022 13:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC244C385A1;
 Thu, 21 Apr 2022 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650548392;
 bh=nWbtXgK7/CVegeW2Yp7MomHizbpndd2rroiTXzZgDXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jiDzyyT8qU+iZA6jW32vAyVa9E2jxCWbxPzyGK7LCNFZC38nkUT1TrmKkqx8v7IDq
 r65/vpafLxmncUa4Re6PmvU4of4ifUIAPqiv4NpHlumxPK1bD6sFiJP5GFu21bZo8n
 gMg1TMIvmca/vHbW8vdohgirEcIc3IwsmoZKPnPK/jEWIbhY8r2/81Adtie6AybWzl
 EKYyxnDZuLNX1LurLOPpC9qECNk40uB8yKuuHWtG6Oni93WygbjHalxK7pmIZUvWq8
 PifXauKBZAI45K8m9uJ+o3NkO8ldohaX8qWfRSNHmbv2t0N4Ov0CyPOjq7kZ2K2UaX
 9tYsLgA5XV+Qw==
Date: Thu, 21 Apr 2022 14:39:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Message-ID: <YmFeo7Hv3esVrBiY@sirena.org.uk>
References: <20220421123803.292063-1-broonie@kernel.org>
 <1j1qxqzi7g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IRsXJuFlEl6v5jNa"
Content-Disposition: inline
In-Reply-To: <1j1qxqzi7g.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Two percent of zero is almost nothing.
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org
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


--IRsXJuFlEl6v5jNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 03:02:54PM +0200, Jerome Brunet wrote:
> On Thu 21 Apr 2022 at 13:38, Mark Brown <broonie@kernel.org> wrote:

> > I'm also seeing other failures due to these
> > controls having invalid values, eg:

> > # # AIU ACODEC SRC.0 value 3 more than item count 3

> > but without documentation I'm not sure how to interpret/fix these -
> > either the value should be fixed up on startup or there should be an
> > extra value there (disconnected possibly?).

> Value 3 is an I2S input from a block we don't support.
> If we did support it, it would be an hostless DPCM BE to BE link
> I'm not sure how I would represent this in ASoC TBH :/

> At the time, I thought it would be easier (for the users) to leave this
> value out and not give the false impression that the path was somehow
> supported.

> I did not realize it was the reset value nor that it would be a problem.

> I can add a element to the enum if you think it is better have it
> regardless of the actual path support. What do you think ?

I don't have strong feelings TBH - your argument for not supporting it
for now makes sense to me and we generally try to avoid changing the
hardware defaults.  Probably I'd go with changing the default but since
it's a valid value in the hardware it's most likely not too bad to leave
things as they are for now, though there might be some applications that
get confused and explode.

--IRsXJuFlEl6v5jNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhXqIACgkQJNaLcl1U
h9AI+wf+O/j6H4Bh5gXdaKnAexY6uJMSHxus/ShhK7Siy1vAUIPIPhuc3vfSkR5+
+MdsaSQ+8itIG6S7RgQU9WKwHyy1tYWfNHlGPhNx3qUbYpSWtmygstYqvR1oOe3s
mqrGFxDatfT6ZWkTbTnMIvLYftVW7vx3sZl5bdxLSPOXC0O3O++RA5vESItn2pJd
eyyWYOfOH0q4QUgONEWvg3bw9j9vJFojCwafYY645X1gnYItWVBHf827ymCPaCQY
CWm2P8UwbLxoIlCqj9iCd8VHbnzyOBcAmjBeilFpjT28fpH+NLWMS3j7tw+Srcgi
FTVZtXP62Hq0P5ZWWXfcn/4OHG3JJQ==
=fjbl
-----END PGP SIGNATURE-----

--IRsXJuFlEl6v5jNa--
