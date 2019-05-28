Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5992BFF1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 09:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABE0F17EC;
	Tue, 28 May 2019 09:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABE0F17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559027746;
	bh=j0sPHgNiGOYJItvHuuL5nO7JdwnVXSksM3xBzrJ05Yk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sK16Cd3Xi3Z/vp7EIkdQ10VdYy2ztAQ9zcDLZ4dLMIWHUqAf4bHZsBNJi6fx5fcoF
	 EjcSg+BMYcK2F87x1SN5q0s6AMMVidzvMPlK/GmVOXFjMofGcoJ6ty/cHA1P2ZmD+X
	 YMlIvHiOj5HRUHLRRvURvLZ8xCBKnh3e+KIC96PE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA73F89733;
	Tue, 28 May 2019 09:12:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C91FFF89719; Tue, 28 May 2019 09:12:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 099BDF896EB
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099BDF896EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E2A6AEB0
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 07:12:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 28 May 2019 09:11:58 +0200
Message-Id: <20190528071201.27400-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528071201.27400-1-tiwai@suse.de>
References: <20190528071201.27400-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH v2 2/5] ALSA: line6: podhd: Rewrite complex
	timer & work combo with a delayed work
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

POD HD driver had a complex staged startup sequence with both timer
and work.  This patch simplifies it to a single delayed work with a
single stage.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/podhd.c | 74 ++++++-------------------------------------------
 1 file changed, 8 insertions(+), 66 deletions(-)

diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index 5f3c87264e66..722fc5db09c5 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -22,16 +22,6 @@
 
 #define PODHD_STARTUP_DELAY 500
 
-/*
- * Stages of POD startup procedure
- */
-enum {
-	PODHD_STARTUP_INIT = 1,
-	PODHD_STARTUP_SCHEDULE_WORKQUEUE,
-	PODHD_STARTUP_SETUP,
-	PODHD_STARTUP_LAST = PODHD_STARTUP_SETUP - 1
-};
-
 enum {
 	LINE6_PODHD300,
 	LINE6_PODHD400,
@@ -47,15 +37,6 @@ struct usb_line6_podhd {
 	/* Generic Line 6 USB data */
 	struct usb_line6 line6;
 
-	/* Timer for device initialization */
-	struct timer_list startup_timer;
-
-	/* Work handler for device initialization */
-	struct work_struct startup_work;
-
-	/* Current progress in startup procedure */
-	int startup_progress;
-
 	/* Serial number of device */
 	u32 serial_number;
 
@@ -158,10 +139,6 @@ static struct line6_pcm_properties podx3_pcm_properties = {
 };
 static struct usb_driver podhd_driver;
 
-static void podhd_startup_start_workqueue(struct timer_list *t);
-static void podhd_startup_workqueue(struct work_struct *work);
-static int podhd_startup_finalize(struct usb_line6_podhd *pod);
-
 static ssize_t serial_number_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -202,26 +179,6 @@ static const struct attribute_group podhd_dev_attr_group = {
  * audio nor bulk interfaces to work.
  */
 
-static void podhd_startup(struct usb_line6_podhd *pod)
-{
-	CHECK_STARTUP_PROGRESS(pod->startup_progress, PODHD_STARTUP_INIT);
-
-	/* delay startup procedure: */
-	line6_start_timer(&pod->startup_timer, PODHD_STARTUP_DELAY,
-		podhd_startup_start_workqueue);
-}
-
-static void podhd_startup_start_workqueue(struct timer_list *t)
-{
-	struct usb_line6_podhd *pod = from_timer(pod, t, startup_timer);
-
-	CHECK_STARTUP_PROGRESS(pod->startup_progress,
-		PODHD_STARTUP_SCHEDULE_WORKQUEUE);
-
-	/* schedule work for global work queue: */
-	schedule_work(&pod->startup_work);
-}
-
 static int podhd_dev_start(struct usb_line6_podhd *pod)
 {
 	int ret;
@@ -272,25 +229,14 @@ static int podhd_dev_start(struct usb_line6_podhd *pod)
 	return ret;
 }
 
-static void podhd_startup_workqueue(struct work_struct *work)
+static void podhd_startup(struct usb_line6 *line6)
 {
-	struct usb_line6_podhd *pod =
-	    container_of(work, struct usb_line6_podhd, startup_work);
-
-	CHECK_STARTUP_PROGRESS(pod->startup_progress, PODHD_STARTUP_SETUP);
+	struct usb_line6_podhd *pod = (struct usb_line6_podhd *)line6;
 
 	podhd_dev_start(pod);
 	line6_read_serial_number(&pod->line6, &pod->serial_number);
-
-	podhd_startup_finalize(pod);
-}
-
-static int podhd_startup_finalize(struct usb_line6_podhd *pod)
-{
-	struct usb_line6 *line6 = &pod->line6;
-
-	/* ALSA audio interface: */
-	return snd_card_register(line6->card);
+	if (snd_card_register(line6->card))
+		dev_err(line6->ifcdev, "Failed to register POD HD card.\n");
 }
 
 static void podhd_disconnect(struct usb_line6 *line6)
@@ -300,9 +246,6 @@ static void podhd_disconnect(struct usb_line6 *line6)
 	if (pod->line6.properties->capabilities & LINE6_CAP_CONTROL_INFO) {
 		struct usb_interface *intf;
 
-		del_timer_sync(&pod->startup_timer);
-		cancel_work_sync(&pod->startup_work);
-
 		intf = usb_ifnum_to_if(line6->usbdev,
 					pod->line6.properties->ctrl_if);
 		if (intf)
@@ -321,9 +264,7 @@ static int podhd_init(struct usb_line6 *line6,
 	struct usb_interface *intf;
 
 	line6->disconnect = podhd_disconnect;
-
-	timer_setup(&pod->startup_timer, NULL, 0);
-	INIT_WORK(&pod->startup_work, podhd_startup_workqueue);
+	line6->startup = podhd_startup;
 
 	if (pod->line6.properties->capabilities & LINE6_CAP_CONTROL) {
 		/* claim the data interface */
@@ -362,11 +303,12 @@ static int podhd_init(struct usb_line6 *line6,
 
 	if (!(pod->line6.properties->capabilities & LINE6_CAP_CONTROL_INFO)) {
 		/* register USB audio system directly */
-		return podhd_startup_finalize(pod);
+		return snd_card_register(line6->card);
 	}
 
 	/* init device and delay registering */
-	podhd_startup(pod);
+	schedule_delayed_work(&line6->startup_work,
+			      msecs_to_jiffies(PODHD_STARTUP_DELAY));
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
