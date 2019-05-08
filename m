Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A617C95
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 16:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1E117B0;
	Wed,  8 May 2019 16:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1E117B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557327180;
	bh=9DPxwVC+j44QA5NrR9vy8V90Hn8Zz3ap4Pw71qxSU14=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlLuNCaCE//BjDSju07BKedqSZ6jp8vn0NRIiYlwvITlv8YNVAba6f/1NgIqKUPFq
	 iAR5KAcEFiUIE+9u8GewB4FRPo3I1pVVDwYr/+SKX7ubCaH9jVn0f5q99Ss0BONV0x
	 ZG5iSjASvs5AZid9ov/IuYvAewDlFXE8v+8PJtKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE032F89729;
	Wed,  8 May 2019 16:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1C15F896E6; Wed,  8 May 2019 16:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC6B4F896FD
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 16:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6B4F896FD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 326F4AF34
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 14:49:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  8 May 2019 16:49:43 +0200
Message-Id: <20190508144943.8139-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190508144943.8139-1-tiwai@suse.de>
References: <20190508144943.8139-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 4/4] ALSA: line6: Drop superfluous timer helper
	function
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

Now all timer usages in line6 drivers are gone, we can get rid of some
helper macro and function that became superfluous.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/driver.c | 11 -----------
 sound/usb/line6/driver.h |  9 ---------
 2 files changed, 20 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index b61f65bed4e4..b1c9be4bbd0f 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -195,17 +195,6 @@ static int line6_send_raw_message_async_part(struct message *msg,
 	return retval;
 }
 
-/*
-	Setup and start timer.
-*/
-void line6_start_timer(struct timer_list *timer, unsigned long msecs,
-		       void (*function)(struct timer_list *t))
-{
-	timer->function = function;
-	mod_timer(timer, jiffies + msecs_to_jiffies(msecs));
-}
-EXPORT_SYMBOL_GPL(line6_start_timer);
-
 /*
 	Asynchronously send raw message.
 */
diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index 61425597eb61..0bd6a5cff539 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -68,13 +68,6 @@
 
 #define LINE6_CHANNEL_MASK 0x0f
 
-#define CHECK_STARTUP_PROGRESS(x, n)	\
-do {					\
-	if ((x) >= (n))			\
-		return;			\
-	x = (n);			\
-} while (0)
-
 extern const unsigned char line6_midi_id[3];
 
 static const int SYSEX_DATA_OFS = sizeof(line6_midi_id) + 3;
@@ -197,8 +190,6 @@ extern int line6_send_sysex_message(struct usb_line6 *line6,
 				    const char *buffer, int size);
 extern ssize_t line6_set_raw(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count);
-extern void line6_start_timer(struct timer_list *timer, unsigned long msecs,
-			      void (*function)(struct timer_list *t));
 extern int line6_version_request_async(struct usb_line6 *line6);
 extern int line6_write_data(struct usb_line6 *line6, unsigned address,
 			    void *data, unsigned datalen);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
