Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC64301DBA
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 17:58:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7ED118EF;
	Sun, 24 Jan 2021 17:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7ED118EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611507528;
	bh=AopjAcb1HwbrtQVyZT34o7HsQYoW+Rz6LRAMNGRbqto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MVBpPYhi3mv45lQOqQ8A1/+ADutYaTVJHOnesS3f4nqPB/PR+838q7f04wfAT+Sxj
	 FKavj5J+l4EbuqhnCkKQ0Ca2KlpPF6gMX1bBqwsznzx7wbLHFcLYEw1/Sb4Lz3SGbx
	 pQEv6bJXuwBY+iHvUytwDvwKl09O7JOQpUrfIFKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E81C4F80519;
	Sun, 24 Jan 2021 17:55:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10DAAF80518; Sun, 24 Jan 2021 17:55:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99C48F8014E
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 17:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C48F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="zmQRUL+j"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 36CCAA1483;
 Sun, 24 Jan 2021 17:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=cEpVbC9oDPt4
 Vd7QhGHWvpz2WjKYYV1jqvN179ZWVh4=; b=zmQRUL+jfqA//fj3u+dcmYLi0opJ
 gcPuWnKTft2M081VaTmBckU8UwlZ38kxfN+bVQg0e6daLCW64NIwDo3KxVJ2XHi1
 vuuAuTjX0bjodjI8jhoPZFKo2QLqvt80yA/r5ath45lnxxhPMchxYouzc2bYxCJH
 vEaDs7ojAJK+XhiJ1yJ9ydgUV6s13akfEX3/woY3pDyN1bjilx/YDPmJQ9/96fWp
 dVtg6M3xC9vQU+WdYg+HitqQ0759gDq+oes8e++PFWxjTBdfOP8KMV4ZaMk1xzyv
 o4nMhBjfcEIgshaLN7wYFKg6dleRS7ofS4SIz512GTbEfcBmrMA8AHLmIQ==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v2 7/9] ALSA: virtio: introduce jack support
Date: Sun, 24 Jan 2021 17:54:06 +0100
Message-ID: <20210124165408.1122868-8-anton.yakovlev@opensynergy.com>
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

Enumerate all available jacks and create ALSA controls.

At the moment jacks have a simple implementation and can only be used
to receive notifications about a plugged in/out device.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile      |   1 +
 sound/virtio/virtio_card.c |  18 +++
 sound/virtio/virtio_card.h |  12 ++
 sound/virtio/virtio_jack.c | 255 +++++++++++++++++++++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 sound/virtio/virtio_jack.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 34493226793f..09f485291285 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 virtio_snd-objs := \
 	virtio_card.o \
 	virtio_ctl_msg.o \
+	virtio_jack.o \
 	virtio_pcm.o \
 	virtio_pcm_msg.o \
 	virtio_pcm_ops.o
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 11d025ee77c2..1dd709437208 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -93,6 +93,11 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
 				break;
 
 			switch (le32_to_cpu(event->hdr.code)) {
+			case VIRTIO_SND_EVT_JACK_CONNECTED:
+			case VIRTIO_SND_EVT_JACK_DISCONNECTED: {
+				virtsnd_jack_event(snd, event);
+				break;
+			}
 			case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
 			case VIRTIO_SND_EVT_PCM_XRUN: {
 				virtsnd_pcm_event(snd, event);
@@ -295,10 +300,20 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 	strscpy(snd->card->longname, "VirtIO Sound Card",
 		sizeof(snd->card->longname));
 
+	rc = virtsnd_jack_parse_cfg(snd);
+	if (rc)
+		return rc;
+
 	rc = virtsnd_pcm_parse_cfg(snd);
 	if (rc)
 		return rc;
 
+	if (snd->njacks) {
+		rc = virtsnd_jack_build_devs(snd);
+		if (rc)
+			return rc;
+	}
+
 	if (snd->nsubstreams) {
 		rc = virtsnd_pcm_build_devs(snd);
 		if (rc)
@@ -428,6 +443,9 @@ static void virtsnd_remove(struct virtio_device *vdev)
 		devm_kfree(&vdev->dev, pcm);
 	}
 
+	if (snd->jacks)
+		devm_kfree(&vdev->dev, snd->jacks);
+
 	if (snd->substreams)
 		devm_kfree(&vdev->dev, snd->substreams);
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index b11c09984882..df4b0696e8c4 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -26,6 +26,7 @@
 #include "virtio_ctl_msg.h"
 #include "virtio_pcm.h"
 
+struct virtio_jack;
 struct virtio_pcm_substream;
 
 /**
@@ -47,6 +48,8 @@ struct virtio_snd_queue {
  * @ctl_msgs: Pending control request list.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
+ * @jacks: VirtIO jacks.
+ * @njacks: Number of jacks.
  * @substreams: VirtIO PCM substreams.
  * @nsubstreams: Number of PCM substreams.
  */
@@ -58,6 +61,8 @@ struct virtio_snd {
 	struct list_head ctl_msgs;
 	struct virtio_snd_event *event_msgs;
 	struct list_head pcm_list;
+	struct virtio_jack *jacks;
+	unsigned int njacks;
 	struct virtio_pcm_substream *substreams;
 	unsigned int nsubstreams;
 };
@@ -98,4 +103,11 @@ virtsnd_pcm_queue(struct virtio_pcm_substream *substream)
 		return virtsnd_rx_queue(substream->snd);
 }
 
+int virtsnd_jack_parse_cfg(struct virtio_snd *snd);
+
+int virtsnd_jack_build_devs(struct virtio_snd *snd);
+
+void virtsnd_jack_event(struct virtio_snd *snd,
+			struct virtio_snd_event *event);
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_jack.c b/sound/virtio/virtio_jack.c
new file mode 100644
index 000000000000..83593c59f6bf
--- /dev/null
+++ b/sound/virtio/virtio_jack.c
@@ -0,0 +1,255 @@
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
+#include <linux/virtio_config.h>
+#include <sound/jack.h>
+#include <sound/hda_verbs.h>
+
+#include "virtio_card.h"
+
+/**
+ * DOC: Implementation Status
+ *
+ * At the moment jacks have a simple implementation and can only be used to
+ * receive notifications about a plugged in/out device.
+ *
+ * VIRTIO_SND_R_JACK_REMAP
+ *   is not supported
+ */
+
+/**
+ * struct virtio_jack - VirtIO jack.
+ * @jack: Kernel jack control.
+ * @nid: Functional group node identifier.
+ * @features: Jack virtio feature bit map (1 << VIRTIO_SND_JACK_F_XXX).
+ * @defconf: Pin default configuration value.
+ * @caps: Pin capabilities value.
+ * @connected: Current jack connection status.
+ * @type: Kernel jack type (SND_JACK_XXX).
+ */
+struct virtio_jack {
+	struct snd_jack *jack;
+	unsigned int nid;
+	unsigned int features;
+	unsigned int defconf;
+	unsigned int caps;
+	bool connected;
+	int type;
+};
+
+/**
+ * virtsnd_jack_get_label() - Get the name string for the jack.
+ * @jack: VirtIO jack.
+ *
+ * Returns the jack name based on the default pin configuration value (see HDA
+ * specification).
+ *
+ * Context: Any context.
+ * Return: Name string.
+ */
+static const char *virtsnd_jack_get_label(struct virtio_jack *jack)
+{
+	unsigned int defconf = jack->defconf;
+	unsigned int device =
+		(defconf & AC_DEFCFG_DEVICE) >> AC_DEFCFG_DEVICE_SHIFT;
+	unsigned int location =
+		(defconf & AC_DEFCFG_LOCATION) >> AC_DEFCFG_LOCATION_SHIFT;
+
+	switch (device) {
+	case AC_JACK_LINE_OUT:
+		return "Line Out";
+	case AC_JACK_SPEAKER:
+		return "Speaker";
+	case AC_JACK_HP_OUT:
+		return "Headphone";
+	case AC_JACK_CD:
+		return "CD";
+	case AC_JACK_SPDIF_OUT:
+	case AC_JACK_DIG_OTHER_OUT:
+		if (location == AC_JACK_LOC_HDMI)
+			return "HDMI Out";
+		else
+			return "SPDIF Out";
+	case AC_JACK_LINE_IN:
+		return "Line";
+	case AC_JACK_AUX:
+		return "Aux";
+	case AC_JACK_MIC_IN:
+		return "Mic";
+	case AC_JACK_SPDIF_IN:
+		return "SPDIF In";
+	case AC_JACK_DIG_OTHER_IN:
+		return "Digital In";
+	default:
+		return "Misc";
+	}
+}
+
+/**
+ * virtsnd_jack_get_type() - Get the type for the jack.
+ * @jack: VirtIO jack.
+ *
+ * Returns the jack type based on the default pin configuration value (see HDA
+ * specification).
+ *
+ * Context: Any context.
+ * Return: SND_JACK_XXX value.
+ */
+static int virtsnd_jack_get_type(struct virtio_jack *jack)
+{
+	unsigned int defconf = jack->defconf;
+	unsigned int device =
+		(defconf & AC_DEFCFG_DEVICE) >> AC_DEFCFG_DEVICE_SHIFT;
+
+	switch (device) {
+	case AC_JACK_LINE_OUT:
+	case AC_JACK_SPEAKER:
+		return SND_JACK_LINEOUT;
+	case AC_JACK_HP_OUT:
+		return SND_JACK_HEADPHONE;
+	case AC_JACK_SPDIF_OUT:
+	case AC_JACK_DIG_OTHER_OUT:
+		return SND_JACK_AVOUT;
+	case AC_JACK_MIC_IN:
+		return SND_JACK_MICROPHONE;
+	default:
+		return SND_JACK_LINEIN;
+	}
+}
+
+/**
+ * virtsnd_jack_parse_cfg() - Parse the jack configuration.
+ * @snd: VirtIO sound device.
+ *
+ * This function is called during initial device initialization.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_jack_parse_cfg(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_snd_jack_info *info;
+	unsigned int i;
+	int rc;
+
+	virtio_cread(vdev, struct virtio_snd_config, jacks, &snd->njacks);
+	if (!snd->njacks)
+		return 0;
+
+	snd->jacks = devm_kcalloc(&vdev->dev, snd->njacks, sizeof(*snd->jacks),
+				  GFP_KERNEL);
+	if (!snd->jacks)
+		return -ENOMEM;
+
+	info = devm_kcalloc(&vdev->dev, snd->njacks, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_JACK_INFO, 0, snd->njacks,
+				    sizeof(*info), info);
+	if (rc)
+		return rc;
+
+	for (i = 0; i < snd->njacks; ++i) {
+		struct virtio_jack *jack = &snd->jacks[i];
+		struct virtio_pcm *pcm;
+
+		jack->nid = le32_to_cpu(info[i].hdr.hda_fn_nid);
+		jack->features = le32_to_cpu(info[i].features);
+		jack->defconf = le32_to_cpu(info[i].hda_reg_defconf);
+		jack->caps = le32_to_cpu(info[i].hda_reg_caps);
+		jack->connected = info[i].connected;
+
+		pcm = virtsnd_pcm_find_or_create(snd, jack->nid);
+		if (IS_ERR(pcm))
+			return PTR_ERR(pcm);
+	}
+
+	devm_kfree(&vdev->dev, info);
+
+	return 0;
+}
+
+/**
+ * virtsnd_jack_build_devs() - Build ALSA controls for jacks.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_jack_build_devs(struct virtio_snd *snd)
+{
+	unsigned int i;
+	int rc;
+
+	for (i = 0; i < snd->njacks; ++i) {
+		struct virtio_jack *jack = &snd->jacks[i];
+
+		jack->type = virtsnd_jack_get_type(jack);
+
+		rc = snd_jack_new(snd->card, virtsnd_jack_get_label(jack),
+				  jack->type, &jack->jack, true, true);
+		if (rc)
+			return rc;
+
+		if (!jack->jack)
+			continue;
+
+		jack->jack->private_data = jack;
+
+		snd_jack_report(jack->jack,
+				jack->connected ? jack->type : 0);
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_jack_event() - Handle the jack event notification.
+ * @snd: VirtIO sound device.
+ * @event: VirtIO sound event.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_jack_event(struct virtio_snd *snd, struct virtio_snd_event *event)
+{
+	unsigned int jack_id = le32_to_cpu(event->data);
+	struct virtio_jack *jack;
+
+	if (jack_id >= snd->njacks)
+		return;
+
+	jack = &snd->jacks[jack_id];
+
+	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_JACK_CONNECTED: {
+		jack->connected = true;
+		break;
+	}
+	case VIRTIO_SND_EVT_JACK_DISCONNECTED: {
+		jack->connected = false;
+		break;
+	}
+	default: {
+		return;
+	}
+	}
+
+	snd_jack_report(jack->jack, jack->connected ? jack->type : 0);
+}
-- 
2.30.0


