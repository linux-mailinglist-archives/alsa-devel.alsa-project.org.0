Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A2B3AB612
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B2961720;
	Thu, 17 Jun 2021 16:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B2961720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940576;
	bh=2pT6diwY3dHqhQNq0TZW9ZAI8vRzneLi7AxE1GAN/Os=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WR4u8uhGlfKvvMvP85Y3TWW88nrcaLmHxW9N/R6rpmS7yoZg2/FXMaT8iQaNHglYC
	 dqTpKY34GR5PEtSq9Kk+eTmVeTKsYc28T5yCjANGbIY4p+M3VYoYyXzH4TK3SOP3GF
	 OUC4ReGQf1eLt8ix/SXPaKFcSprr49sVuQOA/K68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3A2F8025A;
	Thu, 17 Jun 2021 16:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9CD0F8028B; Wed, 16 Jun 2021 12:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DDD1F8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 12:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDD1F8028B
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1ltSzV-0004RW-VS; Wed, 16 Jun 2021 12:41:50 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a03:f580:87bc:d400:27:4a54:dbae:b593])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 9048463D23F;
 Wed, 16 Jun 2021 10:41:36 +0000 (UTC)
Date: Wed, 16 Jun 2021 12:41:35 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
Message-ID: <20210616104135.z5bjalhan4ui2ibz@pengutronix.de>
References: <20210615191543.1043414-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="agvztsrh6izyn335"
Content-Disposition: inline
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:45 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-remoteproc@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>, linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, Guenter Roeck <linux@roeck-us.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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


--agvztsrh6izyn335
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15.06.2021 13:15:43, Rob Herring wrote:
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
>=20
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
[...]
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml  | 2 --

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--agvztsrh6izyn335
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmDJ1V0ACgkQqclaivrt
76nTUAf+NueTtFpURzEcaqcVzU9on1r9+EA8Cl4Mxhgg3Nw3TGp6enDeBSGPVR5B
MaJtsub8PAEbECezUQxWPaNPa5uvS7dCW5eygZ2z3lDMGZGhYjtv67LVAJgCDq3q
BWNuKMkKu25Ccsxl33ItHRrAmrlcwBcZMfzN+E9OgZ60GySlRv+AxcLR2XiwST9t
kWlEW417Mj0P+cvwFo/3Ms4zRddEiw92YruesAK73pkxrB2u2xqaSy9BqNHZCG/J
F9Q0VsjhTwLAI/7VQohXgcrL2yHsMRJt0M1+XMaxNncf1amrPNo8eWjyNDNbbIIi
s6uvO8FoLgDLRqbX7Q14cLQ+uQmadw==
=ZOig
-----END PGP SIGNATURE-----

--agvztsrh6izyn335--
