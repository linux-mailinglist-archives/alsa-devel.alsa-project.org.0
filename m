Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959974B8437
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:27:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3746218F6;
	Wed, 16 Feb 2022 10:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3746218F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003650;
	bh=KT4IxdMZJParB64ITcbgrbOY/5Buw4qzNYLiJ06+5LY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YzraTyh/hb5UPvuRccTbFtupvTWmvCc5sNo6N2dNj5KYcHIol8q98Y/tAKVD+MsI0
	 1b1LF4k40WX/3loj8XTMws2WAQAm664qiX/8GXtZlPIZ9h3Md0pgEIze7YbW30LeOW
	 0qeB8eNSBUlqMuG1hDIKrp085pKsEJYFJas7gqvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43DE0F8051D;
	Wed, 16 Feb 2022 10:25:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B3E6F804D1; Mon, 14 Feb 2022 08:14:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BBBCF800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 08:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BBBCF800C0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVZ0-0006l6-Nq; Mon, 14 Feb 2022 08:14:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVYf-00GV12-4n; Mon, 14 Feb 2022 08:14:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVYd-002oWn-E1; Mon, 14 Feb 2022 08:13:59 +0100
Date: Mon, 14 Feb 2022 08:13:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r3c6abkz2rpak4yl"
Content-Disposition: inline
In-Reply-To: <20220212201631.12648-2-s.shtylyov@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Oleksij Rempel <linux@rempel-privat.de>,
 Lee Jones <lee.jones@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-pwm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Zha Qipeng <qipeng.zha@intel.com>, Richard Weinberger <richard@nod.at>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
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


--r3c6abkz2rpak4yl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 12, 2022 at 11:16:30PM +0300, Sergey Shtylyov wrote:
> This patch is based on the former Andy Shevchenko's patch:
>=20
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@lin=
ux.intel.com/
>=20
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found.  It prevents the callers from being
> error code agnostic in their error handling:
>=20
> 	ret =3D platform_get_irq_optional(...);
> 	if (ret < 0 && ret !=3D -ENXIO)
> 		return ret; // respect deferred probe
> 	if (ret > 0)
> 		...we get an IRQ...
>=20
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available.  Let's follow this good example, so that the
> callers would look like:
>=20
> 	ret =3D platform_get_irq_optional(...);
> 	if (ret < 0)
> 		return ret;
> 	if (ret > 0)
> 		...we get an IRQ...
>=20
> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

While this patch is better than v1, I still don't like it for the
reasons discussed for v1. (i.e. 0 isn't usable as a dummy value which I
consider the real advantage for the other _get_optional() functions.)

Apart from that, I think the subject is badly chosen. With "Make
somefunc() optional" I would expect that you introduce a Kconfig symbol
that results in the function not being available when disabled.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r3c6abkz2rpak4yl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKASwACgkQwfwUeK3K
7Ak1DAf/fgLBIz9p8Vx2hzG+I8aYoNMAmPLmUfMeIR1DWaBc26HTbyTBn6pFRiPZ
rztM2uc+royoY44/mp4H89WkPzZ0/v3AlRkdqI8UBny0ZKRbNtMfzL6f7wyVik5C
rxqc7EgXLRk2/0IxTohA6bwj7Vczei9NwYndm+QrxDHjmY5Dq95rdvxv9+8iaa9y
gLQ2x91x4bybaKnKVe36f5JfLeMhS9kLuCx82Wi1yqPK4UQQ6R/+QEE0zGS8QNHP
vMasmLHge9XqVx/c0SuPcLVZ/uRatkzzuqf1rY75peyQp4YpDDdkhkTws4kcVC22
lVFz9FjvbtVS4nxvPxNwZAnvq9sPaQ==
=UfDO
-----END PGP SIGNATURE-----

--r3c6abkz2rpak4yl--
