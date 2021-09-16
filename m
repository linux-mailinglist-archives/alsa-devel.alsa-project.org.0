Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A840D9EB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 14:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B78E186C;
	Thu, 16 Sep 2021 14:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B78E186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631795275;
	bh=mfX29/di/xilhJPTUe/47Dt9l+sLXh8n1/Bzm8nigXo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxlOQllWVZ+sKxkgiM10ytYiUpwv0IExk9B+xXRTRcAkDVWTqv5LTU/j53W41qS0l
	 KP3lN2HNlufG5dpUaXnQmGIcgX8IVbCc4YQvxd7dFU2WuhoD5IiDca9C6FlhgtNvw2
	 wGsBZA0zngdvux150oIkSLrDNmo/CQCOiXtuKB8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F57F800D3;
	Thu, 16 Sep 2021 14:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48B43F8025E; Thu, 16 Sep 2021 14:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D335F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 14:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D335F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dot7UTFG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26EA360F25;
 Thu, 16 Sep 2021 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631795190;
 bh=mfX29/di/xilhJPTUe/47Dt9l+sLXh8n1/Bzm8nigXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dot7UTFG9z5RDoKt9YwghU4gkD4y/1MEbPdmOHoSGOeFeQji17JwBeN4q3v3btsll
 KjYI9NO8L81+jJYoA3/jm81mU0MgfS6GoThC/wrSXbfjXVWKnyEt3ACq6ylbFiw+Oa
 2dd/mbMaYaFyYpP0cwWTNRGJcZnoZY+YOrDEybg5aEKgEflxSVHSycN1NW3s98A17/
 QEb7g5+IoM+MrG/lX8TzMEELRy7gCn6wvNQMN6MComagWtYo/VixmF8TN+o00lA0I5
 dG9SGeD13axlKcBfB7jyvb68L8mgCHFwQLw2oqTuBOB+6rZnOUbJdwNj1qistYfVzG
 0gwbWdMYlARow==
Date: Thu, 16 Sep 2021 13:25:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Message-ID: <20210916122549.GF5048@sirena.org.uk>
References: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
 <20210903231536.225540-3-frattaroli.nicolas@gmail.com>
 <20210915141012.GC12513@sirena.org.uk>
 <42974939.Tn3hggVSkZ@archbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline
In-Reply-To: <42974939.Tn3hggVSkZ@archbook>
X-Cookie: We've upped our standards, so up yours!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 07:06:14PM +0200, Nicolas Frattaroli wrote:
> On Mittwoch, 15. September 2021 16:10:12 CEST Mark Brown wrote:

> > Why is this not part of the normal bus format configuration?  I don't
> > know what this is but it sounds a lot like I2S mode...

> This affects all TDM I2S modes, i.e. TDM Normal, TDM Left Justified and T=
DM=20
> Right Justified.

> Without tdm-fsync-half-frame, we purportedly get the following output in =
TDM=20
> Normal Mode (I2S Format):
> (ch0l =3D channel 0 left, ch0r =3D channel 0 right)

> fsync: 	_____________________________
>                      	            \____________________________
> sdi/sdo: ch0l, ch0r, ..., ch3l, ch3r,  ch0l, ch0r, ...
>=20
> With tdm-fsync-half-frame, we purportedly get the following:
>=20
> fsync: 	_____________________________
>                      	            \____________________________
> sdi/sdo: ch0l,  ch1l,  ch2l,  ch3l,   ch0r,  ch1r,  ch2r,  ch3r

> At least, according to the TRM. I do not have an oscilloscope to verify t=
his=20
> myself, and in the following paragraphs, I will elaborate why this seems=
=20
> confusing to me.

fsync-half-frame is just normal TDM for I2S, the default mode is how DSP
mode normally operates.  I don't know that there's any pressing need to
support mix'n'match here, you could but it should be through the TDM
configuration API.

> So to answer the question, it's not part of the bus format because it app=
lies=20
> to three bus formats, and I'm completely out of my depth here and wouldn'=
t=20
> define three separate bus formats based on my own speculation of how this=
=20
> works.

It is part of the bus format really.  I suspect the hardware is the kind
that only really implements DSP mode and can just fake up a LRCLK for
I2S in order to interoperate.

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFDN8wACgkQJNaLcl1U
h9AhiAf/ZlfcZ9ejEekSn1zn4A88+/ZgbySK7f6ieclZDuSJ0PyYj0x6VN5f+p8U
UrfT02ie6+dpCTcQHVQtFcJx5+BN5N8WoBidKDS0gAN3W8R2i9LvWGw8z9wT6tKS
KCnSoIL4Gr0ZQ/556y5vIocYG7waZMOckP6/ZuIjBewEH+j0iV34b7uT54kDbfXA
JLi2Y6LDveRJbnVsJ4EK4cLgmxHDfjmirUiAjvrWvTcVUXXZDQ1qXalGDFX/ZEFq
RzP18+TUX33qEgF1UApmZEIOqSCHst3po+sy1xkpZlOvTzcQAQLaZXMm9PulSx41
Aq2b/PrIEwOcL8Kc4GfCeW9YoGOm3w==
=u+Qx
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--
