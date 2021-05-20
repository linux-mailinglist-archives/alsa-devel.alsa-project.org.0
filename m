Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2D389C49
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA1A167F;
	Thu, 20 May 2021 06:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA1A167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483427;
	bh=kVTLKKPhEpPQ2jVMHSULc0bF0gLHZr+UtSvVLwA0rFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gbJ/XsorB6/y56JwKcoOsj9g86VkJnDuSPe+KCygSuMqISwh0/lexw1VoNLjpzfcC
	 truQ4y9iQcvB8z5Vqt8gT00D1Tfw4SGqQcW6PLR29h809aGZDJv/Njvjs7E7gIW88O
	 F8LDtmjy8mPs9R7UF8DL/FR3ei0kgVOPYqwX6DFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20EF2F80425;
	Thu, 20 May 2021 06:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E7BF80424; Thu, 20 May 2021 06:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DBCEF800C8
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DBCEF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LbF4huTH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FNv4/Bg7"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6310E5C00FF;
 Thu, 20 May 2021 00:02:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 May 2021 00:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=S6Ff3OHA3awAv
 rJn4vaAKtDrHHN7gtM7gFcL1aiZiDs=; b=LbF4huTHM251OFX9zGXrQuH5AfKc4
 iMg3zRzPgE7Vjq/3iE74eOx6vnjIVyOgvAAdBFlwuFzVMqOX/SDU5vylwc6FKUgf
 LdM1FUeO1cWBrmOIgD7H/PtIcdXaZut2AVzrjDxci503lEPZgtSo4ML/kn7rd9zq
 xISTNfvlRTmNGoSypMhecuAjObQDTfutqp3uwr6krIrOw5kLq24hs5l6HrVZuPVC
 0VgIHtNTXHl0/eW+73YQFElPe0A4M9Uju8pU4xoUqwIuRdsqHCvtgyiR7465fX+z
 8mTPV6IMaReiqAMsCfUKs8ED0/8a8rz3w/WKA+jsTD6WX2UidE9aWx+Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=S6Ff3OHA3awAvrJn4vaAKtDrHHN7gtM7gFcL1aiZiDs=; b=FNv4/Bg7
 zeXxB0pXVJ7qp9kb4vH1hBWycGkd8DXPOXNLgi9sA5f0PuWKA8F6u2EQXn62lL2p
 oI8kZAN5GwZVflkrgp1qxWoTLyVt2qW7Rh2HC8KlUdb1lmM/r5p7N954gWl3hxPO
 UupY48TcU0mchjn/vOixp5Q6R6OkfNU9F1gPZ+n9n4Vbtym7H+AosQ/YGNsB41mO
 p/KZWW7LYazQaU6GKaWYYmAkB1QEGV9vTguLbuZjMkMKUNcweyq+/2+iqdU0SmHM
 Mye+4jjpJiWiq/RCjhvmpPwr2C5ZtgjKxzZ/DqAsg6m9e1MJHY9xmRNg6GaxAZGL
 PVF5oTR5w2/mlQ==
X-ME-Sender: <xms:ON-lYB0KJQ5N28GtD8dK2QtwhBOSRxXycK5KCEYKi_nKTAeZ_-DHFA>
 <xme:ON-lYIF4jQ3qIvDaIxO5Lpy31egnhvUy4F3RIsD0bcrxFYYmOkkqwvmYD3EhP3y_E
 KYbJyEqx7iPHiYwB1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ON-lYB6NzMuUfA96iuL29jPQ3wdGC-pHRkohuoe8eQjiT8USYcUxbw>
 <xmx:ON-lYO11bO3KJ8qg1AfXREOHc_qmTDDx9Q_skc9yhsVn2amepve8JQ>
 <xmx:ON-lYEHo4AE0lhKKvSyhSEBL6OGCpiV4g7569_OXMfYIdribrDNtAw>
 <xmx:ON-lYPPvpoBiD4fw20S4kHldjk6-4pZlHYvUxRKel52If7jdLOv7SQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:01:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/8] ALSA: firewire-lib: code refactoring for size of CIP
 header
Date: Thu, 20 May 2021 13:01:47 +0900
Message-Id: <20210520040154.80450-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
References: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some macros are added to refactor codes related to CIP header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index af5c3629f1ac..f178cb5f2df3 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -33,7 +33,8 @@
 #define TAG_NO_CIP_HEADER	0
 #define TAG_CIP			1
 
-/* common isochronous packet header parameters */
+// Common Isochronous Packet (CIP) header parameters. Use two quadlets CIP header when supported.
+#define CIP_HEADER_QUADLETS	2
 #define CIP_EOH_SHIFT		31
 #define CIP_EOH			(1u << CIP_EOH_SHIFT)
 #define CIP_EOH_MASK		0x80000000
@@ -51,17 +52,21 @@
 #define CIP_SYT_MASK		0x0000ffff
 #define CIP_SYT_NO_INFO		0xffff
 
+#define CIP_HEADER_SIZE		(sizeof(__be32) * CIP_HEADER_QUADLETS)
+
 /* Audio and Music transfer protocol specific parameters */
 #define CIP_FMT_AM		0x10
 #define AMDTP_FDF_NO_DATA	0xff
 
-// For iso header, tstamp and 2 CIP header.
-#define IR_CTX_HEADER_SIZE_CIP		16
 // For iso header and tstamp.
-#define IR_CTX_HEADER_SIZE_NO_CIP	8
+#define IR_CTX_HEADER_DEFAULT_QUADLETS	2
+// Add nothing.
+#define IR_CTX_HEADER_SIZE_NO_CIP	(sizeof(__be32) * IR_CTX_HEADER_DEFAULT_QUADLETS)
+// Add two quadlets CIP header.
+#define IR_CTX_HEADER_SIZE_CIP		(IR_CTX_HEADER_SIZE_NO_CIP + CIP_HEADER_SIZE)
 #define HEADER_TSTAMP_MASK	0x0000ffff
 
-#define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
+#define IT_PKT_HEADER_SIZE_CIP		CIP_HEADER_SIZE
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
 // The initial firmware of OXFW970 can postpone transmission of packet during finishing
@@ -323,7 +328,7 @@ unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s)
 	if (s->flags & CIP_JUMBO_PAYLOAD)
 		multiplier = IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES;
 	if (!(s->flags & CIP_NO_HEADER))
-		cip_header_size = sizeof(__be32) * 2;
+		cip_header_size = CIP_HEADER_SIZE;
 
 	return cip_header_size +
 		s->syt_interval * s->data_block_quadlets * sizeof(__be32) * multiplier;
@@ -642,7 +647,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
 
 	if (!(s->flags & CIP_NO_HEADER))
-		cip_header_size = 8;
+		cip_header_size = CIP_HEADER_SIZE;
 	else
 		cip_header_size = 0;
 
@@ -655,7 +660,7 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 
 	if (cip_header_size > 0) {
 		if (payload_length >= cip_header_size) {
-			cip_header = ctx_header + 2;
+			cip_header = ctx_header + IR_CTX_HEADER_DEFAULT_QUADLETS;
 			err = check_cip_header(s, cip_header, payload_length - cip_header_size,
 					       data_blocks, data_block_counter, syt);
 			if (err < 0)
@@ -907,7 +912,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		unsigned int syt;
 		struct {
 			struct fw_iso_packet params;
-			__be32 header[IT_PKT_HEADER_SIZE_CIP / sizeof(__be32)];
+			__be32 header[CIP_HEADER_QUADLETS];
 		} template = { {0}, {0} };
 		bool sched_irq = false;
 
@@ -1140,7 +1145,7 @@ static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed,
 		dir = DMA_FROM_DEVICE;
 		type = FW_ISO_CONTEXT_RECEIVE;
 		if (!(s->flags & CIP_NO_HEADER)) {
-			max_ctx_payload_size -= 8;
+			max_ctx_payload_size -= CIP_HEADER_SIZE;
 			ctx_header_size = IR_CTX_HEADER_SIZE_CIP;
 		} else {
 			ctx_header_size = IR_CTX_HEADER_SIZE_NO_CIP;
-- 
2.27.0

