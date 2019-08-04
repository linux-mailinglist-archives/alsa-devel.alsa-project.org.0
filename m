Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85230809AF
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ECC41697;
	Sun,  4 Aug 2019 08:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ECC41697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900269;
	bh=kyQtdGefr/924mDlkxv90Z2NpKucMylGcgCl70lLRng=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B3Siugo5U+P8GfvFhPjRRN/E/Xe2eSuqfBokHjaY6l5uecdNsc9/OJF+6OJyMXs6/
	 Hks0HnCi+xxD3ZUNKtZfekQJYC6j1VlyA55nV5NPmL3H6JZkQpCALbPnZw+LNyKW1T
	 P9mUOoDk9HGEN6BfSe0z4f8kInvbk1wAlb174zs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA300F8067C;
	Sun,  4 Aug 2019 08:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB903F805A9; Sun,  4 Aug 2019 08:22:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 441DCF805A9
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 441DCF805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nk80vL9b"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MBzUtFDi"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 723512134B;
 Sun,  4 Aug 2019 02:21:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=rYxnxPlXozLYj
 eRQLsiNgs/GZ5EIK5LrudS5KVRTknQ=; b=nk80vL9bZCqSApcENoxbBVzZOr6DC
 vnS45FcUnnemo+T/lDbj6e4YzcV0TZC/z4b+ryUuyL9HxHqrgRJafv0Voq58Mrta
 JGGPV+6yMoUUqlH6BdfJf6rItnNBKd8MpnO/ZR2yARf1OTFoUFPui7+5tLo1Q4P7
 2a/FgeWAORZWmy9Q+/e/YyT2LdU+rOdrprmTh4q4WDuskpGQlOWaK6ULv2jjISn+
 3Zjce+FCxJjsfhR18uVEPKNrbrbo9WB6bYX0Imwzw/OWtKD0LOWFQyKGfFe/SqDM
 hjqlGG76JzvN/jgXRWnm6fLTpHh+67IZ/L/LJHtCBz5hmmWr9aqQzEfdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rYxnxPlXozLYjeRQLsiNgs/GZ5EIK5LrudS5KVRTknQ=; b=MBzUtFDi
 P12AJUBI5IoVECtWeqBumNsSzGt1C3+gpoFH9Qv1Pv9tgDTpEvDHbPFZr2LiXoMC
 ImAKmf0uVi29P1l27nEm4ot222MTd9MzqsEmHLAZEgPeoz6iVkw/0BxH0xT/a8At
 5OAbnnA5CllhgTBe+DiwAtTvD7AYClOSV+nfevYjvmXWl43WsesoEb273EYsARDg
 3nyQ6VQLikdv6CEyzy1uZVjrXLTPvyX5/3z9PPHM3gmWdfzqIjh4MSCOPMwS+RJX
 1LCop4+KPCtCyNGtQXMx+nr6KeVrE+R0cRS8ovAId6KZz/zq3HDhGSRF5tu1csD7
 cdUZeW3eBYEPxQ==
X-ME-Sender: <xms:h3lGXZTfFtBo8cHEgaYnuHHcbVI9MyngSH98kQjIWANkN_5yaPyg6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepuddt
X-ME-Proxy: <xmx:h3lGXaMh3kxT1ycjcRYr-C8X8_LxxYF-mO4Klc7MdIlWGFVdKDijXQ>
 <xmx:h3lGXcPMjt3vbbv0FBhoGKkaPENlJ_jQ2lvnuf0fP5KDuVkMd6JFkw>
 <xmx:h3lGXavkUmhq1RBEJgLesuU51lZgRxAKOBd42j9y_FG8JTkQZaxvLg>
 <xmx:h3lGXYOE2lkP4F2RGjQ0LhOKepS4Mv4Je1m0__QTrXBY25POfZYScA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 158DB380085;
 Sun,  4 Aug 2019 02:21:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:30 +0900
Message-Id: <20190804062138.1217-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/19] ALSA: bebob: support AMDTP domain
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

This commit adds AMDTP domain support for ALSA bebob driver.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.h        |  2 +
 sound/firewire/bebob/bebob_stream.c | 62 +++++++++++++----------------
 2 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index 9e0b689fe34a..356d6ba60959 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -115,6 +115,8 @@ struct snd_bebob {
 
 	/* For BeBoB version quirk. */
 	unsigned int version;
+
+	struct amdtp_domain domain;
 };
 
 static inline int
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 334dc7c96e1d..73fee991bd75 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -445,10 +445,9 @@ start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
 			goto end;
 	}
 
-	/* start amdtp stream */
-	err = amdtp_stream_start(stream,
-				 conn->resources.channel,
-				 conn->speed);
+	// start amdtp stream.
+	err = amdtp_domain_add_stream(&bebob->domain, stream,
+				      conn->resources.channel, conn->speed);
 end:
 	return err;
 }
@@ -523,7 +522,13 @@ int snd_bebob_stream_init_duplex(struct snd_bebob *bebob)
 		return err;
 	}
 
-	return 0;
+	err = amdtp_domain_init(&bebob->domain);
+	if (err < 0) {
+		destroy_stream(bebob, &bebob->tx_stream);
+		destroy_stream(bebob, &bebob->rx_stream);
+	}
+
+	return err;
 }
 
 static int keep_resources(struct snd_bebob *bebob, struct amdtp_stream *stream,
@@ -566,9 +571,7 @@ int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate)
 	if (rate == 0)
 		rate = curr_rate;
 	if (curr_rate != rate) {
-		amdtp_stream_stop(&bebob->tx_stream);
-		amdtp_stream_stop(&bebob->rx_stream);
-
+		amdtp_domain_stop(&bebob->domain);
 		break_both_connections(bebob);
 
 		cmp_connection_release(&bebob->out_conn);
@@ -620,9 +623,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 	// packet queueing error or detecting discontinuity
 	if (amdtp_streaming_error(&bebob->rx_stream) ||
 	    amdtp_streaming_error(&bebob->tx_stream)) {
-		amdtp_stream_stop(&bebob->rx_stream);
-		amdtp_stream_stop(&bebob->tx_stream);
-
+		amdtp_domain_stop(&bebob->domain);
 		break_both_connections(bebob);
 	}
 
@@ -640,11 +641,16 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 			return err;
 
 		err = start_stream(bebob, &bebob->rx_stream);
-		if (err < 0) {
-			dev_err(&bebob->unit->device,
-				"fail to run AMDTP master stream:%d\n", err);
+		if (err < 0)
+			goto error;
+
+		err = start_stream(bebob, &bebob->tx_stream);
+		if (err < 0)
+			goto error;
+
+		err = amdtp_domain_start(&bebob->domain);
+		if (err < 0)
 			goto error;
-		}
 
 		// NOTE:
 		// The firmware customized by M-Audio uses these commands to
@@ -660,21 +666,8 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		}
 
 		if (!amdtp_stream_wait_callback(&bebob->rx_stream,
-						CALLBACK_TIMEOUT)) {
-			err = -ETIMEDOUT;
-			goto error;
-		}
-	}
-
-	if (!amdtp_stream_running(&bebob->tx_stream)) {
-		err = start_stream(bebob, &bebob->tx_stream);
-		if (err < 0) {
-			dev_err(&bebob->unit->device,
-				"fail to run AMDTP slave stream:%d\n", err);
-			goto error;
-		}
-
-		if (!amdtp_stream_wait_callback(&bebob->tx_stream,
+						CALLBACK_TIMEOUT) ||
+		    !amdtp_stream_wait_callback(&bebob->tx_stream,
 						CALLBACK_TIMEOUT)) {
 			err = -ETIMEDOUT;
 			goto error;
@@ -683,8 +676,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 
 	return 0;
 error:
-	amdtp_stream_stop(&bebob->tx_stream);
-	amdtp_stream_stop(&bebob->rx_stream);
+	amdtp_domain_stop(&bebob->domain);
 	break_both_connections(bebob);
 	return err;
 }
@@ -692,9 +684,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob)
 {
 	if (bebob->substreams_counter == 0) {
-		amdtp_stream_stop(&bebob->rx_stream);
-		amdtp_stream_stop(&bebob->tx_stream);
-
+		amdtp_domain_stop(&bebob->domain);
 		break_both_connections(bebob);
 
 		cmp_connection_release(&bebob->out_conn);
@@ -708,6 +698,8 @@ void snd_bebob_stream_stop_duplex(struct snd_bebob *bebob)
  */
 void snd_bebob_stream_destroy_duplex(struct snd_bebob *bebob)
 {
+	amdtp_domain_destroy(&bebob->domain);
+
 	destroy_stream(bebob, &bebob->tx_stream);
 	destroy_stream(bebob, &bebob->rx_stream);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
