Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE181CC7BD
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 09:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFD21679;
	Sun, 10 May 2020 09:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFD21679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589096908;
	bh=nWX84v6NCxNDYlOVr2y2cBhYAilf8+U/owMu9xgjEl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFrH/03exNmfunIpmaiWIAcffbu3Ex+NrDR3kn6SLdvj2ryZzKNHc+egcMYCIpk6/
	 QkowogB7s5Ltn9YHWtrDMfgSE/sLBaGMX+co+PKWJTEryDmC+TKywrIwvYy7lEKHVA
	 B32P64JlZAhWSd1Zv7mMjeY/RC9g9X7YzxxWaxGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B778F802DD;
	Sun, 10 May 2020 09:43:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D86F7F800BF; Sun, 10 May 2020 09:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2E8F8015A
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 09:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2E8F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="3LQUDFgx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tuOoSOrx"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A9B945C00E4;
 Sun, 10 May 2020 03:43:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 03:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9gcdKvGoyjNiS
 xMPNZzsxMy5gvrLaiyOGX+gRUURGB0=; b=3LQUDFgx2KtzzGQX5GQXhpea/Ougl
 HT4f42nxcpziUhDbL1BeyglsNCy9Vlu9iN3jVpaCkXJJ6FKG9HZ/VtYp0R/E90S9
 eNl5XLsclXX5474tWPuaGQLgMzu2Cfh4gBf5Ll11YkTtS6gXLUi2+SMAgDv6DTPL
 E6KZ3s7KxP5RLrTKSP5N8esBA5BHxAgG4rQ3lj+2/EJScC8sBZ3bImLArgvXTskJ
 IwIpTNV3DiJphrRobcdHBCu8C3MJvRkBZkzTizwczzC20uZhWR9TJ/gnXGdiAjDs
 ZbA7Ngdm/ygCPcosU6T5pfGDdBVjhMPyr7lSGozc9PgCcERBdinD9PUMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9gcdKvGoyjNiSxMPNZzsxMy5gvrLaiyOGX+gRUURGB0=; b=tuOoSOrx
 LzKQMycTaQ6NYGu6Dr19v5C9jLVkXmvQnoCl4VcC9BBfVhM5RWcArhmj4VDNRrkp
 FtkxLU68YOo5aEF23JoFsh6jimFh3F8dEGtOviXH/L54YyQo9FXA296CS/BhNAQv
 INEaXWpnb56Pq5MO6QsPCrrYry02w/0+f3wa1FWSpLWQpnakmGMBcS5a9I6xVA0v
 bk62129A32S9HGi3O/uF2aGIBe+5nqFQklnjDek6OWVfMFuFkVJ6tRBTONFrDc03
 bPLj4dLQG6kcXr3BdgQQCnDI9qc/muWi8852jEUsv6WJpCjRrRXOjW/Z4bxaevcL
 On751E4LLaDAXQ==
X-ME-Sender: <xms:kLC3XlzoMUK00-n1cS5De7rJ0RuAM-ti3D59XkK9uPiG1-4tjBHbow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kLC3XhXsgORFtrLoDAFwipyBpKIVyNQlyeTMKSFceAnZuA8kN6BwtA>
 <xmx:kLC3XsCxmyuJ0MPZ3MrTL96d5wti4_SN16hKZ5rPq5E40voJpCNH6g>
 <xmx:kLC3Xt1cJvEAOQaov7kt7YU9Sn12Gd3By_coPTC90GRS5HqdLynW6w>
 <xmx:kLC3XttcJTht2Gms7PGUZl04GVRnyvjHixNnqLqQplF5Xn2QE4_8JQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C9543066258;
 Sun, 10 May 2020 03:43:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 5/6] ALSA: fireface: add support for RME FireFace 802
Date: Sun, 10 May 2020 16:43:00 +0900
Message-Id: <20200510074301.116224-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
References: <20200510074301.116224-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
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

Fireface 802 was shipped by RME GmbH in 2014. This model supports later
protocol for management of isochronous communication and synchronization
of sampling transmission frequency.

This model consists of below ICs:
 * TI TSB41AB2
 * Xilinx Spartan-6 FPGA XC6SLX16
 * TI TMS320 C6747
 * SMSC USB3250

Especially, this model just supports IEEE 1394a, against its name which
evokes Fireface 800.

This commit adds support for Fireface 802 (tested). Userspace applications
can transfer PCM frames and MIDI messages via ALSA PCM/Rawmidi interface.
I note that 4 channels for ADAt1 and ADAT2 are disabled at higher sampling
transfer frequency since isochronous resources reservation fails due to
bandwidth limitation of IEEE 1394a.

The value read from LATTER_SYNC_STATUS register is slightly different
from the one of Fireface UCX. The higher 4 bits and lower 4 bits are
swapped within the same byte.

Without any assist of userspace application, transmitted MIDI messages
from the device are not going to be processed. For detail, please refer
to my comment in code of latter protocol.

$ python crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  0404ffff  bus_info_length 4, crc_length 4, crc 65535 (should be 26805)
404  31333934  bus_name "1394"
408  20008000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 0, max_rec 8 (512)
40c  000a3504  company_id 000a35     |
410  38077423  device_id 0438077423  | EUI-64 000a350438077423

               root directory
               -----------------------------------------------------------------
414  0005ffff  directory_length 5, crc 65535 (should be 9514)
418  0c0083c0  node capabilities per IEEE 1394
41c  03000a35  vendor
420  8100000b  --> descriptor leaf at 44c
424  8d000007  --> eui-64 leaf at 440
428  d1000001  --> unit directory at 42c

               unit directory at 42c
               -----------------------------------------------------------------
42c  0004ffff  directory_length 4, crc 65535 (should be 45134)
430  12000a35  specifier id
434  13000005  version
438  17101800  model
43c  81000008  --> descriptor leaf at 45c

               eui-64 leaf at 440
               -----------------------------------------------------------------
440  0002ffff  leaf_length 2, crc 65535 (should be 60131)
444  000a3504  company_id 000a35     |
448  38077423  device_id 0438077423  | EUI-64 000a350438077423

               descriptor leaf at 44c
               -----------------------------------------------------------------
44c  0003ffff  leaf_length 3, crc 65535 (should be 469)
450  00000000  textual descriptor
454  00000000  minimal ASCII
458  524d4521  "RME!"

               descriptor leaf at 45c
               -----------------------------------------------------------------
45c  0005ffff  leaf_length 5, crc 65535 (should be 10561)
460  00000000  textual descriptor
464  00000000  minimal ASCII
468  46697265  "Fire"
46c  66616365  "face"
470  20383032  " 802"

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig                       |  1 +
 sound/firewire/fireface/ff-protocol-latter.c | 46 ++++++++++++++------
 sound/firewire/fireface/ff.c                 | 24 ++++++++++
 sound/firewire/fireface/ff.h                 |  1 +
 4 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index 995c2cefc222..4f39ef924a1a 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -165,5 +165,6 @@ config SND_FIREFACE
 	  * Fireface 400
 	  * Fireface 800
 	  * Fireface UCX
+	  * Fireface 802
 
 endif # SND_FIREWIRE
diff --git a/sound/firewire/fireface/ff-protocol-latter.c b/sound/firewire/fireface/ff-protocol-latter.c
index 76ae568489ef..ea885e725950 100644
--- a/sound/firewire/fireface/ff-protocol-latter.c
+++ b/sound/firewire/fireface/ff-protocol-latter.c
@@ -16,7 +16,8 @@
 #define LATTER_SYNC_STATUS	0x0000801c0000ULL
 
 static int parse_clock_bits(u32 data, unsigned int *rate,
-			    enum snd_ff_clock_src *src)
+			    enum snd_ff_clock_src *src,
+			    enum snd_ff_unit_version unit_version)
 {
 	static const struct {
 		unsigned int rate;
@@ -43,6 +44,11 @@ static int parse_clock_bits(u32 data, unsigned int *rate,
 	};
 	int i;
 
+	if (unit_version != SND_FF_UNIT_VERSION_UCX) {
+		// e.g. 0x00fe0f20 but expected 0x00eff002.
+		data = ((data & 0xf0f0f0f0) >> 4) | ((data & 0x0f0f0f0f) << 4);
+	}
+
 	for (i = 0; i < ARRAY_SIZE(rate_entries); ++i) {
 		rate_entry = rate_entries + i;
 		if ((data & 0x0f000000) == rate_entry->flag) {
@@ -79,7 +85,7 @@ static int latter_get_clock(struct snd_ff *ff, unsigned int *rate,
 		return err;
 	data = le32_to_cpu(reg);
 
-	return parse_clock_bits(data, rate, src);
+	return parse_clock_bits(data, rate, src, ff->unit_version);
 }
 
 static int latter_switch_fetching_mode(struct snd_ff *ff, bool enable)
@@ -181,14 +187,30 @@ static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 	__le32 reg;
 	int err;
 
-	if (rate >= 32000 && rate <= 48000)
-		flag = 0x92;
-	else if (rate >= 64000 && rate <= 96000)
-		flag = 0x8e;
-	else if (rate >= 128000 && rate <= 192000)
-		flag = 0x8c;
-	else
-		return -EINVAL;
+	if (ff->unit_version == SND_FF_UNIT_VERSION_UCX) {
+		// For Fireface UCX. Always use the maximum number of data
+		// channels in data block of packet.
+		if (rate >= 32000 && rate <= 48000)
+			flag = 0x92;
+		else if (rate >= 64000 && rate <= 96000)
+			flag = 0x8e;
+		else if (rate >= 128000 && rate <= 192000)
+			flag = 0x8c;
+		else
+			return -EINVAL;
+	} else {
+		// For Fireface 802. Due to bandwidth limitation on
+		// IEEE 1394a (400 Mbps), Analog 1-12 and AES are available
+		// without any ADAT at quadruple speed.
+		if (rate >= 32000 && rate <= 48000)
+			flag = 0x9e;
+		else if (rate >= 64000 && rate <= 96000)
+			flag = 0x96;
+		else if (rate >= 128000 && rate <= 192000)
+			flag = 0x8e;
+		else
+			return -EINVAL;
+	}
 
 	if (generation != fw_parent_device(ff->unit)->card->generation) {
 		err = fw_iso_resources_update(&ff->tx_resources);
@@ -207,8 +229,6 @@ static int latter_begin_session(struct snd_ff *ff, unsigned int rate)
 	if (err < 0)
 		return err;
 
-	// Always use the maximum number of data channels in data block of
-	// packet.
 	reg = cpu_to_le32(flag);
 	return snd_fw_transaction(ff->unit, TCODE_WRITE_QUADLET_REQUEST,
 				  LATTER_ISOC_START, &reg, sizeof(reg), 0);
@@ -263,7 +283,7 @@ static void latter_dump_status(struct snd_ff *ff, struct snd_info_buffer *buffer
 		}
 	}
 
-	err = parse_clock_bits(data, &rate, &src);
+	err = parse_clock_bits(data, &rate, &src, ff->unit_version);
 	if (err < 0)
 		return;
 	label = snd_ff_proc_get_clk_label(src);
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index dd3cd25f2e3b..e4140116f3cc 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -20,6 +20,7 @@ static void name_card(struct snd_ff *ff)
 		[SND_FF_UNIT_VERSION_FF800]	= "Fireface800",
 		[SND_FF_UNIT_VERSION_FF400]	= "Fireface400",
 		[SND_FF_UNIT_VERSION_UCX]	= "FirefaceUCX",
+		[SND_FF_UNIT_VERSION_802]	= "Fireface802",
 	};
 	const char *name;
 
@@ -186,6 +187,17 @@ static const struct snd_ff_spec spec_ucx = {
 	.midi_rx_addrs = {0xffff00000030ull, 0xffff00000030ull},
 };
 
+static const struct snd_ff_spec spec_802 = {
+	.pcm_capture_channels = {30, 22, 14},
+	.pcm_playback_channels = {30, 22, 14},
+	.midi_in_ports = 1,
+	.midi_out_ports = 1,
+	.protocol = &snd_ff_protocol_latter,
+	.midi_high_addr = 0xffff00000034ull,
+	.midi_addr_range = 0x80,
+	.midi_rx_addrs = {0xffff00000030ull, 0xffff00000030ull},
+};
+
 static const struct ieee1394_device_id snd_ff_id_table[] = {
 	/* Fireface 800 */
 	{
@@ -223,6 +235,18 @@ static const struct ieee1394_device_id snd_ff_id_table[] = {
 		.model_id	= 0x101800,
 		.driver_data	= (kernel_ulong_t)&spec_ucx,
 	},
+	// Fireface 802.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_SPECIFIER_ID |
+				  IEEE1394_MATCH_VERSION |
+				  IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_RME,
+		.specifier_id	= OUI_RME,
+		.version	= SND_FF_UNIT_VERSION_802,
+		.model_id	= 0x101800,
+		.driver_data	= (kernel_ulong_t)&spec_802,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(ieee1394, snd_ff_id_table);
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 0c4fe7cff84d..1282a57c009f 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -38,6 +38,7 @@ enum snd_ff_unit_version {
 	SND_FF_UNIT_VERSION_FF800	= 0x000001,
 	SND_FF_UNIT_VERSION_FF400	= 0x000002,
 	SND_FF_UNIT_VERSION_UCX		= 0x000004,
+	SND_FF_UNIT_VERSION_802		= 0x000005,
 };
 
 enum snd_ff_stream_mode {
-- 
2.25.1

