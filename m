Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423AE1D9520
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA35E4E;
	Tue, 19 May 2020 13:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA35E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887185;
	bh=OS6oMXQuF5dD+nd+oz3Kd4VzpjGtBpMwu/VtXJ/0mLM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0AAeyzuvca9qO2oZ6apzyExphzAT8NVEq5rTDcaO1wlW85qrahE6M/cfjSiBlKAd
	 61ZALz6VDkMGl4NKw4dQx6d3QF/LUphpheYVq0EE8OXbqBKYKzwBqXIxQxDbO2JxzS
	 PnPDuNxXmmLmdQcKu/rKMPirTBMQXpKbmRR9bDJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37DC5F802A1;
	Tue, 19 May 2020 13:17:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AF73F80292; Tue, 19 May 2020 13:17:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF09DF801F8
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF09DF801F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pY4fj4w1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2GOmq1Y4"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 274FE5C0074;
 Tue, 19 May 2020 07:16:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xktxFm8m/Fj/j
 JD7lUcLzk/3gKuGumFHttuJlHB+HQc=; b=pY4fj4w1IJzcu663qozozFgvlLJWL
 8k3mcmIt8yJdtqjYSfgdXJB2azbzAtxAJJUUzHSaC1mT9Q3rMTpiIs70MqKhpPq8
 fHCBN56FgdA7LfTsTpNa8WvWN8kMrje1EZcNhy3CDFMrLmKxoIQk4daJ/ikuwse2
 TtUTc15miWhtT2j/aNXMTm/hWAR15nsG5Q21h1ovnq9fdQwpBXhq5oDZsh6kb8oa
 E9r+xsXXGxjIOm4hluuYtpYe+6DuO1o5AXkZrODN6kaKu+EyeRYWUa169u9aYEqu
 x5mtEpXsTrOwfJwrSy0GIorEFYc86qp+tCkAdEaCbCqfMpePcptUSEC0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=xktxFm8m/Fj/jJD7lUcLzk/3gKuGumFHttuJlHB+HQc=; b=2GOmq1Y4
 o083XEWpphAJ/zYE/Z0di4FJy/47aMn8lrarvK7RkTRV4jVOsHhnfdJ9aqun9vhi
 ITc2cMzNIaXqPWLkOlHsmTPhbOJt82/qUOP/395AuBUA+6FbVRSEiZXnGm3Ebcol
 SXmuNoUbgetDFVD6BHf9lQpbcOf7uruvH+3IsKo1qEcAImhk+eNE32xhKsQxQ2N6
 R9TY5DQdie2JlYheMfUaF0lQ26PxwIhdIAQtITxmPfb4WigMK4oDwXRsNrYuQFDB
 VhSN9fXYAr8WgowBl4d8TVhL4sNjKg7pI8zAhG597pjy4FjJrNnMVQeIWr/h6q3q
 N68Pu2nMIEOCDw==
X-ME-Sender: <xms:JsDDXnonbThz1t60vroD3peNkpBt5eLCGzWDYdPbtrzD5kNQWWsAog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:JsDDXhqHX5BFfDIDAu4kbMs1qJMdXijv7KaXmCDym9Ho1Rv5N2jYow>
 <xmx:JsDDXkM6ZltEOKQ9N10eR_EznTA1Ww_Zzq2h_DXQWkz1J4LMdtICFQ>
 <xmx:JsDDXq5shtcxm2lCLYPwarx-V07naO0-QM2JIBaQjT4E7-aA-dLptw>
 <xmx:JsDDXjXDvw3kJk55pe-GsFjEkarkQIL99LkAreVqdji4VUyuLbZ9jA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2270D3280060;
 Tue, 19 May 2020 07:16:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 05/14] ALSA: firewire-motu: drop protocol structure
Date: Tue, 19 May 2020 20:16:32 +0900
Message-Id: <20200519111641.123211-6-o-takashi@sakamocchi.jp>
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

Now protocol structure becomes useless. This commit drops it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c |  7 -------
 sound/firewire/motu/motu-protocol-v3.c |  5 -----
 sound/firewire/motu/motu.h             | 11 -----------
 3 files changed, 23 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 26534ed97fbc..e2913cb54da8 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -296,13 +296,9 @@ int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 	return 0;
 }
 
-static const struct snd_motu_protocol snd_motu_protocol_v2 = {
-};
-
 const struct snd_motu_spec snd_motu_spec_828mk2 = {
 	.name = "828mk2",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	.protocol = &snd_motu_protocol_v2,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
 		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
@@ -317,7 +313,6 @@ const struct snd_motu_spec snd_motu_spec_828mk2 = {
 
 const struct snd_motu_spec snd_motu_spec_traveler = {
 	.name = "Traveler",
-	.protocol = &snd_motu_protocol_v2,
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
@@ -334,7 +329,6 @@ const struct snd_motu_spec snd_motu_spec_traveler = {
 const struct snd_motu_spec snd_motu_spec_ultralite = {
 	.name = "UltraLite",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	.protocol = &snd_motu_protocol_v2,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK | // padding.
 		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
@@ -348,7 +342,6 @@ const struct snd_motu_spec snd_motu_spec_ultralite = {
 const struct snd_motu_spec snd_motu_spec_8pre = {
 	.name = "8pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
-	.protocol = &snd_motu_protocol_v2,
 	// In tx, use coax chunks for mix-return 1/2. In rx, use coax chunks for
 	// dummy 1/2.
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index d8b42d28304a..8192bcdd1b37 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -310,13 +310,10 @@ int snd_motu_protocol_v3_cache_packet_formats(struct snd_motu *motu)
 	return 0;
 }
 
-static const struct snd_motu_protocol snd_motu_protocol_v3 = {
-};
 
 const struct snd_motu_spec snd_motu_spec_828mk3 = {
 	.name = "828mk3",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
-	.protocol = &snd_motu_protocol_v3,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_SUPPORT_CLOCK_X4 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
@@ -335,7 +332,6 @@ const struct snd_motu_spec snd_motu_spec_828mk3 = {
 const struct snd_motu_spec snd_motu_spec_audio_express = {
 	.name = "AudioExpress",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
-	.protocol = &snd_motu_protocol_v3,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
 		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
@@ -349,7 +345,6 @@ const struct snd_motu_spec snd_motu_spec_audio_express = {
 const struct snd_motu_spec snd_motu_spec_4pre = {
 	.name = "4pre",
 	.protocol_version = SND_MOTU_PROTOCOL_V3,
-	.protocol = &snd_motu_protocol_v3,
 	.flags = SND_MOTU_SPEC_SUPPORT_CLOCK_X2 |
 		 SND_MOTU_SPEC_TX_MICINST_CHUNK |
 		 SND_MOTU_SPEC_TX_RETURN_CHUNK |
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index d59841677596..f8274ed94766 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -113,15 +113,6 @@ enum snd_motu_protocol_version {
 	SND_MOTU_PROTOCOL_V3,
 };
 
-struct snd_motu_protocol {
-	int (*get_clock_rate)(struct snd_motu *motu, unsigned int *rate);
-	int (*set_clock_rate)(struct snd_motu *motu, unsigned int rate);
-	int (*get_clock_source)(struct snd_motu *motu,
-				enum snd_motu_clock_source *source);
-	int (*switch_fetching_mode)(struct snd_motu *motu, bool enable);
-	int (*cache_packet_formats)(struct snd_motu *motu);
-};
-
 struct snd_motu_spec {
 	const char *const name;
 	enum snd_motu_protocol_version protocol_version;
@@ -129,8 +120,6 @@ struct snd_motu_spec {
 
 	unsigned char analog_in_ports;
 	unsigned char analog_out_ports;
-
-	const struct snd_motu_protocol *const protocol;
 };
 
 extern const struct snd_motu_spec snd_motu_spec_828mk2;
-- 
2.25.1

