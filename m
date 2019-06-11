Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50153CCE1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629ED174E;
	Tue, 11 Jun 2019 15:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629ED174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259647;
	bh=FJmlqrCSCpf2y6pQSBs2BVG6lPFJfScrjFRXKyslhjg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LVLwZ/cNUK3NeJa4R3mdoiAErQ0JzS7qxkm+es8oo5+o0uvTPAuEIKbllqDif1L6+
	 9JAFktKSkAaKlM3U7LLoum0XKUYlqYJrpH+k7KmNrupv/OpBu3+JtxPN7CIV9OVL+R
	 JotonUKnv7+HOkB3v6x5uQeokBM3UZBxKwZsPsBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F2EEF8974D;
	Tue, 11 Jun 2019 15:21:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52153F89738; Tue, 11 Jun 2019 15:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A7C5F89730
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A7C5F89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Nlj9W9AY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AJIn6ntb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 282B9220CA;
 Tue, 11 Jun 2019 09:21:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+QML2fywB7sGG
 zv6t2PtV67RaeYlhvF3Wa101RpccmA=; b=Nlj9W9AYQWJ7SQHGGzFLih9wxJv9U
 8kKCqig8a1Wi+huKGv4eQoqLezCnvsMBf2SEa+F9IMC4PDPlWtlBAeAbGSeW3u6b
 3fthLSpEeMAhPyyoMthGloEawEqTato/tg6IQgkcfC5hnW/PxJYW0tR1dCdYGus8
 nu4MgzCWoDxSuhvKk8rcR7UVqtFMXIW1wF9C2PEGmfkxs64X8YLT05bjYNZ8rFX2
 3XElu70Uz17MfmdqSgLh2CKKsspXaFyYl4OIYKLOfbfZEKwzPbfBZdJ32Qw3x/Vb
 fJi1MYBPs2AeUrA2EIIJsdVs0Xq30iLne2pIp/4Emuk9wKASL7e9PVa1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+QML2fywB7sGGzv6t2PtV67RaeYlhvF3Wa101RpccmA=; b=AJIn6ntb
 ch2MXXnF56v8X/RbOXpqAIVnrRgcFRLXw04qCeSyruJuiE2xI2+pfmDBUInkBX7J
 hpnCwX9XGPYYRBD14cEGt9FV9rkymDEfvTP5QRLI0yflQ2Xk1D5T30DRP9FkhyIv
 mtDfF3l1wOPLzKVPDQYuobOpQynGZfYsDErWgM/12R7IHMuJS1ERDI0T+ONbjrRX
 PXn3eCrfFaN11UsUQGOEHi7RKMIIV4Jx9fq49i+uUbb9m5QjE1dzX1FDAOO4W0te
 slwjipEBHhwJ4O984q+0uyXJG6u6qS5K6RnaJiSpZvDrjEthVFnNw1MihBf+Q3H7
 jUhTnXrgvy56xA==
X-ME-Sender: <xms:3ar_XDn_L2sPsm6puxwGZl5P7Vlo_Ehz1FiV8zpcGmrBv_Ukb2r5Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:3qr_XHSotZQfnfvxrnZhVk2GNGaxVzwfsXHVBrxQ_SXV5dwnFImbDA>
 <xmx:3qr_XPE0Xz5KEd0w0YxDmXom8LDawxQ0YIqC9L4DLPwtvOMpPmN8TQ>
 <xmx:3qr_XJhnfvr98bKQ5VaTUYPvCTUAboYKaZNbCRjIf1gLnCejSKZhSQ>
 <xmx:3qr_XG-huhXdZKmnPWTQ8gVO3RpV_Jt5P--IaQtzWzsiJ1UmK5-NJQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7705E380087;
 Tue, 11 Jun 2019 09:21:32 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:12 +0900
Message-Id: <20190611132118.8378-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/12] ALSA: firewire-digi00x: update
	isochronous resources when starting packet streaming after bus-reset
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

After bus reset, isochronous resource manager releases all of allocated
isochronous resources. The nodes to transfer isochronous packet should
request reallocation of the resources.

However, between the bus-reset and invocation of 'struct fw_driver.update'
handler, ALSA PCM application can detect this situation by XRUN because
the target device cancelled to transmit packets once bus-reset occurs.

Due to the above mechanism, ALSA fireface driver just stops packet
streaming in the update handler, thus pcm.prepare handler should
request the reallocation.

This commit requests the reallocation in pcm.prepare callback when
bus generation is changed.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-stream.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 3b903e42d29a..3c5e1c5a2e11 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -303,6 +303,7 @@ void snd_dg00x_stream_release_duplex(struct snd_dg00x *dg00x)
 
 int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 {
+	unsigned int generation = dg00x->rx_resources.generation;
 	int err = 0;
 
 	if (dg00x->substreams_counter == 0)
@@ -312,6 +313,16 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 	    amdtp_streaming_error(&dg00x->rx_stream))
 		finish_session(dg00x);
 
+	if (generation != fw_parent_device(dg00x->unit)->card->generation) {
+		err = fw_iso_resources_update(&dg00x->tx_resources);
+		if (err < 0)
+			goto error;
+
+		err = fw_iso_resources_update(&dg00x->rx_resources);
+		if (err < 0)
+			goto error;
+	}
+
 	/*
 	 * No packets are transmitted without receiving packets, reagardless of
 	 * which source of clock is used.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
