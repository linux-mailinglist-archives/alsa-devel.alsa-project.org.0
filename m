Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD63A0B6
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A356C1663;
	Sat,  8 Jun 2019 18:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A356C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012294;
	bh=boNfTnEe8zQ8+CjWnyixB54KLeKx87a47grOXU8D838=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxnu40lH4kESAPhtTi40a67+euxkDwh9GDQ4I17m2ObO0cAmjR0C7+BVulGGhuMm4
	 8cUmoz2atbTHmU8rLGcjP04lTUUvZhhgMm5dgvajwXfaONlWlEifxi1TnmAGopts4I
	 ARKA7WGPfTEpkLNx6E7aY4d8UORneAlr9VKHK+WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22016F89742;
	Sat,  8 Jun 2019 18:40:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37A5BF896DB; Wed,  5 Jun 2019 16:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by alsa1.perex.cz (Postfix) with ESMTP id D24E6F8072A
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 16:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D24E6F8072A
Received: from localhost (p5486CB35.dip0.t-ipconnect.de [84.134.203.53])
 by pokefinder.org (Postfix) with ESMTPSA id 2A6132C016F;
 Wed,  5 Jun 2019 16:19:30 +0200 (CEST)
Date: Wed, 5 Jun 2019 16:19:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190605141929.GB962@kunai>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:49 +0200
Cc: gwendal@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Vignesh R <vigneshr@ti.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Juergen Fitschen <jfi@ssv-embedded.de>,
 alsa-devel@alsa-project.org, Stefan Agner <stefan@agner.ch>,
 Sebastian Reichel <sre@kernel.org>,
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
 Jiri Kosina <jikos@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>,
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
Content-Type: multipart/mixed; boundary="===============1580713667080741966=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1580713667080741966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 05:20:11PM +0200, Enric Balletbo i Serra wrote:
> Now, the ChromeOS EC core driver has nothing related to an MFD device, so
> move that driver from the MFD subsystem to the platform/chrome subsystem.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de> (for the I2C part)


--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz3z3EACgkQFA3kzBSg
KbZZyQ/+NucR0y9tJ8dEUHBDWwezaDGRJY6gdHekCBkaeWPUn6g0FnICbkRctxDs
9xGiFSqBOVjaLKRvv1Heb9CmS6v6OQ/6+DUkESSpBhO5grk7oTOsg13G0W87qNmz
Qdm9ZSj4DZchkw0cLBd4tZ9QISp6/rNnUWbK8P6DBBhLp43iwErSGqYNKkopgUmW
ggCpgWYAgsV+rUTNAWbywT0mil0qXZ1fcAdkmktp3sTzsJk9JGuUrx/1CLtyDd/R
pJwCV0fJRKD54dc2C3iFaLbVb0TqXxtryqVK9ByNXxOWxQh5TROhUNFwve5vSTqg
Cxpsu3ET+0MYtjV/eEZYz5J9A/EFK1XcyiJYtA4Zvw2p2Q7Ab6Y3XpsRXGJM5UhV
I/gLzzr0DUqwOcyE82MES3JNvbHec1fVB0WXXW2QesC7TmY/5VKKIG6WX+ZSNmXa
HGDgEVsH/cienRasI6yYB5nRigLNJVC+ZGLccKmFtEGMyHMA3gJLx46jfdXZ81OU
mzmhhkilii5Rjp+WpzBnreMMQJ7XpfLa5ZBGWU0T9fpFuBf818l+qp61T5qT3XKV
AKDLZsZWvjzjuS/NA9GV1P8/Aau4H2k9FvTdT/YY0EMFCFasHkIZ4pSaHCmR0YtJ
7/Pr6PkYT2dpI8BX5fCwTvSIC5wNeTuoeX7ue//WHQTEDKLdmqE=
=yI8A
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--

--===============1580713667080741966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1580713667080741966==--
