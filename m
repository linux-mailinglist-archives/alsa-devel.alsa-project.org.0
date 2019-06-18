Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649A4A219
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002B016DE;
	Tue, 18 Jun 2019 15:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002B016DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864502;
	bh=gc7TXn7+RXLl1LVIYvhGDBggElx3/da08I62EBZNIfw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZbEiX13CWuosAZ9JZOXHTN2vtb8U2iWBEsJ3llQlThV5dpFIuJUY9zMFz/NSCSDSr
	 FibvqmHYjM0KSMfy6OtbQsANoPCk25wneIH6WXG7C5GM5lo7DpyNf2zSL2f+M49F1G
	 OYa6qXZIRnI0uzMks1e7KXTv3/MLM0H/VZz5mJ2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D4FF8075C;
	Tue, 18 Jun 2019 15:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC2DF8971F; Tue, 18 Jun 2019 15:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E144F896DB
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E144F896DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DZ4d5Y7b"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IcI+OSz0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 19F692229C;
 Tue, 18 Jun 2019 09:26:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Rt3QcVJM8eQX3
 okQiwQgXzx2DQEIzr7dSVIBlr5O424=; b=DZ4d5Y7bi0U8KeX50iUQxLQxUi1O7
 WHBiEdyzJFWEvW6krlUdvtSZraI6liBTp6Ne60aBPzslAl8TGCAhb61yPGhJ7j3G
 eryaBcYEFklVTFm8nqxgazQ/Xq2vXPq3xKmAdgr0tfrshYGfuzc6v0oc0Mbrbenr
 YHNZGniYMsQVWiCzjU3/ZiQqMcxA7aeeSY8gKAe959OKUFLqCTMobpVmisA9wSuZ
 VgTy+LEn3Igxiy7O9IjqLPq491xmoeimnGs09SWMdMX0GH8jZqek5h53YsIRto2+
 DoRl3lKzmZ2B4lB3PMMSAtdEBoydf/LDQYDl9xQ7p8Jo+863wn9MBh1fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Rt3QcVJM8eQX3okQiwQgXzx2DQEIzr7dSVIBlr5O424=; b=IcI+OSz0
 VSr32XlnClxx1mWA4cTT3lvpnKnc76Lu5cYWwOj1q/BdUaB8rqHK0Pua1f2fi0Sn
 OmsfoeqilQD0cmzeCJ9BheaOSaGx7cH4aoNAPF9PegNe5kscQ0I4wYwJ4DGb8QQS
 4RPkO25vEfQ3lqr18dC+42yrAwYQ4pEoNGPNT+3LMez0W1weY2e/+Y1T2LujLhD/
 ZOOx/qXU4QjJTEAZkP3mRbRRL0JMy8RbOpHnkwiahL2HezIpdpHap6/ksD2YFuf8
 GBBD0nwRD+3ZAAnDyRWpTUDOFu6KYiZ2VlMJZnk8xX2ZDFJU2gcnEeM55U+L3D62
 D1eG8EDdoeRf3Q==
X-ME-Sender: <xms:hOYIXY0YvU2Pr7vHYWyd6-LeecvWBHp6Y13JthfOXZFaXULaaWtAoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:hOYIXdPzXkgS2GTZjdGyyqlyK1n-v3FNUjrGM7RziAg-hmhF3zdUXQ>
 <xmx:hOYIXV7sU_IsP50jvSxEXs93sThZT-AGNlxiTNG4pptVtl5aeEOU6g>
 <xmx:hOYIXV8jBQbBW-YSwupWRBSVzvGG7U6ytbUaP7yr7NR50wsL3vA0ew>
 <xmx:heYIXbsjQ1ioLYgAUJxlQI91SOz0aEP_TNfBVwiewcb9_0u98T3cjw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 72C99380088;
 Tue, 18 Jun 2019 09:26:27 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:15 +0900
Message-Id: <20190618132622.32659-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/8] ALSA: firewire-tascam: unify stop and
	release method for duplex streams
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

From callbacks for pcm and rawmidi interfaces, the functions to stop
and release duplex streams are called at the same time. This commit
merges the two functions.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-pcm.c    |  1 -
 sound/firewire/tascam/tascam-stream.c | 14 +++++---------
 sound/firewire/tascam/tascam.h        |  1 -
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 450711bef508..300683a82c68 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -118,7 +118,6 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 		--tscm->substreams_counter;
 
 	snd_tscm_stream_stop_duplex(tscm);
-	snd_tscm_stream_release_duplex(tscm);
 
 	mutex_unlock(&tscm->mutex);
 
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index f572dfc15114..0e515b7be276 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -380,14 +380,6 @@ int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
 	return 0;
 }
 
-void snd_tscm_stream_release_duplex(struct snd_tscm *tscm)
-{
-	if (tscm->substreams_counter == 0) {
-		fw_iso_resources_free(&tscm->tx_resources);
-		fw_iso_resources_free(&tscm->rx_resources);
-	}
-}
-
 int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 {
 	unsigned int generation = tscm->rx_resources.generation;
@@ -455,8 +447,12 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm)
 {
-	if (tscm->substreams_counter == 0)
+	if (tscm->substreams_counter == 0) {
 		finish_session(tscm);
+
+		fw_iso_resources_free(&tscm->tx_resources);
+		fw_iso_resources_free(&tscm->rx_resources);
+	}
 }
 
 void snd_tscm_stream_lock_changed(struct snd_tscm *tscm)
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 1cb75c374f11..4ed88cceaedb 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -148,7 +148,6 @@ int snd_tscm_stream_init_duplex(struct snd_tscm *tscm);
 void snd_tscm_stream_update_duplex(struct snd_tscm *tscm);
 void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm);
 int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate);
-void snd_tscm_stream_release_duplex(struct snd_tscm *tscm);
 int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate);
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
