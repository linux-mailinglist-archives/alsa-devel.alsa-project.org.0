Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E234A221
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDB0816CE;
	Tue, 18 Jun 2019 15:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDB0816CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864589;
	bh=jSF7uBB+vgDnWbDkLvLI15Fufc+3gwTczpwSVbWr3B8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/rgIM1SBpz7VJ+xRhIMSOjEcf6gigyBu7WDDmSSCmqOAzB6OAZdGUTI5vi8n7ebA
	 FPbuEf0PtSKJBu/W3VuMFHovoXN6fCUzfCewwQ2aVbCzLWBvEKrnfUddK9FZHxBvy+
	 ldsTz8PLUZLLNqXcv+81fLMc9WZUhNgtuLwlEJuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAF6F89737;
	Tue, 18 Jun 2019 15:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA0DF8971F; Tue, 18 Jun 2019 15:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04BADF896F4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04BADF896F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cYONb+lO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="f3BpZ4pF"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CE03F2215D;
 Tue, 18 Jun 2019 09:26:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oLzcsQnOBsq6m
 0w5UUgPHX0uN8Fcy2u9w4yjZjLl9DI=; b=cYONb+lOp+NC8cAGdlanNVim70qSc
 KBUDopQ/wIppyzUiInWR+7rUF6o/S0Ko/2GvqOq6dzCsyUO7ZLncfUCs83rxyJJv
 ZA3IR0tkljlWNp/gHORWbhZOm3i+gkpqY6zDok6NoH4X/tyTbPCQseWR9ik60NWW
 Bd9qHgnvrslizQ/lZ6B/A5m9+gsNtyaVxB4TxxBPnbH+iF0ZLekuPbeV1Djq2pIM
 fPDnfvbEBSNQb5aNnayuTlWkBSAkDGs5r1QAcK4hcsS5gEGVbifH+ladRDXWbj7M
 LdIjAgdJNc0rrcEsC+SjU19uHWFqCPfGqIvj9pCw6a7Bpb6nhvEjXOWxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=oLzcsQnOBsq6m0w5UUgPHX0uN8Fcy2u9w4yjZjLl9DI=; b=f3BpZ4pF
 LjHXLJ/jD2Q6/sZuDdU/QHyWj7pNwaNvoYGPfIMWh1ALFD3l7zZpSk9z+ExxAw4Q
 5K+HnGdD/0bTvMvh8ObJoSiTdwSL198AsjeuC6wITKxYC0sj06jkYIeJ1PXyFWvq
 XOdyIxxErURCGOHlyStxKgD0v2aD+DzD8QgvT9t1YrhSTReJbTpLITNorMCApAgk
 hbs2+9MwEml061z/bMVWixdQUdd0umfv7NVdtHbgko6BI1odkQ7DR0ATq3EDK1Pu
 wFRSnjbaYrGphKFrERd9/V97GAuqGE3zDuiB/CV5BBvhDykpv9+VmWJeYSoohitV
 WKuWSUtWvlG5Iw==
X-ME-Sender: <xms:huYIXVwQxNPecdzYAf7cwV0gcLpWPfDSksBelNVfXSao7e47L9m_Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:huYIXTyyAcgGMNajVjS-S7_u2165xP-6CykZVmkOBZ1qbpriqxp9zQ>
 <xmx:huYIXWBB5E_lEkvKNXUkqhERfDgLE4F_Asg04nwGMP89KWFpraNuUw>
 <xmx:huYIXWoAoSdGxdHN7c813cugZsRMoJanaIDfy2a0eTHvGQGZm3lsKA>
 <xmx:huYIXVmP2lABZGUojykZE_k3ES6IDhL6iWq8lYWcgzFzD4tkBNGURQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3AE15380084;
 Tue, 18 Jun 2019 09:26:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:16 +0900
Message-Id: <20190618132622.32659-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/8] ALSA: fireface: unify stop and release
	method for duplex streams
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
 sound/firewire/fireface/ff-pcm.c    |  1 -
 sound/firewire/fireface/ff-stream.c | 14 +++++---------
 sound/firewire/fireface/ff.h        |  1 -
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 938985c2d4a8..75228e769687 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -233,7 +233,6 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 		--ff->substreams_counter;
 
 	snd_ff_stream_stop_duplex(ff);
-	snd_ff_stream_release_duplex(ff);
 
 	mutex_unlock(&ff->mutex);
 
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index 884705ecf940..049920a6d43e 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -149,14 +149,6 @@ int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
 	return 0;
 }
 
-void snd_ff_stream_release_duplex(struct snd_ff *ff)
-{
-	if (ff->substreams_counter == 0) {
-		fw_iso_resources_free(&ff->tx_resources);
-		fw_iso_resources_free(&ff->rx_resources);
-	}
-}
-
 int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 {
 	int err;
@@ -217,8 +209,12 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 
 void snd_ff_stream_stop_duplex(struct snd_ff *ff)
 {
-	if (ff->substreams_counter == 0)
+	if (ff->substreams_counter == 0) {
 		finish_session(ff);
+
+		fw_iso_resources_free(&ff->tx_resources);
+		fw_iso_resources_free(&ff->rx_resources);
+	}
 }
 
 void snd_ff_stream_update_duplex(struct snd_ff *ff)
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index fe5739ee1c88..9b52c368f6de 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -139,7 +139,6 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 int snd_ff_stream_init_duplex(struct snd_ff *ff);
 void snd_ff_stream_destroy_duplex(struct snd_ff *ff);
 int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate);
-void snd_ff_stream_release_duplex(struct snd_ff *ff);
 int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate);
 void snd_ff_stream_stop_duplex(struct snd_ff *ff);
 void snd_ff_stream_update_duplex(struct snd_ff *ff);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
