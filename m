Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBAC3805AF
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:57:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB181785;
	Fri, 14 May 2021 10:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB181785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620982672;
	bh=Scs6hNqc7vCIq5u6xNEyY9chW8xRM13WV2TiSaXzSFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faG2woIdiosFdcANjk2Nj5Hjna0mB4yoyuB5jJaTaNcUGNIj98TJAYpNvFWbsrVZG
	 iTyFOhsaXKKZtUdz8jS7Dgc/n4QVeocC864hyb6wpZ64jWnEm92GCQe4+MTndS/k6y
	 HDvqbHcUGY6rs06lSzqYTwULnT4m5Us/DCR6IWXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27226F80482;
	Fri, 14 May 2021 10:54:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC3CF80430; Fri, 14 May 2021 10:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1641CF800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1641CF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="z12EBTOe"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="B7+p1u4h"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AC18F5C016C;
 Fri, 14 May 2021 04:54:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 14 May 2021 04:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VMa8zmtT0qib8
 pZrc9gTED7LWQoqSfhkNYxLRgHzitY=; b=z12EBTOeK/1v+izzk0vSYh5lZobJ3
 x5ZIve1uc8oOm+HaK/zg61d0S87waihFe9EZBhp5KwQmLMrfaA89hXskNilYzOGJ
 GckHsVxgcnjcod+ajqA+3nlBFGFK9W6LEUUJMVcZzlcTn4VF5wjC37SN2o7/dx8h
 A2gNknXlf2aVVWdnxxNQy+y8u1UP+9ClFc3eSRcKgcfRIDoYiptaG7DtDNy0Ytia
 ilYHGlSIDmA++8U19lqVT8hw432AAJP2aoUVaqjU5HkfLo8LRSHJXnnA5jlpDxG1
 YMfsE9FcRnZer+cY0nAYNEnQJmTs2dqfOe2sGuthZsJkSUsKmhMnBEQ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VMa8zmtT0qib8pZrc9gTED7LWQoqSfhkNYxLRgHzitY=; b=B7+p1u4h
 7UKCJRR7TBtQpv/BPtzkNzXuJcHdtT1Yj0CIofhijSsp/rAiT7XLst16c/LnalGn
 g2RvdmAyjBx+o3D6Vomtq4QktHBwT6X7WGvpr61mVQ0ZOwP9Ch6/4jrrazZtUmUa
 Hu0clDnt4qW6NvtcsK9Q3/N6b9O/CJtHqnJ1oaJIpOiyFe8l+4CNXuu6iLkl+NDv
 zLQXR6rFy262GxnBd8WBkjSXh/t2yjXOwW6YcEwA1AhdUgVrz0p57dOuzeceO8Vx
 lNTv35gLzLvE0vn7SJ+fLwXIX2idzUFb27bnqoomyXAWcZqReZde887zh2ZsXow4
 UaZDPaXW7PcCXg==
X-ME-Sender: <xms:0jqeYP_vhNvhQ3wsondze81-PQIcLK9Ng3-6HEsQgJg0oNDRDW0bxQ>
 <xme:0jqeYLtlQ5BvCtW69zHv6dSw7HGIULdeab8CtkLQZkiDszAi6kSU3dqkfE8k074cr
 dpDtwwqOUjw4BsaLGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudeg
 rdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:0jqeYNCq3ONy0qfazU9WmEkJ2pWrIHL0vCSZAwjJ6S8tWu-MqGWt-Q>
 <xmx:0jqeYLcGD2PApDNB0CzrFIeXLqFd1wOr6lN9phgxyH7mAUEtul6s8w>
 <xmx:0jqeYEMKZsxT0f2A7d6DgVQUmEeLctlsrjXvKHD85GVq-HrtrFfihQ>
 <xmx:0zqeYOVR5nUc0OD9EiE-bpUrFJzUjbmM81AyFfYpJ7wpC5dMA8ooNg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 14 May 2021 04:54:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/7] ALSA: oxfw: add device entry for Loud Technologies Tapco
 Link.FireWire 4x6
Date: Fri, 14 May 2021 17:54:30 +0900
Message-Id: <20210514085435.92807-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
References: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
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

Loud Technologies Tapco Link.FireWire 4x6 is identified as the model
with OXFW970 ASIC.

This commit adds explicit entry for the model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index f01c8bfd71cc..21b30ca355c9 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -47,7 +47,6 @@ static bool detect_loud_models(struct fw_unit *unit)
 		"Onyx 1640i",
 		"d.Pro",
 		"Mackie Onyx Satellite",
-		"Tapco LINK.firewire 4x6",
 		"U.420"};
 	char model[32];
 	int err;
@@ -338,11 +337,12 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
 	// Behringer,F-Control Audio 202.
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
+	// Loud Technologies, Tapco Link.FireWire 4x6.
+	OXFW_DEV_ENTRY(VENDOR_LOUD, 0x000460, NULL),
 	/*
 	 * Any Mackie(Loud) models (name string/model id):
 	 *  Onyx-i series (former models):	0x081216
 	 *  Mackie Onyx Satellite:		0x00200f
-	 *  Tapco LINK.firewire 4x6:		0x000460
 	 *  d.4 pro:				Unknown
 	 *  U.420:				Unknown
 	 *  U.420d:				Unknown
-- 
2.27.0

