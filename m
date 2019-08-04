Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E4809B4
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F6616D9;
	Sun,  4 Aug 2019 08:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F6616D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900480;
	bh=wFy9b7SdzoYTG3ueyA5/lIwF2nZAGVmOwzxhWsjNfrc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+rsqQ16h6TBu5XH8dTxeYC8EtMTEKzph5YR9omn1yR9pQYrJa25Ifg/MXK+tQD2f
	 KutpmHpo0nbe3RrN/84C3OXosakaAXf3YLpyDEBvNX9xSF86EqWmCRtWG1/LTvrI3k
	 H8UqMEa1xpFhJ9MmD12nJyl2DEPMXSBfrLb3eSp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB73F8074D;
	Sun,  4 Aug 2019 08:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7731F805DF; Sun,  4 Aug 2019 08:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6DFF804CA
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6DFF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kckWuAGy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cmgN7E6e"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2898521AF2;
 Sun,  4 Aug 2019 02:22:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=kg6oyWk7w8vHd
 M7PUczjbuABbF4c6VVPK8y0QSaNUuQ=; b=kckWuAGy2iNG1KNSv70Ln5vAs7Eic
 AHDwpv387vtNWaOoUUv5cgzeH+DgzceFAkQY5Xbo3gzGd+K+MxDY1kvECIXEtFFF
 PTPMlaOdg8cr6tx6R4Pge+5p12yR2Y/2/FcRft98ZCBxWy4/j7LWI11KipwEGQDQ
 06K7ETdSALjYbRdHgTKXrdgCz8FxcrleXfCj1GyMNAdC83wm2wv1DFoB2iKK3wQT
 9LKPslD1q1P9Xcq1n48fVOXE8+p+u/mmYv+ZD+kwkqv+Y6bOzWdz51TPz9U6kRLU
 nHkv7ciOryQMIoPTReXX334pCyIgKXnEFTFzqIxvA4izX4brxDrfTwSGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=kg6oyWk7w8vHdM7PUczjbuABbF4c6VVPK8y0QSaNUuQ=; b=cmgN7E6e
 HpkzvVWBPkrITM8ui5T1HsWOw/HQPyiSVsNQ1db+kktS4IFL6fVD8risJP1eBRlb
 MQF7sHW2PX4hR6Ey6Y4vN9FRChbAWXpnBHDssFgSYtp6AJfbcbkbiLQxs5TozZD5
 j8BZ4q/8Yf7pi0IAIOjJIwnAtwMBEinqJsJhfA7q8MxxSTIEbxep3God00aV6JKK
 o7/PUKbc14AwrkjvmoqVnLklkmCHQx6VH81eXY+Il8EiYbR/lJ0OKnJq8uyM/aAL
 reWSqxspJYMTzZIPnGq5S4fVbhFuCqmcQdfyPwPYxo+wDS6c42jQcW6WEcNikqzA
 AwMQ+G3/jknNKA==
X-ME-Sender: <xms:jnlGXegTYwBUbgTP9vwjeSWH0f6dFlJhw1YpZ9gLyxGI-42DO9q3HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudeg
X-ME-Proxy: <xmx:j3lGXS8TW12jL6y3D9Bqn1l4mnUpzD0p4NfWjzB4HfGFyR8LQhJm1A>
 <xmx:j3lGXfJjikNIfi6TIoB4a7BPZbjPaqgqIYfeytEtmQPuVOeautHHUQ>
 <xmx:j3lGXfyBds9vJzBQHrpZYn7riji_F8QpMCEhXQWu85LLPvICQe4u3g>
 <xmx:j3lGXbb1zIVJe9vUVogrPecRjfTFh8jwg1wJuS_QRvaoEjxpPkGDtQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B43A6380083;
 Sun,  4 Aug 2019 02:22:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:35 +0900
Message-Id: <20190804062138.1217-17-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 16/19] ALSA: firewire-tascam: support AMDTP
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

This commit adds AMDTP domain support for ALSA firewire-tascam driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 54 ++++++++++++++++-----------
 sound/firewire/tascam/tascam.h        |  2 +
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index d5e77036e0ee..9e2dc2fe3271 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -180,9 +180,6 @@ static void finish_session(struct snd_tscm *tscm)
 {
 	__be32 reg;
 
-	amdtp_stream_stop(&tscm->rx_stream);
-	amdtp_stream_stop(&tscm->tx_stream);
-
 	reg = 0;
 	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
 			   TSCM_ADDR_BASE + TSCM_OFFSET_START_STREAMING,
@@ -339,8 +336,16 @@ int snd_tscm_stream_init_duplex(struct snd_tscm *tscm)
 		return err;
 
 	err = init_stream(tscm, &tscm->rx_stream);
-	if (err < 0)
+	if (err < 0) {
+		destroy_stream(tscm, &tscm->tx_stream);
+		return err;
+	}
+
+	err = amdtp_domain_init(&tscm->domain);
+	if (err < 0) {
 		destroy_stream(tscm, &tscm->tx_stream);
+		destroy_stream(tscm, &tscm->rx_stream);
+	}
 
 	return err;
 }
@@ -348,17 +353,18 @@ int snd_tscm_stream_init_duplex(struct snd_tscm *tscm)
 // At bus reset, streaming is stopped and some registers are clear.
 void snd_tscm_stream_update_duplex(struct snd_tscm *tscm)
 {
-	amdtp_stream_pcm_abort(&tscm->tx_stream);
-	amdtp_stream_stop(&tscm->tx_stream);
+	amdtp_domain_stop(&tscm->domain);
 
+	amdtp_stream_pcm_abort(&tscm->tx_stream);
 	amdtp_stream_pcm_abort(&tscm->rx_stream);
-	amdtp_stream_stop(&tscm->rx_stream);
 }
 
 // This function should be called before starting streams or after stopping
 // streams.
 void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm)
 {
+	amdtp_domain_destroy(&tscm->domain);
+
 	destroy_stream(tscm, &tscm->rx_stream);
 	destroy_stream(tscm, &tscm->tx_stream);
 }
@@ -373,6 +379,8 @@ int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
 		return err;
 
 	if (tscm->substreams_counter == 0 || rate != curr_rate) {
+		amdtp_domain_stop(&tscm->domain);
+
 		finish_session(tscm);
 
 		fw_iso_resources_free(&tscm->tx_resources);
@@ -405,8 +413,10 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		return 0;
 
 	if (amdtp_streaming_error(&tscm->rx_stream) ||
-	    amdtp_streaming_error(&tscm->tx_stream))
+	    amdtp_streaming_error(&tscm->tx_stream)) {
+		amdtp_domain_stop(&tscm->domain);
 		finish_session(tscm);
+	}
 
 	if (generation != fw_parent_device(tscm->unit)->card->generation) {
 		err = fw_iso_resources_update(&tscm->tx_resources);
@@ -419,6 +429,8 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 	}
 
 	if (!amdtp_stream_running(&tscm->rx_stream)) {
+		int spd = fw_parent_device(tscm->unit)->max_speed;
+
 		err = set_stream_formats(tscm, rate);
 		if (err < 0)
 			goto error;
@@ -427,27 +439,23 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_stream_start(&tscm->rx_stream,
-				tscm->rx_resources.channel,
-				fw_parent_device(tscm->unit)->max_speed);
+		err = amdtp_domain_add_stream(&tscm->domain, &tscm->rx_stream,
+					      tscm->rx_resources.channel, spd);
 		if (err < 0)
 			goto error;
 
-		if (!amdtp_stream_wait_callback(&tscm->rx_stream,
-						CALLBACK_TIMEOUT)) {
-			err = -ETIMEDOUT;
+		err = amdtp_domain_add_stream(&tscm->domain, &tscm->tx_stream,
+					      tscm->tx_resources.channel, spd);
+		if (err < 0)
 			goto error;
-		}
-	}
 
-	if (!amdtp_stream_running(&tscm->tx_stream)) {
-		err = amdtp_stream_start(&tscm->tx_stream,
-				tscm->tx_resources.channel,
-				fw_parent_device(tscm->unit)->max_speed);
+		err = amdtp_domain_start(&tscm->domain);
 		if (err < 0)
-			goto error;
+			return err;
 
-		if (!amdtp_stream_wait_callback(&tscm->tx_stream,
+		if (!amdtp_stream_wait_callback(&tscm->rx_stream,
+						CALLBACK_TIMEOUT) ||
+		    !amdtp_stream_wait_callback(&tscm->tx_stream,
 						CALLBACK_TIMEOUT)) {
 			err = -ETIMEDOUT;
 			goto error;
@@ -456,6 +464,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 
 	return 0;
 error:
+	amdtp_domain_stop(&tscm->domain);
 	finish_session(tscm);
 
 	return err;
@@ -464,6 +473,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm)
 {
 	if (tscm->substreams_counter == 0) {
+		amdtp_domain_stop(&tscm->domain);
 		finish_session(tscm);
 
 		fw_iso_resources_free(&tscm->tx_resources);
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 734e5bb9c3da..64a2e4d2bbfe 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -97,6 +97,8 @@ struct snd_tscm {
 	struct snd_firewire_tascam_change queue[SND_TSCM_QUEUE_COUNT];
 	unsigned int pull_pos;
 	unsigned int push_pos;
+
+	struct amdtp_domain domain;
 };
 
 #define TSCM_ADDR_BASE			0xffff00000000ull
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
