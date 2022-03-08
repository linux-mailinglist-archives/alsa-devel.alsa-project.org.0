Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6854D2188
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6A318B3;
	Tue,  8 Mar 2022 20:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6A318B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767912;
	bh=8zIQC6m/5CEOfVNhv5FzEK39VPQUjxTftYka9j2qs5c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNbNasMf+A4sXjrqmBhtrPDU6KKbMQvq2HcobrvmGr7oL+xfF8CiPS+/rwtPkZcVi
	 8DcSVXIc6WrRGGLQEMgG39cWgHptUySWfZ3avRUc9axtiymTK5ifjnTiBy+HFIPRJQ
	 6wfGXLb7T81KCo6x69GXH3alLHbK+F1WGh2MFHDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E56B2F80579;
	Tue,  8 Mar 2022 20:27:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB281F80517; Tue,  8 Mar 2022 20:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B7A1F80520
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7A1F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iMh2oXYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767612; x=1678303612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8zIQC6m/5CEOfVNhv5FzEK39VPQUjxTftYka9j2qs5c=;
 b=iMh2oXYB/V+urMDhDkYb2cO8sxQMzmlY34u375La6VawhEcCL3fFELj5
 8a2bf1VJDlfhM3IzBO+OUYq+EZEa0jFIaw/M2I82bfxN2ml5fFOgJ9La2
 MdmngN/v+kAn6EXoIWDFOsVxr08c5J3r/i+633fGD70+SH7ZY3ZQ3FMWr
 SQwS5I6zN9IzhxLOxKaJKeLDvEgwl8wSpis4cg1jjuiE+HfSYt5fU7+WX
 fGoaLGApRCCniLQ3FyU0EpHIc5uTLGx+E6/shoFNwXjZlIKz0atobyvPZ
 T3TdaPeAIuQ8vTZVgy1VJKMs+WyJHgLR2L3gjfH1sCAg2xAw/Y+ymjEET Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363734"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363734"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573981"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/20] ASoC: Intel: sof_es8336: use NHLT information to set
 dmic and SSP
Date: Tue,  8 Mar 2022 13:26:04 -0600
Message-Id: <20220308192610.392950-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Since we see a proliferation of devices with various configurations,
we want to automatically set the DMIC and SSP information. This patch
relies on the information extracted from NHLT and partially reverts
existing DMI quirks added by commit a164137ce91a ("ASoC: Intel: add
machine driver for SOF+ES8336")

Note that NHLT can report multiple SSPs, choosing from the
ssp_link_mask in an MSB-first manner was found experimentally to work
fine.

The only thing that cannot be detected is the GPIO type, and users may
want to use the quirk override parameter if the 'wrong' solution is
provided.

Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 56 +++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 3376bd360a03..1a8680470577 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -228,24 +228,25 @@ static int sof_es8336_quirk_cb(const struct dmi_system_id *id)
 	return 1;
 }
 
+/*
+ * this table should only be used to add GPIO or jack-detection quirks
+ * that cannot be detected from ACPI tables. The SSP and DMIC
+ * information are providing by the platform driver and are aligned
+ * with the topology used.
+ *
+ * If the GPIO support is missing, the quirk parameter can be used to
+ * enable speakers. In that case it's recommended to keep the SSP and DMIC
+ * information consistent, overriding the SSP and DMIC can only be done
+ * if the topology file is modified as well.
+ */
 static const struct dmi_system_id sof_es8336_quirk_table[] = {
-	{
-		.callback = sof_es8336_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "CHUWI Innovation And Technology"),
-			DMI_MATCH(DMI_BOARD_NAME, "Hi10 X"),
-		},
-		.driver_data = (void *)SOF_ES8336_SSP_CODEC(2)
-	},
 	{
 		.callback = sof_es8336_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "IP3 tech"),
 			DMI_MATCH(DMI_BOARD_NAME, "WN1"),
 		},
-		.driver_data = (void *)(SOF_ES8336_SSP_CODEC(0) |
-					SOF_ES8336_TGL_GPIO_QUIRK |
-					SOF_ES8336_ENABLE_DMIC)
+		.driver_data = (void *)(SOF_ES8336_TGL_GPIO_QUIRK)
 	},
 	{}
 };
@@ -470,11 +471,33 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	card = &sof_es8336_card;
 	card->dev = dev;
 
-	if (!dmi_check_system(sof_es8336_quirk_table))
-		quirk = SOF_ES8336_SSP_CODEC(2);
+	/* check GPIO DMI quirks */
+	dmi_check_system(sof_es8336_quirk_table);
 
-	if (quirk & SOF_ES8336_ENABLE_DMIC)
-		dmic_be_num = 2;
+	if (!mach->mach_params.i2s_link_mask) {
+		dev_warn(dev, "No I2S link information provided, using SSP0. This may need to be modified with the quirk module parameter\n");
+	} else {
+		/*
+		 * Set configuration based on platform NHLT.
+		 * In this machine driver, we can only support one SSP for the
+		 * ES8336 link, the else-if below are intentional.
+		 * In some cases multiple SSPs can be reported by NHLT, starting MSB-first
+		 * seems to pick the right connection.
+		 */
+		unsigned long ssp = 0;
+
+		if (mach->mach_params.i2s_link_mask & BIT(2))
+			ssp = SOF_ES8336_SSP_CODEC(2);
+		else if (mach->mach_params.i2s_link_mask & BIT(1))
+			ssp = SOF_ES8336_SSP_CODEC(1);
+		else  if (mach->mach_params.i2s_link_mask & BIT(0))
+			ssp = SOF_ES8336_SSP_CODEC(0);
+
+		quirk |= ssp;
+	}
+
+	if (mach->mach_params.dmic_num)
+		quirk |= SOF_ES8336_ENABLE_DMIC;
 
 	if (quirk_override != -1) {
 		dev_info(dev, "Overriding quirk 0x%lx => 0x%x\n",
@@ -483,6 +506,9 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	}
 	log_quirks(dev);
 
+	if (quirk & SOF_ES8336_ENABLE_DMIC)
+		dmic_be_num = 2;
+
 	sof_es8336_card.num_links += dmic_be_num + hdmi_num;
 	dai_links = sof_card_dai_links_create(dev,
 					      SOF_ES8336_SSP_CODEC(quirk),
-- 
2.30.2

