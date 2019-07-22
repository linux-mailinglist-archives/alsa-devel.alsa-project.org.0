Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F16F824
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 05:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E2E1736;
	Mon, 22 Jul 2019 05:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E2E1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563767523;
	bh=hXWbMydgI35eHj9V+T+u+u0g4ywYZT+dwUcHflP+8cE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHVQ7x9/HwIbVEUca1UHPeyJ9FE4dEkzQ/EcAWsSDvc0lLYWajhfTXJ7jj0Wkfpym
	 UQttC9+yywVZgsLMo3Qx33TdGQyQ5jBpWoNjkAeFl2n8RztZZ4Mpt8nYxH8MSRzdZ9
	 QIWKUaFaEUt4ZUPjkeRO1JSI9nSMcPZXj8LdPrJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E956F8070C;
	Mon, 22 Jul 2019 05:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90A18F805E1; Mon, 22 Jul 2019 05:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAEEDF805A1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 05:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAEEDF805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DPxARCnu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="l458887+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F14FE21FC2;
 Sun, 21 Jul 2019 23:37:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 21 Jul 2019 23:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=PjT65MBHOBuoj
 pWSTz5eFkQHVIiV0XET/B6mx3CopxA=; b=DPxARCnuimy3qec+2eOjyBAhn2SSE
 8Fn6jRndWgllzRfBIcbo/6MQgGeDw50u76ZIfjWFx7n8Gj+o1aqylv3JOO2sYmYd
 qdA6orK+cdo7/2Ji8K3+jQx4lmIKWWv+1o5ZK6Fo4XXPf8vTU68ORAW+i8Q4AWrH
 1w1rr7HKR8UsxZbWkw0Kbcm6Gul2FdcWyG4tpy3s0y3wE8vtNJIicE+rDRVQQRFY
 OIiHURlIWHLvMRcv9aJprlc1PyOIHuVyrbX6lwVOoy4ASysRHjMHclRo6mwFCIL/
 a0+0sBrsUvtpccHYx3rbxydTKQWCJYH6eutmpiiY5HxOpAGSg4Kvw74Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=PjT65MBHOBuojpWSTz5eFkQHVIiV0XET/B6mx3CopxA=; b=l458887+
 G/vAXEQJ2gblQgD8KA5FYwnlxTfRLHwSzpTyMiKo89rWoXBQDuG7BSDVcAksmWYh
 Yen+Eg/vEy7+sFrMU+hXGtlyioj2RPLOSBx5Q9DBvAa7vt8PuL4MkOl+OJ3diHIr
 v0s1AQnhLu+eoalQeIJMjVf6/XY0gciiVKTNC30pYmpSqalJ1pTFbnzg0vGlGtUg
 UvFmMZkidap6/oyAA2aMsDkiHPzj1iGbXcMJUFbz0dJ4/ZTgK1ABDGfYIpBccakk
 wz9Xq0l2px0bvvwgFt0np9N0eoqYEBPYJqXX6ux3dUltD4QG83tCfaCTiHDqIAzx
 eQd6gifFUbgIhQ==
X-ME-Sender: <xms:ii81XeHo8wD52UgAERFiRrOC3QDG1Ug4YLJ9jEK7nItbs8MOk2HBJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedule
X-ME-Proxy: <xmx:ii81XcJdLrs8_pWSQIHtTDFSah2t7SeFAcuM2AJ0YBbHAYQ6lv0EBA>
 <xmx:ii81XcW8e86b5YG2nx32UCyC0WIC6ahIhjm7mpgKu2Q9orpi5PXK7Q>
 <xmx:ii81XWPHgx5jVXddV-jxC8uzIq1Tl12efZiU0yC0VEIiTu69F6t1Jw>
 <xmx:ii81XYFwKS1tOdzBujvzQQCJvc38R-K_p5-mdqjMJMZENahZiM1QTQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 831148005C;
 Sun, 21 Jul 2019 23:37:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 22 Jul 2019 12:37:10 +0900
Message-Id: <20190722033710.28107-21-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
References: <20190722033710.28107-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 20/20] ALSA: firewire-motu: more code
	refactoring for MOTU data block processing layer
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

MOTU data block processing layer has some tracepoints events. This
commit is code refactoring to split probing the events from processing
data blocks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c | 50 +++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 05a6e218b0ad..0fd36e469ad0 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -310,6 +310,22 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 	}
 }
 
+static void probe_tracepoints_events(struct amdtp_stream *s,
+				     const struct pkt_desc *descs,
+				     unsigned int packets)
+{
+	int i;
+
+	for (i = 0; i < packets; ++i) {
+		const struct pkt_desc *desc = descs + i;
+		__be32 *buf = desc->ctx_payload;
+		unsigned int data_blocks = desc->data_blocks;
+
+		trace_data_block_sph(s, data_blocks, buf);
+		trace_data_block_message(s, data_blocks, buf);
+	}
+}
+
 static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 					    const struct pkt_desc *descs,
 					    unsigned int packets,
@@ -319,23 +335,26 @@ static unsigned int process_ir_ctx_payloads(struct amdtp_stream *s,
 	unsigned int pcm_frames = 0;
 	int i;
 
+	// For data block processing.
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = descs + i;
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
-		trace_data_block_sph(s, data_blocks, buf);
-		trace_data_block_message(s, data_blocks, buf);
-
-		if (p->midi_ports)
-			read_midi_messages(s, buf, data_blocks);
-
 		if (pcm) {
 			read_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
 			pcm_frames += data_blocks;
 		}
+
+		if (p->midi_ports)
+			read_midi_messages(s, buf, data_blocks);
 	}
 
+	// For tracepoints.
+	if (trace_data_block_sph_enabled() ||
+	    trace_data_block_message_enabled())
+		probe_tracepoints_events(s, descs, packets);
+
 	return pcm_frames;
 }
 
@@ -390,16 +409,12 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 	unsigned int pcm_frames = 0;
 	int i;
 
+	// For data block processing.
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = descs + i;
 		__be32 *buf = desc->ctx_payload;
 		unsigned int data_blocks = desc->data_blocks;
 
-		// TODO: how to interact control messages between userspace?
-
-		if (p->midi_ports)
-			write_midi_messages(s, buf, data_blocks);
-
 		if (pcm) {
 			write_pcm_s32(s, pcm, buf, data_blocks, pcm_frames);
 			pcm_frames += data_blocks;
@@ -407,12 +422,19 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 			write_pcm_silence(s, buf, data_blocks);
 		}
 
-		write_sph(s, buf, data_blocks);
+		if (p->midi_ports)
+			write_midi_messages(s, buf, data_blocks);
 
-		trace_data_block_sph(s, data_blocks, buf);
-		trace_data_block_message(s, data_blocks, buf);
+		// TODO: how to interact control messages between userspace?
+
+		write_sph(s, buf, data_blocks);
 	}
 
+	// For tracepoints.
+	if (trace_data_block_sph_enabled() ||
+	    trace_data_block_message_enabled())
+		probe_tracepoints_events(s, descs, packets);
+
 	return pcm_frames;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
