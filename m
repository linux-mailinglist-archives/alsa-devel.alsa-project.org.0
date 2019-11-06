Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E014AF174C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 14:38:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76FAE16A8;
	Wed,  6 Nov 2019 14:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76FAE16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573047500;
	bh=yIesLP7p5eJ61Muo9RG5j1vWdnnh3c0sC0NapMl47sc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rBD/huVH/6QBnCxUbzESRMCNKux7i4nhNlYD2j3KMDwkgMCOdOlk8qCHWSpshTyPz
	 myvQuHustQYet6ZD5+olVlvuCknl2a999zry7u1V6w6Io+GaFQcUDaAUjXVror1VM9
	 5HOiCgRBNcN2vrTfAuq8wki2xPbdCESgVdQ1R7U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AE79F80610;
	Wed,  6 Nov 2019 14:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B1CF803D0; Wed,  6 Nov 2019 13:08:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6100CF8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 13:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6100CF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xYrFppKj"
Received: from earth.universe (dyndsl-178-142-076-059.ewe-ip-backbone.de
 [178.142.76.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF9FA214D8;
 Wed,  6 Nov 2019 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573042129;
 bh=V/qDo5nGEOZCsXA28DftCXvuGa6fJB3Pj2YPreUoFnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xYrFppKjn/4yL5ZGBKBRo4b6OM1TLPOhIeY4WiZmhFk50N93u08mQeM+HPmit7vPB
 IXh7OR1kyv26XEDhgGllVkzBfqewoK8BqSHFmbNctuqPYPv9JCeZjpP6qcf9eihg7g
 1QOeW4diDLDfNTR0PbUfJ9PSy5z0wN6yJKrDzYSg=
Received: by earth.universe (Postfix, from userid 1000)
 id 2FC043C0C70; Wed,  6 Nov 2019 13:08:46 +0100 (CET)
Date: Wed, 6 Nov 2019 13:08:46 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Message-ID: <20191106120846.5bunrqj3uz4khih5@earth.universe>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 06 Nov 2019 14:35:01 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Marek Behun <marek.behun@nic.cz>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, mazziesaccount@gmail.com,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Subject: Re: [alsa-devel] [PATCH v2 0/2] Add definition for GPIO direction
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
Content-Type: multipart/mixed; boundary="===============0181536425787002014=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0181536425787002014==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnpwomoqjjihlwgi"
Content-Disposition: inline


--bnpwomoqjjihlwgi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> The patch series adds definitions for GPIO line directions.
>=20
> For occasional GPIO contributor like me it is always a pain to remember
> whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging the
> fact that I removed few comments like:
>=20
> /* Return 0 if output, 1 if input */
> /* This means "out" */
> return 1; /* input */
> return 0; /* output */
>=20
> it seems at least some others may find it hard to remember too. Adding
> defines for these values helps us who really have good - but short
> duration - memory :]
>=20
> This idea comes from RFC series for ROHM BD71828 PMIC and was initially
> discussed with Linus Walleij here:
> https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.cam=
el@fi.rohmeurope.com/
> but as this has no dependencies to BD71828 work (which probably takes a
> while) I decided to make it independent series.
>=20
> Patches are compile-tested only. I have no HW to really test them. Thus I=
'd
> appreciate carefull review. This work is mainly about converting zeros
> and ones to the new defines but it wouldn't be first time I get it
> wrong.
>=20
> Changelog v2:
>  - squashed patches 2-61 into patch 2.
>  - dropped patch 62 (can be applied later)
>  - rebased (cherry-picked) changes on top of GPIO devel branch.
>=20
> Patch 1:
>  - adds the defines
> Patch 2:
>  - convert drivers to use new defines
>=20
> This patch series is based on GPIO tree devel branch.
>=20
> ---
>=20
> Matti Vaittinen (2):
>   gpio: Add definition for GPIO direction
>   gpio: Use new GPIO_LINE_DIRECTION
>=20
>  drivers/gpio/*
>  include/linux/gpio/driver.h         |  3 +++
>  61 files changed, 214 insertions(+), 102 deletions(-)

Maybe also update the GPIO drivers in pinctrl?

$ git grep -l gpio_get_direction drivers/pinctrl
drivers/pinctrl/bcm/pinctrl-bcm2835.c
drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
drivers/pinctrl/intel/pinctrl-baytrail.c
drivers/pinctrl/intel/pinctrl-cherryview.c
drivers/pinctrl/intel/pinctrl-intel.c
drivers/pinctrl/mediatek/pinctrl-mtk-common.c
drivers/pinctrl/mediatek/pinctrl-paris.c
drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
drivers/pinctrl/pinctrl-amd.c
drivers/pinctrl/pinctrl-at91.c
drivers/pinctrl/pinctrl-axp209.c
drivers/pinctrl/pinctrl-ingenic.c
drivers/pinctrl/pinctrl-ocelot.c
drivers/pinctrl/pinctrl-oxnas.c
drivers/pinctrl/pinctrl-pic32.c
drivers/pinctrl/pinctrl-pistachio.c
drivers/pinctrl/pinctrl-rk805.c
drivers/pinctrl/pinctrl-rockchip.c
drivers/pinctrl/pinctrl-rza1.c
drivers/pinctrl/pinctrl-st.c
drivers/pinctrl/pinctrl-stmfx.c
drivers/pinctrl/pinctrl-sx150x.c
drivers/pinctrl/qcom/pinctrl-msm.c
drivers/pinctrl/stm32/pinctrl-stm32.c
drivers/pinctrl/vt8500/pinctrl-wmt.c

-- Sebastian

--bnpwomoqjjihlwgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3Ct78ACgkQ2O7X88g7
+pr6lA//Yq6zLlwHT2xTPxnqqdH7KC4/5hR3D1iXhM7jA1kF2R0rHNpxyfHAeqYg
0FRg7OCExPRbZpdOiT3Yk6Aup+DdXeSoVa7t6XJ85SR4Yc7IGRG6cmJOC9sblqSQ
Xf9mksV1lOqF0CWtlHzClPDPjU9R5VbkdxvjWoAAKgAajcCdezKNsTOqRM1yCXNa
9/qfr4XZIwYVE82pwk3UIYyGs9/eFPim+5NWDCqr1q1r2nCNhAHhscKAdIPBzWLj
FvxBya93zcYmWzagPz8wuczqUAhKVNkG0CXuGExcQmu07SzU/6VC3rIMqRJa5TkK
cZ3G9+oKyLrWPK18NSgbIXkXKp1pI/zJREWECs5hfkmhCZRU5PRQrxVrIlZ5DkGd
wfovOq9PQmajQyPmesZ8wmpqYFQ7owiGLa0ipIA4See0J2n7ql2lHKxWTQ04Ly+E
dWRbOUuh/CZggvzd2XUU6JXKJ1NEtM1J+QRZrgtCyufaOTmBgVjH0fqQD13knqCE
FDyOfEoaVelPcayHVgQIRnGfgteZq/5pqG0+mv7Hfu5BTkLOTssaZcRX1QLXrMMX
aKMSHAAOPq9WrIrtwQ1ntVCKy6EORT7inYndTO1Q4z3HegssO4HsFdEvltYrGvSl
xsG+UCmxQIAvAtZM2IO5J4juX8hdUCQ9l1PcvxB2dK0awRH9DVM=
=mpHP
-----END PGP SIGNATURE-----

--bnpwomoqjjihlwgi--

--===============0181536425787002014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0181536425787002014==--
