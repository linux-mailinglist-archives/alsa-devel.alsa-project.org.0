Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2A6F819
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B06175C;
	Mon, 22 Jul 2019 05:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B06175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767238;
	bh=KF5/itkuTX4V61Su56Zo0pns93mBX8kfYF0Dyxzj/GQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7oB4Ueh/8Tg7fmlBklAFTs9spQRL1PCNe9Kb5LLOT10l5qnE93fxp1dHPRJFKfDR
	 L1UHQ40RE83Nded5IH2w+wTHFX4aYKBR4B2uwERl0NxIYDgJWrjBNlczwiuhU7RvF3
	 4rpmCuJ/RvLhFvX/mDCFd6ItLhGhhfgu1IZm6Ddk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BECFF80636;
	Mon, 22 Jul 2019 05:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4632F80519; Mon, 22 Jul 2019 05:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19D35F803F4
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D35F803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BCrWtQ/Z"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LVwUrSzy"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D61121FC2;
 Sun, 21 Jul 2019 23:37:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1I8DN8eShhZbq
 dMcJo3yXYCRg/FevzUvvKu7RTM8cY0=; b=BCrWtQ/Zv3qWooS51acrqx3cGR8SB
 +dUOaF+2Qd3uH8kHpIBBgHcP9mbaLnbanLV2P66aO7PrIBqMMX9ahlV07K7q7IbX
 J7Cczv6f0u7adPWXzQKv6MDPde56d1x+JAGD6Ce4LT/dXkvQWhyrKwt8cWrYxxmR
 0xSSVD0BUSyLUFicMfFNO5n2ezg05etOyqIBGuozCia6i7UXZirPKK5HOPok5h1r
 L2lQW0XcT7fHiwloqwmo1LzNbK9I4div+hkC9Aoq66K8I0qMqLB1oYpZ6cgL5ZEZ
 XO03CHSYOvm/bcb/Txtu3FnQD7WDkywQjbTryfLv0/EwOcjGU/E4jcEyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=1I8DN8eShhZbqdMcJo3yXYCRg/FevzUvvKu7RTM8cY0=; b=LVwUrSzy
 qZegcTZAVMbeptxA+8q4fzqvAcOVsST56OP5t941PDrw+eArZ3SZS0v7xVGpn61q
 GO5468LIjSBvK9jCPIEAv3BLiWqh0Zkox1Q5oglh10CPjF0m+j07d2Qvf53gG2T4
 G/iJ2a/4BLw8aUVXV+GC9yRv27SW0EQT7Kr4ceFmYY6SOEyKQNj8ehygeOAtcPAS
 81bOr+DMaaY6MwdGMBiuOBF3lLZOuzMThpSQmVQuSfL/39a/mcKiLaPOovsw+pxI
 hlu74tPxzl5asSTFVvNP1hF/3TxioE9+57HU6xvOdiEfsEHhU+VW59KMxWpkzncy
 hbCWGcQG6bTohg==
X-ME-Sender: <xms:fi81XV4jfunvu0y-a6-CiPyVlWev6EI9X0e5ZJa1kXwcPNBqaPb6OQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduud
X-ME-Proxy: <xmx:fi81XSlFnmbApq0cq7_3oLoZSuXUvHRyTe6IC90094N5mLKEk4DfyQ>
 <xmx:fi81XYHOypV49qj-sIhq_q4BHQCQ8uh7h2ZtKueRf1_rrMTMLW0tdQ>
 <xmx:fi81XZ8WHDGKX5cXYs95jxBnU94pFzhq7LkBvMe361B00_eeUG7IaQ>
 <xmx:fi81XXQfO1u4bC6hBB4p4AotZAhq5qlqJP9Ttl_0AqhvyxYVYZm8lQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D502880059;
 Sun, 21 Jul 2019 23:37:32 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:02 +0900
Message-Id: <20190722033710.28107-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/20] ALSA: firewire-lib: code refactoring to
	process context payloads
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

This is code refactoring for common processing for payloads of
ishocornous context.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 47 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 99b89bd70bc5..573265113a6f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -760,22 +760,14 @@ static inline void cancel_stream(struct amdtp_stream *s)
 	WRITE_ONCE(s->pcm_buffer_pointer, SNDRV_PCM_POS_XRUN);
 }
 
-static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
-				size_t header_length, void *header,
-				void *private_data)
+static void process_ctx_payloads(struct amdtp_stream *s,
+				 const struct pkt_desc *descs,
+				 unsigned int packets)
 {
-	struct amdtp_stream *s = private_data;
-	const __be32 *ctx_header = header;
-	unsigned int packets = header_length / sizeof(*ctx_header);
 	int i;
 
-	if (s->packet_index < 0)
-		return;
-
-	generate_ideal_pkt_descs(s, s->pkt_descs, ctx_header, packets);
-
 	for (i = 0; i < packets; ++i) {
-		const struct pkt_desc *desc = s->pkt_descs + i;
+		const struct pkt_desc *desc = descs + i;
 		struct snd_pcm_substream *pcm;
 		unsigned int pcm_frames;
 
@@ -786,6 +778,23 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 		if (pcm && pcm_frames > 0)
 			update_pcm_pointers(s, pcm, pcm_frames);
 	}
+}
+
+static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
+				size_t header_length, void *header,
+				void *private_data)
+{
+	struct amdtp_stream *s = private_data;
+	const __be32 *ctx_header = header;
+	unsigned int packets = header_length / sizeof(*ctx_header);
+	int i;
+
+	if (s->packet_index < 0)
+		return;
+
+	generate_ideal_pkt_descs(s, s->pkt_descs, ctx_header, packets);
+
+	process_ctx_payloads(s, s->pkt_descs, packets);
 
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
@@ -836,19 +845,7 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 			return;
 		}
 	} else {
-		for (i = 0; i < packets; ++i) {
-			const struct pkt_desc *desc = s->pkt_descs;
-			struct snd_pcm_substream *pcm;
-			unsigned int pcm_frames;
-
-			pcm_frames = s->process_data_blocks(s,
-					desc->ctx_payload, desc->data_blocks,
-					desc->data_block_counter);
-
-			pcm = READ_ONCE(s->pcm);
-			if (pcm && pcm_frames > 0)
-				update_pcm_pointers(s, pcm, pcm_frames);
-		}
+		process_ctx_payloads(s, s->pkt_descs, packets);
 	}
 
 	for (i = 0; i < packets; ++i) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
