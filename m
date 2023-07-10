Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9574D482
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 13:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E958B206;
	Mon, 10 Jul 2023 13:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E958B206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688988248;
	bh=rVbOiKgyxND9mKZk3rAKjAS4exnyG60MuJg/qoml1Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=feiYHKRbwSPYpfFn8XyFFk9Kye91Cj8Lgu2ELc5/x5theZt9KB1mGiRFtGnuHPMrg
	 eb146RHfzmMFNDMQ+OUXOMBkqFUdujfw4a6Oa/tJUNlMi1DTFXQcWMCZLv8t1Hw4oR
	 QlCP3LV+32LXonU2WdpFLfezu4kMQ9v8yIxzakOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 321A4F80290; Mon, 10 Jul 2023 13:23:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF25EF80153;
	Mon, 10 Jul 2023 13:23:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC00F80249; Mon, 10 Jul 2023 13:23:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 562C7F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 13:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 562C7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NmQJc/tP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE3060D3E;
	Mon, 10 Jul 2023 11:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F29C433C7;
	Mon, 10 Jul 2023 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688988188;
	bh=rVbOiKgyxND9mKZk3rAKjAS4exnyG60MuJg/qoml1Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmQJc/tPCMy3i5v1VlHdRroye/CciPC/ZvFOKcppf3TZf0qRJ3dgdRYwmDVOMOmqP
	 VHTHnUz3SjT2CkGo2po+jFLM51kzErpdYTDzbIh1ssyixtC39WoS5AEx1AHhOh2rUT
	 oGH0Cj/eImkEiRwQY+a6G/4uTBojRaP1c3PpTvWdlPa8OmIjqYJiqIt27qBeoOyByD
	 uIezS9sRdsa2l0+EXR9NmvWwdDucaVOT+HG9neus16SKNTI7aq5f6UxW++970eT5gb
	 zfoX4LNe9GA9UuIFwotHUiqYP63tgZEO9J8trRSJc2+FmmGG2Hl/AKVEk1ykYfoY0k
	 6E9c0qXH0JqVA==
Date: Mon, 10 Jul 2023 12:22:59 +0100
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
Message-ID: <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SoPr26CyLWhD+5za"
Content-Disposition: inline
In-Reply-To: <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
X-Cookie: Do you have lysdexia?
Message-ID-Hash: SEXB2KPQWW7N6UTQCPOWTAJN3LBZZDCL
X-Message-ID-Hash: SEXB2KPQWW7N6UTQCPOWTAJN3LBZZDCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEXB2KPQWW7N6UTQCPOWTAJN3LBZZDCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SoPr26CyLWhD+5za
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:

> > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > and kill the not used anymore definitions.

> > > The above is not what this change does:

> > How to improve it? I was sure that the form of "converting to something and
> > something" is clear...

> A wild guess, maybe you meant to split to two changes, one per each macro group?

No, doing TX and RX in one commit is fine.

> > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

What part of the above change is replacing _NO_ with _MUST_?

--SoPr26CyLWhD+5za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSr6hIACgkQJNaLcl1U
h9AMOgf+KMPcMsJntwEWI8UJ7/re0uGZ3D9fX1qeb76OfxTqQ5bt1PsIzRULHkqL
pEOuOVnEu3HTSuNnMgEyy0ms1PA7+yFFiMWSdYlZy02GpNeD8FY/VFwOM9dR4pte
UWnlYD6vJK8wffaEnxtKF5F2gOah96lH3Yws15T1IN8/YbK5wzCnJ2R5XWgm5Ka6
zIFhD0cZ077/Z1hO9SJrqAKPpTLLr1KtyC7ZHsvN2YE5+bzvELKFqPSyt3HPy61r
v+QdG7vRj8/tNW2Hn4lpLR8g9tz5JSMFLhxcyg9TRz67jSiOxM/utfw2IY+Q8DB8
YvmjuYpF+tbhIo7G3bYNULQS39HNSQ==
=ZD6G
-----END PGP SIGNATURE-----

--SoPr26CyLWhD+5za--
