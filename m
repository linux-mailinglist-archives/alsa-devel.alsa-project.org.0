Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63095655EF7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 02:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE47855A2;
	Mon, 26 Dec 2022 02:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE47855A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672016670;
	bh=JjFSG1BDIJv1r04bLzwhzg7wvOZH5XSDf1NV+bPK0JY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QQhKstrk2cHjny3fxBivnCIsvy5vWdx76jrH/UCNDKqcW7xvfeke1ib+C0tZ6XZ7m
	 VRimUpidmXo2NecUrsMk23x8+q7RR9daG5MDu6cScgkF1sh8WQ/5EfADvhXF4Af82O
	 rM+qPbBWvvMcaSgluAnOpzH++OMvq03yIDjYRBrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB999F8051C;
	Mon, 26 Dec 2022 02:03:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D901FF804B0; Mon, 26 Dec 2022 02:03:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F356F804B0
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 02:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F356F804B0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MxfeSM6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672016585; x=1703552585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JjFSG1BDIJv1r04bLzwhzg7wvOZH5XSDf1NV+bPK0JY=;
 b=MxfeSM6DYxdGRoooRuZ9JPrR/D8RrZn6WZF/rWX2MJpHhEUr9rNyJ8P2
 0yYVcSXIVRpgLghb6ifp/A7VCFZ21wOF3mBTnC/mJtdkcudPPHyI9kdGu
 odESfsMjxaQ/UfDpYkDuTCw6/7jb1yZeOsCvW7wfdR3BzV9XoZhvKIots
 2gULdDSbAGs1YeBlwEktJdlRtLFbQ3JsyMMdLy6LOT+N+JM5G0CztQDvK
 8Jcv8plmYlseOTMGzEvttlfJCuf2eRLeIZchPqCV7G//HCmBGFnMqSVU9
 Mqz0llUcOtvXqVyHf11noOJn2SFBGGPTbBTAbOlYNLkao29YCSfmv0qEr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="320591413"
X-IronPort-AV: E=Sophos;i="5.96,274,1665471600"; d="scan'208";a="320591413"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2022 17:03:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="741354821"
X-IronPort-AV: E=Sophos;i="5.96,274,1665471600"; d="scan'208";a="741354821"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2022 17:02:57 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi: add configuration for variant of
 0C11 product
Date: Mon, 26 Dec 2022 09:09:17 +0800
Message-Id: <20221226010917.2632973-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221226010917.2632973-1-yung-chuan.liao@linux.intel.com>
References: <20221226010917.2632973-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Zorro.Zhang@dell.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Gongjun Song <gongjun.song@intel.com>

Support configuration with SoundWire RT1318 amplifiers on link1 and
link2, and RT711 on link0 for headphone/headset. This product does
not support local microphones.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index c70d85bfedbf..07f96a11ea2f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -246,6 +246,25 @@ static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1318_link12_rt71
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1318_link12[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_group1_adr),
+		.adr_d = rt1318_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1318_2_group1_adr),
+		.adr_d = rt1318_2_group1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr rpl_sdw_rt1316_link12_rt714_link0[] = {
 	{
 		.mask = BIT(1),
@@ -290,6 +309,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1318-l12-rt714-l3.tplg",
 	},
+	{
+		.link_mask = 0x7, /* rt711 on link0 & two rt1318s on link1 and link2 */
+		.links = rpl_sdw_rt711_link0_rt1318_link12,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1318-l12.tplg",
+	},
 	{
 		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
 		.links = rpl_sdw_rt1316_link12_rt714_link0,
-- 
2.25.1

