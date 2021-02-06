Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A51311FEE
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:33:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F291607;
	Sat,  6 Feb 2021 21:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F291607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612643593;
	bh=zQ5uppxn7ygkgdocOZoS+mDOCl+e61vgreAmsr/kBjQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaYnqedqvVO2qT3D94SVt9dlEPIqqQ6kLhVvVjCPcJbrgaxII81Qz3ErecVzexwsv
	 X3PGJHuwuh9XCM+QC6N0XnnWcuuBEREtFTO9WWaVbrEC6KBIMKOXL/z1R/1niUIav5
	 +gsEOZ/9u/CsjAsHoHiy2YkTV8sWoy/+zb+GRRHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A87EAF8023E;
	Sat,  6 Feb 2021 21:31:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C72FEF80095; Sat,  6 Feb 2021 21:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 313F4F801F7
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 21:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 313F4F801F7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA39AAC43
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 20:30:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: usb-audio: Handle invalid running state at
 releasing EP
Date: Sat,  6 Feb 2021 21:30:50 +0100
Message-Id: <20210206203052.15606-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206203052.15606-1-tiwai@suse.de>
References: <20210206203052.15606-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When we stop an endpoint in release_urbs(), it ignores the
inconsistent endpoint state and tries to release the resources.
This shouldn't happen in theory, but it's still safer to abort the
release and let the caller proper error handling.

Also, stop_and_unlink_urbs() called from release_urbs() does two step
works, and it's more straightforward to split this to two functions
again, so that the call from the PCM trigger won't take the path with
sleeping.

This patch modifies the EP management code to adapt two points above.

Fixes: d0f09d1e4a88 ("ALSA: usb-audio: Refactoring endpoint URB deactivation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 4d1c678a0d80..e102c024c21f 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -868,24 +868,22 @@ void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep)
 }
 
 /*
- * Stop and unlink active urbs.
+ * Stop active urbs
  *
- * This function checks and clears EP_FLAG_RUNNING state.
- * When @wait_sync is set, it waits until all pending URBs are killed.
+ * This function moves the EP to STOPPING state if it's being RUNNING.
  */
-static int stop_and_unlink_urbs(struct snd_usb_endpoint *ep, bool force,
-				bool wait_sync)
+static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
 {
 	unsigned int i;
 
 	if (!force && atomic_read(&ep->chip->shutdown)) /* to be sure... */
 		return -EBADFD;
 
-	if (atomic_read(&ep->running))
+	if (!force && atomic_read(&ep->running))
 		return -EBUSY;
 
 	if (!test_and_clear_bit(EP_FLAG_RUNNING, &ep->flags))
-		goto out;
+		return 0;
 
 	set_bit(EP_FLAG_STOPPING, &ep->flags);
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
@@ -901,24 +899,25 @@ static int stop_and_unlink_urbs(struct snd_usb_endpoint *ep, bool force,
 		}
 	}
 
- out:
-	if (wait_sync)
-		return wait_clear_urbs(ep);
 	return 0;
 }
 
 /*
  * release an endpoint's urbs
  */
-static void release_urbs(struct snd_usb_endpoint *ep, int force)
+static int release_urbs(struct snd_usb_endpoint *ep, bool force)
 {
-	int i;
+	int i, err;
 
 	/* route incoming urbs to nirvana */
 	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
 
-	/* stop urbs */
-	stop_and_unlink_urbs(ep, force, true);
+	/* stop and unlink urbs */
+	err = stop_urbs(ep, force);
+	if (err)
+		return err;
+
+	wait_clear_urbs(ep);
 
 	for (i = 0; i < ep->nurbs; i++)
 		release_urb_ctx(&ep->urb[i]);
@@ -928,6 +927,7 @@ static void release_urbs(struct snd_usb_endpoint *ep, int force)
 
 	ep->syncbuf = NULL;
 	ep->nurbs = 0;
+	return 0;
 }
 
 /*
@@ -1118,7 +1118,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 	return 0;
 
 out_of_memory:
-	release_urbs(ep, 0);
+	release_urbs(ep, false);
 	return -ENOMEM;
 }
 
@@ -1162,7 +1162,7 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 	return 0;
 
 out_of_memory:
-	release_urbs(ep, 0);
+	release_urbs(ep, false);
 	return -ENOMEM;
 }
 
@@ -1180,7 +1180,9 @@ static int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	int err;
 
 	/* release old buffers, if any */
-	release_urbs(ep, 0);
+	err = release_urbs(ep, false);
+	if (err < 0)
+		return err;
 
 	ep->datainterval = fmt->datainterval;
 	ep->maxpacksize = fmt->maxpacksize;
@@ -1433,7 +1435,7 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 		WRITE_ONCE(ep->sync_source->sync_sink, NULL);
 
 	if (!atomic_dec_return(&ep->running))
-		stop_and_unlink_urbs(ep, false, false);
+		stop_urbs(ep, false);
 }
 
 /**
@@ -1446,7 +1448,7 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
  */
 void snd_usb_endpoint_release(struct snd_usb_endpoint *ep)
 {
-	release_urbs(ep, 1);
+	release_urbs(ep, true);
 }
 
 /**
-- 
2.26.2

