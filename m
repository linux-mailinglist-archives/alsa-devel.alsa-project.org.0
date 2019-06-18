Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 300154A224
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD49716EF;
	Tue, 18 Jun 2019 15:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD49716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864609;
	bh=VLkydJJwtAKi1xQ8+IE19gWi6ZI4yI18N65RDieDuCQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEpJeUYMbaY5NS7HBvazGyHpzURzZrdKiLQIcZ+RDZX+dqpULHqg4r4wtKbla8oUV
	 dtN/oTrDY5F2J/YhNkqHzsF9mHal0xaHXlHqzhl89bpbu1VOVtoUds/7ijqp2mQI7v
	 4fp4FLqoYGverG+O7olMKy+VCs4tflBgmlQIfzWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B32C5F89736;
	Tue, 18 Jun 2019 15:26:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97661F89729; Tue, 18 Jun 2019 15:26:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 690C4F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 690C4F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XfUyOZms"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YyQWlbzR"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 934D322243;
 Tue, 18 Jun 2019 09:26:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=HDuOf3QkBQFxM
 e1v3VUKzdugYI31cafIz2JSzxn6n6M=; b=XfUyOZmsgd8Za5jB13t6z0paWZOvv
 2AhUBdq/XKcdzcEVBsXdQwGs+6rB56nketx8W8YQ+psjRgtFes3e08mVcFzq35Uw
 wmb3OD0DJjdd6tl/wciZ7zATx83fu+rdFCzP/a3JJqJs/03dqHofppH04Og9gfGX
 93yxDDFVyzDyU6XFoPW1Z1V2SddXW0b7p/TqTqUF7povDpo/MIaxyfiM4QZceTch
 PhK4e94stLr1hcDINbAj91jowMKHm8FhYWZD71KgYQ71AG551WpGhwrbkzeCvCOE
 +rlH6iR9/cPV+vdvmrMtlTYfD5m+p2KvqXFbg7fLyaqm7iRTRyZV2cIVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=HDuOf3QkBQFxMe1v3VUKzdugYI31cafIz2JSzxn6n6M=; b=YyQWlbzR
 SWwEEfWWVAy0IyJTHzioNAbN+NNkblprdPgB4g25XmAiA/anKifuJI3b19C5wNeM
 Fh5kH5kGUNCsn2TPoawt5RQ5jNWz1+uCPAWGq/jwC7ztMoUuTYEQMKJEywSRIXs6
 wRhYWeOwFNi5oYfTIPnFdPcaRWow3ZqwsfAEsgUt9Ovv6cRvzkJCifOGN6GCA7Zu
 GDvCfR7BvQZ42kDd6oWpSvGibAUPZO1ol6BnMb9/lYCljuhbSyHO/ehvC8RQid5U
 hrVG+kfHe1N5dCvxmJcQe9XIJOdIEjMiRyFDGDwmUb8/QBYGg82RGtazG9AO+wgU
 okgOfYsWDub4pA==
X-ME-Sender: <xms:iOYIXcbZpVjmwIlb7eUrDg88PPIlI-UlswwFnD93v4Mpstrf1RDmVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:iOYIXR3sDWpWNnenhg0p_WWCXmbCBZwBTONeGE_QTerPBt8FseRGeQ>
 <xmx:iOYIXXbE9JvZccE0ZCANCMbllPRt4sK_Qb5F6TwJyP53lDAF-O3fEA>
 <xmx:iOYIXY1kyvTqA_rYes9sweaoNFCy6NnhXuh9bZbA3f8saQYakW-oOg>
 <xmx:iOYIXdilj2n67-8c_roi4elvl-ufc3QUFCVjpITtCdM_DGrrklO0KA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1F00380084;
 Tue, 18 Jun 2019 09:26:30 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:17 +0900
Message-Id: <20190618132622.32659-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/8] ALSA: firewire-motu: unify stop and
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
 sound/firewire/motu/motu-midi.c   |  1 -
 sound/firewire/motu/motu-pcm.c    |  1 -
 sound/firewire/motu/motu-stream.c | 14 +++++---------
 sound/firewire/motu/motu.h        |  1 -
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index a463730c72bc..4520c0060b83 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -40,7 +40,6 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 
 	--motu->substreams_counter;
 	snd_motu_stream_stop_duplex(motu);
-	snd_motu_stream_release_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
 
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index b9852c911b98..60c691d18952 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -224,7 +224,6 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 		--motu->substreams_counter;
 
 	snd_motu_stream_stop_duplex(motu);
-	snd_motu_stream_release_duplex(motu);
 
 	mutex_unlock(&motu->mutex);
 
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 82891583b736..8aab5db71c0f 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -200,14 +200,6 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate)
 	return 0;
 }
 
-void snd_motu_stream_release_duplex(struct snd_motu *motu)
-{
-	if (motu->substreams_counter == 0) {
-		fw_iso_resources_free(&motu->tx_resources);
-		fw_iso_resources_free(&motu->rx_resources);
-	}
-}
-
 static int ensure_packet_formats(struct snd_motu *motu)
 {
 	__be32 reg;
@@ -301,8 +293,12 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu)
 
 void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 {
-	if (motu->substreams_counter == 0)
+	if (motu->substreams_counter == 0) {
 		finish_session(motu);
+
+		fw_iso_resources_free(&motu->tx_resources);
+		fw_iso_resources_free(&motu->rx_resources);
+	}
 }
 
 static int init_stream(struct snd_motu *motu, enum amdtp_stream_direction dir)
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 32cd42873fd0..a4ac320f2c9e 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -154,7 +154,6 @@ int snd_motu_stream_init_duplex(struct snd_motu *motu);
 void snd_motu_stream_destroy_duplex(struct snd_motu *motu);
 int snd_motu_stream_cache_packet_formats(struct snd_motu *motu);
 int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate);
-void snd_motu_stream_release_duplex(struct snd_motu *motu);
 int snd_motu_stream_start_duplex(struct snd_motu *motu);
 void snd_motu_stream_stop_duplex(struct snd_motu *motu);
 int snd_motu_stream_lock_try(struct snd_motu *motu);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
