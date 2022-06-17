Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6C54F965
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 16:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D171F27;
	Fri, 17 Jun 2022 16:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D171F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655476964;
	bh=RTsEiz6mqPrsm6EPGqRXzNTYm4VMxwN300vw+rWOOGs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvQoAV+0qn3ja27uzvTg+J0GVyAd7WZzdacfbAp3NZW4WxjQ8s6lO/cXTkZZ0C+Qj
	 5FyPggUarwy6a2yOAeiXrhcyBlPcEGfRO/jGZOMj951LK94UA4uuOCnxDK7kaDdaC1
	 A7xvVO1ivnrKZluq5d5LVh04PzOjOUNttsx59MDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBF43F80534;
	Fri, 17 Jun 2022 16:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4C6F800B0; Fri, 17 Jun 2022 16:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8937F8051F
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 16:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8937F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="toPQnJlJ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UGy/IaSq"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3F3F21E42;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655476856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCdjuYcNEiumrPYs6gfMo1skVm5If7KZT5CfEIbcCzs=;
 b=toPQnJlJRF0CC4dfxMdZbmJx/xYLQpz1l+Z3gxcAFiGQxGfXMZn/FBQFeiXizfAePdUY95
 DXFGDiRZFZrq7N/NwnW8OfG4sB/DmUzlNW28wYiSxJtjIWtPPkYomM4NU6zefe36X9z6SJ
 VE2RB+RjMDSTm8mBxbIxQSoL/8FS7vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655476856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCdjuYcNEiumrPYs6gfMo1skVm5If7KZT5CfEIbcCzs=;
 b=UGy/IaSqWEuJlb7pLS0XS8al9CpXFRRsxexKc2Uegwp3/v7+FxtXAJEsDolfB09uvXV4BH
 tNR6BF6htGmHWdBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DAEFA1348E;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4HyvNHeSrGIYNQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 17 Jun 2022 14:40:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ALSA: rawmidi: Check stream state at exported functions
Date: Fri, 17 Jun 2022 16:40:50 +0200
Message-Id: <20220617144051.18985-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220617144051.18985-1-tiwai@suse.de>
References: <20220617144051.18985-1-tiwai@suse.de>
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

The rawmidi interface provides some exported functions to be called
from outside, and currently there is no state check for those calls
whether the stream is properly opened and running.  Although such an
invalid call shouldn't happen, but who knows.

This patch adds the proper rawmidi stream state checks with spinlocks
for avoiding unexpected accesses when such exported functions are
called in an invalid state.  After this patch, with the
substream->opened and substream->runtime are always tied and
guaranteed to be set under substream->lock.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 56 ++++++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 7fd6b369d46f..889fa4747dad 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -207,7 +207,8 @@ static void reset_runtime_ptrs(struct snd_rawmidi_substream *substream,
 	unsigned long flags;
 
 	spin_lock_irqsave(&substream->lock, flags);
-	__reset_runtime_ptrs(substream->runtime, is_input);
+	if (substream->opened && substream->runtime)
+		__reset_runtime_ptrs(substream->runtime, is_input);
 	spin_unlock_irqrestore(&substream->lock, flags);
 }
 
@@ -309,12 +310,14 @@ static int open_substream(struct snd_rawmidi *rmidi,
 			snd_rawmidi_runtime_free(substream);
 			return err;
 		}
+		spin_lock_irq(&substream->lock);
 		substream->opened = 1;
 		substream->active_sensing = 0;
 		if (mode & SNDRV_RAWMIDI_LFLG_APPEND)
 			substream->append = 1;
 		substream->pid = get_pid(task_pid(current));
 		rmidi->streams[substream->stream].substream_opened++;
+		spin_unlock_irq(&substream->lock);
 	}
 	substream->use_count++;
 	return 0;
@@ -520,12 +523,14 @@ static void close_substream(struct snd_rawmidi *rmidi,
 				snd_rawmidi_output_trigger(substream, 0);
 		}
 	}
+	spin_lock_irq(&substream->lock);
+	substream->opened = 0;
+	substream->append = 0;
+	spin_unlock_irq(&substream->lock);
 	substream->ops->close(substream);
 	if (substream->runtime->private_free)
 		substream->runtime->private_free(substream);
 	snd_rawmidi_runtime_free(substream);
-	substream->opened = 0;
-	substream->append = 0;
 	put_pid(substream->pid);
 	substream->pid = NULL;
 	rmidi->streams[substream->stream].substream_opened--;
@@ -1074,17 +1079,21 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 	unsigned long flags;
 	struct timespec64 ts64 = get_framing_tstamp(substream);
 	int result = 0, count1;
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_runtime *runtime;
 
-	if (!substream->opened)
-		return -EBADFD;
-	if (runtime->buffer == NULL) {
+	spin_lock_irqsave(&substream->lock, flags);
+	if (!substream->opened) {
+		result = -EBADFD;
+		goto unlock;
+	}
+	runtime = substream->runtime;
+	if (!runtime || !runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_receive: input is not active!!!\n");
-		return -EINVAL;
+		result = -EINVAL;
+		goto unlock;
 	}
 
-	spin_lock_irqsave(&substream->lock, flags);
 	if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
 		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
 	} else if (count == 1) {	/* special case, faster code */
@@ -1131,6 +1140,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 		else if (__snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
+ unlock:
 	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
@@ -1252,17 +1262,19 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
  */
 int snd_rawmidi_transmit_empty(struct snd_rawmidi_substream *substream)
 {
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_runtime *runtime;
 	int result;
 	unsigned long flags;
 
-	if (runtime->buffer == NULL) {
+	spin_lock_irqsave(&substream->lock, flags);
+	runtime = substream->runtime;
+	if (!substream->opened || !runtime || !runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_transmit_empty: output is not active!!!\n");
-		return 1;
+		result = 1;
+	} else {
+		result = runtime->avail >= runtime->buffer_size;
 	}
-	spin_lock_irqsave(&substream->lock, flags);
-	result = runtime->avail >= runtime->buffer_size;
 	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
@@ -1336,7 +1348,10 @@ int snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 	unsigned long flags;
 
 	spin_lock_irqsave(&substream->lock, flags);
-	result = __snd_rawmidi_transmit_peek(substream, buffer, count);
+	if (!substream->opened || !substream->runtime)
+		result = -EBADFD;
+	else
+		result = __snd_rawmidi_transmit_peek(substream, buffer, count);
 	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
@@ -1388,7 +1403,10 @@ int snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int count)
 	unsigned long flags;
 
 	spin_lock_irqsave(&substream->lock, flags);
-	result = __snd_rawmidi_transmit_ack(substream, count);
+	if (!substream->opened || !substream->runtime)
+		result = -EBADFD;
+	else
+		result = __snd_rawmidi_transmit_ack(substream, count);
 	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
@@ -1433,12 +1451,14 @@ EXPORT_SYMBOL(snd_rawmidi_transmit);
  */
 int snd_rawmidi_proceed(struct snd_rawmidi_substream *substream)
 {
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_runtime *runtime;
 	unsigned long flags;
 	int count = 0;
 
 	spin_lock_irqsave(&substream->lock, flags);
-	if (runtime->avail < runtime->buffer_size) {
+	runtime = substream->runtime;
+	if (substream->opened && runtime &&
+	    runtime->avail < runtime->buffer_size) {
 		count = runtime->buffer_size - runtime->avail;
 		__snd_rawmidi_transmit_ack(substream, count);
 	}
-- 
2.35.3

