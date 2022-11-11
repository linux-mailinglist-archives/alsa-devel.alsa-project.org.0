Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8A6259CB
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217A920B;
	Fri, 11 Nov 2022 12:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217A920B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668167435;
	bh=qSBF/ECZfbRTbQB9J8HIoNk5t+QvNMgL7PClSWUYqHg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/4Gc5UvF8rwFQb3Ihyj7Yx4jkN7s17w2mnWlNPre3pQTwUGTapGO5LKxkERubbna
	 kAot0rY0f/S1ctJm84DaC9ZjpW3orZv7ZDX+z9P2aqPpWaWkW4YVtLGpg5vQ+jLO5U
	 xgauqbqfuRXe7aKRwrdAp01DwahNPJWPqIHdilTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD8EF800CC;
	Fri, 11 Nov 2022 12:49:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3012F8028D; Fri, 11 Nov 2022 12:49:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B92F1F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B92F1F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bDIzMdHf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02222B82417;
 Fri, 11 Nov 2022 11:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3279C433D6;
 Fri, 11 Nov 2022 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668167371;
 bh=qSBF/ECZfbRTbQB9J8HIoNk5t+QvNMgL7PClSWUYqHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDIzMdHf8JocXoaBMAdhZfvVkDbL8LWt55WECcKB2Aj7sGpoJ/Z1nK1+s6BvDOyxP
 6ljjxNPHydGcoROQ7RP4oeTNKFHeQQfWsssQGZS54zMriSX9rojgnr3Lpj6+1c8Bxg
 Lzw09yIadbQo7BWkA2+H08Vkwtl37yId4GXoZisap5zw5SIpoW11AEJ9s595Ztqa/J
 FdvOI9s06XauojJxWqftvcjCaZInONfEh6jwSH9CEfSXzCxiGWH51iSpnbo/8NVPGI
 lbaKylLSc8P/Czb+YHXPh70zYtCVVq1j5SN6QFSOVMLHqpRwq/BEJotuYV1/cB/9F+
 DRC1QAsO/0jWQ==
Date: Fri, 11 Nov 2022 11:49:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 09/12] irqchip: cirrus: Add driver for Cirrus Logic
 CS48L31/32/33 codecs
Message-ID: <Y242xYJQMC2JlMtH@sirena.org.uk>
References: <87mt8zutib.wl-maz@kernel.org>
 <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
 <86pmdvow5y.wl-maz@kernel.org>
 <ef60cbdb-f506-7bd6-a8e1-c92b6963a0f4@opensource.cirrus.com>
 <86k042q1uc.wl-maz@kernel.org>
 <05ae0e20-b472-f812-1afc-ef8c2a97cdeb@opensource.cirrus.com>
 <87iljmve87.wl-maz@kernel.org> <Y21gwGDb5CFft0kp@sirena.org.uk>
 <87h6z5vs39.wl-maz@kernel.org>
 <20221111111611.GH10437@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GX9PH0gqSEqgaksu"
Content-Disposition: inline
In-Reply-To: <20221111111611.GH10437@ediswmail.ad.cirrus.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Marc Zyngier <maz@kernel.org>, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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


--GX9PH0gqSEqgaksu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 11:16:11AM +0000, Charles Keepax wrote:
> On Fri, Nov 11, 2022 at 08:00:10AM +0000, Marc Zyngier wrote:
>=20
> > > ACPI gets to be a lot of fun here, it's just not idiomatic to describe
> > > the internals of these devices in firmware there and a lot of the
> > > systems shipping this stuff are targeted at other OSs and system
> > > integrators are therefore not in the least worried about Linux
> > > preferences.

> I would echo Mark's statement that going the way of moving this
> into DT/ACPI will actually likely necessitate the addition of a
> lot of "board file" stuff in the future. If the part gets used in
> any ACPI systems (granted support is not in yet but this is not a
> super unlikely addition in the future for cs48l32) we will need to
> support the laptops containing the part in Linux and the vendors are
> extremely unlikely to put internal CODEC IRQs into the ACPI tables.

It's a bit of a stronger issue than that in that it's not how ACPI is
usually expected to work (it draws more from the PCI model where you
just get a top level ID from the device and have to figure the rest out
yourself).

> An alternative approach would be to actually represent the MFD in
> device tree, I think this would allow things to work and look
> something like (totally not tested just for discussion):

That's what Marc's pushing for - there is an idea to do that which works
well enough for cases (like this irqchip for the most part, modulo how
to handle the top level interrupts for the chip) where the way Linux
wants to model the device maps clearly onto the hardware but like I was
mentioning with the audio/clocking split it gets tricky where things are
more up in the air and potentially changable since it's much harder to
define a suitable ABI.

--GX9PH0gqSEqgaksu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNuNsQACgkQJNaLcl1U
h9DtIAf/aeBQQ3Lh5zmka+uBR54WcnQfWacUGj+JM5RC6CDwQ1Prz7UJd1YrZzbz
NA5etQWvjvbCh/1Y+cn8KSpiNiKrNJmhVZOkqNehoPWPcyKFBbVKLhL8mRY5tk2f
xPJkQ/MxrOFacsGRpkStfSZPew2Xt+cdIBOIN7vhww9+NHMsnGmx4xLjZc5tltpA
BA9WFjV/yzMxgE2UiJYIX8QMZ8i3CftDNOIUS9KN2cXAqNa3S/+Nuxon5Qrc5Rmd
07eq77gLTHoy0syRlbyDOjD24wVosKRomLl/B+koqEy5ZUJxjZz0W9IDllZ9fIKo
B2IEu3AcIwLVXpeU0pwDN7OY6FCdFA==
=Ljlu
-----END PGP SIGNATURE-----

--GX9PH0gqSEqgaksu--
