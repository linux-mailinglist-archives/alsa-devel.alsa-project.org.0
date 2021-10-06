Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5A423FFE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 16:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA7E846;
	Wed,  6 Oct 2021 16:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA7E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633530221;
	bh=TcLockZDsiZfUvRI7di06OiBWPwxydUHmhaXArRM6wo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SJBmw19A7Eh3OnGRWEcu6Q6wO3thwiBGBgcQl2Rd7mP8ld7QrAD7rhl1O4k8XuQAM
	 n2OmdldP0KEcN6XFvdfCL09RQX82u60u/LOB+HSTzuf0Nh0iFbGuka3+kNEPW+1uw+
	 B40ZHXVmWKX1ZymMCozPmeE0YPakcq6R69hQc0uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C08DF800FE;
	Wed,  6 Oct 2021 16:22:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2C6F80240; Wed,  6 Oct 2021 16:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4657CF800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 16:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4657CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="E2tD0mWl"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fqx5IFkX"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7346F20381
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633530135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xXxwFenG/k8cWETpOyg7be8nPd54vJIBdFHX7OE5JHU=;
 b=E2tD0mWlhsoZlqikY87LH2anAz5JlOGTpVrs95sIn7yvu8krs7L9IYbKlm0fhmuxRSf996
 fMoMRE2OZOwPBmSX48ky7JEBrfmS30DX6+vc4GDscdVVx6CrL4DOVVcUEB8WQxUBG/wzur
 jJynSJBP4rK6GUHLEhmxLBdE0BbQvX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633530135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xXxwFenG/k8cWETpOyg7be8nPd54vJIBdFHX7OE5JHU=;
 b=fqx5IFkX/uvhYt7z1WzdXZspWkP3ycuk/Jnr1JXTRLarSKSDW1UaAzFW2nPpSpmZwIlM10
 LW86LBXIi8q1UOBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 624ACA3BDB;
 Wed,  6 Oct 2021 14:22:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Add more disconnection checks at file ops
Date: Wed,  6 Oct 2021 16:22:14 +0200
Message-Id: <20211006142214.3089-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

In the case of hot-disconnection of a PCM device, all file operations
except for close should be rejected.  This patch adds more sanity
checks in the file operation code paths.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ee6d17caf2ce..0c0a825af773 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3234,6 +3234,9 @@ static int snd_pcm_common_ioctl(struct file *file,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 
+	if (substream->runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return -EBADFD;
+
 	res = snd_power_wait(substream->pcm->card);
 	if (res < 0)
 		return res;
@@ -3360,6 +3363,9 @@ int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t *frames = arg;
 	snd_pcm_sframes_t result;
 	
+	if (substream->runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return -EBADFD;
+
 	switch (cmd) {
 	case SNDRV_PCM_IOCTL_FORWARD:
 	{
@@ -3402,7 +3408,8 @@ static ssize_t snd_pcm_read(struct file *file, char __user *buf, size_t count,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
@@ -3426,7 +3433,8 @@ static ssize_t snd_pcm_write(struct file *file, const char __user *buf,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
@@ -3452,7 +3460,8 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!iter_is_iovec(to))
 		return -EINVAL;
@@ -3488,7 +3497,8 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!iter_is_iovec(from))
 		return -EINVAL;
@@ -3527,6 +3537,9 @@ static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 		return ok | EPOLLERR;
 
 	runtime = substream->runtime;
+	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return ok | EPOLLERR;
+
 	poll_wait(file, &runtime->sleep, wait);
 
 	mask = 0;
@@ -3836,6 +3849,8 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	substream = pcm_file->substream;
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
+	if (substream->runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return -EBADFD;
 
 	offset = area->vm_pgoff << PAGE_SHIFT;
 	switch (offset) {
@@ -3872,6 +3887,8 @@ static int snd_pcm_fasync(int fd, struct file * file, int on)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
+	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return -EBADFD;
 	return fasync_helper(fd, file, on, &runtime->fasync);
 }
 
-- 
2.31.1

