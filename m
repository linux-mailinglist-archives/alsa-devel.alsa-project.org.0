Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11392F940A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 16:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A74A1671;
	Tue, 12 Nov 2019 16:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A74A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573572141;
	bh=dLfTkAJfFCQ9C3UJ7/ph8mKh5MKwSQEqLOqK3WE1dZc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1OF3BVmnpRKjPn5gGXX/7tenhHwcTJMROKCcDSohfvnpmYDcaZDMdmY9jdmlM9Oy
	 6/8ogBp2ZxVy0RJoV+dwKda6BGqrHEb3g1P5VqxsQpbG1DFmZinbRhwlT10MFbmXWt
	 lpQYwxAu/0sLiwMzRMzCCiIXh5pTYxfJf7wpQcvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE1BCF80659;
	Tue, 12 Nov 2019 16:18:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03A2F80612; Tue, 12 Nov 2019 16:18:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 199D0F804CF
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 16:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 199D0F804CF
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MtfRp-1hc9qB3Td1-00v4Hm; Tue, 12 Nov 2019 16:16:56 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 12 Nov 2019 16:16:36 +0100
Message-Id: <20191112151642.680072-3-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191112151642.680072-1-arnd@arndb.de>
References: <20191112151642.680072-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u3zGZYSUP0mPAgM1xzr7VtvAdHVSHJvfYGEoRMDWeoYEsEXXSCB
 2a0XtIGPepntRjOYl5w4Uldg2inkkpHr7o6pFEbF5HT2hRsNg7aXA3oDJNmCaGwhGoL3t/+
 lGn4c4O/jnzvkUwsfEbgxExa7aXDXwwP9a3V+wpaGSc+tQZ7WdA3ewmWhtXZ0FRKVeACN96
 nJRGS96Mosu+p5pjnnX9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0XEazvyASJg=:SlRb9zMUQw9OFLamESQKxP
 2TmH0aE8/RWYsoFgTzFlQQS3pH+9z+x3SZehXXxaNvj3GYpBNc+O6OcFPDcgeL0Gr61a9JkTC
 HYQQ/TwBokGTfZ147wNjak5exIJA2RvU+6Qk0u+lsM/hHTVKG36ytF7vOx+sOeBJSSvqFZ/+u
 CxybcpN5DiDVyLVZYxYoHz53HXxuRSoLLwqGjPEOgV62zMBMiHZ8LBvp/kSDDpYxbh4miTKrl
 tsYss2hinqfrsqrNb94lQLxU47ULfqkk5yqVoIIKgRnA2ITPdSdnsx+XJf0NYyx9hvOq86c9+
 FL9eBfolGHAYi2aP0YnPn8bcYuL/WzU3IFBJF7jst0CGKUJ935HR8x/L2N40wsSKv/bM/QFar
 wsv1kvP9fns4sbdEa/XoToWzXV4s3lh9zfAqzQVwBKf1sJ35p2oiZkcTKbarnF49s9G0RwxRi
 iAaen3Bw6MiPop4I6NmMAkzDZjDEl0YRL3ZDo8sSxVi1585jRY5QBH41fGfg70PiiXVbuW4dD
 nvMsPbNGKM7ogdwwHrIqPH9wcDZGXXDhNVlSkR/DjCT4/j/dHK7trAKfrUTZkgPz59498uQV4
 LgzrbIyipsphKjESiEIW3+yDphXaJnwwQsEfOrU3gKtTI2XZIKFrWEPVbaacX3qvTOathYqPr
 jj4pOSZEPzeIrP7QjcCqRJn3ENsQogP0u1rsuUZ+E8Cb8Ipi6Gm6vDCdWKW3OislxSEU/qYQK
 s3ZoXTKSDz99GsC773JSVv6MJZkkJzPrDWl7RXi4Tx+G6xsaue1Pe74OHsCpw1N/odwAeXc1I
 lqBwPjPyH7Uwtmt5OlFgHIzWUJqmMS313hQ2v+8VjA/H9Hk4hw3e/xX4Mppw3xB3WqGVgq8NL
 wneV/KLj/C5II6NQPFJQ==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v6 2/8] ALSA: Avoid using timespec for struct
	snd_timer_status
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

From: Baolin Wang <baolin.wang@linaro.org>

struct snd_timer_status uses 'timespec' type variables to record
timestamp, which will be changed to an incompatible layout with
updated user space using 64-bit time_t.

To handle both the old and the new layout on 32-bit architectures,
this patch introduces 'struct snd_timer_status32' and 'struct snd_timer_status64'
to handle 32bit time_t and 64bit time_t in native mode and compat mode,
which replaces timespec with s64 type.

When glibc changes time_t to 64-bit, any recompiled program will issue
ioctl commands that the kernel does not understand without this patch.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/sound/asound.h |  2 ++
 sound/core/timer.c          | 62 +++++++++++++++++++++++++++++++++----
 sound/core/timer_compat.c   | 57 ++++------------------------------
 3 files changed, 64 insertions(+), 57 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index df1153cea0b7..930854f67fd3 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -761,6 +761,7 @@ struct snd_timer_params {
 	unsigned char reserved[60];	/* reserved */
 };
 
+#ifndef __KERNEL__
 struct snd_timer_status {
 	struct timespec tstamp;		/* Timestamp - last update */
 	unsigned int resolution;	/* current period resolution in ns */
@@ -769,6 +770,7 @@ struct snd_timer_status {
 	unsigned int queue;		/* used queue size */
 	unsigned char reserved[64];	/* reserved */
 };
+#endif
 
 #define SNDRV_TIMER_IOCTL_PVERSION	_IOR('T', 0x00, int)
 #define SNDRV_TIMER_IOCTL_NEXT_DEVICE	_IOWR('T', 0x01, struct snd_timer_id)
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 29b99cfb5215..921f4ae2f9bf 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -65,6 +65,30 @@ struct snd_timer_user {
 	struct mutex ioctl_lock;
 };
 
+struct snd_timer_status32 {
+	s32 tstamp_sec;			/* Timestamp - last update */
+	s32 tstamp_nsec;
+	unsigned int resolution;	/* current period resolution in ns */
+	unsigned int lost;		/* counter of master tick lost */
+	unsigned int overrun;		/* count of read queue overruns */
+	unsigned int queue;		/* used queue size */
+	unsigned char reserved[64];	/* reserved */
+};
+
+#define SNDRV_TIMER_IOCTL_STATUS32	_IOR('T', 0x14, struct snd_timer_status32)
+
+struct snd_timer_status64 {
+	s64 tstamp_sec;			/* Timestamp - last update */
+	s64 tstamp_nsec;
+	unsigned int resolution;	/* current period resolution in ns */
+	unsigned int lost;		/* counter of master tick lost */
+	unsigned int overrun;		/* count of read queue overruns */
+	unsigned int queue;		/* used queue size */
+	unsigned char reserved[64];	/* reserved */
+};
+
+#define SNDRV_TIMER_IOCTL_STATUS64	_IOR('T', 0x14, struct snd_timer_status64)
+
 /* list of timers */
 static LIST_HEAD(snd_timer_list);
 
@@ -1861,17 +1885,41 @@ static int snd_timer_user_params(struct file *file,
 	return err;
 }
 
-static int snd_timer_user_status(struct file *file,
-				 struct snd_timer_status __user *_status)
+static int snd_timer_user_status32(struct file *file,
+				   struct snd_timer_status32 __user *_status)
+ {
+	struct snd_timer_user *tu;
+	struct snd_timer_status32 status;
+
+	tu = file->private_data;
+	if (!tu->timeri)
+		return -EBADFD;
+	memset(&status, 0, sizeof(status));
+	status.tstamp_sec = tu->tstamp.tv_sec;
+	status.tstamp_nsec = tu->tstamp.tv_nsec;
+	status.resolution = snd_timer_resolution(tu->timeri);
+	status.lost = tu->timeri->lost;
+	status.overrun = tu->overrun;
+	spin_lock_irq(&tu->qlock);
+	status.queue = tu->qused;
+	spin_unlock_irq(&tu->qlock);
+	if (copy_to_user(_status, &status, sizeof(status)))
+		return -EFAULT;
+	return 0;
+}
+
+static int snd_timer_user_status64(struct file *file,
+				   struct snd_timer_status64 __user *_status)
 {
 	struct snd_timer_user *tu;
-	struct snd_timer_status status;
+	struct snd_timer_status64 status;
 
 	tu = file->private_data;
 	if (!tu->timeri)
 		return -EBADFD;
 	memset(&status, 0, sizeof(status));
-	status.tstamp = timespec64_to_timespec(tu->tstamp);
+	status.tstamp_sec = tu->tstamp.tv_sec;
+	status.tstamp_nsec = tu->tstamp.tv_nsec;
 	status.resolution = snd_timer_resolution(tu->timeri);
 	status.lost = tu->timeri->lost;
 	status.overrun = tu->overrun;
@@ -1995,8 +2043,10 @@ static long __snd_timer_user_ioctl(struct file *file, unsigned int cmd,
 		return snd_timer_user_info(file, argp);
 	case SNDRV_TIMER_IOCTL_PARAMS:
 		return snd_timer_user_params(file, argp);
-	case SNDRV_TIMER_IOCTL_STATUS:
-		return snd_timer_user_status(file, argp);
+	case SNDRV_TIMER_IOCTL_STATUS32:
+		return snd_timer_user_status32(file, argp);
+	case SNDRV_TIMER_IOCTL_STATUS64:
+		return snd_timer_user_status64(file, argp);
 	case SNDRV_TIMER_IOCTL_START:
 	case SNDRV_TIMER_IOCTL_START_OLD:
 		return snd_timer_user_start(file);
diff --git a/sound/core/timer_compat.c b/sound/core/timer_compat.c
index bb6be484dfd3..20eef5bc304b 100644
--- a/sound/core/timer_compat.c
+++ b/sound/core/timer_compat.c
@@ -69,54 +69,11 @@ static int snd_timer_user_info_compat(struct file *file,
 	return 0;
 }
 
-struct snd_timer_status32 {
-	struct compat_timespec tstamp;
-	u32 resolution;
-	u32 lost;
-	u32 overrun;
-	u32 queue;
-	unsigned char reserved[64];
-};
-
-static int snd_timer_user_status_compat(struct file *file,
-					struct snd_timer_status32 __user *_status)
-{
-	struct snd_timer_user *tu;
-	struct snd_timer_status32 status;
-	
-	tu = file->private_data;
-	if (!tu->timeri)
-		return -EBADFD;
-	memset(&status, 0, sizeof(status));
-	status.tstamp.tv_sec = tu->tstamp.tv_sec;
-	status.tstamp.tv_nsec = tu->tstamp.tv_nsec;
-	status.resolution = snd_timer_resolution(tu->timeri);
-	status.lost = tu->timeri->lost;
-	status.overrun = tu->overrun;
-	spin_lock_irq(&tu->qlock);
-	status.queue = tu->qused;
-	spin_unlock_irq(&tu->qlock);
-	if (copy_to_user(_status, &status, sizeof(status)))
-		return -EFAULT;
-	return 0;
-}
-
-#ifdef CONFIG_X86_X32
-/* X32 ABI has the same struct as x86-64 */
-#define snd_timer_user_status_x32(file, s) \
-	snd_timer_user_status(file, s)
-#endif /* CONFIG_X86_X32 */
-
-/*
- */
-
 enum {
 	SNDRV_TIMER_IOCTL_GPARAMS32 = _IOW('T', 0x04, struct snd_timer_gparams32),
 	SNDRV_TIMER_IOCTL_INFO32 = _IOR('T', 0x11, struct snd_timer_info32),
-	SNDRV_TIMER_IOCTL_STATUS32 = _IOW('T', 0x14, struct snd_timer_status32),
-#ifdef CONFIG_X86_X32
-	SNDRV_TIMER_IOCTL_STATUS_X32 = _IOW('T', 0x14, struct snd_timer_status),
-#endif /* CONFIG_X86_X32 */
+	SNDRV_TIMER_IOCTL_STATUS_COMPAT32 = _IOW('T', 0x14, struct snd_timer_status32),
+	SNDRV_TIMER_IOCTL_STATUS_COMPAT64 = _IOW('T', 0x14, struct snd_timer_status64),
 };
 
 static long __snd_timer_user_ioctl_compat(struct file *file, unsigned int cmd,
@@ -145,12 +102,10 @@ static long __snd_timer_user_ioctl_compat(struct file *file, unsigned int cmd,
 		return snd_timer_user_gparams_compat(file, argp);
 	case SNDRV_TIMER_IOCTL_INFO32:
 		return snd_timer_user_info_compat(file, argp);
-	case SNDRV_TIMER_IOCTL_STATUS32:
-		return snd_timer_user_status_compat(file, argp);
-#ifdef CONFIG_X86_X32
-	case SNDRV_TIMER_IOCTL_STATUS_X32:
-		return snd_timer_user_status_x32(file, argp);
-#endif /* CONFIG_X86_X32 */
+	case SNDRV_TIMER_IOCTL_STATUS_COMPAT32:
+		return snd_timer_user_status32(file, argp);
+	case SNDRV_TIMER_IOCTL_STATUS_COMPAT64:
+		return snd_timer_user_status64(file, argp);
 	}
 	return -ENOIOCTLCMD;
 }
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
