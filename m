Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F75543A5
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 09:49:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25771FA8;
	Wed, 22 Jun 2022 09:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25771FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655884187;
	bh=A4F3irbALAhC/GCQes48ypaoVtNjmk+bwUDp2aoragc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aUMpVCHviTwj/0p/bIBGBaOhitsrSSBbR/ArovKgg1qmxD9Zqtu3piOQRJl1TS0iT
	 7N74VHsYyyuFD6VYfisfUhacLv51XyowN7eCjgcwDLvu9Hq6aDNh0fXnhVwJypGmjg
	 tl6AHWZNe+uElEozepMZZqNJ5xAheR8ZwKFqQoqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E09F8055C;
	Wed, 22 Jun 2022 09:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19201F8053E; Wed, 22 Jun 2022 09:47:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 075FDF802D2
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 09:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 075FDF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GATqspGd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M5nidX032367;
 Wed, 22 Jun 2022 02:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VCfSQqByA7jNBXTSiZFxlNUN/rTeTM0AlDQs0otcWSg=;
 b=GATqspGdEpi06VV0io8ZvKA76qG5QJj9en6yUY3C3OrVsI1PGrqdvvEsdCeOx1dcoU1W
 AnQmK1JKuxd5vUc+ZqfgNzaYAksC+5AFb5G2RfkXYMR0eyaCokVDMRFEdEJxMBvUaJ/z
 ShDY36C9O5A64pzO92YYk0K/z3utgjo/3Tw6A1QJCNAKzu/R+voIcQJSbfLIMJpGEcYa
 6uPpr9M++gPABmkvJzwFSMwyN4lRxJRBfM8wsNOQYlTbiz+SNS1a663oJlmf8AcIbW19
 1SeX3HvaPqTSLrZVrdBaDOLclfR/OER5PiWjClc5nve+fMwr/mikOY0i2AFQW/AXsSxV qQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41cqh2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jun 2022 02:46:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 22 Jun
 2022 08:46:55 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Wed, 22 Jun 2022 08:46:55 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.175])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D61D57C;
 Wed, 22 Jun 2022 07:46:54 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v7 03/14] ALSA: hda: cs35l41: Save codec object inside
 component struct
Date: Wed, 22 Jun 2022 08:46:42 +0100
Message-ID: <20220622074653.179078-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622074653.179078-1-vitalyr@opensource.cirrus.com>
References: <20220622074653.179078-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mhus3BjgP_rz4Qi0NknL8g6wCIYzp619
X-Proofpoint-ORIG-GUID: mhus3BjgP_rz4Qi0NknL8g6wCIYzp619
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

This is required for ALSA control support.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c   | 1 +
 sound/pci/hda/cs35l41_hda.h   | 1 +
 sound/pci/hda/hda_component.h | 1 +
 sound/pci/hda/patch_realtek.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index cce27a86267f..bbbaafac50c3 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -117,6 +117,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		return -EBUSY;
 
 	comps->dev = dev;
+	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 	comps->playback_hook = cs35l41_hda_playback_hook;
 
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index a52ffd1f7999..aaf9e16684c2 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -32,6 +32,7 @@ struct cs35l41_hda {
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
 	struct cs35l41_hw_cfg hw_cfg;
+	struct hda_codec *codec;
 
 	int irq;
 	int index;
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index e26c896a13f3..534e845b9cd1 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -14,5 +14,6 @@
 struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
+	struct hda_codec *codec;
 	void (*playback_hook)(struct device *dev, int action);
 };
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ff9a09a670ed..923c0d498d54 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6654,6 +6654,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 					      "%s-%s:00-cs35l41-hda.%d", bus, hid, i);
 			if (!name)
 				return;
+			spec->comps[i].codec = cdc;
 			component_match_add(dev, &spec->match, component_compare_dev_name, name);
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
-- 
2.34.1

