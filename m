Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E66951D951F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 181E3172E;
	Tue, 19 May 2020 13:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 181E3172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887168;
	bh=4iFNj1AVM/bjaiCEmx36tLprhZuI0Bc3HlqGCZh1S2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kDR2cECCO9iRKZR2vvArCqDO0RoYmS1dmhvlGv4YRHmhXG+ebTvlmjcTngJhLST0U
	 jzkwKlv7enMpBXaxRo3G3R9XZT2AOyqY+7FeWjo5cTDU48hVsRwnOMd5h9e24x3f8N
	 yVQ/2ZUGnkpvTBzvW/NWFVvh2oI05OoakQRmNRio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B697FF801A3;
	Tue, 19 May 2020 13:17:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 316EDF80259; Tue, 19 May 2020 13:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4313FF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4313FF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vQkTmmmV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="f61WyAgm"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FA6C5C0131;
 Tue, 19 May 2020 07:16:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=V13BgHMn5wjej
 6zb/nGoqRCDSmFF1fQ4CWyHmKD0qGc=; b=vQkTmmmVRM1Wzeu9XpeHxSLSRZHM6
 x1NmTOxydVerIfQQO/38gGWcMDEPXDCYsGIfygVYFxXOBe0cikDD1rDlUPfOg0Sr
 +QxAl4L5kBg0B4wIRs225K1HyZ01C/SZ0yyqBOhk9gV3cRMhvk/WsANWS2aBsnaK
 WlaRULBqUgcyda+OqIW70d44RgGTi2XRzSr7YhFNrubECrBfKkyIrkWpbsTPSBvh
 obd2t6Cocp7kx6lekWeSPYWhL9xAwyhIPuFDr1+Lrg7DEj5QChji6U54sYIvRy/Q
 F+pNeVVSgEsGAgcKX/dx00qRlThoy4Zb+m/Fz5f277LqjfHBuIQyJJ06Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=V13BgHMn5wjej6zb/nGoqRCDSmFF1fQ4CWyHmKD0qGc=; b=f61WyAgm
 Q9AxAnoChGV8UVINHOP+GWqYksnlgEwU71G81lTEOJ5zpu13VnO5aXl0rS3Ud6Wu
 wlapM2hFB4p1VsfjSY2gHaO8m0JCeiruwKkBASC//eUEQ6Fund9veuYhMPDqnwcp
 qj16jiaCCTuzcUoiEdzG2u32J9XVreC+26J2JXIm/S2nMzqfCq4O7mDRWfrRAGK1
 FDTQDOZ59SL9fZ9aOMFY+dqCA3o9J3zjxfdTa1mW8quwkYixNin1T2j7cjymbW9j
 9wrwL9DWa1BSuGKx828JZ9A8ECyjj8miqwicoW0lWEh6lz6wkI6U1hCUf1lBYRMz
 sO/cok6J/P2Nzg==
X-ME-Sender: <xms:IMDDXnfEosIurVdpH47tOTQXnwVkaKoQq1bykFnMsoZUfDF9eL8y-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:IMDDXtOserPkyJjIOrmEVM94p7StNlF8MH-zm03LHGiUYbhvXYiLhA>
 <xmx:IMDDXgiAZeZI3ajpaOJedEpELg8y0g1sSw3POuE4-AwVCXYo-7X_YA>
 <xmx:IMDDXo8fgoYAhTXDVtg84b4IvIiAJJgHLFajaoXAMWY2Y8FSCr04eg>
 <xmx:IMDDXg6Hasua0SkS7cPWS3NUrBsyrrRFXPmXVO_1hGvvW2Uw-Gvwfg>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE9F7328005E;
 Tue, 19 May 2020 07:16:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 01/14] ALSA: firewire-motu: move spec data to v2 protocol file
Date: Tue, 19 May 2020 20:16:28 +0900
Message-Id: <20200519111641.123211-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
References: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The most of members in spec data is used in each protocol file. It's
better to capsulate the data to the file.

This commit moves the data to the file for protocol version 2.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 57 +++++++++++++++++++++++
 sound/firewire/motu/motu.c             | 63 ++------------------------
 sound/firewire/motu/motu.h             |  3 ++
 3 files changed, 63 insertions(+), 60 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 619b6ae73f62..ed71c08e5942 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -300,3 +300,60 @@ const struct snd_motu_protocol snd_motu_protocol_v2 = {
 	.switch_fetching_mode	= v2_switch_fetching_mode,
 	.cache_packet_formats	= v2_cache_packet_formats,
 };
+
+const struct snd_motu_spec snd_motu_spec_828mk2 = {
+	.name = "828mk2",
+	.protocol = &snd_motu_protocol_v2,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
+		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
+		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+
+	.analog_in_ports = 8,
+	.analog_out_ports = 8,
+};
+
+const struct snd_motu_spec snd_motu_spec_traveler = {
+	.name = "Traveler",
+	.protocol = &snd_motu_protocol_v2,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_HAS_AESEBU_IFACE |
+		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
+		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+
+	.analog_in_ports = 8,
+	.analog_out_ports = 8,
+};
+
+const struct snd_motu_spec snd_motu_spec_ultralite = {
+	.name = "UltraLite",
+	.protocol = &snd_motu_protocol_v2,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK | // padding.
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
+	.analog_in_ports = 8,
+	.analog_out_ports = 8,
+};
+
+const struct snd_motu_spec snd_motu_spec_8pre = {
+	.name = "8pre",
+	.protocol = &snd_motu_protocol_v2,
+	// In tx, use coax chunks for mix-return 1/2. In rx, use coax chunks for
+	// dummy 1/2.
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
+		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
+		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
+	.analog_in_ports = 8,
+	.analog_out_ports = 2,
+};
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index f2080d720aa9..b3533526f7e5 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -172,63 +172,6 @@ static void motu_bus_update(struct fw_unit *unit)
 	snd_motu_transaction_reregister(motu);
 }
 
-const struct snd_motu_spec snd_motu_spec_828mk2 = {
-	.name = "828mk2",
-	.protocol = &snd_motu_protocol_v2,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
-
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
-};
-
-static const struct snd_motu_spec motu_traveler = {
-	.name = "Traveler",
-	.protocol = &snd_motu_protocol_v2,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_HAS_AESEBU_IFACE |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
-
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
-};
-
-static const struct snd_motu_spec motu_ultralite = {
-	.name = "UltraLite",
-	.protocol = &snd_motu_protocol_v2,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK | // padding.
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
-};
-
-static const struct snd_motu_spec motu_8pre = {
-	.name = "8pre",
-	.protocol = &snd_motu_protocol_v2,
-	// In tx, use coax chunks for mix-return 1/2. In rx, use coax chunks for
-	// dummy 1/2.
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
-	.analog_in_ports = 8,
-	.analog_out_ports = 2,
-};
-
 static const struct snd_motu_spec motu_828mk3 = {
 	.name = "828mk3",
 	.protocol = &snd_motu_protocol_v3,
@@ -284,9 +227,9 @@ static const struct snd_motu_spec motu_4pre = {
 
 static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000003, &snd_motu_spec_828mk2),
-	SND_MOTU_DEV_ENTRY(0x000009, &motu_traveler),
-	SND_MOTU_DEV_ENTRY(0x00000d, &motu_ultralite),
-	SND_MOTU_DEV_ENTRY(0x00000f, &motu_8pre),
+	SND_MOTU_DEV_ENTRY(0x000009, &snd_motu_spec_traveler),
+	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
+	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
 	SND_MOTU_DEV_ENTRY(0x000015, &motu_828mk3),	/* FireWire only. */
 	SND_MOTU_DEV_ENTRY(0x000035, &motu_828mk3),	/* Hybrid. */
 	SND_MOTU_DEV_ENTRY(0x000033, &motu_audio_express),
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 6efbde405a0d..ead6cc840d50 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -131,6 +131,9 @@ extern const struct snd_motu_protocol snd_motu_protocol_v2;
 extern const struct snd_motu_protocol snd_motu_protocol_v3;
 
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
+extern const struct snd_motu_spec snd_motu_spec_traveler;
+extern const struct snd_motu_spec snd_motu_spec_ultralite;
+extern const struct snd_motu_spec snd_motu_spec_8pre;
 
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
-- 
2.25.1

