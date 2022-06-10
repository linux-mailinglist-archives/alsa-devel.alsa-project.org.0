Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D4546F67
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 23:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829051EF3;
	Fri, 10 Jun 2022 23:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829051EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654897535;
	bh=MIZLVPIdD/t/MOgqroQ8YkEUIe8BkZUcVDaBrhq8F7Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p5quJtEAFMT5Z1+CD3x/5GRNRRFmla4ppWesATEKcBq0cekODAm6DhEUkDTjWwlgs
	 u91MjfkrgwESl+lBXYOYn8dDchuLy/Ho7NSYRgCgAaGA59u7IWSOP1ImBOVz0ao7FY
	 ypTyJXI9clIkPMlp5KNqq62r2yWjduPtR5XOmt/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 051C0F804D2;
	Fri, 10 Jun 2022 23:44:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD63F804CF; Fri, 10 Jun 2022 23:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ADAFF804DA
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 23:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ADAFF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VNpVfZHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654897477; x=1686433477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MIZLVPIdD/t/MOgqroQ8YkEUIe8BkZUcVDaBrhq8F7Q=;
 b=VNpVfZHTgJfdjWZG5L5680hUOZdNYs+nipvRa2Igf+R3KZ2AwWyXKj5M
 2VKmcFSYZqmI0tVzEexUMQMCaoAoFYw4TIPoM7eAhYD3mJN/pJn+ZMgcQ
 wxVJw4PyWtCEymhdV80Ty75yo3gTmPuNf8jXUUW2n+ynLyX1bm9+TPj/0
 Bb0B+4fb6duaowt/0FVdKkmlDHuj5ukQIP/vDKSOYm1opWzjCXzRHI6Lc
 /i73qDiSJDekqw4OqkU9SPrGxqlmLtvqFeoRkw7xTz/yfYGf8ng9LUMtZ
 6EzdHRI9Ia0T4o4igRwLu/IDx7/6BigOA07SEg8LAEYCutqcq49JUoOX3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="260874505"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="260874505"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 14:44:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="711108831"
Received: from andrewri-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.126.97])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 14:44:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: intel: sof_sdw: add RT711 SDCA card for MTL platform
Date: Fri, 10 Jun 2022 16:44:15 -0500
Message-Id: <20220610214415.42942-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Uday M Bhat <uday.m.bhat@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

Enable on-board rt711 based sound card for MTL RVP.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  8 +++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 31 +++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 77af3a7655c44..d23846572543b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -315,6 +315,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	/* MeteorLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_mtlrvp"),
+		},
+		.driver_data = (void *)(RT711_JD1 | SOF_SDW_TGL_HDMI),
+	},
 	{}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index cc594b27e03be..74d3b82f8d35c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -15,6 +15,31 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_machines);
 
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
+};
+
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr mtl_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -36,6 +61,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt711.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
-- 
2.34.1

