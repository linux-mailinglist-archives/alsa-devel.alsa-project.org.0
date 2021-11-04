Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940474451F4
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 12:08:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D1EF167E;
	Thu,  4 Nov 2021 12:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D1EF167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636024089;
	bh=HSB7EXnuk7Xa6ZXQLDYYhVUnLMa4s+5hHo8GgAMsQPc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D1IKdPq135oTYus6B6EIia+4G7Uj2zwdTzBagTG5xMzwq8TZderBUha2kXN/FeNyF
	 ZmvPVQXf5I2CllMyoO3VeRIadN8SNVDa2zyjJwYVk/O6pTE9TliEn2CAyBx9Z09ETf
	 m5Ie6fuXjGj6TexiMicW9XWN5m7cEfe6adqkENj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79916F80125;
	Thu,  4 Nov 2021 12:06:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98FBBF80224; Thu,  4 Nov 2021 12:06:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A5FF80224
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 12:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A5FF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VhrlMvZV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MU+suAhG"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 091E73200DA8;
 Thu,  4 Nov 2021 07:06:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 04 Nov 2021 07:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=qG08lJlzhJR5aKYHERrfAdml3s
 +JQRLMKpdZZ71pb6Q=; b=VhrlMvZVGROS0GPon9VLSSe+WYGg/YbLn/3OzWmgx0
 YdckwV/B1CWKPEg6+kHHEOoxAioHKEEu956VKG8rNrNeVyDkjARzupUGwE+4bd4y
 Y9f0CmkcwETjQfOv90TcR1uw5RVAehdswrLCq/jbPbZVkGYY2e50/HsyWTLdtoIW
 lNiVrZo83fwBWIvJ4Zcy0620xTk623kBkbxwpeMYVUC9+NjN5jcebBe3QRDiw7wE
 XfP497uBkibbYA9mysQb35s/EYYxyBwIrUZD1E4/wSbEIfMS4TazObb4ShHFO/V3
 /+XNOt6QRLCe1BMw+G22z56JBeoHv/i1m+6BV5P8XksA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qG08lJlzhJR5aKYHE
 RrfAdml3s+JQRLMKpdZZ71pb6Q=; b=MU+suAhGUjPGmpFre/ku8U8xwKR/y8UtK
 HSzKwikUtQkCWgaKc5NB60jiSsUbi+CzVcOIwqkKgauQhb+xPl6tKnEP0aVt2nyi
 RBXJA11jtDtCQPyy9803mo7cr+e4/EgjlsEtzE7AwnXZxhn2hp626as3jynlc8CV
 2f/PGu9pHRp1eIkpvcITQKQPXvwiiNQA75H5kZyrvxuh9PemF1cAkk7qDS8kXRDB
 KEDCn1to7xmeK8VWmlel2dPg++iiwiSzAx183nhlCZ1M6tNjMrLGtIgEhlIgg6k3
 m6SAAOBGY1O4OaJh3wemAK0wr1C+rGHSYztoTXvqUkUhiesCoRS7A==
X-ME-Sender: <xms:t76DYfcQyjhPUqF8svEEjqSFAPR2c4Mg_E7o5oYG6cqPfJn1ESiHMw>
 <xme:t76DYVM_8dYCcTiOudNys3q_hNw6xvxwdxCdZH_SRSzoAXqsgqHI0X-lZSy38RkEy
 MgCBEgTqIU9fnqWoQs>
X-ME-Received: <xmr:t76DYYjggJXlD4utN5JIol91RVUgrBE8YeD2UFfsHHPs4HvEO-rGTFOw7K12iLVJ6YYHnEKQxVqTOk57V7zYYpbtpuaChIU3v64OQqp5H1qRSOaWKTt7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtddtke
 fgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:t76DYQ823aPLpvM0t9Zggg3GuUgyZ5dAqklcIShoNm6An8UMi5fCiA>
 <xmx:t76DYbtC2ZezcGP8Hy_Q95T8R-bXFjwLxUeCSqqjgwmqrOoPt4gn_A>
 <xmx:t76DYfEHwAiYo00BxlIITrAqYg7VnA-L3yKEg6PNDnOENayKJROezA>
 <xmx:uL6DYUVUmcB5zSu9JhD_dFuxhBw3m11uUMaI5d_y5nVv3zMVPshiYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 07:06:30 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: add support for MOTU Traveler mk3
Date: Thu,  4 Nov 2021 20:06:27 +0900
Message-Id: <20211104110627.94469-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
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

Mark of the Unicorn (MOTU) shipped Traveler mk3 as one of models in third
generation of its FireWire series, and discontinued it already. The model
consists of below ICs:

 * Texas Instruments TSB41AB2
 * Phillips Semiconductors PDI1394L40
 * Altera cyclone EP1C3
 * Texas Instruments TMS320VC5402

It supports sampling transfer frequency up to 192.0 kHz. The packet
format differs depending on both of current sampling transfer frequency
and whether to enable ADAT channels in rx/tx packets. The model supports
transmission of PCM frames as well as MIDI messages.

The model supports command mechanism to configure internal DSP. Hardware
meter information is available in the first 2 chunks of each data block
of tx packet.

This commit adds support for it.

$ cd linux-firewire-tools/src
$ python crpp < /sys/bus/firewire/devices/fw1/config_rom
               ROM header and bus information block
               -----------------------------------------------------------------
400  0410af0a  bus_info_length 4, crc_length 16, crc 44810
404  31333934  bus_name "1394"
408  20ff7000  irmc 0, cmc 0, isc 1, bmc 0, cyc_clk_acc 255, max_rec 7 (256)
40c  0001f200  company_id 0001f2     |
410  00090911  device_id 0000090911  | EUI-64 0001f20000090911

               root directory
               -----------------------------------------------------------------
414  0004ef04  directory_length 4, crc 61188
418  030001f2  vendor
41c  0c0083c0  node capabilities per IEEE 1394
420  d1000002  --> unit directory at 428
424  8d000005  --> eui-64 leaf at 438

               unit directory at 428
               -----------------------------------------------------------------
428  00031733  directory_length 3, crc 5939
42c  120001f2  specifier id
430  1300001b  version
434  17102800  model

               eui-64 leaf at 438
               -----------------------------------------------------------------
438  00028484  leaf_length 2, crc 33924
43c  0001f200  company_id 0001f2     |
440  00090911  device_id 0000090911  | EUI-64 0001f20000090911

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 22 +++++++++++++++++++---
 sound/firewire/motu/motu.c             |  1 +
 sound/firewire/motu/motu.h             |  1 +
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 05608e8ca0bc..1371f38505d0 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -16,6 +16,7 @@
 #define   V3_CLOCK_SRC_INTERNAL		0x00
 #define   V3_CLOCK_SRC_WORD_ON_BNC	0x01
 #define   V3_CLOCK_SRC_SPH		0x02
+#define   V3_CLOCK_SRC_AESEBU_ON_XLR	0x08
 #define   V3_CLOCK_SRC_SPDIF_ON_COAX	0x10
 #define   V3_CLOCK_SRC_OPT_IFACE_A	0x18
 #define   V3_CLOCK_SRC_OPT_IFACE_B	0x19
@@ -126,6 +127,9 @@ int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
 	case V3_CLOCK_SRC_SPH:
 		*src = SND_MOTU_CLOCK_SOURCE_SPH;
 		break;
+	case V3_CLOCK_SRC_AESEBU_ON_XLR:
+		*src = SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR;
+		break;
 	case V3_CLOCK_SRC_SPDIF_ON_COAX:
 		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 		break;
@@ -185,7 +189,7 @@ int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
 					  sizeof(reg));
 }
 
-static int detect_packet_formats_828mk3(struct snd_motu *motu, u32 data)
+static int detect_packet_formats_dual_opt_iface(struct snd_motu *motu, u32 data)
 {
 	if (data & V3_ENABLE_OPT_IN_IFACE_A) {
 		if (data & V3_NO_ADAT_OPT_IN_IFACE_A) {
@@ -255,8 +259,10 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 	       motu->spec->rx_fixed_pcm_chunks,
 	       sizeof(motu->rx_packet_formats.pcm_chunks));
 
-	if (motu->spec == &snd_motu_spec_828mk3_fw || motu->spec == &snd_motu_spec_828mk3_hybrid)
-		return detect_packet_formats_828mk3(motu, data);
+	if (motu->spec == &snd_motu_spec_828mk3_fw ||
+	    motu->spec == &snd_motu_spec_828mk3_hybrid ||
+	    motu->spec == &snd_motu_spec_traveler_mk3)
+		return detect_packet_formats_dual_opt_iface(motu, data);
 	else
 		return 0;
 }
@@ -281,6 +287,16 @@ const struct snd_motu_spec snd_motu_spec_828mk3_hybrid = {
 	.rx_fixed_pcm_chunks = {14, 14, 14},	// Additional 4 dummy chunks at higher rate.
 };
 
+const struct snd_motu_spec snd_motu_spec_traveler_mk3 = {
+	.name = "TravelerMk3",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
+	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_COMMAND_DSP,
+	.tx_fixed_pcm_chunks = {18, 14, 10},
+	.rx_fixed_pcm_chunks = {14, 14, 10},
+};
+
 const struct snd_motu_spec snd_motu_spec_ultralite_mk3 = {
 	.name = "UltraLiteMk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 5fc7ae475537..080728dd278f 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -169,6 +169,7 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
 	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3_fw), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x000019, &snd_motu_spec_ultralite_mk3), // FireWire only.
+	SND_MOTU_DEV_ENTRY(0x00001b, &snd_motu_spec_traveler_mk3),
 	SND_MOTU_DEV_ENTRY(0x000030, &snd_motu_spec_ultralite_mk3), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3_hybrid), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 79704ae6a73e..6ad1feab478b 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -138,6 +138,7 @@ extern const struct snd_motu_spec snd_motu_spec_8pre;
 
 extern const struct snd_motu_spec snd_motu_spec_828mk3_fw;
 extern const struct snd_motu_spec snd_motu_spec_828mk3_hybrid;
+extern const struct snd_motu_spec snd_motu_spec_traveler_mk3;
 extern const struct snd_motu_spec snd_motu_spec_ultralite_mk3;
 extern const struct snd_motu_spec snd_motu_spec_audio_express;
 extern const struct snd_motu_spec snd_motu_spec_4pre;
-- 
2.32.0

