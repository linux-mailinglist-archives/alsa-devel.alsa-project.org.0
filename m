Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0630D3D0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:06:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81B71791;
	Wed,  3 Feb 2021 08:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81B71791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612335999;
	bh=4Smv+IgTSCIf8ce+xBhjejYOmhHvFqlFrol0roSVQus=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yei7HDuDZLVg7FTUf1JbJrHDqskeggt5iQv6DL7ucBtfp75tYJsqDpBbGpf7ywjdt
	 n1G1/U4Zn7Lp1HoonKCdEHKF/bQzw00hIogpg8MuZMTPX8RvFFdEvDd0fS2Je5NJFy
	 V5WafG7KbzZvJ8tT5WQ/BfKs4Zr3JuJ7OGZTfOz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D0DF804D1;
	Wed,  3 Feb 2021 08:01:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36C82F8023B; Tue,  2 Feb 2021 14:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D7CDF80152
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 14:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D7CDF80152
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l6w82-0000fW-TE; Tue, 02 Feb 2021 14:54:02 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l6w7u-0006bW-5D; Tue, 02 Feb 2021 14:53:54 +0100
Date: Tue, 2 Feb 2021 14:53:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux+pull@armlinux.org.uk>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ofqcafd7fzy3m7fk"
Content-Disposition: inline
In-Reply-To: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Alessandro Zummo <a.zummo@towertech.it>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
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


--ofqcafd7fzy3m7fk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-void

for you to fetch changes up to f170b59fedd733b92f58c4d7c8357fbf7601d623:

  amba: Make use of bus_type functions (2021-02-02 14:26:02 +0100)

I expect this tag to be merged by Russell King as amba maintainer and by
Mathieu Poirier (or Greg Kroah-Hartman?) for coresight as there are some
pending conflicting changes. These are not hard to resolve but also
non-trivial. Tell me if you need assistance for resolving, also if it's onl=
y a
second pair of eyes to judge your resolution.

Best regards,
Uwe

----------------------------------------------------------------
Tag for adaptions to struct amba_driver::remove changing prototype

----------------------------------------------------------------
Uwe Kleine-K=F6nig (5):
      amba: Fix resource leak for drivers without .remove
      amba: reorder functions
      vfio: platform: simplify device removal
      amba: Make the remove callback return void
      amba: Make use of bus_type functions

 drivers/amba/bus.c                                 | 234 +++++++++++++++++=
++++++++++++++++------------------------------
 drivers/char/hw_random/nomadik-rng.c               |   3 +-
 drivers/dma/pl330.c                                |   3 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   4 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |   4 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |   4 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   4 +-
 drivers/input/serio/ambakmi.c                      |   3 +-
 drivers/memory/pl172.c                             |   4 +-
 drivers/memory/pl353-smc.c                         |   4 +-
 drivers/mmc/host/mmci.c                            |   4 +-
 drivers/rtc/rtc-pl030.c                            |   4 +-
 drivers/rtc/rtc-pl031.c                            |   4 +-
 drivers/spi/spi-pl022.c                            |   5 +-
 drivers/tty/serial/amba-pl010.c                    |   4 +-
 drivers/tty/serial/amba-pl011.c                    |   3 +-
 drivers/vfio/platform/vfio_amba.c                  |  15 ++--
 drivers/video/fbdev/amba-clcd.c                    |   4 +-
 drivers/watchdog/sp805_wdt.c                       |   4 +-
 include/linux/amba/bus.h                           |   2 +-
 sound/arm/aaci.c                                   |   4 +-
 30 files changed, 157 insertions(+), 198 deletions(-)



--ofqcafd7fzy3m7fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAZWWsACgkQwfwUeK3K
7AnMhQgAhyeAx45pa3ebR9ymvzFG1Knp32GwFPlyLYw03yZzLsNR5n+d0kvDNZ1l
vNIrU0g5WSS1SUWhs+m3WDRIcTlCHcgc3yoCKltLSNWiPXie9G9BZ0815b0gomXY
eBSKiHZg/Ie8WhIspQcl0IA0P/2nOmTXF8qJx3CFow5WowriUutdf7n1ycTDq86a
18Xpf2lW+esLut8MHM/98aHJUl6Jkj5PYfQfjgORIXKwNmNDltuK6lwvUU+pw+Vr
0bDYXdXlaKLkNtSYYHSbDrKALiQccxhXYPg404KZV3FIHpOxKlq6im8hsFHWOOlu
n9j2wq/tpGso23vYKdErmsE3GDncuQ==
=P/zp
-----END PGP SIGNATURE-----

--ofqcafd7fzy3m7fk--
