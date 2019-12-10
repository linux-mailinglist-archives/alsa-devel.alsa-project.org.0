Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E2118C23
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E181710;
	Tue, 10 Dec 2019 16:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E181710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990682;
	bh=3eSi3RgPuLOYsYUKDdnsvQGwmeuFtCESrhuqojEovIo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NgXhxoTKT4g0dCiyySvfbUqvTAC+Mp2Px7Ci9tiAZ8U4d+F7EfvACoZ7QFusWumc7
	 fC3ThCXCh8ycCrUMHQVJmrRMA9NrepWKc8KeCPYPZzvYbyBk4Q1jkW5bAdYCNJjbSR
	 w7spVgq31Kthc8s6ohREdlCHkRcJFTAJj+kUYyLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E137AF80266;
	Tue, 10 Dec 2019 15:57:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A43F80266; Tue, 10 Dec 2019 15:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37B2DF80217
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37B2DF80217
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB274AE8D
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:57:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 15:57:27 +0100
Message-Id: <20191210145727.22054-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda: Use standard waitqueue for RIRB
	wakeup
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

The HD-audio CORB/RIRB communication was programmed in a way that was
documented in the reference in decades ago, which is essentially a
polling in the waiter side.  It's working fine but costs CPU cycles on
some platforms that support only slow communications.  Also, for some
platforms that had unreliable communications, we put longer wait time
(2 ms), which accumulate quite long time if you execute many verbs in
a shot (e.g. at the initialization or resume phase).

This patch attempts to improve the situation by introducing the
standard waitqueue in the RIRB waiter side instead of polling.  The
test results on my machine show significant improvements.  The time
spent for "cat /proc/asound/card*/codec#*" were changed like:

* Intel SKL + Realtek codec
  before the patch:
   0.00user 0.04system 0:00.10elapsed 40.0%CPU
  after the patch:
   0.00user 0.01system 0:00.10elapsed 10.0%CPU

* Nvidia GP107GL + Nvidia HDMI codec
  before the patch:
   0.00user 0.00system 0:02.76elapsed 0.0%CPU
  after the patch:
   0.00user 0.00system 0:00.01elapsed 17.0%CPU

So, for Intel chips, the total time is same, while the total time is
greatly reduced (from 2.76 to 0.01s) for Nvidia chips.
The only negative data here is the increase of CPU time for Nvidia,
but this is the unavoidable cost for faster wakeups, supposedly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h        |  1 +
 sound/hda/hdac_bus.c           |  1 +
 sound/hda/hdac_controller.c    |  3 +++
 sound/pci/hda/hda_controller.c | 29 ++++++++++++++---------------
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index e05b95e83d5a..81373a2efd96 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -317,6 +317,7 @@ struct hdac_bus {
 	struct hdac_rb corb;
 	struct hdac_rb rirb;
 	unsigned int last_cmd[HDA_MAX_CODECS];	/* last sent command */
+	wait_queue_head_t rirb_wq;
 
 	/* CORB/RIRB and position buffers */
 	struct snd_dma_buffer rb;
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 8f19876244eb..48b227fff204 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -43,6 +43,7 @@ int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 	mutex_init(&bus->cmd_mutex);
 	mutex_init(&bus->lock);
 	INIT_LIST_HEAD(&bus->hlink_list);
+	init_waitqueue_head(&bus->rirb_wq);
 	bus->irq = -1;
 	return 0;
 }
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 7e7be8e4dcf9..cd1c3b282657 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -216,6 +216,9 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
 		else if (bus->rirb.cmds[addr]) {
 			bus->rirb.res[addr] = res;
 			bus->rirb.cmds[addr]--;
+			if (!bus->rirb.cmds[addr] &&
+			    waitqueue_active(&bus->rirb_wq))
+				wake_up(&bus->rirb_wq);
 		} else {
 			dev_err_ratelimited(bus->dev,
 				"spurious response %#x:%#x, last cmd=%#08x\n",
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 2f3b7a35f2d9..f30a053d981e 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -792,21 +792,25 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 	struct hda_bus *hbus = &chip->bus;
 	unsigned long timeout;
 	unsigned long loopcounter;
-	int do_poll = 0;
+	wait_queue_entry_t wait;
 	bool warned = false;
 
+	init_wait_entry(&wait, 0);
  again:
 	timeout = jiffies + msecs_to_jiffies(1000);
 
 	for (loopcounter = 0;; loopcounter++) {
 		spin_lock_irq(&bus->reg_lock);
-		if (bus->polling_mode || do_poll)
+		if (!bus->polling_mode)
+			prepare_to_wait(&bus->rirb_wq, &wait,
+					TASK_UNINTERRUPTIBLE);
+		if (bus->polling_mode)
 			snd_hdac_bus_update_rirb(bus);
 		if (!bus->rirb.cmds[addr]) {
-			if (!do_poll)
-				bus->poll_count = 0;
 			if (res)
 				*res = bus->rirb.res[addr]; /* the last value */
+			if (!bus->polling_mode)
+				finish_wait(&bus->rirb_wq, &wait);
 			spin_unlock_irq(&bus->reg_lock);
 			return 0;
 		}
@@ -814,7 +818,9 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 		if (time_after(jiffies, timeout))
 			break;
 #define LOOP_COUNT_MAX	3000
-		if (hbus->needs_damn_long_delay ||
+		if (!bus->polling_mode) {
+			schedule_timeout(msecs_to_jiffies(2));
+		} else if (hbus->needs_damn_long_delay ||
 		    loopcounter > LOOP_COUNT_MAX) {
 			if (loopcounter > LOOP_COUNT_MAX && !warned) {
 				dev_dbg_ratelimited(chip->card->dev,
@@ -829,19 +835,12 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 		}
 	}
 
+	if (!bus->polling_mode)
+		finish_wait(&bus->rirb_wq, &wait);
+
 	if (hbus->no_response_fallback)
 		return -EIO;
 
-	if (!bus->polling_mode && bus->poll_count < 2) {
-		dev_dbg(chip->card->dev,
-			"azx_get_response timeout, polling the codec once: last cmd=0x%08x\n",
-			bus->last_cmd[addr]);
-		do_poll = 1;
-		bus->poll_count++;
-		goto again;
-	}
-
-
 	if (!bus->polling_mode) {
 		dev_warn(chip->card->dev,
 			 "azx_get_response timeout, switching to polling mode: last cmd=0x%08x\n",
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
