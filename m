Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A206F817
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7637F1743;
	Mon, 22 Jul 2019 05:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7637F1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767197;
	bh=+2eUkQAaknhDT0r17swp/dmzqFQiC4o61d/criEjMMw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szvroV3GAJ5vxN2YTIYY6DX0OhlcAZOeGb2bfMErhgRLpZwzERxFeRyxm0lwej+n1
	 7YWvCQ37oxoBTh1w3g6UtsN/Fj/tF0oBFHhsLHqKemGsO4Zt1IS9DLbf0TUKV/yJ1a
	 GIIoKBII7ZYo3DhzalwNIXag66JkJBIeOhqBIECA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34208F80610;
	Mon, 22 Jul 2019 05:37:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17F2F80518; Mon, 22 Jul 2019 05:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94005F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94005F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iLu6pYFG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cfew1Y8W"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BD00820931;
 Sun, 21 Jul 2019 23:37:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bQSebmaZV7ssD
 OzPi3wfrPCHGs68TGv2HIGuJYRs82c=; b=iLu6pYFG7gFoaj73nsZEsfBIfyn93
 BM3uTIbmP6LsgHBAqdoGz3dJE+TBoDiVm/d+/f7xcNqYuj7ygkINIM+XR4l3fGzt
 T6gP4HZWuERD7CtZ37s+n9MvnU9mPfKHXiUF9+Ag9JiT6KVwfXl3colmnveULRwp
 WzidwFu1mLvph9PYb9NJ37too4vAPI+0BVk1g5PFHrFMd7Y3SEmpPjLW1kFfL0TF
 d+jB9qOvliDeXV9a+tMhD3BqteUlMiPweah31Mw4ccUWKuSQnpWCO7svJ3BOD50X
 KqOKdGJ+hs8iby39y1NetWfeZfg6IeKzOwD303x77VX4BDOaOPF0K/iZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=bQSebmaZV7ssDOzPi3wfrPCHGs68TGv2HIGuJYRs82c=; b=cfew1Y8W
 n/L9QP4Hpkm+1Tbgp2kBbF4gY8Q2c3Fpb8DBsM2L9M8S9/H4hv1otLfn1u5YYXw1
 RMYP05lvEcLZZIjs2Plx5E0Tv19mRG71YKzLygAb+IlKuKTlUhFTwU+6zvcOqYxd
 d/2SjmRwG2wNdzzNTW+JsRLQu03/PcFGiqsfnj56ImTGizLn45yFFXUbqm1BReI3
 AadAW6emUNWa7ucIxyON/NoLSqXxCrX2h56hUGHfq5OS4tis47T5feisiXIL4qdw
 cwj+QCchMP/1NElMafbhhWfd6UH29gK5Oiem/yAbEip28YdnSY1k8/CP4fef62Ge
 l3yBE5N3LHYFjA==
X-ME-Sender: <xms:fC81XUL7M17_U9ZHwM1s4c090Ol9u2NlbpX2gWkZLQov9p9tVs9bEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:fC81XR9V14WwF1HJFxXSODm_unFavCNf2lI7sNskAuzwCkFTSDZOyg>
 <xmx:fC81XfJN_npTGGpALRkytLvNhlSd9ybBOvhtUJqdsOeycY18ltdrhQ>
 <xmx:fC81Xenp_N0Bvw1uzJ2QvLIag5qJ7kRdP0c8TzSOtG97C3Ywzh4Yhw>
 <xmx:fC81XWY6Ienwo1BBBBhgl33stbImjRxMdK2pMoySgpF2qYy_Z4qghw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56FA880059;
 Sun, 21 Jul 2019 23:37:31 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:01 +0900
Message-Id: <20190722033710.28107-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/20] ALSA: firewire-lib: code refactoring to
	process PCM substream
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

This is code refactoring to separate PCM substream processing from packet
queueing.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 45 +++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 68502a8864b9..99b89bd70bc5 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -776,16 +776,24 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
+		struct snd_pcm_substream *pcm;
 		unsigned int pcm_frames;
+
+		pcm_frames = s->process_data_blocks(s, desc->ctx_payload,
+				desc->data_blocks, desc->data_block_counter);
+
+		pcm = READ_ONCE(s->pcm);
+		if (pcm && pcm_frames > 0)
+			update_pcm_pointers(s, pcm, pcm_frames);
+	}
+
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = s->pkt_descs + i;
 		unsigned int syt;
 		struct {
 			struct fw_iso_packet params;
 			__be32 header[IT_PKT_HEADER_SIZE_CIP / sizeof(__be32)];
 		} template = { {0}, {0} };
-		struct snd_pcm_substream *pcm;
-
-		pcm_frames = s->process_data_blocks(s, desc->ctx_payload,
-				desc->data_blocks, desc->data_block_counter);
 
 		if (s->ctx_data.rx.syt_override < 0)
 			syt = desc->syt;
@@ -800,10 +808,6 @@ static void out_stream_callback(struct fw_iso_context *context, u32 tstamp,
 			cancel_stream(s);
 			return;
 		}
-
-		pcm = READ_ONCE(s->pcm);
-		if (pcm && pcm_frames > 0)
-			update_pcm_pointers(s, pcm, pcm_frames);
 	}
 
 	fw_iso_context_queue_flush(s->context);
@@ -831,28 +835,29 @@ static void in_stream_callback(struct fw_iso_context *context, u32 tstamp,
 			cancel_stream(s);
 			return;
 		}
-	}
-
-	for (i = 0; i < packets; i++) {
-		const struct pkt_desc *desc = s->pkt_descs;
-		unsigned int pcm_frames = 0;
-		struct fw_iso_packet params = {0};
-		struct snd_pcm_substream *pcm;
+	} else {
+		for (i = 0; i < packets; ++i) {
+			const struct pkt_desc *desc = s->pkt_descs;
+			struct snd_pcm_substream *pcm;
+			unsigned int pcm_frames;
 
-		if (err >= 0) {
 			pcm_frames = s->process_data_blocks(s,
 					desc->ctx_payload, desc->data_blocks,
 					desc->data_block_counter);
+
+			pcm = READ_ONCE(s->pcm);
+			if (pcm && pcm_frames > 0)
+				update_pcm_pointers(s, pcm, pcm_frames);
 		}
+	}
+
+	for (i = 0; i < packets; ++i) {
+		struct fw_iso_packet params = {0};
 
 		if (queue_in_packet(s, &params) < 0) {
 			cancel_stream(s);
 			return;
 		}
-
-		pcm = READ_ONCE(s->pcm);
-		if (pcm && pcm_frames > 0)
-			update_pcm_pointers(s, pcm, pcm_frames);
 	}
 
 	fw_iso_context_queue_flush(s->context);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
