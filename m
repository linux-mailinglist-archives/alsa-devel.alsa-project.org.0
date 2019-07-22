Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 553696F810
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:44:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17A71739;
	Mon, 22 Jul 2019 05:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17A71739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767075;
	bh=u0IFCTSIlOb5zxDunw1Gvd5McwTURwzR5KlD89vHUGk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uz6pS7+OuJ8CoVJPNcMKWrfivF9Aj/fzmsxHeqpIUm5j6pPF8vwgfabyqKhHAs16H
	 L6RJyw8K4z6sj4sZpwQrK8JIruiKd90gI7U3NjXw2l6ccstEXC2jzgte9XZ7is1Oe/
	 aqF608dFf96RutwZlypaXWr/amE7WKQ3igl4Q71U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4769AF805F5;
	Mon, 22 Jul 2019 05:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB47F8049C; Mon, 22 Jul 2019 05:37:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D08CF803F4
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D08CF803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HPAIc+3+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="M+IFJG3V"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 38F7021E92;
 Sun, 21 Jul 2019 23:37:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=UF2Y40F3rfCBB
 4iI422gVuJdsnma4DYePmsb7I91kQo=; b=HPAIc+3+WQg31zGXabIAq1LLDYaxy
 9fK7KUDfRW/OObHx+GLuknEY5u9wimWWQR3mmnSbhQftdFKSODQUDl3tMxCtclOW
 Qxt8piD2csGrHkRL9DXtKRx1GY38pDb4RHzrommnx38W5EveIHXsHRL5nwzW0u7H
 Ab0AV9bz2Re4R1dMUbMGTr8oMKgn1PvRzeXm3x4/KuBTW5vJiuoCLpM61smZ57wi
 ZnRhnDUCdxL8QfcUqFf2CBTc5Bnnsgz+vbeS3u0c6edAa1AjIN1yci1SBRC9sZNa
 1Ca30ZZR4IWs47KheAJDQ0HUrYar2uRzWEzgN6bXPezWMaFT6+pVC1zpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UF2Y40F3rfCBB4iI422gVuJdsnma4DYePmsb7I91kQo=; b=M+IFJG3V
 /CuqiskKbfXXTm7tpIWlhy9ZzIaoqLYDoH7Tk2+FxmoOojfkHrJYG97ZYajfIYdU
 3bdrq1eiatZt8u+nTAVdMVg5lNPxATAeznejK0dch3hG1b26BWq3qVXxwE9cgTEM
 TP6BigZkd2Nn+lPdb85ltznmn+Xyu8e0dTBcdsXJmOgFlKl8Rw+w4M/YcxtYFJcn
 twcu/vKPWfyuTBu/4DqhFAS9dsCPo11oHFymc9zcSmW8JEE7VlqqgTgGEQSUwTnC
 V5pn/KQnTWxZ0Gbswys/teNIxFaqpJk9wH+r+4xVzAilTE+06ZZybqTfOlP6KLMn
 YYHDhJGw7uz1kw==
X-ME-Sender: <xms:eC81XQy4GyMpeS1B5ATUb_8nnTtJ8h9doLeAV-oR4DlWWT8_5nxEiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:eC81XXHQ-HiuF9iG3CApsQhBWn4C68j8PSXAYFxXUTq5c6TnaA9NEQ>
 <xmx:eC81XVFP1XSfPHJ_73httc2z9k_76hYA7O072r72gNHpv24NWWoXrw>
 <xmx:eC81XSC7hu4bQ7B59vEARzkgn8c5neVPSEy_UcJASREa9F4sl5H8iw>
 <xmx:eC81XRk96qqplcN_15hcdDJcM0eNjJJYOtnXxiTm_VAI1kYfzfKgzQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id C609980059;
 Sun, 21 Jul 2019 23:37:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:36:58 +0900
Message-Id: <20190722033710.28107-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/20] ALSA: firewire-lib: add list of packet
	descriptor
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

In current implementation of ALSA IEC 61883-1/6 packet streaming engine,
16 packets are handled in one interrupt of isochronous context of OHCI
1394.

Overall packet processing runs for each. However, this is not better in
a point to split the processing into several parts.

This commit is an attempt to add intermediate representation for
parameters required for the parts.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 15 ++++++++++++---
 sound/firewire/amdtp-stream.h |  9 +++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c8543cdb3c8c..2bea15151d4a 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -936,6 +936,13 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	else
 		s->tag = TAG_CIP;
 
+	s->pkt_descs = kcalloc(INTERRUPT_INTERVAL, sizeof(*s->pkt_descs),
+			       GFP_KERNEL);
+	if (!s->pkt_descs) {
+		err = -ENOMEM;
+		goto err_context;
+	}
+
 	s->packet_index = 0;
 	do {
 		struct fw_iso_packet params;
@@ -947,7 +954,7 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 			err = queue_out_packet(s, &params);
 		}
 		if (err < 0)
-			goto err_context;
+			goto err_pkt_descs;
 	} while (s->packet_index > 0);
 
 	/* NOTE: TAG1 matches CIP. This just affects in stream. */
@@ -958,12 +965,13 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 	s->callbacked = false;
 	err = fw_iso_context_start(s->context, -1, 0, tag);
 	if (err < 0)
-		goto err_context;
+		goto err_pkt_descs;
 
 	mutex_unlock(&s->mutex);
 
 	return 0;
-
+err_pkt_descs:
+	kfree(s->pkt_descs);
 err_context:
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
@@ -1059,6 +1067,7 @@ void amdtp_stream_stop(struct amdtp_stream *s)
 	fw_iso_context_destroy(s->context);
 	s->context = ERR_PTR(-1);
 	iso_packets_buffer_destroy(&s->buffer, s->unit);
+	kfree(s->pkt_descs);
 
 	s->callbacked = false;
 
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 5996cc60f166..73c492c9a5d5 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -94,6 +94,14 @@ enum amdtp_stream_direction {
 	AMDTP_IN_STREAM
 };
 
+struct pkt_desc {
+	u32 cycle;
+	u32 syt;
+	unsigned int data_blocks;
+	unsigned int data_block_counter;
+	__be32 *ctx_payload;
+};
+
 struct amdtp_stream;
 typedef unsigned int (*amdtp_stream_process_data_blocks_t)(
 						struct amdtp_stream *s,
@@ -110,6 +118,7 @@ struct amdtp_stream {
 	struct fw_iso_context *context;
 	struct iso_packets_buffer buffer;
 	int packet_index;
+	struct pkt_desc *pkt_descs;
 	int tag;
 	union {
 		struct {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
