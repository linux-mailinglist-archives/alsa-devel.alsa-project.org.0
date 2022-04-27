Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE24511BA0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:09:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41EBC1691;
	Wed, 27 Apr 2022 17:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41EBC1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072173;
	bh=Fe5fvbLZdvoNBNXJvq2fLD5YZ1v+XpY9WCe/d8mx9dg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cvRN7dsH3N34pErZaZ6Inq+4n7qZhY13SMw3uzsl9zW0QJHKHdYBZ09FQ4a/l2UtD
	 Um51/6imiryywxpuRLCRIl1djJXJH93RFBxddIN4yPy2i68dq1eBdNFvQ+Jpa4rqqf
	 oc8W+Wd1YOfldZreYWl60ruDYsTG6oUS6ulZ0aT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE91BF80538;
	Wed, 27 Apr 2022 17:07:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C6FF8052F; Wed, 27 Apr 2022 17:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E96F804D8
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E96F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="K0icGYyx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23RBg6qB022428;
 Wed, 27 Apr 2022 10:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0FztkMwWhaFUG87GpYloXgHTKnQqJ27GP8iJ014U1vg=;
 b=K0icGYyx74Hin4yhrSTar7l1dcJfNIgUoDnnhwIL4TBBlh81MSq0T02/N9dQl9Uliz/T
 mQ2WPPlyMpOxdoM2sw4jrbO8o9PXxcUpceDSGtNIoD7plgdT0gQ7d/f+hw30JrDqj08j
 6MI38LR3Vtfg9l6cdKCQIzannZHMI44U1lWY5V/jPBv0ZZ1AjorbBs/sUpMDFrDJtP9B
 1GtP6YMNOleeQp8bFq4+WP8RsvGjwHsSR4QxKCINr6pYSsA16DJLMQexEagEMeevXiX/
 i6FAZuivWDaI7FcoJhL2d+UHd4W4GTNgXSkQuwbuuBnBCQurwEEDqnPtdFTgvOobeyPC Wg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xte-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:22 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77E03B1A;
 Wed, 27 Apr 2022 15:07:22 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 03/26] ALSA: hda: cs35l41: Remove Set Channel Map api from
 binding
Date: Wed, 27 Apr 2022 16:06:57 +0100
Message-ID: <20220427150720.9194-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j3LlMB9gY9MvBvpiWpm3r9tagiqmyMFn
X-Proofpoint-ORIG-GUID: j3LlMB9gY9MvBvpiWpm3r9tagiqmyMFn
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

This API was required for CLSA0100 laptop, which did not
have correct properties inside ACPI. The required values
are now hardcoded inside the driver so this is no longer
needed.
Without this api, there CLSA0100 can now use the generic
cs35l41 fixup, like the other laptops.
All other laptops will read the Speaker Position from
ACPI and set the channel map from within the driver.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c   |  1 -
 sound/pci/hda/hda_component.h |  2 --
 sound/pci/hda/patch_realtek.c | 54 +----------------------------------
 3 files changed, 1 insertion(+), 56 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d7e90c0cae51..96c3e541696d 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -92,7 +92,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	comps->dev = dev;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 	comps->playback_hook = cs35l41_hda_playback_hook;
-	comps->set_channel_map = cs35l41_hda_channel_map;
 
 	return 0;
 }
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index 2e52be6db9c2..e26c896a13f3 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -15,6 +15,4 @@ struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
 	void (*playback_hook)(struct device *dev, int action);
-	int (*set_channel_map)(struct device *dev, unsigned int rx_num, unsigned int *rx_slot,
-				unsigned int tx_num, unsigned int *tx_slot);
 };
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 62fbf3772b41..dc1ff4c54291 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6582,18 +6582,6 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
-static int find_comp_by_dev_name(struct alc_spec *spec, const char *name)
-{
-	int i;
-
-	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
-		if (strcmp(spec->comps[i].name, name) == 0)
-			return i;
-	}
-
-	return -ENODEV;
-}
-
 static int comp_bind(struct device *dev)
 {
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
@@ -6668,50 +6656,10 @@ static void cs35l41_fixup_spi_four(struct hda_codec *codec, const struct hda_fix
 	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 4);
 }
 
-static void alc287_legion_16achg6_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *cdc,
-						struct snd_pcm_substream *sub, int action)
-{
-	struct alc_spec *spec = cdc->spec;
-	unsigned int rx_slot;
-	int i;
-
-	switch (action) {
-	case HDA_GEN_PCM_ACT_PREPARE:
-		rx_slot = 0;
-		i = find_comp_by_dev_name(spec, "i2c-CLSA0100:00-cs35l41-hda.0");
-		if (i >= 0)
-			spec->comps[i].set_channel_map(spec->comps[i].dev, 0, NULL, 1, &rx_slot);
-
-		rx_slot = 1;
-		i = find_comp_by_dev_name(spec, "i2c-CLSA0100:00-cs35l41-hda.1");
-		if (i >= 0)
-			spec->comps[i].set_channel_map(spec->comps[i].dev, 0, NULL, 1, &rx_slot);
-		break;
-	}
-
-	comp_generic_playback_hook(hinfo, cdc, sub, action);
-}
-
 static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const struct hda_fixup *fix,
 						 int action)
 {
-	struct device *dev = hda_codec_dev(cdc);
-	struct alc_spec *spec = cdc->spec;
-	int ret;
-
-	switch (action) {
-	case HDA_FIXUP_ACT_PRE_PROBE:
-		component_match_add(dev, &spec->match, component_compare_dev_name,
-				    "i2c-CLSA0100:00-cs35l41-hda.0");
-		component_match_add(dev, &spec->match, component_compare_dev_name,
-				    "i2c-CLSA0100:00-cs35l41-hda.1");
-		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
-		if (ret)
-			codec_err(cdc, "Fail to register component aggregator %d\n", ret);
-		else
-			spec->gen.pcm_playback_hook = alc287_legion_16achg6_playback_hook;
-		break;
-	}
+	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0100", 2);
 }
 
 /* for alc295_fixup_hp_top_speakers */
-- 
2.32.0

