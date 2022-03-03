Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A219E4CC40B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:35:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 327481B2E;
	Thu,  3 Mar 2022 18:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 327481B2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646328959;
	bh=VdE5LmiDPETm17OImCOsPsft1Gu2PiBDTUiVdYTWeKA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSSDdjZKoXSIrc7lx5mIgAaGCkESAR/O/n7xKbPpASGbsT/QoPoKVECmOZs+eB9eR
	 AV1nbvUY5zBQuJ/MJVAD1Ls7Z8ZJiyCL6Tm649G0KKO55hkNJLg+YGlLPEYNwpRB4M
	 GPnBzRpx+Z7gb3Icfgj7rLA1YiWuX+zVEC5EHDqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 059C3F80578;
	Thu,  3 Mar 2022 18:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6653EF80542; Thu,  3 Mar 2022 18:31:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDB15F8051E
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB15F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dmgqtilp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 223509T9013880;
 Thu, 3 Mar 2022 11:31:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=71ZP0HhkAgra+5pwRxbVCGp5wL/k4hevq9c+UZpjcWE=;
 b=dmgqtilpgWLGZoKLx0lW6vEB/f+pDn0QWDV/7sLfcaCMOV2O3CGWH0gQPxRARaTLqD3c
 ws0/y56Kfn0ghCEn2Oh73d99krpoQTwDZ6xl9JrfLt0M620ClR4uLNp0rt3dLkVyp0vE
 8klw9tGWxJuVVo7mj2J5fOSeNPVa8OMfS0gObEPtG6ScPyRnpwLY4srubCV/NkuVDafI
 5n6wAdfmAwJUAE4XFJSCcdzUPImCLY9U2eY8MTrR7V3wcCDyskMn3dGNNm+nCvOEsh0C
 0YUxCb++OBuPxg0TgyGTHulG0eT/M4dRTMlymjhxv5bL3MzYWfwJSdBUmEli+h1ygR0K fQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybn-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:08 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AB6592A1;
 Thu,  3 Mar 2022 17:31:07 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 15/20] hda: cs35l41: Remove unnecessary log
Date: Thu, 3 Mar 2022 17:30:54 +0000
Message-ID: <20220303173059.269657-16-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9qTLZvoXuQZkI6lwFnJFFrJhOp5BXCLB
X-Proofpoint-GUID: 9qTLZvoXuQZkI6lwFnJFFrJhOp5BXCLB
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

If regmap fails would fail during probe of the device.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 90c833a25599..f21d048e60ab 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -135,37 +135,31 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	const struct cs35l41_hda_reg_sequence *reg_seq = cs35l41->reg_seq;
 	struct regmap *reg = cs35l41->regmap;
-	int ret = 0;
 
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
-		ret = regmap_multi_reg_write(reg, cs35l41_hda_config,
-					     ARRAY_SIZE(cs35l41_hda_config));
+		regmap_multi_reg_write(reg, cs35l41_hda_config, ARRAY_SIZE(cs35l41_hda_config));
 		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 				   CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		if (reg_seq->prepare)
-			ret = regmap_multi_reg_write(reg, reg_seq->prepare, reg_seq->num_prepare);
+			regmap_multi_reg_write(reg, reg_seq->prepare, reg_seq->num_prepare);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
 		regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
 		if (reg_seq->cleanup)
-			ret = regmap_multi_reg_write(reg, reg_seq->cleanup, reg_seq->num_cleanup);
+			regmap_multi_reg_write(reg, reg_seq->cleanup, reg_seq->num_cleanup);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
 		if (reg_seq->close)
-			ret = regmap_multi_reg_write(reg, reg_seq->close, reg_seq->num_close);
+			regmap_multi_reg_write(reg, reg_seq->close, reg_seq->num_close);
 		break;
 	default:
-		ret = -EINVAL;
 		break;
 	}
-
-	if (ret)
-		dev_warn(cs35l41->dev, "Failed to apply multi reg write: %d\n", ret);
 }
 
 static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsigned int *tx_slot,
-- 
2.35.1

