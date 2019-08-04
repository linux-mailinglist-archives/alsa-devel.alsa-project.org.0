Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44563809B3
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D345F165E;
	Sun,  4 Aug 2019 08:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D345F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900434;
	bh=F9izSpNq1ymVa6kHKcKCAhdHoAr+Tye1r1k43lbfsig=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtGJgqy6al1ZQbmYxHiLIA64VkduIsKr1r73GdaJRsOHIbemkj+AX1U7JzJo9HfsB
	 8V0SicuNpdXkZ3q/645hwP66NuMjqgwOdPiyHFf4I9zBIU9+lnqAW6tViNapLsK4rF
	 lfD0ZV4IkmwhIqL5If5nF3GIGVX8TrmUg9PoVnq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6348CF80722;
	Sun,  4 Aug 2019 08:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56A15F805AE; Sun,  4 Aug 2019 08:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C5DCF805A9
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5DCF805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hddhshxJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CTqY0R8L"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F8DE21650;
 Sun,  4 Aug 2019 02:22:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Rnqtan3kUAZwC
 Q9mThSdGbWAHNPf3p85P1jjprQQ7qo=; b=hddhshxJnLk04PJHUBIFlksTvjzt3
 EEaNnbICgNFZF2Qhtwp86u1bv0+Wcpdlp9ktdloq6rnWC1V3xq2JS5cPFtNkrVpP
 uw6tOsZbblHf0+2UOvgi+j7uCrHNjbNHgO9QfXxKTc0ymBzmW0dpR6EL1pIpl5vw
 9geTpQLN7hn40Z6whRQBJ71G1tF78C1AEfCKml+8hVms+3zU9nhix4qbB9JIz48L
 9arb9jPUh1yFCvlr7FBKMUxUpzTlr1z6aVzXLuwWfdCpApSEIVvZDre9yssvB7nK
 aTQVqc5u2lXM/buKt2VfaRUTysXEWIYVsOrOK/ugpJbQPeNBsgRu+q8AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Rnqtan3kUAZwCQ9mThSdGbWAHNPf3p85P1jjprQQ7qo=; b=CTqY0R8L
 Peocaw6sLwQNlLHo5AB9MxUmho197fKNDWwLuDtSGCzx/JM0FiWJHcLkiZnzZP8x
 BCQnf5mBaknEiuC+K59bF4GROnXm3WBR+INvKDMOPV7XpofCA/p1HhM06lcJ3mCX
 cSihiCDTVLLgTwj7Hhyz1Y0yStDoBmAr5SCZh6OA5GftU8Bm4m5PB/2RnYZrigO5
 dI2TL1cqNvw+8LW+S2aw6dK7FW2vJD3V0nOpUEN6gjR4asIJ2EQFWfYg80FauPxN
 6ggS4dtedOQ1wz6MoWHP/NwdbvDvwQy+j3RU8hHzhWezH/FhTL4nFTOcb7diM3Sv
 kS69VePrY8A6pA==
X-ME-Sender: <xms:jXlGXarXuiGAcKphPe0IQdeJZLiERbOvdhNB8t__eXZWe0r0qGDrDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudeg
X-ME-Proxy: <xmx:jXlGXYMP3E9_-utBZ3fMK1cfdDdCjtfHtovSFNgzn0YbxRs25ldFxQ>
 <xmx:jXlGXaDzWgMjTEGNDfWbCdiVQS-w6-OMySs4jrPV3_W0pKNFWcuCAw>
 <xmx:jXlGXXUKoFWCNDQdnFBn6lzXHojwYbuihI2vqfhX04gx5M7WrYbDQg>
 <xmx:jXlGXedGtMpTo2frfwaLhg5LguHB6dTtzJpiXoAtqKxR3APQEjCVKQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F832380083;
 Sun,  4 Aug 2019 02:22:03 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:34 +0900
Message-Id: <20190804062138.1217-16-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 15/19] ALSA: firewire-digi00x: support AMDTP
	domain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit adds AMDTP domain support for ALSA firewire-digi00x driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-stream.c | 55 ++++++++++++++-----------
 sound/firewire/digi00x/digi00x.h        |  2 +
 2 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index cff193f00a97..d6a92460060f 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -126,9 +126,6 @@ static void finish_session(struct snd_dg00x *dg00x)
 {
 	__be32 data;
 
-	amdtp_stream_stop(&dg00x->tx_stream);
-	amdtp_stream_stop(&dg00x->rx_stream);
-
 	data = cpu_to_be32(0x00000003);
 	snd_fw_transaction(dg00x->unit, TCODE_WRITE_QUADLET_REQUEST,
 			   DG00X_ADDR_BASE + DG00X_OFFSET_STREAMING_SET,
@@ -265,13 +262,23 @@ int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
 	if (err < 0)
 		destroy_stream(dg00x, &dg00x->rx_stream);
 
+	err = amdtp_domain_init(&dg00x->domain);
+	if (err < 0) {
+		destroy_stream(dg00x, &dg00x->rx_stream);
+		destroy_stream(dg00x, &dg00x->tx_stream);
+	}
+
 	return err;
 }
 
-// This function should be called before starting streams or after stopping
-// streams.
+/*
+ * This function should be called before starting streams or after stopping
+ * streams.
+ */
 void snd_dg00x_stream_destroy_duplex(struct snd_dg00x *dg00x)
 {
+	amdtp_domain_destroy(&dg00x->domain);
+
 	destroy_stream(dg00x, &dg00x->rx_stream);
 	destroy_stream(dg00x, &dg00x->tx_stream);
 }
@@ -288,6 +295,8 @@ int snd_dg00x_stream_reserve_duplex(struct snd_dg00x *dg00x, unsigned int rate)
 		rate = curr_rate;
 
 	if (dg00x->substreams_counter == 0 || curr_rate != rate) {
+		amdtp_domain_stop(&dg00x->domain);
+
 		finish_session(dg00x);
 
 		fw_iso_resources_free(&dg00x->tx_resources);
@@ -320,8 +329,10 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 		return 0;
 
 	if (amdtp_streaming_error(&dg00x->tx_stream) ||
-	    amdtp_streaming_error(&dg00x->rx_stream))
+	    amdtp_streaming_error(&dg00x->rx_stream)) {
+		amdtp_domain_stop(&dg00x->domain);
 		finish_session(dg00x);
+	}
 
 	if (generation != fw_parent_device(dg00x->unit)->card->generation) {
 		err = fw_iso_resources_update(&dg00x->tx_resources);
@@ -338,36 +349,30 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 	 * which source of clock is used.
 	 */
 	if (!amdtp_stream_running(&dg00x->rx_stream)) {
+		int spd = fw_parent_device(dg00x->unit)->max_speed;
+
 		err = begin_session(dg00x);
 		if (err < 0)
 			goto error;
 
-		err = amdtp_stream_start(&dg00x->rx_stream,
-				dg00x->rx_resources.channel,
-				fw_parent_device(dg00x->unit)->max_speed);
+		err = amdtp_domain_add_stream(&dg00x->domain, &dg00x->rx_stream,
+					      dg00x->rx_resources.channel, spd);
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&dg00x->rx_stream,
-					      CALLBACK_TIMEOUT)) {
-			err = -ETIMEDOUT;
+		err = amdtp_domain_add_stream(&dg00x->domain, &dg00x->tx_stream,
+					      dg00x->tx_resources.channel, spd);
+		if (err < 0)
 			goto error;
-		}
-	}
 
-	/*
-	 * The value of SYT field in transmitted packets is always 0x0000. Thus,
-	 * duplex streams with timestamp synchronization cannot be built.
-	 */
-	if (!amdtp_stream_running(&dg00x->tx_stream)) {
-		err = amdtp_stream_start(&dg00x->tx_stream,
-				dg00x->tx_resources.channel,
-				fw_parent_device(dg00x->unit)->max_speed);
+		err = amdtp_domain_start(&dg00x->domain);
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&dg00x->tx_stream,
-					      CALLBACK_TIMEOUT)) {
+		if (!amdtp_stream_wait_callback(&dg00x->rx_stream,
+						CALLBACK_TIMEOUT) ||
+		    !amdtp_stream_wait_callback(&dg00x->tx_stream,
+						CALLBACK_TIMEOUT)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
@@ -375,6 +380,7 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 
 	return 0;
 error:
+	amdtp_domain_stop(&dg00x->domain);
 	finish_session(dg00x);
 
 	return err;
@@ -383,6 +389,7 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 void snd_dg00x_stream_stop_duplex(struct snd_dg00x *dg00x)
 {
 	if (dg00x->substreams_counter == 0) {
+		amdtp_domain_stop(&dg00x->domain);
 		finish_session(dg00x);
 
 		fw_iso_resources_free(&dg00x->tx_resources);
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 0994d191ccda..8041c65f2736 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -59,6 +59,8 @@ struct snd_dg00x {
 
 	/* Console models have additional MIDI ports for control surface. */
 	bool is_console;
+
+	struct amdtp_domain domain;
 };
 
 #define DG00X_ADDR_BASE		0xffffe0000000ull
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
