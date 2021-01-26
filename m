Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9694305390
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 07:53:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77412175A;
	Wed, 27 Jan 2021 07:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77412175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611730421;
	bh=r+fiLnj5LyGcAGRNXBpZT+2RIzIWQ0bFI2cnKivYjPI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ul7vzWivKvdAkh0J018cTrRV+EEcSwj+ul3qOokPg5jkTeXnz7ciAYRi8m9vCqKfP
	 4SNRJJXHpvZZ1RyaD0iZuQgqplE31ejzC04l4DQ9X10hQHNHXblzO0pcCmee8Eo1Ux
	 4Hz+lTdjvopB6yy71+YuZYc1f6ovhlAfrDIcsOj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29AE6F80278;
	Wed, 27 Jan 2021 07:52:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0153F8015B; Tue, 26 Jan 2021 18:08:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84AA6F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 18:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AA6F80130
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4RgD-00045p-EA; Tue, 26 Jan 2021 17:59:01 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4Rg3-0003hY-Ft; Tue, 26 Jan 2021 17:58:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/5] amba: minor fix and various cleanups
Date: Tue, 26 Jan 2021 17:58:30 +0100
Message-Id: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 27 Jan 2021 07:52:19 +0100
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
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

From: Uwe Kleine-König <u.kleine-koenig.org@pengutronix.de

Hello,

Changes since v2 sent with Message-Id:
20201124133139.3072124-1-uwe@kleine-koenig.org:

 - Rebase to v5.11-rc1 (which resulted in a few conflicts in
   drivers/hwtracing).
 - Add various Acks.
 - Send to more maintainers directly (which I think is one of the
   reasons why there are so few Acks).

For my taste patch 4 needs some more acks (drivers/char/hw_random,
drivers/dma, drivers/gpu/drm/pl111, drivers/i2c, drivers/mmc,
drivers/vfio, drivers/watchdog and sound/arm have no maintainer feedback
yet).

My suggestion is to let this series go in via Russell King (who cares
for amba). Once enough Acks are there I can also provide a tag for
merging into different trees. Just tell me if you prefer this solution.

Would be great if this could make it for v5.12, but I'm aware it's
already late in the v5.11 cycle so it might have to wait for v5.13.

Best regards
Uwe

Uwe Kleine-König (5):
  amba: Fix resource leak for drivers without .remove
  amba: reorder functions
  vfio: platform: simplify device removal
  amba: Make the remove callback return void
  amba: Make use of bus_type functions

 drivers/amba/bus.c                            | 234 +++++++++---------
 drivers/char/hw_random/nomadik-rng.c          |   3 +-
 drivers/dma/pl330.c                           |   3 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |   4 +-
 drivers/hwtracing/coresight/coresight-catu.c  |   3 +-
 .../hwtracing/coresight/coresight-cpu-debug.c |   4 +-
 .../hwtracing/coresight/coresight-cti-core.c  |   4 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   4 +-
 .../coresight/coresight-etm3x-core.c          |   4 +-
 .../coresight/coresight-etm4x-core.c          |   4 +-
 .../hwtracing/coresight/coresight-funnel.c    |   4 +-
 .../coresight/coresight-replicator.c          |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   4 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c  |   4 +-
 drivers/i2c/busses/i2c-nomadik.c              |   4 +-
 drivers/input/serio/ambakmi.c                 |   3 +-
 drivers/memory/pl172.c                        |   4 +-
 drivers/memory/pl353-smc.c                    |   4 +-
 drivers/mmc/host/mmci.c                       |   4 +-
 drivers/rtc/rtc-pl030.c                       |   4 +-
 drivers/rtc/rtc-pl031.c                       |   4 +-
 drivers/spi/spi-pl022.c                       |   5 +-
 drivers/tty/serial/amba-pl010.c               |   4 +-
 drivers/tty/serial/amba-pl011.c               |   3 +-
 drivers/vfio/platform/vfio_amba.c             |  15 +-
 drivers/video/fbdev/amba-clcd.c               |   4 +-
 drivers/watchdog/sp805_wdt.c                  |   4 +-
 include/linux/amba/bus.h                      |   2 +-
 sound/arm/aaci.c                              |   4 +-
 30 files changed, 157 insertions(+), 198 deletions(-)


base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.29.2

