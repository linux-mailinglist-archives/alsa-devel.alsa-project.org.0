Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 600DA624DDA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 23:57:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065DF163A;
	Thu, 10 Nov 2022 23:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065DF163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668121059;
	bh=riN9NFnj4G44zUFscgOxHNMFJVohdHE8Kz1q5V8KtCk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lf1iV22lVP/UEfS2ZQRyzLaW8xSCsUolosEGaYpWYuXHM4rN7gmaD/X5IBJ3PLK/1
	 S6mvSebrq8DqKbHhvx5UISc1/S4DNfIGFVpjy8d5zkCjf5bYM3AQUzw2T3cCGqTzNA
	 9KKwOaRobHEIPgZKv1AaV+y9BgCh3RcU/aSvgq3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5621AF8057B;
	Thu, 10 Nov 2022 23:55:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 536B5F8057A; Thu, 10 Nov 2022 23:55:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB18FF8055A
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 23:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB18FF8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PW53Yxuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668120923; x=1699656923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riN9NFnj4G44zUFscgOxHNMFJVohdHE8Kz1q5V8KtCk=;
 b=PW53YxuwD4etuEi3OgZzDTeBhvD8G8Ja1bXyzhDEaWoQwIdzzCmSwUl+
 d+MiUtgtnAdEG1YR43IOYPGlcCL1AeOJw5mQmIUbhU1+SvVYWXBOmD8Sr
 bvNHMPlyzJhCyh2fcPq1ps0T8QOrVgk6a5Jnxc9ijdN0cM3p5lPSmI9wF
 +2Rq/C0rZnuRGNuYairkDsAamftEE5Ax3nO67ueZLGFhstDiS1oi8XgaC
 K6IoParQUn2otuR4csicBg3gIYv0tp4TZ8SWj9HtjFYhcBcwwQaOV4q7R
 Any1pJV+l9Z5+XkNw4SB7x58Lqkbjj6Pv5eE4OuyLDlZ/LtpfBGiLgovm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373588069"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="373588069"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:55:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670533897"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="670533897"
Received: from tleibov-mobl.ger.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.214.199.216])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:55:17 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: Intel: soc-acpi: add MTL AIC SoundWire
 configurations
Date: Thu, 10 Nov 2022 16:54:32 -0600
Message-Id: <20221110225432.144184-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
References: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jairaj Arava <jairaj.arava@intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

Add support to the following daughter card:

SDW0: MX98373 Speaker
SDW2: ALC5682 Headset

Share same driver data used by sof_sdw driver for mtlrvp.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 36c361fb28a4d..b1a66a0f68181 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -39,6 +39,20 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -48,6 +62,45 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device mx8373_0_adr[] = {
+	{
+		.adr = 0x000023019F837300ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "Left"
+	},
+	{
+		.adr = 0x000027019F837300ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "Right"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt5682_2_adr[] = {
+	{
+		.adr = 0x000221025D568200ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt5682"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr rt5682_link2_max98373_link0[] = {
+	/* Expected order: jack -> amp */
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt5682_2_adr),
+		.adr_d = rt5682_2_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(mx8373_0_adr),
+		.adr_d = mx8373_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -84,6 +137,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = rt5682_link2_max98373_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-sdw-rt5682-l2-max98373-l0.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
-- 
2.34.1

