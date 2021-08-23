Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C23F4706
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 10:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8924F15DC;
	Mon, 23 Aug 2021 10:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8924F15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629709169;
	bh=kC0MJH+gGdxAImctJfQLVroCZH3BgN76/Yz4otYzL0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EW1IodC3Wj0uUoujrtF/YspFj3xsVwUShuBDLTwwmrGvQtZ7T3aV+BTMeLkTmi5cf
	 DG+p2mglVuVsK2OB/3pIJeSXGHykltyHyNPV8nOvWAayfuwd0zaBxP0Bobqn7eahfx
	 iNXeu3jN9fjlBr0buL2fLflCNWdyqlJ7LTypHHjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D318AF80229;
	Mon, 23 Aug 2021 10:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65B44F80229; Mon, 23 Aug 2021 10:58:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90E62F8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 10:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E62F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="6ll3UkNc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IuI0z6OF"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 66CBB5C0037;
 Mon, 23 Aug 2021 04:57:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 23 Aug 2021 04:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=Ul19e5aCwC2RcXK3rGhi/edYfz
 gZoZzce/nDZQevyUw=; b=6ll3UkNcv3duodxC6brUOln0at7UOfg2jQbKsN5McZ
 pgbwcEA91bTFe4u5X+K1fyXW/Oa2RgZMuij4zI+c+aWiUIqp9Nzb1GxOQkp/wcKu
 i8BT3E0W/AChBZAuFj10r4gGf3vZkehALbqgWisrqJ48bPeKMQjRrqyLVxPyezzA
 LjpHU54F/fsf3CcqfLhzIefpD2vX9zxeQePi4YYbQQWRC0T7Jr9jmZr20qkhDRLV
 rcSP/pAN2A5ulViQF9wSg0gMKnONlgWLPFgxfE8CKDAy/ESAr49M4U/ZenkUJjlz
 OQClP/Oc6uE39RiMgC2MFHxHtlvZZqgIHGuAaQOW1U5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ul19e5aCwC2RcXK3r
 Ghi/edYfzgZoZzce/nDZQevyUw=; b=IuI0z6OFS8xDabXDS1zFCMBBO64tG1UHE
 pmsojNxoHLztE0ZEZYq47TzYKLq/Ii7weGL4NC8NqBc6sLWuKpCtCs8sryTYJk7y
 VSLgyCnzDSWVy1cZ9uGm11N7GVwZLN18bei2GwAoQAkzbpU7K7lIPFkoGC7pA3wB
 T5WIO25KRmK668oK4BraMP6cQacXTnEK/t2LbZXc7WMkpjND4pTvS9jKJ3iIASr9
 5tdPD43MBk6xix94LqJKPAeHXeH608LKboQmcPw2EvfustALpH6Ws6DGg3SsuT4M
 pN1rniARWW4X0kDqxWCTjMsW6yQRaCW8NmBv9oulPQ7ky6c3IJBvw==
X-ME-Sender: <xms:CWMjYQQ4KVxbwAJpNKMCxriErxze2ILDpPAt886YaAHwredyUmLTfQ>
 <xme:CWMjYdyNhqly-yogIWXDg4dKbHg4cRtVbLj9a9BetM1XmEqDpwJFcvlIo8yFILVMi
 iRo5cA7fpdjxnLTRrU>
X-ME-Received: <xmr:CWMjYd1m7peuSDAlNkRkCeWokLkZkoJT_fA6RpqkDXLZDu4aKWb-d8gmym7M35aHSlCd1kD1NVTWudzFF8y5RAdNWolPlf6d8wn-Bczk7cElVw-Vrj7P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:CWMjYUDGi58uDKhsCixTd2JW2P5u7lJD23y22ep9hFywzG5ceuf7HQ>
 <xmx:CWMjYZit5AEhOlpTHcruyPzz6RpnHoAvHeurjiIHYv0K5FhMG2bWxw>
 <xmx:CWMjYQoWW5vv-0R9TgUYwRDriQPC_PLoek9CWlJR9evlkAMpYANxPQ>
 <xmx:CmMjYZZZvePPHnMJ3Od9PSa3i-B914JWS79bW4qekCDBU3HAVpRWUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 04:57:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: add support for MOTU 896HD
Date: Mon, 23 Aug 2021 17:57:41 +0900
Message-Id: <20210823085741.33864-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
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

Mark of the Unicorn (MOTU) shipped 896HD 2003 as one of models in second
generation of its FireWire series, and already discontinued it. The model
consists of below ICs:

 * Texas Instruments TSB41AB2
 * Phillips Semiconductors PDI1394L40
 * Altera cyclone EP1C3
 * Texas Instruments TMS320VC5402

It supports sampling transmission frequency up to 192.0 kHz. The packet
format differs depending on both of sampling transfer frequency and enabling
ADAT channels. The model doesn't support MIDI message transmission.

This commit adds support for it.

$ python3 crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  04101b66  bus_info_length 4, crc_length 16, crc 7014
404  31333934  bus_name "1394"
408  20001000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 0, max_rec 1 (4)
40c  0001f200  company_id 0001f2     |
410  0001dbce  device_id 000001dbce  | EUI-64 0001f2000001dbce

               root directory
               -----------------------------------------------------------------
414  0004c65c  directory_length 4, crc 50780
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  8d000006  --> eui-64 leaf at 438
424  d1000001  --> unit directory at 428

               unit directory at 428
               -----------------------------------------------------------------
428  0003dcc1  directory_length 3, crc 56513
42c  120001f2  specifier id
430  13000005  version
434  17102800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  000264f2  leaf_length 2, crc 25842
43c  0001f200  company_id 0001f2     |
440  0001dbce  device_id 000001dbce  | EUI-64 0001f2000001dbce

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 22 ++++++++++++++++++----
 sound/firewire/motu/motu.c             |  1 +
 sound/firewire/motu/motu.h             |  1 +
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 93d5df1ae550..2bd4485e4bc7 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -12,11 +12,11 @@
 #define  V2_CLOCK_RATE_SHIFT			3
 #define  V2_CLOCK_SRC_MASK			0x00000007
 #define  V2_CLOCK_SRC_SHIFT			0
-#define   V2_CLOCK_SRC_AESEBU_ON_XLR		0x07
+#define   V2_CLOCK_SRC_AESEBU_ON_XLR		0x07	// In Traveler.
 #define   V2_CLOCK_SRC_ADAT_ON_DSUB		0x05
 #define   V2_CLOCK_SRC_WORD_ON_BNC		0x04
 #define   V2_CLOCK_SRC_SPH			0x03
-#define   V2_CLOCK_SRC_SPDIF			0x02	// on either coaxial or optical
+#define   V2_CLOCK_SRC_SPDIF			0x02	// on either coaxial or optical. AES/EBU in 896HD.
 #define   V2_CLOCK_SRC_ADAT_ON_OPT		0x01
 #define   V2_CLOCK_SRC_INTERNAL			0x00
 #define  V2_CLOCK_FETCH_ENABLE			0x02000000
@@ -100,7 +100,9 @@ static int get_clock_source(struct snd_motu *motu, u32 data,
 		bool support_iec60958_on_opt = (motu->spec == &snd_motu_spec_828mk2 ||
 						motu->spec == &snd_motu_spec_traveler);
 
-		if (!support_iec60958_on_opt) {
+		if (motu->spec == &snd_motu_spec_896hd) {
+			*src = SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR;
+		} else if (!support_iec60958_on_opt) {
 			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 		} else {
 			__be32 reg;
@@ -129,6 +131,7 @@ static int get_clock_source(struct snd_motu *motu, u32 data,
 		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
 		break;
 	case V2_CLOCK_SRC_AESEBU_ON_XLR:
+		// For Traveler.
 		*src = SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR;
 		break;
 	default:
@@ -153,7 +156,7 @@ int snd_motu_protocol_v2_get_clock_source(struct snd_motu *motu,
 	return get_clock_source(motu, be32_to_cpu(reg), src);
 }
 
-// Expected for Traveler and 896HD, which implements Altera Cyclone EP1C3.
+// Expected for Traveler, which implements Altera Cyclone EP1C3.
 static int switch_fetching_mode_cyclone(struct snd_motu *motu, u32 *data,
 					bool enable)
 {
@@ -190,6 +193,9 @@ int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
 	if (motu->spec == &snd_motu_spec_828mk2) {
 		// 828mkII implements Altera ACEX 1K EP1K30. Nothing to do.
 		return 0;
+	} else if (motu->spec == &snd_motu_spec_896hd) {
+		// 896HD implements Altera Cyclone EP1C3 but nothing to do.
+		return 0;
 	} else {
 		__be32 reg;
 		u32 data;
@@ -274,6 +280,14 @@ const struct snd_motu_spec snd_motu_spec_828mk2 = {
 	.rx_fixed_pcm_chunks = {14, 14, 0},
 };
 
+const struct snd_motu_spec snd_motu_spec_896hd = {
+	.name = "896HD",
+	.protocol_version = SND_MOTU_PROTOCOL_V2,
+	// No support for MIDI.
+	.tx_fixed_pcm_chunks = {14, 14, 8},
+	.rx_fixed_pcm_chunks = {14, 14, 8},
+};
+
 const struct snd_motu_spec snd_motu_spec_traveler = {
 	.name = "Traveler",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 543136578c70..f65426238d4c 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -153,6 +153,7 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000001, &snd_motu_spec_828),
 	SND_MOTU_DEV_ENTRY(0x000002, &snd_motu_spec_896),
 	SND_MOTU_DEV_ENTRY(0x000003, &snd_motu_spec_828mk2),
+	SND_MOTU_DEV_ENTRY(0x000005, &snd_motu_spec_896hd),
 	SND_MOTU_DEV_ENTRY(0x000009, &snd_motu_spec_traveler),
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 73f36d1be515..f1a830b358d4 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -126,6 +126,7 @@ extern const struct snd_motu_spec snd_motu_spec_828;
 extern const struct snd_motu_spec snd_motu_spec_896;
 
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
+extern const struct snd_motu_spec snd_motu_spec_896hd;
 extern const struct snd_motu_spec snd_motu_spec_traveler;
 extern const struct snd_motu_spec snd_motu_spec_ultralite;
 extern const struct snd_motu_spec snd_motu_spec_8pre;
-- 
2.30.2

