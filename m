Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8611BF36
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 22:28:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D971C166D;
	Wed, 11 Dec 2019 22:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D971C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576099700;
	bh=qN94J1p+kVQ/jVEqoQDQ1N6+rIHH5KQkDe2IhCmyYH4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XBrxFST2IL512FtRw77ul5O/Gxm6BqG/MBGu+xaoEgrpPRmjDrRK+/iZqGUYbc3N1
	 EcB+2QiW8FBY7yLx5XBNu0rxYGZqbM2ihX6f+kc017KJDZx+ajstv5q/j3PkVdmkBg
	 kW+hWnu9j/XBXgWhvebTfFfjOl4j/dG4pw70cp3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FEACF802BC;
	Wed, 11 Dec 2019 22:21:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B672F80245; Wed, 11 Dec 2019 22:20:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6724F8023F
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 22:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6724F8023F
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mleo0-1hxsQc1QcE-00ioCc; Wed, 11 Dec 2019 22:20:32 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 11 Dec 2019 22:20:20 +0100
Message-Id: <20191211212025.1981822-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191211212025.1981822-1-arnd@arndb.de>
References: <20191211212025.1981822-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s4jdIezweVZKvfN/zMuoWntCChnpad8xxD53zRY33HQg6oAtvFM
 ifBmsdmdWi6cr2azkRvjD7+S33KQz6RgVHKFHtVIH2gbcEpfHhgNWuW3Rb8qf12msFanfqD
 w0I6nkmVikz087djnimUz1ECO6hamqqs3mIPShdYPZzp6XHbFMazJJIaYE2x8mf9zN4L7ON
 kXnBWGELpDrPJPWzaKVoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k4BnUOOG2EM=:q6UxWAgHWFAd45hq5m0NrH
 /YvjcNm3kwLkQEDRGyoJnrz3eVX1lRKNXOzNxyNOCb8CWXEWuqec0sU9LIpVtYM2s8Z+SWlDj
 8mCYFRKrXhL2ToYCbpu1hGJgjW+mCZRVC8JCRU/2/b0E2pU3/+lACeN7cVNGvotGTfNKxk+2H
 DB5xySlP5Es3bXRDaJfLLhzx854C3UKEUOMBEcla7JC05UgPTHqBgjc6aPnCwmt1QqB8XcYfC
 B3VE+9gz8cOA0fcKSGupNwy0saCH6AWnV404lUD6VXTclaMgPlnsjdHttjnsyiz7dvXcHzYmi
 qcVdYmt0G7Dc6NABqowAuMq44ZJChVaUSivnK1sTcgR5EKxo4sbXBki80PXCJOxxsv71j/meE
 wyA1HSreADtBTh7BZqA7RZkpMU0oVVrsIA4exeVj/YOylvVUPdt6Yk4Iy/z6q+adHOzhoOXAB
 bSN5mcj+TW3lH/0IzfxLFYVXNao18vCB6akdLj54i5pAp52Wr7hkh8mUYl9DAs8+CrYUM2e7f
 /GXMecGBxgZp+So7B0HdbC9kqKYx29bNp4eAsWlQ9239k1Dhdtf8DQt7xEtR8Ini5RrdqZokC
 xcyUaifz+t2HNRYwjXTXqoXel8DEA+zDfRmfd8xwmEAp3+vBtf9qVHyA7QvG5FeFFyamtZfUy
 xzYzEQOwTuXbMAaKsHCIOPRbD2zUB80EiJb9p8chpGuqSmYc9iL2rkd/L+K4zpXqSLLKhv9yg
 F2Ac/n19qOsdiNzUASAh6ba6EJ+kzPfBTJIzDKtvBFU6r74b7mNF+DHcEcDeAzpDry6+y/93r
 1OgEgx4V0xGAuS8Vh9jdKoJ5CShGjDFmjvZk2JrJR+bbJaxbobuyhWM4Y7hVa7Nq0dy59Dixe
 nKiesueyZFA43GY4qJCg==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v7 4/9] ALSA: Avoid using timespec for struct
	snd_pcm_status
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

The struct snd_pcm_status will use 'timespec' type variables to record
timestamp, which is not year 2038 safe on 32bits system.

Userspace will use SNDRV_PCM_IOCTL_STATUS and SNDRV_PCM_IOCTL_STATUS_EXT
as commands to issue ioctl() to fill the 'snd_pcm_status' structure in
userspace. The command number is always defined through _IOR/_IOW/IORW,
so when userspace changes the definition of 'struct timespec' to use
64-bit types, the command number also changes.

Thus in the kernel, we now need to define two versions of each such ioctl
and corresponding ioctl commands to handle 32bit time_t and 64bit time_t
in native mode:
struct snd_pcm_status32 {
	......

	s32 trigger_tstamp_sec;
	s32 trigger_tstamp_nsec;

	......

	s32 audio_tstamp_sec;
	s32 audio_tstamp_nsec;

	......
};

struct snd_pcm_status64 {
	......

	s32 trigger_tstamp_sec;
	s32 trigger_tstamp_nsec;

	......

	s32 audio_tstamp_sec;
	s32 audio_tstamp_nsec;

	......
};

Moreover in compat file, we renamed or introduced new structures to handle
32bit/64bit time_t in compatible mode. The 'struct snd_pcm_status32' and
snd_pcm_status_user32() are used to handle 32bit time_t in compat mode.
'struct compat_snd_pcm_status64' and snd_pcm_status_user_compat64() are used
to handle 64bit time_t.

The implicit padding before timespec is made explicit to avoid incompatible
structure layout between 32-bit and 64-bit x86 due to the different
alignment requirements, and the snd_pcm_status structure is now hidden
from the kernel to avoid relying on the timespec definitio definitionn

Finally we can replace SNDRV_PCM_IOCTL_STATUS and SNDRV_PCM_IOCTL_STATUS_EXT
with new commands and introduce new functions to fill new 'struct snd_pcm_status64'
instead of using unsafe 'struct snd_pcm_status'. Then in future, the new
commands can be matched when userspace changes 'timespec' to 64bit type
to make a size change of 'struct snd_pcm_status'. When glibc changes time_t
to 64-bit, any recompiled program will issue ioctl commands that the kernel
does not understand without this patch.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/pcm.h         |  56 ++++++++++++-
 include/uapi/sound/asound.h |   6 ++
 sound/core/pcm.c            |  12 +--
 sound/core/pcm_compat.c     | 154 +++++++++++++-----------------------
 sound/core/pcm_native.c     |  96 ++++++++++++++++++----
 5 files changed, 198 insertions(+), 126 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index cb407fade933..5a31525e2df6 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -44,6 +44,7 @@ struct snd_pcm_hardware {
 	size_t fifo_size;		/* fifo size in bytes */
 };
 
+struct snd_pcm_status64;
 struct snd_pcm_substream;
 
 struct snd_pcm_audio_tstamp_config; /* definitions further down */
@@ -558,8 +559,8 @@ int snd_pcm_notify(struct snd_pcm_notify *notify, int nfree);
 int snd_pcm_info(struct snd_pcm_substream *substream, struct snd_pcm_info *info);
 int snd_pcm_info_user(struct snd_pcm_substream *substream,
 		      struct snd_pcm_info __user *info);
-int snd_pcm_status(struct snd_pcm_substream *substream,
-		   struct snd_pcm_status *status);
+int snd_pcm_status64(struct snd_pcm_substream *substream,
+		     struct snd_pcm_status64 *status);
 int snd_pcm_start(struct snd_pcm_substream *substream);
 int snd_pcm_stop(struct snd_pcm_substream *substream, snd_pcm_state_t status);
 int snd_pcm_drain_done(struct snd_pcm_substream *substream);
@@ -1422,4 +1423,55 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 #define pcm_dbg(pcm, fmt, args...) \
 	dev_dbg((pcm)->card->dev, fmt, ##args)
 
+struct snd_pcm_status64 {
+	snd_pcm_state_t state;		/* stream state */
+	u8 rsvd[4];
+	s64 trigger_tstamp_sec;		/* time when stream was started/stopped/paused */
+	s64 trigger_tstamp_nsec;
+	s64 tstamp_sec;			/* reference timestamp */
+	s64 tstamp_nsec;
+	snd_pcm_uframes_t appl_ptr;	/* appl ptr */
+	snd_pcm_uframes_t hw_ptr;	/* hw ptr */
+	snd_pcm_sframes_t delay;	/* current delay in frames */
+	snd_pcm_uframes_t avail;	/* number of frames available */
+	snd_pcm_uframes_t avail_max;	/* max frames available on hw since last status */
+	snd_pcm_uframes_t overrange;	/* count of ADC (capture) overrange detections from last status */
+	snd_pcm_state_t suspended_state; /* suspended stream state */
+	__u32 audio_tstamp_data;	 /* needed for 64-bit alignment, used for configs/report to/from userspace */
+	s64 audio_tstamp_sec;		/* sample counter, wall clock, PHC or on-demand sync'ed */
+	s64 audio_tstamp_nsec;
+	s64 driver_tstamp_sec;		/* useful in case reference system tstamp is reported with delay */
+	s64 driver_tstamp_nsec;
+	__u32 audio_tstamp_accuracy;	/* in ns units, only valid if indicated in audio_tstamp_data */
+	unsigned char reserved[52-4*sizeof(s64)]; /* must be filled with zero */
+};
+
+#define SNDRV_PCM_IOCTL_STATUS64	_IOR('A', 0x20, struct snd_pcm_status64)
+#define SNDRV_PCM_IOCTL_STATUS_EXT64	_IOWR('A', 0x24, struct snd_pcm_status64)
+
+struct snd_pcm_status32 {
+	s32 state;		/* stream state */
+	s32 trigger_tstamp_sec;	/* time when stream was started/stopped/paused */
+	s32 trigger_tstamp_nsec;
+	s32 tstamp_sec;		/* reference timestamp */
+	s32 tstamp_nsec;
+	u32 appl_ptr;		/* appl ptr */
+	u32 hw_ptr;		/* hw ptr */
+	s32 delay;		/* current delay in frames */
+	u32 avail;		/* number of frames available */
+	u32 avail_max;		/* max frames available on hw since last status */
+	u32 overrange;		/* count of ADC (capture) overrange detections from last status */
+	s32 suspended_state;	/* suspended stream state */
+	u32 audio_tstamp_data;	/* needed for 64-bit alignment, used for configs/report to/from userspace */
+	s32 audio_tstamp_sec;	/* sample counter, wall clock, PHC or on-demand sync'ed */
+	s32 audio_tstamp_nsec;
+	s32 driver_tstamp_sec;	/* useful in case reference system tstamp is reported with delay */
+	s32 driver_tstamp_nsec;
+	u32 audio_tstamp_accuracy;	/* in ns units, only valid if indicated in audio_tstamp_data */
+	unsigned char reserved[52-4*sizeof(s32)]; /* must be filled with zero */
+};
+
+#define SNDRV_PCM_IOCTL_STATUS32	_IOR('A', 0x20, struct snd_pcm_status32)
+#define SNDRV_PCM_IOCTL_STATUS_EXT32	_IOWR('A', 0x24, struct snd_pcm_status32)
+
 #endif /* __SOUND_PCM_H */
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 40a23d8418fe..d2c88c098b20 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -456,8 +456,13 @@ enum {
 	SNDRV_PCM_AUDIO_TSTAMP_TYPE_LAST = SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED
 };
 
+#ifndef __KERNEL__
+/* explicit padding avoids incompatibility between i386 and x86-64 */
+typedef struct { unsigned char pad[sizeof(time_t) - sizeof(int)] __time_pad;
+
 struct snd_pcm_status {
 	snd_pcm_state_t state;		/* stream state */
+	__time_pad pad1;		/* align to timespec */
 	struct timespec trigger_tstamp;	/* time when stream was started/stopped/paused */
 	struct timespec tstamp;		/* reference timestamp */
 	snd_pcm_uframes_t appl_ptr;	/* appl ptr */
@@ -473,6 +478,7 @@ struct snd_pcm_status {
 	__u32 audio_tstamp_accuracy;	/* in ns units, only valid if indicated in audio_tstamp_data */
 	unsigned char reserved[52-2*sizeof(struct timespec)]; /* must be filled with zero */
 };
+#endif
 
 struct snd_pcm_mmap_status {
 	snd_pcm_state_t state;		/* RO: state - SNDRV_PCM_STATE_XXXX */
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9a72d641743d..85db55ea49fd 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -443,7 +443,7 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
 {
 	struct snd_pcm_substream *substream = entry->private_data;
 	struct snd_pcm_runtime *runtime;
-	struct snd_pcm_status status;
+	struct snd_pcm_status64 status;
 	int err;
 
 	mutex_lock(&substream->pcm->open_mutex);
@@ -453,17 +453,17 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
 		goto unlock;
 	}
 	memset(&status, 0, sizeof(status));
-	err = snd_pcm_status(substream, &status);
+	err = snd_pcm_status64(substream, &status);
 	if (err < 0) {
 		snd_iprintf(buffer, "error %d\n", err);
 		goto unlock;
 	}
 	snd_iprintf(buffer, "state: %s\n", snd_pcm_state_name(status.state));
 	snd_iprintf(buffer, "owner_pid   : %d\n", pid_vnr(substream->pid));
-	snd_iprintf(buffer, "trigger_time: %ld.%09ld\n",
-		status.trigger_tstamp.tv_sec, status.trigger_tstamp.tv_nsec);
-	snd_iprintf(buffer, "tstamp      : %ld.%09ld\n",
-		status.tstamp.tv_sec, status.tstamp.tv_nsec);
+	snd_iprintf(buffer, "trigger_time: %lld.%09lld\n",
+		status.trigger_tstamp_sec, status.trigger_tstamp_nsec);
+	snd_iprintf(buffer, "tstamp      : %lld.%09lld\n",
+		status.tstamp_sec, status.tstamp_nsec);
 	snd_iprintf(buffer, "delay       : %ld\n", status.delay);
 	snd_iprintf(buffer, "avail       : %ld\n", status.avail);
 	snd_iprintf(buffer, "avail_max   : %ld\n", status.avail_max);
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 6f9003b1869a..2671658442ea 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -168,73 +168,13 @@ static int snd_pcm_channel_info_user(struct snd_pcm_substream *substream,
 	snd_pcm_channel_info_user(s, p)
 #endif /* CONFIG_X86_X32 */
 
-struct snd_pcm_status32 {
+struct compat_snd_pcm_status64 {
 	s32 state;
-	struct compat_timespec trigger_tstamp;
-	struct compat_timespec tstamp;
-	u32 appl_ptr;
-	u32 hw_ptr;
-	s32 delay;
-	u32 avail;
-	u32 avail_max;
-	u32 overrange;
-	s32 suspended_state;
-	u32 audio_tstamp_data;
-	struct compat_timespec audio_tstamp;
-	struct compat_timespec driver_tstamp;
-	u32 audio_tstamp_accuracy;
-	unsigned char reserved[52-2*sizeof(struct compat_timespec)];
-} __attribute__((packed));
-
-
-static int snd_pcm_status_user_compat(struct snd_pcm_substream *substream,
-				      struct snd_pcm_status32 __user *src,
-				      bool ext)
-{
-	struct snd_pcm_status status;
-	int err;
-
-	memset(&status, 0, sizeof(status));
-	/*
-	 * with extension, parameters are read/write,
-	 * get audio_tstamp_data from user,
-	 * ignore rest of status structure
-	 */
-	if (ext && get_user(status.audio_tstamp_data,
-				(u32 __user *)(&src->audio_tstamp_data)))
-		return -EFAULT;
-	err = snd_pcm_status(substream, &status);
-	if (err < 0)
-		return err;
-
-	if (clear_user(src, sizeof(*src)))
-		return -EFAULT;
-	if (put_user(status.state, &src->state) ||
-	    compat_put_timespec(&status.trigger_tstamp, &src->trigger_tstamp) ||
-	    compat_put_timespec(&status.tstamp, &src->tstamp) ||
-	    put_user(status.appl_ptr, &src->appl_ptr) ||
-	    put_user(status.hw_ptr, &src->hw_ptr) ||
-	    put_user(status.delay, &src->delay) ||
-	    put_user(status.avail, &src->avail) ||
-	    put_user(status.avail_max, &src->avail_max) ||
-	    put_user(status.overrange, &src->overrange) ||
-	    put_user(status.suspended_state, &src->suspended_state) ||
-	    put_user(status.audio_tstamp_data, &src->audio_tstamp_data) ||
-	    compat_put_timespec(&status.audio_tstamp, &src->audio_tstamp) ||
-	    compat_put_timespec(&status.driver_tstamp, &src->driver_tstamp) ||
-	    put_user(status.audio_tstamp_accuracy, &src->audio_tstamp_accuracy))
-		return -EFAULT;
-
-	return err;
-}
-
-#ifdef CONFIG_X86_X32
-/* X32 ABI has 64bit timespec and 64bit alignment */
-struct snd_pcm_status_x32 {
-	s32 state;
-	u32 rsvd; /* alignment */
-	struct timespec trigger_tstamp;
-	struct timespec tstamp;
+	u8 rsvd[4]; /* alignment */
+	s64 trigger_tstamp_sec;
+	s64 trigger_tstamp_nsec;
+	s64 tstamp_sec;
+	s64 tstamp_nsec;
 	u32 appl_ptr;
 	u32 hw_ptr;
 	s32 delay;
@@ -243,22 +183,26 @@ struct snd_pcm_status_x32 {
 	u32 overrange;
 	s32 suspended_state;
 	u32 audio_tstamp_data;
-	struct timespec audio_tstamp;
-	struct timespec driver_tstamp;
+	s64 audio_tstamp_sec;
+	s64 audio_tstamp_nsec;
+	s64 driver_tstamp_sec;
+	s64 driver_tstamp_nsec;
 	u32 audio_tstamp_accuracy;
-	unsigned char reserved[52-2*sizeof(struct timespec)];
+	unsigned char reserved[52-4*sizeof(s64)];
 } __packed;
 
 #define put_timespec(src, dst) copy_to_user(dst, src, sizeof(*dst))
 
-static int snd_pcm_status_user_x32(struct snd_pcm_substream *substream,
-				   struct snd_pcm_status_x32 __user *src,
-				   bool ext)
+static int snd_pcm_status_user_compat64(struct snd_pcm_substream *substream,
+					struct compat_snd_pcm_status64 __user *src,
+					bool ext)
 {
-	struct snd_pcm_status status;
+	struct snd_pcm_status64 status;
+	struct compat_snd_pcm_status64 compat_status64;
 	int err;
 
 	memset(&status, 0, sizeof(status));
+	memset(&compat_status64, 0, sizeof(compat_status64));
 	/*
 	 * with extension, parameters are read/write,
 	 * get audio_tstamp_data from user,
@@ -267,31 +211,39 @@ static int snd_pcm_status_user_x32(struct snd_pcm_substream *substream,
 	if (ext && get_user(status.audio_tstamp_data,
 				(u32 __user *)(&src->audio_tstamp_data)))
 		return -EFAULT;
-	err = snd_pcm_status(substream, &status);
+	err = snd_pcm_status64(substream, &status);
 	if (err < 0)
 		return err;
 
 	if (clear_user(src, sizeof(*src)))
 		return -EFAULT;
-	if (put_user(status.state, &src->state) ||
-	    put_timespec(&status.trigger_tstamp, &src->trigger_tstamp) ||
-	    put_timespec(&status.tstamp, &src->tstamp) ||
-	    put_user(status.appl_ptr, &src->appl_ptr) ||
-	    put_user(status.hw_ptr, &src->hw_ptr) ||
-	    put_user(status.delay, &src->delay) ||
-	    put_user(status.avail, &src->avail) ||
-	    put_user(status.avail_max, &src->avail_max) ||
-	    put_user(status.overrange, &src->overrange) ||
-	    put_user(status.suspended_state, &src->suspended_state) ||
-	    put_user(status.audio_tstamp_data, &src->audio_tstamp_data) ||
-	    put_timespec(&status.audio_tstamp, &src->audio_tstamp) ||
-	    put_timespec(&status.driver_tstamp, &src->driver_tstamp) ||
-	    put_user(status.audio_tstamp_accuracy, &src->audio_tstamp_accuracy))
+
+	compat_status64 = (struct compat_snd_pcm_status64) {
+		.state = status.state,
+		.trigger_tstamp_sec = status.trigger_tstamp_sec,
+		.trigger_tstamp_nsec = status.trigger_tstamp_nsec,
+		.tstamp_sec = status.tstamp_sec,
+		.tstamp_nsec = status.tstamp_nsec,
+		.appl_ptr = status.appl_ptr,
+		.hw_ptr = status.hw_ptr,
+		.delay = status.delay,
+		.avail = status.avail,
+		.avail_max = status.avail_max,
+		.overrange = status.overrange,
+		.suspended_state = status.suspended_state,
+		.audio_tstamp_data = status.audio_tstamp_data,
+		.audio_tstamp_sec = status.audio_tstamp_sec,
+		.audio_tstamp_nsec = status.audio_tstamp_nsec,
+		.driver_tstamp_sec = status.audio_tstamp_sec,
+		.driver_tstamp_nsec = status.audio_tstamp_nsec,
+		.audio_tstamp_accuracy = status.audio_tstamp_accuracy,
+	};
+
+	if (copy_to_user(src, &compat_status64, sizeof(compat_status64)))
 		return -EFAULT;
 
 	return err;
 }
-#endif /* CONFIG_X86_X32 */
 
 /* both for HW_PARAMS and HW_REFINE */
 static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
@@ -616,8 +568,8 @@ enum {
 	SNDRV_PCM_IOCTL_HW_REFINE32 = _IOWR('A', 0x10, struct snd_pcm_hw_params32),
 	SNDRV_PCM_IOCTL_HW_PARAMS32 = _IOWR('A', 0x11, struct snd_pcm_hw_params32),
 	SNDRV_PCM_IOCTL_SW_PARAMS32 = _IOWR('A', 0x13, struct snd_pcm_sw_params32),
-	SNDRV_PCM_IOCTL_STATUS32 = _IOR('A', 0x20, struct snd_pcm_status32),
-	SNDRV_PCM_IOCTL_STATUS_EXT32 = _IOWR('A', 0x24, struct snd_pcm_status32),
+	SNDRV_PCM_IOCTL_STATUS_COMPAT32 = _IOR('A', 0x20, struct snd_pcm_status32),
+	SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT32 = _IOWR('A', 0x24, struct snd_pcm_status32),
 	SNDRV_PCM_IOCTL_DELAY32 = _IOR('A', 0x21, s32),
 	SNDRV_PCM_IOCTL_CHANNEL_INFO32 = _IOR('A', 0x32, struct snd_pcm_channel_info32),
 	SNDRV_PCM_IOCTL_REWIND32 = _IOW('A', 0x46, u32),
@@ -627,10 +579,10 @@ enum {
 	SNDRV_PCM_IOCTL_WRITEN_FRAMES32 = _IOW('A', 0x52, struct snd_xfern32),
 	SNDRV_PCM_IOCTL_READN_FRAMES32 = _IOR('A', 0x53, struct snd_xfern32),
 	SNDRV_PCM_IOCTL_SYNC_PTR32 = _IOWR('A', 0x23, struct snd_pcm_sync_ptr32),
+	SNDRV_PCM_IOCTL_STATUS_COMPAT64 = _IOR('A', 0x20, struct compat_snd_pcm_status64),
+	SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT64 = _IOWR('A', 0x24, struct compat_snd_pcm_status64),
 #ifdef CONFIG_X86_X32
 	SNDRV_PCM_IOCTL_CHANNEL_INFO_X32 = _IOR('A', 0x32, struct snd_pcm_channel_info),
-	SNDRV_PCM_IOCTL_STATUS_X32 = _IOR('A', 0x20, struct snd_pcm_status_x32),
-	SNDRV_PCM_IOCTL_STATUS_EXT_X32 = _IOWR('A', 0x24, struct snd_pcm_status_x32),
 	SNDRV_PCM_IOCTL_SYNC_PTR_X32 = _IOWR('A', 0x23, struct snd_pcm_sync_ptr_x32),
 #endif /* CONFIG_X86_X32 */
 };
@@ -680,10 +632,10 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 		return snd_pcm_ioctl_hw_params_compat(substream, 0, argp);
 	case SNDRV_PCM_IOCTL_SW_PARAMS32:
 		return snd_pcm_ioctl_sw_params_compat(substream, argp);
-	case SNDRV_PCM_IOCTL_STATUS32:
-		return snd_pcm_status_user_compat(substream, argp, false);
-	case SNDRV_PCM_IOCTL_STATUS_EXT32:
-		return snd_pcm_status_user_compat(substream, argp, true);
+	case SNDRV_PCM_IOCTL_STATUS_COMPAT32:
+		return snd_pcm_status_user32(substream, argp, false);
+	case SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT32:
+		return snd_pcm_status_user32(substream, argp, true);
 	case SNDRV_PCM_IOCTL_SYNC_PTR32:
 		return snd_pcm_ioctl_sync_ptr_compat(substream, argp);
 	case SNDRV_PCM_IOCTL_CHANNEL_INFO32:
@@ -702,11 +654,11 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 		return snd_pcm_ioctl_rewind_compat(substream, argp);
 	case SNDRV_PCM_IOCTL_FORWARD32:
 		return snd_pcm_ioctl_forward_compat(substream, argp);
+	case SNDRV_PCM_IOCTL_STATUS_COMPAT64:
+		return snd_pcm_status_user_compat64(substream, argp, false);
+	case SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT64:
+		return snd_pcm_status_user_compat64(substream, argp, true);
 #ifdef CONFIG_X86_X32
-	case SNDRV_PCM_IOCTL_STATUS_X32:
-		return snd_pcm_status_user_x32(substream, argp, false);
-	case SNDRV_PCM_IOCTL_STATUS_EXT_X32:
-		return snd_pcm_status_user_x32(substream, argp, true);
 	case SNDRV_PCM_IOCTL_SYNC_PTR_X32:
 		return snd_pcm_ioctl_sync_ptr_x32(substream, argp);
 	case SNDRV_PCM_IOCTL_CHANNEL_INFO_X32:
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 67fe14bad7cb..ad4cf1e3e3bd 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -891,8 +891,8 @@ snd_pcm_calc_delay(struct snd_pcm_substream *substream)
 	return delay + substream->runtime->delay;
 }
 
-int snd_pcm_status(struct snd_pcm_substream *substream,
-		   struct snd_pcm_status *status)
+int snd_pcm_status64(struct snd_pcm_substream *substream,
+		     struct snd_pcm_status64 *status)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -918,14 +918,22 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
 	status->suspended_state = runtime->status->suspended_state;
 	if (status->state == SNDRV_PCM_STATE_OPEN)
 		goto _end;
-	status->trigger_tstamp = timespec64_to_timespec(runtime->trigger_tstamp);
+	status->trigger_tstamp_sec = runtime->trigger_tstamp.tv_sec;
+	status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
 	if (snd_pcm_running(substream)) {
 		snd_pcm_update_hw_ptr(substream);
 		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
-			status->tstamp = runtime->status->tstamp;
-			status->driver_tstamp = timespec64_to_timespec(runtime->driver_tstamp);
-			status->audio_tstamp =
-				runtime->status->audio_tstamp;
+			status->tstamp_sec = runtime->status->tstamp.tv_sec;
+			status->tstamp_nsec =
+				runtime->status->tstamp.tv_nsec;
+			status->driver_tstamp_sec =
+				runtime->driver_tstamp.tv_sec;
+			status->driver_tstamp_nsec =
+				runtime->driver_tstamp.tv_nsec;
+			status->audio_tstamp_sec =
+				runtime->status->audio_tstamp.tv_sec;
+			status->audio_tstamp_nsec =
+				runtime->status->audio_tstamp.tv_nsec;
 			if (runtime->audio_tstamp_report.valid == 1)
 				/* backwards compatibility, no report provided in COMPAT mode */
 				snd_pcm_pack_audio_tstamp_report(&status->audio_tstamp_data,
@@ -940,7 +948,8 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
 			struct timespec64 tstamp;
 
 			snd_pcm_gettime(runtime, &tstamp);
-			status->tstamp = timespec64_to_timespec(tstamp);
+			status->tstamp_sec = tstamp.tv_sec;
+			status->tstamp_nsec = tstamp.tv_nsec;
 		}
 	}
  _tstamp_end:
@@ -958,11 +967,11 @@ int snd_pcm_status(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_pcm_status_user(struct snd_pcm_substream *substream,
-			       struct snd_pcm_status __user * _status,
-			       bool ext)
+static int snd_pcm_status_user64(struct snd_pcm_substream *substream,
+				 struct snd_pcm_status64 __user * _status,
+				 bool ext)
 {
-	struct snd_pcm_status status;
+	struct snd_pcm_status64 status;
 	int res;
 
 	memset(&status, 0, sizeof(status));
@@ -974,7 +983,7 @@ static int snd_pcm_status_user(struct snd_pcm_substream *substream,
 	if (ext && get_user(status.audio_tstamp_data,
 				(u32 __user *)(&_status->audio_tstamp_data)))
 		return -EFAULT;
-	res = snd_pcm_status(substream, &status);
+	res = snd_pcm_status64(substream, &status);
 	if (res < 0)
 		return res;
 	if (copy_to_user(_status, &status, sizeof(status)))
@@ -982,6 +991,55 @@ static int snd_pcm_status_user(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int snd_pcm_status_user32(struct snd_pcm_substream *substream,
+				 struct snd_pcm_status32 __user * _status,
+				 bool ext)
+{
+	struct snd_pcm_status64 status64;
+	struct snd_pcm_status32 status32;
+	int res;
+
+	memset(&status64, 0, sizeof(status64));
+	memset(&status32, 0, sizeof(status32));
+	/*
+	 * with extension, parameters are read/write,
+	 * get audio_tstamp_data from user,
+	 * ignore rest of status structure
+	 */
+	if (ext && get_user(status64.audio_tstamp_data,
+			    (u32 __user *)(&_status->audio_tstamp_data)))
+		return -EFAULT;
+	res = snd_pcm_status64(substream, &status64);
+	if (res < 0)
+		return res;
+
+	status32 = (struct snd_pcm_status32) {
+		.state = status64.state,
+		.trigger_tstamp_sec = status64.trigger_tstamp_sec,
+		.trigger_tstamp_nsec = status64.trigger_tstamp_nsec,
+		.tstamp_sec = status64.tstamp_sec,
+		.tstamp_nsec = status64.tstamp_nsec,
+		.appl_ptr = status64.appl_ptr,
+		.hw_ptr = status64.hw_ptr,
+		.delay = status64.delay,
+		.avail = status64.avail,
+		.avail_max = status64.avail_max,
+		.overrange = status64.overrange,
+		.suspended_state = status64.suspended_state,
+		.audio_tstamp_data = status64.audio_tstamp_data,
+		.audio_tstamp_sec = status64.audio_tstamp_sec,
+		.audio_tstamp_nsec = status64.audio_tstamp_nsec,
+		.driver_tstamp_sec = status64.audio_tstamp_sec,
+		.driver_tstamp_nsec = status64.audio_tstamp_nsec,
+		.audio_tstamp_accuracy = status64.audio_tstamp_accuracy,
+	};
+
+	if (copy_to_user(_status, &status32, sizeof(status32)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int snd_pcm_channel_info(struct snd_pcm_substream *substream,
 				struct snd_pcm_channel_info * info)
 {
@@ -2959,10 +3017,14 @@ static int snd_pcm_common_ioctl(struct file *file,
 		return snd_pcm_hw_free(substream);
 	case SNDRV_PCM_IOCTL_SW_PARAMS:
 		return snd_pcm_sw_params_user(substream, arg);
-	case SNDRV_PCM_IOCTL_STATUS:
-		return snd_pcm_status_user(substream, arg, false);
-	case SNDRV_PCM_IOCTL_STATUS_EXT:
-		return snd_pcm_status_user(substream, arg, true);
+	case SNDRV_PCM_IOCTL_STATUS32:
+		return snd_pcm_status_user32(substream, arg, false);
+	case SNDRV_PCM_IOCTL_STATUS_EXT32:
+		return snd_pcm_status_user32(substream, arg, true);
+	case SNDRV_PCM_IOCTL_STATUS64:
+		return snd_pcm_status_user64(substream, arg, false);
+	case SNDRV_PCM_IOCTL_STATUS_EXT64:
+		return snd_pcm_status_user64(substream, arg, true);
 	case SNDRV_PCM_IOCTL_CHANNEL_INFO:
 		return snd_pcm_channel_info_user(substream, arg);
 	case SNDRV_PCM_IOCTL_PREPARE:
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
