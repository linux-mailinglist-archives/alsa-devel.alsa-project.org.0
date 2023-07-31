Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AED769B27
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3148583E;
	Mon, 31 Jul 2023 17:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3148583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818559;
	bh=uCHX8UzA4R2rF0sEWrNV9MQfunRdLXe6e63G5J3JoKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G5f4wdKiG5uSXkoMDenTy4mCeQT99hsbFDIE9gvJBqf4/OaxBByzBUEIPZRvynquy
	 +hWNweJPsclYTU+WzlI5EgWOoNlLyBWn8No7lzKOLpFL+9FAM9l/6vI60yxiGgZNX5
	 9S0VxOWZ3dxJsU4LE5+nODObM7rPlvkmShgAUwEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2309DF80589; Mon, 31 Jul 2023 17:47:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6129AF8016D;
	Mon, 31 Jul 2023 17:47:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1D0AF8057F; Mon, 31 Jul 2023 17:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A0D3F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A0D3F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iGo+5h9v;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+Kw04UE8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D399E1F74B;
	Mon, 31 Jul 2023 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=faxbNw+5ueTU2+/F68uatlaBylowQ+++TRY1WkdA2nc=;
	b=iGo+5h9v9babKTMjWG0PK2MbfkiEPCopS6pi7HvFBvAKStNMvWEUIi3k0kAqrqgSKJCqav
	q6louwPYS+Iudw5wsDhgmIc3QADs1AxzO39Luzf8FZ6IbQaG44kBF0+LbW0OFjxNORhDUu
	fB426u0hm+kqZQkU+LwD69W/wQ/+gCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=faxbNw+5ueTU2+/F68uatlaBylowQ+++TRY1WkdA2nc=;
	b=+Kw04UE8ny7JvCWB+3u5u3+fNcQkh0I93rjfIs8Gkh1WEZLCgsokBYNZcGyWgTn/moeXZ2
	JeXp0xNKi4SHTgCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6D44138EE;
	Mon, 31 Jul 2023 15:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0BywK4vXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/24] ALSA: pcm: Add copy ops with universal sockptr_t
Date: Mon, 31 Jul 2023 17:46:55 +0200
Message-Id: <20230731154718.31048-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XVXY7H5LEAXMBRO5GK6DIMWLBDQSTVEH
X-Message-ID-Hash: XVXY7H5LEAXMBRO5GK6DIMWLBDQSTVEH
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVXY7H5LEAXMBRO5GK6DIMWLBDQSTVEH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

sockptr is a universal pointer that can represent both kernel- and
user-space pointers.  Despite of its name, sockptr is already widely
used in quite a few subsystems as a generic solution, and it fits
pretty well for ALSA PCM copy ops, too; we had to split to copy_user
and copy_kernel, and those can be unified to a single ops with
sockptr_t.

So here it is: this patch adds a new PCM copy ops that passes
sockptr_t pointer for copying both kernel and user-space more
consistently.  This patch touches only the ALSA PCM core part, and the
actual users will be replaced in the following patches.

As of now, the old copy_user and copy_kernel ops are still kept.
Once after all users are converted, we'll drop the old copy_user and
copy_kernel ops, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  3 ++
 sound/core/pcm_lib.c    | 97 ++++++++++++++++++++++-------------------
 sound/core/pcm_native.c |  2 +-
 3 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 19f564606ac4..04b935200d0e 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -16,6 +16,7 @@
 #include <linux/bitops.h>
 #include <linux/pm_qos.h>
 #include <linux/refcount.h>
+#include <linux/sockptr.h>
 
 #define snd_pcm_substream_chip(substream) ((substream)->private_data)
 #define snd_pcm_chip(pcm) ((pcm)->private_data)
@@ -68,6 +69,8 @@ struct snd_pcm_ops {
 			struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
 	int (*fill_silence)(struct snd_pcm_substream *substream, int channel,
 			    unsigned long pos, unsigned long bytes);
+	int (*copy)(struct snd_pcm_substream *substream, int channel,
+		    unsigned long pos, sockptr_t buf, unsigned long bytes);
 	int (*copy_user)(struct snd_pcm_substream *substream, int channel,
 			 unsigned long pos, void __user *buf,
 			 unsigned long bytes);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 9c121a921b04..1dd630cd22a7 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1973,10 +1973,11 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 	
 typedef int (*pcm_transfer_f)(struct snd_pcm_substream *substream,
 			      int channel, unsigned long hwoff,
-			      void *buf, unsigned long bytes);
+			      sockptr_t buf, unsigned long bytes);
 
 typedef int (*pcm_copy_f)(struct snd_pcm_substream *, snd_pcm_uframes_t, void *,
-			  snd_pcm_uframes_t, snd_pcm_uframes_t, pcm_transfer_f);
+			  snd_pcm_uframes_t, snd_pcm_uframes_t, pcm_transfer_f,
+			  bool);
 
 /* calculate the target DMA-buffer position to be written/read */
 static void *get_dma_ptr(struct snd_pcm_runtime *runtime,
@@ -1986,32 +1987,23 @@ static void *get_dma_ptr(struct snd_pcm_runtime *runtime,
 		channel * (runtime->dma_bytes / runtime->channels);
 }
 
-/* default copy_user ops for write; used for both interleaved and non- modes */
+/* default copy ops for write; used for both interleaved and non- modes */
 static int default_write_copy(struct snd_pcm_substream *substream,
 			      int channel, unsigned long hwoff,
-			      void *buf, unsigned long bytes)
+			      sockptr_t buf, unsigned long bytes)
 {
-	if (copy_from_user(get_dma_ptr(substream->runtime, channel, hwoff),
-			   (void __user *)buf, bytes))
+	if (copy_from_sockptr(get_dma_ptr(substream->runtime, channel, hwoff),
+			      buf, bytes))
 		return -EFAULT;
 	return 0;
 }
 
-/* default copy_kernel ops for write */
-static int default_write_copy_kernel(struct snd_pcm_substream *substream,
-				     int channel, unsigned long hwoff,
-				     void *buf, unsigned long bytes)
-{
-	memcpy(get_dma_ptr(substream->runtime, channel, hwoff), buf, bytes);
-	return 0;
-}
-
 /* fill silence instead of copy data; called as a transfer helper
  * from __snd_pcm_lib_write() or directly from noninterleaved_copy() when
  * a NULL buffer is passed
  */
 static int fill_silence(struct snd_pcm_substream *substream, int channel,
-			unsigned long hwoff, void *buf, unsigned long bytes)
+			unsigned long hwoff, sockptr_t buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -2027,27 +2019,42 @@ static int fill_silence(struct snd_pcm_substream *substream, int channel,
 	return 0;
 }
 
-/* default copy_user ops for read; used for both interleaved and non- modes */
+/* default copy ops for read; used for both interleaved and non- modes */
 static int default_read_copy(struct snd_pcm_substream *substream,
 			     int channel, unsigned long hwoff,
-			     void *buf, unsigned long bytes)
+			     sockptr_t buf, unsigned long bytes)
 {
-	if (copy_to_user((void __user *)buf,
-			 get_dma_ptr(substream->runtime, channel, hwoff),
-			 bytes))
+	if (copy_to_sockptr(buf,
+			    get_dma_ptr(substream->runtime, channel, hwoff),
+			    bytes))
 		return -EFAULT;
 	return 0;
 }
 
-/* default copy_kernel ops for read */
-static int default_read_copy_kernel(struct snd_pcm_substream *substream,
-				    int channel, unsigned long hwoff,
-				    void *buf, unsigned long bytes)
+/* a wrapper for calling old copy_kernel or copy_user ops */
+static int call_old_copy(struct snd_pcm_substream *substream,
+			 int channel, unsigned long hwoff,
+			 sockptr_t buf, unsigned long bytes)
 {
-	memcpy(buf, get_dma_ptr(substream->runtime, channel, hwoff), bytes);
-	return 0;
+	if (sockptr_is_kernel(buf))
+		return substream->ops->copy_kernel(substream, channel, hwoff,
+						   buf.kernel, bytes);
+	else
+		return substream->ops->copy_user(substream, channel, hwoff,
+						 buf.user, bytes);
 }
 
+/* create a sockptr_t */
+static inline sockptr_t make_sockptr(void *p, bool in_kernel)
+{
+	if (in_kernel)
+		return KERNEL_SOCKPTR(p);
+	else
+		return USER_SOCKPTR((void __user *)p);
+}
+
+#define NULL_SOCKPTR	USER_SOCKPTR(NULL)
+
 /* call transfer function with the converted pointers and sizes;
  * for interleaved mode, it's one shot for all samples
  */
@@ -2055,7 +2062,8 @@ static int interleaved_copy(struct snd_pcm_substream *substream,
 			    snd_pcm_uframes_t hwoff, void *data,
 			    snd_pcm_uframes_t off,
 			    snd_pcm_uframes_t frames,
-			    pcm_transfer_f transfer)
+			    pcm_transfer_f transfer,
+			    bool in_kernel)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -2063,7 +2071,8 @@ static int interleaved_copy(struct snd_pcm_substream *substream,
 	hwoff = frames_to_bytes(runtime, hwoff);
 	off = frames_to_bytes(runtime, off);
 	frames = frames_to_bytes(runtime, frames);
-	return transfer(substream, 0, hwoff, data + off, frames);
+	return transfer(substream, 0, hwoff,
+			make_sockptr(data + off, in_kernel), frames);
 }
 
 /* call transfer function with the converted pointers and sizes for each
@@ -2073,7 +2082,8 @@ static int noninterleaved_copy(struct snd_pcm_substream *substream,
 			       snd_pcm_uframes_t hwoff, void *data,
 			       snd_pcm_uframes_t off,
 			       snd_pcm_uframes_t frames,
-			       pcm_transfer_f transfer)
+			       pcm_transfer_f transfer,
+			       bool in_kernel)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int channels = runtime->channels;
@@ -2089,9 +2099,11 @@ static int noninterleaved_copy(struct snd_pcm_substream *substream,
 	hwoff = samples_to_bytes(runtime, hwoff);
 	for (c = 0; c < channels; ++c, ++bufs) {
 		if (!data || !*bufs)
-			err = fill_silence(substream, c, hwoff, NULL, frames);
+			err = fill_silence(substream, c, hwoff,
+					   NULL_SOCKPTR, frames);
 		else
-			err = transfer(substream, c, hwoff, *bufs + off,
+			err = transfer(substream, c, hwoff,
+				       make_sockptr(*bufs + off, in_kernel),
 				       frames);
 		if (err < 0)
 			return err;
@@ -2108,10 +2120,10 @@ static int fill_silence_frames(struct snd_pcm_substream *substream,
 	if (substream->runtime->access == SNDRV_PCM_ACCESS_RW_INTERLEAVED ||
 	    substream->runtime->access == SNDRV_PCM_ACCESS_MMAP_INTERLEAVED)
 		return interleaved_copy(substream, off, NULL, 0, frames,
-					fill_silence);
+					fill_silence, true);
 	else
 		return noninterleaved_copy(substream, off, NULL, 0, frames,
-					   fill_silence);
+					   fill_silence, true);
 }
 
 /* sanity-check for read/write methods */
@@ -2121,7 +2133,7 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (snd_BUG_ON(!substream->ops->copy_user && !runtime->dma_area))
+	if (snd_BUG_ON(!substream->ops->copy && !runtime->dma_area))
 		return -EINVAL;
 	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
@@ -2226,15 +2238,12 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 			transfer = fill_silence;
 		else
 			return -EINVAL;
-	} else if (in_kernel) {
-		if (substream->ops->copy_kernel)
-			transfer = substream->ops->copy_kernel;
-		else
-			transfer = is_playback ?
-				default_write_copy_kernel : default_read_copy_kernel;
 	} else {
-		if (substream->ops->copy_user)
-			transfer = (pcm_transfer_f)substream->ops->copy_user;
+		if (substream->ops->copy)
+			transfer = substream->ops->copy;
+		else if ((in_kernel && substream->ops->copy_kernel) ||
+			 (!in_kernel && substream->ops->copy_user))
+			transfer = call_old_copy;
 		else
 			transfer = is_playback ?
 				default_write_copy : default_read_copy;
@@ -2307,7 +2316,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (!is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
 		err = writer(substream, appl_ofs, data, offset, frames,
-			     transfer);
+			     transfer, in_kernel);
 		if (is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 		snd_pcm_stream_lock_irq(substream);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 95fc56e403b1..34efd4d198d6 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -809,7 +809,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 		runtime->boundary *= 2;
 
 	/* clear the buffer for avoiding possible kernel info leaks */
-	if (runtime->dma_area && !substream->ops->copy_user) {
+	if (runtime->dma_area && !substream->ops->copy && !substream->ops->copy_user) {
 		size_t size = runtime->dma_bytes;
 
 		if (runtime->info & SNDRV_PCM_INFO_MMAP)
-- 
2.35.3

