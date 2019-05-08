Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF217CA1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 16:54:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E511AA6;
	Wed,  8 May 2019 16:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E511AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557327252;
	bh=U4v0BamVExGehk7Dz+um5uZInKAhG3O3/2+Ymjftd3g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7SM9odolPWL+qais0gTiy3cT9ZPoSDGdamSL2ECgrteiXywVkLR/7x/eCT/S+YcA
	 xtuwzUkBo1uZhX8N0auh5RNOR+MVuOJ5b2zGHmCUJA0zN/Oee8ODWipjXSZ6NxAt8K
	 LwEWtqGDH2qMsUh3octCHkUN3t6/AM3pksBiT+HU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2567F89732;
	Wed,  8 May 2019 16:49:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA4CF896E6; Wed,  8 May 2019 16:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4635F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 16:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4635F807B5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 25DFFAF24
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 14:49:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  8 May 2019 16:49:42 +0200
Message-Id: <20190508144943.8139-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190508144943.8139-1-tiwai@suse.de>
References: <20190508144943.8139-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/4] ALSA: line6: variax: Rewrite complex timer
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

Variax driver had a very complex and staged startup sequence using
multiple timers and a work.  This patch simplifies the procedure to a
single delayed work.

Now the startup stage consists of:
- VARIAX_STARTUP_VERSIONREQ:
  requesting the version and the message handler raises up to the next
  stage upon receiving the reply.  The request is repeated until a
  reply arrives.
- VARIAX_STARTUP_ACTIVATE:
  does activation, and queue for the next stage.
- VARIAX_STARTUP_SETUP:
  registers the card.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/variax.c | 125 ++++++++++++++---------------------------------
 1 file changed, 37 insertions(+), 88 deletions(-)

diff --git a/sound/usb/line6/variax.c b/sound/usb/line6/variax.c
index e8c852b2ce35..b56a993dd415 100644
--- a/sound/usb/line6/variax.c
+++ b/sound/usb/line6/variax.c
@@ -26,13 +26,9 @@
 	Stages of Variax startup procedure
 */
 enum {
-	VARIAX_STARTUP_INIT = 1,
 	VARIAX_STARTUP_VERSIONREQ,
-	VARIAX_STARTUP_WAIT,
 	VARIAX_STARTUP_ACTIVATE,
-	VARIAX_STARTUP_WORKQUEUE,
 	VARIAX_STARTUP_SETUP,
-	VARIAX_STARTUP_LAST = VARIAX_STARTUP_SETUP - 1
 };
 
 enum {
@@ -48,11 +44,7 @@ struct usb_line6_variax {
 	unsigned char *buffer_activate;
 
 	/* Handler for device initialization */
-	struct work_struct startup_work;
-
-	/* Timers for device initialization */
-	struct timer_list startup_timer1;
-	struct timer_list startup_timer2;
+	struct delayed_work startup_work;
 
 	/* Current progress in startup procedure */
 	int startup_progress;
@@ -81,11 +73,6 @@ static const char variax_activate[] = {
 	0xf7
 };
 
-/* forward declarations: */
-static void variax_startup2(struct timer_list *t);
-static void variax_startup4(struct timer_list *t);
-static void variax_startup5(struct timer_list *t);
-
 static void variax_activate_async(struct usb_line6_variax *variax, int a)
 {
 	variax->buffer_activate[VARIAX_OFFSET_ACTIVATE] = a;
@@ -100,74 +87,32 @@ static void variax_activate_async(struct usb_line6_variax *variax, int a)
 	context). After the last one has finished, the device is ready to use.
 */
 
-static void variax_startup1(struct usb_line6_variax *variax)
-{
-	CHECK_STARTUP_PROGRESS(variax->startup_progress, VARIAX_STARTUP_INIT);
-
-	/* delay startup procedure: */
-	line6_start_timer(&variax->startup_timer1, VARIAX_STARTUP_DELAY1,
-			  variax_startup2);
-}
-
-static void variax_startup2(struct timer_list *t)
-{
-	struct usb_line6_variax *variax = from_timer(variax, t, startup_timer1);
-	struct usb_line6 *line6 = &variax->line6;
-
-	/* schedule another startup procedure until startup is complete: */
-	if (variax->startup_progress >= VARIAX_STARTUP_LAST)
-		return;
-
-	variax->startup_progress = VARIAX_STARTUP_VERSIONREQ;
-	line6_start_timer(&variax->startup_timer1, VARIAX_STARTUP_DELAY1,
-			  variax_startup2);
-
-	/* request firmware version: */
-	line6_version_request_async(line6);
-}
-
-static void variax_startup3(struct usb_line6_variax *variax)
-{
-	CHECK_STARTUP_PROGRESS(variax->startup_progress, VARIAX_STARTUP_WAIT);
-
-	/* delay startup procedure: */
-	line6_start_timer(&variax->startup_timer2, VARIAX_STARTUP_DELAY3,
-			  variax_startup4);
-}
-
-static void variax_startup4(struct timer_list *t)
-{
-	struct usb_line6_variax *variax = from_timer(variax, t, startup_timer2);
-
-	CHECK_STARTUP_PROGRESS(variax->startup_progress,
-			       VARIAX_STARTUP_ACTIVATE);
-
-	/* activate device: */
-	variax_activate_async(variax, 1);
-	line6_start_timer(&variax->startup_timer2, VARIAX_STARTUP_DELAY4,
-			  variax_startup5);
-}
-
-static void variax_startup5(struct timer_list *t)
-{
-	struct usb_line6_variax *variax = from_timer(variax, t, startup_timer2);
-
-	CHECK_STARTUP_PROGRESS(variax->startup_progress,
-			       VARIAX_STARTUP_WORKQUEUE);
-
-	/* schedule work for global work queue: */
-	schedule_work(&variax->startup_work);
-}
-
-static void variax_startup6(struct work_struct *work)
+static void variax_startup_work(struct work_struct *work)
 {
 	struct usb_line6_variax *variax =
-	    container_of(work, struct usb_line6_variax, startup_work);
-
-	CHECK_STARTUP_PROGRESS(variax->startup_progress, VARIAX_STARTUP_SETUP);
+		container_of(work, struct usb_line6_variax, startup_work.work);
+	struct usb_line6 *line6 = &variax->line6;
 
-	/* ALSA audio interface: */
-	snd_card_register(variax->line6.card);
+	switch (variax->startup_progress) {
+	case VARIAX_STARTUP_VERSIONREQ:
+		/* repeat request until getting the response */
+		schedule_delayed_work(&variax->startup_work,
+				      VARIAX_STARTUP_DELAY1);
+		/* request firmware version: */
+		line6_version_request_async(line6);
+		break;
+	case VARIAX_STARTUP_ACTIVATE:
+		/* activate device: */
+		variax_activate_async(variax, 1);
+		variax->startup_progress = VARIAX_STARTUP_SETUP;
+		schedule_delayed_work(&variax->startup_work,
+				      VARIAX_STARTUP_DELAY4);
+		break;
+	case VARIAX_STARTUP_SETUP:
+		/* ALSA audio interface: */
+		snd_card_register(variax->line6.card);
+		break;
+	}
 }
 
 /*
@@ -186,11 +131,19 @@ static void line6_variax_process_message(struct usb_line6 *line6)
 	case LINE6_SYSEX_BEGIN:
 		if (memcmp(buf + 1, variax_init_version + 1,
 			   sizeof(variax_init_version) - 1) == 0) {
-			variax_startup3(variax);
+			if (variax->startup_progress >= VARIAX_STARTUP_ACTIVATE)
+				break;
+			variax->startup_progress = VARIAX_STARTUP_ACTIVATE;
+			cancel_delayed_work(&variax->startup_work);
+			schedule_delayed_work(&variax->startup_work,
+					      VARIAX_STARTUP_DELAY3);
 		} else if (memcmp(buf + 1, variax_init_done + 1,
 				  sizeof(variax_init_done) - 1) == 0) {
 			/* notify of complete initialization: */
-			variax_startup4(&variax->startup_timer2);
+			if (variax->startup_progress >= VARIAX_STARTUP_SETUP)
+				break;
+			cancel_delayed_work(&variax->startup_work);
+			schedule_delayed_work(&variax->startup_work, 0);
 		}
 		break;
 	}
@@ -203,9 +156,7 @@ static void line6_variax_disconnect(struct usb_line6 *line6)
 {
 	struct usb_line6_variax *variax = (struct usb_line6_variax *)line6;
 
-	del_timer(&variax->startup_timer1);
-	del_timer(&variax->startup_timer2);
-	cancel_work_sync(&variax->startup_work);
+	cancel_delayed_work_sync(&variax->startup_work);
 
 	kfree(variax->buffer_activate);
 }
@@ -222,9 +173,7 @@ static int variax_init(struct usb_line6 *line6,
 	line6->process_message = line6_variax_process_message;
 	line6->disconnect = line6_variax_disconnect;
 
-	timer_setup(&variax->startup_timer1, NULL, 0);
-	timer_setup(&variax->startup_timer2, NULL, 0);
-	INIT_WORK(&variax->startup_work, variax_startup6);
+	INIT_DELAYED_WORK(&variax->startup_work, variax_startup_work);
 
 	/* initialize USB buffers: */
 	variax->buffer_activate = kmemdup(variax_activate,
@@ -239,7 +188,7 @@ static int variax_init(struct usb_line6 *line6,
 		return err;
 
 	/* initiate startup procedure: */
-	variax_startup1(variax);
+	schedule_delayed_work(&variax->startup_work, VARIAX_STARTUP_DELAY1);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
