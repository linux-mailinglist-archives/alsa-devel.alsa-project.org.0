Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109E1D952E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F9F177B;
	Tue, 19 May 2020 13:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F9F177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887333;
	bh=Enq9iXh0qYGy+RnWKjGN1fjkoPJvI/vkiRf0hvwKvYw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wet9+63S8IKkJ3ipyFdsCeoPLp1yLNw+h+pDjKHzcrktsyfAJMpnHRsAv7il3Rzom
	 R6za4MFBe4nM2T7uilE+tUKwye00EjBb/IlInGurTK+TmKpbXWtKWuJW6giKuH1GGe
	 ZsHwVj6YhmEmwnB9lZgGc1eSh0rE0uHB5PjSPUuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F8CF802E2;
	Tue, 19 May 2020 13:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3E21F8029A; Tue, 19 May 2020 13:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B45D3F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B45D3F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="O+/oNa/o"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LEfeb7uB"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E246E5C00FC;
 Tue, 19 May 2020 07:16:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Fn7lNUvRnaI4n
 WZYb0E92+7/bwfth1HSDNvejKkIbHg=; b=O+/oNa/owdQ+8w+frCbQnluTEiHIs
 vSxihYi4vk5wVt3Bs7kKKivCxbyj8V848vLAASauw0VmyeereZV3ciQSzk48BHW0
 CS1ilozrcPDC12D35SdHGWSC6oYgxPabO4y3+mcip/g8BFWmH+Lnane203cgtZ7Q
 Hv8uYdLoRDzHGWRiBaXGeIYuflRp6zFjC00TsZ++izAq/MLg13enyoxFxQ+5exr7
 UtFrp2rcPfKkfA/2XvPDhlseQiPWQOEOZzv0ZhvvXLg+BIvN+1/JmGlguxylKCD5
 7IvJ90weq2TSA3a4F1Sh+iY6XnmthR3avnNwOJZbnge6kOyBxZlQKD12A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Fn7lNUvRnaI4nWZYb0E92+7/bwfth1HSDNvejKkIbHg=; b=LEfeb7uB
 RuYuDqx0jklhOKlTyFStrXcLCMK1k+XyofFNeNZLLtrNVFPuw5eGuOj1iuQg46qa
 WM6na77HNN8tOk55BtprXFofBMlJdu/FsNBlBGdL6oKjZpu5iLSDbU93ep/xAz3I
 X6XWXsSoVkpDgeSLlCxQQZFAkykyXBj2RYMXqaHu4zximwvO/ukhX5feJUuzSDZ7
 LSS/NcX5cASCAgHNGa9lREmsM0xGYp+KtbiPO46j2f+QUkPRWoO4Ak6zHn7x8qEm
 Aa8LJeERULXDx7dIiuyV1g2QWuBX5EJ4t5usOGCTjxhTkDc4Qcm/OAVvrLK7t61O
 DnDIdi9c7V5rWg==
X-ME-Sender: <xms:KMDDXm0dY_fn0APnMqGfdiavaCnMBLJzWR3DN287rSfCmL0sFA_rQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:KMDDXpGRFVA3-sUUvsmYL6Wh1QaP5WvpElJ-0NLR6C_iBmB2lfxv5Q>
 <xmx:KMDDXu6YA2GfF5rKcYwrBYsrihtqpwK-pX_kllBSOv4gXMNLiAWzbA>
 <xmx:KMDDXn1dOS5u2v396hY1_t0TC83aaBuONgzgP4M-Z2qj6wq1x8HJxw>
 <xmx:KMDDXowF6kBWev5mMf38Vb-sBLrqlt6z2HiXME98PpXy2xsMRAraQA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id C9B3A328005E;
 Tue, 19 May 2020 07:16:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 07/14] ALSA: firewire-motu: add alternative functions to
 detect packet format for protocol v2
Date: Tue, 19 May 2020 20:16:34 +0900
Message-Id: <20200519111641.123211-8-o-takashi@sakamocchi.jp>
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

This commit adds alternative functions to detect packet format so that
each function corresponds to each model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 72 +++++++++++++++++++++++---
 sound/firewire/motu/motu.h             |  1 +
 2 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 6cd7a5f1f46c..cd409efe3350 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -164,7 +164,7 @@ int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
 	if (enable)
 		data |= V2_CLOCK_FETCH_ENABLE;
 
-	if (motu->spec->flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4) {
+	if (motu->spec == &snd_motu_spec_traveler) {
 		// Expected for Traveler and 896HD, which implements Altera
 		// Cyclone EP1C3.
 		data |= V2_CLOCK_MODEL_SPECIFIC;
@@ -193,8 +193,6 @@ static void calculate_fixed_part(struct snd_motu_packet_format *formats,
 {
 	unsigned char pcm_chunks[3] = {0, 0, 0};
 
-	formats->msg_chunks = 2;
-
 	pcm_chunks[0] = analog_ports;
 	pcm_chunks[1] = analog_ports;
 	if (flags & SND_MOTU_SPEC_SUPPORT_CLOCK_X4)
@@ -268,12 +266,69 @@ static void calculate_differed_part(struct snd_motu_packet_format *formats,
 	formats->differed_part_pcm_chunks[1] = pcm_chunks[1];
 }
 
+static int detect_packet_formats_828mk2(struct snd_motu *motu, u32 data)
+{
+	if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) ==
+	    V2_OPT_IFACE_MODE_ADAT) {
+		motu->tx_packet_formats.pcm_chunks[0] += 8;
+		motu->tx_packet_formats.pcm_chunks[1] += 4;
+	}
+
+	if (((data & V2_OPT_OUT_IFACE_MASK) >> V2_OPT_OUT_IFACE_SHIFT) ==
+	    V2_OPT_IFACE_MODE_ADAT) {
+		motu->rx_packet_formats.pcm_chunks[0] += 8;
+		motu->rx_packet_formats.pcm_chunks[1] += 4;
+	}
+
+	return 0;
+}
+
+static int detect_packet_formats_traveler(struct snd_motu *motu, u32 data)
+{
+	if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) ==
+	    V2_OPT_IFACE_MODE_ADAT) {
+		motu->tx_packet_formats.pcm_chunks[0] += 8;
+		motu->tx_packet_formats.pcm_chunks[1] += 4;
+	}
+
+	if (((data & V2_OPT_OUT_IFACE_MASK) >> V2_OPT_OUT_IFACE_SHIFT) ==
+	    V2_OPT_IFACE_MODE_ADAT) {
+		motu->rx_packet_formats.pcm_chunks[0] += 8;
+		motu->rx_packet_formats.pcm_chunks[1] += 4;
+	}
+
+	return 0;
+}
+
+static int detect_packet_formats_8pre(struct snd_motu *motu, u32 data)
+{
+	if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) ==
+	    V2_OPT_IFACE_MODE_ADAT) {
+		motu->tx_packet_formats.pcm_chunks[0] += 8;
+		motu->tx_packet_formats.pcm_chunks[1] += 8;
+	}
+
+	if (((data & V2_OPT_OUT_IFACE_MASK) >> V2_OPT_OUT_IFACE_SHIFT) ==
+	    V2_OPT_IFACE_MODE_ADAT) {
+		motu->rx_packet_formats.pcm_chunks[0] += 8;
+		motu->rx_packet_formats.pcm_chunks[1] += 8;
+	}
+
+	return 0;
+}
+
 int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 {
 	__be32 reg;
 	u32 data;
 	int err;
 
+	motu->tx_packet_formats.pcm_byte_offset = 10;
+	motu->rx_packet_formats.pcm_byte_offset = 10;
+
+	motu->tx_packet_formats.msg_chunks = 2;
+	motu->rx_packet_formats.msg_chunks = 2;
+
 	err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET, &reg,
 					sizeof(reg));
 	if (err < 0)
@@ -290,10 +345,15 @@ int snd_motu_protocol_v2_cache_packet_formats(struct snd_motu *motu)
 	calculate_differed_part(&motu->rx_packet_formats, motu->spec->flags,
 			data, V2_OPT_OUT_IFACE_MASK, V2_OPT_OUT_IFACE_SHIFT);
 
-	motu->tx_packet_formats.pcm_byte_offset = 10;
-	motu->rx_packet_formats.pcm_byte_offset = 10;
 
-	return 0;
+	if (motu->spec == &snd_motu_spec_828mk2)
+		return detect_packet_formats_828mk2(motu, data);
+	else if (motu->spec == &snd_motu_spec_traveler)
+		return detect_packet_formats_traveler(motu, data);
+	else if (motu->spec == &snd_motu_spec_8pre)
+		return detect_packet_formats_8pre(motu, data);
+	else
+		return 0;
 }
 
 const struct snd_motu_spec snd_motu_spec_828mk2 = {
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 790aa34d396f..d071b2342f11 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -36,6 +36,7 @@ struct snd_motu_packet_format {
 	unsigned char pcm_byte_offset;
 
 	unsigned char msg_chunks;
+	unsigned char pcm_chunks[3];
 	unsigned char fixed_part_pcm_chunks[3];
 	unsigned char differed_part_pcm_chunks[3];
 };
-- 
2.25.1

