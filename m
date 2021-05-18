Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156EC387001
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CAE01694;
	Tue, 18 May 2021 04:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CAE01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621306057;
	bh=KLzOh5mkhUBfN+RzD99d17MfQxGzHdmxNaHuPOR3PzY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrGn7SW7dxHOZ3JM57/hNwfM8G8l2wkXi7C/T0n2/uxHX11aV3tUBXQ3pHNSMjSRA
	 7gdM0AwMOtVwYkyySaqPdlo/gmjjpiOaLtQtZ4up+Al0juw9J5qQzZY59YgbQkKGNN
	 bc6bvIGaSIIS7C8yWdamXbqVrIzgdbaBPZpR/Fa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCABF8042F;
	Tue, 18 May 2021 04:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E849F80217; Tue, 18 May 2021 04:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76BCEF80257
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76BCEF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Y8w/qDq/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="L7AG4NxR"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A1C0E5C0197;
 Mon, 17 May 2021 22:43:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 17 May 2021 22:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=snVjiQ+JiUZKn
 0f6kKcYcN35k6cxRPHFAY/KaCgQYsY=; b=Y8w/qDq/rEHVEJ4CQGL6QCbGb8WPK
 T2/MQrqtM2/kALnLIP21dNQKD+wSTFylOnz0/4KqGx0SBzv6qnN7ta2kZ+MXIKc3
 HfQuRqpaKRi5c4vEVExpbjLfMnkuM2scjGKiV4YeJt3NK+MjleuJWEfw+h+a9vo+
 TUVgYt/pC+NigCS7UFLqKHEpQNIDcWkSEhvk86yz4pUJfejOtUGKJXcu+bP7XSRL
 vH9znYkDfzwaqOwdqHInZYSxGdf4TuT2usOahPNnC2CUXDJsXaB3JkUkbYe4Ze6o
 pXcFAy47BTytM8XLyVW461Jka+IiovB+Tn0LoXs06NDc1eihSEKMLAXBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=snVjiQ+JiUZKn0f6kKcYcN35k6cxRPHFAY/KaCgQYsY=; b=L7AG4NxR
 h8N2U3tQlM3NtQFLRe8daAG1MfYP1iryzCyahQAplT2zHcYHkv1+WGx+xxn6PR50
 hwfenoNGfk9swWrtwSwtIORL7y3+zGEwX5wEvvfznBRgw4SMWWjKou3XnEjKQPta
 GgifZEDqvtCowk9nEfzbth9rsQUsOMpaJ/SmSbh4fIZc/rvwKrKcrinFeJIztSBS
 SnpXuICsuRl+ly2Sfqu3vVLtjfsCXIBDAcVQXis0uZo3t7fl1zOdq73B3cvGiqTh
 1/kUmuC2J/9KFAOE0YfJmGIJVuI2dAWkTe4TboeTk0zKpaW/zaKMLZ9pzR9Vjr4a
 B/qxYHnU3BdBfg==
X-ME-Sender: <xms:2imjYGhzWTcKtzZNewfgiD1sJYV9G01pGXm6Kgup4GQI_9zBlBCnOg>
 <xme:2imjYHCvm8qeW3C65LHCnG1PLWpMgQqsKJm6qyaOVxuYgv_XPgtuCTiUrEPrJlwt4
 8pLTQRvIYhrGsmvNVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2imjYOGqiPajaG9M_apbAj6IZO1-mA6h7Yo7uoKLSyTed6XfA22kFA>
 <xmx:2imjYPRTBqz5XQIX3qO7bPUBfZuv8G6AWqcQqXNbbJJAzf8CFzeVrg>
 <xmx:2imjYDy7UifTEBscwL6YHIYXPGxMHM-qS1ME053UXBnLuYqnjpmrHQ>
 <xmx:2imjYBbjkUPlJrTmIyDvDQK9zGKJJ2V4-jE8Uf5Z8MhkRIfUKt_WYA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 05/11] ALSA: oxfw: add explicit device entry for Loud
 Technologies Tapco Link.FireWire 4x6
Date: Tue, 18 May 2021 11:43:20 +0900
Message-Id: <20210518024326.67576-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
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

