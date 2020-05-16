Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213991D5F18
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 08:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5B11669;
	Sat, 16 May 2020 08:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5B11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589610471;
	bh=BP0KmP6gu5cNCsV3+1e9mFG9i8XlgN7sHseImi+M930=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RiD32tBzq/VXX/KMwyMzExfJZ+bUV3FPZJEfRNvpXl53ZfHkY+6la2vK4oRW3W8tQ
	 if26AGOWnmTICzi3h1uK+ixbMJvm+ouiIqZyLanbM7LQ1crMRbCj52l/YivuA4A/G7
	 leqD8MyBOkLb8LRD+hSUjpLpARDbEhmkbWNzYAO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9F8F8014C;
	Sat, 16 May 2020 08:26:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C185BF80158; Sat, 16 May 2020 08:26:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83791F800FE
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 08:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83791F800FE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 758A8ABEC
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 06:26:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix potential race in unsol event handler
Date: Sat, 16 May 2020 08:25:56 +0200
Message-Id: <20200516062556.30951-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

The unsol event handling code has a loop retrieving the read/write
indices and the arrays without locking while the append to the array
may happen concurrently.  This may lead to some inconsistency.
Although there hasn't been any proof of this bad results, it's still
safer to protect the racy accesses.

This patch adds the spinlock protection around the unsol handling loop
for addressing it.  Here we take bus->reg_lock as the writer side
snd_hdac_bus_queue_event() is also protected by that lock.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_bus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 26b391be3656..09ddab5f5cae 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -160,6 +160,7 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 	struct hdac_driver *drv;
 	unsigned int rp, caddr, res;
 
+	spin_lock_irq(&bus->reg_lock);
 	while (bus->unsol_rp != bus->unsol_wp) {
 		rp = (bus->unsol_rp + 1) % HDA_UNSOL_QUEUE_SIZE;
 		bus->unsol_rp = rp;
@@ -171,10 +172,13 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 		codec = bus->caddr_tbl[caddr & 0x0f];
 		if (!codec || !codec->dev.driver)
 			continue;
+		spin_unlock_irq(&bus->reg_lock);
 		drv = drv_to_hdac_driver(codec->dev.driver);
 		if (drv->unsol_event)
 			drv->unsol_event(codec, res);
+		spin_lock_irq(&bus->reg_lock);
 	}
+	spin_unlock_irq(&bus->reg_lock);
 }
 
 /**
-- 
2.25.0

