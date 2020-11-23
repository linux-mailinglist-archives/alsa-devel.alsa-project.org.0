Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0AB2C01EA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF8716E3;
	Mon, 23 Nov 2020 10:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF8716E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122309;
	bh=nSoMKQBFld5V+k44IkbXCKNvvN7jYjohSvt/DLU0D7I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izxoB0njL57ZvK9sjFNxovV8crwd8G7Xl5RRaSEYW5V3FmhCdzW7tqPD1wAqqrrFL
	 t1PkFandRBt5+D7cKop/6IhV2RGdeOxGyxCfqLkRrhEqT4Eo5sK92Zug60xDGDZT4A
	 TDXUAgwpyM919+NKOjiVV5OJDsBxwR/R0w3k7FzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FBA0F805C1;
	Mon, 23 Nov 2020 09:55:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5927FF80536; Mon, 23 Nov 2020 09:54:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D7F8F804E2
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D7F8F804E2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87F32AFD0;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 29/41] ALSA: usb-audio: Refactoring endpoint URB deactivation
Date: Mon, 23 Nov 2020 09:53:35 +0100
Message-Id: <20201123085347.19667-30-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

Minor code refactoring to consolidate the URB deactivation code in
endpoint.c.  A slight behavior change is that the error handling in
snd_usb_endpoint_start() leaves EP_FLAG_STOPPING now.  This should be
synced with the later PCM sync_stop callback.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 4d733b2d8287..35c84c2264e1 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -777,6 +777,9 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 	unsigned long end_time = jiffies + msecs_to_jiffies(1000);
 	int alive;
 
+	if (!test_bit(EP_FLAG_STOPPING, &ep->flags))
+		return 0;
+
 	do {
 		alive = bitmap_weight(&ep->active_mask, ep->nurbs);
 		if (!alive)
@@ -802,22 +805,31 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
  */
 void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep)
 {
-	if (ep && test_bit(EP_FLAG_STOPPING, &ep->flags))
+	if (ep)
 		wait_clear_urbs(ep);
 }
 
 /*
- * unlink active urbs.
+ * Stop and unlink active urbs.
+ *
+ * This function checks and clears EP_FLAG_RUNNING state.
+ * When @wait_sync is set, it waits until all pending URBs are killed.
  */
-static int deactivate_urbs(struct snd_usb_endpoint *ep, bool force)
+static int stop_and_unlink_urbs(struct snd_usb_endpoint *ep, bool force,
+				bool wait_sync)
 {
 	unsigned int i;
 
 	if (!force && atomic_read(&ep->chip->shutdown)) /* to be sure... */
 		return -EBADFD;
 
-	clear_bit(EP_FLAG_RUNNING, &ep->flags);
+	if (atomic_read(&ep->running))
+		return -EBUSY;
+
+	if (!test_and_clear_bit(EP_FLAG_RUNNING, &ep->flags))
+		goto out;
 
+	set_bit(EP_FLAG_STOPPING, &ep->flags);
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
 	ep->next_packet_head = 0;
 	ep->next_packet_queued = 0;
@@ -831,6 +843,9 @@ static int deactivate_urbs(struct snd_usb_endpoint *ep, bool force)
 		}
 	}
 
+ out:
+	if (wait_sync)
+		return wait_clear_urbs(ep);
 	return 0;
 }
 
@@ -845,8 +860,7 @@ static void release_urbs(struct snd_usb_endpoint *ep, int force)
 	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
 
 	/* stop urbs */
-	deactivate_urbs(ep, force);
-	wait_clear_urbs(ep);
+	stop_and_unlink_urbs(ep, force, true);
 
 	for (i = 0; i < ep->nurbs; i++)
 		release_urb_ctx(&ep->urb[i]);
@@ -1261,9 +1275,6 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (atomic_inc_return(&ep->running) != 1)
 		return 0;
 
-	/* just to be sure */
-	deactivate_urbs(ep, false);
-
 	ep->active_mask = 0;
 	ep->unlink_mask = 0;
 	ep->phase = 0;
@@ -1317,11 +1328,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	return 0;
 
 __error:
-	if (ep->sync_master)
-		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
-	clear_bit(EP_FLAG_RUNNING, &ep->flags);
-	atomic_dec(&ep->running);
-	deactivate_urbs(ep, false);
+	snd_usb_endpoint_stop(ep);
 	return -EPIPE;
 }
 
@@ -1354,10 +1361,8 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (ep->sync_master)
 		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
 
-	if (!atomic_dec_return(&ep->running)) {
-		deactivate_urbs(ep, false);
-		set_bit(EP_FLAG_STOPPING, &ep->flags);
-	}
+	if (!atomic_dec_return(&ep->running))
+		stop_and_unlink_urbs(ep, false, false);
 }
 
 /**
-- 
2.16.4

