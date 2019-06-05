Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC383A0C5
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C915B166A;
	Sat,  8 Jun 2019 18:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C915B166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012648;
	bh=4dvEvfSWd/7NO/FeBupDeIqXNnPQ65SdLSrOVfr/jKI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0mXp5xFC2XoEH03UmNMB9D+FhM07PO2+wc13HjO/xE6z1LMTMvl+pEzNKddkKlbg
	 JKh+1ZaJI7W3muOi4EF06jzz1B1LQ3e9X/SuFciXDs9rXhSxgLVVxLoSGfNtmyA8Yh
	 kklKp9ZTGuwn+tspab/p+SsHGD6RxATRWVnhDIHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E170F89770;
	Sat,  8 Jun 2019 18:40:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 945BEF896DB; Wed,  5 Jun 2019 16:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by alsa1.perex.cz (Postfix) with ESMTP id 65178F808E7
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 16:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65178F808E7
Received: from localhost (p5486CB35.dip0.t-ipconnect.de [84.134.203.53])
 by pokefinder.org (Postfix) with ESMTPSA id 291123E43B4;
 Wed,  5 Jun 2019 16:20:01 +0200 (CEST)
Date: Wed, 5 Jun 2019 16:20:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190605142000.GC962@kunai>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-7-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-7-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: gwendal@chromium.org, Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, Sebastian Reichel <sre@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-i2c@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Guenter Roeck <groeck@chromium.org>,
 Ravi Chandra Sadineni <ravisadineni@chromium.org>, kernel@collabora.com,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-rtc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, dtor@chromium.org,
 Brian Norris <briannorris@chromium.org>, Evan Green <evgreen@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-pm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Lee Jones <lee.jones@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Colin Ian King <colin.king@canonical.com>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [alsa-devel] [PATCH 06/10] mfd / platform: cros_ec: Reorganize
 platform and mfd includes
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
Content-Type: multipart/mixed; boundary="===============4365368318238839127=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4365368318238839127==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 05:20:15PM +0200, Enric Balletbo i Serra wrote:
> There is a bit of mess between cros-ec mfd includes and platform
> includes. For example, we have a linux/mfd/cros_ec.h include that
> exports the interface implemented in platform/chrome/cros_ec_proto.c. Or
> we have a linux/mfd/cros_ec_commands.h file that is non related to the
> multifunction device (in the sense that is not exporting any function of
> the mfd device). This causes crossed includes between mfd and
> platform/chrome subsystems and makes the code difficult to read, apart
> from creating 'curious' situations where a platform/chrome driver includes
> a linux/mfd/cros_ec.h file just to get the exported functions that are
> implemented in another platform/chrome driver.
>=20
> In order to have a better separation on what the cros-ec multifunction
> driver does and what the cros-ec core provides move and rework the
> affected includes doing:
>=20
>  - Move cros_ec_commands.h to include/linux/platform_data/cros_ec_command=
s.h
>  - Get rid of the parts that are implemented in the platform/chrome/cros_=
ec_proto.c
>    driver from include/linux/mfd/cros_ec.h to a new file
>    include/linux/platform_data/cros_ec_proto.h
>  - Update all the drivers with the new includes, so
>    - Drivers that only need to know about the protocol include
>      - linux/platform_data/cros_ec_proto.h
>      - linux/platform_data/cros_ec_commands.h
>    - Drivers that need to know about the cros-ec mfd device also include
>      - linux/mfd/cros_ec.h
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Wolfram Sang <wsa@the-dreams.de> (for the I2C part)


--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz3z5AACgkQFA3kzBSg
KbYuGA/9GcL4++C/ViixlrJ+2KnwVIZhutol9fcA8YKEeEpGQq42AkU9zJV8pX3y
U6sLvo3bHeDjA98mwO+aWKCaZIp1W5vZrKdQNqUZ35xvEaIgjhZ2dATu2+ontUAI
Yv9koHktSt4oTbZlAPmcIwV/vLrhmJgr0FA1B6pS4qFbccYh+ePsTKvYpsjaguox
vwDsmzJkZJ6AjW51Nx0dvMGJuUX6RLnv14etbz6P1I47cPKG9lYyVOsDiUIHsOPG
JmhUiCaertI9rrsjaYNQIGrzGbkAozoO0c5klJC5BlnfBvqEfwjgBh5+ccqH1HXL
WuegitNsfkAX3Y5nSZUsGoC1wtg+pqmLWsNs2eTc1uQAxYOwlleFOiMKXuhUIG2U
0BMFoJ6/AYCuMkvIPyDdl8UWMjXW8Odreu2Y0h1rF6SuJ+mmI8TfhgfbTG/s1uX7
qs9bPWwmi1EOJ1AoNv3ouLrC2PT6ES7Kt5mnvi4byXFcwkdq8EKcTfLVpy0xz6l/
tDTHCxNLCrku2WX32buEW+mHZfCpbNRfcU7/VlTNU8o9i4QYy4WeL/SgaGLDVZvM
zDFRRhXw2U+mtxRI6yAI/bl0Tl8VJG7cqCHeGuKGeA30siz75gSi6b2n+rCTnkba
dfCggQuvByFYBOqqO4mnuvTflAYInnad7IyBnbGhS7p7NEkPbgE=
=Nrms
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--

--===============4365368318238839127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4365368318238839127==--
