Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E70E5804CF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:52:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D2AF15E0;
	Mon, 25 Jul 2022 21:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D2AF15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778749;
	bh=RdjiMiVxX/SVVGD6biNmcQjzZF77vFezhO7W0jhCt+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f63KLXB4kQkx31COU3wJs8M4a6RMPn0Rx/tpmfg4JgcYpIUV3J+0kY9wG/7qw2a0S
	 nT4LSandPcRzUSDicWMU9sqQRE3quK717nSn3chUIyWMaKO5PdBygJzMwSZmvyV4yL
	 1BUbenYfclJon5qKmRyY7PvXH9XogL9T7LKJHrc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB3EF80578;
	Mon, 25 Jul 2022 21:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D4FCF80212; Mon, 25 Jul 2022 21:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3989CF80212
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3989CF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fWJR9EvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778573; x=1690314573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RdjiMiVxX/SVVGD6biNmcQjzZF77vFezhO7W0jhCt+Q=;
 b=fWJR9EvSPOyq2JD4N6p1FwRxlOxOpC7TRk3hUf2lyAPESouj8sdKdiLV
 qSC4i1JiS/ZwTU99JGXmwlNVJ6sGp/dV8ysK0Cd2IjvLtI15Yd7eb9Z6F
 9vEzBBmI5wBQNCCIpK3LZ9vP8UzRKvwlko13eIZnKVlZ37g+h9+6+RtHz
 DkPsUgr6vxCrGB8guD7+A4pitGQzg+O+h9UqWSVcbdHl8Nqo3Rvb88f1W
 rN6Vky3cSrLdz6UzqqMosN/n8xiQwMW1/VCg/DfFrWTIw8kAnt6XbXynp
 D9mt0JCAeLt3cr3W5Q1CM7dIjqcTt9OKcBpVI5pToddO1fPu/GzQwYXNM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553902"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553902"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479442"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: Intel: sof_es8336: Fix GPIO quirks set via module
 option
Date: Mon, 25 Jul 2022 14:49:02 -0500
Message-Id: <20220725194909.145418-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Andrey Turkin <andrey.turkin@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

From: Andrey Turkin <andrey.turkin@gmail.com>

The two GPIO quirk bits only affected actual GPIO selection
when set by the quirks table. They were reported as being
in effect when set via module options but actually did nothing.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andrey Turkin <andrey.turkin@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 23d03e0f7759..4d0c361fc277 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -77,8 +77,6 @@ static const struct acpi_gpio_mapping acpi_enable_both_gpios_rev_order[] = {
 	{ }
 };
 
-static const struct acpi_gpio_mapping *gpio_mapping = acpi_speakers_enable_gpio0;
-
 static void log_quirks(struct device *dev)
 {
 	dev_info(dev, "quirk mask %#lx\n", quirk);
@@ -272,15 +270,6 @@ static int sof_es8336_quirk_cb(const struct dmi_system_id *id)
 {
 	quirk = (unsigned long)id->driver_data;
 
-	if (quirk & SOF_ES8336_HEADPHONE_GPIO) {
-		if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
-			gpio_mapping = acpi_enable_both_gpios;
-		else
-			gpio_mapping = acpi_enable_both_gpios_rev_order;
-	} else if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK) {
-		gpio_mapping = acpi_speakers_enable_gpio1;
-	}
-
 	return 1;
 }
 
@@ -529,6 +518,7 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	struct acpi_device *adev;
 	struct snd_soc_dai_link *dai_links;
 	struct device *codec_dev;
+	const struct acpi_gpio_mapping *gpio_mapping;
 	unsigned int cnt = 0;
 	int dmic_be_num = 0;
 	int hdmi_num = 3;
@@ -635,6 +625,17 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	}
 
 	/* get speaker enable GPIO */
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO) {
+		if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
+			gpio_mapping = acpi_enable_both_gpios;
+		else
+			gpio_mapping = acpi_enable_both_gpios_rev_order;
+	} else if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK) {
+		gpio_mapping = acpi_speakers_enable_gpio1;
+	} else {
+		gpio_mapping = acpi_speakers_enable_gpio0;
+	}
+
 	ret = devm_acpi_dev_add_driver_gpios(codec_dev, gpio_mapping);
 	if (ret)
 		dev_warn(codec_dev, "unable to add GPIO mapping table\n");
-- 
2.34.1

