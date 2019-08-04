Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4532809B1
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7566A16D5;
	Sun,  4 Aug 2019 08:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7566A16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900344;
	bh=Dzeb2yepCENPpoINm8byGbMNXpFt/CT6flpym+DnUz4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yckcx4Xjr/ogOKVFuYA1oM51YdmGRrkLUK1g/9K7lzq9ZQdeZPTou5djUwy7KEO96
	 e6CVNe1Ou8EU5fLISorZyeEv0Q2bUPUI1R7XFq8KdjKSen8nlrPXv7tLQtRiutyWeO
	 G4M8hIRnv57ZioZVwbxIbwNBaFCPdQTNyCYPBxcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB237F8070E;
	Sun,  4 Aug 2019 08:22:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C87CF805AE; Sun,  4 Aug 2019 08:22:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 434DEF805A1
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434DEF805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cdd6FNZz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="d1lIEGbe"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 70AA921947;
 Sun,  4 Aug 2019 02:22:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zGJJ5as6wolYJ
 fzlRv0btA69qIzY+Or44DF1RD6v5nI=; b=cdd6FNZz2sURX9005gcRUUtjB/4pQ
 PCk5aoUJYRfIzVWsKP54+b47L9uUjdjbxuMJJbPFWaQaKY51wm1ZpMe5KWUI+enX
 +rcssG8nnGDr8jBQM2gAofpU336/ysgHoxXNzhOIcmVz0Zrs0xzy97y5vEYIc//0
 sRINuztBliUhJQ4QoIm2kuvu2mrqbfBsClCo4OOxe/HtLb+bITYQfKYIux3Ylkj0
 PmBhCQXK7DVnkXo7HqhQ8nTDy3eIfHkgVXwZH0fu2qe55pr95bWrymYePXlcVEqb
 K92xKARPin4J8jxD8ECfg2rPRsbAv2BHJ6K30SgG0Sv1eXD5oK0aOvhyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zGJJ5as6wolYJfzlRv0btA69qIzY+Or44DF1RD6v5nI=; b=d1lIEGbe
 SAIK4Qd+gF+FOmim96Rilcwd/ptauWpQMp2Wb488TVLSuWG6kvXihB7Sh0VzYrzX
 FVvNj6leNMt1v0srB//09LZIS7l7AlYl187CrJTKH/VYL9dtkJQ4jmpK5236YYAv
 02ohGsLU+Va7TcRtl0EO7avUcH6KIT4Mv1DfaXOmVsv0d+MouAdqmqR8hyYml/0a
 mNYtpCLT6fyqFlBfga4smVWnrm0JGMFAZvYGe9l58H+bb3jiz37ZH+bw5N+IgU7s
 z31vQgm/jNg10euwG0Y01GLfF8lJLWLFDWz84ZuOqRFckIsn56mxlI/mNRABj8vN
 GNY3rDrVbdq3uw==
X-ME-Sender: <xms:inlGXTuMkTTaSIES14bLmcZ8yTe2MwpZ_blIohpJ1m-tpj3l9cd5yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddt
X-ME-Proxy: <xmx:inlGXdQmbe1v9OVdfDJuMiNDytHTw3ApU1uXFn2Wgj-zr5VIWtTDMw>
 <xmx:inlGXdu6oM20W5e3AJCqXrN1m_kVfmdudGawLk23sNbYQwvOVHI4cA>
 <xmx:inlGXbyGp-tUXmUm8aojmu_9DPz78B0irOUaoCv1WKYtnj1_eHlXQw>
 <xmx:inlGXbhjDqk_I4CG9meApvRFrAlMwNOG_fZbTyLidDbu1swes0DC1A>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23B62380085;
 Sun,  4 Aug 2019 02:22:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:32 +0900
Message-Id: <20190804062138.1217-14-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 13/19] ALSA: oxfw: support AMDTP domain
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

This commit adds AMDTP domain support for ALSA oxfw driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 72 ++++++++++++++++++-------------
 sound/firewire/oxfw/oxfw.h        |  2 +
 2 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 74c972d25c66..0318dc4dcc55 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -114,19 +114,13 @@ static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	if (err < 0)
 		return err;
 
-	err = amdtp_stream_start(stream, conn->resources.channel, conn->speed);
+	err = amdtp_domain_add_stream(&oxfw->domain, stream,
+				      conn->resources.channel, conn->speed);
 	if (err < 0) {
 		cmp_connection_break(conn);
 		return err;
 	}
 
-	// Wait first packet.
-	if (!amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT)) {
-		amdtp_stream_stop(stream);
-		cmp_connection_break(conn);
-		return -ETIMEDOUT;
-	}
-
 	return 0;
 }
 
@@ -280,12 +274,12 @@ int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 		pcm_channels = formation.pcm;
 	}
 	if (formation.rate != rate || formation.pcm != pcm_channels) {
-		amdtp_stream_stop(&oxfw->rx_stream);
+		amdtp_domain_stop(&oxfw->domain);
+
 		cmp_connection_break(&oxfw->in_conn);
 		cmp_connection_release(&oxfw->in_conn);
 
 		if (oxfw->has_output) {
-			amdtp_stream_stop(&oxfw->tx_stream);
 			cmp_connection_break(&oxfw->out_conn);
 			cmp_connection_release(&oxfw->out_conn);
 		}
@@ -325,55 +319,66 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 
 	if (amdtp_streaming_error(&oxfw->rx_stream) ||
 	    amdtp_streaming_error(&oxfw->tx_stream)) {
-		amdtp_stream_stop(&oxfw->rx_stream);
-		cmp_connection_break(&oxfw->in_conn);
+		amdtp_domain_stop(&oxfw->domain);
 
-		if (oxfw->has_output) {
-			amdtp_stream_stop(&oxfw->tx_stream);
+		cmp_connection_break(&oxfw->in_conn);
+		if (oxfw->has_output)
 			cmp_connection_break(&oxfw->out_conn);
-		}
 	}
 
 	if (!amdtp_stream_running(&oxfw->rx_stream)) {
 		err = start_stream(oxfw, &oxfw->rx_stream);
 		if (err < 0) {
 			dev_err(&oxfw->unit->device,
-				"fail to start rx stream: %d\n", err);
+				"fail to prepare rx stream: %d\n", err);
 			goto error;
 		}
-	}
 
-	if (oxfw->has_output) {
-		if (!amdtp_stream_running(&oxfw->tx_stream)) {
+		if (oxfw->has_output &&
+		    !amdtp_stream_running(&oxfw->tx_stream)) {
 			err = start_stream(oxfw, &oxfw->tx_stream);
 			if (err < 0) {
 				dev_err(&oxfw->unit->device,
-					"fail to start tx stream: %d\n", err);
+					"fail to prepare tx stream: %d\n", err);
 				goto error;
 			}
 		}
+
+		err = amdtp_domain_start(&oxfw->domain);
+		if (err < 0)
+			goto error;
+
+		// Wait first packet.
+		if (!amdtp_stream_wait_callback(&oxfw->rx_stream,
+						CALLBACK_TIMEOUT) ||
+		    !amdtp_stream_wait_callback(&oxfw->tx_stream,
+						CALLBACK_TIMEOUT)) {
+			err = -ETIMEDOUT;
+			goto error;
+		}
+
 	}
 
 	return 0;
 error:
-	amdtp_stream_stop(&oxfw->rx_stream);
+	amdtp_domain_stop(&oxfw->domain);
+
 	cmp_connection_break(&oxfw->in_conn);
-	if (oxfw->has_output) {
-		amdtp_stream_stop(&oxfw->tx_stream);
+	if (oxfw->has_output)
 		cmp_connection_break(&oxfw->out_conn);
-	}
+
 	return err;
 }
 
 void snd_oxfw_stream_stop_duplex(struct snd_oxfw *oxfw)
 {
 	if (oxfw->substreams_count == 0) {
-		amdtp_stream_stop(&oxfw->rx_stream);
+		amdtp_domain_stop(&oxfw->domain);
+
 		cmp_connection_break(&oxfw->in_conn);
 		cmp_connection_release(&oxfw->in_conn);
 
 		if (oxfw->has_output) {
-			amdtp_stream_stop(&oxfw->tx_stream);
 			cmp_connection_break(&oxfw->out_conn);
 			cmp_connection_release(&oxfw->out_conn);
 		}
@@ -409,13 +414,22 @@ int snd_oxfw_stream_init_duplex(struct snd_oxfw *oxfw)
 		}
 	}
 
-	return 0;
+	err = amdtp_domain_init(&oxfw->domain);
+	if (err < 0) {
+		destroy_stream(oxfw, &oxfw->rx_stream);
+		if (oxfw->has_output)
+			destroy_stream(oxfw, &oxfw->tx_stream);
+	}
+
+	return err;
 }
 
 // This function should be called before starting the stream or after stopping
 // the streams.
 void snd_oxfw_stream_destroy_duplex(struct snd_oxfw *oxfw)
 {
+	amdtp_domain_destroy(&oxfw->domain);
+
 	destroy_stream(oxfw, &oxfw->rx_stream);
 
 	if (oxfw->has_output)
@@ -424,13 +438,13 @@ void snd_oxfw_stream_destroy_duplex(struct snd_oxfw *oxfw)
 
 void snd_oxfw_stream_update_duplex(struct snd_oxfw *oxfw)
 {
-	amdtp_stream_stop(&oxfw->rx_stream);
+	amdtp_domain_stop(&oxfw->domain);
+
 	cmp_connection_break(&oxfw->in_conn);
 
 	amdtp_stream_pcm_abort(&oxfw->rx_stream);
 
 	if (oxfw->has_output) {
-		amdtp_stream_stop(&oxfw->tx_stream);
 		cmp_connection_break(&oxfw->out_conn);
 
 		amdtp_stream_pcm_abort(&oxfw->tx_stream);
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index cb69ab87bb14..c9627b8c5d6e 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -63,6 +63,8 @@ struct snd_oxfw {
 
 	const struct ieee1394_device_id *entry;
 	void *spec;
+
+	struct amdtp_domain domain;
 };
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
