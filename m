Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B122268B
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 12:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86BF0168A;
	Sun, 19 May 2019 12:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86BF0168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558260274;
	bh=vli5TEP3qoklirYm/0/KngU+jBfX73LbLRX8gXTsnSk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P719a5V8hgJGW3vb2ZyhWWGhU9bagsp4Mjl6mSqYEK/gueH/wBZwoMY3HC6BlijxE
	 kLOv9U3LsnPCHiAEFX/Kv/nP63ixaMQ287Nfi9OZy6aqMlYnjcq4LS1J8nWMIZ2wTB
	 oXCWofPOndhuN86AqkgcWCatn8tD12tr/kEoaYWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75C4CF8972D;
	Sun, 19 May 2019 12:01:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B979F8970E; Sun, 19 May 2019 12:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F762F8962F
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 12:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F762F8962F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VFnyETqC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BbTcAN90"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EB0321385;
 Sun, 19 May 2019 06:01:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 May 2019 06:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=UAiMjJ5i541wU
 n1AHhcqeGUag596huLdmyX+BziqGDM=; b=VFnyETqCklI6UdX6UWlLhroET1BN2
 YNy1F2Q6sO9A1Yg5vw+Z3DLQ9J8pbrqkT/XAN1yiZJi8Ti519wg/QRoyNtHapoy0
 zUzzdFawOXZrFGFHZTHaxORaOx/IQ6/+Pxo8rx85sIe7E53Aqvypxa23BVrxFNtK
 9/O5WkuWB7pnSYnY89DJ7sPUAdQHpdEmMoll/Lmj2JLOABmcBe60g5yBn3GMJXqW
 f81EK/IBmUrkObr089eqkRSGxeFTHDEvk6N3XUtNqIpIt7Ht94ujRcPlqQpt6KzG
 QHnzz6pt13mkzmhIxj70RPMvXZGLyyAT5azl64gwsrM6gI4k2y4g7wSBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UAiMjJ5i541wUn1AHhcqeGUag596huLdmyX+BziqGDM=; b=BbTcAN90
 6wKPMP57Vtv8hX3SEZyRpj2FTF29luAo9PdsPFVjIovLT+h8cfIlKs2daJTHnenI
 8ZXFZ0nyAef2ZHGhZ//daDktbbuVPqErn+1XUjLvSQMDksaUB+HRL7MaaJY0o3hU
 vu8hnmGWIlLZ/kE4iQIJffxddOwnHHKw/MWofdZYpyXy7OkRjlVZT95tIv8hRgDD
 oJAHv1RtuWfSoayWSJwHJ4PYne4cXq84we/UeeTMQFMgUKOiutGL2FyY8tpFzDOT
 SxV0SWs+M1joyA1WcvGOyiBrLzEXoixf9tXKqS+lU8FYE/eV5KM3i7JVPaYyUNUF
 ZOu2cOf1bzY4hA==
X-ME-Sender: <xms:bCnhXHDLnqjilgNZEcDSSU9BK41s8pFtNvav7SCInVKOMUaMOwyDGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtiedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bCnhXP9qLJOcnbBplGxb5p0dNNiAXAZOU2AbppWppLyttpG98I5p7w>
 <xmx:bCnhXASKU2QjcCyDs-GLGSOP26-bUfImYO2yVQNu9QhXyMr6m8oAYg>
 <xmx:bCnhXI5MKPC3SSDNAcWkrs7_wPcYJVSXE_VM7ZaEw4nCmL8_AfJtJQ>
 <xmx:bCnhXKWNRGhm5fIsxABiM_1qb8fl-c9S0to-HdLek_GeUm8r4nlETw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0154810378;
 Sun, 19 May 2019 06:01:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 19 May 2019 19:01:05 +0900
Message-Id: <20190519100109.14167-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
References: <20190519100109.14167-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/5] firewire-lib: use the same type of
	argument for CIP header for tracing event
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

An argument for CIP header in 'in_packet' event is not the same type in
'out_packet' event. This is not good to unify these events.

This commit uses the same type of argument for these events.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 6 +++---
 sound/firewire/amdtp-stream.c       | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index ac20acf48fc6..a86a827eab90 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -14,7 +14,7 @@
 #include <linux/tracepoint.h>
 
 TRACE_EVENT(in_packet,
-	TP_PROTO(const struct amdtp_stream *s, u32 cycles, u32 *cip_header, unsigned int payload_length, unsigned int index),
+	TP_PROTO(const struct amdtp_stream *s, u32 cycles, const __be32 *cip_header, unsigned int payload_length, unsigned int index),
 	TP_ARGS(s, cycles, cip_header, payload_length, index),
 	TP_STRUCT__entry(
 		__field(unsigned int, second)
@@ -35,8 +35,8 @@ TRACE_EVENT(in_packet,
 		__entry->channel = s->context->channel;
 		__entry->src = fw_parent_device(s->unit)->node_id;
 		__entry->dest = fw_parent_device(s->unit)->card->node_id;
-		__entry->cip_header0 = cip_header[0];
-		__entry->cip_header1 = cip_header[1];
+		__entry->cip_header0 = be32_to_cpu(cip_header[0]);
+		__entry->cip_header1 = be32_to_cpu(cip_header[1]);
 		__entry->payload_quadlets = payload_length / 4;
 		__entry->packet_index = s->packet_index;
 		__entry->irq = !!in_interrupt();
diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 43f28b813386..2614fa551e24 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -555,7 +555,7 @@ static int handle_in_packet(struct amdtp_stream *s,
 	cip_header[0] = be32_to_cpu(buffer[0]);
 	cip_header[1] = be32_to_cpu(buffer[1]);
 
-	trace_in_packet(s, cycle, cip_header, payload_length, index);
+	trace_in_packet(s, cycle, buffer, payload_length, index);
 
 	/*
 	 * This module supports 'Two-quadlet CIP header with SYT field'.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
