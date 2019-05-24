Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1D29432
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:07:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA49316B2;
	Fri, 24 May 2019 11:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA49316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688848;
	bh=qiH0sRc/nqdrmU4m9qHhYk/dQW8vYCydreDvQcmkASY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vhEqdah3HqxH/2sFRKxnQp2yTXhQC3e8KC9PFaAYopn5SLw1NTj1EP7cXDyZ++oO3
	 /2p9OkIg+t7kZKA6W2a8qxnzZTbzm8TTJBwsLMYLowNoxkdsF1kLQGYBzmj1PK9Mtx
	 DRiAu9LstcoMzGJRcPCbenmJJ7CorjH9yjr8WEBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48345F89732;
	Fri, 24 May 2019 11:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F594F89725; Fri, 24 May 2019 11:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D8AF80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D8AF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="oEibddYq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HHaNyYpK"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E34F21AFB;
 Fri, 24 May 2019 05:03:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 May 2019 05:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jQqJneHWNa4uj
 sIKD6THbAi4L8nhUmiCbJLst/CwjPs=; b=oEibddYq1oG77Lj3sA9dQbFbqg3tU
 FTMqfDIeCK8znCow0IkNLfd7YETnMIEZCAKKXYKOOutwu+3PtHXsSDlmf6fkm9F8
 hX6ySMf12i5GtEAI8rsZvdI95sWHD7buCX5kBXglzXKrFgNCP5ryEYkQ3PfuKeqP
 b3TypvjaTGrBL7LgC7xrtXc4+cKDWk6cPHo5k9E/Qp54crlwoLcw13AbhtIQ5hRb
 zc4RIxUMX+N9zvsXxJc13U/6aCrl9qiIyCQII7yZTJUYYi3j4FMVOFm8C+3g6NEW
 33pXYg/ZFcu3kSRtxe74oy+YIiuFRc0gEcdux7oSP8xqGJ8yfEp+RyQZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jQqJneHWNa4ujsIKD6THbAi4L8nhUmiCbJLst/CwjPs=; b=HHaNyYpK
 DT+GAVWyBtKPD7fdhy3/moC2NPQ8U9dwR486cg35+EVgT+En0FxkiFm/qU64Hg+I
 OvjTMMV4thJEdJNAp/ucTNhb4S/4NNk3/PDpbAweW25Vwju7rk52ieyU2ixJt4h+
 4HmEcl+MBAntEYNuA49UKV/YEVVBDZI4h/4zNYzvLTIrcyfQ9duAn/C3kx0d/cTG
 OfzSMzEfA9Fozh3WfH5uQ4heu7Pw1xtVfbUL8eJ8Qfb3pYczZyu01l+BPKrtI8HH
 3ZzsnY8XhMl0A5ZGeYiL1sDJpaR8vILounFqy7guPF9kfGRP8dH9LKK02r1yQml3
 Ui1RSxAsCizUFw==
X-ME-Sender: <xms:eLPnXJ9wGNU_H3d0cqcOQZmTQMxN75rG1RPDTGO1khsY82OkNIReuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eLPnXHiSipEmS7_GBkPvrWSiJY7sy7e4oBKKd6E9P9K9iCDeISakRA>
 <xmx:eLPnXDm1mZpMMLUvPh7xCT2M1t6H-csRCCGpNcBeNUXapGwxS-nh4A>
 <xmx:eLPnXK3ZF4Nda38kuZuOkUpn4iBMzoQeSx3g1hWwD2Oj6Gd627h1Dg>
 <xmx:eLPnXPRpMgoq79jxkXeft_mZwHVxsU0kk4uylOec2SbX8V2ORkf4Vg>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 051EE80059;
 Fri, 24 May 2019 05:03:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 18:03:41 +0900
Message-Id: <20190524090342.15619-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
References: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/4] ALSA: firewire-lib: refactoring to
	obsolete IT packet handler
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

As a result of heavy refactoring based on IT packet header, the packet
handler becomes simpler.

This commit merges the packet handler into function for IT context
callback. The logic to build IT packet header and tracepoints event is
split to a function.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 62 +++++++++++++++++------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 8a7da86650ea..03ed2757dfc8 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -485,54 +485,36 @@ static void generate_cip_header(struct amdtp_stream *s, __be32 cip_header[2],
 			(syt & CIP_SYT_MASK));
 }
 
-static int handle_out_packet(struct amdtp_stream *s, unsigned int cycle,
-			     const __be32 *ctx_header, __be32 *buffer,
-			     unsigned int index)
+static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
+				struct fw_iso_packet *params,
+				unsigned int data_blocks, unsigned int syt,
+				unsigned int index)
 {
-	unsigned int syt;
-	unsigned int data_blocks;
 	__be32 *cip_header;
-	unsigned int pcm_frames;
-	struct snd_pcm_substream *pcm;
-	struct {
-		struct fw_iso_packet params;
-		__be32 header[IT_PKT_HEADER_SIZE_CIP / sizeof(__be32)];
-	} template = { {0}, {0} };
 
-	syt = calculate_syt(s, cycle);
-	data_blocks = calculate_data_blocks(s, syt);
-	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
-
-	if (s->flags & CIP_DBC_IS_END_EVENT)
+	if (s->flags & CIP_DBC_IS_END_EVENT) {
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
+	}
 
 	if (!(s->flags & CIP_NO_HEADER)) {
-		cip_header = (__be32 *)template.params.header;
+		cip_header = (__be32 *)params->header;
 		generate_cip_header(s, cip_header, syt);
-		template.params.header_length = 2 * sizeof(__be32);
+		params->header_length = 2 * sizeof(__be32);
 	} else {
 		cip_header = NULL;
 	}
 
-	if (!(s->flags & CIP_DBC_IS_END_EVENT))
+	if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
+	}
 
-	template.params.payload_length =
+	params->payload_length =
 			data_blocks * sizeof(__be32) * s->data_block_quadlets;
 
-	trace_amdtp_packet(s, cycle, cip_header, template.params.payload_length,
+	trace_amdtp_packet(s, cycle, cip_header, params->payload_length,
 			   data_blocks, index);
-
-	if (queue_out_packet(s, &template.params) < 0)
-		return -EIO;
-
-	pcm = READ_ONCE(s->pcm);
-	if (pcm && pcm_frames > 0)
-		update_pcm_pointers(s, pcm, pcm_frames);
-
-	return 0;
 }
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
@@ -741,16 +723,34 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	for (i = 0; i < packets; ++i) {
 		u32 cycle;
+		unsigned int syt;
+		unsigned int data_block;
 		__be32 *buffer;
+		unsigned int pcm_frames;
+		struct {
+			struct fw_iso_packet params;
+			__be32 header[IT_PKT_HEADER_SIZE_CIP / sizeof(__be32)];
+		} template = { {0}, {0} };
+		struct snd_pcm_substream *pcm;
 
 		cycle = compute_it_cycle(*ctx_header);
+		syt = calculate_syt(s, cycle);
+		data_block = calculate_data_blocks(s, syt);
 		buffer = s->buffer.packets[s->packet_index].buffer;
+		pcm_frames = s->process_data_blocks(s, buffer, data_block, &syt);
 
-		if (handle_out_packet(s, cycle, ctx_header, buffer, i) < 0) {
+		build_it_pkt_header(s, cycle, &template.params, data_block, syt,
+				    i);
+
+		if (queue_out_packet(s, &template.params) < 0) {
 			cancel_stream(s);
 			return;
 		}
 
+		pcm = READ_ONCE(s->pcm);
+		if (pcm && pcm_frames > 0)
+			update_pcm_pointers(s, pcm, pcm_frames);
+
 		++ctx_header;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
