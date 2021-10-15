Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9E42EB26
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:10:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2522C169A;
	Fri, 15 Oct 2021 10:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2522C169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285445;
	bh=Lh4Y1IN7kWZvWbuOlqtE6DcCHvRsjP0WisfDfxQXsNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOoqX2z6DPtDWoQJEF6/w42y9vQS1roUJiMoiw6isZJycKgRPmh5CX6ggjIwl/bZw
	 6giFhzb4f3JNlccAllrHT1TNj4qwkimITwx9g03/olM/FdAv18Rlrp27eV8kCHepS1
	 alQtO5QvZorwI4lv9PD0O+dXfLn+ZN9pJfMZCjTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA94F804F1;
	Fri, 15 Oct 2021 10:08:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA538F804E4; Fri, 15 Oct 2021 10:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 770D3F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 770D3F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="gLx5r9kd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="F147hIJo"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ACF2A3201C30;
 Fri, 15 Oct 2021 04:08:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Oct 2021 04:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0kEJKHqJbsPno
 E7DhcES5hyvRgUvP7MwuDbuXatRdEY=; b=gLx5r9kdnpMDYicr0sOqAT+fhezzw
 /ekXz0zBR5lkZXX0d/GX+CcD3Ttd6jqCDNFaTZ2kG+n+39mPAQWJ5WEM0qVjKkEG
 3tejXJqoJcM9mJk7JIpLvlO8eDSSeZZoD/7+mrZ6PFSU8V31mTbRwnfSvUCqd+Pg
 d4eNpgsx82sRt/aTCZJP4R57G/6BZnNrmg0zVn2OEmdjonFTMZKJ9vqw/h67zMBr
 DE1Oq4vhHA7miPK4Q+nOGVWYs5Aq+uVQ9NK/mw/t4g6Xr4MEmKdrk887m8HFtJ65
 lwRyhry11KqoVnEHddbX0FlM2XSqccKWaO4KwqBR231M/FA95TbOcDA8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0kEJKHqJbsPnoE7DhcES5hyvRgUvP7MwuDbuXatRdEY=; b=F147hIJo
 e6WwlKU2lsp5XpneTeoG8q8ENWOOts2UrFxT+B33BzELRAaCpOgLkr+VbdxgCkKf
 9tET+buKXYVbh/EQFXQdFsqDnmIfE00wbilgcj4F6yS3tN4oHYkVdgu28FUB02dC
 76xIVmYno5pynCtqjBB8pP1XzSx1CbJgx1w+uEuH9BLZS+ZSm9rH1H3rT/yqz5gY
 oIKch/E+lDRgq+E1rY0YRhjdznrnUljCY3z4RA9u4mt2P83iS9e1vdwI+JLFkZ82
 cxG+7ZIJfvFzdKJTG8Mb/+sLn7aX89WNk2ONomqRq+WCRs2SvXjdSeFaNpWrdLiL
 Cq5HOaZdzpXGuw==
X-ME-Sender: <xms:BTdpYZJ0A-tGcBLqcR-P_Fslsc1hufuFZQQ-jSiHJG5rWEcDwcJZfg>
 <xme:BTdpYVLqwYU_SbakZrqsOkEtinif8oQstoqG8WLo0lFWRXEE83RtdicK0PCkkQoB1
 o5Jq3njMWpssobgqmE>
X-ME-Received: <xmr:BTdpYRvJDkPN8jSz7zP-Ii7uadOT2F7PKM6pAUFFnThQ04uYGSQlWGMk0oHirUFyUkOIyWDz-yySPbQOp5s-gNndaqAZwFxk5xmrRsSzgqd0ztonJWnt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:BTdpYaZOwemvgDKwJvDZjbvkvaVNR7JranZM0ZTZSYyYHm8JHerY0g>
 <xmx:BTdpYQZlQ-VcFFp3PnXEEH2jbYIHhzi4Kn2VseeUxJL_w6mAeGS53g>
 <xmx:BTdpYeAD5ACnfE9nSvuBP09oWAJcQMsSdxV55SDNddajQcpjZGvvQw>
 <xmx:BTdpYfnMF3qvhUzO9cJ8dgcoHoiXAPupTTqOnt62C7FRt6HvgaXMUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 02/11] ALSA: firewire-motu: add message parser for meter
 information in command DSP model
Date: Fri, 15 Oct 2021 17:08:17 +0900
Message-Id: <20211015080826.34847-3-o-takashi@sakamocchi.jp>
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
command included in asynchronous transaction. The models multiplex messages
for hardware meters into isochronous packet as well as PCM frames. For
convenience, I call them as 'command DSP' model.

This patch adds message parser for them to gather hardware meter
information.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 |  30 ++++
 sound/firewire/motu/Makefile                  |   3 +-
 sound/firewire/motu/amdtp-motu.c              |   3 +
 .../motu/motu-command-dsp-message-parser.c    | 160 ++++++++++++++++++
 sound/firewire/motu/motu-protocol-v3.c        |  10 +-
 sound/firewire/motu/motu-stream.c             |   4 +
 sound/firewire/motu/motu.c                    |   4 +
 sound/firewire/motu/motu.h                    |   7 +
 8 files changed, 216 insertions(+), 5 deletions(-)
 create mode 100644 sound/firewire/motu/motu-command-dsp-message-parser.c

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 347fd7a05596..82d4765fbeee 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -143,4 +143,34 @@ struct snd_firewire_motu_register_dsp_meter {
 	__u8 data[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT];
 };
 
+// In below MOTU models, software is allowed to control their DSP by command in frame of
+// asynchronous transaction to 0x'ffff'0001'0000:
+//
+//  - 828 mk3 (FireWire only and Hybrid)
+//  - 896 mk3 (FireWire only and Hybrid)
+//  - Ultralite mk3 (FireWire only and Hybrid)
+//  - Traveler mk3
+//  - Track 16
+//
+// On the other hand, the states of hardware meter is split into specific messages included in the
+// sequence of isochronous packet. ALSA firewire-motu driver gathers the message and allow userspace
+// application to read it via ioctl.
+
+#define SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT	400
+
+/**
+ * struct snd_firewire_motu_command_dsp_meter - the container for meter information in DSP
+ *						controlled by command
+ * @data: Signal level meters. The mapping between position and signal channel is model-dependent.
+ *
+ * The structure expresses the part of DSP status for hardware meter. The 32 bit storage is
+ * estimated to include IEEE 764 32 bit single precision floating point (binary32) value. It is
+ * expected to be linear value (not logarithm) for audio signal level between 0.0 and +1.0. However,
+ * the last two quadlets (data[398] and data[399]) are filled with 0xffffffff since they are the
+ * marker of one period.
+ */
+struct snd_firewire_motu_command_dsp_meter {
+	__u32 data[SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT];
+};
+
 #endif /* _UAPI_SOUND_FIREWIRE_H_INCLUDED */
diff --git a/sound/firewire/motu/Makefile b/sound/firewire/motu/Makefile
index edbdf40c7162..3bef2a0b1e2e 100644
--- a/sound/firewire/motu/Makefile
+++ b/sound/firewire/motu/Makefile
@@ -4,5 +4,6 @@ CFLAGS_amdtp-motu.o	:= -I$(src)
 snd-firewire-motu-objs := motu.o amdtp-motu.o motu-transaction.o motu-stream.o \
 			  motu-proc.o motu-pcm.o motu-midi.o motu-hwdep.o \
 			  motu-protocol-v2.o motu-protocol-v3.o \
-			  motu-protocol-v1.o motu-register-dsp-message-parser.o
+			  motu-protocol-v1.o motu-register-dsp-message-parser.o \
+			  motu-command-dsp-message-parser.o
 obj-$(CONFIG_SND_FIREWIRE_MOTU) += snd-firewire-motu.o
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 605b831492ac..3ea91e281147 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -361,6 +361,9 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
 		snd_motu_register_dsp_message_parser_parse(motu, descs, packets,
 							   s->data_block_quadlets);
+	} else if (motu->spec->flags & SND_MOTU_SPEC_COMMAND_DSP) {
+		snd_motu_command_dsp_message_parser_parse(motu, descs, packets,
+							  s->data_block_quadlets);
 	}
 
 	// For tracepoints.
diff --git a/sound/firewire/motu/motu-command-dsp-message-parser.c b/sound/firewire/motu/motu-command-dsp-message-parser.c
new file mode 100644
index 000000000000..6716074f8bc1
--- /dev/null
+++ b/sound/firewire/motu/motu-command-dsp-message-parser.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// motu-command-dsp-message-parser.c - a part of driver for MOTU FireWire series
+//
+// Copyright (c) 2021 Takashi Sakamoto <o-takashi@sakamocchi.jp>
+
+// Below models allow software to configure their DSP function by command transferred in
+// asynchronous transaction:
+//  * 828 mk3 (FireWire only and Hybrid)
+//  * 896 mk3 (FireWire only and Hybrid)
+//  * Ultralite mk3 (FireWire only and Hybrid)
+//  * Traveler mk3
+//  * Track 16
+//
+// Isochronous packets from the above models includes messages to report state of hardware meter.
+
+#include "motu.h"
+
+enum msg_parser_state {
+	INITIALIZED,
+	FRAGMENT_DETECTED,
+	AVAILABLE,
+};
+
+struct msg_parser {
+	enum msg_parser_state state;
+	unsigned int interval;
+	unsigned int message_count;
+	unsigned int fragment_pos;
+	unsigned int value_index;
+	u64 value;
+	struct snd_firewire_motu_command_dsp_meter meter;
+};
+
+int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu)
+{
+	struct msg_parser *parser;
+
+	parser = devm_kzalloc(&motu->card->card_dev, sizeof(*parser), GFP_KERNEL);
+	if (!parser)
+		return -ENOMEM;
+	motu->message_parser = parser;
+
+	return 0;
+}
+
+int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc sfc)
+{
+	struct msg_parser *parser = motu->message_parser;
+
+	parser->state = INITIALIZED;
+
+	// All of data blocks don't have messages with meaningful information.
+	switch (sfc) {
+	case CIP_SFC_176400:
+	case CIP_SFC_192000:
+		parser->interval = 4;
+		break;
+	case CIP_SFC_88200:
+	case CIP_SFC_96000:
+		parser->interval = 2;
+		break;
+	case CIP_SFC_32000:
+	case CIP_SFC_44100:
+	case CIP_SFC_48000:
+	default:
+		parser->interval = 1;
+		break;
+	}
+
+	return 0;
+}
+
+#define FRAGMENT_POS			6
+#define MIDI_BYTE_POS			7
+#define MIDI_FLAG_POS			8
+// One value of hardware meter consists of 4 messages.
+#define FRAGMENTS_PER_VALUE		4
+#define VALUES_AT_IMAGE_END		0xffffffffffffffff
+
+void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
+					unsigned int desc_count, unsigned int data_block_quadlets)
+{
+	struct msg_parser *parser = motu->message_parser;
+	unsigned int interval = parser->interval;
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
+			buffer += data_block_quadlets;
+
+			switch (parser->state) {
+			case INITIALIZED:
+			{
+				u8 fragment = b[FRAGMENT_POS];
+
+				if (fragment > 0) {
+					parser->value = fragment;
+					parser->message_count = 1;
+					parser->state = FRAGMENT_DETECTED;
+				}
+				break;
+			}
+			case FRAGMENT_DETECTED:
+			{
+				if (parser->message_count % interval == 0) {
+					u8 fragment = b[FRAGMENT_POS];
+
+					parser->value >>= 8;
+					parser->value |= (u64)fragment << 56;
+
+					if (parser->value == VALUES_AT_IMAGE_END) {
+						parser->state = AVAILABLE;
+						parser->fragment_pos = 0;
+						parser->value_index = 0;
+						parser->message_count = 0;
+					}
+				}
+				++parser->message_count;
+				break;
+			}
+			case AVAILABLE:
+			default:
+			{
+				if (parser->message_count % interval == 0) {
+					u8 fragment = b[FRAGMENT_POS];
+
+					parser->value >>= 8;
+					parser->value |= (u64)fragment << 56;
+					++parser->fragment_pos;
+
+					if (parser->fragment_pos == 4) {
+						if (parser->value_index <
+						    SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT) {
+							u32 val = (u32)(parser->value >> 32);
+							parser->meter.data[parser->value_index] = val;
+							++parser->value_index;
+						}
+						parser->fragment_pos = 0;
+					}
+
+					if (parser->value == VALUES_AT_IMAGE_END) {
+						parser->value_index = 0;
+						parser->fragment_pos = 0;
+						parser->message_count = 0;
+					}
+				}
+				++parser->message_count;
+				break;
+			}
+			}
+		}
+	}
+}
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index d0dd587460de..05608e8ca0bc 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -261,12 +261,12 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 		return 0;
 }
 
-
 const struct snd_motu_spec snd_motu_spec_828mk3_fw = {
 	.name = "828mk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
-		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_COMMAND_DSP,
 	.tx_fixed_pcm_chunks = {18, 18, 14},
 	.rx_fixed_pcm_chunks = {14, 14, 10},
 };
@@ -275,7 +275,8 @@ const struct snd_motu_spec snd_motu_spec_828mk3_hybrid = {
 	.name = "828mk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
-		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_COMMAND_DSP,
 	.tx_fixed_pcm_chunks = {18, 18, 14},
 	.rx_fixed_pcm_chunks = {14, 14, 14},	// Additional 4 dummy chunks at higher rate.
 };
@@ -284,7 +285,8 @@ const struct snd_motu_spec snd_motu_spec_ultralite_mk3 = {
 	.name = "UltraLiteMk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
-		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_COMMAND_DSP,
 	.tx_fixed_pcm_chunks = {18, 14, 10},
 	.rx_fixed_pcm_chunks = {14, 14, 14},
 };
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 654b313ba98d..64aec9c3eefd 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -259,6 +259,10 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 			err = snd_motu_register_dsp_message_parser_init(motu);
 			if (err < 0)
 				return err;
+		} else if (motu->spec->flags & SND_MOTU_SPEC_COMMAND_DSP) {
+			err = snd_motu_command_dsp_message_parser_init(motu, motu->tx_stream.sfc);
+			if (err < 0)
+				return err;
 		}
 
 		err = begin_session(motu);
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 0edf8f594a55..5fc7ae475537 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -116,6 +116,10 @@ static int motu_probe(struct fw_unit *unit, const struct ieee1394_device_id *ent
 		err = snd_motu_register_dsp_message_parser_new(motu);
 		if (err < 0)
 			goto error;
+	} else if (motu->spec->flags & SND_MOTU_SPEC_COMMAND_DSP) {
+		err = snd_motu_command_dsp_message_parser_new(motu);
+		if (err < 0)
+			goto error;
 	}
 
 	err = snd_card_register(card);
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 8d6850bb925e..d818ce4901c9 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -88,6 +88,7 @@ enum snd_motu_spec_flags {
 	SND_MOTU_SPEC_TX_MIDI_2ND_Q	= 0x0004,
 	SND_MOTU_SPEC_TX_MIDI_3RD_Q	= 0x0008,
 	SND_MOTU_SPEC_REGISTER_DSP	= 0x0010,
+	SND_MOTU_SPEC_COMMAND_DSP	= 0x0020,
 };
 
 #define SND_MOTU_CLOCK_RATE_COUNT	6
@@ -278,4 +279,10 @@ int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu);
 void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
 					unsigned int desc_count, unsigned int data_block_quadlets);
 
+
+int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu);
+int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc sfc);
+void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
+					unsigned int desc_count, unsigned int data_block_quadlets);
+
 #endif
-- 
2.30.2

