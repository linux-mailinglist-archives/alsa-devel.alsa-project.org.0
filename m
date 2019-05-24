Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC99429435
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28ABD16C6;
	Fri, 24 May 2019 11:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28ABD16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688894;
	bh=gaxeNf26AyXaMHkmI3/Pzuz1s8Rajec11Jwi0T3ID5s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQcJQDzVBDosci0f/6nEE6YGZwKjKtFK7exL32q8xxZZXoevOGRQBY3Pmq7V2Gx5t
	 fTQkzuyR07BP/P1NEwDW7+gFWlRRPlR1me2R12ypon9PehRGVe6UMULTNHA7/FaZYC
	 zDp5gxye4+Nf+hQX8IBg7UwWNB+WaxcZI9FSksLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D16F89734;
	Fri, 24 May 2019 11:04:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 398A1F8972A; Fri, 24 May 2019 11:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2825CF89636
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2825CF89636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PmvNv0BD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XwgZmzJt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C29221AF1;
 Fri, 24 May 2019 05:03:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 May 2019 05:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JoOcGx6gohMA4
 H6k8c/tLrttj8J0dkevgeR8nKrmBpg=; b=PmvNv0BDAO1VfEbICIvaZetjNKF3g
 SZS27agth5vZjAd9QudkuibNwleHxdwIURuPzDT7+RTlZbGFo41qEBA/YD9wKYNi
 I6NotyqEkFKw0xCqlVVuTZCab/4NFVUE11MTzqel+/Lvxn4Elsx55k3fmPB4z9yE
 KQAHGmE88fxPgrm4jx/hEo2Selk2vZKijoGKYNS5p07i5rz13rGwhzPurIf6tA4c
 u/3PQ6G0DOo+L5h8rqWepxkyGQKTPA5SJy2koPF95DSeBpOn23ZGusiJzR29lNBc
 Bdm9lpTqPReHMS98a6kTO+XOPN19NzN4c9Wr2+YKik9mNNEHX5TB0IJDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JoOcGx6gohMA4H6k8c/tLrttj8J0dkevgeR8nKrmBpg=; b=XwgZmzJt
 fOHPiAD9JGHeEk+8ELo9MvcdqYQd3rkR+uU6Q4UgTG2ly3VDE/k2zO2chxBUUKmD
 mkVQO4TKHg2VSQl3X8cnwqDI5qhfrp+pIKHEwiRsmFAqyiA6a4AVt5JBtywNYLbj
 e+PBv5dAa2MK/fJoie3dckc1XS3YPdJ+NOzXJ7cG8wb9nQiQssl6sYxCTP6lB/Td
 WnBwD9sG8tn0vW9cXjZjif7bfpF7dzIG5xRSY7b2be6TZg53cbouiUDgpsqskupL
 MCV5EwDspNTrHNPrwcpoxU7vsqS7ZuPYO/eCUjqVrsV+WuV8J/6W+0lHboQSBdg8
 oo3bGa5mFlOapw==
X-ME-Sender: <xms:erPnXJXntKPze7222pkvLMOl20S_sYMGy3YpnRF_MmOsMh_GBqtpaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:erPnXN1tl5Bhyc3VQY_sZcYoxdjaEAkz3kcRAAzYntj_Vzv1eeGiSQ>
 <xmx:erPnXAZClUwvwQKd8udBWJt94vet3JpwPs3Uwg7H4IaF3Lu9um8RtQ>
 <xmx:erPnXAqKZdVeF_U4wsXeaWaVLWoVmHh1E7JZRw9nX67R92Y84zw0QQ>
 <xmx:erPnXCqtFk6B31HmN_0X84IMEO4X-fvEoeh6gUMN1FTm_pkdZpEASA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B67CC80059;
 Fri, 24 May 2019 05:03:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 18:03:42 +0900
Message-Id: <20190524090342.15619-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
References: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/4] ALSA: firewire-lib: refactoring to
	obsolete IR packet handler
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

As a result of heavy refactoring based on IR context header, the packet
handler becomes simpler.

This commit merges the packet handler into function for IR context
callback. The logic to parse IR context header and tracepoints event is
split to a function.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 76 ++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 37 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 03ed2757dfc8..3aef6a78a188 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -619,59 +619,42 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 	return 0;
 }
 
-static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
-			    const __be32 *ctx_header, __be32 *buffer,
-			    unsigned int index)
+static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
+			       const __be32 *ctx_header,
+			       unsigned int *payload_length,
+			       unsigned int *data_blocks,
+			       unsigned int *syt, unsigned int index)
 {
-	unsigned int payload_length;
 	const __be32 *cip_header;
-	unsigned int syt;
-	unsigned int data_blocks;
-	struct snd_pcm_substream *pcm;
-	unsigned int pcm_frames;
-	struct fw_iso_packet params = {0};
 	int err;
 
-	payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
-	if (payload_length > s->ctx_data.tx.ctx_header_size +
+	*payload_length = be32_to_cpu(ctx_header[0]) >> ISO_DATA_LENGTH_SHIFT;
+	if (*payload_length > s->ctx_data.tx.ctx_header_size +
 					s->ctx_data.tx.max_ctx_payload_length) {
 		dev_err(&s->unit->device,
 			"Detect jumbo payload: %04x %04x\n",
-			payload_length, s->ctx_data.tx.max_ctx_payload_length);
+			*payload_length, s->ctx_data.tx.max_ctx_payload_length);
 		return -EIO;
 	}
 
-	cip_header = ctx_header + 2;
 	if (!(s->flags & CIP_NO_HEADER)) {
-		cip_header = &ctx_header[2];
-		err = check_cip_header(s, cip_header, payload_length,
-				       &data_blocks, &syt);
-		if (err < 0) {
-			if (err != -EAGAIN)
-				return err;
-			pcm_frames = 0;
-			goto end;
-		}
+		cip_header = ctx_header + 2;
+		err = check_cip_header(s, cip_header, *payload_length,
+				       data_blocks, syt);
+		if (err < 0)
+			return err;
 	} else {
 		cip_header = NULL;
-		data_blocks = payload_length / 4 / s->data_block_quadlets;
-		syt = 0;
+		*data_blocks = *payload_length / sizeof(__be32) /
+			       s->data_block_quadlets;
+		*syt = 0;
 		s->data_block_counter =
-				(s->data_block_counter + data_blocks) & 0xff;
+				(s->data_block_counter + *data_blocks) & 0xff;
 	}
 
-	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
+	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
 			   index);
 
-	pcm_frames = s->process_data_blocks(s, buffer, data_blocks, &syt);
-end:
-	if (queue_in_packet(s, &params) < 0)
-		return -EIO;
-
-	pcm = READ_ONCE(s->pcm);
-	if (pcm && pcm_frames > 0)
-		update_pcm_pointers(s, pcm, pcm_frames);
-
 	return 0;
 }
 
@@ -773,14 +756,33 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	for (i = 0; i < packets; i++) {
 		u32 cycle;
+		unsigned int payload_length;
+		unsigned int data_block;
+		unsigned int syt;
 		__be32 *buffer;
+		unsigned int pcm_frames = 0;
+		struct fw_iso_packet params = {0};
+		struct snd_pcm_substream *pcm;
+		int err;
 
 		cycle = compute_cycle_count(ctx_header[1]);
-		buffer = s->buffer.packets[s->packet_index].buffer;
+		err = parse_ir_ctx_header(s, cycle, ctx_header, &payload_length,
+					  &data_block, &syt, i);
+		if (err < 0 && err != -EAGAIN)
+			break;
+		if (err >= 0) {
+			buffer = s->buffer.packets[s->packet_index].buffer;
+			pcm_frames = s->process_data_blocks(s, buffer,
+							    data_block, &syt);
+		}
 
-		if (handle_in_packet(s, cycle, ctx_header, buffer, i) < 0)
+		if (queue_in_packet(s, &params) < 0)
 			break;
 
+		pcm = READ_ONCE(s->pcm);
+		if (pcm && pcm_frames > 0)
+			update_pcm_pointers(s, pcm, pcm_frames);
+
 		ctx_header += s->ctx_data.tx.ctx_header_size / sizeof(*ctx_header);
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
