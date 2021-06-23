Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFD3B154D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 10:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D05166C;
	Wed, 23 Jun 2021 10:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D05166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624435309;
	bh=1icCz1B8NfdXKnEWXzMnEaCf8gjb1sc0KLk11t41ppg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALVUWDJ61R+092l/Uq5e3kx78+9sSPQ+7YanQX7qf0hFMCMj/0RLHrQHbAWRpKJAi
	 50DpWUYdGeZrM5DOVwCjA6x8YRyhK3NZRyOg/V3EGfVemm4xsowkiZY4s3fZQz6Rew
	 Kh7EOWF3OZsOYk57zbfdfsoHHuDMfoazdg5cFORQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F0DF804E0;
	Wed, 23 Jun 2021 10:00:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 463B3F8016B; Wed, 23 Jun 2021 10:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D41F800E1
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 09:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D41F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kb+UZcym"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sTI6Sw+j"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1246410B6;
 Wed, 23 Jun 2021 03:59:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 23 Jun 2021 03:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=m0PtSTI8J237a
 bH0tBrNIVD2Ab3bfTcN1b+rGhFmslo=; b=kb+UZcymkdTSUGfqNxYucSoDHGJ7N
 i+ZBGVybjs9Ca5v1duoOGltrrGmf+RrW9iFoJXDJddiEQehcN/wVBh577VkfRtv+
 bO49fCrl9ANuiM+AxJc9PgoQdwM7bBGMj2P1A4FV3oAB/jjOPbyVH9HD3jFXgxyL
 55PXmyYi+zOguZ4NIJKAZ4fdRklXuS2Dp9qWneEX8HHsuBTIHfiDjpaGumjv1XUR
 vqoYpyitZeHzyjCoevOOf+4FTsKISaaPMQA/TptJg5wlPSInlXFop6cI0CEQTiKq
 nfpn+vo6zO5VUwqxUh04UP1ybEY6c2yRZLJ5D/Pq00lMCsdSLtdx/x5Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=m0PtSTI8J237abH0tBrNIVD2Ab3bfTcN1b+rGhFmslo=; b=sTI6Sw+j
 m/8Bl5cZx1BgA7hfNCYKwzutT4fMzde6QDqKcKcXLHKGnpAUbEN2HnPFLglqmV8s
 0aWb922c3MUklnCtHxTPZOS3OF9wk0XbNvoksbylDgwKQfTSfCQuL6h8LN6gEQLJ
 9juzS88Km0edQLVfA+uJ08w3n2hdPiazbQEFtSXXiCo349s9EETWulb3FNE56iOs
 tDh5iNIuFf1d3xqGfjvGmdnmnlUbUgIdkvp/HJBQ7Mr0FIruBJTS/qmBkCf/6Y2u
 8XwfAcyKfeUW3iyDj6HAwwBReZ58TNfx8MmGzSkgzJ2TMxEAOLHm88b1avVkPx1h
 xohlk8/qYhXMHw==
X-ME-Sender: <xms:9-nSYE3_i2Kx8TVx0Yv7z-M-WtmU-ewrNnRqXGy5lpMVPIoBf_ntbA>
 <xme:9-nSYPH97CXPJCv3J2S3ilh9aWCnJwjtpwdXrOD_5sQYDCD65PlLpGq3E4ZyQsTy9
 Kuc-pJamqak8Lr-x00>
X-ME-Received: <xmr:9-nSYM79miE0mEeY2ibjR1wwOs_TAvL_GYdgMGpQZmRs2d4WGZ79G7PmzoREyhGLLMoUVRKYh9lPAnQRW8Yk5xGqKZ6JW8O2KJ4_on07kBEwFeQOw5vF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:9-nSYN2Q0HHznakTaLyQjHGfpWV0YuWs_IRN5yECYhf1hVtp3cnQqA>
 <xmx:9-nSYHEA9EXRQfNmMUtZYRVGbyN-FRBYoUJtOpP2ea9c1ZtTl3n6KQ>
 <xmx:9-nSYG9SXOigvORWOIirMmdSG0Z1NJ2uH7Ff3KJe54_ftbS7UpKNcw>
 <xmx:9-nSYNP6I4TYAlMmd6vZ-i7DsMKPpOl6lg1ki5Yr4jiHR_vQMxsAiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 03:59:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/9] ALSA: firewire-motu: code refactoring for detection of
 clock source in v2 protocol
Date: Wed, 23 Jun 2021 16:59:34 +0900
Message-Id: <20210623075941.72562-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
References: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
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

Current implementation of driver has two similar helper functions for
source detection of sampling clock. This commit merges them as a code
refactoring.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 68 ++++++++------------------
 1 file changed, 21 insertions(+), 47 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index f0a0ecad4d74..7b69a8ef6b3d 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -78,10 +78,10 @@ int snd_motu_protocol_v2_set_clock_rate(struct snd_motu *motu,
 					  sizeof(reg));
 }
 
-static int detect_clock_source_optical_model(struct snd_motu *motu, u32 data,
-					     enum snd_motu_clock_source *src)
+static int get_clock_source(struct snd_motu *motu, u32 data,
+			    enum snd_motu_clock_source *src)
 {
-	switch (data) {
+	switch (data & V2_CLOCK_SRC_MASK) {
 	case 0:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
 		break;
@@ -90,17 +90,26 @@ static int detect_clock_source_optical_model(struct snd_motu *motu, u32 data,
 		break;
 	case 2:
 	{
-		__be32 reg;
+		bool support_iec60958_on_opt = (motu->spec == &snd_motu_spec_828mk2 ||
+						motu->spec == &snd_motu_spec_traveler);
 
-		// To check the configuration of optical interface.
-		int err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET, &reg, sizeof(reg));
-		if (err < 0)
-			return err;
-
-		if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) == V2_OPT_IFACE_MODE_SPDIF)
-			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
-		else
+		if (!support_iec60958_on_opt) {
 			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
+		} else {
+			__be32 reg;
+
+			// To check the configuration of optical interface.
+			int err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET, &reg,
+							    sizeof(reg));
+			if (err < 0)
+				return err;
+
+			if (((data & V2_OPT_IN_IFACE_MASK) >> V2_OPT_IN_IFACE_SHIFT) ==
+			    V2_OPT_IFACE_MODE_SPDIF)
+				*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
+			else
+				*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
+		}
 		break;
 	}
 	case 3:
@@ -120,41 +129,6 @@ static int detect_clock_source_optical_model(struct snd_motu *motu, u32 data,
 	return 0;
 }
 
-static int v2_detect_clock_source(struct snd_motu *motu, u32 data,
-				  enum snd_motu_clock_source *src)
-{
-	switch (data) {
-	case 0:
-		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
-		break;
-	case 2:
-		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
-		break;
-	case 3:
-		*src = SND_MOTU_CLOCK_SOURCE_SPH;
-		break;
-	case 4:
-		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
-		break;
-	default:
-		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
-		break;
-	}
-
-	return 0;
-}
-
-static int get_clock_source(struct snd_motu *motu, u32 data,
-			    enum snd_motu_clock_source *src)
-{
-	data &= V2_CLOCK_SRC_MASK;
-	if (motu->spec == &snd_motu_spec_828mk2 ||
-	    motu->spec == &snd_motu_spec_traveler)
-		return detect_clock_source_optical_model(motu, data, src);
-	else
-		return v2_detect_clock_source(motu, data, src);
-}
-
 int snd_motu_protocol_v2_get_clock_source(struct snd_motu *motu,
 					  enum snd_motu_clock_source *src)
 {
-- 
2.30.2

