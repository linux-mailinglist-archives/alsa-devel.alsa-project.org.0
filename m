Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B462717BC3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 16:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D271944;
	Wed,  8 May 2019 16:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D271944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557326630;
	bh=UuEL7XSGsfbC2NXlSJHmM5MnLfO4kKEXuhGcxxXOpxo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vq84b7YqZmOcCxA8oMUXjehXYd7bT0vzegZzh0CaFxImC8kJPF9IRpWLd71GuB8EQ
	 /6ZoYx8wSDZ01bpThcfXPIbyj3t/F1mH7J143BqbxhHX/vPQDTMte4d+DK6etemXlv
	 q+8rPkdVHOL7gK7eSRphX1wrsu947DzLg/a/DXRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93111F89715;
	Wed,  8 May 2019 16:41:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F605F8970E; Wed,  8 May 2019 16:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71430F896FF
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 16:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71430F896FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9ADFFAD05
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 14:41:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  8 May 2019 16:41:51 +0200
Message-Id: <20190508144151.5061-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: line6: toneport: Fix broken usage of
	timer for delayed execution
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

The line6 toneport driver has code for some delayed initialization,
and this hits the kernel Oops because mutex and other sleepable
functions are used in the timer callback.  Fix the abuse by a delayed
work instead so that everything works gracefully.

Reported-by: syzbot+a07d0142e74fdd595cfb@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/toneport.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/usb/line6/toneport.c b/sound/usb/line6/toneport.c
index 19bee725de00..325b07b98b3c 100644
--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -54,8 +54,8 @@ struct usb_line6_toneport {
 	/* Firmware version (x 100) */
 	u8 firmware_version;
 
-	/* Timer for delayed PCM startup */
-	struct timer_list timer;
+	/* Work for delayed PCM startup */
+	struct delayed_work pcm_work;
 
 	/* Device type */
 	enum line6_device_type type;
@@ -241,9 +241,10 @@ static int snd_toneport_source_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static void toneport_start_pcm(struct timer_list *t)
+static void toneport_start_pcm(struct work_struct *work)
 {
-	struct usb_line6_toneport *toneport = from_timer(toneport, t, timer);
+	struct usb_line6_toneport *toneport =
+		container_of(work, struct usb_line6_toneport, pcm_work.work);
 	struct usb_line6 *line6 = &toneport->line6;
 
 	line6_pcm_acquire(line6->line6pcm, LINE6_STREAM_MONITOR, true);
@@ -393,7 +394,8 @@ static int toneport_setup(struct usb_line6_toneport *toneport)
 	if (toneport_has_led(toneport))
 		toneport_update_led(toneport);
 
-	mod_timer(&toneport->timer, jiffies + TONEPORT_PCM_DELAY * HZ);
+	schedule_delayed_work(&toneport->pcm_work,
+			      msecs_to_jiffies(TONEPORT_PCM_DELAY * 1000));
 	return 0;
 }
 
@@ -405,7 +407,7 @@ static void line6_toneport_disconnect(struct usb_line6 *line6)
 	struct usb_line6_toneport *toneport =
 		(struct usb_line6_toneport *)line6;
 
-	del_timer_sync(&toneport->timer);
+	cancel_delayed_work_sync(&toneport->pcm_work);
 
 	if (toneport_has_led(toneport))
 		toneport_remove_leds(toneport);
@@ -422,7 +424,7 @@ static int toneport_init(struct usb_line6 *line6,
 	struct usb_line6_toneport *toneport =  (struct usb_line6_toneport *) line6;
 
 	toneport->type = id->driver_info;
-	timer_setup(&toneport->timer, toneport_start_pcm, 0);
+	INIT_DELAYED_WORK(&toneport->pcm_work, toneport_start_pcm);
 
 	line6->disconnect = line6_toneport_disconnect;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
