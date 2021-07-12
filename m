Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2EC3C6506
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 22:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8435A16C1;
	Mon, 12 Jul 2021 22:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8435A16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626122121;
	bh=TI5+X93ZggacsuU6hwXb6WKts5KtPn2OwdyKF8WPuOI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxcR6TCc9zDdvq1ZqHSlqjIjZnlOhJlrStM7+CEEwq6X9/JELlhtGVdpK/WiUP3bU
	 EkmFpCtcvZwjogCjIGSI+ys322p0GkVU8xjSxt1WUSXTwPwqukM+BI23a4816pfc3b
	 UkpGgYBthaVe5lgwkKVaR5o13qUgq2SZuN5aIUhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DA9F804E2;
	Mon, 12 Jul 2021 22:33:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83630F804E3; Mon, 12 Jul 2021 22:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3370F8025B
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 22:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3370F8025B
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190431642"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="190431642"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561880768"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.95.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ASoC: Intel: sof_cs42l42: add support for
 jsl_cs4242_mx98360a
Date: Mon, 12 Jul 2021 15:32:36 -0500
Message-Id: <20210712203240.46960-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
References: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

This patch adds driver data for jsl_cs4242_mx98360a which supports two
max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec on
SSP0 running on JSL platform.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 11 +++++++++++
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 4cd8be177db1..ce78c1879887 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -42,6 +42,7 @@
 #define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
 	((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) | ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
 #define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(25)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(26)
 
 enum {
 	LINK_NONE = 0,
@@ -299,6 +300,8 @@ static int create_spk_amp_dai_links(struct device *dev,
 
 	if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
 		max_98357a_dai_link(&links[*id]);
+	} else if (sof_cs42l42_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+		max_98360a_dai_link(&links[*id]);
 	} else {
 		dev_err(dev, "no amp defined\n");
 		ret = -EINVAL;
@@ -610,6 +613,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_CS42L42_SSP_AMP(1)) |
 					SOF_CS42L42_DAILINK(LINK_SPK, LINK_HP, LINK_DMIC, LINK_HDMI, LINK_NONE),
 	},
+	{
+		.name = "jsl_cs4242_mx98360a",
+		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_CS42L42_SSP_AMP(1)) |
+					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_NONE),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 3586ce72c42c..69ff7286d357 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -73,6 +73,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
+	{
+		.id = "10134242",
+		.drv_name = "jsl_cs4242_mx98360a",
+		.sof_fw_filename = "sof-jsl.ri",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mx98360a_spk,
+		.sof_tplg_filename = "sof-jsl-cs42l42-mx98360a.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-- 
2.25.1

