Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04407F93FB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 16:19:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862A3166C;
	Tue, 12 Nov 2019 16:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862A3166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573571968;
	bh=grhLBIYQwgDmOlCB5MuQH/ytLq8TJ8Dmug5Np/c8tpI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KPkM9Fnq4VE+onkZ5jG3W35RgxQFpKAf981TgMTv0jvsRBymSnUbu+2r0nCcivC9d
	 X2wVONa7UI9IfXnDibo9WIEgpdYMVXbZqV7K5h2+aCxtDkrv1U6vwyHKWscUgIAt/K
	 F/tv1HxzvJcDXZuS0AqTDg1GYM2OwMn2zG9Nisrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E36F805FC;
	Tue, 12 Nov 2019 16:18:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A053F80507; Tue, 12 Nov 2019 16:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3FB0F80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 16:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3FB0F80275
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MvsMz-1heMlZ1bTr-00srMc; Tue, 12 Nov 2019 16:16:58 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 12 Nov 2019 16:16:41 +0100
Message-Id: <20191112151642.680072-8-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191112151642.680072-1-arnd@arndb.de>
References: <20191112151642.680072-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dtqoaQwSKA1q63zq2NLtnzRRfdE4iOdCohvxz6SoA6GtAIprbQA
 QUkxbusXoMRs9YuevIRG06mGKr179ICD90ysX1I7kufOsgutVAajIKbMatzON5h+WEjI1mi
 2ZlsS9yiCa8U853bBW2FL03aImgfAFOIKIwh8HFKG/537MkEos/GL/Vz7eOBNNVrVCx8dK8
 SWX+rnoEZnmslK9br4B8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9b2k5ENw0xc=:nhmErBHh8bwn0ffdqcyE/g
 zu0F7nZ+WLIcXemXY8RTC8ibhVAw4HiH6LgfD7pYKW5Sm9R2bv92cE/O9lNH19Xt+/QYkFzd3
 megGMJCMdjjSZ3D1FENgq5mSlqK2jyFkOjhUmA/AAm1pMJvrWl+jprM7kIFA8AP2/ktoqh1/D
 5ZJeksLRVCGs1KnknXitwJGIM5bztr3P9xItJGbjRSOk9YoLanMpsRkmolX4Z588Bb7HZ1DcT
 WarsQmITagCDgzOWZ2y8eCyjBGGiDY4WB2IKkq+/kFUpaskyYuDfuYo8xmiF30kEksh+zyzxb
 EZnX9eDH1FnbSw9ExWmBpDbWapFHqthnEKarFlg2S0u5wcB1I462xFXBmm3NdQzglCMjBvlWQ
 b3Uxqaopy3OS4PoaK99Vw+JFdVwp0EMdWMx4dn/jA9hhWt3eoufg6WEN7tWxfzgT0TNvnH4HJ
 zjXE3t/aJDCJZy3KMC6TkfehISPQ/SaET2GOOnRXk3TG48VB5CDOZwqPF2ojLrMXJc7rSwcCH
 8ilTC9O+nkeAUCFPQwfISZdM6oDOSs8JLjL2NWORjuXtOAoPfJ190KC22T4JnBIHBMAtw5wmg
 wjOxkQU5zqYIgDjM59lH8vsyKUlr26KEiNNbVQokKkrBuORzRLpyVpMz3aKCVxURhdNHAgz8g
 P9HlrhAw0JMEM/DU260goiUcNlDWIew4caW9+A2YWW67SGDWb0vBeTzxX/0vMwpcdiOHKhkFT
 A4sJrPUMpvC0XFbqf/8vmPFORf+04bzYYs5OorAgTHjXO5EjdPkfcKIEVIekjmy4SGr+qfsFp
 oMEhuqdoJGBr8wcKqCjnYYtqSZCUefHUuboyG6TgpGiil5E153mRfRgvMDP7dPmUHRVPt7X3w
 DXo3l52tPUYKwqSWxyng==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v6 7/8] ALSA: move
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

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/core/pcm_compat.c |  98 --------------------------------------
 sound/core/pcm_native.c | 101 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 98 deletions(-)

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
index 2c8c9b91677a..cad90d9ce9da 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -4,6 +4,7 @@
  *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
  */
 
+#include <linux/compat.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/file.h>
@@ -2846,6 +2847,106 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
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
+#define __SNDRV_PCM_IOCTL_SYNC_PTR32 = _IOWR('A', 0x23, struct snd_pcm_sync_ptr32),
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
