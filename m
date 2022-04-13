Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539214FF224
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 10:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA9517B6;
	Wed, 13 Apr 2022 10:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA9517B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649839253;
	bh=WuglYqSG4KG9Jinw6Yt1eiIRP2s/rg5s1rg77f7at8c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaexKrx05PVYslKLyDxj+UG5T0Fgkoo0jg4uIXcsTULWZ0zWoqcXGF0kuPqe+3cUU
	 FsX3nRr1RvFr+w34f/mo6YG0xXMlUNpaOvE521bVOlKNABUncKpv+HWdWbVDIYTB1o
	 4oLTrGpVDL6LEcrJVIdgCzDKXzy8uxPKcGukhWdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2A7F80558;
	Wed, 13 Apr 2022 10:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59040F80542; Wed, 13 Apr 2022 10:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C371F80095
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 10:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C371F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dH4+U9VY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D8Z6Rn011523;
 Wed, 13 Apr 2022 03:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=XfjGvTfc5FFRH+I3vn3obm+FHsmjUJJWCkOCO75VMvM=;
 b=dH4+U9VYicX6AYBJEIsHbs2Xo/R3kCapX1L/4mpw9GsfodpM74o+kfkVDC3+24tJnJBL
 O5gMdjiJ4MJg261YvHuIR0/X89vjz59YTGBavwUIvLxNnzHzWtyhL8PtNpgOzmi9JgKr
 MkGTyU3zgAH4phO4i3vrFyIbd55+dVBv+ocROyQttG/V3Wkhu9xGstZMu/8b3K/Hdydu
 F+/mxwaF5oRRk6X+OrJvqk4ZW8cczt3O7I0oA3LTaoHRMRvkMAEKxjh8dW0K8qBoYMTN
 Pxz6oITk1T+/zSE1xnz9FDIWGLSpxdkDNRXi7TAqohFzrgv0B3y1dtKbKZuAhhBHCLET /A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fb6pycvcv-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Apr 2022 03:37:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 09:37:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 13 Apr 2022 09:37:33 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3508B475;
 Wed, 13 Apr 2022 08:37:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 11/16] ALSA: hda: cs35l41: Remove cs35l41_hda_reg_sequence
 struct
Date: Wed, 13 Apr 2022 09:37:23 +0100
Message-ID: <20220413083728.10730-12-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
References: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3TRwK98DHxi-VG03FVqrkK4-2C05BZHR
X-Proofpoint-GUID: 3TRwK98DHxi-VG03FVqrkK4-2C05BZHR
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

Remove cs35l41_hd_reg_sequence as it adds a layer of flexibility not needed.
As cs35l41_hda_(start/stop)_bst is a single register, it can be replaced by
regmap_update_bits with usleep_range to wait for the same 3000us that
reg_sequence had.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 79 ++++++++++++++++---------------------
 sound/pci/hda/cs35l41_hda.h | 14 -------
 2 files changed, 33 insertions(+), 60 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 6e82ab9517f0..ece784662dbd 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -32,14 +32,6 @@ static const struct reg_sequence cs35l41_hda_mute[] = {
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
 };
 
-static const struct reg_sequence cs35l41_hda_start_bst[] = {
-	{ CS35L41_PWR_CTRL1,		0x00000001, 3000}, // set GLOBAL_EN = 1
-};
-
-static const struct reg_sequence cs35l41_hda_stop_bst[] = {
-	{ CS35L41_PWR_CTRL1,		0x00000000, 3000}, // set GLOBAL_EN = 0
-};
-
 // only on amps where GPIO1 is used to control ext. VSPK switch
 static const struct reg_sequence cs35l41_start_ext_vspk[] = {
 	{ 0x00000040,			0x00000055 },
@@ -109,31 +101,44 @@ static const struct reg_sequence cs35l41_reset_to_safe[] = {
 	{ 0x00000040,			0x00000033 },
 };
 
-static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_no_bst = {
-	.prepare	= cs35l41_safe_to_active,
-	.num_prepare	= ARRAY_SIZE(cs35l41_safe_to_active),
-	.cleanup	= cs35l41_active_to_safe,
-	.num_cleanup	= ARRAY_SIZE(cs35l41_active_to_safe),
-};
+static int cs35l41_hda_global_enable(struct cs35l41_hda *cs35l41, int enable)
+{
+	int ret;
 
-static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_ext_bst = {
-	.prepare	= cs35l41_start_ext_vspk,
-	.num_prepare	= ARRAY_SIZE(cs35l41_start_ext_vspk),
-	.cleanup	= cs35l41_stop_ext_vspk,
-	.num_cleanup	= ARRAY_SIZE(cs35l41_stop_ext_vspk),
-};
+	switch (cs35l41->hw_cfg.bst_type) {
+	case CS35L41_INT_BOOST:
+		ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
+					 CS35L41_GLOBAL_EN_MASK,
+					 enable << CS35L41_GLOBAL_EN_SHIFT);
+		usleep_range(3000, 3100);
+		break;
+	case CS35L41_EXT_BOOST:
+		if (enable)
+			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_start_ext_vspk,
+						     ARRAY_SIZE(cs35l41_start_ext_vspk));
+		else
+			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_stop_ext_vspk,
+						     ARRAY_SIZE(cs35l41_stop_ext_vspk));
+		break;
+	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
+		if (enable)
+			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_safe_to_active,
+						     ARRAY_SIZE(cs35l41_safe_to_active));
+		else
+			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_active_to_safe,
+						     ARRAY_SIZE(cs35l41_active_to_safe));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-static const struct cs35l41_hda_reg_sequence cs35l41_hda_reg_seq_int_bst = {
-	.prepare	= cs35l41_hda_start_bst,
-	.num_prepare	= ARRAY_SIZE(cs35l41_hda_start_bst),
-	.cleanup	= cs35l41_hda_stop_bst,
-	.num_cleanup	= ARRAY_SIZE(cs35l41_hda_stop_bst),
+	return ret;
 };
 
 static void cs35l41_hda_playback_hook(struct device *dev, int action)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	const struct cs35l41_hda_reg_sequence *reg_seq = cs35l41->reg_seq;
 	struct regmap *reg = cs35l41->regmap;
 	int ret = 0;
 
@@ -145,19 +150,15 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 				   CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
-		if (reg_seq->prepare)
-			ret = regmap_multi_reg_write(reg, reg_seq->prepare, reg_seq->num_prepare);
+		ret = cs35l41_hda_global_enable(cs35l41, 1);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
 		regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
-		if (reg_seq->cleanup)
-			ret = regmap_multi_reg_write(reg, reg_seq->cleanup, reg_seq->num_cleanup);
+		ret = cs35l41_hda_global_enable(cs35l41, 0);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 				   CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
-		if (reg_seq->close)
-			ret = regmap_multi_reg_write(reg, reg_seq->close, reg_seq->num_close);
 		break;
 	default:
 		ret = -EINVAL;
@@ -221,7 +222,6 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 
 	switch (hw_cfg->bst_type) {
 	case CS35L41_INT_BOOST:
-		cs35l41->reg_seq = &cs35l41_hda_reg_seq_int_bst;
 		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
 					   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
 		if (ret)
@@ -229,10 +229,6 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 		break;
 	case CS35L41_EXT_BOOST:
 	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
-		if (hw_cfg->bst_type == CS35L41_EXT_BOOST)
-			cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
-		else
-			cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
 		regmap_multi_reg_write(cs35l41->regmap, cs35l41_reset_to_safe,
 				       ARRAY_SIZE(cs35l41_reset_to_safe));
 		ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
@@ -511,15 +507,6 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 
-	if (cs35l41->reg_seq->probe) {
-		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41->reg_seq->probe,
-					     cs35l41->reg_seq->num_probe);
-		if (ret) {
-			dev_err(cs35l41->dev, "Fail to apply probe reg patch: %d\n", ret);
-			goto err;
-		}
-	}
-
 	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
 	if (ret) {
 		dev_err(cs35l41->dev, "Register component failed: %d\n", ret);
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 17f10764f174..44d9204ffdf1 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -27,24 +27,10 @@ enum cs35l41_hda_gpio_function {
 	CS35l41_SYNC,
 };
 
-struct cs35l41_hda_reg_sequence {
-	const struct reg_sequence *probe;
-	unsigned int num_probe;
-	const struct reg_sequence *open;
-	unsigned int num_open;
-	const struct reg_sequence *prepare;
-	unsigned int num_prepare;
-	const struct reg_sequence *cleanup;
-	unsigned int num_cleanup;
-	const struct reg_sequence *close;
-	unsigned int num_close;
-};
-
 struct cs35l41_hda {
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
-	const struct cs35l41_hda_reg_sequence *reg_seq;
 	struct cs35l41_hw_cfg hw_cfg;
 
 	int irq;
-- 
2.35.2

