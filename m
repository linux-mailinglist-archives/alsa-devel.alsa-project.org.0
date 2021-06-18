Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCF3AC1CA
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 06:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E3316FB;
	Fri, 18 Jun 2021 06:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E3316FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623989337;
	bh=uf96bAssqJdvS6H5tmEQ1dNiI2rlLtdWU2rjovaOqNI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YY2fD+5C9UodXfS7ykeya2mVsHIpAgXaIZEcwEvBhkQQDjnDIuofQiI9gRgKfhjY/
	 T44DTS0Drdzdopnco2t3lEZZtpCMsHWZJkk4t2/h84FXwKGy7V+UcbHS3aGnjBhjdw
	 M0KRFwNK45wsJMvPX/avblajkT4Rk+ZDWESfAJyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C8BBF80084;
	Fri, 18 Jun 2021 06:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F26C2F8032D; Fri, 18 Jun 2021 06:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCFD2F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 06:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFD2F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="B7/lsD0L"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wOJ/J07U"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 88DD05C0163;
 Fri, 18 Jun 2021 00:07:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Jun 2021 00:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=OfWwau72bppjR+Cw5ebqurK00Q
 UtKShyCe6I45ah0rc=; b=B7/lsD0LbJyDMno9N1U3DeI2IBdvugvGSLb4lUh/Z+
 BiMHXAzKQCcN1Hy4DjOFWCXO/ZuFvSKuOEoNUA7yGYpkHV+RWKfGIQ2XDbxWuP5Z
 L2/FkkgqvYGtTruWLA4B/z3iWSJmUBKmnCRUxspHqARD8QeuH+5FU10WP/7WVgak
 w78/ZIDo9P+sKjcZ/s7+yUQ45JNE6rSknbHk/s2qCvOIH3OaRAX2x4qsLHGtJYpl
 5PyiRWsw6Lzp/NQCrJmq/oOFiKYEojIeeg8B/aSSWr6/Qo485qqqS5qXFVba8uoB
 IXp037sFw1YpRbi5iWMnmx0KJGRoJPENL4mToH3VCQCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OfWwau72bppjR+Cw5
 ebqurK00QUtKShyCe6I45ah0rc=; b=wOJ/J07UAv08+rIn53dIm9VJoo3KTExY7
 MfqS5wX/XO4VZrKs8PFK0+vPGnfit+Grt+78LFGX2F9PfoZWS2ciicimIRfLl5vF
 KjyaDbddR8BXsjE0wiTMQ/boGoA4iBiz3f7AYGX06CpyS/tCDOTJJSdqvrgromdt
 d0UWPQilQDJmrLNcr2kIx5eGSfL7lncE5mpcz6UjZUELyrJ56e2RhVzoVfVunBJR
 4BncZeuts7uPcU6iCDZ0iCjBL4IAG9OFapDuc25TLkuNGt43+8SB9pfz9bMy0yDL
 +KhL8CHCJUpVIfd+H/T9GffhqGf2m04EbqmFmL7i2hxSSt+TiZvjA==
X-ME-Sender: <xms:9RvMYDQOw7NQsFKRu_gNamA0uGraf9Pzp85KMr_ZpByzAP8vPrsqWw>
 <xme:9RvMYEzgtUBe3ZEIPP8Xwr26tYWmeDVWzHg4H2hhc5id0iW2LVZyDnts8x8Im5G8T
 3qIiBID1rfUvnWPFKs>
X-ME-Received: <xmr:9RvMYI0gZZruSfAEGDRLejm72Bae4fBDGgwdVioVhlNMHXJkvkp_gIGQH0xajbnu_8t2Tf-52AajWx-e34VdEiZMWTa1A2zF30MN0mYxGFXgSSNllciE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9RvMYDD2LCXkdmJhrY-foHZs0qvgsfu0OExiCdU6ZLsCj8aRKB_-vg>
 <xmx:9RvMYMi21wlzy-j7JngIx178tqLZIKZBnqOPScwTnMcq_q1DqfhwkQ>
 <xmx:9RvMYHofV3AKvUeOMr_StXHtO85KsFl2q5aEPQplE5LymYAK61tF9g>
 <xmx:9hvMYIaX-jcJxNIRauC83PkLywfqd293THkFFZ8X80uso0GP5zay5w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jun 2021 00:07:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: fix rx packet format at higher rate for
 MOTU 828 mk3 Hybrid
Date: Fri, 18 Jun 2021 13:07:13 +0900
Message-Id: <20210618040713.114611-1-o-takashi@sakamocchi.jp>
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

I assumed that the combination of packet formats for MOTU 828 mk3 Hybrid
is the same as MOTU 828 mk3 FireWire. However at higher sampling rate, it
is different. MOTU 828 mk3 Hybrid has additional 4 dummy data chunks for
rx packet.

This commit fixes the issue to which I address at a commit f2ac3b839540
("ALSA: firewire-motu: sequence replay for source packet header").

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 15 ++++++++++++---
 sound/firewire/motu/motu.c             |  4 ++--
 sound/firewire/motu/motu.h             |  3 ++-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 4e6b0e449ee4..77e61e89770b 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -185,7 +185,7 @@ int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
 		return err;
 	data = be32_to_cpu(reg) & V3_CLOCK_SOURCE_MASK;
 
-	if (motu->spec == &snd_motu_spec_828mk3)
+	if (motu->spec == &snd_motu_spec_828mk3_fw || motu->spec == &snd_motu_spec_828mk3_hybrid)
 		return detect_clock_source_828mk3(motu, data, src);
 	else
 		return v3_detect_clock_source(motu, data, src);
@@ -284,14 +284,14 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 	       motu->spec->rx_fixed_pcm_chunks,
 	       sizeof(motu->rx_packet_formats.pcm_chunks));
 
-	if (motu->spec == &snd_motu_spec_828mk3)
+	if (motu->spec == &snd_motu_spec_828mk3_fw || motu->spec == &snd_motu_spec_828mk3_hybrid)
 		return detect_packet_formats_828mk3(motu, data);
 	else
 		return 0;
 }
 
 
-const struct snd_motu_spec snd_motu_spec_828mk3 = {
+const struct snd_motu_spec snd_motu_spec_828mk3_fw = {
 	.name = "828mk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
 	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
@@ -300,6 +300,15 @@ const struct snd_motu_spec snd_motu_spec_828mk3 = {
 	.rx_fixed_pcm_chunks = {14, 14, 10},
 };
 
+const struct snd_motu_spec snd_motu_spec_828mk3_hybrid = {
+	.name = "828mk3",
+	.protocol_version = SND_MOTU_PROTOCOL_V3,
+	.flags = SND_MOTU_SPEC_RX_MIDI_3RD_Q |
+		 SND_MOTU_SPEC_TX_MIDI_3RD_Q,
+	.tx_fixed_pcm_chunks = {18, 18, 14},
+	.rx_fixed_pcm_chunks = {14, 14, 14},	// Additional 4 dummy chunks at higher rate.
+};
+
 const struct snd_motu_spec snd_motu_spec_ultralite_mk3 = {
 	.name = "UltraLiteMk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index 0cae670d711c..543136578c70 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -156,10 +156,10 @@ static const struct ieee1394_device_id motu_id_table[] = {
 	SND_MOTU_DEV_ENTRY(0x000009, &snd_motu_spec_traveler),
 	SND_MOTU_DEV_ENTRY(0x00000d, &snd_motu_spec_ultralite),
 	SND_MOTU_DEV_ENTRY(0x00000f, &snd_motu_spec_8pre),
-	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3), // FireWire only.
+	SND_MOTU_DEV_ENTRY(0x000015, &snd_motu_spec_828mk3_fw), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x000019, &snd_motu_spec_ultralite_mk3), // FireWire only.
 	SND_MOTU_DEV_ENTRY(0x000030, &snd_motu_spec_ultralite_mk3), // Hybrid.
-	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3), // Hybrid.
+	SND_MOTU_DEV_ENTRY(0x000035, &snd_motu_spec_828mk3_hybrid), // Hybrid.
 	SND_MOTU_DEV_ENTRY(0x000033, &snd_motu_spec_audio_express),
 	SND_MOTU_DEV_ENTRY(0x000045, &snd_motu_spec_4pre),
 	{ }
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index a3deabdf9e34..73f36d1be515 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -130,7 +130,8 @@ extern const struct snd_motu_spec snd_motu_spec_traveler;
 extern const struct snd_motu_spec snd_motu_spec_ultralite;
 extern const struct snd_motu_spec snd_motu_spec_8pre;
 
-extern const struct snd_motu_spec snd_motu_spec_828mk3;
+extern const struct snd_motu_spec snd_motu_spec_828mk3_fw;
+extern const struct snd_motu_spec snd_motu_spec_828mk3_hybrid;
 extern const struct snd_motu_spec snd_motu_spec_ultralite_mk3;
 extern const struct snd_motu_spec snd_motu_spec_audio_express;
 extern const struct snd_motu_spec snd_motu_spec_4pre;
-- 
2.30.2

