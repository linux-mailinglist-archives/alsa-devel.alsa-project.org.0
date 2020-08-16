Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A49EE2456A0
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Aug 2020 09:57:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E76B1665;
	Sun, 16 Aug 2020 09:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E76B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597564652;
	bh=yJ/mntHS5FkM/xYl6+L3CMdwrpxDMQPdiQ+RxGiafGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hnWWo9NNSqA56srvjMcLEbOjE5YrfeEITufTGIs9TT/DDfuUX5Fsdp5YxAHNWnTgV
	 gRmvtYYb9mPNpmXo/Cm5fbk/1kf46wixeY8rxnoAfJANoSVjPokQvK3TjyFfgB6M3v
	 SWCZy3SLtNgyJ9h2m0kAORpxPw6OSTp/0g1Huywk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E8D1F802F7;
	Sun, 16 Aug 2020 09:52:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4396DF8023F; Sun, 16 Aug 2020 09:14:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9992DF800F0
 for <alsa-devel@alsa-project.org>; Sun, 16 Aug 2020 09:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9992DF800F0
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2DC612D125E6899B1B39;
 Sun, 16 Aug 2020 15:14:04 +0800 (CST)
Received: from ubuntu.huawei.com (100.120.247.70) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sun, 16 Aug 2020 15:13:53 +0800
From: Liang Wang <wangliang101@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] sound/isa:fix spelling mistakes in the comments
Date: Sun, 16 Aug 2020 15:13:09 +0800
Message-ID: <20200816071309.121461-1-wangliang101@huawei.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.120.247.70]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 16 Aug 2020 09:52:37 +0200
Cc: wangle6@huawei.com
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

Fix spelling mistakes in the comments:
	initailise ==> initialise
	tranfer ==> transfer
	Initialse ==> Initialise

Signed-off-by: Liang Wang <wangliang101@huawei.com>
---
 sound/isa/sscape.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 5363d88cc4b9..2e5a5c5279e8 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -308,7 +308,7 @@ static inline int verify_mpu401(const struct snd_mpu401 *mpu)
 }
 
 /*
- * This is apparently the standard way to initailise an MPU-401
+ * This is apparently the standard way to initialise an MPU-401
  */
 static inline void initialise_mpu401(const struct snd_mpu401 *mpu)
 {
@@ -339,7 +339,7 @@ static void soundscape_free(struct snd_card *c)
 }
 
 /*
- * Tell the SoundScape to begin a DMA tranfer using the given channel.
+ * Tell the SoundScape to begin a DMA transfer using the given channel.
  * All locking issues are left to the caller.
  */
 static void sscape_start_dma_unsafe(unsigned io_base, enum GA_REG reg)
@@ -803,7 +803,7 @@ static int mpu401_open(struct snd_mpu401 *mpu)
 }
 
 /*
- * Initialse an MPU-401 subdevice for MIDI support on the SoundScape.
+ * Initialise an MPU-401 subdevice for MIDI support on the SoundScape.
  */
 static int create_mpu401(struct snd_card *card, int devnum,
 			 unsigned long port, int irq)
-- 
2.27.0

