Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9074D44F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 13:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43BD76C1;
	Mon, 10 Jul 2023 13:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43BD76C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688987472;
	bh=gBzc2tZIawZS0PUBWYuNntkIVRyxrqJrpV4aYLufX50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jFY5dSALe/14xF/GrW+jxdXflHrBl+XK66pEfHT7s/BotW76ghbthHZeYpwTnsROj
	 La99Jf8FoEsVsxUdRQ5s2wv15ybBVEzUHbirvigpBCFRvCLbsDwDFBhRgWnAkUTqjW
	 dN1e2L1/hOTLxdnwUrqddey/U5SG8BFkfV6kEZLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 105A1F8047D; Mon, 10 Jul 2023 13:10:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95913F80153;
	Mon, 10 Jul 2023 13:10:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B029F80249; Mon, 10 Jul 2023 13:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2AD6F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 13:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AD6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YCpsYi8h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AAB360F99;
	Mon, 10 Jul 2023 11:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE7CC433C7;
	Mon, 10 Jul 2023 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688987414;
	bh=gBzc2tZIawZS0PUBWYuNntkIVRyxrqJrpV4aYLufX50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCpsYi8hZ5dhRZJo2dzz+GDrlvZ3y3Af66p3CIYUZn5Y7dTwO5nu+KqKKyalcHXoR
	 PkygyNMxxD1kJ/lpREraWAr7ptMwrZdtMjK3PU29AnATl/uf8vAL9Nckrl/+MeLppg
	 19u1l5oucwxlHlsOpcNXdgeY/3jdD6Md8RpxHE5vhqDd2CdGQZpt4EJ9jkXLMIe2Vi
	 j8G3+oragW3KzCHXGkgfsqlqyuDdPjSBwMnDouPbYGO7j5vHL2lOm/CiBcEG3D/6Yt
	 UEI3ZfBZW8x+aJt6SPMz70Pu1DNSCBE7XnZHCFijw9ibPwJlex9VzJs5Gg1OIblL+p
	 7Sf/vgDKmS0KA==
Date: Mon, 10 Jul 2023 12:10:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 4/8] spi: Get rid of old SPI_MASTER_NO_.X and
 SPI_MASTER_MUST_.X
Message-ID: <bb3b9ef2-0a32-4f8a-8d92-06d47875b562@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XsbcL+9pzd4b793B"
Content-Disposition: inline
In-Reply-To: <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
X-Cookie: Do you have lysdexia?
Message-ID-Hash: KDO7HSCRLXNYZAG3Q5O4KH7BPZ42NYW6
X-Message-ID-Hash: KDO7HSCRLXNYZAG3Q5O4KH7BPZ42NYW6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDO7HSCRLXNYZAG3Q5O4KH7BPZ42NYW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XsbcL+9pzd4b793B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> >=20
> > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > and kill the not used anymore definitions.

> > The above is not what this change does:

> How to improve it? I was sure that the form of "converting to something a=
nd
> something" is clear...

> > > -	controller->flags =3D SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > +	controller->flags =3D SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_=
TX;

The change here is not the change that is described above.

--XsbcL+9pzd4b793B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSr5woACgkQJNaLcl1U
h9AETQf/V6X5zgJr6k7uYHVQFcwbbL/m5vofjoxPJtbBrBmanG5Gk4nvQRtvE5KM
RpVSjTeFZ6uC+MkUxft/VIyhHYX0UETqWF2qmW7X91ieOzQ+qA80TTz19J1soL8A
bdQuSDpZRGY0O5f9XVApQSJ9PvLzql1IvaU8JVkUlF9HL8cNol+5w/YPdvB3kKU0
zxUG62Tx0R0Qvo/ku288lZhsKbhtXH6jwNvsxH39TNsnewnat7fJiZvShg6theLk
vV02J7JmsFAeUR3ZH24aBIcYM3bYv86vKInV1cKHAzBjoan98DG8cghY3IvapKia
sf0W5e1oHmvyUi1zga0aGvHvsKHkcA==
=AmsT
-----END PGP SIGNATURE-----

--XsbcL+9pzd4b793B--
