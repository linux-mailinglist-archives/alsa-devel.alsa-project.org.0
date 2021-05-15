Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5A381684
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3011714;
	Sat, 15 May 2021 09:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3011714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062970;
	bh=1ZXdm8pTtC/nG10bdRLb3qC/4Zh/lLgPlX7pixpghCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAUbqyBLsGo+9EYUucAex/NWAvOCR5gr5e60m8+vCkHtAbhnJtuXvRPQNZq4ePwhS
	 MIzjd7g54b8Pu4Pr8bWhxkNae60ffkmoq1Tb8WDFFR6VlV3ZltNCE50y2tHFDjSzup
	 xUsawinqN38RyVJV2LFbHGw16ds4z/pd2zagvhtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B59B4F804EB;
	Sat, 15 May 2021 09:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B0CF804AB; Sat, 15 May 2021 09:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC09AF80156
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC09AF80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LQB88udq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bHx8zA2u"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16B6D5C012A;
 Sat, 15 May 2021 03:11:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 15 May 2021 03:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Jy2LW2cr6vrv+
 89UR16uSzZjaYfzKGHKtULxRNu6xAw=; b=LQB88udqgCq5WtWCrv1sq6qG7APeE
 /nI4l1pDYEd/Hftm1DEihbtnm3h3sD5k6gL1u+cJc0L2FwGjngMOMuRFHx+zlFQm
 T9e9dFUsDUDdr27xoX08Avz7aMNqlS2O5iq25YF25vWBfhl8t3vbcph0404xPxdr
 k7tYlCqXvVOn+CHmbx2SPmmbb8gQ2hY/gFMRA/pi70gQn27VatXuQikql0WMvpVw
 EUx5A0ii+5V9B3yaW/MGbTGfG2qTSyd6jpRkd35Yfb5PTZg6HTuN8B5Q8Perj7XA
 idS2GsQjcaKn4JTxq8WcopNqLqHw1PLia0kRjRwYIcVT2v/EyCss9prJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Jy2LW2cr6vrv+89UR16uSzZjaYfzKGHKtULxRNu6xAw=; b=bHx8zA2u
 CgPbk/bdBisUYUbH5aRcymjNVeCrJpPp8g8dEnAHLB7NkYW2KqK6mls6Z6OvaCMc
 jtQsbwWmXoSD+ArcRNKBFfjT1F7EylS6vmuPJkntPAVAKMjdZpYxN+pqftDgrR/D
 w+suPcwRzjPURpXyGgn/KehOsp/VErVuiJ6p8xJttzZqWb/ZII1RMSdXJqtfpBjy
 b9uuMy7YXOYBRxVdro3d06wKDz1ViaUZOQ60a9+f1iTvShestXInPTUXzWXBdQ1b
 oBLW/2Kyu4M31Gb5ppgkqPrenRiHIXmVRgP9tlcyw4/Lp9L96e1UrYYxhxg/cKzZ
 vsYXaJAN3j7VcQ==
X-ME-Sender: <xms:H3SfYK26rBXGe4OywSVr81OoykMsx0dBRCwSJsNqBB5cHvxGNx1iUw>
 <xme:H3SfYNEFtc-Rrf8b1QMfbmABGhBMM9BOzJq4MI63O5G_tiexXGkNFf_lARECSB_Xs
 YtOwaIerOhwAq7bXR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:H3SfYC6YWaXzlMocSJRF9k6MoIU54JnqJ0zqoo95UEdvIMuwRFmTxg>
 <xmx:H3SfYL2LKlnXUpBHhZL5Q3ZMTIJe4zEJYrweQlh_1qYhGtoVIo9tnw>
 <xmx:H3SfYNERKSXxZCHowpkHHPXvRqUq3F3CAcKLDa8QgRtTNC8S7xGe5w>
 <xmx:IHSfYANNBK91zXwdHAn1R6_4Euqh4PWfnhGnDwARVn56xxyetZoVIw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 08/10] ALSA: firewire-lib: code refactoring for jumbo
 payload quirk
Date: Sat, 15 May 2021 16:11:10 +0900
Message-Id: <20210515071112.101535-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
References: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A new macro is added to describe the maximum number of cycles to accept
cycle skip by jumbo payload quirk.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e0faa6601966..d78f86e12e76 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -64,6 +64,11 @@
 #define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
+// The initial firmware of OXFW970 can postpone transmission of packet during finishing
+// asynchronous transaction. This module accepts 5 cycles to skip as maximum to avoid buffer
+// overrun. Actual device can skip more, then this module stops the packet streaming.
+#define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES	5
+
 static void pcm_period_work(struct work_struct *work);
 
 /**
@@ -316,7 +321,7 @@ unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s)
 	unsigned int cip_header_size = 0;
 
 	if (s->flags & CIP_JUMBO_PAYLOAD)
-		multiplier = 5;
+		multiplier = IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES;
 	if (!(s->flags & CIP_NO_HEADER))
 		cip_header_size = sizeof(__be32) * 2;
 
-- 
2.27.0

