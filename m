Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E818495692
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:04:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE3C52DE3;
	Fri, 21 Jan 2022 00:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE3C52DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642719865;
	bh=MQ7tRAEuDsU43Lwo9myEm8uJsKkl1M1kBamuKYy8aCo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RmxGx+UM4sPmdQymQmK5kR4LJ6mBQIRIzEP8gNms6pRy/QRYvXPmoqbJMcCr5msNp
	 B4996Gynv7UUjKfddj7f2PurTPFMkJA9Ja4pzg304HNezzjE+ONGh2TwQ2x3lmlTYU
	 CztZZnT2CXwAXOdmUI7vJhuC1aM7ljm0IH49BoBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0937CF8050F;
	Fri, 21 Jan 2022 00:02:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1BF9F8012E; Fri, 21 Jan 2022 00:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D1FFF800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D1FFF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Nx99iutc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642719761; x=1674255761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQ7tRAEuDsU43Lwo9myEm8uJsKkl1M1kBamuKYy8aCo=;
 b=Nx99iutcqTXA5WIg3MeyJOLSHzlLrYnk2kArcxmqOnYcWFpPCoQtl+8M
 H08sheNniVRYntWGRb3z5qzwqLS1kf+LXxQFdTVaoj1dwWLDW+XK37in6
 F8d+f9VrggEQVf7ZaRgey8HzQEaEL3gWWAuSN3wkHRfArjD4Xy0vRcCYl
 wnh4NilQK+xBqN/a+k6tnLa+/Ua/zwsdXIkE2eK3ePN843ZsOgt/0fDJw
 GpvelGnbnrDyymyNH0jVf+E+RNNEUcPZoU0Snr2dJDW3mF//d5lqeIv/V
 /5Rm6EZnhnwFQKsHCBhwy9JdXbMgzyaZGSFZ5t8ZWXCl51P+29Dz4jzyM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306232009"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="306232009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:02:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="533014797"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:02:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: sof_rt5682: Add support for platform without
 amplifier
Date: Thu, 20 Jan 2022 17:02:26 -0600
Message-Id: <20220120230226.175906-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
References: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Brent Lu <brent.lu@intel.com>
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

From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Add a board config adl_rt5682 to support alc5682 headset codec without
speaker amplifier. Follow Intel BT offload design by connecting
alc5682 to SSP0.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8391bea8ec79..70541caa7237 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1045,6 +1045,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "adl_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index f32bcb2b2e09..20257f547275 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -447,6 +447,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
 	},
+	{
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_rt5682",
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.25.1

