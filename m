Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7025947C02
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 10:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94B71772;
	Mon, 17 Jun 2019 10:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94B71772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560759674;
	bh=yweMTpNjLVcXU88gXZuvrDaAUNTjGFJtEpVzVT5iqUU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZK36pmUjKGjClryZczXwSlUo44v65mLdsvUfQFxaeoM0V9J2lPrWDMDWOTQb7pC95
	 HLXv4SYNNDGlBrM2sBSJVt6Iq0wvRJywqoA/VF36FIO8uo0aenWHM75DPDrlblmZC4
	 xu4c1dwhvzTRfC6D3oAya4+hFUvxU9+hxynZ+Bl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF9ABF8974A;
	Mon, 17 Jun 2019 10:15:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F0AAF89739; Mon, 17 Jun 2019 10:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D969FF89731
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 10:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D969FF89731
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QgKW+Bpt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AtbjV6wU"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4D9BB742;
 Mon, 17 Jun 2019 04:15:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2019 04:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YB3QTVDnUAnY3
 Q89JRB1kmvXMxhD63jaAITcj1CM6Xg=; b=QgKW+Bpt4nbDVGw3U3Ha9VOCzIj8E
 TWVh0LtatQGkVJAYYNK3vwFnq9t5qZ+t/YEDDsZdHDr4J4P/ruLK6kbRSzoi5Egy
 bMmFEE79eTFWpGbkppXLjDbi1mnMuuQg0LYb2OX1GK1gGAXy6Wbl0cX9AoaCvope
 Em6ZtXN00CHE89Mb2VflFHrnROOyJ0rdzCAP5J8a1cMbwMdMWGRsvLXoT41YUUhs
 PQaqAHhAR52RzDNGoXoVHK5ci9qOQnvOgzAUjK6uBdZxw/zFZ2TU76msKvBZIogn
 Lb8tsFJ2sMMsz9bWXTQYn1r/ZbicfHz/F32q9md1xDA8YTb3fgsbNGGyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YB3QTVDnUAnY3Q89JRB1kmvXMxhD63jaAITcj1CM6Xg=; b=AtbjV6wU
 5cmx0NFmXRkZMKD4d8dhXdGoxKyjsU3fHA+RHrF4nYz3W1ZcNxEAf6FCcqvFWd8e
 tE7zbnGJZk1Hc30EnsitNq7N43XpayQGl80ho9mrbcchL4pw9ttaw0kUqQ0OOQy/
 3fdBZtZCu2/k/vzS5A3+1EFNINopHK/cB4BPiw/engYXj+woUTLke40B1Irynn+e
 IctN9u+ONKQUq5daQD3LiwB1ThyvNhqhJgjA6dtCQe5IWGg/33cAj5E/bQPkYDQL
 k6Tj5uKSqtuUFbpzR9eX+28iIkM072yfJ1j8ek6MJ6bNvmjSaUz+R+DP3RMIhHD/
 UFlxM7zak/LUbg==
X-ME-Sender: <xms:HEwHXdfzrwvOG38layvLpczg0hSV4bfCK-B8_uZ31tELERelQA7agQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:HEwHXffxVuwyWNq417iYynLPsn2xA3WmqrsfRtZTIIhvoUcQERD65w>
 <xmx:HEwHXRjdx8GYLjxj8KGsrO4YGyk97SdckS-Yu7RB4TMHPkXj9OC2rQ>
 <xmx:HEwHXbS828OVULnPsnNGuHeEtQT508BNAXUfVSFDOZ06_AQ7Kw9eNA>
 <xmx:HEwHXYTalFLhuTAwlKS37v_9hqraZ4gCc_VS6HjSp75gI7XdkEVPyQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C01080065;
 Mon, 17 Jun 2019 04:15:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 17 Jun 2019 17:15:06 +0900
Message-Id: <20190617081510.11025-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
References: <20190617081510.11025-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/10] ALSA: firewire-motu: minor code
	refactoring to stop isochronous context
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

The helper function to stop isochronous context is superfluous. This
commit removes it with simpler codes.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index cb01f1d784f1..4fbec35eaad5 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -142,19 +142,6 @@ static int start_isoc_ctx(struct snd_motu *motu, struct amdtp_stream *stream)
 	return 0;
 }
 
-static void stop_isoc_ctx(struct snd_motu *motu, struct amdtp_stream *stream)
-{
-	struct fw_iso_resources *resources;
-
-	if (stream == &motu->rx_stream)
-		resources = &motu->rx_resources;
-	else
-		resources = &motu->tx_resources;
-
-	amdtp_stream_stop(stream);
-	fw_iso_resources_free(resources);
-}
-
 int snd_motu_stream_cache_packet_formats(struct snd_motu *motu)
 {
 	int err;
@@ -292,11 +279,11 @@ int snd_motu_stream_start_duplex(struct snd_motu *motu, unsigned int rate)
 void snd_motu_stream_stop_duplex(struct snd_motu *motu)
 {
 	if (motu->substreams_counter == 0) {
-		if (amdtp_stream_running(&motu->tx_stream))
-			stop_isoc_ctx(motu, &motu->tx_stream);
+		amdtp_stream_stop(&motu->tx_stream);
+		amdtp_stream_stop(&motu->rx_stream);
 
-		if (amdtp_stream_running(&motu->rx_stream))
-			stop_isoc_ctx(motu, &motu->rx_stream);
+		fw_iso_resources_free(&motu->tx_resources);
+		fw_iso_resources_free(&motu->rx_resources);
 	}
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
