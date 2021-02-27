Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93588326C64
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Feb 2021 10:04:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED4A716B0;
	Sat, 27 Feb 2021 10:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED4A716B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614416681;
	bh=lnopp7HMSLuFn0TJgrCyi1ytGDu1Ka/tw7G3Boid0Kg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHQP3l0mAKh51EwWaj/NtKa0FKnUGuTHjuplmvmxmt0MxXMFANHSwsMcQaDmW1dGb
	 uVn2zMwcX4SfYZ7qxs2o8b7jOF6D0rxZWZCwdI2BjbgLpc5MHOzo0Yqq6LbLRLTHvO
	 pQoqL2yR56BVoS+hnLf6+JZIf3tDjCJF6VvHjpjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD180F804AF;
	Sat, 27 Feb 2021 10:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68994F8016A; Sat, 27 Feb 2021 10:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF16BF80159
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 10:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF16BF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="Wmheu/9H"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 4F37CA1764;
 Sat, 27 Feb 2021 10:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=Mco1fJSKwHi2
 YqRKHxoxgSDflK9dSmj1syIpue0PA9w=; b=Wmheu/9HZfQQWONgHoDHynpEtZHN
 w6pEM/zfCTrMIEWwST+zGJ25NOzNLTiUQ5MZbQQXcnT78LQGsd/+gNvxKRnjEXVY
 ICrEKg+6fzjuswIqvN1DOW4h/dzZ7+Np1Wb2eLRbWix/TuEMb4lfyR5izFh7yoKR
 D0tcrZrvcKW48832Z9kOTzv1GpzHVBpc1SZHY8+IPJcpJb1G5LPKQlhtNJeofNrR
 TjwGu1TPKVbVFgRiubDqsRNbNEOYCel2wEAkqX85uCwR5aZEhE16vdgbt6n0LmSl
 YvniviSjIZI90KKA9AuX3bXAVbpULNo2vxJ5oCtrMLukiOIoLbHuyh5W0w==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v6 8/9] ALSA: virtio: introduce PCM channel map support
Date: Sat, 27 Feb 2021 09:59:55 +0100
Message-ID: <20210227085956.1700687-9-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
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

Enumerate all available PCM channel maps and create ALSA controls.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile       |   1 +
 sound/virtio/virtio_card.c  |  10 ++
 sound/virtio/virtio_card.h  |   8 ++
 sound/virtio/virtio_chmap.c | 219 ++++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h   |   4 +
 5 files changed, 242 insertions(+)
 create mode 100644 sound/virtio/virtio_chmap.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 09f485291285..2742bddb8874 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 
 virtio_snd-objs := \
 	virtio_card.o \
+	virtio_chmap.o \
 	virtio_ctl_msg.o \
 	virtio_jack.o \
 	virtio_pcm.o \
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index c852afda5712..59455a562018 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -197,6 +197,10 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 	if (rc)
 		return rc;
 
+	rc = virtsnd_chmap_parse_cfg(snd);
+	if (rc)
+		return rc;
+
 	if (snd->njacks) {
 		rc = virtsnd_jack_build_devs(snd);
 		if (rc)
@@ -209,6 +213,12 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 			return rc;
 	}
 
+	if (snd->nchmaps) {
+		rc = virtsnd_chmap_build_devs(snd);
+		if (rc)
+			return rc;
+	}
+
 	return snd_card_register(snd->card);
 }
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 2092da297a9d..6af3d4816f57 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -43,6 +43,8 @@ struct virtio_snd_queue {
  * @njacks: Number of jacks.
  * @substreams: VirtIO PCM substreams.
  * @nsubstreams: Number of PCM substreams.
+ * @chmaps: VirtIO channel maps.
+ * @nchmaps: Number of channel maps.
  */
 struct virtio_snd {
 	struct virtio_device *vdev;
@@ -55,6 +57,8 @@ struct virtio_snd {
 	u32 njacks;
 	struct virtio_pcm_substream *substreams;
 	u32 nsubstreams;
+	struct virtio_snd_chmap_info *chmaps;
+	u32 nchmaps;
 };
 
 /* Message completion timeout in milliseconds (module parameter). */
@@ -100,4 +104,8 @@ int virtsnd_jack_build_devs(struct virtio_snd *snd);
 void virtsnd_jack_event(struct virtio_snd *snd,
 			struct virtio_snd_event *event);
 
+int virtsnd_chmap_parse_cfg(struct virtio_snd *snd);
+
+int virtsnd_chmap_build_devs(struct virtio_snd *snd);
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_chmap.c b/sound/virtio/virtio_chmap.c
new file mode 100644
index 000000000000..5bc924933a59
--- /dev/null
+++ b/sound/virtio/virtio_chmap.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <linux/virtio_config.h>
+
+#include "virtio_card.h"
+
+/* VirtIO->ALSA channel position map */
+static const u8 g_v2a_position_map[] = {
+	[VIRTIO_SND_CHMAP_NONE] = SNDRV_CHMAP_UNKNOWN,
+	[VIRTIO_SND_CHMAP_NA] = SNDRV_CHMAP_NA,
+	[VIRTIO_SND_CHMAP_MONO] = SNDRV_CHMAP_MONO,
+	[VIRTIO_SND_CHMAP_FL] = SNDRV_CHMAP_FL,
+	[VIRTIO_SND_CHMAP_FR] = SNDRV_CHMAP_FR,
+	[VIRTIO_SND_CHMAP_RL] = SNDRV_CHMAP_RL,
+	[VIRTIO_SND_CHMAP_RR] = SNDRV_CHMAP_RR,
+	[VIRTIO_SND_CHMAP_FC] = SNDRV_CHMAP_FC,
+	[VIRTIO_SND_CHMAP_LFE] = SNDRV_CHMAP_LFE,
+	[VIRTIO_SND_CHMAP_SL] = SNDRV_CHMAP_SL,
+	[VIRTIO_SND_CHMAP_SR] = SNDRV_CHMAP_SR,
+	[VIRTIO_SND_CHMAP_RC] = SNDRV_CHMAP_RC,
+	[VIRTIO_SND_CHMAP_FLC] = SNDRV_CHMAP_FLC,
+	[VIRTIO_SND_CHMAP_FRC] = SNDRV_CHMAP_FRC,
+	[VIRTIO_SND_CHMAP_RLC] = SNDRV_CHMAP_RLC,
+	[VIRTIO_SND_CHMAP_RRC] = SNDRV_CHMAP_RRC,
+	[VIRTIO_SND_CHMAP_FLW] = SNDRV_CHMAP_FLW,
+	[VIRTIO_SND_CHMAP_FRW] = SNDRV_CHMAP_FRW,
+	[VIRTIO_SND_CHMAP_FLH] = SNDRV_CHMAP_FLH,
+	[VIRTIO_SND_CHMAP_FCH] = SNDRV_CHMAP_FCH,
+	[VIRTIO_SND_CHMAP_FRH] = SNDRV_CHMAP_FRH,
+	[VIRTIO_SND_CHMAP_TC] = SNDRV_CHMAP_TC,
+	[VIRTIO_SND_CHMAP_TFL] = SNDRV_CHMAP_TFL,
+	[VIRTIO_SND_CHMAP_TFR] = SNDRV_CHMAP_TFR,
+	[VIRTIO_SND_CHMAP_TFC] = SNDRV_CHMAP_TFC,
+	[VIRTIO_SND_CHMAP_TRL] = SNDRV_CHMAP_TRL,
+	[VIRTIO_SND_CHMAP_TRR] = SNDRV_CHMAP_TRR,
+	[VIRTIO_SND_CHMAP_TRC] = SNDRV_CHMAP_TRC,
+	[VIRTIO_SND_CHMAP_TFLC] = SNDRV_CHMAP_TFLC,
+	[VIRTIO_SND_CHMAP_TFRC] = SNDRV_CHMAP_TFRC,
+	[VIRTIO_SND_CHMAP_TSL] = SNDRV_CHMAP_TSL,
+	[VIRTIO_SND_CHMAP_TSR] = SNDRV_CHMAP_TSR,
+	[VIRTIO_SND_CHMAP_LLFE] = SNDRV_CHMAP_LLFE,
+	[VIRTIO_SND_CHMAP_RLFE] = SNDRV_CHMAP_RLFE,
+	[VIRTIO_SND_CHMAP_BC] = SNDRV_CHMAP_BC,
+	[VIRTIO_SND_CHMAP_BLC] = SNDRV_CHMAP_BLC,
+	[VIRTIO_SND_CHMAP_BRC] = SNDRV_CHMAP_BRC
+};
+
+/**
+ * virtsnd_chmap_parse_cfg() - Parse the channel map configuration.
+ * @snd: VirtIO sound device.
+ *
+ * This function is called during initial device initialization.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_chmap_parse_cfg(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	u32 i;
+	int rc;
+
+	virtio_cread_le(vdev, struct virtio_snd_config, chmaps, &snd->nchmaps);
+	if (!snd->nchmaps)
+		return 0;
+
+	snd->chmaps = devm_kcalloc(&vdev->dev, snd->nchmaps,
+				   sizeof(*snd->chmaps), GFP_KERNEL);
+	if (!snd->chmaps)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_CHMAP_INFO, 0,
+				    snd->nchmaps, sizeof(*snd->chmaps),
+				    snd->chmaps);
+	if (rc)
+		return rc;
+
+	/* Count the number of channel maps per each PCM device/stream. */
+	for (i = 0; i < snd->nchmaps; ++i) {
+		struct virtio_snd_chmap_info *info = &snd->chmaps[i];
+		u32 nid = le32_to_cpu(info->hdr.hda_fn_nid);
+		struct virtio_pcm *vpcm;
+		struct virtio_pcm_stream *vs;
+
+		vpcm = virtsnd_pcm_find_or_create(snd, nid);
+		if (IS_ERR(vpcm))
+			return PTR_ERR(vpcm);
+
+		switch (info->direction) {
+		case VIRTIO_SND_D_OUTPUT:
+			vs = &vpcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
+			break;
+		case VIRTIO_SND_D_INPUT:
+			vs = &vpcm->streams[SNDRV_PCM_STREAM_CAPTURE];
+			break;
+		default:
+			dev_err(&vdev->dev,
+				"chmap #%u: unknown direction (%u)\n", i,
+				info->direction);
+			return -EINVAL;
+		}
+
+		vs->nchmaps++;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_chmap_add_ctls() - Create an ALSA control for channel maps.
+ * @pcm: ALSA PCM device.
+ * @direction: PCM stream direction (SNDRV_PCM_STREAM_XXX).
+ * @vs: VirtIO PCM stream.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_chmap_add_ctls(struct snd_pcm *pcm, int direction,
+				  struct virtio_pcm_stream *vs)
+{
+	u32 i;
+	int max_channels = 0;
+
+	for (i = 0; i < vs->nchmaps; i++)
+		if (max_channels < vs->chmaps[i].channels)
+			max_channels = vs->chmaps[i].channels;
+
+	return snd_pcm_add_chmap_ctls(pcm, direction, vs->chmaps, max_channels,
+				      0, NULL);
+}
+
+/**
+ * virtsnd_chmap_build_devs() - Build ALSA controls for channel maps.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_chmap_build_devs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_pcm *vpcm;
+	struct virtio_pcm_stream *vs;
+	u32 i;
+	int rc;
+
+	/* Allocate channel map elements per each PCM device/stream. */
+	list_for_each_entry(vpcm, &snd->pcm_list, list) {
+		for (i = 0; i < ARRAY_SIZE(vpcm->streams); ++i) {
+			vs = &vpcm->streams[i];
+
+			if (!vs->nchmaps)
+				continue;
+
+			vs->chmaps = devm_kcalloc(&vdev->dev, vs->nchmaps + 1,
+						  sizeof(*vs->chmaps),
+						  GFP_KERNEL);
+			if (!vs->chmaps)
+				return -ENOMEM;
+
+			vs->nchmaps = 0;
+		}
+	}
+
+	/* Initialize channel maps per each PCM device/stream. */
+	for (i = 0; i < snd->nchmaps; ++i) {
+		struct virtio_snd_chmap_info *info = &snd->chmaps[i];
+		unsigned int channels = info->channels;
+		unsigned int ch;
+		struct snd_pcm_chmap_elem *chmap;
+
+		vpcm = virtsnd_pcm_find(snd, le32_to_cpu(info->hdr.hda_fn_nid));
+		if (IS_ERR(vpcm))
+			return PTR_ERR(vpcm);
+
+		if (info->direction == VIRTIO_SND_D_OUTPUT)
+			vs = &vpcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		else
+			vs = &vpcm->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		chmap = &vs->chmaps[vs->nchmaps++];
+
+		if (channels > ARRAY_SIZE(chmap->map))
+			channels = ARRAY_SIZE(chmap->map);
+
+		chmap->channels = channels;
+
+		for (ch = 0; ch < channels; ++ch) {
+			u8 position = info->positions[ch];
+
+			if (position >= ARRAY_SIZE(g_v2a_position_map))
+				return -EINVAL;
+
+			chmap->map[ch] = g_v2a_position_map[position];
+		}
+	}
+
+	/* Create an ALSA control per each PCM device/stream. */
+	list_for_each_entry(vpcm, &snd->pcm_list, list) {
+		if (!vpcm->pcm)
+			continue;
+
+		for (i = 0; i < ARRAY_SIZE(vpcm->streams); ++i) {
+			vs = &vpcm->streams[i];
+
+			if (!vs->nchmaps)
+				continue;
+
+			rc = virtsnd_chmap_add_ctls(vpcm->pcm, i, vs);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 55dfb19d14b3..1e683aeadde9 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -60,10 +60,14 @@ struct virtio_pcm_substream {
  * struct virtio_pcm_stream - VirtIO PCM stream.
  * @substreams: VirtIO substreams belonging to the stream.
  * @nsubstreams: Number of substreams.
+ * @chmaps: Kernel channel maps belonging to the stream.
+ * @nchmaps: Number of channel maps.
  */
 struct virtio_pcm_stream {
 	struct virtio_pcm_substream **substreams;
 	u32 nsubstreams;
+	struct snd_pcm_chmap_elem *chmaps;
+	u32 nchmaps;
 };
 
 /**
-- 
2.30.1


