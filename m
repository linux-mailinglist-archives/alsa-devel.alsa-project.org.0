Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4542F320AD2
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 15:01:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D851675;
	Sun, 21 Feb 2021 15:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D851675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613916073;
	bh=0qRBkmsDfGwEB1FXgxgef+KXvTlVxeAEAkbXLb7P458=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T9JPosQE0cpWQwlmbB9bbcwRRS3YqqfofZH9kXT4MZECG1ULSmJ6HIOq16nLYA9LY
	 UbezRyk+obgC7eIy4j/JHiuQsg7so9FuyUngkdDEnh1WJI2oYJCg5m17+X8TvahEiv
	 upvh9Coj4SwOQIwiqV0Qfz6drAoMxFcA0GDMqVRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2575BF8032B;
	Sun, 21 Feb 2021 14:58:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62DBBF8016D; Sun, 21 Feb 2021 14:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20011F8016A
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 14:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20011F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="Nt1M9kcS"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id B5B7EA1209;
 Sun, 21 Feb 2021 14:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=hqHHliEpReKl
 N7o2DF8LymPFcLT/sPb6jvPDYtJvWFg=; b=Nt1M9kcSFe0Ffhl6akNtzluF9jEI
 yKANOkFWInvr+83KCnkYjDpqEQhwhE6C0qwnKRTZLQOP8KFPokvkA4Ygq0IROjMY
 a5HC+HugoXubYXKBqrF/G4NY1OtYIAavRxpINnWQoD/J18MONFsl6uLq/ywg38Xm
 BVLfBeEUvaOmEayMPJVy44gR6Bt1Dz9bhyqqvZhpRsWy2HU95FIji/klTRn+POX9
 HUYderYNpB/Grsl+f3oj9QRCeg8jULG9oAbQFd1+63K9sAJubn4STtYa0xRToUR+
 lRMB+F2WlRVpjtHewcz9bK27Gu4ZxHW3QLpKjZfk0M57ZShEK61/aZADYw==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v4 4/9] ALSA: virtio: build PCM devices and substream hardware
 descriptors
Date: Sun, 21 Feb 2021 14:57:26 +0100
Message-ID: <20210221135731.51348-5-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210221135731.51348-1-anton.yakovlev@opensynergy.com>
References: <20210221135731.51348-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Like the HDA specification, the virtio sound device specification links
PCM substreams, jacks and PCM channel maps into functional groups. For
each discovered group, a PCM device is created, the number of which
coincides with the group number.

Introduce the module parameters for setting the hardware buffer
parameters:
  pcm_buffer_ms [=160]
  pcm_periods_min [=2]
  pcm_periods_max [=16]
  pcm_period_ms_min [=10]
  pcm_period_ms_max [=80]

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile      |   3 +-
 sound/virtio/virtio_card.c |  14 ++
 sound/virtio/virtio_card.h |  10 +
 sound/virtio/virtio_pcm.c  | 464 +++++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h  |  71 ++++++
 5 files changed, 561 insertions(+), 1 deletion(-)
 create mode 100644 sound/virtio/virtio_pcm.c
 create mode 100644 sound/virtio/virtio_pcm.h

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index dc551e637441..69162a545a41 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 
 virtio_snd-objs := \
 	virtio_card.o \
-	virtio_ctl_msg.o
+	virtio_ctl_msg.o \
+	virtio_pcm.o
 
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index c62b3a2da148..235afc25fce7 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -200,6 +200,16 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 			 VIRTIO_SND_CARD_NAME " at %s/%s",
 			 dev_name(dev->parent), dev_name(dev));
 
+	rc = virtsnd_pcm_parse_cfg(snd);
+	if (rc)
+		return rc;
+
+	if (snd->nsubstreams) {
+		rc = virtsnd_pcm_build_devs(snd);
+		if (rc)
+			return rc;
+	}
+
 	return snd_card_register(snd->card);
 }
 
@@ -228,6 +238,9 @@ static int virtsnd_validate(struct virtio_device *vdev)
 		return -EINVAL;
 	}
 
+	if (virtsnd_pcm_validate(vdev))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -251,6 +264,7 @@ static int virtsnd_probe(struct virtio_device *vdev)
 	snd->vdev = vdev;
 	INIT_WORK(&snd->reset_work, virtsnd_reset_fn);
 	INIT_LIST_HEAD(&snd->ctl_msgs);
+	INIT_LIST_HEAD(&snd->pcm_list);
 
 	vdev->priv = snd;
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index c51a71a79388..687d3ed6d1c3 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -12,9 +12,13 @@
 #include <uapi/linux/virtio_snd.h>
 
 #include "virtio_ctl_msg.h"
+#include "virtio_pcm.h"
 
 #define VIRTIO_SND_CARD_DRIVER	"virtio-snd"
 #define VIRTIO_SND_CARD_NAME	"VirtIO SoundCard"
+#define VIRTIO_SND_PCM_NAME	"VirtIO PCM"
+
+struct virtio_pcm_substream;
 
 /**
  * struct virtio_snd_queue - Virtqueue wrapper structure.
@@ -34,6 +38,9 @@ struct virtio_snd_queue {
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
  * @event_msgs: Device events.
+ * @pcm_list: VirtIO PCM device list.
+ * @substreams: VirtIO PCM substreams.
+ * @nsubstreams: Number of PCM substreams.
  */
 struct virtio_snd {
 	struct virtio_device *vdev;
@@ -42,6 +49,9 @@ struct virtio_snd {
 	struct snd_card *card;
 	struct list_head ctl_msgs;
 	struct virtio_snd_event *event_msgs;
+	struct list_head pcm_list;
+	struct virtio_pcm_substream *substreams;
+	unsigned int nsubstreams;
 };
 
 /* Message completion timeout in milliseconds (module parameter). */
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
new file mode 100644
index 000000000000..9c2cf9eaa0c7
--- /dev/null
+++ b/sound/virtio/virtio_pcm.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <linux/moduleparam.h>
+#include <linux/virtio_config.h>
+
+#include "virtio_card.h"
+
+static unsigned int pcm_buffer_ms = 160;
+module_param(pcm_buffer_ms, uint, 0644);
+MODULE_PARM_DESC(pcm_buffer_ms, "PCM substream buffer time in milliseconds");
+
+static unsigned int pcm_periods_min = 2;
+module_param(pcm_periods_min, uint, 0644);
+MODULE_PARM_DESC(pcm_periods_min, "Minimum number of PCM periods");
+
+static unsigned int pcm_periods_max = 16;
+module_param(pcm_periods_max, uint, 0644);
+MODULE_PARM_DESC(pcm_periods_max, "Maximum number of PCM periods");
+
+static unsigned int pcm_period_ms_min = 10;
+module_param(pcm_period_ms_min, uint, 0644);
+MODULE_PARM_DESC(pcm_period_ms_min, "Minimum PCM period time in milliseconds");
+
+static unsigned int pcm_period_ms_max = 80;
+module_param(pcm_period_ms_max, uint, 0644);
+MODULE_PARM_DESC(pcm_period_ms_max, "Maximum PCM period time in milliseconds");
+
+/* Map for converting VirtIO format to ALSA format. */
+static const snd_pcm_format_t g_v2a_format_map[] = {
+	[VIRTIO_SND_PCM_FMT_IMA_ADPCM] = SNDRV_PCM_FORMAT_IMA_ADPCM,
+	[VIRTIO_SND_PCM_FMT_MU_LAW] = SNDRV_PCM_FORMAT_MU_LAW,
+	[VIRTIO_SND_PCM_FMT_A_LAW] = SNDRV_PCM_FORMAT_A_LAW,
+	[VIRTIO_SND_PCM_FMT_S8] = SNDRV_PCM_FORMAT_S8,
+	[VIRTIO_SND_PCM_FMT_U8] = SNDRV_PCM_FORMAT_U8,
+	[VIRTIO_SND_PCM_FMT_S16] = SNDRV_PCM_FORMAT_S16_LE,
+	[VIRTIO_SND_PCM_FMT_U16] = SNDRV_PCM_FORMAT_U16_LE,
+	[VIRTIO_SND_PCM_FMT_S18_3] = SNDRV_PCM_FORMAT_S18_3LE,
+	[VIRTIO_SND_PCM_FMT_U18_3] = SNDRV_PCM_FORMAT_U18_3LE,
+	[VIRTIO_SND_PCM_FMT_S20_3] = SNDRV_PCM_FORMAT_S20_3LE,
+	[VIRTIO_SND_PCM_FMT_U20_3] = SNDRV_PCM_FORMAT_U20_3LE,
+	[VIRTIO_SND_PCM_FMT_S24_3] = SNDRV_PCM_FORMAT_S24_3LE,
+	[VIRTIO_SND_PCM_FMT_U24_3] = SNDRV_PCM_FORMAT_U24_3LE,
+	[VIRTIO_SND_PCM_FMT_S20] = SNDRV_PCM_FORMAT_S20_LE,
+	[VIRTIO_SND_PCM_FMT_U20] = SNDRV_PCM_FORMAT_U20_LE,
+	[VIRTIO_SND_PCM_FMT_S24] = SNDRV_PCM_FORMAT_S24_LE,
+	[VIRTIO_SND_PCM_FMT_U24] = SNDRV_PCM_FORMAT_U24_LE,
+	[VIRTIO_SND_PCM_FMT_S32] = SNDRV_PCM_FORMAT_S32_LE,
+	[VIRTIO_SND_PCM_FMT_U32] = SNDRV_PCM_FORMAT_U32_LE,
+	[VIRTIO_SND_PCM_FMT_FLOAT] = SNDRV_PCM_FORMAT_FLOAT_LE,
+	[VIRTIO_SND_PCM_FMT_FLOAT64] = SNDRV_PCM_FORMAT_FLOAT64_LE,
+	[VIRTIO_SND_PCM_FMT_DSD_U8] = SNDRV_PCM_FORMAT_DSD_U8,
+	[VIRTIO_SND_PCM_FMT_DSD_U16] = SNDRV_PCM_FORMAT_DSD_U16_LE,
+	[VIRTIO_SND_PCM_FMT_DSD_U32] = SNDRV_PCM_FORMAT_DSD_U32_LE,
+	[VIRTIO_SND_PCM_FMT_IEC958_SUBFRAME] =
+		SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE
+};
+
+/* Map for converting VirtIO frame rate to ALSA frame rate. */
+struct virtsnd_v2a_rate {
+	unsigned int alsa_bit;
+	unsigned int rate;
+};
+
+static const struct virtsnd_v2a_rate g_v2a_rate_map[] = {
+	[VIRTIO_SND_PCM_RATE_5512] = { SNDRV_PCM_RATE_5512, 5512 },
+	[VIRTIO_SND_PCM_RATE_8000] = { SNDRV_PCM_RATE_8000, 8000 },
+	[VIRTIO_SND_PCM_RATE_11025] = { SNDRV_PCM_RATE_11025, 11025 },
+	[VIRTIO_SND_PCM_RATE_16000] = { SNDRV_PCM_RATE_16000, 16000 },
+	[VIRTIO_SND_PCM_RATE_22050] = { SNDRV_PCM_RATE_22050, 22050 },
+	[VIRTIO_SND_PCM_RATE_32000] = { SNDRV_PCM_RATE_32000, 32000 },
+	[VIRTIO_SND_PCM_RATE_44100] = { SNDRV_PCM_RATE_44100, 44100 },
+	[VIRTIO_SND_PCM_RATE_48000] = { SNDRV_PCM_RATE_48000, 48000 },
+	[VIRTIO_SND_PCM_RATE_64000] = { SNDRV_PCM_RATE_64000, 64000 },
+	[VIRTIO_SND_PCM_RATE_88200] = { SNDRV_PCM_RATE_88200, 88200 },
+	[VIRTIO_SND_PCM_RATE_96000] = { SNDRV_PCM_RATE_96000, 96000 },
+	[VIRTIO_SND_PCM_RATE_176400] = { SNDRV_PCM_RATE_176400, 176400 },
+	[VIRTIO_SND_PCM_RATE_192000] = { SNDRV_PCM_RATE_192000, 192000 }
+};
+
+/**
+ * virtsnd_pcm_build_hw() - Parse substream config and build HW descriptor.
+ * @vss: VirtIO substream.
+ * @info: VirtIO substream information entry.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -EINVAL if configuration is invalid.
+ */
+static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
+				struct virtio_snd_pcm_info *info)
+{
+	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int i;
+	u64 values;
+	size_t sample_max = 0;
+	size_t sample_min = 0;
+
+	vss->features = le32_to_cpu(info->features);
+
+	/*
+	 * TODO: set SNDRV_PCM_INFO_{BATCH,BLOCK_TRANSFER} if device supports
+	 * only message-based transport.
+	 */
+	vss->hw.info =
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_PAUSE;
+
+	if (!info->channels_min || info->channels_min > info->channels_max) {
+		dev_err(&vdev->dev,
+			"SID %u: invalid channel range [%u %u]\n",
+			vss->sid, info->channels_min, info->channels_max);
+		return -EINVAL;
+	}
+
+	vss->hw.channels_min = info->channels_min;
+	vss->hw.channels_max = info->channels_max;
+
+	values = le64_to_cpu(info->formats);
+
+	vss->hw.formats = 0;
+
+	for (i = 0; i < ARRAY_SIZE(g_v2a_format_map); ++i)
+		if (values & (1ULL << i)) {
+			snd_pcm_format_t alsa_fmt = g_v2a_format_map[i];
+			int bytes = snd_pcm_format_physical_width(alsa_fmt) / 8;
+
+			if (!sample_min || sample_min > bytes)
+				sample_min = bytes;
+
+			if (sample_max < bytes)
+				sample_max = bytes;
+
+			vss->hw.formats |= (1ULL << alsa_fmt);
+		}
+
+	if (!vss->hw.formats) {
+		dev_err(&vdev->dev,
+			"SID %u: no supported PCM sample formats found\n",
+			vss->sid);
+		return -EINVAL;
+	}
+
+	values = le64_to_cpu(info->rates);
+
+	vss->hw.rates = 0;
+
+	for (i = 0; i < ARRAY_SIZE(g_v2a_rate_map); ++i)
+		if (values & (1ULL << i)) {
+			if (!vss->hw.rate_min ||
+			    vss->hw.rate_min > g_v2a_rate_map[i].rate)
+				vss->hw.rate_min = g_v2a_rate_map[i].rate;
+
+			if (vss->hw.rate_max < g_v2a_rate_map[i].rate)
+				vss->hw.rate_max = g_v2a_rate_map[i].rate;
+
+			vss->hw.rates |= g_v2a_rate_map[i].alsa_bit;
+		}
+
+	if (!vss->hw.rates) {
+		dev_err(&vdev->dev,
+			"SID %u: no supported PCM frame rates found\n",
+			vss->sid);
+		return -EINVAL;
+	}
+
+	vss->hw.periods_min = pcm_periods_min;
+	vss->hw.periods_max = pcm_periods_max;
+
+	/*
+	 * We must ensure that there is enough space in the buffer to store
+	 * pcm_buffer_ms ms for the combination (Cmax, Smax, Rmax), where:
+	 *   Cmax = maximum supported number of channels,
+	 *   Smax = maximum supported sample size in bytes,
+	 *   Rmax = maximum supported frame rate.
+	 */
+	vss->hw.buffer_bytes_max =
+		sample_max * vss->hw.channels_max * pcm_buffer_ms *
+		(vss->hw.rate_max / MSEC_PER_SEC);
+
+	/* Align the buffer size to the page size */
+	vss->hw.buffer_bytes_max =
+		(vss->hw.buffer_bytes_max + PAGE_SIZE - 1) & -PAGE_SIZE;
+
+	/*
+	 * We must ensure that the minimum period size is enough to store
+	 * pcm_period_ms_min ms for the combination (Cmin, Smin, Rmin), where:
+	 *   Cmin = minimum supported number of channels,
+	 *   Smin = minimum supported sample size in bytes,
+	 *   Rmin = minimum supported frame rate.
+	 */
+	vss->hw.period_bytes_min =
+		sample_min * vss->hw.channels_min * pcm_period_ms_min *
+		(vss->hw.rate_min / MSEC_PER_SEC);
+
+	/*
+	 * We must ensure that the maximum period size is enough to store
+	 * pcm_period_ms_max ms for the combination (Cmax, Smax, Rmax).
+	 */
+	vss->hw.period_bytes_max =
+		sample_max * vss->hw.channels_max * pcm_period_ms_max *
+		(vss->hw.rate_max / MSEC_PER_SEC);
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_find() - Find the PCM device for the specified node ID.
+ * @snd: VirtIO sound device.
+ * @nid: Function node ID.
+ *
+ * Context: Any context.
+ * Return: a pointer to the PCM device or ERR_PTR(-ENOENT).
+ */
+struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid)
+{
+	struct virtio_pcm *vpcm;
+
+	list_for_each_entry(vpcm, &snd->pcm_list, list)
+		if (vpcm->nid == nid)
+			return vpcm;
+
+	return ERR_PTR(-ENOENT);
+}
+
+/**
+ * virtsnd_pcm_find_or_create() - Find or create the PCM device for the
+ *                                specified node ID.
+ * @snd: VirtIO sound device.
+ * @nid: Function node ID.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: a pointer to the PCM device or ERR_PTR(-errno).
+ */
+struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
+					      unsigned int nid)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_pcm *vpcm;
+
+	vpcm = virtsnd_pcm_find(snd, nid);
+	if (!IS_ERR(vpcm))
+		return vpcm;
+
+	vpcm = devm_kzalloc(&vdev->dev, sizeof(*vpcm), GFP_KERNEL);
+	if (!vpcm)
+		return ERR_PTR(-ENOMEM);
+
+	vpcm->nid = nid;
+	list_add_tail(&vpcm->list, &snd->pcm_list);
+
+	return vpcm;
+}
+
+/**
+ * virtsnd_pcm_validate() - Validate if the device can be started.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -EINVAL on failure.
+ */
+int virtsnd_pcm_validate(struct virtio_device *vdev)
+{
+	if (pcm_periods_min < 2 || pcm_periods_min > pcm_periods_max) {
+		dev_err(&vdev->dev,
+			"invalid range [%u %u] of the number of PCM periods\n",
+			pcm_periods_min, pcm_periods_max);
+		return -EINVAL;
+	}
+
+	if (!pcm_period_ms_min || pcm_period_ms_min > pcm_period_ms_max) {
+		dev_err(&vdev->dev,
+			"invalid range [%u %u] of the size of the PCM period\n",
+			pcm_period_ms_min, pcm_period_ms_max);
+		return -EINVAL;
+	}
+
+	if (pcm_buffer_ms < pcm_periods_min * pcm_period_ms_min) {
+		dev_err(&vdev->dev,
+			"pcm_buffer_ms(=%u) value cannot be < %u ms\n",
+			pcm_buffer_ms, pcm_periods_min * pcm_period_ms_min);
+		return -EINVAL;
+	}
+
+	if (pcm_period_ms_max > pcm_buffer_ms / 2) {
+		dev_err(&vdev->dev,
+			"pcm_period_ms_max(=%u) value cannot be > %u ms\n",
+			pcm_period_ms_max, pcm_buffer_ms / 2);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_parse_cfg() - Parse the stream configuration.
+ * @snd: VirtIO sound device.
+ *
+ * This function is called during initial device initialization.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_snd_pcm_info *info;
+	unsigned int i;
+	int rc;
+
+	virtio_cread(vdev, struct virtio_snd_config, streams,
+		     &snd->nsubstreams);
+	if (!snd->nsubstreams)
+		return 0;
+
+	snd->substreams = devm_kcalloc(&vdev->dev, snd->nsubstreams,
+				       sizeof(*snd->substreams), GFP_KERNEL);
+	if (!snd->substreams)
+		return -ENOMEM;
+
+	info = kcalloc(snd->nsubstreams, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_PCM_INFO, 0,
+				    snd->nsubstreams, sizeof(*info), info);
+	if (rc)
+		goto on_exit;
+
+	for (i = 0; i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *vss = &snd->substreams[i];
+		struct virtio_pcm *vpcm;
+
+		vss->snd = snd;
+		vss->sid = i;
+
+		rc = virtsnd_pcm_build_hw(vss, &info[i]);
+		if (rc)
+			goto on_exit;
+
+		vss->nid = le32_to_cpu(info[i].hdr.hda_fn_nid);
+
+		vpcm = virtsnd_pcm_find_or_create(snd, vss->nid);
+		if (IS_ERR(vpcm)) {
+			rc = PTR_ERR(vpcm);
+			goto on_exit;
+		}
+
+		switch (info[i].direction) {
+		case VIRTIO_SND_D_OUTPUT:
+			vss->direction = SNDRV_PCM_STREAM_PLAYBACK;
+			break;
+		case VIRTIO_SND_D_INPUT:
+			vss->direction = SNDRV_PCM_STREAM_CAPTURE;
+			break;
+		default:
+			dev_err(&vdev->dev, "SID %u: unknown direction (%u)\n",
+				vss->sid, info[i].direction);
+			rc = -EINVAL;
+			goto on_exit;
+		}
+
+		vpcm->streams[vss->direction].nsubstreams++;
+	}
+
+on_exit:
+	kfree(info);
+
+	return rc;
+}
+
+/**
+ * virtsnd_pcm_build_devs() - Build ALSA PCM devices.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_pcm_build_devs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_pcm *vpcm;
+	unsigned int i;
+	int rc;
+
+	list_for_each_entry(vpcm, &snd->pcm_list, list) {
+		unsigned int npbs =
+			vpcm->streams[SNDRV_PCM_STREAM_PLAYBACK].nsubstreams;
+		unsigned int ncps =
+			vpcm->streams[SNDRV_PCM_STREAM_CAPTURE].nsubstreams;
+
+		if (!npbs && !ncps)
+			continue;
+
+		rc = snd_pcm_new(snd->card, VIRTIO_SND_CARD_DRIVER, vpcm->nid,
+				 npbs, ncps, &vpcm->pcm);
+		if (rc) {
+			dev_err(&vdev->dev, "snd_pcm_new[%u] failed: %d\n",
+				vpcm->nid, rc);
+			return rc;
+		}
+
+		vpcm->pcm->info_flags = 0;
+		vpcm->pcm->dev_class = SNDRV_PCM_CLASS_GENERIC;
+		vpcm->pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
+		snprintf(vpcm->pcm->name, sizeof(vpcm->pcm->name),
+			 VIRTIO_SND_PCM_NAME " %u", vpcm->pcm->device);
+		vpcm->pcm->private_data = vpcm;
+		vpcm->pcm->nonatomic = true;
+
+		for (i = 0; i < ARRAY_SIZE(vpcm->streams); ++i) {
+			struct virtio_pcm_stream *stream = &vpcm->streams[i];
+
+			if (!stream->nsubstreams)
+				continue;
+
+			stream->substreams =
+				devm_kcalloc(&vdev->dev, stream->nsubstreams,
+					     sizeof(*stream->substreams),
+					     GFP_KERNEL);
+			if (!stream->substreams)
+				return -ENOMEM;
+
+			stream->nsubstreams = 0;
+		}
+	}
+
+	for (i = 0; i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_stream *vs;
+		struct virtio_pcm_substream *vss = &snd->substreams[i];
+
+		vpcm = virtsnd_pcm_find(snd, vss->nid);
+		if (IS_ERR(vpcm))
+			return PTR_ERR(vpcm);
+
+		vs = &vpcm->streams[vss->direction];
+		vs->substreams[vs->nsubstreams++] = vss;
+	}
+
+	list_for_each_entry(vpcm, &snd->pcm_list, list) {
+		for (i = 0; i < ARRAY_SIZE(vpcm->streams); ++i) {
+			struct virtio_pcm_stream *vs = &vpcm->streams[i];
+			struct snd_pcm_str *ks = &vpcm->pcm->streams[i];
+			struct snd_pcm_substream *kss;
+
+			if (!vs->nsubstreams)
+				continue;
+
+			for (kss = ks->substream; kss; kss = kss->next)
+				vs->substreams[kss->number]->substream = kss;
+		}
+
+		snd_pcm_set_managed_buffer_all(vpcm->pcm,
+					       SNDRV_DMA_TYPE_VMALLOC, NULL,
+					       0, 0);
+	}
+
+	return 0;
+}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
new file mode 100644
index 000000000000..42d592da41e5
--- /dev/null
+++ b/sound/virtio/virtio_pcm.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#ifndef VIRTIO_SND_PCM_H
+#define VIRTIO_SND_PCM_H
+
+#include <linux/atomic.h>
+#include <linux/virtio_config.h>
+#include <sound/pcm.h>
+
+struct virtio_pcm;
+struct virtio_pcm_msg;
+
+/**
+ * struct virtio_pcm_substream - VirtIO PCM substream.
+ * @snd: VirtIO sound device.
+ * @nid: Function group node identifier.
+ * @sid: Stream identifier.
+ * @direction: Stream data flow direction (SNDRV_PCM_STREAM_XXX).
+ * @features: Stream VirtIO feature bit map (1 << VIRTIO_SND_PCM_F_XXX).
+ * @substream: Kernel ALSA substream.
+ * @hw: Kernel ALSA substream hardware descriptor.
+ */
+struct virtio_pcm_substream {
+	struct virtio_snd *snd;
+	unsigned int nid;
+	unsigned int sid;
+	u32 direction;
+	u32 features;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_hardware hw;
+};
+
+/**
+ * struct virtio_pcm_stream - VirtIO PCM stream.
+ * @substreams: VirtIO substreams belonging to the stream.
+ * @nsubstreams: Number of substreams.
+ */
+struct virtio_pcm_stream {
+	struct virtio_pcm_substream **substreams;
+	unsigned int nsubstreams;
+};
+
+/**
+ * struct virtio_pcm - VirtIO PCM device.
+ * @list: VirtIO PCM list entry.
+ * @nid: Function group node identifier.
+ * @pcm: Kernel PCM device.
+ * @streams: VirtIO PCM streams (playback and capture).
+ */
+struct virtio_pcm {
+	struct list_head list;
+	unsigned int nid;
+	struct snd_pcm *pcm;
+	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
+};
+
+int virtsnd_pcm_validate(struct virtio_device *vdev);
+
+int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
+
+int virtsnd_pcm_build_devs(struct virtio_snd *snd);
+
+struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid);
+
+struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
+					      unsigned int nid);
+
+#endif /* VIRTIO_SND_PCM_H */
-- 
2.30.0


