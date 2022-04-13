Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398B4FF253
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 10:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C323A1817;
	Wed, 13 Apr 2022 10:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C323A1817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649839329;
	bh=y/nwcZmAc9DkGCnZyYvWwql7xdxLfcfYJTkTQgPn2uY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwEKUbhUedx0zGHf2uHZcoZTsfmRRHdp6VMeLzPbd6CKH+8JkWfeciwKKEhbEELRE
	 7g1GNxxkCG2VnI7vE6bIz3P0dOJvaeWB/IbaYTZwYpVKWcX0svkD7wAt+BUC1bkDxR
	 MQgvtvhfMzmnxpoO5M9q1MQIiZvgOgbWVvExDeAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4193F80588;
	Wed, 13 Apr 2022 10:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FAF8F80571; Wed, 13 Apr 2022 10:38:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B613DF8051A
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 10:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B613DF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ON1ChVFa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D8Z6Ro011523;
 Wed, 13 Apr 2022 03:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EE5mbwIjAdddYmlHfSZmkNjTcF4DHufY12BPV0fpiC4=;
 b=ON1ChVFaO5Vz5us2D8HtK7mM+kBD74vsR4bP1T5TugRI3nv0lxNkp4hwNi75IvLN8nrx
 YJuPCvpf6gfQgkZhbt5bBJ2OCEFV27J65iJaR/liiGOPqKPdlhQf1Z5G3N8C0ddviYKW
 wihtZx5PgOiOsGCdpIux4gNE9AZFhsTndKG3buwMDI+8Xg9K5MRiw5tvTtS7mPx/FAvH
 fKiZZQL9aYG71XfsoRpxdOOLGn+NdJVh3bzWCX01vcDq9zZf9hhRsZ7zsWjVaC64RwhP
 RLrCG5JuFFaDTyCGIsY9Z7nVASINc46qTc+yt/GkWgdOI7Z07KvAjXgDwEtQq0KSDM78 vw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fb6pycvcv-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Apr 2022 03:37:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 09:37:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 13 Apr 2022 09:37:33 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 834A3B1A;
 Wed, 13 Apr 2022 08:37:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 12/16] ALSA: hda: cs35l41: Reorganize log for playback
 actions
Date: Wed, 13 Apr 2022 09:37:24 +0100
Message-ID: <20220413083728.10730-13-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
References: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qKVfvlLqvNSHENl6iDG1aglNa0WwxFF3
X-Proofpoint-GUID: qKVfvlLqvNSHENl6iDG1aglNa0WwxFF3
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
2.35.2

