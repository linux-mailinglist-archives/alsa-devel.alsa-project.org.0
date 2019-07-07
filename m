Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F3614E8
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A07168D;
	Sun,  7 Jul 2019 14:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A07168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501679;
	bh=QeT9Hj92nv1AAZxuR4S+jVMpYdIiMrnblm7Gr0+6NxE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tfoXcI4n44zPjTUJjYBbO5fq/mWWyL49fmueecIP8RGINyxX6xOzYjF7WgO+6LyIi
	 TMWOrA7fKxV9WXybrx11+rdhLZ2/iQ1SqGPs4qygsuB+SHlOOrw3MIZideTz5GZaxn
	 gfSlTrbI+rhOMu5rnwHlzhC1SVTaIWQh/He6Sl5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F6FF8036C;
	Sun,  7 Jul 2019 14:08:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1609AF80274; Sun,  7 Jul 2019 14:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C35CF80290
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C35CF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BanuFRQ8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="n94zeHQ3"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B828642C;
 Sun,  7 Jul 2019 08:08:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=PEoUCpf4YAROV
 zd7q7Kv5ZQ0VTkfpGDvFHdPbYp5jQE=; b=BanuFRQ8/t4ZVGwhSBWJuzh9/UbFt
 1CoqM6Hn7KjAsQxlq6xkHr19U2b8uxep1NwOf6N2o+rimOr7wsw/F7+M4Rf6Siiv
 o8I30RgeR0hhhcpVLyXwccS8Tp7Rt442h3lWzQzuKBwXHWMuvDLw5myIcCT9l+uh
 NxpDXLtdaFE1GGCmAX6qrrruy/o3XjRhpHGeeEf2ZFjPKOwZeWYgWJfYP25IOB6l
 Bh+XkwcFEO+X8NFUkR5YRewD9zyUG2eUFz5T8dFBqyqQMcuum8HLbbDtw/G+kq24
 rJhUHf0Ws0v4PBwQXlP82xjQ9DOfPw5njtASQD6EjusdOe3eJ8IWL4YiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=PEoUCpf4YAROVzd7q7Kv5ZQ0VTkfpGDvFHdPbYp5jQE=; b=n94zeHQ3
 dUSRIqq/LiatDaB/+lxvVzWTFUvVyjJQU/e5USGq6KBw6hNqYAjVSh6pkuBzkJsn
 pieNPliunhOJOcjCwV2zy4DSj20W1X37pfzhyBTaHNfh1IkzTdrbwGZcsL9A+rcI
 Uit3zTF+AJlOZMUA2WrGwW/VpNh2RjyB5jHQmWwon9aDw3CAtjztf+MvcVTvPyJW
 j97FD+DSm7ObgsKZtPtNYXpk8zVwqAkmttVYVcbWQRSgpyMIZnkvXBzROujXOuSa
 dauwLcY3whIVgA50RFBL6CQ7L5ua92NcSlmLsK9j+dl6q6sg+rQSzWEK2EBEChTq
 MIPF5cSGwh2j8g==
X-ME-Sender: <xms:r-AhXbx7virTWc-EM0UiVxEaCwg-TQsS4HU6OykBq7XxKu-_u4r0Qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeei
X-ME-Proxy: <xmx:r-AhXYssLkCRwfsupbwWswbZgJZe5guMTKwMisjF786t9WJ5oNdFFg>
 <xmx:r-AhXaH42Dxxib7lvppj34bpRI8FFLcuzBxBfcFFpG0TkGyfNewU4g>
 <xmx:r-AhXWfroe4R2o5PFKBXKw8qq3MOhY_BD9ppKmf2pSefAP4sunmABQ>
 <xmx:r-AhXdft1wFMhtDJ2tBGX6dEmd6ZT3jn62qXk897JRbhIpnly57XSQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF52D8005C;
 Sun,  7 Jul 2019 08:08:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:59 +0900
Message-Id: <20190707120759.16371-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 7/7] ALSA: firewire-lib: code refactoring for
	local variables
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

It's better to use int type for loop index. For consistency, the name
of local variable for the number of data block should be plural.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 81af191627db..51f97df81dbf 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -700,7 +700,8 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 {
 	struct amdtp_stream *s = private_data;
 	const __be32 *ctx_header = header;
-	unsigned int i, packets = header_length / sizeof(*ctx_header);
+	unsigned int packets = header_length / sizeof(*ctx_header);
+	int i;
 
 	if (s->packet_index < 0)
 		return;
@@ -708,7 +709,7 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 	for (i = 0; i < packets; ++i) {
 		u32 cycle;
 		unsigned int syt;
-		unsigned int data_block;
+		unsigned int data_blocks;
 		__be32 *buffer;
 		unsigned int pcm_frames;
 		struct {
@@ -719,12 +720,13 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 		cycle = compute_it_cycle(*ctx_header);
 		syt = calculate_syt(s, cycle);
-		data_block = calculate_data_blocks(s, syt);
+		data_blocks = calculate_data_blocks(s, syt);
 		buffer = s->buffer.packets[s->packet_index].buffer;
-		pcm_frames = s->process_data_blocks(s, buffer, data_block, &syt);
+		pcm_frames = s->process_data_blocks(s, buffer, data_blocks,
+						    &syt);
 
-		build_it_pkt_header(s, cycle, &template.params, data_block, syt,
-				    i);
+		build_it_pkt_header(s, cycle, &template.params, data_blocks,
+				    syt, i);
 
 		if (queue_out_packet(s, &template.params) < 0) {
 			cancel_stream(s);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
