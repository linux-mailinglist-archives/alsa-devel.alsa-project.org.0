Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8703226F
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CF8E1692;
	Sun,  2 Jun 2019 09:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CF8E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460269;
	bh=ChKytXASQ0eBZ545zf2Y2XZUMfN7gVf9otthvmWx/Ls=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Toe/+mSrbUYGPPhNS/D8SDMGkKbQFFNcu8keeP/ep/uEZxAFXnWoECMmriNLYUdF2
	 j8MgQi9UV6VdOPGYMB2Y35niZNl86txtICzGR5L+ctzQvXIwaPW7/3gkonf6UaNkA0
	 OXrU+a/rdD+pFc8SpaQndI0WWdiT7Zu3Sr2DrPZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF566F89781;
	Sun,  2 Jun 2019 09:13:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C1FF89759; Sun,  2 Jun 2019 09:13:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28D47F8974F
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28D47F8974F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DXzeGOlI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="5+gN04mT"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B14420D56;
 Sun,  2 Jun 2019 03:13:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SEtOuMXx+NXc3
 MqAvVMqM3fRiDTQ9JJfnFc8M241TYg=; b=DXzeGOlInUNbmeoCWfBKOC5HeW7st
 KSaB84L3oDXx4RVhUKrCvd/zkhbsRJqDifTG2Wy9TbC4ajvuM7Pfu4W1NjfJ+w41
 LUKMIuzV2UluZtnKfQ6hI7N309JdjX/SXZGRjiXtOmlfK5Tm0oqR+MI2CPFzMo20
 aOng1/zrWBnGoJoEZMbDykrcRMY50qOwEtfGTFu+8zrVHbWCy2PDJrPD5f8AIaDp
 OLDEsipX1WUzd9Ea4VZLrZHI78atvi9ox1ydM5J/Bz7W44fQNjg8d80JNDA2jZWh
 mAeI1nMy0a9JL5Q1pWYzijgEWDJLbCrLmoVZihR1x0NOjtxc1tgZyn8wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SEtOuMXx+NXc3MqAvVMqM3fRiDTQ9JJfnFc8M241TYg=; b=5+gN04mT
 4WF/pvam799HHflnzRKvmBlBwgz5xGnlCmFIbb3xS1fmUSrUkwLS8rRFm6c4657s
 8VqdlK1v2inFTQStxY82UXn4Ug4t2Ae/uHmNQFzig5pAu9vomyDyzlUCvF8IvPc1
 RjskIwCxJtiRZl6Nzid14lIYprai9vwVnm2rR7QQhFMFf9nCLijtTuLoWtH61jyb
 wCEhWbmp8ic7iKZC/FfyCNdgbGKeEMgIJoH2Ni5LzcuU17MqXHUWaTWhV5e+tCFo
 sPma42wdlKlijBe9jamgyeJgCaRqrd1e9qlZ8AxflRV+ynlZmkd7uKfJgwBcnShh
 DRjOfxOczCEfSw==
X-ME-Sender: <xms:FnfzXOFcefn1sGEaxOlPaQlAO1oqa3NYbgaMJ5EabCSnqhNk184j9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:FnfzXJfPjxY272vxxPGwJ5lb7fMBz7wWi3KWORwk9SWpCEMryVIFIQ>
 <xmx:FnfzXJ2WyvQG3oXS4tmeDlm6f31IgBxr8hCDeoH_KnjuOTd_XYp4DQ>
 <xmx:FnfzXGwAi76qGWd1KtoGGp8ptyLE8tc-4EGZ5TIkdT2noxvG3M1R7w>
 <xmx:FnfzXLV9c6KvqOdsjdg3OdS-epgb0fvevtqQ-9j_XGW-59DYxft3Xg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 002D08005A;
 Sun,  2 Jun 2019 03:13:24 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:58 +0900
Message-Id: <20190602071259.21622-15-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 14/15] ALSA: fireface: minor code refactoring
	to finish streaming session
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
 sound/firewire/fireface/ff-stream.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 4f40dfb11979..884705ecf940 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -33,6 +33,9 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 
 static inline void finish_session(struct snd_ff *ff)
 {
+	amdtp_stream_stop(&ff->tx_stream);
+	amdtp_stream_stop(&ff->rx_stream);
+
 	ff->spec->protocol->finish_session(ff);
 	ff->spec->protocol->switch_fetching_mode(ff, false);
 }
@@ -112,9 +115,6 @@ int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
 		enum snd_ff_stream_mode mode;
 		int i;
 
-		amdtp_stream_stop(&ff->tx_stream);
-		amdtp_stream_stop(&ff->rx_stream);
-
 		finish_session(ff);
 
 		fw_iso_resources_free(&ff->tx_resources);
@@ -165,12 +165,8 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		return 0;
 
 	if (amdtp_streaming_error(&ff->tx_stream) ||
-	    amdtp_streaming_error(&ff->rx_stream)) {
-		amdtp_stream_stop(&ff->tx_stream);
-		amdtp_stream_stop(&ff->rx_stream);
-
+	    amdtp_streaming_error(&ff->rx_stream))
 		finish_session(ff);
-	}
 
 	/*
 	 * Regardless of current source of clock signal, drivers transfer some
@@ -214,9 +210,6 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 
 	return 0;
 error:
-	amdtp_stream_stop(&ff->tx_stream);
-	amdtp_stream_stop(&ff->rx_stream);
-
 	finish_session(ff);
 
 	return err;
@@ -224,12 +217,8 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 
 void snd_ff_stream_stop_duplex(struct snd_ff *ff)
 {
-	if (ff->substreams_counter > 0)
-		return;
-
-	amdtp_stream_stop(&ff->tx_stream);
-	amdtp_stream_stop(&ff->rx_stream);
-	finish_session(ff);
+	if (ff->substreams_counter == 0)
+		finish_session(ff);
 }
 
 void snd_ff_stream_update_duplex(struct snd_ff *ff)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
