Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497E38167D
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889BF16E1;
	Sat, 15 May 2021 09:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889BF16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062886;
	bh=ecXGP7UvcqAeddWVujTRhp5wXlYTu+1U5pTQO+kYzP0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmvTRkqNcNl4GOiHp5xXmEGCcwe8qi/M1U/aZsQbK1CNR7x3IsnbWUaCMNnMPGgk7
	 iE7fkbBNNykkemkpHzLN9WIJ7hrbnbYJW2K2WSGkNTv/HzMZYH9mmpo1L3oHtBpI1w
	 ucBA8Rb9PSq4elLN7LPPjIwOQVYAgX6np8hSKX+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77B3DF804B2;
	Sat, 15 May 2021 09:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E294F804AC; Sat, 15 May 2021 09:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9E36F801D5
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E36F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="f1d9L32p"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="a0rcNB2v"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C28B5C0117;
 Sat, 15 May 2021 03:11:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 May 2021 03:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=70ipNRkwOuqh7
 Y/8xTJRyXNS0tI5YWloNgWLpub/Vho=; b=f1d9L32pgfucbMU3blzFnVf52IRsW
 C0TJ7yHV+mGCp2MA4ABW+EgdKvjLw6xK70L4iF1tYCoOVXgaXCVHJKSGwusXQJ6I
 o8VV/oCeFqhmQBM9arQCOGSC2A8zxq5rGVc8/UihuutDgcgWXw71UefkiIlpKN06
 hvRmkq8+gkT32LN82G20uvwtE6DCaIQpBF83pV7qtPRzS/T4YPtkgpQMo2908Jzk
 iAs58R6qzCRHZIUjRyE0DCaRlVlG9qffGrR7jdCBEKk/VS3CPPmFgC0aI3OS3yZT
 ssoJJ9PByr7+Gh6aUhIMCQ4B2Ew/ZlFY4USdv6KFMCSICid1TOUiLlx9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=70ipNRkwOuqh7Y/8xTJRyXNS0tI5YWloNgWLpub/Vho=; b=a0rcNB2v
 N9zLXwIZQLzG2YczZz+XyhrjXpPwEkeLTT7TBAo6HGBclP1+xDI94lGyicnuQLmE
 gJO+5N5g4BJJINDrikmvhw5s3GoKrnETmp5GkTkEQvtFvI1McQkQLptKA9dvPeMu
 +V3k6tcDA4L01sekQ8trXYqMrQ7dt+rSxeTNbvJe6DFj00nCjAWjzRhchpizCXTs
 xsU+tgtsru4dpcPbakK8TVGzOCQ1NSteFtk7sq8+zjFwxNbPOZe5OU0ftQX+wO7H
 RdjGUewk0IDxDxuaKoty8/YI2hrKF1Lu5HWODqshVBOnExFFvCHIss1Ye4+2AzuA
 zR0ClufCMTXD8Q==
X-ME-Sender: <xms:HHSfYLLsH5CLOuVi_TFuPOW7StBPhJtyztvOMSMRkokZFqWEVD6byw>
 <xme:HHSfYPLPTeSveQS_NVn7dl8vTkLkeY-RlLzubJ1KSGvydO0G_O9FNUOUSZ9PI4G_K
 q9G1FSziOlnebbxoq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:HHSfYDtObaQZAX0zxI3MlugczVI4xCKvWqtFbgS8gAm0MUCFfTR_DQ>
 <xmx:HHSfYEa9GsT2yPEo9Hd4Rq9cOcl3eZ0UKoOQk_p5PJyKQqTDbC_zpw>
 <xmx:HHSfYCY_O_KrTIClT3o700Gd_qLv4nBoxvzPD7SaZvH6MSfG_T76Sg>
 <xmx:HHSfYLDXgTFmwkjdHJBACgwDbIo8ixSzeSsgMI2r8XLbNo8mXaXl7g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 05/10] ALSA: oxfw: add explicit device entry for Loud
 Technologies Mackie Onyx Sattelite
Date: Sat, 15 May 2021 16:11:07 +0900
Message-Id: <20210515071112.101535-6-o-takashi@sakamocchi.jp>
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

Loud Technologies Mackie Onyx Satellite is identified as the model with
OXFW970 ASIC.

This commit adds explicit entry for the model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 998f0da6fd5b..e851149c5280 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -46,7 +46,6 @@ static bool detect_loud_models(struct fw_unit *unit)
 		"Onyx-i",
 		"Onyx 1640i",
 		"d.Pro",
-		"Mackie Onyx Satellite",
 		"U.420"};
 	char model[32];
 	int err;
@@ -339,15 +338,14 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
 	// Loud Technologies, Tapco Link.FireWire 4x6.
 	OXFW_DEV_ENTRY(VENDOR_LOUD, 0x000460, NULL),
-	/*
-	 * Any Mackie(Loud) models (name string/model id):
-	 *  Onyx-i series (former models):	0x081216
-	 *  Onyx 1640i:				0x001640
-	 *  Mackie Onyx Satellite:		0x00200f
-	 *  d.2 pro/d.4 pro (built-in card):	Unknown
-	 *  U.420:				Unknown
-	 *  U.420d:				Unknown
-	 */
+	// Loud Technologies, Mackie Onyx Satellite.
+	OXFW_DEV_ENTRY(VENDOR_LOUD, MODEL_SATELLITE, NULL),
+	// Any Mackie(Loud) models (name string/model id):
+	//  Onyx-i series (former models):	0x081216
+	//  Onyx 1640i:				0x001640
+	//  d.2 pro/d.4 pro (built-in card):	Unknown
+	//  U.420:				Unknown
+	//  U.420d:				Unknown
 	{
 		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
 				  IEEE1394_MATCH_SPECIFIER_ID |
-- 
2.27.0

