Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7338167C
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:14:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86031748;
	Sat, 15 May 2021 09:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86031748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062863;
	bh=KLzOh5mkhUBfN+RzD99d17MfQxGzHdmxNaHuPOR3PzY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fO4rFsSIPdrc5GYwFeTqGdkmmHUtn+MM8Pv0AuptO9sAE53uTBm6MIlulC4s/QEtH
	 H7n/QztJvdgGfS0bUP8WSbJLPIWFLzZmU0t4cWIM9sqcCYlDsfS39oRG7V1NPipp+Y
	 01SgcUBgTOUXysn1djZYiN7IrKxG8x8LBI86ti5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B116F804AD;
	Sat, 15 May 2021 09:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748F3F8028D; Sat, 15 May 2021 09:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A5FBF80114
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A5FBF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0g7d7S4s"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IqE/3tpH"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D908B5C012A;
 Sat, 15 May 2021 03:11:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 15 May 2021 03:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=snVjiQ+JiUZKn
 0f6kKcYcN35k6cxRPHFAY/KaCgQYsY=; b=0g7d7S4sSdJ/8mOgDK7oTxJyH32jV
 GzYjIM3XLIPTuYvlOD/u4FzwMH1utRpDqESyc8yv8WU7lh83466TsT/t+/DbPFXp
 eeWBhxJFZi49mEkWsTsmef+1fHXiIVrleu1USoKnpu+GJ/waHNT91OkQnq7lrALy
 f8+F1XJkB+/aAyd5FGy0bfvoZoLYdzYOmGX6QmOfF054WRjbcC0tvwqGNkzUyRFn
 +2cbSfzhAy61RPN21uUsm3mT08bvAIR3KD9twHGzjC49yub3rZZD5CnqZa65NZuV
 a3u1UMVxrmfrnO/th6tMujBKrsIE3At1TVGyKfgLvWCP0qO+4SaeouQdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=snVjiQ+JiUZKn0f6kKcYcN35k6cxRPHFAY/KaCgQYsY=; b=IqE/3tpH
 ADpF+j28m5gom9GDykLN1s/VhPv2681/4LWpftegD7AoC5npeewZkXns1pdgDIXU
 YzdwbcdOl8gJjz/oiu9bo8+EikoQQLrSxJdR1vJgW8Eh71PZtZUUMsQQuiTnlMUE
 xsJoq4L7gQcP2UifD3YBWZZ9F2Rt/Bf5kLK8L3l09uQgDKOlJzaonQ1XYIvi5epS
 WbsmSjXDvklWRu/AGsi+FiupjX4auIt1QEesetr4ryBvOllKaSH1Kbavq+0PpJdK
 9RuuflKqURRou32yNiw6wnUbPEFLEu0CvSY3IIgGZKP/y/AdDsAcgFJxghkwE7ze
 gKCqTKtR5rzeWQ==
X-ME-Sender: <xms:GnSfYA_cKNybZsqP4aGEhnYEEA1rdN0hPpkWLX6TN7VHK9d3XRVM7Q>
 <xme:GnSfYItI5ZpayIvbZW-VGpxQJDtJ2b31HGlKdhpnhpVpAKdh_6a7PmKYNsF98KFCL
 VE7dB-aZGCvCUwk0a0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:GnSfYGAdUVQd__r1maWiklTt_i_3g4EX9cNRhqw8J_dkOR5Cy0fjWQ>
 <xmx:GnSfYAcuUWBLEHPIb0R9aUoCu3GdaeqFrCBjnibFuNawfHQdP_fnWg>
 <xmx:GnSfYFOnoq5WWKcRqUBCPuqL2ZJNsY1YXeqLW5tljydRV8zpkRxPiA>
 <xmx:GnSfYHWG4EbVFhXQUExdhdsGjoUE_wPupQfmKPGpz4sHVzvBrVi78A>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 04/10] ALSA: oxfw: add explicit device entry for Loud
 Technologies Tapco Link.FireWire 4x6
Date: Sat, 15 May 2021 16:11:06 +0900
Message-Id: <20210515071112.101535-5-o-takashi@sakamocchi.jp>
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

Loud Technologies Tapco Link.FireWire 4x6 is identified as the model
with OXFW970 ASIC.

This commit adds explicit entry for the model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 2af72951ebf8..998f0da6fd5b 100644
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
@@ -338,12 +337,13 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
 	// Behringer,F-Control Audio 202.
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
+	// Loud Technologies, Tapco Link.FireWire 4x6.
+	OXFW_DEV_ENTRY(VENDOR_LOUD, 0x000460, NULL),
 	/*
 	 * Any Mackie(Loud) models (name string/model id):
 	 *  Onyx-i series (former models):	0x081216
 	 *  Onyx 1640i:				0x001640
 	 *  Mackie Onyx Satellite:		0x00200f
-	 *  Tapco LINK.firewire 4x6:		0x000460
 	 *  d.2 pro/d.4 pro (built-in card):	Unknown
 	 *  U.420:				Unknown
 	 *  U.420d:				Unknown
-- 
2.27.0

