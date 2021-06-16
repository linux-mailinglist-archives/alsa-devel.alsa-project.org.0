Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80B3A9516
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 10:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2996D169D;
	Wed, 16 Jun 2021 10:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2996D169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623832284;
	bh=/Oxd32qrnQu7AgPNMi1wOtU4L1exefjX/W4lZGbqZcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jd4PHSzGWhH/iOA5PDt9+wHmfVuG8b9VAv2OlbGBwZOOUyfgWNhdsf0ymYAAMn7ud
	 8LbT/KfgiPpCnpmLy6G0PI+XV8oTtPTcU8yRPCAmwzDnWkHJFsbJJJlCvpqPAo8ruI
	 UbZMMJOqcJOJ5IVyK73H6gJSF0fPVCRMUJyik0kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D09F80165;
	Wed, 16 Jun 2021 10:29:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72280F80165; Wed, 16 Jun 2021 10:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA49F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 10:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA49F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iRm1Sn/f"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A5eDFMJt"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2EDD6126C;
 Wed, 16 Jun 2021 04:28:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 16 Jun 2021 04:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vqJ6ZcFszYrXY
 XQ9iadst3LBKCXSTNUsIwkijjL6Uzo=; b=iRm1Sn/fk8YCe5ezQUvkgghfOxSXV
 yu/+hxkH2bdeXySV+5rm0MMiwnAhnPckGU0uHKyol2Kx3uowUudVKgYQdUehA2DQ
 ulxMLXoWOTauOD5EjF8BwVp302GreaaInbVEd7jzqENL0MensTbtMZBOPN2UNq2J
 ypX6ueDpfwTPDR0osjNmrWOGyPeGw08qKgzvLqgBPN8bW8py+5Z91KwMbdDvoINY
 SIXxjq38wbCDHyJ4cRsTlRa+QCKpZf1OhSg0Pdp7bk9K8Zdfh+MfquXBm/w/LwsK
 2Jwxe9iaDFyfRI5jbf4C3G4jw0/ebnBPwW5n6a/xzgcIFebAxOCMztyPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vqJ6ZcFszYrXYXQ9iadst3LBKCXSTNUsIwkijjL6Uzo=; b=A5eDFMJt
 GIXprZa/vkiQjBE62W3opUs5r6eAA5rA3YyxPnGd/zd0D7JzeAJvC+1ek5hnf70W
 O5MvfboLtVhhkyrP9GIOnith1+42A4vgN5ukjXTFspbTxhsgLGOmk0w/KqMBpO16
 CzdnJY0ir+1b5jEgvLmYYaiM8xhRyhdbEUD+cnuqHc0RO+d5LLjxRFB8lGLdRZh1
 LQ/6D+4UXcLcy2fjHP7VyaZKTG8mtCey/80ggAsU3Zg0GVThpL2EfyhVJ4yWnVSG
 QvHpHTMUYquuaty9a2vi4/kTy5wbrXyyYyACGITBoXdfaAUytJEsOyusKuYpiYFD
 oVr+LMYs99T5MQ==
X-ME-Sender: <xms:R7bJYCVitOFsF7KySg-lWHegIRsJTDI_sCpY7Ec4pb1jXsiyqAzR3Q>
 <xme:R7bJYOkjDQKIvYc3QMLUCUPxJaKZtWMPuN7j3Wm8UFnxK_3XJfjFi6OaaMfxEroA6
 zhYpfi1o79CJZBaxgg>
X-ME-Received: <xmr:R7bJYGb4B863Ha5o_P9AoeloluKGZFN57cq3jDaKpqSlo2CvEdMNwdOdPxyh9Ift3XA9BAVx1TOBtCKf3XDbe_C7DQFxgbsugVKWYRsVW7QIYpDNeDpt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:R7bJYJXTe5l4BWoqpy4gsh8seaSGydUlYYYFlbFg5QS8GWPQr8b9lA>
 <xmx:R7bJYMm4cBn4b7QcI9g-DpEjh10mcS0OyxQVF9rXm85bsivmCR_wtQ>
 <xmx:R7bJYOffNUPu1pOve52XEbNyjZCKgDoyCRdfxaKZzn-9CGmN1WRYEQ>
 <xmx:R7bJYIvcP-wZjNg6nB_t2ucuo9LYaRM7UyIyrtQun1x3bJRggA9g6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 04:28:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/2] ALSA: firewire-motu: add support for MOTU 828
Date: Wed, 16 Jun 2021 17:28:46 +0900
Message-Id: <20210616082847.124688-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616082847.124688-1-o-takashi@sakamocchi.jp>
References: <20210616082847.124688-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

MOTU 828 is a first model in MOTU FireWire series, produced in 2001. This
model consists of three chips:
 * Texas Instruments TSB41AB1 (Physical layer for IEEE 1394 bus)
 * Philips Semiconductors 1394L21BE (Link layer for IEEE 1394 bus and
   packet processing layer)
 * QuickLogic QuickRAM QL4016 (Data block processing layer and digital
   signal processing)

This commit adds a support for this model, with its unique protocol as
version 1. The features of this protocol are:

 * no MIDI support.
 * Rx packets have no data chunks for control and status messages.
 * Tx packets have 2 data chunks for control and status messages in the
   end of each data block. The chunks consist of data block counter
   (4 byte) and message (2 byte).
 * All of settings are represented in bit flag in one quadlet address
   (0x'ffff'f000'0b00).
 * When optical interface is configured as S/PDIF, signals of the interface
   is multiplexed for packets, instead of signals of coaxial interface.
 * The internal multiplexer is not configured by software.

I note that the device has a quirk to mute output voluntarily during
receiving batch of packets in the beginning of packet streaming. The
operation to unmute should be done by software enough after the device
shifts the state, however it's not deterministic. Furthermore, just
after switching rate of sampling clock, the device keeps the state longer.
This patch manages to sleep 100 msec before unmute operation, but it may
fail to release the mute in the case that the rate is changed. As a
workaround, users can restart packet streaming at the same rate, or write
to specific register from userspace.

$ python3 crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04105c54  bus_info_length 4, crc_length 16, crc 23636
404  31333934  bus_name "1394"
408  20001000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 0, max_rec 1 (4)
40c  0001f200  company_id 0001f2     |
410  00005015  device_id 0000005015  | EUI-64 0001f20000005015

               root directory
               -----------------------------------------------------------------
414  0004c65c  directory_length 4, crc 50780
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  8d000006  --> eui-64 leaf at 438
424  d1000001  --> unit directory at 428

               unit directory at 428
               -----------------------------------------------------------------
428  00035052  directory_length 3, crc 20562
42c  120001f2  specifier id
430  13000001  version
434  17101800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002eeb6  leaf_length 2, crc 61110
43c  0001f200  company_id 0001f2     |
440  00005015  device_id 0000005015  | EUI-64 0001f20000005015

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig                 |   1 +
 sound/firewire/motu/Makefile           |   3 +-
 sound/firewire/motu/motu-protocol-v1.c | 225 +++++++++++++++++++++++++
 sound/firewire/motu/motu.c             |   1 +
 sound/firewire/motu/motu.h             |  23 +++
 5 files changed, 252 insertions(+), 1 deletion(-)
 create mode 100644 sound/firewire/motu/motu-protocol-v1.c

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index a08a0dbfc951..a70732bbddab 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -165,6 +165,7 @@ config SND_FIREWIRE_MOTU
 	select SND_HWDEP
 	help
 	 Say Y here to enable support for FireWire devices which MOTU produced:
+	  * 828
 	  * 828mk2
 	  * Traveler
 	  * Ultralite
diff --git a/sound/firewire/motu/Makefile b/sound/firewire/motu/Makefile
index 7c502d35103c..acdf66564fb0 100644
--- a/sound/firewire/motu/Makefile
+++ b/sound/firewire/motu/Makefile
@@ -3,5 +3,6 @@ CFLAGS_amdtp-motu.o	:= -I$(src)
 
 snd-firewire-motu-objs := motu.o amdtp-motu.o motu-transaction.o motu-stream.o \
 			  motu-proc.o motu-pcm.o motu-midi.o motu-hwdep.o \
-			  motu-protocol-v2.o motu-protocol-v3.o
+			  motu-protocol-v2.o motu-protocol-v3.o \
+			  motu-protocol-v1.o
 obj-$(CONFIG_SND_FIREWIRE_MOTU) += snd-firewire-motu.o
diff --git a/sound/firewire/motu/motu-protocol-v1.c b/sound/firewire/motu/motu-protocol-v1.c
new file mode 100644
index 000000000000..fab6aef392af
--- /dev/null
+++ b/sound/firewire/motu/motu-protocol-v1.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+// motu-protocol-v1.c - a part of driver for MOTU FireWire series
+//
+// Copyright (c) 2021 Takashi Sakamoto <o-takashi@sakamocchi.jp>
+//
+// Licensed under the terms of the GNU General Public License, version 2.
+
+#include "motu.h"
+
+#include <linux/delay.h>
+
+// Status register for MOTU 828 (0x'ffff'f000'0b00).
+//
+// 0xffff0000: ISOC_COMM_CONTROL_MASK in motu-stream.c.
+// 0x00008000: mode of optical input interface.
+//   0x00008000: for S/PDIF signal.
+//   0x00000000: disabled or for ADAT signal.
+// 0x00004000: mode of optical output interface.
+//   0x00004000: for S/PDIF signal.
+//   0x00000000: disabled or for ADAT signal.
+// 0x00003f40: monitor input mode.
+//   0x00000800: analog-1/2
+//   0x00001a00: analog-3/4
+//   0x00002c00: analog-5/6
+//   0x00003e00: analog-7/8
+//   0x00000000: analog-1
+//   0x00000900: analog-2
+//   0x00001200: analog-3
+//   0x00001b00: analog-4
+//   0x00002400: analog-5
+//   0x00002d00: analog-6
+//   0x00003600: analog-7
+//   0x00003f00: analog-8
+//   0x00000040: disabled
+// 0x00000004: rate of sampling clock.
+//   0x00000004: 48.0 kHz
+//   0x00000000: 44.1 kHz
+// 0x00000023: source of sampling clock.
+//   0x00000002: S/PDIF on optical/coaxial interface.
+//   0x00000021: ADAT on optical interface
+//   0x00000001: ADAT on Dsub 9pin
+//   0x00000000: internal or SMPTE
+
+#define CLK_828_STATUS_OFFSET				0x0b00
+#define  CLK_828_STATUS_MASK				0x0000ffff
+#define  CLK_828_STATUS_FLAG_OPT_IN_IFACE_IS_SPDIF	0x00008000
+#define  CLK_828_STATUS_FLAG_OPT_OUT_IFACE_IS_SPDIF	0x00004000
+#define  CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES		0x00000080
+#define  CLK_828_STATUS_FLAG_SRC_IS_NOT_FROM_ADAT_DSUB	0x00000020
+#define  CLK_828_STATUS_FLAG_OUTPUT_MUTE		0x00000008
+#define  CLK_828_STATUS_FLAG_RATE_48000			0x00000004
+#define  CLK_828_STATUS_FLAG_SRC_SPDIF_ON_OPT_OR_COAX	0x00000002
+#define  CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT_OR_DSUB	0x00000001
+
+static void parse_clock_rate_828(u32 data, unsigned int *rate)
+{
+	if (data & CLK_828_STATUS_FLAG_RATE_48000)
+		*rate = 48000;
+	else
+		*rate = 44100;
+}
+
+static int get_clock_rate_828(struct snd_motu *motu, unsigned int *rate)
+{
+	__be32 reg;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	parse_clock_rate_828(be32_to_cpu(reg), rate);
+
+	return 0;
+}
+
+int snd_motu_protocol_v1_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
+{
+	if (motu->spec == &snd_motu_spec_828)
+		return get_clock_rate_828(motu, rate);
+	else
+		return -ENXIO;
+}
+
+static int set_clock_rate_828(struct snd_motu *motu, unsigned int rate)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg) & CLK_828_STATUS_MASK;
+
+	data &= ~CLK_828_STATUS_FLAG_RATE_48000;
+	if (rate == 48000)
+		data |= CLK_828_STATUS_FLAG_RATE_48000;
+
+	reg = cpu_to_be32(data);
+	return snd_motu_transaction_write(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+}
+
+int snd_motu_protocol_v1_set_clock_rate(struct snd_motu *motu, unsigned int rate)
+{
+	if (motu->spec == &snd_motu_spec_828)
+		return set_clock_rate_828(motu, rate);
+	else
+		return -ENXIO;
+}
+
+static int get_clock_source_828(struct snd_motu *motu, enum snd_motu_clock_source *src)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg) & CLK_828_STATUS_MASK;
+
+	if (data & CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT_OR_DSUB) {
+		if (data & CLK_828_STATUS_FLAG_SRC_IS_NOT_FROM_ADAT_DSUB)
+			*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
+		else
+			*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
+	} else if (data & CLK_828_STATUS_FLAG_SRC_SPDIF_ON_OPT_OR_COAX) {
+		if (data & CLK_828_STATUS_FLAG_OPT_IN_IFACE_IS_SPDIF)
+			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
+		else
+			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
+	} else {
+		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
+	}
+
+	return 0;
+}
+
+int snd_motu_protocol_v1_get_clock_source(struct snd_motu *motu, enum snd_motu_clock_source *src)
+{
+	if (motu->spec == &snd_motu_spec_828)
+		return get_clock_source_828(motu, src);
+	else
+		return -ENXIO;
+}
+
+static int switch_fetching_mode_828(struct snd_motu *motu, bool enable)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg) & CLK_828_STATUS_MASK;
+
+	data &= ~(CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES | CLK_828_STATUS_FLAG_OUTPUT_MUTE);
+	if (enable) {
+		// This transaction should be initiated after the device receives batch of packets
+		// since the device voluntarily mutes outputs. As a workaround, yield processor over
+		// 100 msec.
+		msleep(100);
+		data |= CLK_828_STATUS_FLAG_FETCH_PCM_FRAMES | CLK_828_STATUS_FLAG_OUTPUT_MUTE;
+	}
+
+	reg = cpu_to_be32(data);
+	return snd_motu_transaction_write(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+}
+
+int snd_motu_protocol_v1_switch_fetching_mode(struct snd_motu *motu, bool enable)
+{
+	if (motu->spec == &snd_motu_spec_828)
+		return switch_fetching_mode_828(motu, enable);
+	else
+		return -ENXIO;
+}
+
+static int detect_packet_formats_828(struct snd_motu *motu)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	motu->tx_packet_formats.pcm_byte_offset = 4;
+	motu->tx_packet_formats.msg_chunks = 2;
+
+	motu->rx_packet_formats.pcm_byte_offset = 4;
+	motu->rx_packet_formats.msg_chunks = 0;
+
+	err = snd_motu_transaction_read(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg) & CLK_828_STATUS_MASK;
+
+	// The number of chunks is just reduced when SPDIF is activated.
+	if (!(data & CLK_828_STATUS_FLAG_OPT_IN_IFACE_IS_SPDIF))
+		motu->tx_packet_formats.pcm_chunks[0] += 8;
+
+	if (!(data & CLK_828_STATUS_FLAG_OPT_OUT_IFACE_IS_SPDIF))
+		motu->rx_packet_formats.pcm_chunks[0] += 8;
+
+	return 0;
+}
+
+int snd_motu_protocol_v1_cache_packet_formats(struct snd_motu *motu)
+{
+	memcpy(motu->tx_packet_formats.pcm_chunks, motu->spec->tx_fixed_pcm_chunks,
+	       sizeof(motu->tx_packet_formats.pcm_chunks));
+	memcpy(motu->rx_packet_formats.pcm_chunks, motu->spec->rx_fixed_pcm_chunks,
+	       sizeof(motu->rx_packet_formats.pcm_chunks));
+
+	if (motu->spec == &snd_motu_spec_828)
+		return detect_packet_formats_828(motu);
+	else
+		return 0;
+}
+
+const struct snd_motu_spec snd_motu_spec_828 = {
+	.name = "828",
+	.protocol_version = SND_MOTU_PROTOCOL_V1,
+	.tx_fixed_pcm_chunks = {10, 0, 0},
+	.rx_fixed_pcm_chunks = {10, 0, 0},
+};
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 531eeb36eb87..add5f183dc1d 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -150,6 +150,7 @@ static void motu_bus_update(struct fw_unit *unit)
 }
 
 static const struct ieee1394_device_id motu_id_table[] = {
+	SND_MOTU_DEV_ENTRY(0x000001, &snd_motu_spec_828),
 	SND_MOTU_DEV_ENTRY(0x000003, &snd_motu_spec_828mk2),
 	SND_MOTU_DEV_ENTRY(0x000009, &snd_motu_spec_traveler),
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index c5c0e446deb2..13e2637a0330 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -107,6 +107,7 @@ enum snd_motu_clock_source {
 };
 
 enum snd_motu_protocol_version {
+	SND_MOTU_PROTOCOL_V1,
 	SND_MOTU_PROTOCOL_V2,
 	SND_MOTU_PROTOCOL_V3,
 };
@@ -121,6 +122,8 @@ struct snd_motu_spec {
 	unsigned char rx_fixed_pcm_chunks[3];
 };
 
+extern const struct snd_motu_spec snd_motu_spec_828;
+
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
 extern const struct snd_motu_spec snd_motu_spec_traveler;
 extern const struct snd_motu_spec snd_motu_spec_ultralite;
@@ -170,6 +173,16 @@ int snd_motu_create_midi_devices(struct snd_motu *motu);
 
 int snd_motu_create_hwdep_device(struct snd_motu *motu);
 
+int snd_motu_protocol_v1_get_clock_rate(struct snd_motu *motu,
+					unsigned int *rate);
+int snd_motu_protocol_v1_set_clock_rate(struct snd_motu *motu,
+					unsigned int rate);
+int snd_motu_protocol_v1_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src);
+int snd_motu_protocol_v1_switch_fetching_mode(struct snd_motu *motu,
+					      bool enable);
+int snd_motu_protocol_v1_cache_packet_formats(struct snd_motu *motu);
+
 int snd_motu_protocol_v2_get_clock_rate(struct snd_motu *motu,
 					unsigned int *rate);
 int snd_motu_protocol_v2_set_clock_rate(struct snd_motu *motu,
@@ -197,6 +210,8 @@ static inline int snd_motu_protocol_get_clock_rate(struct snd_motu *motu,
 		return snd_motu_protocol_v2_get_clock_rate(motu, rate);
 	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
 		return snd_motu_protocol_v3_get_clock_rate(motu, rate);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V1)
+		return snd_motu_protocol_v1_get_clock_rate(motu, rate);
 	else
 		return -ENXIO;
 }
@@ -208,6 +223,8 @@ static inline int snd_motu_protocol_set_clock_rate(struct snd_motu *motu,
 		return snd_motu_protocol_v2_set_clock_rate(motu, rate);
 	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
 		return snd_motu_protocol_v3_set_clock_rate(motu, rate);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V1)
+		return snd_motu_protocol_v1_set_clock_rate(motu, rate);
 	else
 		return -ENXIO;
 }
@@ -219,6 +236,8 @@ static inline int snd_motu_protocol_get_clock_source(struct snd_motu *motu,
 		return snd_motu_protocol_v2_get_clock_source(motu, source);
 	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
 		return snd_motu_protocol_v3_get_clock_source(motu, source);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V1)
+		return snd_motu_protocol_v1_get_clock_source(motu, source);
 	else
 		return -ENXIO;
 }
@@ -230,6 +249,8 @@ static inline int snd_motu_protocol_switch_fetching_mode(struct snd_motu *motu,
 		return snd_motu_protocol_v2_switch_fetching_mode(motu, enable);
 	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
 		return snd_motu_protocol_v3_switch_fetching_mode(motu, enable);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V1)
+		return snd_motu_protocol_v1_switch_fetching_mode(motu, enable);
 	else
 		return -ENXIO;
 }
@@ -240,6 +261,8 @@ static inline int snd_motu_protocol_cache_packet_formats(struct snd_motu *motu)
 		return snd_motu_protocol_v2_cache_packet_formats(motu);
 	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V3)
 		return snd_motu_protocol_v3_cache_packet_formats(motu);
+	else if (motu->spec->protocol_version == SND_MOTU_PROTOCOL_V1)
+		return snd_motu_protocol_v1_cache_packet_formats(motu);
 	else
 		return -ENXIO;
 }
-- 
2.30.2

