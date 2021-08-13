Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7713EB28E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 10:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F44318BC;
	Fri, 13 Aug 2021 10:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F44318BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628843004;
	bh=4CziMZwI4dnwamUBWsY5I8ZdK92FTo9nX9LLCe8c9eM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vhg+OUoeLPSQKJQCpYApHghDnXGbXZtbSELjUZsl5Ab+PdzZs2x24/EBevnw89MKL
	 +vq0elc0CQnezCpqHtSzPfYAkN/otDgra3SjteS01pfZlVh69EwSJZPqesMPTfnCQo
	 nNiA3T4JWyk6VpVkppu7DNeA05PuWMBP8FyS7FS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 358FDF8032D;
	Fri, 13 Aug 2021 10:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0D02F802D2; Fri, 13 Aug 2021 10:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39B43F800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 10:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B43F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="lMFANcbG"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="dCgDpejd"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9E1B22229B;
 Fri, 13 Aug 2021 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628842903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8RoowNPJRN0w2H9F+De/nSstsefAJn9bGmwqlnipG0c=;
 b=lMFANcbGXmDoZoFi8CAHHLf0+0B/gSDP8pHX7GAw2p1C90cL5fcxDN/MGj0Q6pjcjgi6RW
 FURTehXyJwvpbKarymJb5jnq6ijhJ8bIlPYcDshrkYZW1qM8kRMqla2wjZ6mvpDA+jJ4nj
 ubeCTnSMDBj1u7nDnz3Bou9YXwoUj+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628842903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8RoowNPJRN0w2H9F+De/nSstsefAJn9bGmwqlnipG0c=;
 b=dCgDpejd/HKlNZG1vh6KObjKa+jQ21/4fp5EU/t6qMhLiz53nesIw3Yy0Pwlx6SEfWbVf6
 +SRSrTV38vzO9iDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8B99FA3B85;
 Fri, 13 Aug 2021 08:21:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Add SNDRV_PCM_INFO_EXPLICIT_SYNC flag
Date: Fri, 13 Aug 2021 10:21:42 +0200
Message-Id: <20210813082142.5375-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

ALSA PCM core has an optimized way to communicate with user-space for
its control and status data via mmap on the supported architectures
like x86.  Depending on the situation, however, we'd rather want to
enforce user-space notifying the applptr or hwptr change explicitly
via ioctl.  For example, the upcoming non-contig and non-coherent
buffer handling would need an explicit sync, and this needs to catch
the applptr and hwptr changes.  Also, ASoC SOF driver will have the
SPIB support that has the similar requirement for the explicit control
of the applptr and hwptr.

This patch adds the new PCM hardware info flag,
SNDRV_PCM_INFO_EXPLICIT_SYNC.  When this flag is set, PCM core
disables both the control and the status mmap, which enforces
user-space to update via SYNC_PTR ioctl.  In that way, drivers can
catch the applptr and hwptr update and apply the sync operation if
needed.

Link: https://lore.kernel.org/r/20210812113818.6479-1-tiwai@suse.de
Link: https://lore.kernel.org/r/20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h | 1 +
 sound/core/pcm_native.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d17c061950df..1d84ec9db93b 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -299,6 +299,7 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define SNDRV_PCM_INFO_HAS_LINK_ABSOLUTE_ATIME     0x02000000  /* report absolute hardware link audio time, not reset on startup */
 #define SNDRV_PCM_INFO_HAS_LINK_ESTIMATED_ATIME    0x04000000  /* report estimated link audio time */
 #define SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME 0x08000000  /* report synchronized audio/system time */
+#define SNDRV_PCM_INFO_EXPLICIT_SYNC	0x10000000	/* needs explicit sync of pointers and data */
 
 #define SNDRV_PCM_INFO_DRAIN_TRIGGER	0x40000000		/* internal kernel flag - trigger in drain */
 #define SNDRV_PCM_INFO_FIFO_IN_FRAMES	0x80000000	/* internal kernel flag - FIFO size is in frames */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index dc9fa312fadd..d233cb3b41d8 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3621,6 +3621,12 @@ static int snd_pcm_mmap_control(struct snd_pcm_substream *substream, struct file
 
 static bool pcm_status_mmap_allowed(struct snd_pcm_file *pcm_file)
 {
+	/* If drivers require the explicit sync (typically for non-coherent
+	 * pages), we have to disable the mmap of status and control data
+	 * to enforce the control via SYNC_PTR ioctl.
+	 */
+	if (pcm_file->substream->runtime->hw.info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
+		return false;
 	/* See pcm_control_mmap_allowed() below.
 	 * Since older alsa-lib requires both status and control mmaps to be
 	 * coupled, we have to disable the status mmap for old alsa-lib, too.
@@ -3635,6 +3641,9 @@ static bool pcm_control_mmap_allowed(struct snd_pcm_file *pcm_file)
 {
 	if (pcm_file->no_compat_mmap)
 		return false;
+	/* see above */
+	if (pcm_file->substream->runtime->hw.info & SNDRV_PCM_INFO_EXPLICIT_SYNC)
+		return false;
 	/* Disallow the control mmap when SYNC_APPLPTR flag is set;
 	 * it enforces the user-space to fall back to snd_pcm_sync_ptr(),
 	 * thus it effectively assures the manual update of appl_ptr.
-- 
2.26.2

