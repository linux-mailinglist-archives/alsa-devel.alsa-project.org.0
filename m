Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2B2268C
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 12:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F871691;
	Sun, 19 May 2019 12:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F871691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558260298;
	bh=bRW0z6yqwXuHfP2wfTTJtxT9VyeDMtzX0xDuFgVJ+Bs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EdyL+MJs9BWnWg7ODc6Z/ItoWsCWGYRHn1exKHed2hhZC7YTGct4JsbfKGmULzvX5
	 FoEjYVeP2vXaxK3VArmhjS9+ju3fTSeDNfe8na/O0jmP5WZXHlGo62Q7/M4uPl4Y9i
	 pFKNAhJMh7DqqAIU7JFdTppzkQIQ17PhrF2uT430=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C651F89730;
	Sun, 19 May 2019 12:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13E4CF89717; Sun, 19 May 2019 12:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E52F89618
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 12:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E52F89618
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PrjmyriD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nKyTfp0+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 022F221FC1;
 Sun, 19 May 2019 06:01:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 May 2019 06:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bQDUt4AoPcNr+
 Nv91iNwg2yGlsdH1IDmI0vjiwnfGmM=; b=PrjmyriDmwi4GibL6TnXix8o4Ok+h
 mdGrcjG/F48re6hLHcno6jUMQnQXrEy8mWHCOKGgazNzbWpcxXA/k7lXjoK6Bns9
 gS6BUpMEHU4p+G2ySco/tlLQSVwWcH5YGismT2XVmsHf9qNVXq6+TEYN6hrNpz0f
 DjagLutXcrC74Drz7GH6VtY+9yEsg632FmCOs7hWIo6lSvVeahDKXbhcRhjzkkux
 tEy0ap2P+AncDZBggNgEDNsjMf0xuNja7pOJ6grDeV6yLGp7TzCfgmswbv6ch6UZ
 4Z4LS6v4KjSWG/6bqsD+c41HuQRp5wXKKbUXtQAAUEz96k3Wog67ann7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bQDUt4AoPcNr+Nv91iNwg2yGlsdH1IDmI0vjiwnfGmM=; b=nKyTfp0+
 ucr1RNRG2LniaOM4NjkdQtc7snF1+y4alRActTBC5hga7IrG9c/t0zubmYJePh1K
 scGt8HHjynOuFOOjLz1asi+J7ZgqQWKFY0niBhS93zeyTj4iFcpwT1fNcFPdXiWc
 fMQG31WEu4c/qs7VtdHyBgjWvc1WPQNvcJX2lGe6/QqkayAvtYfePZ5nw1mt8k3H
 c3PEhu3doXBSX1WGLgICHnukbuqX9rPWb0neYrl65C3lGopCjLiA/5Jwfp1EPAjN
 dJO71UsKVafk+7LfBJER7EACKLAtpiyFPR3pW4ojL9G8YGa+ixY5PMM4idy6Wdms
 PPTOA88TWipKKg==
X-ME-Sender: <xms:cCnhXO4oqdhzhjTLsGHSf9riXbkfaU9m5AQ7Hx0IDfpzY3IlDWlKPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:cCnhXIDCxWRbX2kXkEAzVVBWUyg2ynFcN7kttJ6P0hjqvnpN_0c8GA>
 <xmx:cCnhXFbaxVAViK-mslwchP0MCVpQv9JJDgHv5XgqA0-dvQU9qSJADA>
 <xmx:cCnhXDb73WQflDiM38GEPFWsWKcInrIYDtcAsIkOwMgUyuky64_AMQ>
 <xmx:cCnhXGavwicW_pxY3v69cxLcoAw7IBwQdhwH9R2McaEqzhzxFXy3Dg>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 822D610378;
 Sun, 19 May 2019 06:01:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 19 May 2019 19:01:08 +0900
Message-Id: <20190519100109.14167-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
References: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/5] firewire-lib: use dynamic array for CIP
	header of tracing events
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

This modules handles two types of isochronous packet; one has CIP header
in IEC 61883-1/6 and another doesn't. The module also have tracing events
corresponding to the types of packet. To unify the events, one event
should be probed with or without CIP header.

This commit uses dynamic array for the events to be available for the
types of packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 36 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 30c547552cd2..614dfd08aa48 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -22,8 +22,7 @@ TRACE_EVENT(in_packet,
 		__field(int, channel)
 		__field(int, src)
 		__field(int, dest)
-		__field(u32, cip_header0)
-		__field(u32, cip_header1)
+		__dynamic_array(u8, cip_header, cip_header ? 8 : 0)
 		__field(unsigned int, payload_quadlets)
 		__field(unsigned int, data_blocks)
 		__field(unsigned int, data_block_counter)
@@ -37,8 +36,10 @@ TRACE_EVENT(in_packet,
 		__entry->channel = s->context->channel;
 		__entry->src = fw_parent_device(s->unit)->node_id;
 		__entry->dest = fw_parent_device(s->unit)->card->node_id;
-		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
-		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
+		if (cip_header) {
+			memcpy(__get_dynamic_array(cip_header), cip_header,
+			       __get_dynamic_array_len(cip_header));
+		}
 		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks;
 		__entry->data_block_counter = s->data_block_counter,
@@ -47,20 +48,21 @@ TRACE_EVENT(in_packet,
 		__entry->index = index;
 	),
 	TP_printk(
-		"%02u %04u %04x %04x %02d %08x %08x %03u %02u %03u %02u %01u %02u",
+		"%02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u %s",
 		__entry->second,
 		__entry->cycle,
 		__entry->src,
 		__entry->dest,
 		__entry->channel,
-		__entry->cip_header0,
-		__entry->cip_header1,
 		__entry->payload_quadlets,
 		__entry->data_blocks,
 		__entry->data_block_counter,
 		__entry->packet_index,
 		__entry->irq,
-		__entry->index)
+		__entry->index,
+		__print_array(__get_dynamic_array(cip_header),
+			      __get_dynamic_array_len(cip_header),
+			      sizeof(u8)))
 );
 
 TRACE_EVENT(out_packet,
@@ -72,8 +74,7 @@ TRACE_EVENT(out_packet,
 		__field(int, channel)
 		__field(int, src)
 		__field(int, dest)
-		__field(u32, cip_header0)
-		__field(u32, cip_header1)
+		__dynamic_array(u8, cip_header, cip_header ? 8 : 0)
 		__field(unsigned int, payload_quadlets)
 		__field(unsigned int, data_blocks)
 		__field(unsigned int, data_block_counter)
@@ -87,8 +88,10 @@ TRACE_EVENT(out_packet,
 		__entry->channel = s->context->channel;
 		__entry->src = fw_parent_device(s->unit)->card->node_id;
 		__entry->dest = fw_parent_device(s->unit)->node_id;
-		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
-		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
+		if (cip_header) {
+			memcpy(__get_dynamic_array(cip_header), cip_header,
+			       __get_dynamic_array_len(cip_header));
+		}
 		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks;
 		__entry->data_block_counter = s->data_block_counter,
@@ -97,20 +100,21 @@ TRACE_EVENT(out_packet,
 		__entry->index = index;
 	),
 	TP_printk(
-		"%02u %04u %04x %04x %02d %08x %08x %03u %02u %03u %02u %01u %02u",
+		"%02u %04u %04x %04x %02d %03u %02u %03u %02u %01u %02u %s",
 		__entry->second,
 		__entry->cycle,
 		__entry->src,
 		__entry->dest,
 		__entry->channel,
-		__entry->cip_header0,
-		__entry->cip_header1,
 		__entry->payload_quadlets,
 		__entry->data_blocks,
 		__entry->data_block_counter,
 		__entry->packet_index,
 		__entry->irq,
-		__entry->index)
+		__entry->index,
+		__print_array(__get_dynamic_array(cip_header),
+			      __get_dynamic_array_len(cip_header),
+			      sizeof(u8)))
 );
 
 TRACE_EVENT(in_packet_without_header,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
