Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 240D955154E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B486BD8;
	Mon, 20 Jun 2022 12:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B486BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719651;
	bh=T2h+s71B1563L64v1UJRdMF3t5Ci6iyfmKwA7Y7EDQE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNsN58QsPsAHloNuRbg5ekg2SI9OKQ/HaItHkqEPy/YcAUhuLL7H/FaiYsIiw7hp0
	 XUWuS2W+kP0kEV9TIZF1lkAWmk3VA3yiBMtSYGjzZuR8EyRO/AepeYYFOK8VhQduQu
	 rQ/hIGDwHYbQiitPyssezSM5YFx3C+Y5cPgInuN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4E8F8057B;
	Mon, 20 Jun 2022 12:04:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF7DF80571; Mon, 20 Jun 2022 12:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F735F80568
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F735F80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BJm2ulnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719453; x=1687255453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T2h+s71B1563L64v1UJRdMF3t5Ci6iyfmKwA7Y7EDQE=;
 b=BJm2ulnHINMTMfpTR1rDnYF19Qrqv1C4Fjrk7preGJLnve/vRpH/WSg2
 /EavgaZHWtwaBBy7+yn5FNRUwtK7Z1r+J+16GUX4SKSZH7NeIvT6qd4t4
 UJVbnlxusoRq/fzbAosCmZno7xIHlKeRxv6hOwmgf0Xm63xZAIX8oqiC1
 h6CglaY1S0KLcyK39bFCHJmc+PazTC7mM8uP9OONiqxQYGPHcooJ2H3Pz
 +BILAsAt9xJ2egSiVi84zvm9iyFC9xYmlJ/LudMY1pVXfKBm8B+7LYNTz
 P3tBzBUBJaKH/WfVvTNlFbLI9EB7eUZsTWPLyxRIFCbybJ9lCdZmf/BEr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180714"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046361"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 10/17] ASoC: Intel: bdw_rt286: Reword driver name
Date: Mon, 20 Jun 2022 12:13:55 +0200
Message-Id: <20220620101402.2684366-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Align with other Intel boards naming convention and let the name
explicitly state which components are being connected.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c                    | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index f28341ec8eb3..26ec671a5a52 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -324,7 +324,7 @@ static struct platform_driver bdw_rt286_driver = {
 	.probe = bdw_rt286_probe,
 	.remove = bdw_rt286_remove,
 	.driver = {
-		.name = "broadwell-audio",
+		.name = "bdw_rt286",
 		.pm = &snd_soc_pm_ops
 	},
 };
@@ -335,4 +335,4 @@ module_platform_driver(bdw_rt286_driver)
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
 MODULE_DESCRIPTION("Intel SST Audio for WPT/Broadwell");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:broadwell-audio");
+MODULE_ALIAS("platform:bdw_rt286");
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index 4e00f8f6c521..cbcb649604e5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -23,7 +23,7 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_haswell_machines);
 struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 	{
 		.id = "INT343A",
-		.drv_name = "broadwell-audio",
+		.drv_name = "bdw_rt286",
 		.fw_filename =  "intel/IntcSST2.bin",
 		.sof_tplg_filename = "sof-bdw-rt286.tplg",
 	},
-- 
2.25.1

