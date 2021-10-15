Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652F42EB28
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:11:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6E07168E;
	Fri, 15 Oct 2021 10:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6E07168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285478;
	bh=pQN82jATK0is4tJBEY2e5diX/ZHctxMKuAhYjS5URAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/VQnPdMu9Xorsv+lpnuLTTdFqvO82aERtzarkTR4jDBZ7kiaNjugRbN1qOv2RD+Z
	 oT0395QsbzxhrDhxRRewnYxLqL07H3+0BtDNvz5l1Fxo1blVTaYtsNytal7zfqj0fV
	 m+V4EuF8u7nj+kHSQo7/68HKbfAD6lHWnU9mWFgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57340F804FF;
	Fri, 15 Oct 2021 10:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 817F9F804FF; Fri, 15 Oct 2021 10:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECAAFF80290
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECAAFF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="yq76gqC3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YJNw4035"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 5CBFF3201C62;
 Fri, 15 Oct 2021 04:08:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 15 Oct 2021 04:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VviMXOM82TZIn
 PmGEfw9qiuy1bbfzz9n5VZGDGszDvE=; b=yq76gqC3uWIl6LyGzYta4F+cACJPU
 24Wl668TSkVfH9d+k1S75n150UpyMzg9m7fpFCcjykLPNysNQpeBhAlSrGgJ1vSv
 Ly2szZmzFRgGtcPOVhlAoFqu+/SxqATSKioN3I602RJ8d6DNn/Kulw7HWCDem8YG
 3Zo1Ec6UjHdZjacC4FH8uTGcuqcuRHM1gL5HYBdKzNf1nNl+wYLks8VCnF8u0c7Z
 Ole3ElgS4UJTLZWJRFAvYGosGBcox8jFp6+kVy9gKvxKCtG9rBUqnuXqCVTN3fzE
 XmqO7XduUOdaMx1kVnR1hajoVkdIYklrVqM8dtoApEcIU6KgUHD7+930g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VviMXOM82TZInPmGEfw9qiuy1bbfzz9n5VZGDGszDvE=; b=YJNw4035
 fr4er3g9jhOOaM7mC8B0qQlsChfGeQref46swCb77fU8jcwMr7DxjTtq5HgGSnWv
 FZGsKNQfDIDwqcMTlxLvkIetkD/xyA9+gio/Th4OibCNgWfQ5piZG/gFsp3PjSoq
 cW9qgN/72iXuA9YXwdOdUPkobT/IDMcjrR08tXJCyJmAHBqWTGxwz1ReCsu4mMQj
 2m+rZQThDhGkcmxho0riSfr8ewUydAB0C5JURUwSW7EJkbi7KpXDWAcM24lNaSJc
 darrZ+OdplTkVkY3R9Jy0hLqMXfXfrjPJ9fVqSTB59jfFRejTZODQZCbV8J0MS0v
 LF4yZJU1413FaA==
X-ME-Sender: <xms:AjdpYf6SbtL-h7px6QsG1nPXlco4Dmb5hAIs1ByhsVfmF9DiB9IIqA>
 <xme:AjdpYU7mQv_NT9RWuMKXvxiVOxi6ibKwFnv6aS8C0X7H-SNq-VlkCuZFocoa3oTlN
 W_fCJ6rpIb5-Xdo9AY>
X-ME-Received: <xmr:AjdpYWd7rrVnEq1vXfg788edXTSGjOBEwTeqke5pHqF6gKnAa1LMTMx4Sv4k0qso2qnKLEy2xtpkgOgZoNS3ID3mIpmPpap58pfpY0ffR2tPGJVAG7ey>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:AjdpYQKBAHgjOHgJc1LvuDJ219XcmkZ7FPrd81MO_fC1IEOlT4xZ8A>
 <xmx:AjdpYTJ-OnJ2QXVtk06Zz5VG6oi4y3gIexn1GJm0s3IxMFUHDkTbtQ>
 <xmx:AjdpYZxDR2OYLncEgunnmlPbtDhpMp9RkRliUoTEPc8a1cuBCXUduQ>
 <xmx:AjdpYaVf8BVvNR-RsphggRwucV_v5eE9geCb_ZHkO0_DBJ9oN2yK8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 01/11] ALSA: firewire-motu: add message parser to gather meter
 information in register DSP model
Date: Fri, 15 Oct 2021 17:08:16 +0900
Message-Id: <20211015080826.34847-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

Some of MOTU models allows software to configure their DSP parameters by
accessing to their registers. The models multiplex messages for status of
DSP into isochronous packet as well as PCM frames. The message includes
information of hardware metering, MIDI message, current parameters of DSP.
For my convenience, I call them as 'register DSP' model.

This patch adds message parser for them to gather hardware meter
information.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 |  35 +++++
 sound/firewire/motu/Makefile                  |   2 +-
 sound/firewire/motu/amdtp-motu.c              |   6 +
 sound/firewire/motu/motu-protocol-v2.c        |  14 +-
 sound/firewire/motu/motu-protocol-v3.c        |   4 +-
 .../motu/motu-register-dsp-message-parser.c   | 145 ++++++++++++++++++
 sound/firewire/motu/motu-stream.c             |   6 +
 sound/firewire/motu/motu.c                    |   6 +
 sound/firewire/motu/motu.h                    |   8 +
 9 files changed, 219 insertions(+), 7 deletions(-)
 create mode 100644 sound/firewire/motu/motu-register-dsp-message-parser.c

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index ae12826ed641..347fd7a05596 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -108,4 +108,39 @@ struct snd_firewire_tascam_state {
 	__be32 data[SNDRV_FIREWIRE_TASCAM_STATE_COUNT];
 };
 
+// In below MOTU models, software is allowed to control their DSP by accessing to registers.
+//  - 828mk2
+//  - 896hd
+//  - Traveler
+//  - 8 pre
+//  - Ultralite
+//  - 4 pre
+//  - Audio Express
+//
+// On the other hand, the status of DSP is split into specific messages included in the sequence of
+// isochronous packet. ALSA firewire-motu driver gathers the messages and allow userspace applications
+// to read it via ioctl. In 828mk2, 896hd, and Traveler, hardware meter for all of physical inputs
+// are put into the message, while one pair of physical outputs is selected. The selection is done by
+// LSB one byte in asynchronous write quadlet transaction to 0x'ffff'f000'0b2c.
+//
+// I note that V3HD/V4HD uses asynchronous transaction for the purpose. The destination address is
+// registered to 0x'ffff'f000'0b38 and '0b3c by asynchronous write quadlet request. The size of
+// message differs between 23 and 51 quadlets. For the case, the number of mixer bus can be extended
+// up to 12.
+
+#define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT	40
+
+/**
+ * struct snd_firewire_motu_register_dsp_meter - the container for meter information in DSP
+ *						 controlled by register access
+ * @data: Signal level meters. The mapping between position and input/output channel is
+ *	  model-dependent.
+ *
+ * The structure expresses the part of DSP status for hardware meter. The u8 storage includes linear
+ * value for audio signal level between 0x00 and 0x7f.
+ */
+struct snd_firewire_motu_register_dsp_meter {
+	__u8 data[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT];
+};
+
 #endif /* _UAPI_SOUND_FIREWIRE_H_INCLUDED */
diff --git a/sound/firewire/motu/Makefile b/sound/firewire/motu/Makefile
index acdf66564fb0..edbdf40c7162 100644
--- a/sound/firewire/motu/Makefile
+++ b/sound/firewire/motu/Makefile
@@ -4,5 +4,5 @@ CFLAGS_amdtp-motu.o	:= -I$(src)
 snd-firewire-motu-objs := motu.o amdtp-motu.o motu-transaction.o motu-stream.o \
 			  motu-proc.o motu-pcm.o motu-midi.o motu-hwdep.o \
 			  motu-protocol-v2.o motu-protocol-v3.o \
-			  motu-protocol-v1.o
+			  motu-protocol-v1.o motu-register-dsp-message-parser.o
 obj-$(CONFIG_SND_FIREWIRE_MOTU) += snd-firewire-motu.o
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index a18c2c033e83..605b831492ac 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -333,6 +333,7 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 					    unsigned int packets,
 					    struct snd_pcm_substream *pcm)
 {
+	struct snd_motu *motu = container_of(s, struct snd_motu, tx_stream);
 	struct amdtp_motu *p = s->protocol;
 	unsigned int pcm_frames = 0;
 	int i;
@@ -357,6 +358,11 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 			read_midi_messages(s, buf, data_blocks);
 	}
 
+	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
+		snd_motu_register_dsp_message_parser_parse(motu, descs, packets,
+							   s->data_block_quadlets);
+	}
+
 	// For tracepoints.
 	if (trace_data_block_sph_enabled() ||
 	    trace_data_block_message_enabled())
diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 2bd4485e4bc7..a5f70efa2e88 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -275,7 +275,8 @@ const struct snd_motu_spec snd_motu_spec_828mk2 = {
 	.name = "828mk2",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_REGISTER_DSP,
 	.tx_fixed_pcm_chunks = {14, 14, 0},
 	.rx_fixed_pcm_chunks = {14, 14, 0},
 };
@@ -283,7 +284,7 @@ const struct snd_motu_spec snd_motu_spec_828mk2 = {
 const struct snd_motu_spec snd_motu_spec_896hd = {
 	.name = "896HD",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	// No support for MIDI.
+	.flags = SND_MOTU_SPEC_REGISTER_DSP,
 	.tx_fixed_pcm_chunks = {14, 14, 8},
 	.rx_fixed_pcm_chunks = {14, 14, 8},
 };
@@ -292,7 +293,8 @@ const struct snd_motu_spec snd_motu_spec_traveler = {
 	.name = "Traveler",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_REGISTER_DSP,
 	.tx_fixed_pcm_chunks = {14, 14, 8},
 	.rx_fixed_pcm_chunks = {14, 14, 8},
 };
@@ -301,7 +303,8 @@ const struct snd_motu_spec snd_motu_spec_ultralite = {
 	.name = "UltraLite",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_REGISTER_DSP,
 	.tx_fixed_pcm_chunks = {14, 14, 0},
 	.rx_fixed_pcm_chunks = {14, 14, 0},
 };
@@ -310,7 +313,8 @@ const struct snd_motu_spec snd_motu_spec_8pre = {
 	.name = "8pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_REGISTER_DSP,
 	// Two dummy chunks always in the end of data block.
 	.tx_fixed_pcm_chunks = {10, 10, 0},
 	.rx_fixed_pcm_chunks = {6, 6, 0},
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 56e4504e7ec9..d0dd587460de 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -293,7 +293,8 @@ const struct snd_motu_spec snd_motu_spec_audio_express = {
 	.name = "AudioExpress",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_REGISTER_DSP,
 	.tx_fixed_pcm_chunks = {10, 10, 0},
 	.rx_fixed_pcm_chunks = {10, 10, 0},
 };
@@ -301,6 +302,7 @@ const struct snd_motu_spec snd_motu_spec_audio_express = {
 const struct snd_motu_spec snd_motu_spec_4pre = {
 	.name = "4pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
+	.flags = SND_MOTU_SPEC_REGISTER_DSP,
 	.tx_fixed_pcm_chunks = {10, 10, 0},
 	.rx_fixed_pcm_chunks = {10, 10, 0},
 };
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
new file mode 100644
index 000000000000..efb9708b5b5f
--- /dev/null
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// motu-register-dsp-message-parser.c - a part of driver for MOTU FireWire series
+//
+// Copyright (c) 2021 Takashi Sakamoto <o-takashi@sakamocchi.jp>
+
+// Below models allow software to configure their DSP functions by asynchronous transaction
+// to access their internal registers.
+// * 828 mk2
+// * 896hd
+// * Traveler
+// * 8 pre
+// * Ultralite
+// * 4 pre
+// * Audio Express
+//
+// Additionally, isochronous packets from the above models include messages to notify state of
+// DSP. The messages are two set of 3 byte data in 2nd and 3rd quadlet of data block. When user
+// operates hardware components such as dial and switch, corresponding messages are transferred.
+// The messages include Hardware metering and MIDI messages as well.
+
+#include "motu.h"
+
+#define MSG_FLAG_POS                    4
+#define MSG_FLAG_TYPE_MASK              0xf8
+#define MSG_FLAG_MIDI_MASK              0x01
+#define MSG_FLAG_MODEL_SPECIFIC_MASK    0x06
+#define   MSG_FLAG_8PRE                 0x00
+#define   MSG_FLAG_ULTRALITE            0x04
+#define   MSG_FLAG_TRAVELER             0x04
+#define   MSG_FLAG_828MK2               0x04
+#define   MSG_FLAG_896HD                0x04
+#define   MSG_FLAG_4PRE                 0x05 // MIDI mask is in 8th byte.
+#define   MSG_FLAG_AUDIOEXPRESS         0x05 // MIDI mask is in 8th byte.
+#define MSG_FLAG_TYPE_SHIFT             3
+#define MSG_VALUE_POS                   5
+#define MSG_MIDI_BYTE_POS		6
+#define MSG_METER_IDX_POS               7
+
+// In 4 pre and Audio express, meter index is in 6th byte. MIDI flag is in 8th byte and MIDI byte
+// is in 7th byte.
+#define MSG_METER_IDX_POS_4PRE_AE	6
+#define MSG_MIDI_BYTE_POS_4PRE_AE	7
+#define MSG_FLAG_MIDI_POS_4PRE_AE	8
+
+enum register_dsp_msg_type {
+	// Used for messages with no information.
+	INVALID = 0x00,
+	MIXER_SELECT = 0x01,
+	MIXER_SRC_GAIN = 0x02,
+	MIXER_SRC_PAN = 0x03,
+	MIXER_SRC_FLAG = 0x04,
+	MIXER_OUTPUT_PAIRED_VOLUME = 0x05,
+	MIXER_OUTPUT_PAIRED_FLAG = 0x06,
+	MAIN_OUTPUT_PAIRED_VOLUME = 0x07,
+	HP_OUTPUT_PAIRED_VOLUME = 0x08,
+	HP_OUTPUT_ASSIGN = 0x09,
+	// Transferred by all models but the purpose is still unknown.
+	UNKNOWN_0 = 0x0a,
+	// Specific to 828mk2, 896hd, Traveler.
+	UNKNOWN_2 = 0x0c,
+	// Specific to 828mk2, Traveler, and 896hd (not functional).
+	LINE_INPUT_BOOST = 0x0d,
+	// Specific to 828mk2, Traveler, and 896hd (not functional).
+	LINE_INPUT_NOMINAL_LEVEL = 0x0e,
+	// Specific to Ultralite, 4 pre, Audio express, and 8 pre (not functional).
+	INPUT_GAIN_AND_INVERT = 0x15,
+	// Specific to 4 pre, and Audio express.
+	INPUT_FLAG = 0x16,
+	// Specific to 4 pre, and Audio express.
+	MIXER_SRC_PAIRED_BALANCE = 0x17,
+	// Specific to 4 pre, and Audio express.
+	MIXER_SRC_PAIRED_WIDTH = 0x18,
+	// Transferred by all models. This type of message interposes the series of the other
+	// messages. The message delivers signal level up to 96.0 kHz. In 828mk2, 896hd, and
+	// Traveler, one of physical outputs is selected for the message. The selection is done
+	// by LSB one byte in asynchronous write quadlet transaction to 0x'ffff'f000'0b2c.
+	METER = 0x1f,
+};
+
+struct msg_parser {
+	struct snd_firewire_motu_register_dsp_meter meter;
+	bool meter_pos_quirk;
+};
+
+int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
+{
+	struct msg_parser *parser;
+	parser = devm_kzalloc(&motu->card->card_dev, sizeof(*parser), GFP_KERNEL);
+	if (!parser)
+		return -ENOMEM;
+	if (motu->spec == &snd_motu_spec_4pre || motu->spec == &snd_motu_spec_audio_express)
+		parser->meter_pos_quirk = true;
+	motu->message_parser = parser;
+	return 0;
+}
+
+int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu)
+{
+	return 0;
+}
+
+void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
+					unsigned int desc_count, unsigned int data_block_quadlets)
+{
+	struct msg_parser *parser = motu->message_parser;
+	bool meter_pos_quirk = parser->meter_pos_quirk;
+	int i;
+
+	for (i = 0; i < desc_count; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buffer = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
+		int j;
+
+		for (j = 0; j < data_blocks; ++j) {
+			u8 *b = (u8 *)buffer;
+			u8 msg_type = (b[MSG_FLAG_POS] & MSG_FLAG_TYPE_MASK) >> MSG_FLAG_TYPE_SHIFT;
+			u8 val = b[MSG_VALUE_POS];
+
+			buffer += data_block_quadlets;
+
+			switch (msg_type) {
+			case METER:
+			{
+				u8 pos;
+
+				if (!meter_pos_quirk)
+					pos = b[MSG_METER_IDX_POS];
+				else
+					pos = b[MSG_METER_IDX_POS_4PRE_AE];
+
+				if (pos < 0x80)
+					pos &= 0x1f;
+				else
+					pos = (pos & 0x1f) + 20;
+				parser->meter.data[pos] = val;
+				break;
+			}
+			default:
+				break;
+			}
+		}
+	}
+}
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 9e6ca39ebd7f..654b313ba98d 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -255,6 +255,12 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		if (err < 0)
 			return err;
 
+		if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
+			err = snd_motu_register_dsp_message_parser_init(motu);
+			if (err < 0)
+				return err;
+		}
+
 		err = begin_session(motu);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index f65426238d4c..0edf8f594a55 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -112,6 +112,12 @@ static int motu_probe(struct fw_unit *unit, const struct ieee1394_device_id *ent
 	if (err < 0)
 		goto error;
 
+	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
+		err = snd_motu_register_dsp_message_parser_new(motu);
+		if (err < 0)
+			goto error;
+	}
+
 	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index f1a830b358d4..8d6850bb925e 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -78,6 +78,8 @@ struct snd_motu {
 	struct amdtp_domain domain;
 
 	struct amdtp_motu_cache cache;
+
+	void *message_parser;
 };
 
 enum snd_motu_spec_flags {
@@ -85,6 +87,7 @@ enum snd_motu_spec_flags {
 	SND_MOTU_SPEC_RX_MIDI_3RD_Q	= 0x0002,
 	SND_MOTU_SPEC_TX_MIDI_2ND_Q	= 0x0004,
 	SND_MOTU_SPEC_TX_MIDI_3RD_Q	= 0x0008,
+	SND_MOTU_SPEC_REGISTER_DSP	= 0x0010,
 };
 
 #define SND_MOTU_CLOCK_RATE_COUNT	6
@@ -270,4 +273,9 @@ static inline int snd_motu_protocol_cache_packet_formats(struct snd_motu *motu)
 		return -ENXIO;
 }
 
+int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu);
+int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu);
+void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
+					unsigned int desc_count, unsigned int data_block_quadlets);
+
 #endif
-- 
2.30.2

