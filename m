Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2B301DB4
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 17:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F28018AA;
	Sun, 24 Jan 2021 17:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F28018AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611507442;
	bh=Au5gCejRi4sLI4KRN4C+j80Le0ZM+Hjbnx7p0NvHMpg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jdHeLsFWOLeeEHhGJw9NxoP28RFopAW7nq6bxN7oQHVtgYq0+F2FUbmcoTE3DEBoc
	 /RR0yG9gmf5QwlQFuaPr+Ly9uyounqtnHZpAiGmdV9WSsqDq1QBNPAsTjJF3Rlt0iZ
	 qe7sCtqy58VpWjoMAzWK70F24sGT65pww2iaocyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD53F804E0;
	Sun, 24 Jan 2021 17:54:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98AD5F804EB; Sun, 24 Jan 2021 17:54:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D71F804E0
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 17:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D71F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="VorZ0Uzf"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 448C8A1480;
 Sun, 24 Jan 2021 17:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=3Km6fclgIJgI
 4ueLrd2dcrUykEiyeylE+liRTjtCHXY=; b=VorZ0UzfuTWlrAYOS2hJp+7r0eN+
 D4YVf04bf2pn+HjXx+B/IX0crfuAm9L2J/2cnJqUE5dczh5C+zJLTRNBhDYrrkwm
 bfLPzVQe0wLn9n5IsIjK/ITxObInoIJ8O+YhCqokNPRpLSFyl+vRmE982DBjVm5O
 R/VE6USgTMUcTV8VTFEM4uVmvv5QpaBjeLlRIgQH9nt+QIJO/w839loio2hn5jzR
 sDHdBJbYn7pCIrx6pQCJpdeLmTtDsmWmDLcLBNXJYb6bd7a3KIiTy3uUEKtd+Qp7
 tDVQWzVYxj+U27cq4aGnP638NS0f52N1zVYiVL2BMu2qzT0uAD/8+Uk/VA==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v2 4/9] ALSA: virtio: build PCM devices and substream hardware
 descriptors
Date: Sun, 24 Jan 2021 17:54:03 +0100
Message-ID: <20210124165408.1122868-5-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
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
 sound/virtio/virtio_card.c |  45 ++++
 sound/virtio/virtio_card.h |   9 +
 sound/virtio/virtio_pcm.c  | 536 +++++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h  |  89 ++++++
 5 files changed, 681 insertions(+), 1 deletion(-)
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
index 955eadc2d858..39fe13b43dd1 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -92,6 +92,17 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
 			if (!event)
 				break;
 
+			switch (le32_to_cpu(event->hdr.code)) {
+			case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
+			case VIRTIO_SND_EVT_PCM_XRUN: {
+				virtsnd_pcm_event(snd, event);
+				break;
+			}
+			default: {
+				break;
+			}
+			}
+
 			virtsnd_event_send(queue->vqueue, event, true,
 					   GFP_ATOMIC);
 		}
@@ -274,6 +285,16 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 	strscpy(snd->card->longname, "VirtIO Sound Card",
 		sizeof(snd->card->longname));
 
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
 
@@ -302,6 +323,9 @@ static int virtsnd_validate(struct virtio_device *vdev)
 		return -EINVAL;
 	}
 
+	if (virtsnd_pcm_validate(vdev))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -325,6 +349,7 @@ static int virtsnd_probe(struct virtio_device *vdev)
 	snd->vdev = vdev;
 	INIT_WORK(&snd->reset_work, virtsnd_reset_fn);
 	INIT_LIST_HEAD(&snd->ctl_msgs);
+	INIT_LIST_HEAD(&snd->pcm_list);
 
 	vdev->priv = snd;
 
@@ -359,6 +384,8 @@ static int virtsnd_probe(struct virtio_device *vdev)
 static void virtsnd_remove(struct virtio_device *vdev)
 {
 	struct virtio_snd *snd = vdev->priv;
+	struct virtio_pcm *pcm;
+	struct virtio_pcm *pcm_next;
 
 	if (!snd)
 		return;
@@ -376,6 +403,24 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	vdev->config->reset(vdev);
 	vdev->config->del_vqs(vdev);
 
+	list_for_each_entry_safe(pcm, pcm_next, &snd->pcm_list, list) {
+		unsigned int i;
+
+		list_del(&pcm->list);
+
+		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
+			struct virtio_pcm_stream *stream = &pcm->streams[i];
+
+			if (stream->substreams)
+				devm_kfree(&vdev->dev, stream->substreams);
+		}
+
+		devm_kfree(&vdev->dev, pcm);
+	}
+
+	if (snd->substreams)
+		devm_kfree(&vdev->dev, snd->substreams);
+
 	devm_kfree(&vdev->dev, snd);
 
 	vdev->priv = NULL;
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 37b734a92134..be6651a6aaf8 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -24,6 +24,9 @@
 #include <uapi/linux/virtio_snd.h>
 
 #include "virtio_ctl_msg.h"
+#include "virtio_pcm.h"
+
+struct virtio_pcm_substream;
 
 /**
  * struct virtio_snd_queue - Virtqueue wrapper structure.
@@ -43,6 +46,9 @@ struct virtio_snd_queue {
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
  * @event_msgs: Device events.
+ * @pcm_list: VirtIO PCM device list.
+ * @substreams: VirtIO PCM substreams.
+ * @nsubstreams: Number of PCM substreams.
  */
 struct virtio_snd {
 	struct virtio_device *vdev;
@@ -51,6 +57,9 @@ struct virtio_snd {
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
index 000000000000..036990b7b78a
--- /dev/null
+++ b/sound/virtio/virtio_pcm.c
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sound card driver for virtio
+ * Copyright (C) 2020  OpenSynergy GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
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
+static const unsigned int g_v2a_format_map[] = {
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
+ * @substream: VirtIO substream.
+ * @info: VirtIO substream information entry.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -EINVAL if configuration is invalid.
+ */
+static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *substream,
+				struct virtio_snd_pcm_info *info)
+{
+	struct virtio_device *vdev = substream->snd->vdev;
+	unsigned int i;
+	u64 values;
+	size_t sample_max = 0;
+	size_t sample_min = 0;
+
+	substream->features = le32_to_cpu(info->features);
+
+	/*
+	 * TODO: set SNDRV_PCM_INFO_{BATCH,BLOCK_TRANSFER} if device supports
+	 * only message-based transport.
+	 */
+	substream->hw.info =
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_INTERLEAVED;
+
+	if (!info->channels_min || info->channels_min > info->channels_max) {
+		dev_err(&vdev->dev,
+			"SID %u: invalid channel range [%u %u]\n",
+			substream->sid, info->channels_min, info->channels_max);
+		return -EINVAL;
+	}
+
+	substream->hw.channels_min = info->channels_min;
+	substream->hw.channels_max = info->channels_max;
+
+	values = le64_to_cpu(info->formats);
+
+	substream->hw.formats = 0;
+
+	for (i = 0; i < ARRAY_SIZE(g_v2a_format_map); ++i)
+		if (values & (1ULL << i)) {
+			unsigned int alsa_fmt = g_v2a_format_map[i];
+			int bytes = snd_pcm_format_physical_width(alsa_fmt) / 8;
+
+			if (!sample_min || sample_min > bytes)
+				sample_min = bytes;
+
+			if (sample_max < bytes)
+				sample_max = bytes;
+
+			substream->hw.formats |= (1ULL << alsa_fmt);
+		}
+
+	if (!substream->hw.formats) {
+		dev_err(&vdev->dev,
+			"SID %u: no supported PCM sample formats found\n",
+			substream->sid);
+		return -EINVAL;
+	}
+
+	values = le64_to_cpu(info->rates);
+
+	substream->hw.rates = 0;
+
+	for (i = 0; i < ARRAY_SIZE(g_v2a_rate_map); ++i)
+		if (values & (1ULL << i)) {
+			if (!substream->hw.rate_min ||
+			    substream->hw.rate_min > g_v2a_rate_map[i].rate)
+				substream->hw.rate_min = g_v2a_rate_map[i].rate;
+
+			if (substream->hw.rate_max < g_v2a_rate_map[i].rate)
+				substream->hw.rate_max = g_v2a_rate_map[i].rate;
+
+			substream->hw.rates |= g_v2a_rate_map[i].alsa_bit;
+		}
+
+	if (!substream->hw.rates) {
+		dev_err(&vdev->dev,
+			"SID %u: no supported PCM frame rates found\n",
+			substream->sid);
+		return -EINVAL;
+	}
+
+	substream->hw.periods_min = pcm_periods_min;
+	substream->hw.periods_max = pcm_periods_max;
+
+	/*
+	 * We must ensure that there is enough space in the buffer to store
+	 * pcm_buffer_ms ms for the combination (Cmax, Smax, Rmax), where:
+	 *   Cmax = maximum supported number of channels,
+	 *   Smax = maximum supported sample size in bytes,
+	 *   Rmax = maximum supported frame rate.
+	 */
+	substream->hw.buffer_bytes_max =
+		sample_max * substream->hw.channels_max * pcm_buffer_ms *
+		(substream->hw.rate_max / MSEC_PER_SEC);
+
+	/* Align the buffer size to the page size */
+	substream->hw.buffer_bytes_max =
+		(substream->hw.buffer_bytes_max + PAGE_SIZE - 1) & -PAGE_SIZE;
+
+	/*
+	 * We must ensure that the minimum period size is enough to store
+	 * pcm_period_ms_min ms for the combination (Cmin, Smin, Rmin), where:
+	 *   Cmin = minimum supported number of channels,
+	 *   Smin = minimum supported sample size in bytes,
+	 *   Rmin = minimum supported frame rate.
+	 */
+	substream->hw.period_bytes_min =
+		sample_min * substream->hw.channels_min * pcm_period_ms_min *
+		(substream->hw.rate_min / MSEC_PER_SEC);
+
+	/*
+	 * We must ensure that the maximum period size is enough to store
+	 * pcm_period_ms_max ms for the combination (Cmax, Smax, Rmax).
+	 */
+	substream->hw.period_bytes_max =
+		sample_max * substream->hw.channels_max * pcm_period_ms_max *
+		(substream->hw.rate_max / MSEC_PER_SEC);
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_prealloc_pages() - Preallocate substream hardware buffer.
+ * @substream: VirtIO substream.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_prealloc_pages(struct virtio_pcm_substream *substream)
+{
+	struct snd_pcm_substream *ksubstream = substream->substream;
+	size_t size = substream->hw.buffer_bytes_max;
+	struct device *data = snd_dma_continuous_data(GFP_KERNEL);
+
+	/*
+	 * We just allocate a CONTINUOUS buffer as it should work in any setup.
+	 *
+	 * If there is a need to use DEV(_XXX), then add this case here and
+	 * (probably) update the related source code in other places.
+	 */
+	snd_pcm_lib_preallocate_pages(ksubstream, SNDRV_DMA_TYPE_CONTINUOUS,
+				      data, size, size);
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
+	struct virtio_pcm *pcm;
+
+	list_for_each_entry(pcm, &snd->pcm_list, list)
+		if (pcm->nid == nid)
+			return pcm;
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
+	struct virtio_pcm *pcm;
+
+	pcm = virtsnd_pcm_find(snd, nid);
+	if (!IS_ERR(pcm))
+		return pcm;
+
+	pcm = devm_kzalloc(&vdev->dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return ERR_PTR(-ENOMEM);
+
+	pcm->nid = nid;
+	list_add_tail(&pcm->list, &snd->pcm_list);
+
+	return pcm;
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
+	info = devm_kcalloc(&vdev->dev, snd->nsubstreams, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_PCM_INFO, 0,
+				    snd->nsubstreams, sizeof(*info), info);
+	if (rc)
+		return rc;
+
+	for (i = 0; i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *substream = &snd->substreams[i];
+		struct virtio_pcm *pcm;
+
+		substream->snd = snd;
+		substream->sid = i;
+
+		rc = virtsnd_pcm_build_hw(substream, &info[i]);
+		if (rc)
+			return rc;
+
+		substream->nid = le32_to_cpu(info[i].hdr.hda_fn_nid);
+
+		pcm = virtsnd_pcm_find_or_create(snd, substream->nid);
+		if (IS_ERR(pcm))
+			return PTR_ERR(pcm);
+
+		switch (info[i].direction) {
+		case VIRTIO_SND_D_OUTPUT: {
+			substream->direction = SNDRV_PCM_STREAM_PLAYBACK;
+			break;
+		}
+		case VIRTIO_SND_D_INPUT: {
+			substream->direction = SNDRV_PCM_STREAM_CAPTURE;
+			break;
+		}
+		default: {
+			dev_err(&vdev->dev, "SID %u: unknown direction (%u)\n",
+				substream->sid, info[i].direction);
+			return -EINVAL;
+		}
+		}
+
+		pcm->streams[substream->direction].nsubstreams++;
+	}
+
+	devm_kfree(&vdev->dev, info);
+
+	return 0;
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
+	struct virtio_pcm *pcm;
+	unsigned int i;
+	int rc;
+
+	list_for_each_entry(pcm, &snd->pcm_list, list) {
+		unsigned int npbs =
+			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].nsubstreams;
+		unsigned int ncps =
+			pcm->streams[SNDRV_PCM_STREAM_CAPTURE].nsubstreams;
+
+		if (!npbs && !ncps)
+			continue;
+
+		rc = snd_pcm_new(snd->card, "virtio_snd", pcm->nid, npbs, ncps,
+				 &pcm->pcm);
+		if (rc) {
+			dev_err(&vdev->dev, "snd_pcm_new[%u] failed: %d\n",
+				pcm->nid, rc);
+			return rc;
+		}
+
+		pcm->pcm->info_flags = 0;
+		pcm->pcm->dev_class = SNDRV_PCM_CLASS_GENERIC;
+		pcm->pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
+		strscpy(pcm->pcm->name, "VirtIO PCM", sizeof(pcm->pcm->name));
+
+		pcm->pcm->private_data = pcm;
+
+		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
+			struct virtio_pcm_stream *stream = &pcm->streams[i];
+
+			if (!stream->nsubstreams)
+				continue;
+
+			stream->substreams =
+				devm_kcalloc(&vdev->dev,
+					     stream->nsubstreams,
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
+		struct virtio_pcm_substream *substream = &snd->substreams[i];
+		struct virtio_pcm_stream *stream;
+
+		pcm = virtsnd_pcm_find(snd, substream->nid);
+		if (IS_ERR(pcm))
+			return PTR_ERR(pcm);
+
+		stream = &pcm->streams[substream->direction];
+		stream->substreams[stream->nsubstreams++] = substream;
+	}
+
+	list_for_each_entry(pcm, &snd->pcm_list, list)
+		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
+			struct virtio_pcm_stream *stream = &pcm->streams[i];
+			struct snd_pcm_str *kstream;
+			struct snd_pcm_substream *ksubstream;
+
+			if (!stream->nsubstreams)
+				continue;
+
+			kstream = &pcm->pcm->streams[i];
+			ksubstream = kstream->substream;
+
+			while (ksubstream) {
+				struct virtio_pcm_substream *substream =
+					stream->substreams[ksubstream->number];
+
+				substream->substream = ksubstream;
+				ksubstream = ksubstream->next;
+
+				rc = virtsnd_pcm_prealloc_pages(substream);
+				if (rc)
+					return rc;
+			}
+		}
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_event() - Handle the PCM device event notification.
+ * @snd: VirtIO sound device.
+ * @event: VirtIO sound event.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
+{
+	struct virtio_pcm_substream *substream;
+	unsigned int sid = le32_to_cpu(event->data);
+
+	if (sid >= snd->nsubstreams)
+		return;
+
+	substream = &snd->substreams[sid];
+
+	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED: {
+		/* TODO: deal with shmem elapsed period */
+		break;
+	}
+	case VIRTIO_SND_EVT_PCM_XRUN: {
+		break;
+	}
+	}
+}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
new file mode 100644
index 000000000000..73fb4d9dc524
--- /dev/null
+++ b/sound/virtio/virtio_pcm.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Sound card driver for virtio
+ * Copyright (C) 2020  OpenSynergy GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef VIRTIO_SND_PCM_H
+#define VIRTIO_SND_PCM_H
+
+#include <linux/atomic.h>
+#include <linux/virtio_config.h>
+#include <sound/pcm.h>
+
+struct virtio_pcm;
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
+ * @substreams: Virtio substreams belonging to the stream.
+ * @nsubstreams: Number of substreams.
+ */
+struct virtio_pcm_stream {
+	struct virtio_pcm_substream **substreams;
+	unsigned int nsubstreams;
+};
+
+/**
+ * struct virtio_pcm - VirtIO PCM device.
+ * @list: PCM list entry.
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
+void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event);
+
+void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue);
+
+void virtsnd_pcm_rx_notify_cb(struct virtqueue *vqueue);
+
+struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid);
+
+struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
+					      unsigned int nid);
+
+#endif /* VIRTIO_SND_PCM_H */
-- 
2.30.0


