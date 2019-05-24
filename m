Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB329431
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 334CF16C0;
	Fri, 24 May 2019 11:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 334CF16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688825;
	bh=P4dNZbS7AX617NzZ0ZVPZJdbNkWQ1FuRvUW7gDtpYeg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9Ba2O+H+k6ggU04kpp3GhApHQ5M+JUhua6N/82/mOaK1KhBXJgVSSsUqairOyJTL
	 mc2WqitVho/ZMdgvE44svcoIbUHk2lqEYCveyeB2mZxOb5BuPEFB81iJMxoPz7GTs5
	 E3arVyQ7H4TxnQJYDFFUspRfhQyjCXAvXTBARbHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB8FEF89625;
	Fri, 24 May 2019 11:04:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BE7F89633; Fri, 24 May 2019 11:03:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9C9F89630
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9C9F89630
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="X5bTTaEt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FH61Hyft"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CB58821873;
 Fri, 24 May 2019 05:03:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 May 2019 05:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=R9Jpgpksz1Nwt
 M0KQzOWQgNly3fxHLbwW+4CiE/nDq4=; b=X5bTTaEtSeWLRfdHXsIYN61y0Q9pE
 R0yiHDTwqtwPwE/V0QrXclrbm0hMnQBO7qzr6hLWDnJTyaZ6ZQCNUdmssTybv1HG
 mVv5loSOaXbnJ6uImnUbcRiX2K6/0LK/I6rwLJwxnGcVx+mbE9JFJ31dFUync34Y
 qTpyxgCg3XrTCkhJ1sPVDhs627skOgB0smoFbPGWozFb9WIV+j2fTUdurpVFK6Mf
 G7ZzdZN4u3ep+kgpZqXFObRLt6mTPUQYPDm1UduAunLA8BcHGASTN6T0HuGbLaAb
 v00Pli+xPg5htAUaSvlbj0m44n884Zc/WdCymfMJYT+1Y8f2T3uZ5npeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=R9Jpgpksz1NwtM0KQzOWQgNly3fxHLbwW+4CiE/nDq4=; b=FH61Hyft
 6kRd18MbzmnZKAOXIGUcKeBKrSV2MzuqSS+t4P1fKmdaSxd8T/BEnN7qC/qtUTjy
 d90kpcjH44JORCrZYeyOW2R50oLtn2ztaZ2+iF7VX1/tkEL1p0C6ou8c91Gm0nOu
 c7bSDob7+qYUThrnR/J8XPtDhWFFwvC4bXDLbjvMEU41V8l5Qe6zmR3v9XfljFjI
 AdJztLOgznA/XqkSmoHQRfteQvhwcEkA85addmSAeLa5N8xuklNR15mBhzTv23YM
 eCA9KF/IfjaggpAhn9Ro5twDo+bLCNqEgUocO6y6D9bglZzvBbIH1tB+3eL/QQUs
 dJB8q04Z9O3iOg==
X-ME-Sender: <xms:drPnXK5jGVUV_Me_6a6YfT5hSzRQcgREIRzZcMigjUaw4vRp0UVWJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:drPnXDrwlGhkmH8nKtucdK0IDvoeqzaYuxnkIp4IpZcogHK6b8_iJg>
 <xmx:drPnXL8I_nSSshRpddXClZdSwR7X-iqzbNxEsU2g-q5WtqhX8Sy4qQ>
 <xmx:drPnXGdVv5QnJ31SeID2ngisd8QLhf5drTS2dDIrLBJV2P5dVU8Now>
 <xmx:drPnXHU0cDC_bFwbnMoDU1gfujYU3kpOu8c6cmz1InO6H-o-OEoDgA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 482E080060;
 Fri, 24 May 2019 05:03:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 18:03:40 +0900
Message-Id: <20190524090342.15619-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
References: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/4] ALSA: firewire-lib: fix inverted node IDs
	for amdtp_packet events
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

The amdtp_packet events have inverted node IDs for src/dst. This commit
fixes the bug.

Fixes: 8d3f1fdf5211 ("ALSA: firewire-lib: unify tracing events to 'amdtp_packet' event")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index ab708857979f..5fe0920f04e5 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -35,11 +35,11 @@ TRACE_EVENT(amdtp_packet,
 		__entry->cycle = cycles % CYCLES_PER_SECOND;
 		__entry->channel = s->context->channel;
 		if (s->direction == AMDTP_IN_STREAM) {
-			__entry->src = fw_parent_device(s->unit)->node_id;
-			__entry->dest = fw_parent_device(s->unit)->card->node_id;
-		} else {
 			__entry->src = fw_parent_device(s->unit)->card->node_id;
 			__entry->dest = fw_parent_device(s->unit)->node_id;
+		} else {
+			__entry->src = fw_parent_device(s->unit)->node_id;
+			__entry->dest = fw_parent_device(s->unit)->card->node_id;
 		}
 		if (cip_header) {
 			memcpy(__get_dynamic_array(cip_header), cip_header,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
