Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCC11BF19
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 22:24:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED961660;
	Wed, 11 Dec 2019 22:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED961660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576099458;
	bh=TaLeGiEaLfFVIe4z7pfZ9jDnArYhKCaCD0emQnxjc5s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cEnqy3UrpYmnGwP4xSUIekl+Z9//xToiyJ/hdhqleY4wim7xUD1FOGyDoiT3/XaFw
	 mODqobLH4xkEDfPhfiW3K3iQ+8aH38PZJOlUxKZZYPg4SrmbgCriR+yEusrUOfzH9U
	 VQyMrLUHiEEcSii7GbiewaU9NLZUhhKKolWHjnvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E093F80272;
	Wed, 11 Dec 2019 22:20:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE4A3F80264; Wed, 11 Dec 2019 22:20:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55949F801F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 22:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55949F801F4
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mnqfc-1hveRf1HEQ-00pOqE; Wed, 11 Dec 2019 22:20:33 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 11 Dec 2019 22:20:23 +0100
Message-Id: <20191211212025.1981822-8-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191211212025.1981822-1-arnd@arndb.de>
References: <20191211212025.1981822-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zC9iYdEWHKUnOcg7t2juYhAxFbIQOmWg5/7TH76bBkCC7KWjvX6
 sP5ufRzpMoTgjMZo1/l5shfknmdGUMWsoknwjSr+hHp15QmMUzBK0PnMnaBYAiDdhG6f4NO
 x2pvg8E3IBbZ1aUs/vI8+W+d1OFZ2qyfoE2bSArjPHq0caC0t3r8ot7QUb+LEjp2PtxstvP
 ZGlifgRAWqAprzicHWbxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UByJ5EIEuxI=:BAjIa0SS9wa2JhjTD1peu7
 BXVWLM88/dl24IM+oW8rqkyX5PftfNVK8zSLW/NqNdd0SzihY3k4qEo8TqCeGzlXlbA8O3b+k
 jSB24tLz6pNJ39t5PjuLo3ACclF/5mJbhP2jJmGzq1rOXx7diIJgVr/uMHxw0DZ5kPecfiCGi
 OSq6bHKl5tTj8n/1BAs011RtK1lQnMqDTJ7DfSbaNRKtMYGztOh2P3Iknl6KIahXN4Chd/9EE
 X+LeaTxtAu9raYMKgmJgZtesiAhQfeVDVBFmbaCFLS+1T9y/pc1CoCJmyG/TlRtWKyWzrkna7
 v+HMPKxU4AwL7fHYi0jJjPKlSczBp0aZWJ9ln5dn2w0Q3eWVKGtlGeTwA028rBmUMIkcWGAQG
 pW0bMjUKHIbcNaHx+a21cdzLFeCfHWQwsj4mz++VjecOyjtSuzuGJsJPgPES4EPJEJn4CkMp+
 3supuYYa5f9LvGlD3R/3MkX/xW+vwwMBmSFFQwhYRBAr6oCdw2PjgB7mcM2PLMhUyjoDSTA7w
 20XB8zvIfdm9b7baVGuZcn0H31Bz2GufDB3GHwM5JqxgSdpqougQ4oFtkSe7b81pgWvl9ITGm
 8gGvw9ncFBmxdv6okR+EfCYX5pRWdG6LuwJ2pY2+FVHDE/KBkC4nVh0DtmtppsClujx2tZE8L
 CZlDWBSR/zF6AwAlmLQs5Zk6gKObBxZTXbFTUjzd7xZBDv3mZ13PCi7Uhompn/Lnc2ITrGBz0
 AvEES8Hs1buS6RWiNgHgB40IULSoXsoNnjD+xsQ2P1JFA1Qg/xogjGHx+x9fL2dkJdzcO/kCu
 cAWheWZalDozD3AFBET2L0DOobiFmUJWybbCY4LQc4+G1TuxhnHqnQfV4KQUES/OXvfHnlywq
 z11IuoFElh0/Z7OqXa6A==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v7 7/9] ALSA: move
	snd_pcm_ioctl_sync_ptr_compat into pcm_native.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a preparation patch, moving the compat handler for
snd_pcm_ioctl_sync_ptr_compat from pcm_compat.c to pcm_native.c.
No other changes are indented.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/core/pcm_compat.c |  98 ---------------------------------------
 sound/core/pcm_native.c | 100 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+), 98 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 2671658442ea..6a2e5ea145e6 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -83,19 +83,6 @@ struct snd_pcm_sw_params32 {
 	unsigned char reserved[56];
 };
 
-/* recalcuate the boundary within 32bit */
-static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
-{
-	snd_pcm_uframes_t boundary;
-
-	if (! runtime->buffer_size)
-		return 0;
-	boundary = runtime->buffer_size;
-	while (boundary * 2 <= 0x7fffffffUL - runtime->buffer_size)
-		boundary *= 2;
-	return boundary;
-}
-
 static int snd_pcm_ioctl_sw_params_compat(struct snd_pcm_substream *substream,
 					  struct snd_pcm_sw_params32 __user *src)
 {
@@ -388,91 +375,6 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 	return err;
 }
 
-
-struct snd_pcm_mmap_status32 {
-	s32 state;
-	s32 pad1;
-	u32 hw_ptr;
-	struct compat_timespec tstamp;
-	s32 suspended_state;
-	struct compat_timespec audio_tstamp;
-} __attribute__((packed));
-
-struct snd_pcm_mmap_control32 {
-	u32 appl_ptr;
-	u32 avail_min;
-};
-
-struct snd_pcm_sync_ptr32 {
-	u32 flags;
-	union {
-		struct snd_pcm_mmap_status32 status;
-		unsigned char reserved[64];
-	} s;
-	union {
-		struct snd_pcm_mmap_control32 control;
-		unsigned char reserved[64];
-	} c;
-} __attribute__((packed));
-
-static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
-					 struct snd_pcm_sync_ptr32 __user *src)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	volatile struct snd_pcm_mmap_status *status;
-	volatile struct snd_pcm_mmap_control *control;
-	u32 sflags;
-	struct snd_pcm_mmap_control scontrol;
-	struct snd_pcm_mmap_status sstatus;
-	snd_pcm_uframes_t boundary;
-	int err;
-
-	if (snd_BUG_ON(!runtime))
-		return -EINVAL;
-
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
-		return -EFAULT;
-	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
-		err = snd_pcm_hwsync(substream);
-		if (err < 0)
-			return err;
-	}
-	status = runtime->status;
-	control = runtime->control;
-	boundary = recalculate_boundary(runtime);
-	if (! boundary)
-		boundary = 0x7fffffff;
-	snd_pcm_stream_lock_irq(substream);
-	/* FIXME: we should consider the boundary for the sync from app */
-	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
-		control->appl_ptr = scontrol.appl_ptr;
-	else
-		scontrol.appl_ptr = control->appl_ptr % boundary;
-	if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
-		control->avail_min = scontrol.avail_min;
-	else
-		scontrol.avail_min = control->avail_min;
-	sstatus.state = status->state;
-	sstatus.hw_ptr = status->hw_ptr % boundary;
-	sstatus.tstamp = status->tstamp;
-	sstatus.suspended_state = status->suspended_state;
-	sstatus.audio_tstamp = status->audio_tstamp;
-	snd_pcm_stream_unlock_irq(substream);
-	if (put_user(sstatus.state, &src->s.status.state) ||
-	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    compat_put_timespec(&sstatus.tstamp, &src->s.status.tstamp) ||
-	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    compat_put_timespec(&sstatus.audio_tstamp,
-		    &src->s.status.audio_tstamp) ||
-	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    put_user(scontrol.avail_min, &src->c.control.avail_min))
-		return -EFAULT;
-
-	return 0;
-}
-
 #ifdef CONFIG_X86_X32
 /* X32 ABI has 64bit timespec and 64bit alignment */
 struct snd_pcm_mmap_status_x32 {
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ad4cf1e3e3bd..ba0636a2b437 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -4,6 +4,7 @@
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
  */
 
+#include <linux/compat.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/file.h>
@@ -2888,6 +2889,105 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+#ifdef CONFIG_COMPAT
+struct snd_pcm_mmap_status32 {
+	s32 state;
+	s32 pad1;
+	u32 hw_ptr;
+	struct compat_timespec tstamp;
+	s32 suspended_state;
+	struct compat_timespec audio_tstamp;
+} __attribute__((packed));
+
+struct snd_pcm_mmap_control32 {
+	u32 appl_ptr;
+	u32 avail_min;
+};
+
+struct snd_pcm_sync_ptr32 {
+	u32 flags;
+	union {
+		struct snd_pcm_mmap_status32 status;
+		unsigned char reserved[64];
+	} s;
+	union {
+		struct snd_pcm_mmap_control32 control;
+		unsigned char reserved[64];
+	} c;
+} __attribute__((packed));
+
+/* recalcuate the boundary within 32bit */
+static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
+{
+	snd_pcm_uframes_t boundary;
+
+	if (! runtime->buffer_size)
+		return 0;
+	boundary = runtime->buffer_size;
+	while (boundary * 2 <= 0x7fffffffUL - runtime->buffer_size)
+		boundary *= 2;
+	return boundary;
+}
+
+static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
+					 struct snd_pcm_sync_ptr32 __user *src)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	volatile struct snd_pcm_mmap_status *status;
+	volatile struct snd_pcm_mmap_control *control;
+	u32 sflags;
+	struct snd_pcm_mmap_control scontrol;
+	struct snd_pcm_mmap_status sstatus;
+	snd_pcm_uframes_t boundary;
+	int err;
+
+	if (snd_BUG_ON(!runtime))
+		return -EINVAL;
+
+	if (get_user(sflags, &src->flags) ||
+	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
+	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+		return -EFAULT;
+	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
+		err = snd_pcm_hwsync(substream);
+		if (err < 0)
+			return err;
+	}
+	status = runtime->status;
+	control = runtime->control;
+	boundary = recalculate_boundary(runtime);
+	if (! boundary)
+		boundary = 0x7fffffff;
+	snd_pcm_stream_lock_irq(substream);
+	/* FIXME: we should consider the boundary for the sync from app */
+	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
+		control->appl_ptr = scontrol.appl_ptr;
+	else
+		scontrol.appl_ptr = control->appl_ptr % boundary;
+	if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
+		control->avail_min = scontrol.avail_min;
+	else
+		scontrol.avail_min = control->avail_min;
+	sstatus.state = status->state;
+	sstatus.hw_ptr = status->hw_ptr % boundary;
+	sstatus.tstamp = status->tstamp;
+	sstatus.suspended_state = status->suspended_state;
+	sstatus.audio_tstamp = status->audio_tstamp;
+	snd_pcm_stream_unlock_irq(substream);
+	if (put_user(sstatus.state, &src->s.status.state) ||
+	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
+	    compat_put_timespec(&sstatus.tstamp, &src->s.status.tstamp) ||
+	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
+	    compat_put_timespec(&sstatus.audio_tstamp,
+				&src->s.status.audio_tstamp) ||
+	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
+	    put_user(scontrol.avail_min, &src->c.control.avail_min))
+		return -EFAULT;
+
+	return 0;
+}
+#endif
+
 static int snd_pcm_tstamp(struct snd_pcm_substream *substream, int __user *_arg)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
