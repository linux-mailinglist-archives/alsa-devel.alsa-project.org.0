Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D4326C5E
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Feb 2021 10:02:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08070169B;
	Sat, 27 Feb 2021 10:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08070169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614416565;
	bh=SDiSVJ7M8sFdnos2y5buPTxJw1nlxJTFCAJCXqG2FZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qa5P2SDu3lupZJt7LzjEQbW/lPxGgl8gQwhzhBtbF8Bl8rzifl2tnLvo/uMLmBLIs
	 JCp8RsVSFfC3suYTR2ejx4nFXsdVwZqe1CO/DSOOiW0gAIxI28pCV6vAfyVFITlnKu
	 jCTu2jLtzkgWZg5w4Glq5BDGXb8ILw3xBSkyjxTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73683F802CA;
	Sat, 27 Feb 2021 10:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45B92F8026C; Sat, 27 Feb 2021 10:00:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3F7AF8016A
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 10:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F7AF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="1B+tsNcn"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 837BCA12EA;
 Sat, 27 Feb 2021 10:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=l4Awtos6mANn
 oSXfr2GF+CNDQQHAZ+g6QsLrA72609k=; b=1B+tsNcn3nAFh+UwA8FEfcQb7bj1
 5l07dt/KFGosy90tvZU+Booa28v1vneXdacaCoS9YJv9NYL6cBYzXNcbC8sf7mYD
 /sfE4Way6hEurn4SfdaDmqefLO56BprIAVW+TPGbbgdmTuuzvciJcPCSXuKXq5pO
 4d8CpxysZGIqos5uFFcfm0Y/KyRkFz417WSAjAM4aWAQqGtYMakO7/ERCgjENnVG
 Yfb5FMV6zV4RbrKWeG3ymaBi8AOzzkjyyovc1xYdDKcICjY1W5CzkvQF26WYR+3V
 eSZk+rSz38YnXRWCLF2vgSkLdvZ9ISp4/9ITzgb5qNyCUjZzWSmiPBOTRg==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v6 2/9] ALSA: virtio: add virtio sound driver
Date: Sat, 27 Feb 2021 09:59:49 +0100
Message-ID: <20210227085956.1700687-3-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

Introduce skeleton of the virtio sound driver. The driver implements
the virtio sound device specification, which has become part of the
virtio standard.

Initial initialization of the device, virtqueues and creation of an
empty ALSA sound device.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 MAINTAINERS                     |   9 +
 include/uapi/linux/virtio_snd.h | 334 ++++++++++++++++++++++++++++++++
 sound/Kconfig                   |   2 +
 sound/Makefile                  |   3 +-
 sound/virtio/Kconfig            |  10 +
 sound/virtio/Makefile           |   7 +
 sound/virtio/virtio_card.c      | 289 +++++++++++++++++++++++++++
 sound/virtio/virtio_card.h      |  65 +++++++
 8 files changed, 718 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/virtio_snd.h
 create mode 100644 sound/virtio/Kconfig
 create mode 100644 sound/virtio/Makefile
 create mode 100644 sound/virtio/virtio_card.c
 create mode 100644 sound/virtio/virtio_card.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c71664ca8bfd..4369946434ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19049,6 +19049,15 @@ W:	https://virtio-mem.gitlab.io/
 F:	drivers/virtio/virtio_mem.c
 F:	include/uapi/linux/virtio_mem.h
 
+VIRTIO SOUND DRIVER
+M:	Anton Yakovlev <anton.yakovlev@opensynergy.com>
+M:	"Michael S. Tsirkin" <mst@redhat.com>
+L:	virtualization@lists.linux-foundation.org
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	include/uapi/linux/virtio_snd.h
+F:	sound/virtio/*
+
 VIRTUAL BOX GUEST DEVICE DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 M:	Arnd Bergmann <arnd@arndb.de>
diff --git a/include/uapi/linux/virtio_snd.h b/include/uapi/linux/virtio_snd.h
new file mode 100644
index 000000000000..dfe49547a7b0
--- /dev/null
+++ b/include/uapi/linux/virtio_snd.h
@@ -0,0 +1,334 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#ifndef VIRTIO_SND_IF_H
+#define VIRTIO_SND_IF_H
+
+#include <linux/virtio_types.h>
+
+/*******************************************************************************
+ * CONFIGURATION SPACE
+ */
+struct virtio_snd_config {
+	/* # of available physical jacks */
+	__le32 jacks;
+	/* # of available PCM streams */
+	__le32 streams;
+	/* # of available channel maps */
+	__le32 chmaps;
+};
+
+enum {
+	/* device virtqueue indexes */
+	VIRTIO_SND_VQ_CONTROL = 0,
+	VIRTIO_SND_VQ_EVENT,
+	VIRTIO_SND_VQ_TX,
+	VIRTIO_SND_VQ_RX,
+	/* # of device virtqueues */
+	VIRTIO_SND_VQ_MAX
+};
+
+/*******************************************************************************
+ * COMMON DEFINITIONS
+ */
+
+/* supported dataflow directions */
+enum {
+	VIRTIO_SND_D_OUTPUT = 0,
+	VIRTIO_SND_D_INPUT
+};
+
+enum {
+	/* jack control request types */
+	VIRTIO_SND_R_JACK_INFO = 1,
+	VIRTIO_SND_R_JACK_REMAP,
+
+	/* PCM control request types */
+	VIRTIO_SND_R_PCM_INFO = 0x0100,
+	VIRTIO_SND_R_PCM_SET_PARAMS,
+	VIRTIO_SND_R_PCM_PREPARE,
+	VIRTIO_SND_R_PCM_RELEASE,
+	VIRTIO_SND_R_PCM_START,
+	VIRTIO_SND_R_PCM_STOP,
+
+	/* channel map control request types */
+	VIRTIO_SND_R_CHMAP_INFO = 0x0200,
+
+	/* jack event types */
+	VIRTIO_SND_EVT_JACK_CONNECTED = 0x1000,
+	VIRTIO_SND_EVT_JACK_DISCONNECTED,
+
+	/* PCM event types */
+	VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED = 0x1100,
+	VIRTIO_SND_EVT_PCM_XRUN,
+
+	/* common status codes */
+	VIRTIO_SND_S_OK = 0x8000,
+	VIRTIO_SND_S_BAD_MSG,
+	VIRTIO_SND_S_NOT_SUPP,
+	VIRTIO_SND_S_IO_ERR
+};
+
+/* common header */
+struct virtio_snd_hdr {
+	__le32 code;
+};
+
+/* event notification */
+struct virtio_snd_event {
+	/* VIRTIO_SND_EVT_XXX */
+	struct virtio_snd_hdr hdr;
+	/* optional event data */
+	__le32 data;
+};
+
+/* common control request to query an item information */
+struct virtio_snd_query_info {
+	/* VIRTIO_SND_R_XXX_INFO */
+	struct virtio_snd_hdr hdr;
+	/* item start identifier */
+	__le32 start_id;
+	/* item count to query */
+	__le32 count;
+	/* item information size in bytes */
+	__le32 size;
+};
+
+/* common item information header */
+struct virtio_snd_info {
+	/* function group node id (High Definition Audio Specification 7.1.2) */
+	__le32 hda_fn_nid;
+};
+
+/*******************************************************************************
+ * JACK CONTROL MESSAGES
+ */
+struct virtio_snd_jack_hdr {
+	/* VIRTIO_SND_R_JACK_XXX */
+	struct virtio_snd_hdr hdr;
+	/* 0 ... virtio_snd_config::jacks - 1 */
+	__le32 jack_id;
+};
+
+/* supported jack features */
+enum {
+	VIRTIO_SND_JACK_F_REMAP = 0
+};
+
+struct virtio_snd_jack_info {
+	/* common header */
+	struct virtio_snd_info hdr;
+	/* supported feature bit map (1 << VIRTIO_SND_JACK_F_XXX) */
+	__le32 features;
+	/* pin configuration (High Definition Audio Specification 7.3.3.31) */
+	__le32 hda_reg_defconf;
+	/* pin capabilities (High Definition Audio Specification 7.3.4.9) */
+	__le32 hda_reg_caps;
+	/* current jack connection status (0: disconnected, 1: connected) */
+	__u8 connected;
+
+	__u8 padding[7];
+};
+
+/* jack remapping control request */
+struct virtio_snd_jack_remap {
+	/* .code = VIRTIO_SND_R_JACK_REMAP */
+	struct virtio_snd_jack_hdr hdr;
+	/* selected association number */
+	__le32 association;
+	/* selected sequence number */
+	__le32 sequence;
+};
+
+/*******************************************************************************
+ * PCM CONTROL MESSAGES
+ */
+struct virtio_snd_pcm_hdr {
+	/* VIRTIO_SND_R_PCM_XXX */
+	struct virtio_snd_hdr hdr;
+	/* 0 ... virtio_snd_config::streams - 1 */
+	__le32 stream_id;
+};
+
+/* supported PCM stream features */
+enum {
+	VIRTIO_SND_PCM_F_SHMEM_HOST = 0,
+	VIRTIO_SND_PCM_F_SHMEM_GUEST,
+	VIRTIO_SND_PCM_F_MSG_POLLING,
+	VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS,
+	VIRTIO_SND_PCM_F_EVT_XRUNS
+};
+
+/* supported PCM sample formats */
+enum {
+	/* analog formats (width / physical width) */
+	VIRTIO_SND_PCM_FMT_IMA_ADPCM = 0,	/*  4 /  4 bits */
+	VIRTIO_SND_PCM_FMT_MU_LAW,		/*  8 /  8 bits */
+	VIRTIO_SND_PCM_FMT_A_LAW,		/*  8 /  8 bits */
+	VIRTIO_SND_PCM_FMT_S8,			/*  8 /  8 bits */
+	VIRTIO_SND_PCM_FMT_U8,			/*  8 /  8 bits */
+	VIRTIO_SND_PCM_FMT_S16,			/* 16 / 16 bits */
+	VIRTIO_SND_PCM_FMT_U16,			/* 16 / 16 bits */
+	VIRTIO_SND_PCM_FMT_S18_3,		/* 18 / 24 bits */
+	VIRTIO_SND_PCM_FMT_U18_3,		/* 18 / 24 bits */
+	VIRTIO_SND_PCM_FMT_S20_3,		/* 20 / 24 bits */
+	VIRTIO_SND_PCM_FMT_U20_3,		/* 20 / 24 bits */
+	VIRTIO_SND_PCM_FMT_S24_3,		/* 24 / 24 bits */
+	VIRTIO_SND_PCM_FMT_U24_3,		/* 24 / 24 bits */
+	VIRTIO_SND_PCM_FMT_S20,			/* 20 / 32 bits */
+	VIRTIO_SND_PCM_FMT_U20,			/* 20 / 32 bits */
+	VIRTIO_SND_PCM_FMT_S24,			/* 24 / 32 bits */
+	VIRTIO_SND_PCM_FMT_U24,			/* 24 / 32 bits */
+	VIRTIO_SND_PCM_FMT_S32,			/* 32 / 32 bits */
+	VIRTIO_SND_PCM_FMT_U32,			/* 32 / 32 bits */
+	VIRTIO_SND_PCM_FMT_FLOAT,		/* 32 / 32 bits */
+	VIRTIO_SND_PCM_FMT_FLOAT64,		/* 64 / 64 bits */
+	/* digital formats (width / physical width) */
+	VIRTIO_SND_PCM_FMT_DSD_U8,		/*  8 /  8 bits */
+	VIRTIO_SND_PCM_FMT_DSD_U16,		/* 16 / 16 bits */
+	VIRTIO_SND_PCM_FMT_DSD_U32,		/* 32 / 32 bits */
+	VIRTIO_SND_PCM_FMT_IEC958_SUBFRAME	/* 32 / 32 bits */
+};
+
+/* supported PCM frame rates */
+enum {
+	VIRTIO_SND_PCM_RATE_5512 = 0,
+	VIRTIO_SND_PCM_RATE_8000,
+	VIRTIO_SND_PCM_RATE_11025,
+	VIRTIO_SND_PCM_RATE_16000,
+	VIRTIO_SND_PCM_RATE_22050,
+	VIRTIO_SND_PCM_RATE_32000,
+	VIRTIO_SND_PCM_RATE_44100,
+	VIRTIO_SND_PCM_RATE_48000,
+	VIRTIO_SND_PCM_RATE_64000,
+	VIRTIO_SND_PCM_RATE_88200,
+	VIRTIO_SND_PCM_RATE_96000,
+	VIRTIO_SND_PCM_RATE_176400,
+	VIRTIO_SND_PCM_RATE_192000,
+	VIRTIO_SND_PCM_RATE_384000
+};
+
+struct virtio_snd_pcm_info {
+	/* common header */
+	struct virtio_snd_info hdr;
+	/* supported feature bit map (1 << VIRTIO_SND_PCM_F_XXX) */
+	__le32 features;
+	/* supported sample format bit map (1 << VIRTIO_SND_PCM_FMT_XXX) */
+	__le64 formats;
+	/* supported frame rate bit map (1 << VIRTIO_SND_PCM_RATE_XXX) */
+	__le64 rates;
+	/* dataflow direction (VIRTIO_SND_D_XXX) */
+	__u8 direction;
+	/* minimum # of supported channels */
+	__u8 channels_min;
+	/* maximum # of supported channels */
+	__u8 channels_max;
+
+	__u8 padding[5];
+};
+
+/* set PCM stream format */
+struct virtio_snd_pcm_set_params {
+	/* .code = VIRTIO_SND_R_PCM_SET_PARAMS */
+	struct virtio_snd_pcm_hdr hdr;
+	/* size of the hardware buffer */
+	__le32 buffer_bytes;
+	/* size of the hardware period */
+	__le32 period_bytes;
+	/* selected feature bit map (1 << VIRTIO_SND_PCM_F_XXX) */
+	__le32 features;
+	/* selected # of channels */
+	__u8 channels;
+	/* selected sample format (VIRTIO_SND_PCM_FMT_XXX) */
+	__u8 format;
+	/* selected frame rate (VIRTIO_SND_PCM_RATE_XXX) */
+	__u8 rate;
+
+	__u8 padding;
+};
+
+/*******************************************************************************
+ * PCM I/O MESSAGES
+ */
+
+/* I/O request header */
+struct virtio_snd_pcm_xfer {
+	/* 0 ... virtio_snd_config::streams - 1 */
+	__le32 stream_id;
+};
+
+/* I/O request status */
+struct virtio_snd_pcm_status {
+	/* VIRTIO_SND_S_XXX */
+	__le32 status;
+	/* current device latency */
+	__le32 latency_bytes;
+};
+
+/*******************************************************************************
+ * CHANNEL MAP CONTROL MESSAGES
+ */
+struct virtio_snd_chmap_hdr {
+	/* VIRTIO_SND_R_CHMAP_XXX */
+	struct virtio_snd_hdr hdr;
+	/* 0 ... virtio_snd_config::chmaps - 1 */
+	__le32 chmap_id;
+};
+
+/* standard channel position definition */
+enum {
+	VIRTIO_SND_CHMAP_NONE = 0,	/* undefined */
+	VIRTIO_SND_CHMAP_NA,		/* silent */
+	VIRTIO_SND_CHMAP_MONO,		/* mono stream */
+	VIRTIO_SND_CHMAP_FL,		/* front left */
+	VIRTIO_SND_CHMAP_FR,		/* front right */
+	VIRTIO_SND_CHMAP_RL,		/* rear left */
+	VIRTIO_SND_CHMAP_RR,		/* rear right */
+	VIRTIO_SND_CHMAP_FC,		/* front center */
+	VIRTIO_SND_CHMAP_LFE,		/* low frequency (LFE) */
+	VIRTIO_SND_CHMAP_SL,		/* side left */
+	VIRTIO_SND_CHMAP_SR,		/* side right */
+	VIRTIO_SND_CHMAP_RC,		/* rear center */
+	VIRTIO_SND_CHMAP_FLC,		/* front left center */
+	VIRTIO_SND_CHMAP_FRC,		/* front right center */
+	VIRTIO_SND_CHMAP_RLC,		/* rear left center */
+	VIRTIO_SND_CHMAP_RRC,		/* rear right center */
+	VIRTIO_SND_CHMAP_FLW,		/* front left wide */
+	VIRTIO_SND_CHMAP_FRW,		/* front right wide */
+	VIRTIO_SND_CHMAP_FLH,		/* front left high */
+	VIRTIO_SND_CHMAP_FCH,		/* front center high */
+	VIRTIO_SND_CHMAP_FRH,		/* front right high */
+	VIRTIO_SND_CHMAP_TC,		/* top center */
+	VIRTIO_SND_CHMAP_TFL,		/* top front left */
+	VIRTIO_SND_CHMAP_TFR,		/* top front right */
+	VIRTIO_SND_CHMAP_TFC,		/* top front center */
+	VIRTIO_SND_CHMAP_TRL,		/* top rear left */
+	VIRTIO_SND_CHMAP_TRR,		/* top rear right */
+	VIRTIO_SND_CHMAP_TRC,		/* top rear center */
+	VIRTIO_SND_CHMAP_TFLC,		/* top front left center */
+	VIRTIO_SND_CHMAP_TFRC,		/* top front right center */
+	VIRTIO_SND_CHMAP_TSL,		/* top side left */
+	VIRTIO_SND_CHMAP_TSR,		/* top side right */
+	VIRTIO_SND_CHMAP_LLFE,		/* left LFE */
+	VIRTIO_SND_CHMAP_RLFE,		/* right LFE */
+	VIRTIO_SND_CHMAP_BC,		/* bottom center */
+	VIRTIO_SND_CHMAP_BLC,		/* bottom left center */
+	VIRTIO_SND_CHMAP_BRC		/* bottom right center */
+};
+
+/* maximum possible number of channels */
+#define VIRTIO_SND_CHMAP_MAX_SIZE	18
+
+struct virtio_snd_chmap_info {
+	/* common header */
+	struct virtio_snd_info hdr;
+	/* dataflow direction (VIRTIO_SND_D_XXX) */
+	__u8 direction;
+	/* # of valid channel position values */
+	__u8 channels;
+	/* channel position values (VIRTIO_SND_CHMAP_XXX) */
+	__u8 positions[VIRTIO_SND_CHMAP_MAX_SIZE];
+};
+
+#endif /* VIRTIO_SND_IF_H */
diff --git a/sound/Kconfig b/sound/Kconfig
index 36785410fbe1..e56d96d2b11c 100644
--- a/sound/Kconfig
+++ b/sound/Kconfig
@@ -99,6 +99,8 @@ source "sound/synth/Kconfig"
 
 source "sound/xen/Kconfig"
 
+source "sound/virtio/Kconfig"
+
 endif # SND
 
 endif # !UML
diff --git a/sound/Makefile b/sound/Makefile
index 797ecdcd35e2..04ef04b1168f 100644
--- a/sound/Makefile
+++ b/sound/Makefile
@@ -5,7 +5,8 @@
 obj-$(CONFIG_SOUND) += soundcore.o
 obj-$(CONFIG_DMASOUND) += oss/dmasound/
 obj-$(CONFIG_SND) += core/ i2c/ drivers/ isa/ pci/ ppc/ arm/ sh/ synth/ usb/ \
-	firewire/ sparc/ spi/ parisc/ pcmcia/ mips/ soc/ atmel/ hda/ x86/ xen/
+	firewire/ sparc/ spi/ parisc/ pcmcia/ mips/ soc/ atmel/ hda/ x86/ xen/ \
+	virtio/
 obj-$(CONFIG_SND_AOA) += aoa/
 
 # This one must be compilable even if sound is configured out
diff --git a/sound/virtio/Kconfig b/sound/virtio/Kconfig
new file mode 100644
index 000000000000..094cba24ee5b
--- /dev/null
+++ b/sound/virtio/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Sound card driver for virtio
+
+config SND_VIRTIO
+	tristate "Virtio sound driver"
+	depends on VIRTIO
+	select SND_PCM
+	select SND_JACK
+	help
+          This is the virtual sound driver for virtio. Say Y or M.
diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
new file mode 100644
index 000000000000..8c87ebb9982b
--- /dev/null
+++ b/sound/virtio/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
+
+virtio_snd-objs := \
+	virtio_card.o
+
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
new file mode 100644
index 000000000000..697cb5f16e4d
--- /dev/null
+++ b/sound/virtio/virtio_card.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/virtio_config.h>
+#include <sound/initval.h>
+#include <uapi/linux/virtio_ids.h>
+
+#include "virtio_card.h"
+
+static void virtsnd_remove(struct virtio_device *vdev);
+
+/**
+ * virtsnd_event_send() - Add an event to the event queue.
+ * @vqueue: Underlying event virtqueue.
+ * @event: Event.
+ * @notify: Indicates whether or not to send a notification to the device.
+ * @gfp: Kernel flags for memory allocation.
+ *
+ * Context: Any context.
+ */
+static void virtsnd_event_send(struct virtqueue *vqueue,
+			       struct virtio_snd_event *event, bool notify,
+			       gfp_t gfp)
+{
+	struct scatterlist sg;
+	struct scatterlist *psgs[1] = { &sg };
+
+	/* reset event content */
+	memset(event, 0, sizeof(*event));
+
+	sg_init_one(&sg, event, sizeof(*event));
+
+	if (virtqueue_add_sgs(vqueue, psgs, 0, 1, event, gfp) || !notify)
+		return;
+
+	if (virtqueue_kick_prepare(vqueue))
+		virtqueue_notify(vqueue);
+}
+
+/**
+ * virtsnd_event_notify_cb() - Dispatch all reported events from the event queue.
+ * @vqueue: Underlying event virtqueue.
+ *
+ * This callback function is called upon a vring interrupt request from the
+ * device.
+ *
+ * Context: Interrupt context.
+ */
+static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
+	struct virtio_snd_event *event;
+	u32 length;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	do {
+		virtqueue_disable_cb(vqueue);
+		while ((event = virtqueue_get_buf(vqueue, &length)))
+			virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
+		if (unlikely(virtqueue_is_broken(vqueue)))
+			break;
+	} while (!virtqueue_enable_cb(vqueue));
+	spin_unlock_irqrestore(&queue->lock, flags);
+}
+
+/**
+ * virtsnd_find_vqs() - Enumerate and initialize all virtqueues.
+ * @snd: VirtIO sound device.
+ *
+ * After calling this function, the event queue is disabled.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_find_vqs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	static vq_callback_t *callbacks[VIRTIO_SND_VQ_MAX] = {
+		[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb
+	};
+	static const char *names[VIRTIO_SND_VQ_MAX] = {
+		[VIRTIO_SND_VQ_CONTROL] = "virtsnd-ctl",
+		[VIRTIO_SND_VQ_EVENT] = "virtsnd-event",
+		[VIRTIO_SND_VQ_TX] = "virtsnd-tx",
+		[VIRTIO_SND_VQ_RX] = "virtsnd-rx"
+	};
+	struct virtqueue *vqs[VIRTIO_SND_VQ_MAX] = { 0 };
+	unsigned int i;
+	unsigned int n;
+	int rc;
+
+	rc = virtio_find_vqs(vdev, VIRTIO_SND_VQ_MAX, vqs, callbacks, names,
+			     NULL);
+	if (rc) {
+		dev_err(&vdev->dev, "failed to initialize virtqueues\n");
+		return rc;
+	}
+
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
+		snd->queues[i].vqueue = vqs[i];
+
+	/* Allocate events and populate the event queue */
+	virtqueue_disable_cb(vqs[VIRTIO_SND_VQ_EVENT]);
+
+	n = virtqueue_get_vring_size(vqs[VIRTIO_SND_VQ_EVENT]);
+
+	snd->event_msgs = kmalloc_array(n, sizeof(*snd->event_msgs),
+					GFP_KERNEL);
+	if (!snd->event_msgs)
+		return -ENOMEM;
+
+	for (i = 0; i < n; ++i)
+		virtsnd_event_send(vqs[VIRTIO_SND_VQ_EVENT],
+				   &snd->event_msgs[i], false, GFP_KERNEL);
+
+	return 0;
+}
+
+/**
+ * virtsnd_enable_event_vq() - Enable the event virtqueue.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context.
+ */
+static void virtsnd_enable_event_vq(struct virtio_snd *snd)
+{
+	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
+
+	if (!virtqueue_enable_cb(queue->vqueue))
+		virtsnd_event_notify_cb(queue->vqueue);
+}
+
+/**
+ * virtsnd_build_devs() - Read configuration and build ALSA devices.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_build_devs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct device *dev = &vdev->dev;
+	int rc;
+
+	rc = snd_card_new(dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			  THIS_MODULE, 0, &snd->card);
+	if (rc < 0)
+		return rc;
+
+	snd->card->private_data = snd;
+
+	strscpy(snd->card->driver, VIRTIO_SND_CARD_DRIVER,
+		sizeof(snd->card->driver));
+	strscpy(snd->card->shortname, VIRTIO_SND_CARD_NAME,
+		sizeof(snd->card->shortname));
+	if (dev->parent->bus)
+		snprintf(snd->card->longname, sizeof(snd->card->longname),
+			 VIRTIO_SND_CARD_NAME " at %s/%s/%s",
+			 dev->parent->bus->name, dev_name(dev->parent),
+			 dev_name(dev));
+	else
+		snprintf(snd->card->longname, sizeof(snd->card->longname),
+			 VIRTIO_SND_CARD_NAME " at %s/%s",
+			 dev_name(dev->parent), dev_name(dev));
+
+	return snd_card_register(snd->card);
+}
+
+/**
+ * virtsnd_validate() - Validate if the device can be started.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -EINVAL on failure.
+ */
+static int virtsnd_validate(struct virtio_device *vdev)
+{
+	if (!vdev->config->get) {
+		dev_err(&vdev->dev, "configuration access disabled\n");
+		return -EINVAL;
+	}
+
+	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
+		dev_err(&vdev->dev,
+			"device does not comply with spec version 1.x\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_probe() - Create and initialize the device.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_probe(struct virtio_device *vdev)
+{
+	struct virtio_snd *snd;
+	unsigned int i;
+	int rc;
+
+	snd = devm_kzalloc(&vdev->dev, sizeof(*snd), GFP_KERNEL);
+	if (!snd)
+		return -ENOMEM;
+
+	snd->vdev = vdev;
+
+	vdev->priv = snd;
+
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
+		spin_lock_init(&snd->queues[i].lock);
+
+	rc = virtsnd_find_vqs(snd);
+	if (rc)
+		goto on_exit;
+
+	virtio_device_ready(vdev);
+
+	rc = virtsnd_build_devs(snd);
+	if (rc)
+		goto on_exit;
+
+	virtsnd_enable_event_vq(snd);
+
+on_exit:
+	if (rc)
+		virtsnd_remove(vdev);
+
+	return rc;
+}
+
+/**
+ * virtsnd_remove() - Remove VirtIO and ALSA devices.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context that permits to sleep.
+ */
+static void virtsnd_remove(struct virtio_device *vdev)
+{
+	struct virtio_snd *snd = vdev->priv;
+
+	if (snd->card)
+		snd_card_free(snd->card);
+
+	vdev->config->del_vqs(vdev);
+	vdev->config->reset(vdev);
+
+	kfree(snd->event_msgs);
+}
+
+static const struct virtio_device_id id_table[] = {
+	{ VIRTIO_ID_SOUND, VIRTIO_DEV_ANY_ID },
+	{ 0 },
+};
+
+static struct virtio_driver virtsnd_driver = {
+	.driver.name = KBUILD_MODNAME,
+	.driver.owner = THIS_MODULE,
+	.id_table = id_table,
+	.validate = virtsnd_validate,
+	.probe = virtsnd_probe,
+	.remove = virtsnd_remove,
+};
+
+static int __init init(void)
+{
+	return register_virtio_driver(&virtsnd_driver);
+}
+module_init(init);
+
+static void __exit fini(void)
+{
+	unregister_virtio_driver(&virtsnd_driver);
+}
+module_exit(fini);
+
+MODULE_DEVICE_TABLE(virtio, id_table);
+MODULE_DESCRIPTION("Virtio sound card driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
new file mode 100644
index 000000000000..b903b1b12e90
--- /dev/null
+++ b/sound/virtio/virtio_card.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#ifndef VIRTIO_SND_CARD_H
+#define VIRTIO_SND_CARD_H
+
+#include <linux/slab.h>
+#include <linux/virtio.h>
+#include <sound/core.h>
+#include <uapi/linux/virtio_snd.h>
+
+#define VIRTIO_SND_CARD_DRIVER	"virtio-snd"
+#define VIRTIO_SND_CARD_NAME	"VirtIO SoundCard"
+
+/**
+ * struct virtio_snd_queue - Virtqueue wrapper structure.
+ * @lock: Used to synchronize access to a virtqueue.
+ * @vqueue: Underlying virtqueue.
+ */
+struct virtio_snd_queue {
+	spinlock_t lock;
+	struct virtqueue *vqueue;
+};
+
+/**
+ * struct virtio_snd - VirtIO sound card device.
+ * @vdev: Underlying virtio device.
+ * @queues: Virtqueue wrappers.
+ * @card: ALSA sound card.
+ * @event_msgs: Device events.
+ */
+struct virtio_snd {
+	struct virtio_device *vdev;
+	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
+	struct snd_card *card;
+	struct virtio_snd_event *event_msgs;
+};
+
+static inline struct virtio_snd_queue *
+virtsnd_control_queue(struct virtio_snd *snd)
+{
+	return &snd->queues[VIRTIO_SND_VQ_CONTROL];
+}
+
+static inline struct virtio_snd_queue *
+virtsnd_event_queue(struct virtio_snd *snd)
+{
+	return &snd->queues[VIRTIO_SND_VQ_EVENT];
+}
+
+static inline struct virtio_snd_queue *
+virtsnd_tx_queue(struct virtio_snd *snd)
+{
+	return &snd->queues[VIRTIO_SND_VQ_TX];
+}
+
+static inline struct virtio_snd_queue *
+virtsnd_rx_queue(struct virtio_snd *snd)
+{
+	return &snd->queues[VIRTIO_SND_VQ_RX];
+}
+
+#endif /* VIRTIO_SND_CARD_H */
-- 
2.30.1


