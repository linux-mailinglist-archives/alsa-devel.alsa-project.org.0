Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950432266
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:19:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA09E1691;
	Sun,  2 Jun 2019 09:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA09E1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459940;
	bh=/gZ663L5p3IOA6DEIl4IDfy3VkzSY4bLPgdFWj/C868=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIxVY/8M5Es7BY7WGxb2pshYCSMzlN2o8dHnqh5xIJnX/p4Ctv4A9KMBnKYNPuvLz
	 LzxMPwj7n0Lflml8TpvGl0HuVqapJfgp9t5Un439i2/FuQ/OOIigofORcBmr8jSrVV
	 3roKbu3yBJsImTVgI2a71P4mUxESl9EPJdOWmlNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9CAEF8974D;
	Sun,  2 Jun 2019 09:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7775F89730; Sun,  2 Jun 2019 09:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F403AF896FE
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F403AF896FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hPrZGi7L"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="8S39Mdxm"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F05B21CFD;
 Sun,  2 Jun 2019 03:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SM+vY1briAB4D
 llqIia3As5kUxtDeo7e/g6WbTRv/Zc=; b=hPrZGi7LC6DGW/kc0oeh3eG7YOlbr
 CK+IzzqY3ia77ZmP7JBDSTnO5+Cd/0FfqfS60wZBO8On4GDHqTH47nBUTlc1vc+5
 kzSpMJIwY0S9Yh59bP/TxfOPuB5d+RR4fjXY2xSPkLBmTY5cYWBkPPNLkvDU3NMx
 54Aa5Ts8Crf/34bFv440nWjfauuFURrHtCe1XzUUahtPx0u/eGX5pW6CvJMxbtLm
 uP47diQcKSURK2FOmZcBhcZf9UhURFc28BKIDXJVFk6xhoo8ybJmN+H6T+eL1rGh
 q4hR+HzC5tUVD1GLRGJXlmoTxE7Ce3Fa4VbxLAzTEGnMZWAZZLPEfiMHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SM+vY1briAB4DllqIia3As5kUxtDeo7e/g6WbTRv/Zc=; b=8S39Mdxm
 XYfrmKON9hLlQtUr+NzrZOslwUmlOnXn5vR7G7Cj2s39NlBJ3i6znDSY4DRnFBjd
 2LtyBzTt8cfieGwrHMv15pt4AJ/gV8ixGXgZI0uYbuAHiAmRLZVCj3qFOn/fIDtH
 Msu0VL9rqLuIFiXBy8pxFiH7vMjv4pmWfGxfTWVKBhavbGLvEi+a3GzCj43CeBGf
 xji2KTczQ6jdWIIkuqHEKRQ0LQY6fHViyDE1VRF3ZPHoLfYdOU3Syzv+/A70UMkp
 VtfnhlB08LZ25+Yk7mDF0smhg58m4TNTjMChbwwg5rgfkgAOGwETlruwXWBl8dOa
 PsYki8B/MRugEA==
X-ME-Sender: <xms:CnfzXPlgHehkI69i01GQ7Q6DHhCFffifdnUN7QyhV5jWETm1pmgWzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:CnfzXO9KDJjifYYvRk9ptaCIvA_rsD4RpHFgVbgjRLOiV98n3IFNoQ>
 <xmx:CnfzXO69N9xh-T73Fq_cog8NtcSySweFqbvifNedOyHzKMMhivkGfA>
 <xmx:CnfzXGoXq6dqHIifBHGe4jueSmKloiA-XGoNfj3Lih6D-YGo9H0yTQ>
 <xmx:CnfzXDeJJZqNjVCG12Z0qozI8-mzfFdldazCDpEyrrUmg0sDl3C2uA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id C745780059;
 Sun,  2 Jun 2019 03:13:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:50 +0900
Message-Id: <20190602071259.21622-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/15] ALSA: firewire-tascam: minor code
	refactoring to finish streaming session
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

The operation to finish packet streaming corresponds to stopping
isochronous contexts.

This commit applies code refactoring to move codes to stop into
a helper function to finish the session.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index be9dcc808188..f572dfc15114 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -181,6 +181,9 @@ static void finish_session(struct snd_tscm *tscm)
 {
 	__be32 reg;
 
+	amdtp_stream_stop(&tscm->rx_stream);
+	amdtp_stream_stop(&tscm->tx_stream);
+
 	reg = 0;
 	snd_fw_transaction(tscm->unit, TCODE_WRITE_QUADLET_REQUEST,
 			   TSCM_ADDR_BASE + TSCM_OFFSET_START_STREAMING,
@@ -354,9 +357,6 @@ int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
 		return err;
 
 	if (tscm->substreams_counter == 0 || rate != curr_rate) {
-		amdtp_stream_stop(&tscm->rx_stream);
-		amdtp_stream_stop(&tscm->tx_stream);
-
 		finish_session(tscm);
 
 		fw_iso_resources_free(&tscm->tx_resources);
@@ -397,12 +397,8 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		return 0;
 
 	if (amdtp_streaming_error(&tscm->rx_stream) ||
-	    amdtp_streaming_error(&tscm->tx_stream)) {
-		amdtp_stream_stop(&tscm->rx_stream);
-		amdtp_stream_stop(&tscm->tx_stream);
-
+	    amdtp_streaming_error(&tscm->tx_stream))
 		finish_session(tscm);
-	}
 
 	if (generation != fw_parent_device(tscm->unit)->card->generation) {
 		err = fw_iso_resources_update(&tscm->tx_resources);
@@ -452,9 +448,6 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 
 	return 0;
 error:
-	amdtp_stream_stop(&tscm->rx_stream);
-	amdtp_stream_stop(&tscm->tx_stream);
-
 	finish_session(tscm);
 
 	return err;
@@ -462,12 +455,8 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm)
 {
-	if (tscm->substreams_counter == 0) {
-		amdtp_stream_stop(&tscm->tx_stream);
-		amdtp_stream_stop(&tscm->rx_stream);
-
+	if (tscm->substreams_counter == 0)
 		finish_session(tscm);
-	}
 }
 
 void snd_tscm_stream_lock_changed(struct snd_tscm *tscm)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
