Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D032220A5A5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D1716DA;
	Thu, 25 Jun 2020 21:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D1716DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112804;
	bh=ybB4fJfevcCwiyesY/LMmjrn8ix/3agFSwjqWcLDUZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EmdrSDgkzexq5l8hlVgDgQ89Pp/o0rJVpxZ2p3sI/dBuxQ+Ipp5VijGjZQW6eDH9V
	 5r7wwX0ig1f00t5hBfP/SubBaqXaHAzIaAY49mV5T+CFjcIQYF4WfXBpJjTgps4KTB
	 0DLPI6jFbuz+HgejOEK86UNMBNO+LIgGcbKr1OFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C55F80308;
	Thu, 25 Jun 2020 21:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAEB8F802E3; Thu, 25 Jun 2020 21:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 613FAF802BE
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 613FAF802BE
IronPort-SDR: PvDaWnZuizMVS+6F3tK3N9v0DwtCp/uqjXGb+FbNYqfinafnPT5oGSKHPUyIHgWRd6SA8f8rDC
 CoKJmWg/bNPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120825"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120825"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:39 -0700
IronPort-SDR: b3gU+hmR3vtJTMYECelKSfKvOCA8LAG39yRKmBWfhf8/4Jpdzkczu2zDnNzLzoHwlaHUm2IEFw
 Mp86VQbU6vkA==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559523"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/17] ASoC: intel: sof_rt5682: Add support for
 jsl-max98360a-rt5682
Date: Thu, 25 Jun 2020 14:13:00 -0500
Message-Id: <20200625191308.3322-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Add support for max98360a speaker amp on SSP1 and ALC5682 on SSP0
for jsl+ platform.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 23 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-jsl-match.c   | 13 +++++++++++
 2 files changed, 36 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 20ab2664f7c8..cc8b0f26f724 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -43,6 +43,7 @@
 	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
 #define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(13)
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(14)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(15)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -500,6 +501,13 @@ static struct snd_soc_dai_link_component max98357a_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component max98360a_component[] = {
+	{
+		.name = "MX98360A:00",
+		.dai_name = "HiFi",
+	}
+};
+
 static struct snd_soc_dai_link_component rt1015_components[] = {
 	{
 		.name = "i2c-10EC1015:00",
@@ -662,6 +670,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
 			links[id].init = max98373_spk_codec_init;
 			links[id].ops = &max_98373_ops;
+		} else if (sof_rt5682_quirk &
+				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+			links[id].codecs = max98360a_component;
+			links[id].num_codecs = ARRAY_SIZE(max98360a_component);
+			links[id].init = speaker_codec_init;
 		} else {
 			links[id].codecs = max98357a_component;
 			links[id].num_codecs = ARRAY_SIZE(max98357a_component);
@@ -833,6 +846,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "jsl_rt5682_max98360a",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{ }
 };
 
@@ -855,3 +877,4 @@ MODULE_ALIAS("platform:sof_rt5682");
 MODULE_ALIAS("platform:tgl_max98357a_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015");
 MODULE_ALIAS("platform:tgl_max98373_rt5682");
+MODULE_ALIAS("platform:jsl_rt5682_max98360a");
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 859f8a1bd914..34f5fcad5701 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs rt1015_spk = {
 	.codecs = {"10EC1015"}
 };
 
+static struct snd_soc_acpi_codecs mx98360a_spk = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
 /*
  * When adding new entry to the snd_soc_acpi_intel_jsl_machines array,
  * use .quirk_data member to distinguish different machine driver,
@@ -47,6 +52,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &rt1015_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "jsl_rt5682_max98360a",
+		.sof_fw_filename = "sof-jsl.ri",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mx98360a_spk,
+		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-- 
2.20.1

