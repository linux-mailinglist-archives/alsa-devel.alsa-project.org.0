Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF111BF34
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 22:27:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35851674;
	Wed, 11 Dec 2019 22:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35851674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576099657;
	bh=086MXY2yk99K0RlRHAsL3NmoejxuQbZdph9gPFxrb2E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/yAIAr9+kS1Fdb1QgcKPknN/Q+1HpIoOJLPk0iHbSzjY4TkHSKekDjm+fiLyMagX
	 moOw9df+AuChLmkWWG/ZjRTY6FHTUEfbxI1ck4BhQwquFBe5o5J5j60Hbwg2SDQ4S2
	 /nON+lANM9ZaTq2IFzMvKRJ3MWPrZWRhKmVZhSYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE8DFF8029A;
	Wed, 11 Dec 2019 22:21:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 388E0F80276; Wed, 11 Dec 2019 22:20:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BEC7F80245
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 22:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BEC7F80245
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N0F9t-1hlNSw2gPn-00xG6d; Wed, 11 Dec 2019 22:20:33 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 11 Dec 2019 22:20:24 +0100
Message-Id: <20191211212025.1981822-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191211212025.1981822-1-arnd@arndb.de>
References: <20191211212025.1981822-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5NnHiLeo9rQFgc7DO4rcGXwJyRFHLcOahws42Vd4+ZLOkNIDspD
 U2ucT25reB7mvwREkSU8jYhq/6KYfRPMy+k6xdZyRi+Ym1n2MW7yyr/02fOV30GMzzlzjrH
 RaO9hXJmU1eDGWSHaXwL92TPog4eESho0ToSmoyR+bOB8a/o/w1x8MuO6umCM95yx/Z9IcT
 w4lI2PtgrzAvFFMkZWnsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4r9+T0On1E4=:7dpWWGHL1kV6ILrbGb+J21
 V3DEGlMfwDJrMiGpiNfGr6Sd8ot9ph0jzePKj586Q9aaCqcm3/bTG+rDGITapsP3JVaqg+hwU
 YnQnYpTakFi2tKAAhWMC3Q3NcN54JgBtfPtxv0aSx5x9sOkUbuPduIbXJ6NpulRxGfW3PUaC8
 3MzL9BVzm2GW4f1n8BtaJKVCBLEj1DL98c07ldFncZLp83wHUk97ZyXiZXwEzXq/sNutT9drA
 VfUlNsJMRruEBKblzga9crWvAo/lXH4kbIN0ADvdhG9/owAAmmKfpVea2evLrAvsBTzI2O1pb
 ULp36aDULNubEldCuqM28smaMN+qNt+DghECet67mRAZvXcj69bqIPMNtb6HGgP6XnzHaiwT0
 CwqvtcmnZWw0ei+aCCdksBH3iazNmGmJ8Ow8Bw0k7iJx5NbmkO39frHZLXyOmD+bhzc7uBKas
 Mhkmllm17InlHeyFCgjrjpan8h/UQTmHoJ8zyO/7j6pYZFLaZ7HYBUnghC70IxrFURyahtOG2
 HmMMecafQjQcbQDM4g/WDbky0i6oEUKCM3QBki0hP2Nea1LC4mpP44UAzB2nBjynTEvwpZ+x+
 sftmBFMapRCPJmTbpBNNZUlNuDkL//carDxWAMLu4Y1JW5x2ImsYVOLrKDKyoSzKlswTSXw28
 2c20FuGPcxF1PtrKMGskAXDNx0WUM5BspFLAsCsEKENmrhmd6c2AWIArUGk1wOTue+jCSyPud
 bFvAPvI4n9qxZ2+xWqHbkjpw7IzE+WAb4B4W8241ahXboMZdP2NW6ue6qpOcVP0WD+8KEFPyr
 +l4nPuAARnz7efkgCrHKoAgq2MFe43dXTTAyqz/M9WvkzliwsDC0AnJyeuFXjjrLXnyK0esaT
 mgZJVzs/ynzmCIesxHxQ==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit layout for
	snd_pcm_mmap_status/control
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

The snd_pcm_mmap_status and snd_pcm_mmap_control interfaces are one of the
trickiest areas to get right when moving to 64-bit time_t in user space.

The snd_pcm_mmap_status structure layout is incompatible with user space
that uses a 64-bit time_t, so we need a new layout for it. Since the
SNDRV_PCM_IOCTL_SYNC_PTR ioctl combines it with snd_pcm_mmap_control
into snd_pcm_sync_ptr, we need to change those two as well.

Both structures are also exported via an mmap() operation on certain
architectures, and this suffers from incompatibility between 32-bit
and 64-bit user space. As we have to change both structures anyway,
this is a good opportunity to fix the mmap() problem as well, so let's
standardize on the existing 64-bit layout of the structure where possible.

The downside is that we lose mmap() support for existing 32-bit x86 and
powerpc applications, adding that would introduce very noticeable runtime
overhead and complexity. My assumption here is that not too many people
will miss the removed feature, given that:

- Almost all x86 and powerpc users these days are on 64-bit kernels,
the majority of today's 32-bit users are on architectures that never
supported mmap (ARM, MIPS, ...).
- It never worked in compat mode (it was intentionally disabled there)
- The application already needs to work with a fallback to
SNDRV_PCM_IOCTL_SYNC_PTR, which will keep working with both the old
and new structure layout.

Both the ioctl() and mmap() based interfaces are changed at the same
time, as they are based on the same structures. Unlike other interfaces,
we change the uapi header to export both the traditional structure and
a version that is portable between 32-bit and 64-bit user space code
and that corresponds to the existing 64-bit layout. We further check the
__USE_TIME_BITS64 macro that will be defined by future C library versions
whenever we use the new time_t definition, so any existing user space
source code will not see any changes until it gets rebuilt against a new
C library. However, the new structures are all visible in addition to the
old ones, allowing applications to explicitly request the new structures.

In order to detect the difference between the old snd_pcm_mmap_status and
the new __snd_pcm_mmap_status64 structure from the ioctl command number,
we rely on one quirk in the structure definition: snd_pcm_mmap_status
must be aligned to alignof(time_t), which leads the compiler to insert
four bytes of padding in struct snd_pcm_sync_ptr after 'flags' and a
corresponding change in the size of snd_pcm_sync_ptr itself. On x86-32
(and only there), the compiler doesn't use 64-bit alignment in structure,
so I'm adding an explicit pad in the structure that has no effect on the
existing 64-bit architectures but ensures that the layout matches for x86.

The snd_pcm_uframes_t type compatibility requires another hack: we can't
easily make that 64 bit wide, so I leave the type as 'unsigned long',
but add padding before and after it, to ensure that the data is properly
aligned to the respective 64-bit field in the in-kernel structure.

For the SNDRV_PCM_MMAP_OFFSET_STATUS/CONTROL constants that are used
as the virtual file offset in the mmap() function, we also have to
introduce new constants that depend on hte __USE_TIME_BITS64 macro:
The existing macros are renamed to SNDRV_PCM_MMAP_OFFSET_STATUS_OLD
and SNDRV_PCM_MMAP_OFFSET_CONTROL_OLD, they continue to work fine on
64-bit architectures, but stop working on native 32-bit user space.
The replacement _NEW constants are now used by default for user space
built with __USE_TIME_BITS64, those now work on all new kernels for x86,
ppc and alpha (32 and 64 bit, native and compat). It might be a good idea
for a future alsa-lib to support both the _OLD and _NEW macros and use
the corresponding structures directly. Unmodified alsa-lib source code
will retain the current behavior, so it will no longer be able to use
mmap() for the status/control structures on 32-bit systems, until either
the C library gets updated to 64-bit time_t or alsa-lib gets updated to
support both mmap() layouts.

Co-developed-with: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/sound/asound.h | 110 ++++++++++++++++++++++++++++++++----
 sound/core/pcm_compat.c     |  30 +++++-----
 sound/core/pcm_lib.c        |  10 ++--
 sound/core/pcm_native.c     |  38 ++++++++-----
 4 files changed, 147 insertions(+), 41 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index ad86c5a7a1e2..df9983e7ead5 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -35,6 +35,8 @@
 #include <time.h>
 #endif
 
+#include <asm/byteorder.h>
+
 /*
  *  protocol version
  */
@@ -301,7 +303,9 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define SNDRV_PCM_INFO_DRAIN_TRIGGER	0x40000000		/* internal kernel flag - trigger in drain */
 #define SNDRV_PCM_INFO_FIFO_IN_FRAMES	0x80000000	/* internal kernel flag - FIFO size is in frames */
 
-
+#if (__BITS_PER_LONG == 32 && defined(__USE_TIME_BITS64)) || defined __KERNEL__
+#define __SND_STRUCT_TIME64
+#endif
 
 typedef int __bitwise snd_pcm_state_t;
 #define	SNDRV_PCM_STATE_OPEN		((__force snd_pcm_state_t) 0) /* stream is open */
@@ -317,8 +321,17 @@ typedef int __bitwise snd_pcm_state_t;
 
 enum {
 	SNDRV_PCM_MMAP_OFFSET_DATA = 0x00000000,
-	SNDRV_PCM_MMAP_OFFSET_STATUS = 0x80000000,
-	SNDRV_PCM_MMAP_OFFSET_CONTROL = 0x81000000,
+	SNDRV_PCM_MMAP_OFFSET_STATUS_OLD = 0x80000000,
+	SNDRV_PCM_MMAP_OFFSET_CONTROL_OLD = 0x81000000,
+	SNDRV_PCM_MMAP_OFFSET_STATUS_NEW = 0x82000000,
+	SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW = 0x83000000,
+#ifdef __SND_STRUCT_TIME64
+	SNDRV_PCM_MMAP_OFFSET_STATUS = SNDRV_PCM_MMAP_OFFSET_STATUS_NEW,
+	SNDRV_PCM_MMAP_OFFSET_CONTROL = SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW,
+#else
+	SNDRV_PCM_MMAP_OFFSET_STATUS = SNDRV_PCM_MMAP_OFFSET_STATUS_OLD,
+	SNDRV_PCM_MMAP_OFFSET_CONTROL = SNDRV_PCM_MMAP_OFFSET_CONTROL_OLD,
+#endif
 };
 
 union snd_pcm_sync_id {
@@ -480,16 +493,46 @@ struct snd_pcm_status {
 };
 #endif
 
-struct snd_pcm_mmap_status {
+/*
+ * For mmap operations, we need the 64-bit layout, both for compat mode,
+ * and for y2038 compatibility. For 64-bit applications, the two definitions
+ * are identical, so we keep the traditional version.
+ */
+#ifdef __SND_STRUCT_TIME64
+#define __snd_pcm_mmap_status64		snd_pcm_mmap_status
+#define __snd_pcm_mmap_control64	snd_pcm_mmap_control
+#define __snd_pcm_sync_ptr64		snd_pcm_sync_ptr
+#ifdef __KERNEL__
+#define __snd_timespec64		__kernel_timespec
+#else
+#define __snd_timespec64		timespec
+#endif
+struct __snd_timespec {
+	__s32 tv_sec;
+	__s32 tv_nsec;
+};
+#else
+#define __snd_pcm_mmap_status		snd_pcm_mmap_status
+#define __snd_pcm_mmap_control		snd_pcm_mmap_control
+#define __snd_pcm_sync_ptr		snd_pcm_sync_ptr
+#define __snd_timespec			timespec
+struct __snd_timespec64 {
+	__s64 tv_sec;
+	__s64 tv_nsec;
+};
+
+#endif
+
+struct __snd_pcm_mmap_status {
 	snd_pcm_state_t state;		/* RO: state - SNDRV_PCM_STATE_XXXX */
 	int pad1;			/* Needed for 64 bit alignment */
 	snd_pcm_uframes_t hw_ptr;	/* RO: hw ptr (0...boundary-1) */
-	struct timespec tstamp;		/* Timestamp */
+	struct __snd_timespec tstamp;	/* Timestamp */
 	snd_pcm_state_t suspended_state; /* RO: suspended stream state */
-	struct timespec audio_tstamp;	/* from sample counter or wall clock */
+	struct __snd_timespec audio_tstamp; /* from sample counter or wall clock */
 };
 
-struct snd_pcm_mmap_control {
+struct __snd_pcm_mmap_control {
 	snd_pcm_uframes_t appl_ptr;	/* RW: appl ptr (0...boundary-1) */
 	snd_pcm_uframes_t avail_min;	/* RW: min available frames for wakeup */
 };
@@ -498,14 +541,59 @@ struct snd_pcm_mmap_control {
 #define SNDRV_PCM_SYNC_PTR_APPL		(1<<1)	/* get appl_ptr from driver (r/w op) */
 #define SNDRV_PCM_SYNC_PTR_AVAIL_MIN	(1<<2)	/* get avail_min from driver */
 
-struct snd_pcm_sync_ptr {
+struct __snd_pcm_sync_ptr {
 	unsigned int flags;
 	union {
-		struct snd_pcm_mmap_status status;
+		struct __snd_pcm_mmap_status status;
+		unsigned char reserved[64];
+	} s;
+	union {
+		struct __snd_pcm_mmap_control control;
+		unsigned char reserved[64];
+	} c;
+};
+
+#if defined(__BYTE_ORDER) ? __BYTE_ORDER == __BIG_ENDIAN : defined(__BIG_ENDIAN)
+typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
+typedef char __pad_after_uframe[0];
+#endif
+
+#if defined(__BYTE_ORDER) ? __BYTE_ORDER == __LITTLE_ENDIAN : defined(__LITTLE_ENDIAN)
+typedef char __pad_before_uframe[0];
+typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_uframes_t)];
+#endif
+
+struct __snd_pcm_mmap_status64 {
+	__s32 state;			/* RO: state - SNDRV_PCM_STATE_XXXX */
+	__u32 pad1;			/* Needed for 64 bit alignment */
+	__pad_before_uframe __pad1;
+	snd_pcm_uframes_t hw_ptr;	/* RO: hw ptr (0...boundary-1) */
+	__pad_after_uframe __pad2;
+	struct __snd_timespec64 tstamp;	/* Timestamp */
+	__s32 suspended_state;		/* RO: suspended stream state */
+	__u32 pad3;			/* Needed for 64 bit alignment */
+	struct __snd_timespec64 audio_tstamp; /* sample counter or wall clock */
+};
+
+struct __snd_pcm_mmap_control64 {
+	__pad_before_uframe __pad1;
+	snd_pcm_uframes_t appl_ptr;	 /* RW: appl ptr (0...boundary-1) */
+	__pad_before_uframe __pad2;
+
+	__pad_before_uframe __pad3;
+	snd_pcm_uframes_t  avail_min;	 /* RW: min available frames for wakeup */
+	__pad_after_uframe __pad4;
+};
+
+struct __snd_pcm_sync_ptr64 {
+	__u32 flags;
+	__u32 pad1;
+	union {
+		struct __snd_pcm_mmap_status64 status;
 		unsigned char reserved[64];
 	} s;
 	union {
-		struct snd_pcm_mmap_control control;
+		struct __snd_pcm_mmap_control64 control;
 		unsigned char reserved[64];
 	} c;
 };
@@ -590,6 +678,8 @@ enum {
 #define SNDRV_PCM_IOCTL_STATUS		_IOR('A', 0x20, struct snd_pcm_status)
 #define SNDRV_PCM_IOCTL_DELAY		_IOR('A', 0x21, snd_pcm_sframes_t)
 #define SNDRV_PCM_IOCTL_HWSYNC		_IO('A', 0x22)
+#define __SNDRV_PCM_IOCTL_SYNC_PTR	_IOWR('A', 0x23, struct __snd_pcm_sync_ptr)
+#define __SNDRV_PCM_IOCTL_SYNC_PTR64	_IOWR('A', 0x23, struct __snd_pcm_sync_ptr64)
 #define SNDRV_PCM_IOCTL_SYNC_PTR	_IOWR('A', 0x23, struct snd_pcm_sync_ptr)
 #define SNDRV_PCM_IOCTL_STATUS_EXT	_IOWR('A', 0x24, struct snd_pcm_status)
 #define SNDRV_PCM_IOCTL_CHANNEL_INFO	_IOR('A', 0x32, struct snd_pcm_channel_info)
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 6a2e5ea145e6..967c689fb8da 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -178,8 +178,6 @@ struct compat_snd_pcm_status64 {
 	unsigned char reserved[52-4*sizeof(s64)];
 } __packed;
 
-#define put_timespec(src, dst) copy_to_user(dst, src, sizeof(*dst))
-
 static int snd_pcm_status_user_compat64(struct snd_pcm_substream *substream,
 					struct compat_snd_pcm_status64 __user *src,
 					bool ext)
@@ -382,10 +380,12 @@ struct snd_pcm_mmap_status_x32 {
 	s32 pad1;
 	u32 hw_ptr;
 	u32 pad2; /* alignment */
-	struct timespec tstamp;
+	s64 tstamp_sec;
+	s64 tstamp_nsec;
 	s32 suspended_state;
 	s32 pad3;
-	struct timespec audio_tstamp;
+	s64 audio_tstamp_sec;
+	s64 audio_tstamp_nsec;
 } __packed;
 
 struct snd_pcm_mmap_control_x32 {
@@ -453,9 +453,11 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	snd_pcm_stream_unlock_irq(substream);
 	if (put_user(sstatus.state, &src->s.status.state) ||
 	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    put_timespec(&sstatus.tstamp, &src->s.status.tstamp) ||
+	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
+	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
 	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    put_timespec(&sstatus.audio_tstamp, &src->s.status.audio_tstamp) ||
+	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
+	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
 	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
 	    put_user(scontrol.avail_min, &src->c.control.avail_min))
 		return -EFAULT;
@@ -480,7 +482,6 @@ enum {
 	SNDRV_PCM_IOCTL_READI_FRAMES32 = _IOR('A', 0x51, struct snd_xferi32),
 	SNDRV_PCM_IOCTL_WRITEN_FRAMES32 = _IOW('A', 0x52, struct snd_xfern32),
 	SNDRV_PCM_IOCTL_READN_FRAMES32 = _IOR('A', 0x53, struct snd_xfern32),
-	SNDRV_PCM_IOCTL_SYNC_PTR32 = _IOWR('A', 0x23, struct snd_pcm_sync_ptr32),
 	SNDRV_PCM_IOCTL_STATUS_COMPAT64 = _IOR('A', 0x20, struct compat_snd_pcm_status64),
 	SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT64 = _IOWR('A', 0x24, struct compat_snd_pcm_status64),
 #ifdef CONFIG_X86_X32
@@ -504,8 +505,8 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 
 	/*
 	 * When PCM is used on 32bit mode, we need to disable
-	 * mmap of PCM status/control records because of the size
-	 * incompatibility.
+	 * mmap of the old PCM status/control records because
+	 * of the size incompatibility.
 	 */
 	pcm_file->no_compat_mmap = 1;
 
@@ -527,6 +528,13 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 	case SNDRV_PCM_IOCTL_XRUN:
 	case SNDRV_PCM_IOCTL_LINK:
 	case SNDRV_PCM_IOCTL_UNLINK:
+	case __SNDRV_PCM_IOCTL_SYNC_PTR32:
+		return snd_pcm_common_ioctl(file, substream, cmd, argp);
+	case __SNDRV_PCM_IOCTL_SYNC_PTR64:
+#ifdef CONFIG_X86_X32
+		if (in_x32_syscall())
+			return snd_pcm_ioctl_sync_ptr_x32(substream, argp);
+#endif /* CONFIG_X86_X32 */
 		return snd_pcm_common_ioctl(file, substream, cmd, argp);
 	case SNDRV_PCM_IOCTL_HW_REFINE32:
 		return snd_pcm_ioctl_hw_params_compat(substream, 1, argp);
@@ -538,8 +546,6 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 		return snd_pcm_status_user32(substream, argp, false);
 	case SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT32:
 		return snd_pcm_status_user32(substream, argp, true);
-	case SNDRV_PCM_IOCTL_SYNC_PTR32:
-		return snd_pcm_ioctl_sync_ptr_compat(substream, argp);
 	case SNDRV_PCM_IOCTL_CHANNEL_INFO32:
 		return snd_pcm_ioctl_channel_info_compat(substream, argp);
 	case SNDRV_PCM_IOCTL_WRITEI_FRAMES32:
@@ -561,8 +567,6 @@ static long snd_pcm_ioctl_compat(struct file *file, unsigned int cmd, unsigned l
 	case SNDRV_PCM_IOCTL_STATUS_EXT_COMPAT64:
 		return snd_pcm_status_user_compat64(substream, argp, true);
 #ifdef CONFIG_X86_X32
-	case SNDRV_PCM_IOCTL_SYNC_PTR_X32:
-		return snd_pcm_ioctl_sync_ptr_x32(substream, argp);
 	case SNDRV_PCM_IOCTL_CHANNEL_INFO_X32:
 		return snd_pcm_ioctl_channel_info_x32(substream, argp);
 #endif /* CONFIG_X86_X32 */
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index ea5518d44e66..0271802bfba9 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -148,7 +148,8 @@ void __snd_pcm_xrun(struct snd_pcm_substream *substream)
 		struct timespec64 tstamp;
 
 		snd_pcm_gettime(runtime, &tstamp);
-		runtime->status->tstamp = timespec64_to_timespec(tstamp);
+		runtime->status->tstamp.tv_sec = tstamp.tv_sec;
+		runtime->status->tstamp.tv_nsec = tstamp.tv_nsec;
 	}
 	snd_pcm_stop(substream, SNDRV_PCM_STATE_XRUN);
 	if (xrun_debug(substream, XRUN_DEBUG_BASIC)) {
@@ -238,9 +239,10 @@ static void update_audio_tstamp(struct snd_pcm_substream *substream,
 
 	if (runtime->status->audio_tstamp.tv_sec != audio_tstamp->tv_sec ||
 	    runtime->status->audio_tstamp.tv_nsec != audio_tstamp->tv_nsec) {
-		runtime->status->audio_tstamp =
-			timespec64_to_timespec(*audio_tstamp);
-		runtime->status->tstamp = timespec64_to_timespec(*curr_tstamp);
+		runtime->status->audio_tstamp.tv_sec = audio_tstamp->tv_sec;
+		runtime->status->audio_tstamp.tv_nsec = audio_tstamp->tv_nsec;
+		runtime->status->tstamp.tv_sec = curr_tstamp->tv_sec;
+		runtime->status->tstamp.tv_nsec = curr_tstamp->tv_nsec;
 	}
 
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ba0636a2b437..5a1245509eac 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2889,14 +2889,15 @@ static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-#ifdef CONFIG_COMPAT
 struct snd_pcm_mmap_status32 {
 	s32 state;
 	s32 pad1;
 	u32 hw_ptr;
-	struct compat_timespec tstamp;
+	s32 tstamp_sec;
+	s32 tstamp_nsec;
 	s32 suspended_state;
-	struct compat_timespec audio_tstamp;
+	s32 audio_tstamp_sec;
+	s32 audio_tstamp_nsec;
 } __attribute__((packed));
 
 struct snd_pcm_mmap_control32 {
@@ -2976,17 +2977,18 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	snd_pcm_stream_unlock_irq(substream);
 	if (put_user(sstatus.state, &src->s.status.state) ||
 	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    compat_put_timespec(&sstatus.tstamp, &src->s.status.tstamp) ||
+	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
+	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
 	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    compat_put_timespec(&sstatus.audio_tstamp,
-				&src->s.status.audio_tstamp) ||
+	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
+	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
 	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
 	    put_user(scontrol.avail_min, &src->c.control.avail_min))
 		return -EFAULT;
 
 	return 0;
 }
-#endif
+#define __SNDRV_PCM_IOCTL_SYNC_PTR32 _IOWR('A', 0x23, struct snd_pcm_sync_ptr32)
 
 static int snd_pcm_tstamp(struct snd_pcm_substream *substream, int __user *_arg)
 {
@@ -3156,7 +3158,9 @@ static int snd_pcm_common_ioctl(struct file *file,
 			return -EFAULT;
 		return 0;
 	}
-	case SNDRV_PCM_IOCTL_SYNC_PTR:
+	case __SNDRV_PCM_IOCTL_SYNC_PTR32:
+		return snd_pcm_ioctl_sync_ptr_compat(substream, arg);
+	case __SNDRV_PCM_IOCTL_SYNC_PTR64:
 		return snd_pcm_sync_ptr(substream, arg);
 #ifdef CONFIG_SND_SUPPORT_OLD_API
 	case SNDRV_PCM_IOCTL_HW_REFINE_OLD:
@@ -3494,8 +3498,6 @@ static int snd_pcm_mmap_control(struct snd_pcm_substream *substream, struct file
 
 static bool pcm_status_mmap_allowed(struct snd_pcm_file *pcm_file)
 {
-	if (pcm_file->no_compat_mmap)
-		return false;
 	/* See pcm_control_mmap_allowed() below.
 	 * Since older alsa-lib requires both status and control mmaps to be
 	 * coupled, we have to disable the status mmap for old alsa-lib, too.
@@ -3720,11 +3722,19 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 
 	offset = area->vm_pgoff << PAGE_SHIFT;
 	switch (offset) {
-	case SNDRV_PCM_MMAP_OFFSET_STATUS:
+	case SNDRV_PCM_MMAP_OFFSET_STATUS_OLD:
+		if (pcm_file->no_compat_mmap || !IS_ENABLED(CONFIG_64BIT))
+			return -ENXIO;
+		/* fallthrough */
+	case SNDRV_PCM_MMAP_OFFSET_STATUS_NEW:
 		if (!pcm_status_mmap_allowed(pcm_file))
 			return -ENXIO;
 		return snd_pcm_mmap_status(substream, file, area);
-	case SNDRV_PCM_MMAP_OFFSET_CONTROL:
+	case SNDRV_PCM_MMAP_OFFSET_CONTROL_OLD:
+		if (pcm_file->no_compat_mmap || !IS_ENABLED(CONFIG_64BIT))
+			return -ENXIO;
+		/* fallthrough */
+	case SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW:
 		if (!pcm_control_mmap_allowed(pcm_file))
 			return -ENXIO;
 		return snd_pcm_mmap_control(substream, file, area);
@@ -3884,9 +3894,9 @@ static unsigned long snd_pcm_get_unmapped_area(struct file *file,
 	unsigned long offset = pgoff << PAGE_SHIFT;
 
 	switch (offset) {
-	case SNDRV_PCM_MMAP_OFFSET_STATUS:
+	case SNDRV_PCM_MMAP_OFFSET_STATUS_NEW:
 		return (unsigned long)runtime->status;
-	case SNDRV_PCM_MMAP_OFFSET_CONTROL:
+	case SNDRV_PCM_MMAP_OFFSET_CONTROL_NEW:
 		return (unsigned long)runtime->control;
 	default:
 		return (unsigned long)runtime->dma_area + offset;
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
