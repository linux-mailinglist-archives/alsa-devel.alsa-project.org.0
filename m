Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD43381676
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3F81737;
	Sat, 15 May 2021 09:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3F81737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062793;
	bh=K2QTJ7PWAmZz2pe8j3TlXJ5eUB6PUhhTPsN4IKE+lro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9QMAzPdA4tvHwosYzLo14ktUg4sbCv7wpac6SbzGKjDnhhhI9Gan+GpHYzAuyKX1
	 DupMecL7eEuBDAE4iwxMp5KTsPHpfRmkjfHHS40ebY04DumQwrbzcp/+wnX5GmZC/Q
	 I9JhlNQnR5SwMBnaAWMXv64IKjHpZZGh2/fV/v0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D50DF804AA;
	Sat, 15 May 2021 09:11:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C8C5F80425; Sat, 15 May 2021 09:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E73D5F80156
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E73D5F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="3PA0nasj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mtf9gTOS"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 28D455C0117;
 Sat, 15 May 2021 03:11:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 15 May 2021 03:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=z2h4iAd5kIIH1
 zEvRUhiZCQqxbScmElaaiMxsPYF/Pc=; b=3PA0nasjWm1WUGuGlNEYahER0IyRG
 q9hnNHngwq8Sh+3eNq5TgkIdBWvsR64r2O2LxyrHZnd27KOkMLa4ckFEQThPrbIo
 vWT1EPra+RxOAN67mycUJ651iUbaXJq6GS/Lb+ni/6EVVf3iQTGLCPs1UZCD5nK2
 o+NWoTCcFgqZcXpOLA2luh0rcvafMAI1YTugBZ+BeNsjjIyOPdSibjScfHSsGhEo
 8xQPJgGkCHq6zAkLBvT+wcFWcCq80WL12yCo3N1QNKp1qHs/OU2C0oUBiiV3a6UW
 96EE3xthkXH+ymDV6kc/bn2tzHbQUszXILYqCVyAeXlQvBW7cfLZxCjRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=z2h4iAd5kIIH1zEvRUhiZCQqxbScmElaaiMxsPYF/Pc=; b=mtf9gTOS
 NvFdLktoWxaRCG4NDoVWlJwKlvIJ3GgX/6mk6ERrDI++2ZNTCfk41rrXJDb6oXoh
 C85N8hHHt1I4DFeo1h+fj5CNY4vpR1vF6LOxX9eChb41Xpa7TEdoZLT73BmKTGUA
 tXaw3LEYA7PpuFjtAzqT2wpMl1ARUkUFu5WQE+oRLI4BhpZ9hV8oPS0aLQQimpsM
 mq2QKeUcnAroZsiFkgvUdK2LvGL0rAmJH6bnTei7HLeVceP5t1O7TD3oCl+czJNL
 KS9+Hg3ev+V7dtK/f90pADfr4y2BmWn9DQ9JhsTmv5sDSVFwMAsHQ8nKbS1KWykv
 0Tcs7STWatUYtg==
X-ME-Sender: <xms:GHSfYANy4Jn7AmeG4oqIbt2lwksqSnR46FKnQMhXl44tqeY55Pg6HQ>
 <xme:GHSfYG9ZuSdF8WDToKRmgw0DzvzvK4Me3OiWUi1J448UL1XofRUNMNDjIvO6l8ikE
 SQMCj6WxAl6v-e5pYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:GHSfYHQm-RsWkgG7XkLu_qmsKUgcCPRrD-webe6ofUxJ3I-at0wSEg>
 <xmx:GHSfYIsDdRFZ4OYtCklIyIWUmvsp9r-gExDwS9FQAwi70akdztJKtQ>
 <xmx:GHSfYIcoaZqOvBHMpzgFJ52Mci_HdPGvB8P9Aq6Zd8oUxb_qNQG4pQ>
 <xmx:GHSfYAkeER0vwen2toc7WexL-LsqKj-cOTTrsyGDjR_wwPULoKux1A>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:19 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 02/10] ALSA: oxfw: code refactoring for existent device
 entry with specifier_id and version
Date: Sat, 15 May 2021 16:11:04 +0900
Message-Id: <20210515071112.101535-3-o-takashi@sakamocchi.jp>
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

