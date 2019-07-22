Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0F6F803
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CA9A1743;
	Mon, 22 Jul 2019 05:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CA9A1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563766840;
	bh=xvLVKwoewWt81tklFxGtZpsFCSWQDGj5Lsi8x1Nr0fY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jhh8JDmTod9RTRfc+DIW7G1hQNjmcdy0jDRcQkmb4FLyY0vmj956FCdRSGhzT68O0
	 pjbeuTn4UMzoQ1DnWxPO81coJRtOaHd8JGIAqcu/j8RsWn0ij9LLBBLhPiWcw7d7Mv
	 WDHw474YIhKiWChCeI6U7oGv8v+9tsfXvupIavCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03961F804CA;
	Mon, 22 Jul 2019 05:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E75E3F803D1; Mon, 22 Jul 2019 05:37:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AEDAF803D1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AEDAF803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sLGsyvj+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="I0hf0Guj"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E84AC21FC2;
 Sun, 21 Jul 2019 23:37:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JI+0+/Iqv2OLo
 glW7d3nQRVSfdAsJUmVKg60mjARFb8=; b=sLGsyvj+kxobfFQ4aVL6CP4WOaekA
 pzZRhisLxzUjQNaZ/LgGysKnd/wGTUD985u59CVxyue6Re0d1Bcm3+GF1NN8A66w
 +c4vgN7nhewNzE6FG05v2vzLItmYrKo97NGuso3ZX1JK/CHRWvTpi0ihq/ybc+hr
 Ae3B3BCMrCO+BK3X23EGCvrQRV20AZ2OL67bwibyJssYleoRr9zwngED/cKEM6WJ
 RkaKCxcpwoVQyGpWJF7ANGJKRH65GhLgNXyzCDrXhBS1vXYzkByfkTjiPQvBMfHv
 hBapYYFoVtndLfwXkxj4NrS0SluEeBHKgub8L7esVZjBmvOEuG8gTGvtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=JI+0+/Iqv2OLoglW7d3nQRVSfdAsJUmVKg60mjARFb8=; b=I0hf0Guj
 WnBsghLx6UIhI4sym1KEcFHHjOJz9wayF34QD5VRi3z7cUrue9S46+yrEd8qd/pQ
 +ezf3ePEsUcu4Rh9CQbLBuTnrGlisGlTBzFj8iXaC2VmhObKZLbHTyzuMFY8TPWA
 LULv72TA3JkMBUx5a9aH4mTfg+46U5u9hRx84/okaaPEsNPldncNUAMWqQICDJcH
 Hq/LQuUKK/+g/PeKAI9drDp5wxyCvtqPElGlitLAgIimT3d03fc98X4nvmOURfmn
 1B2vAIzvNo/K2XZfgsi8C9c22W3PS+1fDkH824YwlSvyy29SHLLqGpegzjtRvS+8
 e5k57WA45f7wtA==
X-ME-Sender: <xms:bi81XcP8xhW5W0H-HRSJ0B9NJBGIPOLhj8srChjF_Sx3i3OUshm-pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bi81XXPGucvy-o3EMXBEQ81JBAHMxRdVCQtNW49C21OU-Ifdb5WuNA>
 <xmx:bi81XeS9ExRghbwIyWc0m448IAuDRZ2gvrqdDNWuy561eZKBtDLRWg>
 <xmx:bi81XZC7MR6yPONH48rkTHIgKYT1ltxAoCHV4rDkZKCio7nGbYGPog>
 <xmx:bi81XYBCNzocoGamDjqIFEpORWUb8IfuK4t9RURzWke91ZnLtmPTtg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82F5580059;
 Sun, 21 Jul 2019 23:37:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:52 +0900
Message-Id: <20190722033710.28107-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/20] ALSA: firewire-lib: pass data block
	count as an argument to tracepoints event
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

This is a preparation for future commit that 'struct
amdtp_stream.data_block_count' does not represent the value of
data block count for current data block.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 6 +++---
 sound/firewire/amdtp-stream.c       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 4adbbf789cbe..16c7f6605511 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -14,8 +14,8 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(amdtp_packet,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int index),
-	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, index),
+	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int data_blocks, unsigned int data_block_counter, unsigned int index),
+	TP_ARGS(s, cycles, cip_header, payload_length, data_blocks, data_block_counter, index),
 	TP_STRUCT__entry(
 		__field(unsigned int, second)
 		__field(unsigned int, cycle)
@@ -47,7 +47,7 @@ TRACE_EVENT(amdtp_packet,
 		}
 		__entry->payload_quadlets = payload_length / sizeof(__be32);
 		__entry->data_blocks = data_blocks;
-		__entry->data_block_counter = s->data_block_counter,
+		__entry->data_block_counter = data_block_counter,
 		__entry->packet_index = s->packet_index;
 		__entry->irq = !!in_interrupt();
 		__entry->index = index;
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fc1e8e5b9429..fe1512905a43 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -511,7 +511,7 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 	}
 
 	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
-			   index);
+			   s->data_block_counter, index);
 
 	if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
 		s->data_block_counter =
@@ -653,7 +653,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	s->data_block_counter = dbc;
 
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
-			   index);
+			   s->data_block_counter, index);
 
 	return err;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
