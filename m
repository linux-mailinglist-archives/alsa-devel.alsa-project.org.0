Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48048D6B4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 12:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273AD1F2F;
	Thu, 13 Jan 2022 12:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273AD1F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642073578;
	bh=BCdvPeM1DQrTbufR8nfRrvW3JXnCoB5ASMj5L65bYe8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NR7z0n8aTpIFzTda0QOHYU1C2zHz9ZFZ+ZBcBwRhk6bUgWnDlZJDWple08LPbdQzb
	 4vjCpJSVof4cL6hy1tYBorJ0Fcp9MxYexfThbIP4PCOpYRy/poM6wI/2QJSHlf1q3k
	 OcmPAGmgVjlx+PChgRLL14V0kYVIuBAwuIcHHlL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B4DF80141;
	Thu, 13 Jan 2022 12:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D013F8013F; Thu, 13 Jan 2022 12:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03489F800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 12:31:39 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A878EA0046;
 Thu, 13 Jan 2022 12:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A878EA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1642073498; bh=RPhZM9SpFm4r3/CxCPaB1CCl2v0zQTGEvx+6eIGYu4w=;
 h=From:To:Cc:Subject:Date:From;
 b=LQxCv0cHgekWhxNLVw2lQ4IjeN1lBsRoZiOJ04olH7fX8UbczLotBg9yQh4j0p7ha
 gWpLfr0kvEEuWphn66YfxKBc2vkHg82IkO7OMvVPc2EgL73J3nMIW1SucU57Z9M7uo
 vAnAHeZ/sUE/4Et0dDRmsa5mEvC3086Ie23D4ods=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 13 Jan 2022 12:31:34 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: pcm: accept the OPEN state for snd_pcm_stop()
Date: Thu, 13 Jan 2022 12:31:30 +0100
Message-Id: <20220113113130.1961332-1-perex@perex.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Pavel Hofman <pavel.hofman@ivitera.com>
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

It may be useful to completely invalidate streaming under some
circumstances like the USB gadget detach. This case is a bit different
than the complete disconnection. The applications should be notified
that the PCM streaming is no longer available, but the recovery may be
expected.

This patch adds support for SNDRV_PCM_STATE_OPEN passed
to snd_pcm_stop() function. Only the hw_free ioctl is allowed to free
the buffers in this state for a full recovery operation or the PCM file
handle must be closed.

In the OPEN state, ioctls return EBADFD error (with the added hw_free
exception above). The applications which are not aware about this new
state transition (and recovery) will fail with an error. This operation
is expected.

Link: https://lore.kernel.org/alsa-devel/4e17c99b-1d8a-8ebe-972c-9b1299952ff8@ivitera.com/
Cc: Pavel Hofman <pavel.hofman@ivitera.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/pcm.h     |  1 +
 sound/core/pcm.c        |  1 +
 sound/core/pcm_native.c | 12 +++++++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 33451f8ff755..4de1c2c91109 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -467,6 +467,7 @@ struct snd_pcm_substream {
 	/* -- assigned files -- */
 	int ref_count;
 	atomic_t mmap_count;
+	atomic_t queued_hw_free;
 	unsigned int f_flags;
 	void (*pcm_release)(struct snd_pcm_substream *);
 	struct pid *pid;
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 6fd3677685d7..8dc7e99b2113 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -694,6 +694,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
 		snd_pcm_group_init(&substream->self_group);
 		list_add_tail(&substream->link_list, &substream->self_group.substreams);
 		atomic_set(&substream->mmap_count, 0);
+		atomic_set(&substream->queued_hw_free, 0);
 		prev = substream;
 	}
 	return 0;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 621883e71194..118ad3f26f4a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -686,10 +686,13 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_stream_lock_irq(substream);
 	switch (runtime->status->state) {
 	case SNDRV_PCM_STATE_OPEN:
+		if (atomic_read(&substream->queued_hw_free))
+			goto __badfd;
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
 		break;
 	default:
+__badfd:
 		snd_pcm_stream_unlock_irq(substream);
 		return -EBADFD;
 	}
@@ -829,6 +832,7 @@ static int do_hw_free(struct snd_pcm_substream *substream)
 		result = substream->ops->hw_free(substream);
 	if (substream->managed_buffer_alloc)
 		snd_pcm_lib_free_pages(substream);
+	atomic_set(&substream->queued_hw_free, 0);
 	return result;
 }
 
@@ -1454,6 +1458,8 @@ static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
 	}
 	wake_up(&runtime->sleep);
 	wake_up(&runtime->tsleep);
+	if (state == SNDRV_PCM_STATE_OPEN)
+		atomic_set(&substream->queued_hw_free, 1);
 }
 
 static const struct action_ops snd_pcm_action_stop = {
@@ -1469,6 +1475,9 @@ static const struct action_ops snd_pcm_action_stop = {
  *
  * The state of each stream is then changed to the given state unconditionally.
  *
+ * If the requested state is OPEN, the stream is invalidated and
+ * the application must call hw_free to recover the operation.
+ *
  * Return: Zero if successful, or a negative error code.
  */
 int snd_pcm_stop(struct snd_pcm_substream *substream, snd_pcm_state_t state)
@@ -2637,7 +2646,8 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 
 	snd_pcm_drop(substream);
 	if (substream->hw_opened) {
-		if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+		if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN ||
+		    atomic_read(&substream->queued_hw_free))
 			do_hw_free(substream);
 		substream->ops->close(substream);
 		substream->hw_opened = 0;
-- 
2.33.1
