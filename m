Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC02FC5F5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 01:39:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB6118EB;
	Wed, 20 Jan 2021 01:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB6118EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611103176;
	bh=k8wTgLDYQ0Am05OuYRjGrRXlLHQk4nSvQhMMjy1KrA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/C+XrCo+MZFOpxRhfqKtcABsKzG1yhnWIYY3VAuW5WXU60oAW7SEMxTp6rva4cCM
	 W/EoTQlvOKx5rF8zvfhY7u/3bcQXWXtzRZncxRIZg5XWE4g1uB7BN3CIy6uMxDb1pH
	 vUHPX7ppDpP6EIiEzpFy0hnCxKRM/GpNeq550BrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D12F804C2;
	Wed, 20 Jan 2021 01:37:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3AA5F804C2; Wed, 20 Jan 2021 01:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_47,PRX_BODY_64,PRX_BODY_65,PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D071F80257
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 01:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D071F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="tdrpTo1/"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 01D0CA13B2;
 Wed, 20 Jan 2021 01:37:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=7d8jUDlRkztD
 VQrmhiDTu+HQks3MOpAM9M8/Ns0axfE=; b=tdrpTo1/CEJJwuunCOa1L/DYybxT
 wuOtR1LhF9loUGm3N2gWtXGkkmqnpuXJMybM5bAHJLrx6y581DBqLCq41cp9HGvK
 IE+0leX9l/tzDHRDMEegRLAOXDfvQgsNnqswOn5voTXHfHCsqk9PzX9UTne0vjBJ
 PId4EOm3i5S3Z0Gh58gi1aeUGNLjMIdrOglRokdmk/gEzGnA5Ur9lmRscRfBDUj2
 ddHVv5abxZxMY05sPSN0ZLCmJp+evxVc39kwZsjsusnWLiN+QKQq7nWblY+jCa3u
 GiwuD7xbonllWWMME4r4AE49naOgX2AlcO2LHKo7xfVSkQqsko0ILM+7sQ==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH 2/7] uapi: virtio_snd: add the sound device header file
Date: Wed, 20 Jan 2021 01:36:30 +0100
Message-ID: <20210120003638.3339987-3-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
References: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
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

The file contains the definitions for the sound device from the OASIS
virtio spec.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 MAINTAINERS                     |   6 +
 include/uapi/linux/virtio_snd.h | 361 ++++++++++++++++++++++++++++++++
 2 files changed, 367 insertions(+)
 create mode 100644 include/uapi/linux/virtio_snd.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 00836f6452f0..6dfd59eafe82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18936,6 +18936,12 @@ W:	https://virtio-mem.gitlab.io/
 F:	drivers/virtio/virtio_mem.c
 F:	include/uapi/linux/virtio_mem.h
 
+VIRTIO SOUND DRIVER
+M:	Anton Yakovlev <anton.yakovlev@opensynergy.com>
+L:	virtualization@lists.linux-foundation.org
+S:	Maintained
+F:	include/uapi/linux/virtio_snd.h
+
 VIRTUAL BOX GUEST DEVICE DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 M:	Arnd Bergmann <arnd@arndb.de>
diff --git a/include/uapi/linux/virtio_snd.h b/include/uapi/linux/virtio_snd.h
new file mode 100644
index 000000000000..1ff6310e54d6
--- /dev/null
+++ b/include/uapi/linux/virtio_snd.h
@@ -0,0 +1,361 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (C) 2020  OpenSynergy GmbH
+ *
+ * This header is BSD licensed so anyone can use the definitions to
+ * implement compatible drivers/servers.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the name of OpenSynergy GmbH nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
+ * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
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
-- 
2.30.0


