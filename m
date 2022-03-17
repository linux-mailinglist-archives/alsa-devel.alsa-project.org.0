Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C662B4DC2F2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 10:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74EC71867;
	Thu, 17 Mar 2022 10:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74EC71867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647509748;
	bh=DL0lpENJdRutHhQh8sPv6pSe4e2z7kSzQRfofCMLvVM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ck+t5vQoSAbfibb0rCAC6jfjbIxFp7pJWzJiF2HyVe/V2Vu5/iz16s14ygAwuDMZP
	 VhZiZCTapwFCgsK7yCcaCclLj6IXzqINKN9TehivXfprvxzextsZD72ShP1myBiHLn
	 Su/DGcaJrymf6ELn3R9g/siP+tvfN5WpPOzMWpVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4DD2F80552;
	Thu, 17 Mar 2022 10:32:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C9EF80517; Thu, 17 Mar 2022 10:31:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DCB1F80518
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 10:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCB1F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SXapGSIo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22H7ecZt022935;
 Thu, 17 Mar 2022 04:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=xxRGWV0GdBuYVwUw8paO+jr9OgLMwyNzezVazBUiXZE=;
 b=SXapGSIot2dyqHDqYWofeNaeBPDfH+1dpYnJ9q9xhHcdd5CJUCyRzWibTq5fRa3Ozwh3
 5t9tM0o8GIkcNh51lR2y+ehtp4zSh0fXXZiwmd7SpXU0dwudOqXAe/ux8daauuggT5+m
 aLYrgJVAACFSwWDaioF4MRMP5BFapM6czs4+YeAwNp/oV2sr7p5zvIyEPc29BaiYHvmG
 u2+o/4bpKA58+skfS5PXSFY+dcf0hKe7E44yIzivtTgMh58zl6t7uDEUDmpvgJTeRPz8
 oQakOW5Efn0VGPwBu+VgWUbzukHBh/tsyOjrt2JM8Qb9eUjFyOiFBqyCw88DGGv1AUaS cA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3et5yp475f-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Mar 2022 04:31:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Mar
 2022 09:31:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Mar 2022 09:31:33 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AA68E11D1;
 Thu, 17 Mar 2022 09:31:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 12/16] ALSA: hda: cs35l41: Reorganize log for playback
 actions
Date: Thu, 17 Mar 2022 09:31:16 +0000
Message-ID: <20220317093120.168534-13-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
References: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AH0mSEcksv28JnM0er7NnqiKotfDky7J
X-Proofpoint-GUID: AH0mSEcksv28JnM0er7NnqiKotfDky7J
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

For each case, only log the last regmap access, so it doesn't get
overwritten, and as all regmap access should show the same issues
logging the last one should be enough.
Change to dev_err to log this error.

Also, differentiate between a regmap access failure and invalid
playback action.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index ece784662dbd..3294837ff606 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -144,10 +144,9 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
-		ret = regmap_multi_reg_write(reg, cs35l41_hda_config,
-					     ARRAY_SIZE(cs35l41_hda_config));
-		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
-				   CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
+		regmap_multi_reg_write(reg, cs35l41_hda_config, ARRAY_SIZE(cs35l41_hda_config));
+		ret = regmap_update_bits(reg, CS35L41_PWR_CTRL2,
+					 CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		ret = cs35l41_hda_global_enable(cs35l41, 1);
@@ -157,16 +156,16 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		ret = cs35l41_hda_global_enable(cs35l41, 0);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
-				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
+		ret = regmap_update_bits(reg, CS35L41_PWR_CTRL2,
+					 CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
 		break;
 	default:
-		ret = -EINVAL;
+		dev_warn(cs35l41->dev, "Playback action not supported: %d\n", action);
 		break;
 	}
 
 	if (ret)
-		dev_warn(cs35l41->dev, "Failed to apply multi reg write: %d\n", ret);
+		dev_err(cs35l41->dev, "Regmap access fail: %d\n", ret);
 }
 
 static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsigned int *tx_slot,
-- 
2.35.1

