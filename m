Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E870E3A9512
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 10:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872AB851;
	Wed, 16 Jun 2021 10:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872AB851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623832268;
	bh=gPt8RUB+llc6iaDk+ZEIC8kxmlDBaLnOeLiIv4IbWjg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/Kr7YAUV3iTbDhSiE0FVEs/kwj4aigzMIvai9T5gCJCkks2+QzcilQK3oPLox3N+
	 I9oSgw+Js067Ifmw3AhX82qvtKoo1/ZH47MohpnpT444JQWgQ0s/OffEa5aVP6Hpe2
	 Ys2OBVsIY7ViBdsWx9slqvJCqIXMu1HbBB7yEgE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB2E5F80148;
	Wed, 16 Jun 2021 10:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF36EF804B0; Wed, 16 Jun 2021 10:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE563F802E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 10:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE563F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="3kVnp0SK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eG69gx+C"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E417A10CF;
 Wed, 16 Jun 2021 04:28:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 16 Jun 2021 04:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=U9jaH2DL6IbXG
 cCVrW6uH2hHihFpw+PQgjVPumjTrb8=; b=3kVnp0SK5DWH3cNscmtGdZqYpIGzn
 ohi56GHCngJRtRBgp9KVrTWnS7Gy82wjNnWcoExUr3w/eHU2PQyHWtt2XtdLPrw8
 lYneIklAAvp9T4ko3HFn7it7PgdGgasw83vcBCpMwN88ixV3ZnvstrBXSr0mT3Lg
 4vawkkrmUV+o8z8Y83cViCw7tpxl1tCtrgxbV3YuEQhtdnQNfzOKFNPepRg4GPoq
 IRYHvaJRRy6eIfR6RhBAcrSQZfNCCpa5cGY28XZ/X+tVn/9wtxCtRKUxdQrU1KNh
 npHgx9YYYchfHJ2Xk4KLKIwwywgqhczdd8zDnfkw3LC5+gAtLUAZi1PDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=U9jaH2DL6IbXGcCVrW6uH2hHihFpw+PQgjVPumjTrb8=; b=eG69gx+C
 O/slWJyiMM9LnEamPKcCIylpjJAvZlLPTMST5K/YwiGHlTdR5FN837XyJk3Ac+Lo
 IGNFrVS2ggDFZYIV95ra/CfTP5dQlF6VR6vePovq3dZLo+Um+4UTU+x4NCPIo6k+
 6KKjKbjDtqPoE+OTLaOmlW3uB9BBOQ43nlgtzHCN0XhlzfC9NzHWk9gdk9GT5+77
 sKJAfQJ2opa5AA5DaePhJxzI4QfriS32X5+3IKeBR9UODM82bBinSE3qcUeGfzEl
 P3F47tNm4MD5ichfTEjKoa8Z/uqyG9J0l6rRYE0tsiw4Vuje1xRo1jnYp1QEfGRG
 nrURklyuOlb+iA==
X-ME-Sender: <xms:SbbJYAhBTI1i6hx2wa3v7zYN-mPFlu4wukXo2_4VBhySv5fHZvsXbQ>
 <xme:SbbJYJD8Ote6jGx6joUFpu9DfaWOz-7bLpfdTtc5Yrf43G1xY1En6KT6BdBMjHc68
 CmXCw168I494hbdljI>
X-ME-Received: <xmr:SbbJYIFBJ080Cg7LuIviiTsdZhi2LhWWrcqRKVti6GuPNPsnmTu1yt-3dNIQTN793ittB6JRH7Y1l3HNwB5SnYG0YbKTGZogs6oC6KzA_8oYVNIjOY8X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:SbbJYBQ2YH5_BTs-isW7zZoKYNVfPJQO_BpNyvD-NBfoS-3SZimMPA>
 <xmx:SbbJYNzCQK6_IWh03OQtD2SnzP3jTs-o1v09OTOKboJ-6bKaK-Nm-w>
 <xmx:SbbJYP47W0z4uYNrB2vooU_ur9IieZhrFQ6NXolccex7q06qpDtdYg>
 <xmx:SrbJYOpvOGT4HDYHeJ9OibcMHkNIX7CV6NJoT3EbwLgDoXrz6JseqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 04:28:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/2] ALSA: firewire-motu: add support for MOTU 896
Date: Wed, 16 Jun 2021 17:28:47 +0900
Message-Id: <20210616082847.124688-3-o-takashi@sakamocchi.jp>
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

MOTU 896 is a second model in MOTU FireWire series, produced in 2001. This
model consists of three chips:

 * Texas Instruments TSB41AB2 (Physical layer for IEEE 1394 bus)
 * Philips Semiconductors PDI 1394L21BE (Link layer for IEEE 1394 bus and
   packet processing layer)
 * QuickLogic QuickRAM QL4016 (Data block processing layer and digital
   signal processing)

This commit adds a support for the model, with its unique protocol as
version 1. The features of this protocol are:

 * no MIDI support.
 * Rx packets have no data chunks for control and status messages.
 * Tx packets have 2 bytes for control and status messages in the end of
   each data block.
 * The most of settings are represented in bit flag in one quadlet address
   (0x'ffff'f000'0b14).
 * It's selectable to use signal on optical interface, however the device
   has no register specific to it. The state has effect just to whether
   to exclude differed data chunks.
 * The internal multiplexer is not configured by software.

Just after powering on, the device has a quirk to fail handling
transaction. I recommend users to connect the device enough after powering
on.

$ python3 crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04102814  bus_info_length 4, crc_length 16, crc 10260
404  31333934  bus_name "1394"
408  20001000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 0, max_rec 1 (4)
40c  0001f200  company_id 0001f2     |
410  0000d645  device_id 000000d645  | EUI-64 0001f2000000d645

               root directory
               -----------------------------------------------------------------
414  0004c65c  directory_length 4, crc 50780
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  8d000006  --> eui-64 leaf at 438
424  d1000001  --> unit directory at 428

               unit directory at 428
               -----------------------------------------------------------------
428  0003ab34  directory_length 3, crc 43828
42c  120001f2  specifier id
430  13000002  version
434  17102801  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  0002057d  leaf_length 2, crc 1405
43c  0001f200  company_id 0001f2     |
440  0000d645  device_id 000000d645  | EUI-64 0001f2000000d645

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig                 |   1 +
 sound/firewire/motu/motu-protocol-v1.c | 215 +++++++++++++++++++++++++
 sound/firewire/motu/motu.c             |   1 +
 sound/firewire/motu/motu.h             |   1 +
 4 files changed, 218 insertions(+)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index a70732bbddab..62658e2b111a 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -166,6 +166,7 @@ config SND_FIREWIRE_MOTU
 	help
 	 Say Y here to enable support for FireWire devices which MOTU produced:
 	  * 828
+	  * 896
 	  * 828mk2
 	  * Traveler
 	  * Ultralite
diff --git a/sound/firewire/motu/motu-protocol-v1.c b/sound/firewire/motu/motu-protocol-v1.c
index fab6aef392af..d3eb9f377b71 100644
--- a/sound/firewire/motu/motu-protocol-v1.c
+++ b/sound/firewire/motu/motu-protocol-v1.c
@@ -53,6 +53,62 @@
 #define  CLK_828_STATUS_FLAG_SRC_SPDIF_ON_OPT_OR_COAX	0x00000002
 #define  CLK_828_STATUS_FLAG_SRC_ADAT_ON_OPT_OR_DSUB	0x00000001
 
+// Status register for MOTU 896 (0x'ffff'f000'0b14).
+//
+// 0x20000000: fetch PCM frames from communication IC to DAC.
+// 0x08000000: speed of word clock signal output on BNC interface.
+//   0x00000000: follow to system clock.
+//   0x08000000: half of system clock.
+// 0x01000000: Route main output to headphone output.
+// 0x00ffff00: input to monitor.
+//   0x00000000: none
+//   0x00004800: analog-1/2
+//   0x00005a00: analog-3/4
+//   0x00006c00: analog-5/6
+//   0x00007e00: analog-7/8
+//   0x00104800: AES/EBU-1/2
+//   0x00004000: analog-1
+//   0x00004900: analog-2
+//   0x00005200: analog-3
+//   0x00005b00: analog-4
+//   0x00006400: analog-5
+//   0x00006d00: analog-6
+//   0x00007600: analog-7
+//   0x00007f00: analog-8
+//   0x00104000: AES/EBU-1
+//   0x00104900: AES/EBU-2
+// 0x00000060: sample rate conversin for AES/EBU input/output.
+//   0x00000000: None
+//   0x00000020: input signal is converted to system rate
+//   0x00000040: output is slave to input, ignoring system rate
+//   0x00000060: output is double rate than system rate
+// 0x00000018: nominal rate of sampling clock.
+//   0x00000000: 44.1 kHz
+//   0x00000008: 48.0 kHz
+//   0x00000010: 88.2 kHz
+//   0x00000018: 96.0 kHz
+// 0x00000007: source of sampling clock.
+//   0x00000000: internal
+//   0x00000001: ADAT on optical interface
+//   0x00000002: AES/EBU on XLR
+//   0x00000004: word clock on BNC
+//   0x00000005: ADAT on Dsub 9pin
+
+#define CLK_896_STATUS_OFFSET			0x0b14
+#define  CLK_896_STATUS_FLAG_FETCH_ENABLE	0x20000000
+#define  CLK_896_STATUS_FLAG_MAIN_TO_HP		0x01000000
+#define  CLK_896_STATUS_MASK_SRC		0x00000007
+#define   CLK_896_STATUS_FLAG_SRC_INTERNAL	0x00000000
+#define   CLK_896_STATUS_FLAG_SRC_ADAT_ON_OPT	0x00000001
+#define   CLK_896_STATUS_FLAG_SRC_AESEBU	0x00000002
+#define   CLK_896_STATUS_FLAG_SRC_WORD		0x00000004
+#define   CLK_896_STATUS_FLAG_SRC_ADAT_ON_DSUB	0x00000005
+#define  CLK_896_STATUS_MASK_RATE		0x00000018
+#define   CLK_896_STATUS_FLAG_RATE_44100	0x00000000
+#define   CLK_896_STATUS_FLAG_RATE_48000	0x00000008
+#define   CLK_896_STATUS_FLAG_RATE_88200	0x00000010
+#define   CLK_896_STATUS_FLAG_RATE_96000	0x00000018
+
 static void parse_clock_rate_828(u32 data, unsigned int *rate)
 {
 	if (data & CLK_828_STATUS_FLAG_RATE_48000)
@@ -74,10 +130,45 @@ static int get_clock_rate_828(struct snd_motu *motu, unsigned int *rate)
 	return 0;
 }
 
+static int parse_clock_rate_896(u32 data, unsigned int *rate)
+{
+	switch (data & CLK_896_STATUS_MASK_RATE) {
+	case CLK_896_STATUS_FLAG_RATE_44100:
+		*rate = 44100;
+		break;
+	case CLK_896_STATUS_FLAG_RATE_48000:
+		*rate = 48000;
+		break;
+	case CLK_896_STATUS_FLAG_RATE_88200:
+		*rate = 88200;
+		break;
+	case CLK_896_STATUS_FLAG_RATE_96000:
+		*rate = 96000;
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static int get_clock_rate_896(struct snd_motu *motu, unsigned int *rate)
+{
+	__be32 reg;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	return parse_clock_rate_896(be32_to_cpu(reg), rate);
+}
+
 int snd_motu_protocol_v1_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
 {
 	if (motu->spec == &snd_motu_spec_828)
 		return get_clock_rate_828(motu, rate);
+	else if (motu->spec == &snd_motu_spec_896)
+		return get_clock_rate_896(motu, rate);
 	else
 		return -ENXIO;
 }
@@ -101,10 +192,48 @@ static int set_clock_rate_828(struct snd_motu *motu, unsigned int rate)
 	return snd_motu_transaction_write(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
 }
 
+static int set_clock_rate_896(struct snd_motu *motu, unsigned int rate)
+{
+	unsigned int flag;
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg);
+
+	switch (rate) {
+	case 44100:
+		flag = CLK_896_STATUS_FLAG_RATE_44100;
+		break;
+	case 48000:
+		flag = CLK_896_STATUS_FLAG_RATE_48000;
+		break;
+	case 88200:
+		flag = CLK_896_STATUS_FLAG_RATE_88200;
+		break;
+	case 96000:
+		flag = CLK_896_STATUS_FLAG_RATE_96000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	data &= ~CLK_896_STATUS_MASK_RATE;
+	data |= flag;
+
+	reg = cpu_to_be32(data);
+	return snd_motu_transaction_write(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
+}
+
 int snd_motu_protocol_v1_set_clock_rate(struct snd_motu *motu, unsigned int rate)
 {
 	if (motu->spec == &snd_motu_spec_828)
 		return set_clock_rate_828(motu, rate);
+	else if (motu->spec == &snd_motu_spec_896)
+		return set_clock_rate_896(motu, rate);
 	else
 		return -ENXIO;
 }
@@ -137,10 +266,46 @@ static int get_clock_source_828(struct snd_motu *motu, enum snd_motu_clock_sourc
 	return 0;
 }
 
+static int get_clock_source_896(struct snd_motu *motu, enum snd_motu_clock_source *src)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg);
+
+	switch (data & CLK_896_STATUS_MASK_SRC) {
+	case CLK_896_STATUS_FLAG_SRC_INTERNAL:
+		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
+		break;
+	case CLK_896_STATUS_FLAG_SRC_ADAT_ON_OPT:
+		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
+		break;
+	case CLK_896_STATUS_FLAG_SRC_AESEBU:
+		*src = SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR;
+		break;
+	case CLK_896_STATUS_FLAG_SRC_WORD:
+		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
+		break;
+	case CLK_896_STATUS_FLAG_SRC_ADAT_ON_DSUB:
+		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
 int snd_motu_protocol_v1_get_clock_source(struct snd_motu *motu, enum snd_motu_clock_source *src)
 {
 	if (motu->spec == &snd_motu_spec_828)
 		return get_clock_source_828(motu, src);
+	else if (motu->spec == &snd_motu_spec_896)
+		return get_clock_source_896(motu, src);
 	else
 		return -ENXIO;
 }
@@ -169,10 +334,31 @@ static int switch_fetching_mode_828(struct snd_motu *motu, bool enable)
 	return snd_motu_transaction_write(motu, CLK_828_STATUS_OFFSET, &reg, sizeof(reg));
 }
 
+static int switch_fetching_mode_896(struct snd_motu *motu, bool enable)
+{
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg);
+
+	data &= ~(CLK_896_STATUS_FLAG_FETCH_ENABLE | CLK_896_STATUS_FLAG_MAIN_TO_HP);
+	if (enable)
+		data |= (CLK_896_STATUS_FLAG_FETCH_ENABLE | CLK_896_STATUS_FLAG_MAIN_TO_HP);
+
+	reg = cpu_to_be32(data);
+	return snd_motu_transaction_write(motu, CLK_896_STATUS_OFFSET, &reg, sizeof(reg));
+}
+
 int snd_motu_protocol_v1_switch_fetching_mode(struct snd_motu *motu, bool enable)
 {
 	if (motu->spec == &snd_motu_spec_828)
 		return switch_fetching_mode_828(motu, enable);
+	else if (motu->spec == &snd_motu_spec_896)
+		return switch_fetching_mode_896(motu, enable);
 	else
 		return -ENXIO;
 }
@@ -204,6 +390,27 @@ static int detect_packet_formats_828(struct snd_motu *motu)
 	return 0;
 }
 
+static int detect_packet_formats_896(struct snd_motu *motu)
+{
+	// 24bit PCM frames follow to source packet header without message chunk.
+	motu->tx_packet_formats.pcm_byte_offset = 4;
+	motu->rx_packet_formats.pcm_byte_offset = 4;
+
+	// No message chunk in data block.
+	motu->tx_packet_formats.msg_chunks = 0;
+	motu->rx_packet_formats.msg_chunks = 0;
+
+	// Always enable optical interface for ADAT signal since the device have no registers
+	// to refer to current configuration.
+	motu->tx_packet_formats.pcm_chunks[0] += 8;
+	motu->tx_packet_formats.pcm_chunks[1] += 8;
+
+	motu->rx_packet_formats.pcm_chunks[0] += 8;
+	motu->rx_packet_formats.pcm_chunks[1] += 8;
+
+	return 0;
+}
+
 int snd_motu_protocol_v1_cache_packet_formats(struct snd_motu *motu)
 {
 	memcpy(motu->tx_packet_formats.pcm_chunks, motu->spec->tx_fixed_pcm_chunks,
@@ -213,6 +420,8 @@ int snd_motu_protocol_v1_cache_packet_formats(struct snd_motu *motu)
 
 	if (motu->spec == &snd_motu_spec_828)
 		return detect_packet_formats_828(motu);
+	else if (motu->spec == &snd_motu_spec_896)
+		return detect_packet_formats_896(motu);
 	else
 		return 0;
 }
@@ -223,3 +432,9 @@ const struct snd_motu_spec snd_motu_spec_828 = {
 	.tx_fixed_pcm_chunks = {10, 0, 0},
 	.rx_fixed_pcm_chunks = {10, 0, 0},
 };
+
+const struct snd_motu_spec snd_motu_spec_896 = {
+	.name = "896",
+	.tx_fixed_pcm_chunks = {10, 10, 0},
+	.rx_fixed_pcm_chunks = {10, 10, 0},
+};
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index add5f183dc1d..0cae670d711c 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -151,6 +151,7 @@ static void motu_bus_update(struct fw_unit *unit)
 
 static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000001, &snd_motu_spec_828),
+	SND_MOTU_DEV_ENTRY(0x000002, &snd_motu_spec_896),
 	SND_MOTU_DEV_ENTRY(0x000003, &snd_motu_spec_828mk2),
 	SND_MOTU_DEV_ENTRY(0x000009, &snd_motu_spec_traveler),
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 13e2637a0330..a3deabdf9e34 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -123,6 +123,7 @@ struct snd_motu_spec {
 };
 
 extern const struct snd_motu_spec snd_motu_spec_828;
+extern const struct snd_motu_spec snd_motu_spec_896;
 
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
 extern const struct snd_motu_spec snd_motu_spec_traveler;
-- 
2.30.2

