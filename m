Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D22BFE1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 09:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0CA17DD;
	Tue, 28 May 2019 09:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0CA17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559027333;
	bh=Oi1riNA9FWW7sNnzrI/lwwKDizYwIrh7bmNVZJV1tc8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gpzjlVjjuVaAHnz/7L67rRssE/G4nKE5HIcYE2snKONSdmLxm1HOIw408nlHhFJBJ
	 iLf6kp9PkD07eDBS8ZWxr8sGMLt84DqGrY76lonD3Gb79+JqPk3bRwPV1JnuXIWvPj
	 ZHhFb6d6Hgi8EBJpbfIn8KQmcujlZyVtlbTApfpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC97F808F6;
	Tue, 28 May 2019 09:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 382ACF896EB; Tue, 28 May 2019 09:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2867CF8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2867CF8072E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3968BAC8D
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 07:07:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 28 May 2019 09:06:57 +0200
Message-Id: <20190528070657.26125-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: line6: Assure canceling delayed work at
	disconnection
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

The current code performs the cancel of a delayed work at the late
stage of disconnection procedure, which may lead to the access to the
already cleared state.

This patch assures to call cancel_delayed_work_sync() at the beginning
of the disconnection procedure for avoiding that race.  The delayed
work object is now assigned in the common line6 object instead of its
derivative, so that we can call cancel_delayed_work_sync().

Along with the change, the startup function is called via the new
callback instead.  This will make it easier to port other LINE6
drivers to use the delayed work for startup in later patches.

Reported-by: syzbot+5255458d5e0a2b10bbb9@syzkaller.appspotmail.com
Fixes: 7f84ff68be05 ("ALSA: line6: toneport: Fix broken usage of timer for delayed execution")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/driver.c   | 12 ++++++++++++
 sound/usb/line6/driver.h   |  4 ++++
 sound/usb/line6/toneport.c | 15 +++------------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index b61f65bed4e4..2b57854335b3 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -720,6 +720,15 @@ static int line6_init_cap_control(struct usb_line6 *line6)
 	return 0;
 }
 
+static void line6_startup_work(struct work_struct *work)
+{
+	struct usb_line6 *line6 =
+		container_of(work, struct usb_line6, startup_work.work);
+
+	if (line6->startup)
+		line6->startup(line6);
+}
+
 /*
 	Probe USB device.
 */
@@ -755,6 +764,7 @@ int line6_probe(struct usb_interface *interface,
 	line6->properties = properties;
 	line6->usbdev = usbdev;
 	line6->ifcdev = &interface->dev;
+	INIT_DELAYED_WORK(&line6->startup_work, line6_startup_work);
 
 	strcpy(card->id, properties->id);
 	strcpy(card->driver, driver_name);
@@ -825,6 +835,8 @@ void line6_disconnect(struct usb_interface *interface)
 	if (WARN_ON(usbdev != line6->usbdev))
 		return;
 
+	cancel_delayed_work(&line6->startup_work);
+
 	if (line6->urb_listen != NULL)
 		line6_stop_listen(line6);
 
diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index 61425597eb61..650d909c9c4f 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -178,11 +178,15 @@ struct usb_line6 {
 			fifo;
 	} messages;
 
+	/* Work for delayed PCM startup */
+	struct delayed_work startup_work;
+
 	/* If MIDI is supported, buffer_message contains the pre-processed data;
 	 * otherwise the data is only in urb_listen (buffer_incoming).
 	 */
 	void (*process_message)(struct usb_line6 *);
 	void (*disconnect)(struct usb_line6 *line6);
+	void (*startup)(struct usb_line6 *line6);
 };
 
 extern char *line6_alloc_sysex_buffer(struct usb_line6 *line6, int code1,
diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index e28368d8eba2..55865f7e437d 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -54,9 +54,6 @@ struct usb_line6_toneport {
 	/* Firmware version (x 100) */
 	u8 firmware_version;
 
-	/* Work for delayed PCM startup */
-	struct delayed_work pcm_work;
-
 	/* Device type */
 	enum line6_device_type type;
 
@@ -241,12 +238,8 @@ static int snd_toneport_source_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static void toneport_start_pcm(struct work_struct *work)
+static void toneport_startup(struct usb_line6 *line6)
 {
-	struct usb_line6_toneport *toneport =
-		container_of(work, struct usb_line6_toneport, pcm_work.work);
-	struct usb_line6 *line6 = &toneport->line6;
-
 	line6_pcm_acquire(line6->line6pcm, LINE6_STREAM_MONITOR, true);
 }
 
@@ -394,7 +387,7 @@ static int toneport_setup(struct usb_line6_toneport *toneport)
 	if (toneport_has_led(toneport))
 		toneport_update_led(toneport);
 
-	schedule_delayed_work(&toneport->pcm_work,
+	schedule_delayed_work(&toneport->line6.startup_work,
 			      msecs_to_jiffies(TONEPORT_PCM_DELAY * 1000));
 	return 0;
 }
@@ -407,8 +400,6 @@ static void line6_toneport_disconnect(struct usb_line6 *line6)
 	struct usb_line6_toneport *toneport =
 		(struct usb_line6_toneport *)line6;
 
-	cancel_delayed_work_sync(&toneport->pcm_work);
-
 	if (toneport_has_led(toneport))
 		toneport_remove_leds(toneport);
 }
@@ -424,9 +415,9 @@ static int toneport_init(struct usb_line6 *line6,
 	struct usb_line6_toneport *toneport =  (struct usb_line6_toneport *) line6;
 
 	toneport->type = id->driver_info;
-	INIT_DELAYED_WORK(&toneport->pcm_work, toneport_start_pcm);
 
 	line6->disconnect = line6_toneport_disconnect;
+	line6->startup = toneport_startup;
 
 	/* initialize PCM subsystem: */
 	err = line6_init_pcm(line6, &toneport_pcm_properties);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
