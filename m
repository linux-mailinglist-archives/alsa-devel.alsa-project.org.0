Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98550590
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 11:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B048166A;
	Mon, 24 Jun 2019 11:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B048166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561368133;
	bh=9opzxoeeHgH0waB9dYS3P3v2av5xFcO8GyFKzgY9SXg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UuL8pRrGdenOj8/59lPVCStO1P/lDqXn/asfEjXMKR2/8YJeA3l6jQVzb8gjcGotP
	 yS2aqHjzbX0S8GedyQsIfsRbC1fOhzWoKPL895nbXo8InmRkj3B9Pvvv010LGmtjbz
	 kYZ1IEZ8B9u5aK6Nsa519/K2DWUe1jEOCJf2SGM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B77DF896B6;
	Mon, 24 Jun 2019 11:20:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9655BF896B7; Mon, 24 Jun 2019 11:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7BC9F8071F
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 11:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7BC9F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dlpfFPs0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="szeNjWv+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4CC0F22254;
 Mon, 24 Jun 2019 05:20:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 24 Jun 2019 05:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=Mrd20YSLgDL8cnDH1t6SNZLXai
 3+R+AW2mxWFgD5eh0=; b=dlpfFPs0xj1Y7/tnsFUMnKY0ppCCa89bm+PLD5oGQR
 DJQQ6IN6uvRNuPuKoMFoDGD8c5kJ2OzNLxQTHBu4ij4CL8W1bVOSwCImcN8AphuL
 wGPuzIWsrv8LMjlQMVL4Z6mpYDy0F85EFOWBnbOXSFP3N2epnUsA3akRcNhpmgnS
 lw2eYPAPg5pM746s/b5W0iE9x0gJ+7DfmimEofPoRIv2Q5K/fiK6wLb8rM/zdepw
 Zp5Bh8lUaq3ClGDO/vmZ5pGkbTM1VVmDPZPoZP21nYc1A5TxB6uf1q5/NjkP9ytk
 hDuzFvGVGqr5nPtvvdmpxBz/JNcgIUtv4UE3+QpzuK7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Mrd20YSLgDL8cnDH1
 t6SNZLXai3+R+AW2mxWFgD5eh0=; b=szeNjWv+8YvDsvM4VJ/yPTuUajrWhMDf9
 ljw2YBdBNsKNLeZOSKiTjMZHxOsJgvr/CwwV1easF3AiPLLvIf9/b0uF9ZfBcTgd
 6Yz6Klh2MxVmT7ehA9Xfzik6t9ZnBsILXe8y2jZXr9FkB+MDRn5tuB7wT6s6XDFX
 XHWRLK9mqLhLwhNYZet1S/G6tl1VLFtayiSFRXxKgDNlRTjQBMWUH57SfY/8yAMH
 231r/j5IqzIijda1vzH2iOu0Hkf0fh6A5m4Sy0H2mjwYVc1GU9jNTQCMVgrUkkZD
 ySL1QMjTTsyaLaPW6tVy+djYlQu11g5pAOMuTSALp5Gt+XrVdsFUw==
X-ME-Sender: <xms:1JUQXbY8A29eAevaI9PJD20SCp9NdfhJN6TgVEjEBwsoRmZJC22IEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:1JUQXSzd4vgbMmh1MSf-XqyNEiDeIXeL0524Y9QbPyVmVnfHqEamuw>
 <xmx:1JUQXaDpa9Q3BRGI_C6m8rZmWK8CFTJPflThLSoHkxSmbNrOulO9_g>
 <xmx:1JUQXXEKxiRo9Ja-1cPOhBk5RiepIqrG8B78nVUQlteNeZbSlZEJYw>
 <xmx:1ZUQXcU-qBgdptLFiX0u8wl16frff3uZSPqmfq1wzuzZDPaQO9q-Pw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF31F380079;
 Mon, 24 Jun 2019 05:20:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 24 Jun 2019 18:20:15 +0900
Message-Id: <20190624092015.8290-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2] Revert "ALSA: firewire-lib: fix inverted
	node IDs for amdtp_packet events"
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

This reverts commit e703965a129cdd72ff74e248f8fbf0d617844527.

When creating this patch, I compared the value of src field to the
value of first byte of cip_header field (SID) in tracing event.
But in this test I used a device which has a quirk to transfer
isochronous packet with invalid SID. The original change is valid.

Fixes: e703965a129c ("ALSA: firewire-lib: fix inverted node IDs for amdtp_packet events")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream-trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream-trace.h b/sound/firewire/amdtp-stream-trace.h
index 5fe0920f04e5..ab708857979f 100644
--- a/sound/firewire/amdtp-stream-trace.h
+++ b/sound/firewire/amdtp-stream-trace.h
@@ -35,11 +35,11 @@ TRACE_EVENT(amdtp_packet,
 		__entry->cycle = cycles % CYCLES_PER_SECOND;
 		__entry->channel = s->context->channel;
 		if (s->direction == AMDTP_IN_STREAM) {
-			__entry->src = fw_parent_device(s->unit)->card->node_id;
-			__entry->dest = fw_parent_device(s->unit)->node_id;
-		} else {
 			__entry->src = fw_parent_device(s->unit)->node_id;
 			__entry->dest = fw_parent_device(s->unit)->card->node_id;
+		} else {
+			__entry->src = fw_parent_device(s->unit)->card->node_id;
+			__entry->dest = fw_parent_device(s->unit)->node_id;
 		}
 		if (cip_header) {
 			memcpy(__get_dynamic_array(cip_header), cip_header,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
