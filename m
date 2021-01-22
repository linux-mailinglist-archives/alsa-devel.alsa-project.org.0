Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19764300262
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 13:04:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644B01DF9;
	Fri, 22 Jan 2021 13:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644B01DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611317074;
	bh=IDS+jheizyA0wMPmmf1ejGUctoYX81w+h4zzbcDm4x8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o8FgABaZYrbXkWYD04Ho0USXagL+WGjJcrmGjfyEIcifXZhngG/6WRNGnnsnQXm8A
	 Y2S0CWcDev9hwBKJ4u5rOebtNS8ulXCT3cRrFocwZ37wllJOrk6H2uYNLpbZiYeZLz
	 TaLBX2+w+SjA+kptcPMBGDcRdlw9n3wojlVrF0ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95CD7F8015B;
	Fri, 22 Jan 2021 13:03:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 226ACF8019B; Fri, 22 Jan 2021 10:25:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [94.130.110.236])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0D68F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 10:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0D68F80129
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
 id D74D7AD996A; Fri, 22 Jan 2021 10:24:55 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pau Oliva Fora <pof@eslack.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Hannes Reinecke <hare@suse.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Finn Thain <fthain@telegraphics.com.au>,
 Michael Schmitz <schmitzmic@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2 0/3] isa: Make the remove callback for isa drivers return
 void
Date: Fri, 22 Jan 2021 10:24:46 +0100
Message-Id: <20210122092449.426097-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Jan 2021 13:02:58 +0100
Cc: alsa-devel@alsa-project.org, linux-watchdog@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org
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

Hello,

changes since v1
(https://lore.kernel.org/r/20210121204812.402589-1-uwe@kleine-koenig.org):
 - fix build failure, found by the kernel test robot
   (my grep missed the struct isa_driver embedded in struct
   radio_isa_driver). For this I introduced patch 2 and adapted patch 3
   a bit. An interdiff is below.
 - Added Acks/Reviews by Guenter Roeck, William Breathitt Gray, Marc
   Kleine-Budde, Wolfram Sang and Takashi Iwai <tiwai@suse.de>

The base-commit I specified (by hand *sigh*) in v1 was broken, must be a
cut-n-paste-error, sorry for that.

Takashi suggested to take this series via sound.git given that this is
the most affected tree. This is fine for me. Otherwise I can also
provide an immutable branch. For both variants we still need a few acks
though.

Best regards
Uwe

Uwe Kleine-König (3):
  watchdog: pcwd: drop always-false if from remove callback
  media/radio: Make radio_isa_common_remove() return void
  isa: Make the remove callback for isa drivers return void

 drivers/base/isa.c                   | 2 +-
 drivers/i2c/busses/i2c-elektor.c     | 4 +---
 drivers/i2c/busses/i2c-pca-isa.c     | 4 +---
 drivers/input/touchscreen/htcpen.c   | 4 +---
 drivers/media/radio/radio-isa.c      | 9 ++++-----
 drivers/media/radio/radio-isa.h      | 2 +-
 drivers/media/radio/radio-sf16fmr2.c | 4 +---
 drivers/net/can/sja1000/tscan1.c     | 4 +---
 drivers/net/ethernet/3com/3c509.c    | 3 +--
 drivers/scsi/advansys.c              | 3 +--
 drivers/scsi/aha1542.c               | 3 +--
 drivers/scsi/fdomain_isa.c           | 3 +--
 drivers/scsi/g_NCR5380.c             | 5 ++---
 drivers/watchdog/pcwd.c              | 7 +------
 include/linux/isa.h                  | 2 +-
 sound/isa/ad1848/ad1848.c            | 3 +--
 sound/isa/adlib.c                    | 3 +--
 sound/isa/cmi8328.c                  | 3 +--
 sound/isa/cmi8330.c                  | 3 +--
 sound/isa/cs423x/cs4231.c            | 3 +--
 sound/isa/cs423x/cs4236.c            | 3 +--
 sound/isa/es1688/es1688.c            | 3 +--
 sound/isa/es18xx.c                   | 5 ++---
 sound/isa/galaxy/galaxy.c            | 3 +--
 sound/isa/gus/gusclassic.c           | 3 +--
 sound/isa/gus/gusextreme.c           | 3 +--
 sound/isa/gus/gusmax.c               | 3 +--
 sound/isa/gus/interwave.c            | 3 +--
 sound/isa/msnd/msnd_pinnacle.c       | 3 +--
 sound/isa/opl3sa2.c                  | 3 +--
 sound/isa/opti9xx/miro.c             | 3 +--
 sound/isa/opti9xx/opti92x-ad1848.c   | 5 ++---
 sound/isa/sb/jazz16.c                | 3 +--
 sound/isa/sb/sb16.c                  | 3 +--
 sound/isa/sb/sb8.c                   | 3 +--
 sound/isa/sc6000.c                   | 3 +--
 sound/isa/sscape.c                   | 3 +--
 sound/isa/wavefront/wavefront.c      | 3 +--
 38 files changed, 44 insertions(+), 88 deletions(-)

Interdiff against v1:
diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
index ad2ac16ff12d..c591c0851fa2 100644
--- a/drivers/media/radio/radio-isa.c
+++ b/drivers/media/radio/radio-isa.c
@@ -273,8 +273,8 @@ static int radio_isa_common_probe(struct radio_isa_card *isa,
 	return res;
 }
 
-static int radio_isa_common_remove(struct radio_isa_card *isa,
-				   unsigned region_size)
+static void radio_isa_common_remove(struct radio_isa_card *isa,
+				    unsigned region_size)
 {
 	const struct radio_isa_ops *ops = isa->drv->ops;
 
@@ -285,7 +285,6 @@ static int radio_isa_common_remove(struct radio_isa_card *isa,
 	release_region(isa->io, region_size);
 	v4l2_info(&isa->v4l2_dev, "Removed radio card %s\n", isa->drv->card);
 	kfree(isa);
-	return 0;
 }
 
 int radio_isa_probe(struct device *pdev, unsigned int dev)
@@ -338,11 +337,11 @@ int radio_isa_probe(struct device *pdev, unsigned int dev)
 }
 EXPORT_SYMBOL_GPL(radio_isa_probe);
 
-int radio_isa_remove(struct device *pdev, unsigned int dev)
+void radio_isa_remove(struct device *pdev, unsigned int dev)
 {
 	struct radio_isa_card *isa = dev_get_drvdata(pdev);
 
-	return radio_isa_common_remove(isa, isa->drv->region_size);
+	radio_isa_common_remove(isa, isa->drv->region_size);
 }
 EXPORT_SYMBOL_GPL(radio_isa_remove);
 
diff --git a/drivers/media/radio/radio-isa.h b/drivers/media/radio/radio-isa.h
index 2f0736edfda8..c9159958203e 100644
--- a/drivers/media/radio/radio-isa.h
+++ b/drivers/media/radio/radio-isa.h
@@ -91,7 +91,7 @@ struct radio_isa_driver {
 
 int radio_isa_match(struct device *pdev, unsigned int dev);
 int radio_isa_probe(struct device *pdev, unsigned int dev);
-int radio_isa_remove(struct device *pdev, unsigned int dev);
+void radio_isa_remove(struct device *pdev, unsigned int dev);
 #ifdef CONFIG_PNP
 int radio_isa_pnp_probe(struct pnp_dev *dev,
 			const struct pnp_device_id *dev_id);

base-commit: e609571b5ffa3528bf85292de1ceaddac342bc1c
-- 
2.29.2

