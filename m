Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95E2BFED
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 09:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C353917ED;
	Tue, 28 May 2019 09:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C353917ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559027640;
	bh=jMgvfIjw6aJ+nL/yOi7lc1kZkpMT2o6KLC0B4EvQodg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snvHkHIYkjtjlVA1AMhjdpdFGexGOXc71K7WzAw+qiEvGy18yhakmxJKdecx9YGuK
	 kiOMb4v/XvvyQSSBTVHD63Ljba9EawOrilxOY1Xmw41I7emr+LkRHhcONTgD/FeKvt
	 +iEhyxYCXAk7KKIcyJVb9Z+7zqIF+u4v/DPXMvoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E499F896EB;
	Tue, 28 May 2019 09:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA2CF8971D; Tue, 28 May 2019 09:12:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEBC4F808F6
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEBC4F808F6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FF18AE2E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 07:12:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 28 May 2019 09:11:57 +0200
Message-Id: <20190528071201.27400-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528071201.27400-1-tiwai@suse.de>
References: <20190528071201.27400-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH v2 1/5] ALSA: line6: pod: Rewrite complex timer
	& work combo with a delayed work
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

The POD driver had a complex staged startup procedure using both timer
and work.  This patch simplifies it via a single delayed work with the
reduced stages.

Now basically only two intermediate stages:
- POD_STARTUP_VERSIONREQ:
  requesting the version information and the process_message callback
  triggers the next stage,
- POD_STARTUP_SETUP:
  registering the actual card object.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/pod.c | 96 +++++++++++++++------------------------------------
 1 file changed, 27 insertions(+), 69 deletions(-)

diff --git a/sound/usb/line6/pod.c b/sound/usb/line6/pod.c
index ce45b6dab651..995e6ccc8122 100644
--- a/sound/usb/line6/pod.c
+++ b/sound/usb/line6/pod.c
@@ -39,11 +39,9 @@
 	Stages of POD startup procedure
 */
 enum {
-	POD_STARTUP_INIT = 1,
 	POD_STARTUP_VERSIONREQ,
-	POD_STARTUP_WORKQUEUE,
 	POD_STARTUP_SETUP,
-	POD_STARTUP_LAST = POD_STARTUP_SETUP - 1
+	POD_STARTUP_DONE,
 };
 
 enum {
@@ -63,12 +61,6 @@ struct usb_line6_pod {
 	/* Instrument monitor level */
 	int monitor_level;
 
-	/* Timer for device initialization */
-	struct timer_list startup_timer;
-
-	/* Work handler for device initialization */
-	struct work_struct startup_work;
-
 	/* Current progress in startup procedure */
 	int startup_progress;
 
@@ -173,10 +165,6 @@ static const char pod_version_header[] = {
 	0xf2, 0x7e, 0x7f, 0x06, 0x02
 };
 
-/* forward declarations: */
-static void pod_startup2(struct timer_list *t);
-static void pod_startup3(struct usb_line6_pod *pod);
-
 static char *pod_alloc_sysex_buffer(struct usb_line6_pod *pod, int code,
 				    int size)
 {
@@ -196,7 +184,10 @@ static void line6_pod_process_message(struct usb_line6 *line6)
 		pod->firmware_version = buf[13] * 100 + buf[14] * 10 + buf[15];
 		pod->device_id = ((int)buf[8] << 16) | ((int)buf[9] << 8) |
 				 (int) buf[10];
-		pod_startup3(pod);
+		if (pod->startup_progress == POD_STARTUP_VERSIONREQ) {
+			pod->startup_progress = POD_STARTUP_SETUP;
+			schedule_delayed_work(&line6->startup_work, 0);
+		}
 		return;
 	}
 
@@ -281,47 +272,27 @@ static ssize_t device_id_show(struct device *dev,
 	context). After the last one has finished, the device is ready to use.
 */
 
-static void pod_startup1(struct usb_line6_pod *pod)
-{
-	CHECK_STARTUP_PROGRESS(pod->startup_progress, POD_STARTUP_INIT);
-
-	/* delay startup procedure: */
-	line6_start_timer(&pod->startup_timer, POD_STARTUP_DELAY, pod_startup2);
-}
-
-static void pod_startup2(struct timer_list *t)
+static void pod_startup(struct usb_line6 *line6)
 {
-	struct usb_line6_pod *pod = from_timer(pod, t, startup_timer);
-	struct usb_line6 *line6 = &pod->line6;
-
-	CHECK_STARTUP_PROGRESS(pod->startup_progress, POD_STARTUP_VERSIONREQ);
-
-	/* request firmware version: */
-	line6_version_request_async(line6);
-}
-
-static void pod_startup3(struct usb_line6_pod *pod)
-{
-	CHECK_STARTUP_PROGRESS(pod->startup_progress, POD_STARTUP_WORKQUEUE);
-
-	/* schedule work for global work queue: */
-	schedule_work(&pod->startup_work);
-}
-
-static void pod_startup4(struct work_struct *work)
-{
-	struct usb_line6_pod *pod =
-	    container_of(work, struct usb_line6_pod, startup_work);
-	struct usb_line6 *line6 = &pod->line6;
-
-	CHECK_STARTUP_PROGRESS(pod->startup_progress, POD_STARTUP_SETUP);
-
-	/* serial number: */
-	line6_read_serial_number(&pod->line6, &pod->serial_number);
+	struct usb_line6_pod *pod = (struct usb_line6_pod *) line6;
 
-	/* ALSA audio interface: */
-	if (snd_card_register(line6->card))
-		dev_err(line6->ifcdev, "Failed to register POD card.\n");
+	switch (pod->startup_progress) {
+	case POD_STARTUP_VERSIONREQ:
+		/* request firmware version: */
+		line6_version_request_async(line6);
+		break;
+	case POD_STARTUP_SETUP:
+		/* serial number: */
+		line6_read_serial_number(&pod->line6, &pod->serial_number);
+
+		/* ALSA audio interface: */
+		if (snd_card_register(line6->card))
+			dev_err(line6->ifcdev, "Failed to register POD card.\n");
+		pod->startup_progress = POD_STARTUP_DONE;
+		break;
+	default:
+		break;
+	}
 }
 
 /* POD special files: */
@@ -390,17 +361,6 @@ static const struct snd_kcontrol_new pod_control_monitor = {
 	.put = snd_pod_control_monitor_put
 };
 
-/*
-	POD device disconnected.
-*/
-static void line6_pod_disconnect(struct usb_line6 *line6)
-{
-	struct usb_line6_pod *pod = (struct usb_line6_pod *)line6;
-
-	del_timer_sync(&pod->startup_timer);
-	cancel_work_sync(&pod->startup_work);
-}
-
 /*
 	 Try to init POD device.
 */
@@ -411,10 +371,7 @@ static int pod_init(struct usb_line6 *line6,
 	struct usb_line6_pod *pod = (struct usb_line6_pod *) line6;
 
 	line6->process_message = line6_pod_process_message;
-	line6->disconnect = line6_pod_disconnect;
-
-	timer_setup(&pod->startup_timer, NULL, 0);
-	INIT_WORK(&pod->startup_work, pod_startup4);
+	line6->startup = pod_startup;
 
 	/* create sysfs entries: */
 	err = snd_card_add_dev_attr(line6->card, &pod_dev_attr_group);
@@ -447,7 +404,8 @@ static int pod_init(struct usb_line6 *line6,
 		pod->monitor_level = POD_SYSTEM_INVALID;
 
 		/* initiate startup procedure: */
-		pod_startup1(pod);
+		schedule_delayed_work(&line6->startup_work,
+				      msecs_to_jiffies(POD_STARTUP_DELAY));
 	}
 
 	return 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
