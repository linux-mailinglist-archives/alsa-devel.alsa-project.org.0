Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F3B644DEE
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 22:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497381816;
	Tue,  6 Dec 2022 22:26:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497381816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670362016;
	bh=mes4WBqKpcJWLpKH1Ri5BdwLPfM/KSRAQp9/F4Hq8YQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUkvRUWNQ/zJ34oFNhpMCgOqeI2OZWOedwA44zWcODK/LhijNHUUHzDvxqVhnLmMQ
	 HqEUyHMWxE/ax4yZcObVWfFNdDNf39RzWxnuaa63nLG9SvrZO0TMVQGfklN2SGICZU
	 Kt3T69HYNuCMfeCCc8T9JUIfQD//8ltyt6Ng0hdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F28FF80155;
	Tue,  6 Dec 2022 22:25:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADFF8F80246; Tue,  6 Dec 2022 22:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE6EF80246
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 22:25:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE6EF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RWrEikRU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670361932; x=1701897932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mes4WBqKpcJWLpKH1Ri5BdwLPfM/KSRAQp9/F4Hq8YQ=;
 b=RWrEikRUdQ5s+PAZCifDiCbcLflbVB4T/uARK5V1E9/EWDnPihRsYnpa
 gVtW+CwADgDK+4ZpOO6fF3LnBLdAwlYgcurADQ+6sbK07/vb76RDHrTJL
 mo7KGcRNdoEkOG0ZpWnvgs5IHgCgeu32rt8ByTnnBm31PeVFyYjExyOfl
 KdO8ban/zKTkwX/EOUGtRdAW2dEnvP2d/Pi/mqzSyEjFf20Ik+aOnBPtt
 9hXYD3pk8v+CVqspGTfb5btPeKWjKhIoe1Zk/+ohpljoY9OcGYPicB/Ca
 HxM5BZ+ffI2pXZfrGlS0wYICuV48vECwmyGyt8qr6ba0BWsocRkF5U7lZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300154672"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="300154672"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="646362656"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="646362656"
Received: from rwwalthe-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.124])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: sof_rt5682: add jsl_rt5682 board config
Date: Tue,  6 Dec 2022 15:25:05 -0600
Message-Id: <20221206212507.359993-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
References: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

This configuration supports JSL boards which implement ALC5682I-VD/VS
on SSP0 port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 6 ++++++
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4a2f91249b10c..2eabc4b0fafa4 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1104,6 +1104,12 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "jsl_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index b95c4b2cda947..f5c7e1bbded06 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -78,6 +78,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
+	{
+		.comp_ids = &rt5682_rt5682s_hp,
+		.drv_name = "jsl_rt5682",
+		.sof_tplg_filename = "sof-jsl-rt5682.tplg",
+	},
 	{
 		.id = "10134242",
 		.drv_name = "jsl_cs4242_mx98360a",
-- 
2.34.1

