Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4F4F96F
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2019 03:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B97D1654;
	Sun, 23 Jun 2019 03:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B97D1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561253637;
	bh=+IakiaOScG5oYO3PiiTTGuwyXg74/1/ZMV5G9KZiCvg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z/KvISBKvpM71VjNIpDbv9Pn6J0SycRcW5HxDTLBXlcG3GnZnAXkIXGEV/m2inimt
	 e/X6ktM9NQezr0Iy2T1I0WMIKXz9qUtfdrPoEwSYy+p2ht3oyP20mET12LmcxeoLTJ
	 OB32fbFV8D2mYH+kSjwGokR6c6tqXraeV/SaSrjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F277F806ED;
	Sun, 23 Jun 2019 03:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37F49F89717; Sun, 23 Jun 2019 03:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD744F806ED
 for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2019 03:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD744F806ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Gob4msBp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="D4I1pfnE"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 251B521DFB;
 Sat, 22 Jun 2019 21:32:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 22 Jun 2019 21:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=3e/+6FUETT0rpILXPZUk/g5/xD
 tJXkmG5FwICk6U7vA=; b=Gob4msBpsyA1iRpb717XE64kfyP30BAIKN7ruv7NUA
 dBkTzGY8r5Hx4hzP7OBfHvCoOQsOTEhq08jPCtGCP6mk0LQkwlxhjSv4Tta8xsSK
 7WdGYvTaZgKe4ZQCnML+e8/tipfzXbqY/ywumGn558T9WmXcMY//eNoOBnZPCmBl
 72pgcRWCMovRlvEXr+T2KNYnFhjeCzXYMhd7IuJGlIqc/11jYwhUfCuc4d6h8Cb0
 4970MHjUAcWqnPAqq6sSfFaN47YCmkjA2neLzC3ahQTUkja2G+9ySjImnn2UPrkh
 TJOcac7e0M8jBPEVlDRzoY3HCMSCc66iioRdTGt0Lqdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3e/+6FUETT0rpILXP
 ZUk/g5/xDtJXkmG5FwICk6U7vA=; b=D4I1pfnEQZPwDVtGkoAKssQR/KyHQnoqH
 MKA3JLcgrSGrpYUkrwpuuZ9y85mXzIvno7mKX4KLfTdx/lVYas1k1jAf1LRtaaNB
 FbvSUx22ThzGD93Wfyfg7ZAjCuugQrZuXA7DsBxGP1zYIpN+65owox+ZJ7kz87us
 w9HC6HeucgVfR63R8/5nbznD6zZD08u6v8oE306txe9/IUhiWSoBbjsWDyhcVNYp
 x9G6bArHf1Q/wBKvlIz4QTCX3a2qZDv/EUJas0svidLdFxIpTZxdWO7sqpSe6oLG
 tMrUgl/JafN1VgsY99ogCTVymoorw62ETDBKGgCG2rfyxh6ZwYEzg==
X-ME-Sender: <xms:k9YOXRATvwsKZObUFKYpbalKKC-eM6WwV-2OyU6X12aLjXoGaUy1rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdelgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:k9YOXdzwptNI4Ij07JsEjrgXxdp1o9JTgi4pPsy7zq5sSzZmg347Kg>
 <xmx:k9YOXWu5NvT9QYJiMjq9hkmuQ_T7sptXxow-mrE_A0KW5v25FNo3RQ>
 <xmx:k9YOXYJvaa47gddFcKIQmr6NRU0HqaxdBQ4JFsCLSa9CwXkSfNr_8w>
 <xmx:lNYOXVwOt69h1KvnSZIEbZyEq0CIeDh-15oGs7vtsBGPmWzQ7izhOw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 103CE80063;
 Sat, 22 Jun 2019 21:32:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun, 23 Jun 2019 10:31:59 +0900
Message-Id: <20190623013159.17280-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-motu: unify common tracepoints
	for both direction
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
