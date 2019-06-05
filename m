Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA03A0B5
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBC71607;
	Sat,  8 Jun 2019 18:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBC71607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012254;
	bh=GM92GxtaJEpZkcWm/tkTloicoU/oWV4NseQue8aAKos=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2INVqnE+EER+YhpthR/t0oUJ95QLGwjhJrx1ALPWLugP+0P7TIS7e9TwymYg7i29
	 ZLK84Q7tiJMP6X1ltff/vPsEK5l08HPGWF1DfKSolL3tUIo/5cunWhnRH1s+09FYqk
	 yVYUy2UjnfVgoAf8+aFMezwQr+rYRlLp19kS9Pfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 170C9F8973B;
	Sat,  8 Jun 2019 18:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F964F896DD; Wed,  5 Jun 2019 12:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26D99F896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 12:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D99F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LTNcXNu+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vwrlO5rE8nrWcbBNWjTsqA9uRImvf+PeWmi9GgrqNj0=; b=LTNcXNu+1wB/EoTy702q7eFQ5
 vP9DL/qiYYFfedir+9R/Lq+25YMI67/Xp8x23byTz8H5XXHT0U50+0cTiyc5s+e8pVqnocZw5xciG
 WTEfuWfJKhqHIgnu+iACWtuwroNCwBRwp15qhnZ1HYwiqUE7+1aGBfiSQH7eCFGJwKHsk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYSk5-0008UU-Ep; Wed, 05 Jun 2019 10:02:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E518D440046; Wed,  5 Jun 2019 11:02:00 +0100 (BST)
Date: Wed, 5 Jun 2019 11:02:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190605100200.GM2456@sirena.org.uk>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-3-enric.balletbo@collabora.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: gwendal@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Vignesh R <vigneshr@ti.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.org,
 Juergen Fitschen <jfi@ssv-embedded.de>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Sebastian Reichel <sre@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
 linux-i2c@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, kernel@collabora.com, dtor@chromium.org,
 Lars-Peter Clausen <lars@metafoo.de>, Jean Delvare <jdelvare@suse.de>,
 Jacky Bai <ping.bai@nxp.com>, linux-rtc@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Young <sean@mess.org>, Lee Jones <lee.jones@linaro.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>,
 linux-input@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 linux-media@vger.kernel.org, Ettore Chimenti <ek5.chimenti@gmail.com>,
 linux-pwm@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hartmut Knaack <knaack.h@gmx.de>,
 Eddie James <eajames@linux.vnet.ibm.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 02/10] mfd / platform: cros_ec: Move
 cros-ec core driver out from MFD
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
Content-Type: multipart/mixed; boundary="===============1990195313740297711=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1990195313740297711==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bYB/dvygrOI2NuBf"
Content-Disposition: inline


--bYB/dvygrOI2NuBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 05:20:11PM +0200, Enric Balletbo i Serra wrote:
> Now, the ChromeOS EC core driver has nothing related to an MFD device, so
> move that driver from the MFD subsystem to the platform/chrome subsystem.

Acked-by: Mark Brown <broonie@kernel.org>

--bYB/dvygrOI2NuBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz3kxcACgkQJNaLcl1U
h9CFeQf9GtlWPL5nPJEfjyt5RFlWSTaL2w0eqOd5qmO7mWY5Dlc1UODDtZlVSWnY
KodqSRI26I31iGe1HLT5CM5c1d7vsTXlIXfijgAh5N2ZOWS/+Aq+ImCUBT72Jn10
qEY+lr42Iy7mR3Vb0oYO0AgrDkDou8AVIzLzlIh4O4BYEd80SIzJ0+F2ps/dibS+
ktDkdxVkwbBisDXBNnMV0qW3CZSKMP21JxDMc31FB9l0yuleTXrH4pSrJ2EprxXH
s0UvMJoaouQn8eZWz1ObnYmEEdIflu80Ha7A20fp29RXnyqonXVXd7u1fUxeAECF
NyjQ+pJ9C2bFNiy+zI/kCJingPzVcQ==
=Obx+
-----END PGP SIGNATURE-----

--bYB/dvygrOI2NuBf--

--===============1990195313740297711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1990195313740297711==--
