Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2A427FF3
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016691686;
	Sun, 10 Oct 2021 09:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016691686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852642;
	bh=x7M0TKs3wwyyWqKz0yjijD/j/sWENCjmuNrUVTZVHBQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RNRZLhPXPO6nP3IDFlM7AyjfzjKTeBW76WunaBu2OcY9ZfLluW68/gtNIOq/YklO9
	 vBtW3XzF/+JoSrLvsNoIfyZ6TY+rbrt0E6wUzxLQCezePRdhxMZcKUB597SpHKnIoJ
	 UJvwcM6Sn5r8StPNE88OvoZpEkwt6yhVlxCP9YBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C22F801D5;
	Sun, 10 Oct 2021 09:56:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1259F801F7; Sun, 10 Oct 2021 09:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF715F800F0
 for <alsa-devel@alsa-project.org>; Sun, 10 Oct 2021 09:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF715F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="JyB7Pgmj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="z+PCN7nz"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4246A2212E;
 Sun, 10 Oct 2021 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633852554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OQw+Dwb9/pfNJCX0UtDJFPm7zLhA63H8WYxL6HzLL+4=;
 b=JyB7PgmjlQXq1Lhf/PGzKdfBpAMil9VCwAjakdiNMgYiBF00GG25QO5TH87ijHYN+JKoZz
 vYOldfel0tTaPCFJ8fWid7M7wWNQlviPOno1EL4AXgrJZty9HSssXf48r3m5pyngdaSGc6
 7hwzgJ3mrRLwIlhbe9uRYiygol+DkIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633852554;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OQw+Dwb9/pfNJCX0UtDJFPm7zLhA63H8WYxL6HzLL+4=;
 b=z+PCN7nzbpeaCwvI/eLXOfnDqayH/BWPqsN/KrPwMxGuuPGFnBnmiZa9vlfoQdmD5rBRVO
 0FwpnqR4xR9Wl5DA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1FDEAA3B81;
 Sun, 10 Oct 2021 07:55:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Workaround for a wrong offset in SYNC_PTR compat
 ioctl
Date: Sun, 10 Oct 2021 09:55:46 +0200
Message-Id: <20211010075546.23220-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Forney <mforney@mforney.org>
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

Michael Forney reported an incorrect padding type that was defined in
the commit 80fe7430c708 ("ALSA: add new 32-bit layout for
snd_pcm_mmap_status/control") for PCM control mmap data.
His analysis is correct, and this caused the misplacements of PCM
control data on 32bit arch and 32bit compat mode.

The bug is that the __pad2 definition in __snd_pcm_mmap_control64
struct was wrongly with __pad_before_uframe, which should have been
__pad_after_uframe instead.  This struct is used in SYNC_PTR ioctl and
control mmap.  Basically this bug leads to two problems:

- The offset of avail_min field becomes wrong, it's placed right after
  appl_ptr without padding on little-endian

- When appl_ptr and avail_min are read as 64bit values in kernel side,
  the values become either zero or corrupted (mixed up)

One good news is that, because both user-space and kernel
misunderstand the wrong offset, at least, 32bit application running on
32bit kernel works as is.  Also, 64bit applications are unaffected
because the padding size is zero.  The remaining problem is the 32bit
compat mode; as mentioned in the above, avail_min is placed right
after appl_ptr on little-endian archs, 64bit kernel reads bogus values
for appl_ptr updates, which may lead to streaming bugs like jumping,
XRUN or whatever unexpected.
(However, we haven't heard any serious bug reports due to this over
years, so practically seen, it's fairly safe to assume that the impact
by this bug is limited.)

Ideally speaking, we should correct the wrong mmap status control
definition.  But this would cause again incompatibility with the
existing binaries, and fixing it (e.g. by renumbering ioctls) would be
really messy.

So, as of this patch, we only correct the behavior of 32bit compat
mode and keep the rest as is.  Namely, the SYNC_PTR ioctl is now
handled differently in compat mode to read/write the 32bit values at
the right offsets.  The control mmap of 32bit apps on 64bit kernels
has been already disabled (which is likely rather an overlook, but
this worked fine at this time :), so covering SYNC_PTR ioctl should
suffice as a fallback.

Fixes: 80fe7430c708 ("ALSA: add new 32-bit layout for snd_pcm_mmap_status/control")
Reported-by: Michael Forney <mforney@mforney.org>
Cc: <stable@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rich Felker <dalias@libc.org>
Link: https://lore.kernel.org/r/29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_compat.c | 72 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a59de24695ec..dfe5a64e19d2 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -468,6 +468,76 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 }
 #endif /* CONFIG_X86_X32 */
 
+#ifdef __BIG_ENDIAN
+typedef char __pad_before_u32[4];
+typedef char __pad_after_u32[0];
+#else
+typedef char __pad_before_u32[0];
+typedef char __pad_after_u32[4];
+#endif
+
+/* PCM 2.0.15 API definition had a bug in mmap control; it puts the avail_min
+ * at the wrong offset due to a typo in padding type.
+ * The bug hits only 32bit.
+ * A workaround for incorrect read/write is needed only in 32bit compat mode.
+ */
+struct __snd_pcm_mmap_control64_buggy {
+	__pad_before_u32 __pad1;
+	__u32 appl_ptr;
+	__pad_before_u32 __pad2;	/* SiC! here is the bug */
+	__pad_before_u32 __pad3;
+	__u32 avail_min;
+	__pad_after_uframe __pad4;
+};
+
+static int snd_pcm_ioctl_sync_ptr_buggy(struct snd_pcm_substream *substream,
+					struct snd_pcm_sync_ptr __user *_sync_ptr)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_pcm_sync_ptr sync_ptr;
+	struct __snd_pcm_mmap_control64_buggy *sync_cp;
+	volatile struct snd_pcm_mmap_status *status;
+	volatile struct snd_pcm_mmap_control *control;
+	int err;
+
+	memset(&sync_ptr, 0, sizeof(sync_ptr));
+	sync_cp = (struct __snd_pcm_mmap_control64_buggy *)&sync_ptr.c.control;
+	if (get_user(sync_ptr.flags, (unsigned __user *)&(_sync_ptr->flags)))
+		return -EFAULT;
+	if (copy_from_user(sync_cp, &(_sync_ptr->c.control), sizeof(*sync_cp)))
+		return -EFAULT;
+	status = runtime->status;
+	control = runtime->control;
+	if (sync_ptr.flags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
+		err = snd_pcm_hwsync(substream);
+		if (err < 0)
+			return err;
+	}
+	snd_pcm_stream_lock_irq(substream);
+	if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL)) {
+		err = pcm_lib_apply_appl_ptr(substream, sync_cp->appl_ptr);
+		if (err < 0) {
+			snd_pcm_stream_unlock_irq(substream);
+			return err;
+		}
+	} else {
+		sync_cp->appl_ptr = control->appl_ptr;
+	}
+	if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
+		control->avail_min = sync_cp->avail_min;
+	else
+		sync_cp->avail_min = control->avail_min;
+	sync_ptr.s.status.state = status->state;
+	sync_ptr.s.status.hw_ptr = status->hw_ptr;
+	sync_ptr.s.status.tstamp = status->tstamp;
+	sync_ptr.s.status.suspended_state = status->suspended_state;
+	sync_ptr.s.status.audio_tstamp = status->audio_tstamp;
+	snd_pcm_stream_unlock_irq(substream);
+	if (copy_to_user(_sync_ptr, &sync_ptr, sizeof(sync_ptr)))
+		return -EFAULT;
+	return 0;
+}
+
 /*
  */
 enum {
@@ -537,7 +607,7 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 		if (in_x32_syscall())
 			return snd_pcm_ioctl_sync_ptr_x32(substream, argp);
 #endif /* CONFIG_X86_X32 */
-		return snd_pcm_common_ioctl(file, substream, cmd, argp);
+		return snd_pcm_ioctl_sync_ptr_buggy(substream, argp);
 	case SNDRV_PCM_IOCTL_HW_REFINE32:
 		return snd_pcm_ioctl_hw_params_compat(substream, 1, argp);
 	case SNDRV_PCM_IOCTL_HW_PARAMS32:
-- 
2.31.1

