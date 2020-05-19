Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1C1D953F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98FBC173E;
	Tue, 19 May 2020 13:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98FBC173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887583;
	bh=3OJqTre4+SACSDyul5EqYyQtzlDj0ozdFZh4HDtiOA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbMFoa5rEqBFqNzgGfMqr6QFVMiTw9Ybb1udYNyEDBNvU9L0Y5DLJIYUZqOn61Ton
	 P/CzrWD+WJodJKM8KQ0cHhChizBfXXyQhGT884vHSaS0Ef3EZ6wdBoiso7Q2F19s5O
	 1J7HEaw+UF3omfDP/QyHVRLuXBHzGmxfsldndXXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85EA3F80340;
	Tue, 19 May 2020 13:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA78F802A7; Tue, 19 May 2020 13:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85BA3F802A0
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85BA3F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="reXLBSRk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LtpCb4BW"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A83305C0073;
 Tue, 19 May 2020 07:17:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jsO78a0+N+/Kq
 aB13ge5VvYlFiXaFv333wp2egRbLHg=; b=reXLBSRk/V9KOtcVxj1z13rC/1Or3
 z/VKX1h+K05hyEiy+y4aAaAGUq++icwQF8d8NTGlPQbcM4fgLwib2tfePBPF4iqZ
 TLjfiPUPhJpZhon2gFBfGM4dk2LI0wOBpkMIghSmgGmQk5W5Kh4/EAm+kmbaW0um
 Y35cpbWXvgY+cg1/cRosXrgvxrz6TqC3T7cF/Kq6PNJ8r7NdmJA/eRqLbvmAq0zI
 iWspw7WQpLJ+ta52yIFArm5qAbi11O6r6su6FTHb0Tt5B29rcVKs+jYabnDQ3AEH
 14buQDd7mDXZ0vWaKd8hrtr7OSDhGsIC9xT3HhFhPnCFeA45tq5IyDGwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jsO78a0+N+/KqaB13ge5VvYlFiXaFv333wp2egRbLHg=; b=LtpCb4BW
 Z/RobPMmZstXuVul1qkms+WIwnHastfvSiT8uqQItxqac2l/4x0Kuvpcgfd44sK+
 Z4JY98Jz6hgyGM7c+EGP89+lAb5mMxUukHve8VdgXfnfJF5IZNDDZHj2GMOCPajk
 26Tc//TSJRLkQ8Do5FtB+GXdcdGENo3MsaasuAwu+hZQpcfLeHYTCGU3diRIDHA2
 UP1cef9OuAm/1pKVcCCnT6WlDhN7h2Mr/b4i86euky6hhyprQIYTMnOlBJHfcnVZ
 /4siE7Fto8sqj/hX/NMJIPON6XfBERC9K9BZJNkTxZqecqWBRriWLJZd57HO+cXO
 8PU7u80n9xqrFg==
X-ME-Sender: <xms:MsDDXkxFIe1KD9aT4v-HVwPGDvKMpNap_GYKel7z4-qhju25YX19FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:MsDDXoTlcu133Xxa9nCinrDzGsknxUACUhO3kQFu3MVtI57-P0IVMg>
 <xmx:MsDDXmWpMFkihrQg6agkygOuc2lSQIZ1_8328Mxt9jyKUJQIRnIK0A>
 <xmx:MsDDXihK6LUzjKj_rEtK2SKBjVjVi7jV36zf2U_E1hmDjSgKsIq32w>
 <xmx:MsDDXt_ENJBr8pSKrjWDJq6Jms8vP2RyvxnRbLM9AI_Z9ln4ALQP9g>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D6343280064;
 Tue, 19 May 2020 07:17:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 14/14] ALSA: firewire-motu: refactoring protocol v2 for
 fetching mode switch
Date: Tue, 19 May 2020 20:16:41 +0900
Message-Id: <20200519111641.123211-15-o-takashi@sakamocchi.jp>
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

This commit splits the method to switch fetching mode for protocol
version 2 so that model-dependent operations are explicitly defined.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 77 ++++++++++++++++----------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 2e6c3cc8a9e1..e59e69ab1538 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -170,52 +170,69 @@ int snd_motu_protocol_v2_get_clock_source(struct snd_motu *motu,
 	return get_clock_source(motu, be32_to_cpu(reg), src);
 }
 
-int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
-					      bool enable)
+// Expected for Traveler and 896HD, which implements Altera Cyclone EP1C3.
+static int switch_fetching_mode_cyclone(struct snd_motu *motu, u32 *data,
+					bool enable)
 {
-	enum snd_motu_clock_source src;
-	__be32 reg;
-	u32 data;
-	int err = 0;
+	*data |= V2_CLOCK_MODEL_SPECIFIC;
 
-	// 828mkII implements Altera ACEX 1K EP1K30. Nothing to do.
-	if (motu->spec == &snd_motu_spec_828mk2)
-		return 0;
+	return 0;
+}
 
-	err = snd_motu_transaction_read(motu, V2_CLOCK_STATUS_OFFSET, &reg,
-					sizeof(reg));
+// For UltraLite and 8pre, which implements Xilinx Spartan XC3S200.
+static int switch_fetching_mode_spartan(struct snd_motu *motu, u32 *data,
+					bool enable)
+{
+	unsigned int rate;
+	enum snd_motu_clock_source src;
+	int err;
+
+	err = get_clock_source(motu, *data, &src);
 	if (err < 0)
 		return err;
-	data = be32_to_cpu(reg);
 
-	err = get_clock_source(motu, data, &src);
+	err = get_clock_rate(*data, &rate);
 	if (err < 0)
 		return err;
 
-	data &= ~(V2_CLOCK_FETCH_ENABLE | V2_CLOCK_MODEL_SPECIFIC);
-	if (enable)
-		data |= V2_CLOCK_FETCH_ENABLE;
+	if (src == SND_MOTU_CLOCK_SOURCE_SPH && rate > 48000)
+		*data |= V2_CLOCK_MODEL_SPECIFIC;
 
-	if (motu->spec == &snd_motu_spec_traveler) {
-		// Expected for Traveler and 896HD, which implements Altera
-		// Cyclone EP1C3.
-		data |= V2_CLOCK_MODEL_SPECIFIC;
+	return 0;
+}
+
+int snd_motu_protocol_v2_switch_fetching_mode(struct snd_motu *motu,
+					      bool enable)
+{
+	if (motu->spec == &snd_motu_spec_828mk2) {
+		// 828mkII implements Altera ACEX 1K EP1K30. Nothing to do.
+		return 0;
 	} else {
-		// For UltraLite and 8pre, which implements Xilinx Spartan
-		// XC3S200.
-		unsigned int rate;
+		__be32 reg;
+		u32 data;
+		int err;
 
-		err = get_clock_rate(data, &rate);
+		err = snd_motu_transaction_read(motu, V2_CLOCK_STATUS_OFFSET,
+						&reg, sizeof(reg));
 		if (err < 0)
 			return err;
+		data = be32_to_cpu(reg);
 
-		if (src == SND_MOTU_CLOCK_SOURCE_SPH && rate > 48000)
-			data |= V2_CLOCK_MODEL_SPECIFIC;
-	}
+		data &= ~(V2_CLOCK_FETCH_ENABLE | V2_CLOCK_MODEL_SPECIFIC);
+		if (enable)
+			data |= V2_CLOCK_FETCH_ENABLE;
 
-	reg = cpu_to_be32(data);
-	return snd_motu_transaction_write(motu, V2_CLOCK_STATUS_OFFSET, &reg,
-					  sizeof(reg));
+		if (motu->spec == &snd_motu_spec_traveler)
+			err = switch_fetching_mode_cyclone(motu, &data, enable);
+		else
+			err = switch_fetching_mode_spartan(motu, &data, enable);
+		if (err < 0)
+			return err;
+
+		reg = cpu_to_be32(data);
+		return snd_motu_transaction_write(motu, V2_CLOCK_STATUS_OFFSET,
+						  &reg, sizeof(reg));
+	}
 }
 
 static int detect_packet_formats_828mk2(struct snd_motu *motu, u32 data)
-- 
2.25.1

