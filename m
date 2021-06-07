Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E632639E9C7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720D5167B;
	Tue,  8 Jun 2021 00:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720D5167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623106243;
	bh=8EndkjbwCDLvxXdiRQG4UnEVCmfZHBIXkR17hJ7DFvs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNNSmnLvom16G1yuy0+T0yArOblseaxqSl5G9Rattcbmiciiy0CaGoEamWJ060C+u
	 4xEFZPjSnFooQl88CQt6Su0o3d/jioRQYmvzNP4oX+EOjw4/DaX9U45ZfowFU1pM1H
	 LRQSbK3pTOZ9qUmjFI1yctlMJ8AXR8H62yppiS10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C62BF804E7;
	Tue,  8 Jun 2021 00:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE7DF8026C; Tue,  8 Jun 2021 00:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D919F80212
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D919F80212
IronPort-SDR: U0Yklc7GD441yD2gjdCJwSnaSGmrO6c8QWGo9HO7VZNiBMvaNwL8TtNMpiA78+ydQk6i9NGMl0
 CJUDBU3JISEg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185102182"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185102182"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:51 -0700
IronPort-SDR: OPYA0fQxCDXKJi9syyTbPu6AIGXLDm2gj+8kOynGbBiVM/OYJ/S8afQ0w+VYSch2s0pndSYAB3
 7IPuSOPMtFbg==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="637437115"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: Intel: sof_da7219_max98373: shrink platform_id
 below 20 characters
Date: Mon,  7 Jun 2021 17:46:34 -0500
Message-Id: <20210607224638.585486-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
References: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>
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

Sparse throws the following warning:

sound/soc/intel/boards/sof_da7219_max98373.c:438:25: error: too long
initializer-string for array of char(no space for nul char)

Fix by using 'mx' acronym for Maxim.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_da7219_max98373.c      | 8 ++++----
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 2116d70d1ea8..d702a8dfa241 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -431,11 +431,11 @@ static int audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id board_ids[] = {
 	{
-		.name = "sof_da7219_max98373",
+		.name = "sof_da7219_mx98373",
 		.driver_data = (kernel_ulong_t)&card_da7219_m98373,
 	},
 	{
-		.name = "sof_da7219_max98360a",
+		.name = "sof_da7219_mx98360a",
 		.driver_data = (kernel_ulong_t)&card_da7219_m98360a,
 	},
 	{ }
@@ -456,6 +456,6 @@ module_platform_driver(audio)
 MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:sof_da7219_max98360a");
-MODULE_ALIAS("platform:sof_da7219_max98373");
+MODULE_ALIAS("platform:sof_da7219_mx98360a");
+MODULE_ALIAS("platform:sof_da7219_mx98373");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 885f6002fe53..3586ce72c42c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -37,7 +37,7 @@ static struct snd_soc_acpi_codecs mx98360a_spk = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "DLGS7219",
-		.drv_name = "sof_da7219_max98373",
+		.drv_name = "sof_da7219_mx98373",
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-da7219.tplg",
 		.machine_quirk = snd_soc_acpi_codec_list,
@@ -45,7 +45,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "sof_da7219_max98360a",
+		.drv_name = "sof_da7219_mx98360a",
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
 	},
-- 
2.25.1

