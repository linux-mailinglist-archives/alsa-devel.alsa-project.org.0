Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0CA54F963
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 16:42:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912341EFE;
	Fri, 17 Jun 2022 16:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912341EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655476954;
	bh=WfRutlvlZKblNQ4/x3hrdGMRXGzZmEY8b9oHWzGUDNU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPZMXduu6NzG68haReT8VvGk7ty1rn4bx1DLVlRmf8IlSHHwlsxydcPbcL31BdGPn
	 QQrmKAK77fb5dsIo+S0Tw2PAFPoGVefGU2I3pkgzck9pGmTlXmeuz9rfAihp5qYzIy
	 dTpvnIJKLt6nn07aCTHFW6lgs8VGXxMb7IcO9/Yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B221F80533;
	Fri, 17 Jun 2022 16:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48185F80536; Fri, 17 Jun 2022 16:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14154F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 16:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14154F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="w8s/fY6H"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YJr6Wuio"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC0131F8B0;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655476855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFgoab4aPNFuAcCbgvVXFu0hexKuufvgcF7VI5wpJ+A=;
 b=w8s/fY6HI/iv6sHbxAr4rocd10wB680AQpCvBUPISViJIU655xHZeQ7pybu/oLNyT3K2eX
 dvinbOdWVzU6qQ+KI9gEhADLLYSaZyBmFBzHaGHUy8demyoXP8s+TWig/iFofGULhGXCoZ
 qihQbf4EUyoZX1FGVxxRYYj2POkZ6Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655476855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFgoab4aPNFuAcCbgvVXFu0hexKuufvgcF7VI5wpJ+A=;
 b=YJr6Wuio5zVYcHsi7OzbJOcK/itLYQsP/7kAV4m9w/K3sJqEOtHVEYyeq4+bW+Wn2qO+ap
 Br7U8/e0nkBmS1CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DE4B1348E;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QAXHJXeSrGIYNQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 17 Jun 2022 14:40:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ALSA: rawmidi: Move lock to snd_rawmidi_substream
Date: Fri, 17 Jun 2022 16:40:48 +0200
Message-Id: <20220617144051.18985-3-tiwai@suse.de>
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

Having a lock in snd_rawmidi_runtime can be a problem especially when
a substream is accessed from the outside, as the runtime creation
might be racy with the external calls.  As a first step for hardening,
move the spinlock from snd_rawmidi_runtime to snd_rawmidi_substream.

This patch just replaces the lock calls, no real functional change is
put yet.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h |   2 +-
 sound/core/rawmidi.c    | 131 ++++++++++++++++++++--------------------
 2 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 9402c25ae9ba..e1f59b2940af 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -63,7 +63,6 @@ struct snd_rawmidi_runtime {
 	size_t xruns;		/* over/underruns counter */
 	int buffer_ref;		/* buffer reference count */
 	/* misc */
-	spinlock_t lock;
 	wait_queue_head_t sleep;
 	/* event handler (new bytes, input only) */
 	void (*event)(struct snd_rawmidi_substream *substream);
@@ -85,6 +84,7 @@ struct snd_rawmidi_substream {
 	unsigned int clock_type;	/* clock source to use for input framing */
 	int use_count;			/* use counter (for output) */
 	size_t bytes;
+	spinlock_t lock;
 	struct snd_rawmidi *rmidi;
 	struct snd_rawmidi_str *pstr;
 	char name[32];
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 82e8f656bbb2..0a00f37d8c42 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -102,13 +102,12 @@ static inline bool __snd_rawmidi_ready(struct snd_rawmidi_runtime *runtime)
 
 static bool snd_rawmidi_ready(struct snd_rawmidi_substream *substream)
 {
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
 	unsigned long flags;
 	bool ready;
 
-	spin_lock_irqsave(&runtime->lock, flags);
-	ready = __snd_rawmidi_ready(runtime);
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
+	ready = __snd_rawmidi_ready(substream->runtime);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return ready;
 }
 
@@ -130,7 +129,7 @@ static void snd_rawmidi_input_event_work(struct work_struct *work)
 		runtime->event(runtime->substream);
 }
 
-/* buffer refcount management: call with runtime->lock held */
+/* buffer refcount management: call with substream->lock held */
 static inline void snd_rawmidi_buffer_ref(struct snd_rawmidi_runtime *runtime)
 {
 	runtime->buffer_ref++;
@@ -149,7 +148,6 @@ static int snd_rawmidi_runtime_create(struct snd_rawmidi_substream *substream)
 	if (!runtime)
 		return -ENOMEM;
 	runtime->substream = substream;
-	spin_lock_init(&runtime->lock);
 	init_waitqueue_head(&runtime->sleep);
 	INIT_WORK(&runtime->event_work, snd_rawmidi_input_event_work);
 	runtime->event = NULL;
@@ -203,20 +201,20 @@ static void __reset_runtime_ptrs(struct snd_rawmidi_runtime *runtime,
 	runtime->avail = is_input ? 0 : runtime->buffer_size;
 }
 
-static void reset_runtime_ptrs(struct snd_rawmidi_runtime *runtime,
+static void reset_runtime_ptrs(struct snd_rawmidi_substream *substream,
 			       bool is_input)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&runtime->lock, flags);
-	__reset_runtime_ptrs(runtime, is_input);
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
+	__reset_runtime_ptrs(substream->runtime, is_input);
+	spin_unlock_irqrestore(&substream->lock, flags);
 }
 
 int snd_rawmidi_drop_output(struct snd_rawmidi_substream *substream)
 {
 	snd_rawmidi_output_trigger(substream, 0);
-	reset_runtime_ptrs(substream->runtime, false);
+	reset_runtime_ptrs(substream, false);
 	return 0;
 }
 EXPORT_SYMBOL(snd_rawmidi_drop_output);
@@ -256,7 +254,7 @@ EXPORT_SYMBOL(snd_rawmidi_drain_output);
 int snd_rawmidi_drain_input(struct snd_rawmidi_substream *substream)
 {
 	snd_rawmidi_input_trigger(substream, 0);
-	reset_runtime_ptrs(substream->runtime, true);
+	reset_runtime_ptrs(substream, true);
 	return 0;
 }
 EXPORT_SYMBOL(snd_rawmidi_drain_input);
@@ -676,10 +674,11 @@ static int snd_rawmidi_info_select_user(struct snd_card *card,
 	return 0;
 }
 
-static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
+static int resize_runtime_buffer(struct snd_rawmidi_substream *substream,
 				 struct snd_rawmidi_params *params,
 				 bool is_input)
 {
+	struct snd_rawmidi_runtime *runtime = substream->runtime;
 	char *newbuf, *oldbuf;
 	unsigned int framing = params->mode & SNDRV_RAWMIDI_MODE_FRAMING_MASK;
 
@@ -693,9 +692,9 @@ static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
 		newbuf = kvzalloc(params->buffer_size, GFP_KERNEL);
 		if (!newbuf)
 			return -ENOMEM;
-		spin_lock_irq(&runtime->lock);
+		spin_lock_irq(&substream->lock);
 		if (runtime->buffer_ref) {
-			spin_unlock_irq(&runtime->lock);
+			spin_unlock_irq(&substream->lock);
 			kvfree(newbuf);
 			return -EBUSY;
 		}
@@ -703,7 +702,7 @@ static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
 		runtime->buffer = newbuf;
 		runtime->buffer_size = params->buffer_size;
 		__reset_runtime_ptrs(runtime, is_input);
-		spin_unlock_irq(&runtime->lock);
+		spin_unlock_irq(&substream->lock);
 		kvfree(oldbuf);
 	}
 	runtime->avail_min = params->avail_min;
@@ -717,7 +716,7 @@ int snd_rawmidi_output_params(struct snd_rawmidi_substream *substream,
 		return -EBUSY;
 	snd_rawmidi_drain_output(substream);
 	substream->active_sensing = !params->no_active_sensing;
-	return resize_runtime_buffer(substream->runtime, params, false);
+	return resize_runtime_buffer(substream, params, false);
 }
 EXPORT_SYMBOL(snd_rawmidi_output_params);
 
@@ -735,7 +734,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 	if (framing > SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP)
 		return -EINVAL;
 	snd_rawmidi_drain_input(substream);
-	err = resize_runtime_buffer(substream->runtime, params, true);
+	err = resize_runtime_buffer(substream, params, true);
 	if (err < 0)
 		return err;
 
@@ -752,9 +751,9 @@ static int snd_rawmidi_output_status(struct snd_rawmidi_substream *substream,
 
 	memset(status, 0, sizeof(*status));
 	status->stream = SNDRV_RAWMIDI_STREAM_OUTPUT;
-	spin_lock_irq(&runtime->lock);
+	spin_lock_irq(&substream->lock);
 	status->avail = runtime->avail;
-	spin_unlock_irq(&runtime->lock);
+	spin_unlock_irq(&substream->lock);
 	return 0;
 }
 
@@ -765,11 +764,11 @@ static int snd_rawmidi_input_status(struct snd_rawmidi_substream *substream,
 
 	memset(status, 0, sizeof(*status));
 	status->stream = SNDRV_RAWMIDI_STREAM_INPUT;
-	spin_lock_irq(&runtime->lock);
+	spin_lock_irq(&substream->lock);
 	status->avail = runtime->avail;
 	status->xruns = runtime->xruns;
 	runtime->xruns = 0;
-	spin_unlock_irq(&runtime->lock);
+	spin_unlock_irq(&substream->lock);
 	return 0;
 }
 
@@ -1074,7 +1073,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
 		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
 	} else if (count == 1) {	/* special case, faster code */
@@ -1121,7 +1120,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 		else if (__snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
 EXPORT_SYMBOL(snd_rawmidi_receive);
@@ -1136,7 +1135,7 @@ static long snd_rawmidi_kernel_read1(struct snd_rawmidi_substream *substream,
 	unsigned long appl_ptr;
 	int err = 0;
 
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	snd_rawmidi_buffer_ref(runtime);
 	while (count > 0 && runtime->avail) {
 		count1 = runtime->buffer_size - runtime->appl_ptr;
@@ -1154,11 +1153,11 @@ static long snd_rawmidi_kernel_read1(struct snd_rawmidi_substream *substream,
 		if (kernelbuf)
 			memcpy(kernelbuf + result, runtime->buffer + appl_ptr, count1);
 		if (userbuf) {
-			spin_unlock_irqrestore(&runtime->lock, flags);
+			spin_unlock_irqrestore(&substream->lock, flags);
 			if (copy_to_user(userbuf + result,
 					 runtime->buffer + appl_ptr, count1))
 				err = -EFAULT;
-			spin_lock_irqsave(&runtime->lock, flags);
+			spin_lock_irqsave(&substream->lock, flags);
 			if (err)
 				goto out;
 		}
@@ -1167,7 +1166,7 @@ static long snd_rawmidi_kernel_read1(struct snd_rawmidi_substream *substream,
 	}
  out:
 	snd_rawmidi_buffer_unref(runtime);
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return result > 0 ? result : err;
 }
 
@@ -1196,31 +1195,31 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
 	snd_rawmidi_input_trigger(substream, 1);
 	result = 0;
 	while (count > 0) {
-		spin_lock_irq(&runtime->lock);
+		spin_lock_irq(&substream->lock);
 		while (!__snd_rawmidi_ready(runtime)) {
 			wait_queue_entry_t wait;
 
 			if ((file->f_flags & O_NONBLOCK) != 0 || result > 0) {
-				spin_unlock_irq(&runtime->lock);
+				spin_unlock_irq(&substream->lock);
 				return result > 0 ? result : -EAGAIN;
 			}
 			init_waitqueue_entry(&wait, current);
 			add_wait_queue(&runtime->sleep, &wait);
 			set_current_state(TASK_INTERRUPTIBLE);
-			spin_unlock_irq(&runtime->lock);
+			spin_unlock_irq(&substream->lock);
 			schedule();
 			remove_wait_queue(&runtime->sleep, &wait);
 			if (rfile->rmidi->card->shutdown)
 				return -ENODEV;
 			if (signal_pending(current))
 				return result > 0 ? result : -ERESTARTSYS;
-			spin_lock_irq(&runtime->lock);
+			spin_lock_irq(&substream->lock);
 			if (!runtime->avail) {
-				spin_unlock_irq(&runtime->lock);
+				spin_unlock_irq(&substream->lock);
 				return result > 0 ? result : -EIO;
 			}
 		}
-		spin_unlock_irq(&runtime->lock);
+		spin_unlock_irq(&substream->lock);
 		count1 = snd_rawmidi_kernel_read1(substream,
 						  (unsigned char __user *)buf,
 						  NULL/*kernelbuf*/,
@@ -1251,9 +1250,9 @@ int snd_rawmidi_transmit_empty(struct snd_rawmidi_substream *substream)
 			  "snd_rawmidi_transmit_empty: output is not active!!!\n");
 		return 1;
 	}
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	result = runtime->avail >= runtime->buffer_size;
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_empty);
@@ -1322,13 +1321,12 @@ static int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 int snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 			      unsigned char *buffer, int count)
 {
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
 	int result;
 	unsigned long flags;
 
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	result = __snd_rawmidi_transmit_peek(substream, buffer, count);
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_peek);
@@ -1375,13 +1373,12 @@ static int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream,
  */
 int snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int count)
 {
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
 	int result;
 	unsigned long flags;
 
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	result = __snd_rawmidi_transmit_ack(substream, count);
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_ack);
@@ -1399,11 +1396,10 @@ EXPORT_SYMBOL(snd_rawmidi_transmit_ack);
 int snd_rawmidi_transmit(struct snd_rawmidi_substream *substream,
 			 unsigned char *buffer, int count)
 {
-	struct snd_rawmidi_runtime *runtime = substream->runtime;
 	int result;
 	unsigned long flags;
 
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	if (!substream->opened)
 		result = -EBADFD;
 	else {
@@ -1413,7 +1409,7 @@ int snd_rawmidi_transmit(struct snd_rawmidi_substream *substream,
 		else
 			result = __snd_rawmidi_transmit_ack(substream, count);
 	}
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit);
@@ -1430,12 +1426,12 @@ int snd_rawmidi_proceed(struct snd_rawmidi_substream *substream)
 	unsigned long flags;
 	int count = 0;
 
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	if (runtime->avail < runtime->buffer_size) {
 		count = runtime->buffer_size - runtime->avail;
 		__snd_rawmidi_transmit_ack(substream, count);
 	}
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	return count;
 }
 EXPORT_SYMBOL(snd_rawmidi_proceed);
@@ -1456,10 +1452,10 @@ static long snd_rawmidi_kernel_write1(struct snd_rawmidi_substream *substream,
 		return -EINVAL;
 
 	result = 0;
-	spin_lock_irqsave(&runtime->lock, flags);
+	spin_lock_irqsave(&substream->lock, flags);
 	if (substream->append) {
 		if ((long)runtime->avail < count) {
-			spin_unlock_irqrestore(&runtime->lock, flags);
+			spin_unlock_irqrestore(&substream->lock, flags);
 			return -EAGAIN;
 		}
 	}
@@ -1481,14 +1477,14 @@ static long snd_rawmidi_kernel_write1(struct snd_rawmidi_substream *substream,
 			memcpy(runtime->buffer + appl_ptr,
 			       kernelbuf + result, count1);
 		else if (userbuf) {
-			spin_unlock_irqrestore(&runtime->lock, flags);
+			spin_unlock_irqrestore(&substream->lock, flags);
 			if (copy_from_user(runtime->buffer + appl_ptr,
 					   userbuf + result, count1)) {
-				spin_lock_irqsave(&runtime->lock, flags);
+				spin_lock_irqsave(&substream->lock, flags);
 				result = result > 0 ? result : -EFAULT;
 				goto __end;
 			}
-			spin_lock_irqsave(&runtime->lock, flags);
+			spin_lock_irqsave(&substream->lock, flags);
 		}
 		result += count1;
 		count -= count1;
@@ -1496,7 +1492,7 @@ static long snd_rawmidi_kernel_write1(struct snd_rawmidi_substream *substream,
       __end:
 	count1 = runtime->avail < runtime->buffer_size;
 	snd_rawmidi_buffer_unref(runtime);
-	spin_unlock_irqrestore(&runtime->lock, flags);
+	spin_unlock_irqrestore(&substream->lock, flags);
 	if (count1)
 		snd_rawmidi_output_trigger(substream, 1);
 	return result;
@@ -1526,31 +1522,31 @@ static ssize_t snd_rawmidi_write(struct file *file, const char __user *buf,
 		return -EIO;
 	result = 0;
 	while (count > 0) {
-		spin_lock_irq(&runtime->lock);
+		spin_lock_irq(&substream->lock);
 		while (!snd_rawmidi_ready_append(substream, count)) {
 			wait_queue_entry_t wait;
 
 			if (file->f_flags & O_NONBLOCK) {
-				spin_unlock_irq(&runtime->lock);
+				spin_unlock_irq(&substream->lock);
 				return result > 0 ? result : -EAGAIN;
 			}
 			init_waitqueue_entry(&wait, current);
 			add_wait_queue(&runtime->sleep, &wait);
 			set_current_state(TASK_INTERRUPTIBLE);
-			spin_unlock_irq(&runtime->lock);
+			spin_unlock_irq(&substream->lock);
 			timeout = schedule_timeout(30 * HZ);
 			remove_wait_queue(&runtime->sleep, &wait);
 			if (rfile->rmidi->card->shutdown)
 				return -ENODEV;
 			if (signal_pending(current))
 				return result > 0 ? result : -ERESTARTSYS;
-			spin_lock_irq(&runtime->lock);
+			spin_lock_irq(&substream->lock);
 			if (!runtime->avail && !timeout) {
-				spin_unlock_irq(&runtime->lock);
+				spin_unlock_irq(&substream->lock);
 				return result > 0 ? result : -EIO;
 			}
 		}
-		spin_unlock_irq(&runtime->lock);
+		spin_unlock_irq(&substream->lock);
 		count1 = snd_rawmidi_kernel_write1(substream, buf, NULL, count);
 		if (count1 < 0)
 			return result > 0 ? result : count1;
@@ -1561,7 +1557,7 @@ static ssize_t snd_rawmidi_write(struct file *file, const char __user *buf,
 		count -= count1;
 	}
 	if (file->f_flags & O_DSYNC) {
-		spin_lock_irq(&runtime->lock);
+		spin_lock_irq(&substream->lock);
 		while (runtime->avail != runtime->buffer_size) {
 			wait_queue_entry_t wait;
 			unsigned int last_avail = runtime->avail;
@@ -1569,16 +1565,16 @@ static ssize_t snd_rawmidi_write(struct file *file, const char __user *buf,
 			init_waitqueue_entry(&wait, current);
 			add_wait_queue(&runtime->sleep, &wait);
 			set_current_state(TASK_INTERRUPTIBLE);
-			spin_unlock_irq(&runtime->lock);
+			spin_unlock_irq(&substream->lock);
 			timeout = schedule_timeout(30 * HZ);
 			remove_wait_queue(&runtime->sleep, &wait);
 			if (signal_pending(current))
 				return result > 0 ? result : -ERESTARTSYS;
 			if (runtime->avail == last_avail && !timeout)
 				return result > 0 ? result : -EIO;
-			spin_lock_irq(&runtime->lock);
+			spin_lock_irq(&substream->lock);
 		}
-		spin_unlock_irq(&runtime->lock);
+		spin_unlock_irq(&substream->lock);
 	}
 	return result;
 }
@@ -1649,10 +1645,10 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 				    "  Owner PID    : %d\n",
 				    pid_vnr(substream->pid));
 				runtime = substream->runtime;
-				spin_lock_irq(&runtime->lock);
+				spin_lock_irq(&substream->lock);
 				buffer_size = runtime->buffer_size;
 				avail = runtime->avail;
-				spin_unlock_irq(&runtime->lock);
+				spin_unlock_irq(&substream->lock);
 				snd_iprintf(buffer,
 				    "  Mode         : %s\n"
 				    "  Buffer size  : %lu\n"
@@ -1676,11 +1672,11 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    "  Owner PID    : %d\n",
 					    pid_vnr(substream->pid));
 				runtime = substream->runtime;
-				spin_lock_irq(&runtime->lock);
+				spin_lock_irq(&substream->lock);
 				buffer_size = runtime->buffer_size;
 				avail = runtime->avail;
 				xruns = runtime->xruns;
-				spin_unlock_irq(&runtime->lock);
+				spin_unlock_irq(&substream->lock);
 				snd_iprintf(buffer,
 					    "  Buffer size  : %lu\n"
 					    "  Avail        : %lu\n"
@@ -1732,6 +1728,7 @@ static int snd_rawmidi_alloc_substreams(struct snd_rawmidi *rmidi,
 		substream->number = idx;
 		substream->rmidi = rmidi;
 		substream->pstr = stream;
+		spin_lock_init(&substream->lock);
 		list_add_tail(&substream->list, &stream->substreams);
 		stream->substream_count++;
 	}
-- 
2.35.3

