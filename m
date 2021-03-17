Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4453401CE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85CC916D1;
	Thu, 18 Mar 2021 10:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85CC916D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059213;
	bh=DILQbHNIjjlR5G080AMVlRxV+fb2HnId3mmNERKRIXY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbJNL3EFct0EGEYrrbz0xaUm6slWnDpJ/MTuvdMtq8Ib7yT3a+DCw4bd785wld9Bw
	 nWpxtpAKDfJzOAM5f7zZjVP8i5qbE4mmx2e9NYWrH1U8YfNbm55YhRPuQRchQSpL4x
	 ai+WQWxKU7NiC8kDYjSA64kzs3PaSY/00hAsqBZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D51F804AE;
	Thu, 18 Mar 2021 10:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6110AF8021C; Wed, 17 Mar 2021 09:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B9BF8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 09:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B9BF8013F
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1lMRZV-00016k-TZ; Wed, 17 Mar 2021 09:30:29 +0100
Received: from pengutronix.de (unknown
 [IPv6:2a03:f580:87bc:d400:31e3:6e40:b1cd:40a8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 582725F73BA;
 Wed, 17 Mar 2021 08:30:22 +0000 (UTC)
Date: Wed, 17 Mar 2021 09:30:21 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop type references on common properties
Message-ID: <20210317082003.rhm6sdrwxmt4elu2@pengutronix.de>
References: <20210316194858.3527845-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rrfkyphxuuq3viq3"
Content-Disposition: inline
In-Reply-To: <20210316194858.3527845-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Suman Anna <s-anna@ti.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Benson Leung <bleung@chromium.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 netdev@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--rrfkyphxuuq3viq3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16.03.2021 13:48:58, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. Drop all the unnecessary type
> references in the tree.
>=20
> A meta-schema update to catch these is pending.
>=20
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Stefan Wahren <wahrenst@gmx.net>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml       | 5 +----
>  Documentation/devicetree/bindings/arm/cpus.yaml              | 2 --
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml           | 1 -
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 3 +--
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 1 -
>  .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
>  .../bindings/memory-controllers/nvidia,tegra210-emc.yaml     | 2 +-
>  Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml   | 1 -

For the flexcan:

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--rrfkyphxuuq3viq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmBRvhoACgkQqclaivrt
76mnKAf+PxQ/8rd3QepXVtp0iP7BwfTPO2Vw0b0/dXzEt5pT/cygYEDP2YE6dumw
9LbLd9JPDJJFhwXpMje5DOZW+Nfa93SRBq/MC1/XynoG8UAa7r2VuO7ZJscUNuI7
nL04VVsP17gLMoR9ZGSvd+Vbau0uCw3APVawqN2d2nsi9eCCTykaIpQBrXGL+VHo
h225JlHCOUVizUbAE8BFWxDXXff1mMEKHU46APvK+RXz1nExI23zmwJeIGA11RwP
bjFMRZehLZesl/p6uDndUYNL4wTK7LXOf+u/A/wGDdQSuLOwoVbX9ACOLHsB0qfP
+1kjTYyaduEG1rpaYQ966dHZqjQEuQ==
=4979
-----END PGP SIGNATURE-----

--rrfkyphxuuq3viq3--
