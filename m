Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3750584
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 11:18:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B7B1676;
	Mon, 24 Jun 2019 11:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B7B1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561367922;
	bh=U31oZ9y41N1a1Ciu4GwuGwk8MKqS0jp5RT6D55pC7ug=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dFckzcaIF8QqXHtSuckSewYtkvzM/bTWieLdxVHibpn7rlSb0TaDUqfzB7ySYBBYp
	 wSbumSQQ760PZk5LLHeIIpwn/OqwUMOg/VG2TZfapXY7t++h4dx8mZ0HgsX8cmITh0
	 3Jl7KIQwxNphwfgssVlUEdE5t0YuBIVksnjFBH/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5279AF896CB;
	Mon, 24 Jun 2019 11:16:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A33DF896B7; Mon, 24 Jun 2019 11:16:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83EFBF8071F
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 11:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83EFBF8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="H43Ylmtq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="adsZ5w29"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C257A221B2;
 Mon, 24 Jun 2019 05:16:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 24 Jun 2019 05:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=hei9fulxCTsMnHOdfI3UzjATPm
 m2dFMRYe8ZUwMr+dw=; b=H43YlmtqqKa4mgp99OVh5lbebvw0KmCzJGlWB226TM
 Y0zPsHI8UT+XL0IOh+Eyck/eAzWD7QWgquEzFhccGeUT7EBgXl/WsOISGsO8a1RF
 b3Syg8g4rRN/WxZWLkCt1sFW5lG4lunI5I0iI5T3rtmAAW9r3/cVp5G7mibEZunu
 HSNvq8E5h3w5dSgMZ+pxqlALV37fWtJ6H0cAL7+R6dHvjL4ST064KWgBnutTL89r
 GtATAel432Pb+tHcax3hbURQzEYFvIQJ0hH4rdYIdi4X4gigWPiIml3mqHhweBf+
 H3bJKYap4sccC+fmFyCuK/A4NVBZqgJM4ZwxoSZdLZaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hei9fulxCTsMnHOdf
 I3UzjATPmm2dFMRYe8ZUwMr+dw=; b=adsZ5w29HXo9vtFunq75DSyMtLr9LeE9e
 qTq5j3WRk8/DZUqTTmULoj2FmQaWBT3F6mCwr1VTW51zIBoRwgS9xB32E+fiK09h
 KgkU9/N2cZ9nWPUOGbdDQLzV7kFPgUuw4FBvbz0KPPQcF/ChLEo2NEgU7pqJEaj7
 bQEykSBzXQA6UvlD7rCWjsCV/th29f4hSZxM/a6N0iRuRcvSrqxkbmLJxSQfccdA
 wsv/kh5846nsAyNMJC9cEEOh/sjN1wf3/yz6zUuWsnN6yor7Zuge8XECqmvFojGU
 NbKFA4mmCjs7bBSrQQp/NV/Ne1grio14Wb5W6t1pK628fEzboHoqg==
X-ME-Sender: <xms:AZUQXfYGUzVfm1hRCRHzk8a7aVtGzH2DQ7pvOpECttVNeJWweN_7wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AZUQXZjrSYL4ciRY3uVe6MMhYme_UYGH5VklqhH2-W2PQFrCPG-poQ>
 <xmx:AZUQXcQPuLoQabp7FIh3idi3a_MBPDk1MwpsDbIN1jzJTmOoxzosFA>
 <xmx:AZUQXSPGAf7tAQX2qo2DK4kmPT3I8t9OJQUerHRGwiOWhLE4lpUwYQ>
 <xmx:ApUQXeGctd4qJR6CgchjqV4lhxxPGIgb8K3VXIJiInbwaJZHovzmLw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AEB7780066;
 Mon, 24 Jun 2019 05:16:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 24 Jun 2019 18:16:46 +0900
Message-Id: <20190624091646.7955-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2] ALSA: firewire-motu: unify common
	tracepoints for both direction
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

In ALSA firewire-motu driver, some tracepoints are supported to probe
vendor-specific data fields for SPH and status/control messages in
payload of isochronous packet. At present, the events of tracepoints
are unique each of direction, however the pair of events has the
same structure and print format. It's possible to unify the pair.

This commit unifies the pair. From userspace, direction is specified
by filtering for src/dst fields in the structure.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu-trace.h | 70 ++++++--------------------
 sound/firewire/motu/amdtp-motu.c       |  8 +--
 2 files changed, 20 insertions(+), 58 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu-trace.h b/sound/firewire/motu/amdtp-motu-trace.h
index cd0cbfa9f96f..edc551d4ca50 100644
--- a/sound/firewire/motu/amdtp-motu-trace.h
+++ b/sound/firewire/motu/amdtp-motu-trace.h
@@ -18,7 +18,7 @@ static void copy_sph(u32 *frame, __be32 *buffer, unsigned int data_blocks,
 static void copy_message(u64 *frames, __be32 *buffer, unsigned int data_blocks,
 			 unsigned int data_block_quadlets);
 
-TRACE_EVENT(in_data_block_sph,
+TRACE_EVENT(data_block_sph,
 	TP_PROTO(struct amdtp_stream *s, unsigned int data_blocks, __be32 *buffer),
 	TP_ARGS(s, data_blocks, buffer),
 	TP_STRUCT__entry(
@@ -28,8 +28,13 @@ TRACE_EVENT(in_data_block_sph,
 		__dynamic_array(u32, tstamps, data_blocks)
 	),
 	TP_fast_assign(
-		__entry->src = fw_parent_device(s->unit)->node_id;
-		__entry->dst = fw_parent_device(s->unit)->card->node_id;
+		if (s->direction == AMDTP_IN_STREAM) {
+			__entry->src = fw_parent_device(s->unit)->node_id;
+			__entry->dst = fw_parent_device(s->unit)->card->node_id;
+		} else {
+			__entry->src = fw_parent_device(s->unit)->card->node_id;
+			__entry->dst = fw_parent_device(s->unit)->node_id;
+		}
 		__entry->data_blocks = data_blocks;
 		copy_sph(__get_dynamic_array(tstamps), buffer, data_blocks, s->data_block_quadlets);
 	),
@@ -42,55 +47,7 @@ TRACE_EVENT(in_data_block_sph,
 	)
 );
 
-TRACE_EVENT(out_data_block_sph,
-	TP_PROTO(struct amdtp_stream *s, unsigned int data_blocks, __be32 *buffer),
-	TP_ARGS(s, data_blocks, buffer),
-	TP_STRUCT__entry(
-		__field(int, src)
-		__field(int, dst)
-		__field(unsigned int, data_blocks)
-		__dynamic_array(u32, tstamps, data_blocks)
-	),
-	TP_fast_assign(
-		__entry->src = fw_parent_device(s->unit)->card->node_id;
-		__entry->dst = fw_parent_device(s->unit)->node_id;
-		__entry->data_blocks = data_blocks;
-		copy_sph(__get_dynamic_array(tstamps), buffer, data_blocks, s->data_block_quadlets);
-	),
-	TP_printk(
-		"%04x %04x %u %s",
-		__entry->src,
-		__entry->dst,
-		__entry->data_blocks,
-		__print_array(__get_dynamic_array(tstamps), __entry->data_blocks, 4)
-	)
-);
-
-TRACE_EVENT(in_data_block_message,
-	TP_PROTO(struct amdtp_stream *s, unsigned int data_blocks, __be32 *buffer),
-	TP_ARGS(s, data_blocks, buffer),
-	TP_STRUCT__entry(
-		__field(int, src)
-		__field(int, dst)
-		__field(unsigned int, data_blocks)
-		__dynamic_array(u64, messages, data_blocks)
-	),
-	TP_fast_assign(
-		__entry->src = fw_parent_device(s->unit)->node_id;
-		__entry->dst = fw_parent_device(s->unit)->card->node_id;
-		__entry->data_blocks = data_blocks;
-		copy_message(__get_dynamic_array(messages), buffer, data_blocks, s->data_block_quadlets);
-	),
-	TP_printk(
-		"%04x %04x %u %s",
-		__entry->src,
-		__entry->dst,
-		__entry->data_blocks,
-		__print_array(__get_dynamic_array(messages), __entry->data_blocks, 8)
-	)
-);
-
-TRACE_EVENT(out_data_block_message,
+TRACE_EVENT(data_block_message,
 	TP_PROTO(struct amdtp_stream *s, unsigned int data_blocks, __be32 *buffer),
 	TP_ARGS(s, data_blocks, buffer),
 	TP_STRUCT__entry(
@@ -100,8 +57,13 @@ TRACE_EVENT(out_data_block_message,
 		__dynamic_array(u64, messages, data_blocks)
 	),
 	TP_fast_assign(
-		__entry->src = fw_parent_device(s->unit)->card->node_id;
-		__entry->dst = fw_parent_device(s->unit)->node_id;
+		if (s->direction == AMDTP_IN_STREAM) {
+			__entry->src = fw_parent_device(s->unit)->node_id;
+			__entry->dst = fw_parent_device(s->unit)->card->node_id;
+		} else {
+			__entry->src = fw_parent_device(s->unit)->card->node_id;
+			__entry->dst = fw_parent_device(s->unit)->node_id;
+		}
 		__entry->data_blocks = data_blocks;
 		copy_message(__get_dynamic_array(messages), buffer, data_blocks, s->data_block_quadlets);
 	),
diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 62685f2528ce..1c9ce04a2e89 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -306,8 +306,8 @@ static unsigned int process_tx_data_blocks(struct amdtp_stream *s,
 	struct amdtp_motu *p = s->protocol;
 	struct snd_pcm_substream *pcm;
 
-	trace_in_data_block_sph(s, data_blocks, buffer);
-	trace_in_data_block_message(s, data_blocks, buffer);
+	trace_data_block_sph(s, data_blocks, buffer);
+	trace_data_block_message(s, data_blocks, buffer);
 
 	if (p->midi_ports)
 		read_midi_messages(s, buffer, data_blocks);
@@ -384,8 +384,8 @@ static unsigned int process_rx_data_blocks(struct amdtp_stream *s,
 
 	write_sph(s, buffer, data_blocks);
 
-	trace_out_data_block_sph(s, data_blocks, buffer);
-	trace_out_data_block_message(s, data_blocks, buffer);
+	trace_data_block_sph(s, data_blocks, buffer);
+	trace_data_block_message(s, data_blocks, buffer);
 
 	return data_blocks;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
