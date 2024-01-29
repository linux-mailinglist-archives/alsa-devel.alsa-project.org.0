Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24195840B75
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FC874C;
	Mon, 29 Jan 2024 17:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FC874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545830;
	bh=QaC6ZxGMOB76BF8Ik4we6yBUUBi60GdA8LYD3AzhYTw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P1+/kNGTQ0KN+vnpdUUl9Gg+AGrt7EW1jT8CRd8mDm6kc3Lex1Sce0q8XnXQrwm7Y
	 V7KUExLPVbBK1S2XbVZDkicV64OoE3nN8f+0o9qFwHfE7oX9iydhYPUtZA28qjfFq4
	 U7f1UboN6ZyHdKDvrP07NMKh7vQ0yatvPbE5uZQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59F62F805E2; Mon, 29 Jan 2024 17:28:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6589F806DA;
	Mon, 29 Jan 2024 17:28:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC651F805E3; Mon, 29 Jan 2024 17:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4B47F8056F
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B47F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=e/5Sab2R
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0B006968;
	Mon, 29 Jan 2024 10:27:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=bLJNG6gkApayI38QD45BecXR6JVKZDgCjFVj9m9yPic=; b=
	e/5Sab2RvmCXyFPTxAJ2AMD61/gWVWYiYHKxoNwUoltJs47yAD4XgQ04IiHUZHKl
	G4cor6AVOtwTn3Bc/HSsJNTQ73FOE+Hk0xokvNU/XhHt/YSD94DtpIKJLos7c08Z
	q2eUHb1ostiu76qPwikbBZEZ6T/HkysjVU+YQPca+O50j1db/l0ybh0+uh+yD7GL
	tFdrxlXRc1+aSrKfi6276aP/o5mT561nTWtItrSEz1ZqWKJS0fB+Oc3Hu9KMpv/m
	P9WdFSWe5mOIKMaLYs/yUfs8rJe8FvdBQxtEArdcMpWdhcvHtPBtFXOi1/3rHaek
	n803mOIyXt+UqEF3avf02g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:52 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:43 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:43 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 20C3A820247;
	Mon, 29 Jan 2024 16:27:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 05/18] ASoC: cs35l56: Don't add the same register patch
 multiple times
Date: Mon, 29 Jan 2024 16:27:24 +0000
Message-ID: <20240129162737.497-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: s8sURSFgOE4CLfHnbqAlu4g3Rk0f8_4V
X-Proofpoint-GUID: s8sURSFgOE4CLfHnbqAlu4g3Rk0f8_4V
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7CHRVQMII36HODVU56G4COZSCMQPHOKC
X-Message-ID-Hash: 7CHRVQMII36HODVU56G4COZSCMQPHOKC
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CHRVQMII36HODVU56G4COZSCMQPHOKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the call to cs35l56_set_patch() earlier in cs35l56_init() so
that it only adds the register patch on first-time initialization.

The call was after the post_soft_reset label, so every time this
function was run to re-initialize the hardware after a reset it would
call regmap_register_patch() and add the same reg_sequence again.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 898673b905b9 ("ASoC: cs35l56: Move shared data into a common data structure")
---
 sound/soc/codecs/cs35l56.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 491da77112c3..ea5d2b2eb82a 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1159,6 +1159,10 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (ret < 0)
 		return ret;
 
+	ret = cs35l56_set_patch(&cs35l56->base);
+	if (ret)
+		return ret;
+
 	/* Populate the DSP information with the revision and security state */
 	cs35l56->dsp.part = devm_kasprintf(cs35l56->base.dev, GFP_KERNEL, "cs35l56%s-%02x",
 					   cs35l56->base.secured ? "s" : "", cs35l56->base.rev);
@@ -1197,10 +1201,6 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (ret)
 		return ret;
 
-	ret = cs35l56_set_patch(&cs35l56->base);
-	if (ret)
-		return ret;
-
 	/* Registers could be dirty after soft reset or SoundWire enumeration */
 	regcache_sync(cs35l56->base.regmap);
 
-- 
2.39.2

