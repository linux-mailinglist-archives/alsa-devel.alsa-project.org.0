Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF0F1755
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 14:38:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769E216C1;
	Wed,  6 Nov 2019 14:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769E216C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573047522;
	bh=G4uqumhuGzNVO9uzWqrckbrvqVcI1vlEB9KI0JlvLg8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vU+0qKm5bYCyRBCrfcwsQbhysChhnPs9rise29Ixpxyn8Cm1LycwVChbSGilrU+37
	 y9+mkP+TprIYaQZ3zwOQ6Ujx+9HQv7PFy5XS1nD/1Sclu2aWdpidnCEb7MOvtM7mvV
	 d02fRhbObHX2I9ykp0x9rZWd4IIQbvOJFoiBTQ3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F39BCF80639;
	Wed,  6 Nov 2019 14:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 547F8F803D0; Wed,  6 Nov 2019 13:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by alsa1.perex.cz (Postfix) with ESMTP id 249A7F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 13:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 249A7F8015B
X-AuditID: c0a8fbf4-183ff70000001fa6-6c-5dc2bbb4f65b
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 CC.BC.08102.4BBB2CD5; Wed,  6 Nov 2019 13:25:24 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 13:25:18 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "sre@kernel.org" <sre@kernel.org>
Thread-Topic: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Index: AQHVlJrx7wcBaYPaxUmQrQAzc732Rad+AIyA
Date: Wed, 6 Nov 2019 12:25:18 +0000
Message-ID: <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
In-Reply-To: <20191106120846.5bunrqj3uz4khih5@earth.universe>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <FD03FC67CBBBB149AC58086B204B0910@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xbZRjOd87p6eFSc9Zy+exc4uqIcUYmxuibOBd+LWfGiZsxMWYED+NA
 yaAlbTHgH9kQgRIcYxDKGeCoreMyomtBt8KEVbYxyKhkgCMDlFE2WORiYLBx9RzqBr++J+9z
 e3+8H0Oqcxktk2qwCCYDn6ajg6mOuhXXG82t3vg3e3Oj4JK/B0F/n5cAzx0Gik9VEFA0V0FC
 U/F1Chaquynoz3MhaC/+nYTlmU4ljA3EQX0ZBUMnWwlY8a2R8I1op6Ch/AoFE+5xAspWLxDg
 Gh9UQG5jLwnu71cRWJfrSbjjqaLhnOM0BSMjDQhapmYIsA76FVC4INIw2fSnArocjxGM1VdR
 UOXsoqBmrUkBM1OfwfxsuwKuPZymoM/mI2Gi0k3D2q8uCvLr+yVFox/BZHMk9LRaYNjtVoDt
 YiuCp54aCu6dOYugeNZJw9XReRQbww3ke5Tcz/OnaG72bp6SE/+6TXO2FTvFeTq03BVxRMn1
 /XuD5FwNhTQ3PNhGczW3jnBux9ecz1aLuJK5aWn8xIk4151h9PHOz0P2J/KWLz9JTTHsO/BF
 iP7v0ftUxrImq9y5SOWgyxorCmIw+zZuKnLQMlazAwhvFOy1omAJ30R4cHBUIhiGZvdj65BS
 1oSxUXix+x4pa0j2bjgumGvfNGvY9/HtS34iIDqAuxorqAB+Czt680gZU+weXPiwc3OuYj/C
 tjwZM1JZFp5cekUeB0kxkxttm5GI3YULc2Y2I0k2ErseLCkCO7PY0eYjAzgcT42v/z/X4atP
 xzYjSfY1/JNnX8Aai38oLaECeDcuKxpTBjbYgW9V+qkSFCFuaxC33OI2t7jNLW5zn0eKBoTT
 +dS0FN4ixESbhMxok1GfLj3HjekuFDjqhctow3vIiwgGedGLDKELV32Qei1e/UKiMSlbz5v1
 CabMNMHsRZghdWGqY99JnCqJz/5KMBmfUTsZShepenXsTLyalbtOCEKGYHrGvsQwOqzaJX0d
 9Q6TkCJkJaemWbZoggmSw4O1YWbBkCSY+EyLPkG+jgSzdB4yFSr1Jnsku8qcwadL04C1G73O
 lExV20mms9ppJ9WUwWgQtJGqGy2SlJWl+kzD86JHKJJBOo1qRA4KlX7285xHUgUhVXw4/ptc
 YeG3KG0OOuiz1racO3LBn/zuRNQvJzaWVrNj0y5qQ//IFY/XeB+XNrdV5t+PjugndzMnX944
 +yQ3f5o+3NPh1Sza9BG9dXUN60Mh5d8yBb533nOE+6+H14aKrtK801nK4cR/xt2flgQZDfEP
 vPZV/9B668HoY/abcYf2/BjXq3GmHz1sPp9Zo6PMej5mL2ky8/8BbFL4/JYEAAA=
X-Mailman-Approved-At: Wed, 06 Nov 2019 14:35:01 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed, 2019-11-06 at 13:08 +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> > The patch series adds definitions for GPIO line directions.
> > 
> > For occasional GPIO contributor like me it is always a pain to
> > remember
> > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT.
> 
> Maybe also update the GPIO drivers in pinctrl?
> 
> $ git grep -l gpio_get_direction drivers/pinctrl
> drivers/pinctrl/bcm/pinctrl-bcm2835.c
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> drivers/pinctrl/intel/pinctrl-baytrail.c
> drivers/pinctrl/intel/pinctrl-cherryview.c
> drivers/pinctrl/intel/pinctrl-intel.c
> drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> drivers/pinctrl/mediatek/pinctrl-paris.c
> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> drivers/pinctrl/pinctrl-amd.c
> drivers/pinctrl/pinctrl-at91.c
> drivers/pinctrl/pinctrl-axp209.c
> drivers/pinctrl/pinctrl-ingenic.c
> drivers/pinctrl/pinctrl-ocelot.c
> drivers/pinctrl/pinctrl-oxnas.c
> drivers/pinctrl/pinctrl-pic32.c
> drivers/pinctrl/pinctrl-pistachio.c
> drivers/pinctrl/pinctrl-rk805.c
> drivers/pinctrl/pinctrl-rockchip.c
> drivers/pinctrl/pinctrl-rza1.c
> drivers/pinctrl/pinctrl-st.c
> drivers/pinctrl/pinctrl-stmfx.c
> drivers/pinctrl/pinctrl-sx150x.c
> drivers/pinctrl/qcom/pinctrl-msm.c
> drivers/pinctrl/stm32/pinctrl-stm32.c
> drivers/pinctrl/vt8500/pinctrl-wmt.c

Ouch. I didn't check from pinctrl but I see those should be converted
as well. I'm a bit short on time right now so if anyone else is
interested I won't mind :)

Luckily the value for IN and OUT is not changed - only the defines were
added - so all of the drivers do not need to be done at once. If no one
else will take the pinctrl part then I can probably do pinctrl patches
for v5.6 cycle.

Br,
	Matti Vaittinen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
