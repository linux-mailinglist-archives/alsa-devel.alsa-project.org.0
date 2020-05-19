Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7191D9526
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38975168F;
	Tue, 19 May 2020 13:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38975168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887266;
	bh=ImtTN9USe2m7HtFLbLK7BdnLFpKOihzuywwg1uiBVBU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJNAaTsHsbAwAF8u9/UxTlkRYIk3NcqKyPCObqgMWZ11IS74qfEIpOZOMy6FCl/Ss
	 9eFytGu2XVtDztMX1zBjqdCh4plilUc5unulFxakpBafwZOKFbIpwhjksOry6S8cZM
	 DRCWaq27YPK9ug2jnE+JjHaQyAnDkji2aD+UhGRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 787F0F8025E;
	Tue, 19 May 2020 13:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F92AF80292; Tue, 19 May 2020 13:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0BCFF801A3
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0BCFF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vM0rsoP3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qL6R0th3"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CB2895C0132;
 Tue, 19 May 2020 07:16:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VwXi+fzIMYj+r
 nqBMXnd6IpSL+bWCpTy8F5gbfX8d8s=; b=vM0rsoP35cSSbGcXLv2OwZuJ8FT7/
 k90RuYbKNkqMAWoP2iuH2sH8xb7G7p6hFDy/d4ma8ueMCDh2lyk/GzQw2Qy2ZDut
 hXZtd1zL/swEo7kFd7iWJ3YbXCgjdC3UPEJB61rh+HBA/4+I0pdkmhuxI9m6NPen
 LWVd/BNzoXXCWbY/ACBEzIvAU3By5vyiA1fU7weld7wHFo2nz/KRC9YTzToaRvfm
 Osas1cJ4WFVlhA1jsLWeK/VU74ZUycJet6vy15zFhSOVw8btibT7z5Z1wfZV1DJu
 VuR4VvlEMjXcd2wXGdjnaS2OMSi3399Zmyuika7JQE9lieKDnUZOT0frg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VwXi+fzIMYj+rnqBMXnd6IpSL+bWCpTy8F5gbfX8d8s=; b=qL6R0th3
 9SZNsH7wcsU1miBwUxZSqQZS/KJIx6BBomNAFH2rIyvCgobekUudSaDTZqv2sAv9
 zHYwTwp+wVyGRV2G6L5QZH0iXluIPyl5LjNvOOSiLlmz5VrU/HZHGrOU29h1VQPG
 pT0uz8st9XgqM4X1z55Xgyo6sBNeBZl6GQ8mEzAukH+3g4/rtFGOI8s16V06WF6N
 2tobY++i/ms9KAY+xlvGgB4klsuJmDrpnCNOnE83V77KweIDkEGV+LARt97+mlfc
 ZsNw2wofAy9jiWoBeb9rtBcypWqnLaMOdDh/fGGmk9XvU8UNMKW/vwZRU0hHPDjv
 X/CvCQ2pyitvEQ==
X-ME-Sender: <xms:IcDDXhDQ2f26vQ-kAzzutdBURF-3QeUU4oSGmBFeettTaWvG6Y9j5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:IcDDXvgSYr2b5Ms5TNT85bE9b4sBKLbu-NV5jSiQ-DlcDbtC2YgLWQ>
 <xmx:IcDDXsk7zUN02c2fAlovkKaUWLv0B7YiuPmrYZ75MbZERTQrv1yW2w>
 <xmx:IcDDXrx2SPK82AUETmsCkXepM5CDYU68-UQy009O9pKgtHYu3gMzfw>
 <xmx:IcDDXtOsCImeXa0WFOF4KilXTLXPMBPQ5WHmwdpyzjcrDTBNVZN0WA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id A19A73280063;
 Tue, 19 May 2020 07:16:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 02/14] ALSA: firewire-motu: move spec data to v3 protocol file
Date: Tue, 19 May 2020 20:16:29 +0900
Message-Id: <20200519111641.123211-3-o-takashi@sakamocchi.jp>
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

This commit moves the data to the file for protocol version 3.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 42 ++++++++++++++++++++++
 sound/firewire/motu/motu.c             | 50 +++-----------------------
 sound/firewire/motu/motu.h             |  4 +++
 3 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index d1545e2b5caa..947fab7905fe 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -314,3 +314,45 @@ const struct snd_motu_protocol snd_motu_protocol_v3 = {
 	.switch_fetching_mode	= v3_switch_fetching_mode,
 	.cache_packet_formats	= v3_cache_packet_formats,
 };
+
+const struct snd_motu_spec snd_motu_spec_828mk3 = {
+	.name = "828mk3",
+	.protocol = &snd_motu_protocol_v3,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_TX_REVERB_CHUNK |
+		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
+		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
+		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
+		 SND_MOTU_SPEC_RX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+
+	.analog_in_ports = 8,
+	.analog_out_ports = 8,
+};
+
+const struct snd_motu_spec snd_motu_spec_audio_express = {
+	.name = "AudioExpress",
+	.protocol = &snd_motu_protocol_v3,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
+		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+	.analog_in_ports = 2,
+	.analog_out_ports = 4,
+};
+
+const struct snd_motu_spec snd_motu_spec_4pre = {
+	.name = "4pre",
+	.protocol = &snd_motu_protocol_v3,
+	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
+		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
+		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
+		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
+	.analog_in_ports = 2,
+	.analog_out_ports = 2,
+};
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index b3533526f7e5..e5b6f634aa35 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -172,48 +172,6 @@ static void motu_bus_update(struct fw_unit *unit)
 	snd_motu_transaction_reregister(motu);
 }
 
-static const struct snd_motu_spec motu_828mk3 = {
-	.name = "828mk3",
-	.protocol = &snd_motu_protocol_v3,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_TX_REVERB_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_A |
-		 SND_MOTU_SPEC_HAS_OPT_IFACE_B |
-		 SND_MOTU_SPEC_RX_MIDI_3RD_Q |
-		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
-
-	.analog_in_ports = 8,
-	.analog_out_ports = 8,
-};
-
-static const struct snd_motu_spec motu_audio_express = {
-	.name = "AudioExpress",
-	.protocol = &snd_motu_protocol_v3,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN |
-		 SND_MOTU_SPEC_RX_MIDI_2ND_Q |
-		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
-	.analog_in_ports = 2,
-	.analog_out_ports = 4,
-};
-
-static const struct snd_motu_spec motu_4pre = {
-	.name = "4pre",
-	.protocol = &snd_motu_protocol_v3,
-	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
-		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
-		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
-		 SND_MOTU_SPEC_RX_SEPARATED_MAIN,
-	.analog_in_ports = 2,
-	.analog_out_ports = 2,
-};
-
 #define SND_MOTU_DEV_ENTRY(model, data)			\
 {							\
 	.match_flags	= IEEE1394_MATCH_VENDOR_ID |	\
@@ -230,10 +188,10 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000009, &snd_motu_spec_traveler),
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
-	SND_MOTU_DEV_ENTRY(0x000015, &motu_828mk3),	/* FireWire only. */
-	SND_MOTU_DEV_ENTRY(0x000035, &motu_828mk3),	/* Hybrid. */
-	SND_MOTU_DEV_ENTRY(0x000033, &motu_audio_express),
-	SND_MOTU_DEV_ENTRY(0x000045, &motu_4pre),
+	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3), // FireWire only.
+	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3), // Hybrid.
+	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
+	SND_MOTU_DEV_ENTRY(0x000045, &snd_motu_spec_4pre),
 	{ }
 };
 MODULE_DEVICE_TABLE(ieee1394, motu_id_table);
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index ead6cc840d50..7774c23f1637 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -135,6 +135,10 @@ extern const struct snd_motu_spec snd_motu_spec_traveler;
 extern const struct snd_motu_spec snd_motu_spec_ultralite;
 extern const struct snd_motu_spec snd_motu_spec_8pre;
 
+extern const struct snd_motu_spec snd_motu_spec_828mk3;
+extern const struct snd_motu_spec snd_motu_spec_audio_express;
+extern const struct snd_motu_spec snd_motu_spec_4pre;
+
 int amdtp_motu_init(struct amdtp_stream *s, struct fw_unit *unit,
 		    enum amdtp_stream_direction dir,
 		    const struct snd_motu_protocol *const protocol);
-- 
2.25.1

