Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6886BF1F4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 20:52:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD72ECE;
	Fri, 17 Mar 2023 20:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD72ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679082756;
	bh=cKDRB7kk2YGr7OBXD2Zsehi7mROsyMrgQGyl8pjX/bA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S+GZ0SjqU9RXbSpFN+9nNT9pKgtsQr7OcOka3wd25qEWOA+yx3dAf6XVJER6GIsKv
	 zwhHAdclAg7urdBJZwOFLu0Jpji4Vh3/rDygqBH7M6n/4dFDQusUKrTZjoqc5QiReU
	 IP6nnOXMWpXh9pIBKvxKwOVOZyNHrUNLO+YVEbfo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29A1CF8032D;
	Fri, 17 Mar 2023 20:51:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32BFEF80423; Fri, 17 Mar 2023 20:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C33FAF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 20:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33FAF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metanate.com header.i=@metanate.com header.a=rsa-sha256
 header.s=stronger header.b=BjfN6g0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
	Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
	In-Reply-To:References; bh=WMRMW29s9nOaMfP2biYXwZDcUwXYbo2yYgouF2jc1Vo=; b=Bj
	fN6g0PhfTM4vzqmTfbkfbg7O0909IYYyF09Boh7IFtKJobke6zESAOEhA6gRjUiFH7S/8rbFCoWGh
	TCzSRlJBE0w24cuZ6M6KhIulMJ22fm9yn2vSCnouEci+r2Ugkp8YFH+1dlpPlobg6BDnomta6su5X
	z7TyexeNpIklJ/vXXbQLQ7CmTTGDFN2zSH3gTkFUjluvobjMmW5RV74QRcCWC77O2OHGNwuR6t6MA
	+lQ/SH10NAHsfnOWVFFGYYYYf52/499AiwqMcW/eKTgcrpKQvegvJ8cNB+b+caI+WxoOigmzItrGk
	xKle75lA8JZJetsHLviWyNjXQO+3rHWw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
	by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <john@metanate.com>)
	id 1pdG6u-00008O-4s;
	Fri, 17 Mar 2023 19:51:33 +0000
From: John Keeping <john@metanate.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: Fix recursive locking on XRUN
Date: Fri, 17 Mar 2023 19:51:27 +0000
Message-Id: <20230317195128.3911155-1-john@metanate.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Message-ID-Hash: C6K7EZ4URF4XASUU7FEB7FBNIU7POB6C
X-Message-ID-Hash: C6K7EZ4URF4XASUU7FEB7FBNIU7POB6C
X-MailFrom: john@metanate.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: John Keeping <john@metanate.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6K7EZ4URF4XASUU7FEB7FBNIU7POB6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_usb_queue_pending_output_urbs() may be called from
snd_pcm_ops::ack() which means the PCM stream is locked.

For the normal case where the call back into the PCM core is via
prepare_output_urb() the "_under_stream_lock" variant of
snd_pcm_period_elapsed() is called, but when an error occurs and the
stream is stopped as XRUN then snd_pcm_xrun() tries to recursively lock
the stream which results in deadlock.

Follow the example of snd_pcm_period_elapsed() by adding
snd_pcm_xrun_under_stream_lock() and use this when the PCM substream
lock is already held.

Signed-off-by: John Keeping <john@metanate.com>
---
 include/sound/pcm.h     |  1 +
 sound/core/pcm_native.c | 28 ++++++++++++++++++++++++----
 sound/usb/endpoint.c    | 18 +++++++++++-------
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 27040b472a4f..98551907453a 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -571,6 +571,7 @@ int snd_pcm_status64(struct snd_pcm_substream *substream,
 int snd_pcm_start(struct snd_pcm_substream *substream);
 int snd_pcm_stop(struct snd_pcm_substream *substream, snd_pcm_state_t status);
 int snd_pcm_drain_done(struct snd_pcm_substream *substream);
+int snd_pcm_stop_xrun_under_stream_lock(struct snd_pcm_substream *substream);
 int snd_pcm_stop_xrun(struct snd_pcm_substream *substream);
 #ifdef CONFIG_PM
 int snd_pcm_suspend_all(struct snd_pcm *pcm);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 331380c2438b..617f5dc74df0 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1559,24 +1559,44 @@ int snd_pcm_drain_done(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_STATE_SETUP);
 }
 
+/**
+ * snd_pcm_stop_xrun_under_stream_lock - stop the running stream as XRUN under the lock of
+ * 					 the PCM substream.
+ * @substream: the PCM substream instance
+ *
+ * This stops the given running substream (and all linked substreams) as XRUN.
+ * This function assumes that the substream lock is already held.
+ *
+ * Return: Zero if successful, or a negative error core.
+ */
+int snd_pcm_stop_xrun_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (substream->runtime && snd_pcm_running(substream))
+		__snd_pcm_xrun(substream);
+
+	return 0;
+}
+
 /**
  * snd_pcm_stop_xrun - stop the running streams as XRUN
  * @substream: the PCM substream instance
  *
+ * This function is similar to ``snd_pcm_stop_xrun_under_stream_lock()`` except that it
+ * acquires the substream lock itself.
+ *
  * This stops the given running substream (and all linked substreams) as XRUN.
- * Unlike snd_pcm_stop(), this function takes the substream lock by itself.
  *
  * Return: Zero if successful, or a negative error code.
  */
 int snd_pcm_stop_xrun(struct snd_pcm_substream *substream)
 {
 	unsigned long flags;
+	int ret;
 
 	snd_pcm_stream_lock_irqsave(substream, flags);
-	if (substream->runtime && snd_pcm_running(substream))
-		__snd_pcm_xrun(substream);
+	ret = snd_pcm_stop_xrun_under_stream_lock(substream);
 	snd_pcm_stream_unlock_irqrestore(substream, flags);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_pcm_stop_xrun);
 
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 1e0af1179ca8..83a6b6d41374 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -400,13 +400,17 @@ static int prepare_inbound_urb(struct snd_usb_endpoint *ep,
 }
 
 /* notify an error as XRUN to the assigned PCM data substream */
-static void notify_xrun(struct snd_usb_endpoint *ep)
+static void notify_xrun(struct snd_usb_endpoint *ep, bool in_stream_lock)
 {
 	struct snd_usb_substream *data_subs;
 
 	data_subs = READ_ONCE(ep->data_subs);
-	if (data_subs && data_subs->pcm_substream)
-		snd_pcm_stop_xrun(data_subs->pcm_substream);
+	if (data_subs && data_subs->pcm_substream) {
+		if (in_stream_lock)
+			snd_pcm_stop_xrun_under_stream_lock(data_subs->pcm_substream);
+		else
+			snd_pcm_stop_xrun(data_subs->pcm_substream);
+	}
 }
 
 static struct snd_usb_packet_info *
@@ -498,7 +502,7 @@ void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 			if (err == -EAGAIN)
 				push_back_to_ready_list(ep, ctx);
 			else
-				notify_xrun(ep);
+				notify_xrun(ep, in_stream_lock);
 			return;
 		}
 
@@ -507,7 +511,7 @@ void snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 			usb_audio_err(ep->chip,
 				      "Unable to submit urb #%d: %d at %s\n",
 				      ctx->index, err, __func__);
-			notify_xrun(ep);
+			notify_xrun(ep, in_stream_lock);
 			return;
 		}
 
@@ -574,7 +578,7 @@ static void snd_complete_urb(struct urb *urb)
 		return;
 
 	usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
-	notify_xrun(ep);
+	notify_xrun(ep, false);
 
 exit_clear:
 	clear_bit(ctx->index, &ep->active_mask);
@@ -1762,7 +1766,7 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 			usb_audio_err(ep->chip,
 				      "next package FIFO overflow EP 0x%x\n",
 				      ep->ep_num);
-			notify_xrun(ep);
+			notify_xrun(ep, false);
 			return;
 		}
 
-- 
2.40.0

