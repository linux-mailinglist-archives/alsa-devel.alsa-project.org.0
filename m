Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC8B3EA3E8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 13:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0E831938;
	Thu, 12 Aug 2021 13:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0E831938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628768448;
	bh=Tty/ZYYlJMWpX3y5EnF6lfUBr/bHDht3kpzrHrIOUes=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUl9IZDPJyfJOVoNvMs4d2eLqdY6tLG749D9X5LriFr8Z6JoV3ggfvLSfN1ohh6oR
	 rVEDPglCzIGzlSPBmKm5mBPoRpuTpMqxcgbpbBTvrVFdriseVWd6FocgqiLVTy5k93
	 Cq3FAuX5tbPCR/sOh2Uen8M7CbZyoQE5rAIKmacI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC51F804EB;
	Thu, 12 Aug 2021 13:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FDE7F804DA; Thu, 12 Aug 2021 13:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7546CF8025D
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 13:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7546CF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="g4VrHxCl"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1GVTJfPV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E9E3C22248
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628768299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0FD5nrINFqCCoPx3+7o4pDTVtYbBzeVdUPOeiSDBhY=;
 b=g4VrHxClXHBtkxaO2MBOJg4nQA4ieznFDhBa9wpzwtZ2dQxVF5KpkpKy+VgwoKQHa439uv
 WQsJqYlvaFF6juu7V93U75WDAyVSli/pqsUmvTk51vazdLC/hzmqbDmHeC0rT5mWjVSWnS
 P/H3vTzLvcZS5mNPxwERUjN91HXTmEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628768299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0FD5nrINFqCCoPx3+7o4pDTVtYbBzeVdUPOeiSDBhY=;
 b=1GVTJfPVoid/jctu96ZA+s5EQs5zN6dJIba6FGKcF6P6LbigVB1kp4NTnlHiIkb4tNRNNH
 lzBQcLLIUaEtfzBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D8FD7A3EFB;
 Thu, 12 Aug 2021 11:38:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC v2 2/4] ALSA: pcm: Add SNDRV_PCM_INFO_EXPLICIT_SYNC flag
Date: Thu, 12 Aug 2021 13:38:16 +0200
Message-Id: <20210812113818.6479-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210812113818.6479-1-tiwai@suse.de>
References: <20210812113818.6479-1-tiwai@suse.de>
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

ALSA PCM core has an optimized way to communicate with user-space for
its control and status data via mmap on the supported architectures
like x86.  Depending on the situation, however, we'd rather want to
enforce user-space notifying the applptr or hwptr change explicitly
via ioctl.  For example, the upcoming non-contig and non-coherent
buffer handling would need an explicit sync, and this needs to catch
the applptr and hwptr changes.

This patch adds the new PCM hardware info flag,
SNDRV_PCM_INFO_EXPLICIT_SYNC.  When this flag is set, PCM core
disables both the control and the status mmap, which enforces
user-space to update via SYNC_PTR ioctl.  In that way, drivers can
catch the applptr and hwptr update and apply the sync operation if
needed.

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

