Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C92387460
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F5C16F1;
	Tue, 18 May 2021 10:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F5C16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327812;
	bh=K2QTJ7PWAmZz2pe8j3TlXJ5eUB6PUhhTPsN4IKE+lro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLgtJPlo2yVXLUPOZfHcNDavDCSB1WBXsMp5upu1thkO/poqU1KMP6tlzNkYWMe5S
	 HPVUjvC6ZP0y17SitROV8IMW3wojRMkZFR92pKbQKdgdtrj9LGRXQOJV2+T6ZhoPgT
	 eXCvlOW9PccDzEvuXd7mjWTs3avDTWm7AndJOH34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15575F804E0;
	Tue, 18 May 2021 10:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565EBF804AA; Tue, 18 May 2021 10:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29055F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29055F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="fV6Jez7i"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cFOPuDWz"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A5C25C0121;
 Tue, 18 May 2021 04:46:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 May 2021 04:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=z2h4iAd5kIIH1
 zEvRUhiZCQqxbScmElaaiMxsPYF/Pc=; b=fV6Jez7ibV/PGt1KQXi94GJrC/IfM
 6xyOi6Y80XBRt4fOOOlLqJqjECYZkvt7RoI6HDoC44ELy434+BL3LN9CrJbV5fsw
 vppfPmVQqFqzdb4DEBDvNznpHzAho3NMxxPP73gcwlvajs0n3FALcun+6vX/Ij+0
 pAbCcpLXl4hj9cv4DaJJ9QQWpEpgVYnPq8ISE4lziHq1nuYl5i6QMl5VXUbaXB6i
 PlVwEcaBFlNjRyglOThR0la2Nrm/JwlTfjoQ5Pt1f8/ZL53f/XS4H508X38eHP3O
 RzpiO60QWMG+4VxiyduOMXHNiocufQLoU5mXq4Yulr2AIMpZJ7EPgWEXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=z2h4iAd5kIIH1zEvRUhiZCQqxbScmElaaiMxsPYF/Pc=; b=cFOPuDWz
 jxREqgB1toxHcK+3QwdJZ//lbK0Itn2x9Md+qBXbuzQvxSqU0dB67DgSgU36q9g4
 VdrtBUC50C6ZGPj+JW4d8PhqV9PZorU6HNFiz8TvGNRsU6+25DvzasUynxxzP1ja
 mEaqfmAB6N9WsuiXRdOXLUPOfsY9zZqU274mIY5ggdXDu+n5be+3VpqUegc5eArt
 pIjH62YcJhZKi9TLCwLhWvhx5MtKL2s1e9ZoJMEUNRKrp+B5hXruK+XD4jooeLOD
 nfQyR9c1pwljElsDnEgu44d5mfhugBMPdOdIsHPYSlPl7/ZGDCzPRxlPuyDpILgN
 JEJDtKRQjBdy1A==
X-ME-Sender: <xms:zn6jYMkPtFC_YjSuiHb00SlPF1blMm_UvADDW70WeNQPZ1j1ynDszg>
 <xme:zn6jYL1qG0YNY81Ii5FkwHUFoSDPYwiy5r_OvD3fFc67O-6TeHieVmOcXNG4GjnfF
 hiMsI0T-ITCcgqA8gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:zn6jYKqYLr-iChW2Tz9S8OMy8c4yEavL5eXtJDwYJXOtV99VgBy9MA>
 <xmx:zn6jYIkom7G1fBrAEsrTNbEGzDI3ywCk-yRptNTwJCCYqS_GFAOwvQ>
 <xmx:zn6jYK0cC26W5yZn91BvSwqgW58PivAqTSDHtBQHG2NftGyYg1HTsg>
 <xmx:zn6jYP9gsmRYmqRcxNzsCWe019VWfyt-5uHGSktW6j6DKygovH-yqg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 03/11] ALSA: oxfw: code refactoring for existent device
 entry with specifier_id and version
Date: Tue, 18 May 2021 17:45:49 +0900
Message-Id: <20210518084557.102681-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
References: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
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

All of the devices known to be based on OXFW ASICs have the same layout
of configuration ROM, in which unit directory includes vendor, model,
specifier_id and version immediate values. Especially, the pair of
specifier_id and version is fixed to represent AV/C general protocol.

This commit refactors device entries to fulfil with these 4 elements.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 82 ++++++++++++--------------------------
 1 file changed, 25 insertions(+), 57 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 5490637d278a..7be999c61730 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -320,36 +320,24 @@ static const struct compat_info lacie_speakers = {
 	.model_name = "FireWire Speakers",
 };
 
+#define OXFW_DEV_ENTRY(vendor, model, data) \
+{ \
+	.match_flags  = IEEE1394_MATCH_VENDOR_ID | \
+			IEEE1394_MATCH_MODEL_ID | \
+			IEEE1394_MATCH_SPECIFIER_ID | \
+			IEEE1394_MATCH_VERSION, \
+	.vendor_id    = vendor, \
+	.model_id     = model, \
+	.specifier_id = SPECIFIER_1394TA, \
+	.version      = VERSION_AVC, \
+	.driver_data  = (kernel_ulong_t)data, \
+}
+
 static const struct ieee1394_device_id oxfw_id_table[] = {
-	{
-		.match_flags  = IEEE1394_MATCH_VENDOR_ID |
-				IEEE1394_MATCH_MODEL_ID |
-				IEEE1394_MATCH_SPECIFIER_ID |
-				IEEE1394_MATCH_VERSION,
-		.vendor_id    = VENDOR_GRIFFIN,
-		.model_id     = 0x00f970,
-		.specifier_id = SPECIFIER_1394TA,
-		.version      = VERSION_AVC,
-		.driver_data  = (kernel_ulong_t)&griffin_firewave,
-	},
-	{
-		.match_flags  = IEEE1394_MATCH_VENDOR_ID |
-				IEEE1394_MATCH_MODEL_ID |
-				IEEE1394_MATCH_SPECIFIER_ID |
-				IEEE1394_MATCH_VERSION,
-		.vendor_id    = VENDOR_LACIE,
-		.model_id     = 0x00f970,
-		.specifier_id = SPECIFIER_1394TA,
-		.version      = VERSION_AVC,
-		.driver_data  = (kernel_ulong_t)&lacie_speakers,
-	},
-	/* Behringer,F-Control Audio 202 */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= VENDOR_BEHRINGER,
-		.model_id	= 0x00fc22,
-	},
+	OXFW_DEV_ENTRY(VENDOR_GRIFFIN, 0x00f970, &griffin_firewave),
+	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
+	// Behringer,F-Control Audio 202.
+	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
 	/*
 	 * Any Mackie(Loud) models (name string/model id):
 	 *  Onyx-i series (former models):	0x081216
@@ -367,34 +355,14 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 		.specifier_id	= SPECIFIER_1394TA,
 		.version	= VERSION_AVC,
 	},
-	/* TASCAM, FireOne */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= VENDOR_TASCAM,
-		.model_id	= 0x800007,
-	},
-	/* Stanton, Stanton Controllers & Systems 1 Mixer (SCS.1m) */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= OUI_STANTON,
-		.model_id	= 0x001000,
-	},
-	/* Stanton, Stanton Controllers & Systems 1 Deck (SCS.1d) */
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= OUI_STANTON,
-		.model_id	= 0x002000,
-	},
-	// APOGEE, duet FireWire
-	{
-		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-				  IEEE1394_MATCH_MODEL_ID,
-		.vendor_id	= OUI_APOGEE,
-		.model_id	= 0x01dddd,
-	},
+	// TASCAM, FireOne.
+	OXFW_DEV_ENTRY(VENDOR_TASCAM, 0x800007, NULL),
+	// Stanton, Stanton Controllers & Systems 1 Mixer (SCS.1m).
+	OXFW_DEV_ENTRY(OUI_STANTON, 0x001000, NULL),
+	// Stanton, Stanton Controllers & Systems 1 Deck (SCS.1d).
+	OXFW_DEV_ENTRY(OUI_STANTON, 0x002000, NULL),
+	// APOGEE, duet FireWire.
+	OXFW_DEV_ENTRY(OUI_APOGEE, 0x01dddd, NULL),
 	{ }
 };
 MODULE_DEVICE_TABLE(ieee1394, oxfw_id_table);
-- 
2.27.0

