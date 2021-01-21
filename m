Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68C2FFDBD
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:59:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8C591AC7;
	Fri, 22 Jan 2021 08:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8C591AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611302339;
	bh=K5ItIVbY3zrZU0H0FGS9vNyhRjkM/GLAxN454+ybFRw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MXWaY/8YXY4b0RL2dNAEcaSnw/dFmTt/HYYDMuNWwoFhDlS8nwtA2d1Dsf1eNGv1C
	 ATzZ8lQtjhKYfnfgzYZXYqGzFrbbyyLXDokWFsCnqVH6lfqBXLjjD0amBVmv3/QZae
	 VEjJ0y2ZV+4K2cZU71R5gWEfs8kMJxVYabv5pj1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE1C6F804ED;
	Fri, 22 Jan 2021 08:55:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70EC1F8026A; Thu, 21 Jan 2021 21:48:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [IPv6:2a01:4f8:c0c:3a97::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A7DEF80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A7DEF80162
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
 id 4F281AD8EB0; Thu, 21 Jan 2021 21:48:22 +0100 (CET)
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
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/2] isa: Make the remove callback for isa drivers return
 void
Date: Thu, 21 Jan 2021 21:48:10 +0100
Message-Id: <20210121204812.402589-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:54:41 +0100
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

as described in the commit log of the 2nd patch returning an error code
from a bus' remove callback doesn't make any difference as the driver
core ignores it and still considers the device removed.

So change the remove callback to return void to not give driver authors
an incentive to believe they could return an error.

There is only a single isa driver in the tree (assuming I didn't miss
any) that has a remove callback that can return a non zero return code.
This is "fixed" in the first patch, to make the second patch more
obviously correct.

Best regards
Uwe

Uwe Kleine-König (2):
  watchdog: pcwd: drop always-false if from remove callback
  isa: Make the remove callback for isa drivers return void

 drivers/base/isa.c                   | 2 +-
 drivers/i2c/busses/i2c-elektor.c     | 4 +---
 drivers/i2c/busses/i2c-pca-isa.c     | 4 +---
 drivers/input/touchscreen/htcpen.c   | 4 +---
 drivers/media/radio/radio-sf16fmr2.c | 4 +---
 drivers/net/can/sja1000/tscan1.c     | 4 +---
 drivers/net/ethernet/3com/3c509.c    | 3 +--
 drivers/scsi/advansys.c              | 3 +--
 drivers/scsi/aha1542.c               | 3 +--
 drivers/scsi/fdomain_isa.c           | 3 +--
 drivers/scsi/g_NCR5380.c             | 3 +--
 drivers/watchdog/pcwd.c              | 7 +------
 include/linux/isa.h                  | 2 +-
 sound/isa/ad1848/ad1848.c            | 3 +--
 sound/isa/adlib.c                    | 3 +--
 sound/isa/cmi8328.c                  | 3 +--
 sound/isa/cmi8330.c                  | 3 +--
 sound/isa/cs423x/cs4231.c            | 3 +--
 sound/isa/cs423x/cs4236.c            | 3 +--
 sound/isa/es1688/es1688.c            | 3 +--
 sound/isa/es18xx.c                   | 3 +--
 sound/isa/galaxy/galaxy.c            | 3 +--
 sound/isa/gus/gusclassic.c           | 3 +--
 sound/isa/gus/gusextreme.c           | 3 +--
 sound/isa/gus/gusmax.c               | 3 +--
 sound/isa/gus/interwave.c            | 3 +--
 sound/isa/msnd/msnd_pinnacle.c       | 3 +--
 sound/isa/opl3sa2.c                  | 3 +--
 sound/isa/opti9xx/miro.c             | 3 +--
 sound/isa/opti9xx/opti92x-ad1848.c   | 3 +--
 sound/isa/sb/jazz16.c                | 3 +--
 sound/isa/sb/sb16.c                  | 3 +--
 sound/isa/sb/sb8.c                   | 3 +--
 sound/isa/sc6000.c                   | 3 +--
 sound/isa/sscape.c                   | 3 +--
 sound/isa/wavefront/wavefront.c      | 3 +--
 36 files changed, 36 insertions(+), 79 deletions(-)


base-commit: 5a158981aafa7f29709034b17bd007b15cb29983
-- 
2.29.2
