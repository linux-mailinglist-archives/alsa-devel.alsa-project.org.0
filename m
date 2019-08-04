Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C4809B5
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28E9D16BD;
	Sun,  4 Aug 2019 08:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28E9D16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900517;
	bh=3SGxUI5W3dXpWhXdzOfAwIHDLBkYmtDiLBbyZ0N7oLM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HT9n4UbQhkJ8ChfDwQImMuPRVur6M6xRCaoBnyLYHdTTvvsSe+uFGsc9xhkuZzOxG
	 eHa9d4VzTeniUnBvjmftZBWA8Tr4fJy3QsWXH0JLUweAMC8G2UMxckYR67heo1+x9h
	 +9Rd5MO/VZ9DwGjQGQMbzuk2vb4lvlVAWBQmJ9XA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94EA5F80759;
	Sun,  4 Aug 2019 08:22:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6825EF805E1; Sun,  4 Aug 2019 08:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B199F805A1
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B199F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cm6rRjwO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iY/ftJGE"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A9391218BB;
 Sun,  4 Aug 2019 02:22:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pVP06nrIL3BpO
 +HgCRIDuKf32eX1ysrT8XwITdM0F7M=; b=cm6rRjwOHKCi0IUCsNVK2rgbeKLKZ
 0EQ8nsrxBEMCCtZvyk2WhtzSATHvTft3AfhMHxEUFdBrUTgXEj0+X3G+Z2J/wfZQ
 s5IBWwI1kNT5AAj/KsC122aqm0qG8Z6fjjdljNk83vdfkXw7VYX4ujdiomUG/ZTO
 GqKHnyWsQKS7tUeCYckywfSjHjNubnwHPx+lPmdnIh/1EKXo/muRDn8toC9G34ie
 mrNAKIe/796tTEvl9JT0A8kwCwKl4STZeUUuy6gzFykKrdbq2aZAL8nUBhO7Zr4m
 YXFt2nqpk9Y37LCraUa0NC43fdxRKtFOeYv+/IpemBmoPFLGbW1WOOq9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pVP06nrIL3BpO+HgCRIDuKf32eX1ysrT8XwITdM0F7M=; b=iY/ftJGE
 cSiUxHUpsw5rPkBedvlMl/7wRjR0yihoxcDUygcOJxVl9DqoyQ5+BpeBU30H9vgO
 MsXQKrHTaLwbzh38qZaFuHY1DTapW56sxY/8Rcv6KARZ7gOoiyud17Tp11rp1nKu
 +tl/cJfMU3UI6UTp9c7Nacr1uXsSfUw/c1u3ijEOuN+pznyXxn4FlMEMTPpK4X+Z
 rtaqfZf3tJ4jQdBmdaXIYhBysFxy42tW2QyOClxbqSBez/oIGaRO28PkrUyYwfG5
 sfglxHAZaVtNF9F9jQSLRtR12lwP5dLkbBu/x7P0K/C3x4vTM8aAfdxvCEOTDQbM
 gDwGUzCawWyeOQ==
X-ME-Sender: <xms:kHlGXdMuWy11_C_LODp59yIl9kVzkI_b_C-lep3bpH2KHfTEv7rX-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudeg
X-ME-Proxy: <xmx:kHlGXbJ1g_A2WlIGyX2lY5aL-R8d2xHUT8_0Yk8FBGthRH26BDDeJQ>
 <xmx:kHlGXbZj5XOYncGiUYfRKZ8ApD1-mnN8c0vy8CZYRQS66DSvv7LlsA>
 <xmx:kHlGXZ-2oP1rwgM5-Ngs3aMcRIEmH1igVCd1lEkhsNyMd50t5s51Mg>
 <xmx:kHlGXU3uZ3RwEiJcDGLG8Bekbl5fxhv4wcrYf_kzgyp9p4ZtwsbeHg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40374380083;
 Sun,  4 Aug 2019 02:22:07 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:36 +0900
Message-Id: <20190804062138.1217-18-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 17/19] ALSA: firewire-motu: support AMDTP domain
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

This commit adds AMDTP domain support for ALSA firewire-motu driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 83 +++++++++++++++----------------
 sound/firewire/motu/motu.h        |  2 +
 2 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index cc9f34426a47..813e38e6a86e 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -92,9 +92,6 @@ static void finish_session(struct snd_motu *motu)
 	if (err < 0)
 		return;
 
-	amdtp_stream_stop(&motu->tx_stream);
-	amdtp_stream_stop(&motu->rx_stream);
-
 	err = snd_motu_transaction_read(motu, ISOC_COMM_CONTROL_OFFSET, &reg,
 					sizeof(reg));
 	if (err < 0)
@@ -109,27 +106,6 @@ static void finish_session(struct snd_motu *motu)
 				   sizeof(reg));
 }
 
-static int start_isoc_ctx(struct snd_motu *motu, struct amdtp_stream *stream)
-{
-	struct fw_iso_resources *resources;
-	int err;
-
-	if (stream == &motu->rx_stream)
-		resources = &motu->rx_resources;
-	else
-		resources = &motu->tx_resources;
-
-	err = amdtp_stream_start(stream, resources->channel,
-				 fw_parent_device(motu->unit)->max_speed);
-	if (err < 0)
-		return err;
-
-	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT))
-		return -ETIMEDOUT;
-
-	return 0;
-}
-
 int snd_motu_stream_cache_packet_formats(struct snd_motu *motu)
 {
 	int err;
@@ -169,6 +145,7 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate)
 		rate = curr_rate;
 
 	if (motu->substreams_counter == 0 || curr_rate != rate) {
+		amdtp_domain_stop(&motu->domain);
 		finish_session(motu);
 
 		fw_iso_resources_free(&motu->tx_resources);
@@ -234,8 +211,10 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 		return 0;
 
 	if (amdtp_streaming_error(&motu->rx_stream) ||
-	    amdtp_streaming_error(&motu->tx_stream))
+	    amdtp_streaming_error(&motu->tx_stream)) {
+		amdtp_domain_stop(&motu->domain);
 		finish_session(motu);
+	}
 
 	if (generation != fw_parent_device(motu->unit)->card->generation) {
 		err = fw_iso_resources_update(&motu->rx_resources);
@@ -248,6 +227,8 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 	}
 
 	if (!amdtp_stream_running(&motu->rx_stream)) {
+		int spd = fw_parent_device(motu->unit)->max_speed;
+
 		err = ensure_packet_formats(motu);
 		if (err < 0)
 			return err;
@@ -259,26 +240,32 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 			goto stop_streams;
 		}
 
-		err = start_isoc_ctx(motu, &motu->rx_stream);
-		if (err < 0) {
-			dev_err(&motu->unit->device,
-				"fail to start IT context: %d\n", err);
+		err = amdtp_domain_add_stream(&motu->domain, &motu->tx_stream,
+					      motu->tx_resources.channel, spd);
+		if (err < 0)
 			goto stop_streams;
-		}
 
-		err = motu->spec->protocol->switch_fetching_mode(motu, true);
-		if (err < 0) {
-			dev_err(&motu->unit->device,
-				"fail to enable frame fetching: %d\n", err);
+		err = amdtp_domain_add_stream(&motu->domain, &motu->rx_stream,
+					      motu->rx_resources.channel, spd);
+		if (err < 0)
+			goto stop_streams;
+
+		err = amdtp_domain_start(&motu->domain);
+		if (err < 0)
+			goto stop_streams;
+
+		if (!amdtp_stream_wait_callback(&motu->tx_stream,
+						CALLBACK_TIMEOUT) ||
+		    !amdtp_stream_wait_callback(&motu->rx_stream,
+						CALLBACK_TIMEOUT)) {
+			err = -ETIMEDOUT;
 			goto stop_streams;
 		}
-	}
 
-	if (!amdtp_stream_running(&motu->tx_stream)) {
-		err = start_isoc_ctx(motu, &motu->tx_stream);
+		err = motu->spec->protocol->switch_fetching_mode(motu, true);
 		if (err < 0) {
 			dev_err(&motu->unit->device,
-				"fail to start IR context: %d", err);
+				"fail to enable frame fetching: %d\n", err);
 			goto stop_streams;
 		}
 	}
@@ -286,6 +273,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 	return 0;
 
 stop_streams:
+	amdtp_domain_stop(&motu->domain);
 	finish_session(motu);
 	return err;
 }
@@ -293,6 +281,7 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 {
 	if (motu->substreams_counter == 0) {
+		amdtp_domain_stop(&motu->domain);
 		finish_session(motu);
 
 		fw_iso_resources_free(&motu->tx_resources);
@@ -344,18 +333,26 @@ int snd_motu_stream_init_duplex(struct snd_motu *motu)
 		return err;
 
 	err = init_stream(motu, &motu->rx_stream);
-	if (err < 0)
+	if (err < 0) {
 		destroy_stream(motu, &motu->tx_stream);
+		return err;
+	}
+
+	err = amdtp_domain_init(&motu->domain);
+	if (err < 0) {
+		destroy_stream(motu, &motu->tx_stream);
+		destroy_stream(motu, &motu->rx_stream);
+	}
 
 	return err;
 }
 
-/*
- * This function should be called before starting streams or after stopping
- * streams.
- */
+// This function should be called before starting streams or after stopping
+// streams.
 void snd_motu_stream_destroy_duplex(struct snd_motu *motu)
 {
+	amdtp_domain_destroy(&motu->domain);
+
 	destroy_stream(motu, &motu->rx_stream);
 	destroy_stream(motu, &motu->tx_stream);
 
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 09d1451d7de4..350ee2c16f4a 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -69,6 +69,8 @@ struct snd_motu {
 	int dev_lock_count;
 	bool dev_lock_changed;
 	wait_queue_head_t hwdep_wait;
+
+	struct amdtp_domain domain;
 };
 
 enum snd_motu_spec_flags {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
