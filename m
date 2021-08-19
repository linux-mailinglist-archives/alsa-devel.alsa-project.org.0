Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE153F1B75
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 16:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A241167E;
	Thu, 19 Aug 2021 16:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A241167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629382688;
	bh=0uMlC15O+oh23cQEELPSg5hsjxTkiutg1Dl14TuNA2s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=et0AzTTPSQWTm4j6uO/2lvJpSaqYguFU352b/w7RSbNECJoJgbRn74H2CgptItOQU
	 dRPyNsBlRuTOzqtxy7Jw2XIC+wOqoC6uf/2HCB9FNinibzE7uJSuKfvorQc3lX5qPy
	 irrQKAifnH+Tz5w3KLtZGiEJBfqLd1w6OJY17Okg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A8BF80272;
	Thu, 19 Aug 2021 16:16:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B0A5F8026D; Thu, 19 Aug 2021 16:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0531AF800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 16:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0531AF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uFfLWw0X"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93D20610FF;
 Thu, 19 Aug 2021 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629382602;
 bh=0uMlC15O+oh23cQEELPSg5hsjxTkiutg1Dl14TuNA2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFfLWw0XVYjN0YeCEeOw9d34neLFdGyTTycyb0AKBzkKwvJw0RaJfoxI34JSe3WL1
 r7GynOaqWvGHOGOvkhdR9yJ3VjEseQ8pGl1iwhmQ2ZVJwwnIkEojsezZkpmygbrq1i
 tU0zLeemaItq2qGwl4K/aWVCqzotZmIj21bza5ql2ZhSMAQw4Lych1rGy7qrZ5k9x+
 i0249dOb5mCdV+lZ9eACZkjoYtTEEFCSo7DrjEYv56L9+y5jHdva/0+A6an8OgIpby
 zGnrg0Hhvmjh5dk9JY0eln2pqlu+HrE9B8y+I1r0cIkLuaOnyfZQisIMx6ph2kOnpN
 Tay5NsPYPQRcA==
Date: Thu, 19 Aug 2021 15:16:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Message-ID: <20210819141617.GM4177@sirena.org.uk>
References: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
 <20210817101119.423853-3-frattaroli.nicolas@gmail.com>
 <deb50900-fcfd-23d0-ab8a-0e64b2abb063@arm.com>
 <2412250.zZEsDtmPgG@archbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yklP1rR72f9kjNtc"
Content-Disposition: inline
In-Reply-To: <2412250.zZEsDtmPgG@archbook>
X-Cookie: She sells cshs by the cshore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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


--yklP1rR72f9kjNtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 19, 2021 at 03:52:55PM +0200, Nicolas Frattaroli wrote:
> On Donnerstag, 19. August 2021 14:08:36 CEST Robin Murphy wrote:

> > > +  rockchip,no-dmaengine:
> > > +    description:
> > > +      If present, driver will not register a pcm dmaengine, only the dai.
> > > +      If the dai is part of multi-dais, the property should be present.
> > > +    type: boolean

> > That sounds a lot more like a policy decision specific to the Linux
> > driver implementation, than something which really belongs in DT as a
> > description of the platform.

> I agree. Should I be refactoring this into a module parameter or
> something along those lines? I'm unsure of where this goes.

Why is this even required?  What is "multi-dais" and why would
registering the DMA stuff cause a problem?

> The particular configuration may even vary per-board; an I2S/TDM
> controller may be connected to an external codec which does not
> support capture, whereas on another board it may be connected to
> one that does.

If the external device doesn't support both directions then why does the
driver for the I2S controller in the CPU care?  The constraint handling
code in the core will ensure that nothing tries to start something that
isn't supported

--yklP1rR72f9kjNtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEeZ7EACgkQJNaLcl1U
h9BLTQf+NFP6G5gxloO6mI1KjGRABdmwB01kioQ+Wrt6Vw3VwRA/5Obtl1XcwDU6
sMmqKjIMhNgfSvDKESHfSDL7E32hYMKUMOXCpEYW2pCEjN2hEbdxVwP+hbIdsmel
z+z+ISyW3zl6K1ndvLbeniqwEZOsGNiz1EUvTygFCMvHdd9Yuory3/nufj92owBJ
RgRiuIZJ52nPD1hdPQY1MRpP+Us3DaP8RNHLrF+FlZVtaj/hPftEwt62oTCNI0KO
iQv81p2ueGYvqIVzD50HGC7sSc5pB2iU3VQ72XlWusgkLYdU22rbVvXGZWSRoaq1
w8aXvCnwvc8ml4d7ZG4ROXBHzoY2oQ==
=/YEY
-----END PGP SIGNATURE-----

--yklP1rR72f9kjNtc--
