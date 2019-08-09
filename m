Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB787D36
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 16:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B351615;
	Fri,  9 Aug 2019 16:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B351615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565362301;
	bh=Uo2b3oP36F+AXbmeqv6WtP6nxtlbh9/+k2ZUVy6I1ZI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXCgpbJcAHFeQIXK4vZnc1pAQ9QhmhLksJ16zLNYSupRw7JWxYlwX8nt2GLwZk2dK
	 vYT3RfMsCq5U5j1mRjsspdjnhImSlogDDMXtXTp3dk8fC6M9g3lOFTlCKrV3gAPQ7D
	 ATvcOZJhkMuY8EvEyXQkcHHY7mgn3CRfy9Bu9AJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43E22F803F3;
	Fri,  9 Aug 2019 16:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4D9FF803F3; Fri,  9 Aug 2019 16:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6DB6F801A4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 16:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6DB6F801A4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB756AF7A
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:49:50 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 16:49:49 +0200
Message-Id: <20190809144949.17579-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda - Inform too slow responses
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For the sake of debugging, show each response that took too long time
and its corresponding last verb.  Since such an error happens in
series once when started, use the ratelimited variant for suppressing
the flood.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 462559442f7a..6387c7e90918 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -794,6 +794,7 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 	unsigned long timeout;
 	unsigned long loopcounter;
 	int do_poll = 0;
+	bool warned = false;
 
  again:
 	timeout = jiffies + msecs_to_jiffies(1000);
@@ -813,9 +814,17 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 		spin_unlock_irq(&bus->reg_lock);
 		if (time_after(jiffies, timeout))
 			break;
-		if (hbus->needs_damn_long_delay || loopcounter > 3000)
+#define LOOP_COUNT_MAX	3000
+		if (hbus->needs_damn_long_delay ||
+		    loopcounter > LOOP_COUNT_MAX) {
+			if (loopcounter > LOOP_COUNT_MAX && !warned) {
+				dev_dbg_ratelimited(chip->card->dev,
+						    "too slow response, last cmd=%#08x\n",
+						    bus->last_cmd[addr]);
+				warned = true;
+			}
 			msleep(2); /* temporary workaround */
-		else {
+		} else {
 			udelay(10);
 			cond_resched();
 		}
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
