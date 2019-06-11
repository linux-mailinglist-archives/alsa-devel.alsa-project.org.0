Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD923CCFD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5483D1753;
	Tue, 11 Jun 2019 15:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5483D1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259843;
	bh=cu9bVeY7S1hTpRpwhqtzgAYqIplNTzaJ7wLiXNQuBYc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vru/OwaKVj6MmS7Svvj4QzIvlfJCRhfSospuhKq+VxuQTdwIxDRtJhWC3Xf+vjCOr
	 f44l1SUKLhNquCs7mtexx01IG1WvmG8Asnq875B7ospvYu8cMiCb6iVW66fFAGKdtO
	 Eb7euQOyevbDVATnqMwOqF9Oe2TGk1oEvLVdbVPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE312F8976C;
	Tue, 11 Jun 2019 15:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45764F89744; Tue, 11 Jun 2019 15:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36D74F8973D
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D74F8973D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qkUQChX2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HZmArF87"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 657832228E;
 Tue, 11 Jun 2019 09:21:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=N/mkCm+VdODK2
 ZbeMzU7uYgzL+a9z91xp0AtRFXEbVY=; b=qkUQChX2hucAiznOkEHUK/+jJGK3c
 vjJpYbOnqfYBanncpOI9B04eB2u9sCBPsl1lEkwlzBZWnCSSugUXqHHkpKxtaMBa
 Btl+6pnO3EpZWZ0fj/zTQmUDBM7wwXL6igVZspBMg1K3O9hX9wSYPr3WZX4hUzOF
 isDweNfsoetlR/C9Fom1BRg5zLv+eukbZeqpDurYS8smlHKn/n6JIX+zzxzH/yIV
 JqursAy2kR37dlYhf59C7YsrEQrCqeU64FWXmXtoDAa+y6BHxYUE+LzrL5TeAaIi
 j1bMvb2mR2MBis8RH/YhB63jtzc6A2yppLDFCCXl7XJ/6CX44eXGCrEqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N/mkCm+VdODK2ZbeMzU7uYgzL+a9z91xp0AtRFXEbVY=; b=HZmArF87
 7v7rjsZ3sMxuhImpG/VGrfC1BKqXNGEfIFvzoPc07KL2hN8xTj3kRPd6ipm7sfKs
 /zPqAB0URJFdD0GPrp2dLoVAKjH7KeeGvpFKkyQ1p2whbRNXlriX2UqtAV544iPA
 myPhRJgEE+nID0rqK6I4EMREXuPWkbO9/iyaZBNcwZrlgk+SCUMztWyMCamJgFPh
 JwPbTk2BxBvqIMuO0hrT1+SqeWjBn9PcMiGiw+3JRtE/lA1Ak3jfJStiJmK7A50s
 rz4zFGwXmQaxS32IlSM8VXE/Eo/buMLYuxX6lYImD2ioAEvpSBYUs8iK8WTrPHPa
 +O2xFCV19LwueQ==
X-ME-Sender: <xms:56r_XLQKM-pPcRc9xfDOzU8jGoQ71FbV2tw7LJA8ay8DIV_W5xZGtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeple
X-ME-Proxy: <xmx:56r_XKQ-u1V5Vdm2dyZQLGSK8uk1cq41OUokkRq3UVcmuHXiQGzgMw>
 <xmx:56r_XHLEHQCM_AYxKvUnWahEquiHhbZixz8uPMdqiKEnTMvgNKGfxQ>
 <xmx:56r_XCI4M-cnGRMkU8B_7elfrrgzprcF3bdYNVHY8gckW2SNJF9J9w>
 <xmx:56r_XJ5OHbeiG0XDONTvalZygPNROguCNvQdlaZlYZRPnNruu4s_Og>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 772A138008A;
 Tue, 11 Jun 2019 09:21:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:17 +0900
Message-Id: <20190611132118.8378-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 11/12] ALSA: dice: update isochronous resources
	when starting packet streaming after bus-reset
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
 sound/firewire/dice/dice-stream.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 6bbf7421a53c..f61b99a72655 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -399,6 +399,7 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
  */
 int snd_dice_stream_start_duplex(struct snd_dice *dice)
 {
+	unsigned int generation = dice->rx_resources[0].generation;
 	struct reg_params tx_params, rx_params;
 	unsigned int i;
 	unsigned int rate;
@@ -421,6 +422,15 @@ int snd_dice_stream_start_duplex(struct snd_dice *dice)
 		}
 	}
 
+	if (generation != fw_parent_device(dice->unit)->card->generation) {
+		for (i = 0; i < MAX_STREAMS; ++i) {
+			if (i < tx_params.count)
+				fw_iso_resources_update(dice->tx_resources + i);
+			if (i < rx_params.count)
+				fw_iso_resources_update(dice->rx_resources + i);
+		}
+	}
+
 	// Check required streams are running or not.
 	err = snd_dice_transaction_get_rate(dice, &rate);
 	if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
