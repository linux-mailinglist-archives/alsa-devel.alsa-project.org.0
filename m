Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C585AD7F5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 18:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360901607;
	Mon,  5 Sep 2022 18:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360901607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662397171;
	bh=OPhWheACqB5voc1DZNgFZ9E6/Dr9gFqeq2wdG3AQr3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQTQAKBUIsG+9UkVGyAApuPyfUmH1z34o34fV++f09We4DdYCVUjwXOH22kAseD0Q
	 5t4/A43uDu5JTSDOMCPLcfRu8li76ByT5MAZhiFqKAOPWXt32ISnjoeD+kkWh4g3I4
	 q59DGX2ALyPC7MmGW1JzzRF3hXZOznAWY2bP0fXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F6B7F80424;
	Mon,  5 Sep 2022 18:58:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF834F8032D; Mon,  5 Sep 2022 18:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FC25F800CC
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 18:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FC25F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nwoj27/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662397104; x=1693933104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPhWheACqB5voc1DZNgFZ9E6/Dr9gFqeq2wdG3AQr3g=;
 b=nwoj27/MbjcurygRSBmp6GtXeHEt7Pc/KQ0ONv29Aimv2UdYy93R2lLJ
 GeH5yZWZPCRGft8Uik4SoltIg3yqIreryDhjo02t0p94St3vDprL3b6ce
 ynvzzYx3s782AiFHyZqQvpw1cfqDV6WVX2n8r+Qm7oAJ6AFTYoXTGdgwk
 cia5CwkvrTlgj50kr92Ew+WqkwpTbPIR5a5wyt8anqLjZLGZOSeKauQsn
 siFv7AK3eAQSset5lrr36MBsgbUwY9/9MgY60k0xnnshHrRvJnKQUw+EZ
 aLixWpTCPX77GMNOTZeEUQ1N+WpuvozbBFuCd7vUg9m4kbQsUGeWEiudd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283419363"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="283419363"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 09:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="789428926"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 05 Sep 2022 09:58:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 85A22F7; Mon,  5 Sep 2022 19:58:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ALSA: hda: cs35l41: Utilize acpi_get_subsystem_id()
Date: Mon,  5 Sep 2022 19:58:26 +0300
Message-Id: <20220905165826.35979-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905165826.35979-1-andriy.shevchenko@linux.intel.com>
References: <20220905165826.35979-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

Replace open coded variant of recently introduced acpi_get_subsystem_id().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/cs35l41_hda.c | 46 ++++++++-----------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 12e955931044..3952f2853703 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -842,8 +842,8 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	comps->dev = dev;
 	if (!cs35l41->acpi_subsystem_id)
-		cs35l41->acpi_subsystem_id = devm_kasprintf(dev, GFP_KERNEL, "%.8x",
-							    comps->codec->core.subsystem_id);
+		cs35l41->acpi_subsystem_id = kasprintf(GFP_KERNEL, "%.8x",
+						       comps->codec->core.subsystem_id);
 	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 
@@ -1048,36 +1048,6 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, &hw_cfg->spk_pos);
 }
 
-static int cs35l41_get_acpi_sub_string(struct device *dev, struct acpi_device *adev,
-				       const char **subsysid)
-{
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
-	acpi_status status;
-	int ret = 0;
-
-	status = acpi_evaluate_object(adev->handle, "_SUB", NULL, &buffer);
-	if (ACPI_SUCCESS(status)) {
-		obj = buffer.pointer;
-		if (obj->type == ACPI_TYPE_STRING) {
-			*subsysid = devm_kstrdup(dev, obj->string.pointer, GFP_KERNEL);
-			if (*subsysid == NULL) {
-				dev_err(dev, "Cannot allocate Subsystem ID");
-				ret = -ENOMEM;
-			}
-		} else {
-			dev_warn(dev, "Warning ACPI _SUB did not return a string\n");
-			ret = -ENODEV;
-		}
-		acpi_os_free(buffer.pointer);
-	} else {
-		dev_dbg(dev, "Warning ACPI _SUB failed: %#x\n", status);
-		ret = -ENODEV;
-	}
-
-	return ret;
-}
-
 static int cs35l41_get_speaker_id(struct device *dev, int amp_index,
 				  int num_amps, int fixed_gpio_id)
 {
@@ -1182,6 +1152,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	u32 values[HDA_MAX_COMPONENTS];
 	struct acpi_device *adev;
 	struct device *physdev;
+	const char *sub;
 	char *property;
 	size_t nval;
 	int i, ret;
@@ -1195,11 +1166,10 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	physdev = get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 
-	ret = cs35l41_get_acpi_sub_string(cs35l41->dev, adev, &cs35l41->acpi_subsystem_id);
-	if (ret)
-		dev_info(cs35l41->dev, "No Subsystem ID found in ACPI: %d", ret);
-	else
-		dev_dbg(cs35l41->dev, "Subsystem ID %s found", cs35l41->acpi_subsystem_id);
+	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+	if (IS_ERR(sub))
+		sub = NULL;
+	cs35l41->acpi_subsystem_id = sub;
 
 	property = "cirrus,dev-index";
 	ret = device_property_count_u32(physdev, property);
@@ -1434,6 +1404,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
+	kfree(cs35l41->acpi_subsystem_id);
 
 	return ret;
 }
@@ -1456,6 +1427,7 @@ void cs35l41_hda_remove(struct device *dev)
 	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
+	kfree(cs35l41->acpi_subsystem_id);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
 
-- 
2.35.1

