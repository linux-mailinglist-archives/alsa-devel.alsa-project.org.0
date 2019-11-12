Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F89F9408
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 16:21:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7941669;
	Tue, 12 Nov 2019 16:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7941669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573572100;
	bh=+41D9XDaCixUZnnw2+2B0UZa/KOi+BjpNd8zoxrFtuQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNKnjj93SX1NJuzVuOWAKrlZcfcFrHccx15Qndcdn0gaWpTBE3NQypt/L3qXMrnNh
	 AIJPkhG/VosV6M91eCi0NMqprMsqAcgGsBLfEfbwj5wvYXy51HuAA7aVsJqoDMF/45
	 ZRiixS6PRjflUgyF4kZ5zH6Dcgze7Zm3Bex2ySAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A61B3F8063C;
	Tue, 12 Nov 2019 16:18:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78A48F80611; Tue, 12 Nov 2019 16:18:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C629F8044C
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 16:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C629F8044C
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MxDgs-1hfkbx37SC-00xZ7R; Tue, 12 Nov 2019 16:16:57 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 12 Nov 2019 16:16:39 +0100
Message-Id: <20191112151642.680072-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191112151642.680072-1-arnd@arndb.de>
References: <20191112151642.680072-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oteOMmI0dXPrDHNc2XCfhWBTdBAsQTVsR3zs+QycZH8TUXTIfxR
 umwN0s0jIaMu6jGbAPZgimTu9AqcoxYPCDBhSFXdE/Xd7/7owaQ8yM65DCZPch15xJ6Ad4U
 /nTZBdUK44nL+r+u1Q8GDlOsnrz5B+UdGw1ct5PCU5gnptsOtYSV81pYVLMep7B/Dudvx/2
 FgNMh0DCOsYjDwBndsi5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dln6VzD+Ggo=:leyUFR3GRK8xNY7NyYzdvk
 L2ct6UfBSUnYUR28nfSqY3Wu5JdSUEz0pJnGIgPAIGiotK67rePTS3C4UUs2+TRpoh1+Bif/N
 C0eX9DM9/ZmoSuSLfbgtLDuiezKKB8r7sTEZKtsoSr12d4eRlj74+rJRwGUgoX37CQ7+nb4ui
 PSqrlR0EW/unHh/J2iX0nY1+NsWPs1ckqbK9P9SEnWF2IQYT5wexpyCXZuWDS8oEcUqSQT2AI
 Dsru1WzjdhyTepH0Vh1Ij5SC9TZ8ijwEGg1+Bms+BSJKzXpOFAvuwl9BZYU/5YHriYepVwon2
 P9dghNI5HWuzEFqmjb6XQ7kbQzi7aP4BSThPjjL5vGw4AFEyJ0+JOxzbFjZJZWoURS7Hv5+DD
 7RWcwok7JjMY9QumGTifXqPbfiEF1uVWn2DTfNXr5iAWxM0jyJEM9edu+Jcd4+kQBP+tJwwLK
 icW4ANHXerhLP3foqjKENIn9F0OZNyiXDBFhYo0nyi8XG9TSlqDF+7WwAKBrMRhIao3VK0B0X
 tHmdfl689MFpP+pDUEV0n68si28RT3AMk6WL4rqlCkWzjncQBbpfdY267JuPReF4+0yJMTP+D
 /v9SAW//LhpPG9ZIQCelr51uZ+clQFil5BKYZUTFwEF3bXyz/DMDvgXsz7BVn04ACvD5x7M40
 r+zvvRFWmpqrK1BSbGKMtanOmHXkYhQMb4zw4/hNsNA/lYyMATGh51gfjDLxMC/WzENqiMfhI
 l/e/GkmrS3L3jE4A5rErmHMucaVK6eCN0tWBXV1o3qmenkioSNgz+ZWoRXY4nzeyqXTVvj/B6
 vdGBJ65Uc1zhz/XJWpG4UYv+ozcWtzhB9glNfax84pkDaEG9bXNr/Brtb5BEnrscgCqg0Ai4I
 +qgrthNLvakP5HQTN+2Q==
Cc: Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: [alsa-devel] [PATCH v6 5/8] ALSA: Avoid using timespec for struct
	snd_rawmidi_status
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

The struct snd_rawmidi_status will use 'timespec' type variables to record
timestamp, which is not year 2038 safe on 32bits system.

Thus we introduced 'struct snd_rawmidi_status32' and 'struct snd_rawmidi_status64'
to handle 32bit time_t and 64bit time_t in native mode, which replace
timespec with s64 type.

In compat mode, we renamed or introduced new structures to handle 32bit/64bit
time_t in compatible mode. The 'struct snd_rawmidi_status32' and
snd_rawmidi_ioctl_status32() are used to handle 32bit time_t in compat mode.
'struct compat_snd_rawmidi_status64' is used to handle 64bit time_t.

When glibc changes time_t to 64-bit, any recompiled program will issue ioctl
commands that the kernel does not understand without this patch.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/sound/asound.h |   3 +
 sound/core/rawmidi.c        | 132 ++++++++++++++++++++++++++++--------
 sound/core/rawmidi_compat.c |  87 ++++++------------------
 3 files changed, 128 insertions(+), 94 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 7b74524f9406..cb830813da5d 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -651,13 +651,16 @@ struct snd_rawmidi_params {
 	unsigned char reserved[16];	/* reserved for future use */
 };
 
+#ifndef __KERNEL__
 struct snd_rawmidi_status {
 	int stream;
+	unsigned char pad1[sizeof(time_t) - sizeof(int)];
 	struct timespec tstamp;		/* Timestamp */
 	size_t avail;			/* available bytes */
 	size_t xruns;			/* count of overruns since last status (in bytes) */
 	unsigned char reserved[16];	/* reserved for future use */
 };
+#endif
 
 #define SNDRV_RAWMIDI_IOCTL_PVERSION	_IOR('W', 0x00, int)
 #define SNDRV_RAWMIDI_IOCTL_INFO	_IOR('W', 0x01, struct snd_rawmidi_info)
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 8a12a7538d63..cd9bbb546846 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -50,6 +50,29 @@ static DEFINE_MUTEX(register_mutex);
 #define rmidi_dbg(rmidi, fmt, args...) \
 	dev_dbg(&(rmidi)->dev, fmt, ##args)
 
+struct snd_rawmidi_status32 {
+	s32 stream;
+	s32 tstamp_sec;			/* Timestamp */
+	s32 tstamp_nsec;
+	u32 avail;			/* available bytes */
+	u32 xruns;			/* count of overruns since last status (in bytes) */
+	unsigned char reserved[16];	/* reserved for future use */
+};
+
+#define SNDRV_RAWMIDI_IOCTL_STATUS32	_IOWR('W', 0x20, struct snd_rawmidi_status32)
+
+struct snd_rawmidi_status64 {
+	int stream;
+	u8 rsvd[4];			/* alignment */
+	s64 tstamp_sec;			/* Timestamp */
+	s64 tstamp_nsec;
+	size_t avail;			/* available bytes */
+	size_t xruns;			/* count of overruns since last status (in bytes) */
+	unsigned char reserved[16];	/* reserved for future use */
+};
+
+#define SNDRV_RAWMIDI_IOCTL_STATUS64	_IOWR('W', 0x20, struct snd_rawmidi_status64)
+
 static struct snd_rawmidi *snd_rawmidi_search(struct snd_card *card, int device)
 {
 	struct snd_rawmidi *rawmidi;
@@ -677,7 +700,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 EXPORT_SYMBOL(snd_rawmidi_input_params);
 
 static int snd_rawmidi_output_status(struct snd_rawmidi_substream *substream,
-				     struct snd_rawmidi_status *status)
+				     struct snd_rawmidi_status64 *status)
 {
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -690,7 +713,7 @@ static int snd_rawmidi_output_status(struct snd_rawmidi_substream *substream,
 }
 
 static int snd_rawmidi_input_status(struct snd_rawmidi_substream *substream,
-				    struct snd_rawmidi_status *status)
+				    struct snd_rawmidi_status64 *status)
 {
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -704,6 +727,80 @@ static int snd_rawmidi_input_status(struct snd_rawmidi_substream *substream,
 	return 0;
 }
 
+static int snd_rawmidi_ioctl_status32(struct snd_rawmidi_file *rfile,
+				      struct snd_rawmidi_status32 __user *argp)
+{
+	int err = 0;
+	struct snd_rawmidi_status32 __user *status = argp;
+	struct snd_rawmidi_status32 status32;
+	struct snd_rawmidi_status64 status64;
+
+	if (copy_from_user(&status32, argp,
+			   sizeof(struct snd_rawmidi_status32)))
+		return -EFAULT;
+
+	switch (status32.stream) {
+	case SNDRV_RAWMIDI_STREAM_OUTPUT:
+		if (rfile->output == NULL)
+			return -EINVAL;
+		err = snd_rawmidi_output_status(rfile->output, &status64);
+		break;
+	case SNDRV_RAWMIDI_STREAM_INPUT:
+		if (rfile->input == NULL)
+			return -EINVAL;
+		err = snd_rawmidi_input_status(rfile->input, &status64);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (err < 0)
+		return err;
+
+	status32 = (struct snd_rawmidi_status32) {
+		.stream = status64.stream,
+		.tstamp_sec = status64.tstamp_sec,
+		.tstamp_nsec = status64.tstamp_nsec,
+		.avail = status64.avail,
+		.xruns = status64.xruns,
+	};
+
+	if (copy_to_user(status, &status32, sizeof(*status)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int snd_rawmidi_ioctl_status64(struct snd_rawmidi_file *rfile,
+				      struct snd_rawmidi_status64 __user *argp)
+{
+	int err = 0;
+	struct snd_rawmidi_status64 status;
+
+	if (copy_from_user(&status, argp, sizeof(struct snd_rawmidi_status64)))
+		return -EFAULT;
+
+	switch (status.stream) {
+	case SNDRV_RAWMIDI_STREAM_OUTPUT:
+		if (rfile->output == NULL)
+			return -EINVAL;
+		err = snd_rawmidi_output_status(rfile->output, &status);
+		break;
+	case SNDRV_RAWMIDI_STREAM_INPUT:
+		if (rfile->input == NULL)
+			return -EINVAL;
+		err = snd_rawmidi_input_status(rfile->input, &status);
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (err < 0)
+		return err;
+	if (copy_to_user(argp, &status,
+			 sizeof(struct snd_rawmidi_status64)))
+		return -EFAULT;
+	return 0;
+}
+
 static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct snd_rawmidi_file *rfile;
@@ -750,33 +847,10 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 			return -EINVAL;
 		}
 	}
-	case SNDRV_RAWMIDI_IOCTL_STATUS:
-	{
-		int err = 0;
-		struct snd_rawmidi_status status;
-
-		if (copy_from_user(&status, argp, sizeof(struct snd_rawmidi_status)))
-			return -EFAULT;
-		switch (status.stream) {
-		case SNDRV_RAWMIDI_STREAM_OUTPUT:
-			if (rfile->output == NULL)
-				return -EINVAL;
-			err = snd_rawmidi_output_status(rfile->output, &status);
-			break;
-		case SNDRV_RAWMIDI_STREAM_INPUT:
-			if (rfile->input == NULL)
-				return -EINVAL;
-			err = snd_rawmidi_input_status(rfile->input, &status);
-			break;
-		default:
-			return -EINVAL;
-		}
-		if (err < 0)
-			return err;
-		if (copy_to_user(argp, &status, sizeof(struct snd_rawmidi_status)))
-			return -EFAULT;
-		return 0;
-	}
+	case SNDRV_RAWMIDI_IOCTL_STATUS32:
+		return snd_rawmidi_ioctl_status32(rfile, argp);
+	case SNDRV_RAWMIDI_IOCTL_STATUS64:
+		return snd_rawmidi_ioctl_status64(rfile, argp);
 	case SNDRV_RAWMIDI_IOCTL_DROP:
 	{
 		int val;
diff --git a/sound/core/rawmidi_compat.c b/sound/core/rawmidi_compat.c
index 66eee61674b6..7397130976d0 100644
--- a/sound/core/rawmidi_compat.c
+++ b/sound/core/rawmidi_compat.c
@@ -41,19 +41,22 @@ static int snd_rawmidi_ioctl_params_compat(struct snd_rawmidi_file *rfile,
 	return -EINVAL;
 }
 
-struct snd_rawmidi_status32 {
+struct compat_snd_rawmidi_status64 {
 	s32 stream;
-	struct compat_timespec tstamp;
+	u8 rsvd[4]; /* alignment */
+	s64 tstamp_sec;
+	s64 tstamp_nsec;
 	u32 avail;
 	u32 xruns;
 	unsigned char reserved[16];
 } __attribute__((packed));
 
-static int snd_rawmidi_ioctl_status_compat(struct snd_rawmidi_file *rfile,
-					   struct snd_rawmidi_status32 __user *src)
+static int snd_rawmidi_ioctl_status_compat64(struct snd_rawmidi_file *rfile,
+					     struct compat_snd_rawmidi_status64 __user *src)
 {
 	int err;
-	struct snd_rawmidi_status status;
+	struct snd_rawmidi_status64 status;
+	struct compat_snd_rawmidi_status64 compat_status;
 
 	if (get_user(status.stream, &src->stream))
 		return -EFAULT;
@@ -75,68 +78,24 @@ static int snd_rawmidi_ioctl_status_compat(struct snd_rawmidi_file *rfile,
 	if (err < 0)
 		return err;
 
-	if (compat_put_timespec(&status.tstamp, &src->tstamp) ||
-	    put_user(status.avail, &src->avail) ||
-	    put_user(status.xruns, &src->xruns))
-		return -EFAULT;
-
-	return 0;
-}
-
-#ifdef CONFIG_X86_X32
-/* X32 ABI has 64bit timespec and 64bit alignment */
-struct snd_rawmidi_status_x32 {
-	s32 stream;
-	u32 rsvd; /* alignment */
-	struct timespec tstamp;
-	u32 avail;
-	u32 xruns;
-	unsigned char reserved[16];
-} __attribute__((packed));
-
-#define put_timespec(src, dst) copy_to_user(dst, src, sizeof(*dst))
-
-static int snd_rawmidi_ioctl_status_x32(struct snd_rawmidi_file *rfile,
-					struct snd_rawmidi_status_x32 __user *src)
-{
-	int err;
-	struct snd_rawmidi_status status;
-
-	if (get_user(status.stream, &src->stream))
-		return -EFAULT;
-
-	switch (status.stream) {
-	case SNDRV_RAWMIDI_STREAM_OUTPUT:
-		if (!rfile->output)
-			return -EINVAL;
-		err = snd_rawmidi_output_status(rfile->output, &status);
-		break;
-	case SNDRV_RAWMIDI_STREAM_INPUT:
-		if (!rfile->input)
-			return -EINVAL;
-		err = snd_rawmidi_input_status(rfile->input, &status);
-		break;
-	default:
-		return -EINVAL;
-	}
-	if (err < 0)
-		return err;
+	compat_status = (struct compat_snd_rawmidi_status64) {
+		.stream = status.stream,
+		.tstamp_sec = status.tstamp_sec,
+		.tstamp_nsec = status.tstamp_nsec,
+		.avail = status.avail,
+		.xruns = status.xruns,
+	};
 
-	if (put_timespec(&status.tstamp, &src->tstamp) ||
-	    put_user(status.avail, &src->avail) ||
-	    put_user(status.xruns, &src->xruns))
+	if (copy_to_user(src, &compat_status, sizeof(*src)))
 		return -EFAULT;
 
 	return 0;
 }
-#endif /* CONFIG_X86_X32 */
 
 enum {
 	SNDRV_RAWMIDI_IOCTL_PARAMS32 = _IOWR('W', 0x10, struct snd_rawmidi_params32),
-	SNDRV_RAWMIDI_IOCTL_STATUS32 = _IOWR('W', 0x20, struct snd_rawmidi_status32),
-#ifdef CONFIG_X86_X32
-	SNDRV_RAWMIDI_IOCTL_STATUS_X32 = _IOWR('W', 0x20, struct snd_rawmidi_status_x32),
-#endif /* CONFIG_X86_X32 */
+	SNDRV_RAWMIDI_IOCTL_STATUS_COMPAT32 = _IOWR('W', 0x20, struct snd_rawmidi_status32),
+	SNDRV_RAWMIDI_IOCTL_STATUS_COMPAT64 = _IOWR('W', 0x20, struct compat_snd_rawmidi_status64),
 };
 
 static long snd_rawmidi_ioctl_compat(struct file *file, unsigned int cmd, unsigned long arg)
@@ -153,12 +112,10 @@ static long snd_rawmidi_ioctl_compat(struct file *file, unsigned int cmd, unsign
 		return snd_rawmidi_ioctl(file, cmd, (unsigned long)argp);
 	case SNDRV_RAWMIDI_IOCTL_PARAMS32:
 		return snd_rawmidi_ioctl_params_compat(rfile, argp);
-	case SNDRV_RAWMIDI_IOCTL_STATUS32:
-		return snd_rawmidi_ioctl_status_compat(rfile, argp);
-#ifdef CONFIG_X86_X32
-	case SNDRV_RAWMIDI_IOCTL_STATUS_X32:
-		return snd_rawmidi_ioctl_status_x32(rfile, argp);
-#endif /* CONFIG_X86_X32 */
+	case SNDRV_RAWMIDI_IOCTL_STATUS_COMPAT32:
+		return snd_rawmidi_ioctl_status32(rfile, argp);
+	case SNDRV_RAWMIDI_IOCTL_STATUS_COMPAT64:
+		return snd_rawmidi_ioctl_status_compat64(rfile, argp);
 	}
 	return -ENOIOCTLCMD;
 }
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
