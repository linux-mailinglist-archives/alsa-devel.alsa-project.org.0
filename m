Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D31477137
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 067911EFB;
	Thu, 16 Dec 2021 12:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 067911EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655941;
	bh=b4fOgYkgfI/QPD5h48SZB39Mp6dXojW/25RhRhJnxuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiPF01r7Wm1zhv5ylUVm+GXNtaZuwKt7YMBv+c+7xmiCDaSuiSSiqyJDDjgO3N3i3
	 DxHwaCJuDUsoPZChJFtgaYvshJsAOyzZgPYPaXRbi0TFnvRfcfdjOlqPLcZCn3wK6P
	 uiMCeFV2+kqhcu8QyLW2X9df43S//4I4SuYDIPSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A34FF80519;
	Thu, 16 Dec 2021 12:56:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E982F8050F; Thu, 16 Dec 2021 12:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31E25F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E25F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UpjC6vQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639655770; x=1671191770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4fOgYkgfI/QPD5h48SZB39Mp6dXojW/25RhRhJnxuU=;
 b=UpjC6vQZhbEFV1p8gJVLQdPBvdA9PT+7+33G2YFJZquJLPKiGsqGjlIS
 mMtBEy7lOYLvPjv5kELCJM/U1hT2TSW+Lt8BETklizBF9trAh3zOE3DFZ
 8BbOsEzpvnOcikq6ydRpup+u7TLOkrqfd4lvSdFwNrc1MwL8NlvB6iEWg
 J+ZVlYuLtPLso/q0yPhdBSFEC4K1PU4n3bMUqMPm25Z41PkYJRD/VfkAO
 wgLBkRb0Zh3FCzGVMOIfQvCjMXwwU32cE8HL6IBFkiGvlIWQvpwL69J0L
 kbR6PzHR7xIpXgwYtD/jabDt9UJMX/nh/8P6GAeTSNymF9rYppLgxfUiY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239692046"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239692046"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506248449"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 03:56:03 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
Date: Thu, 16 Dec 2021 12:57:42 +0100
Message-Id: <20211216115743.2130622-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216115743.2130622-1-cezary.rojewski@intel.com>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
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

catpt-driver does not make use of most of the fields found in the
descriptor table and is the sole user of haswell machines list. Move the
tables to local directory and clean them up so it's clear what's
actually used by the solution.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |  2 +-
 sound/soc/intel/catpt/device.c | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index f3a4a907b29d..0423009a186e 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -23,7 +23,7 @@ config SND_SOC_INTEL_CATPT
 	depends on ACPI || COMPILE_TEST
 	depends on DMADEVICES && SND_DMA_SGBUF
 	select DW_DMAC_CORE
-	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_SOC_ACPI
 	select WANT_DEV_COREDUMP
 	select SND_INTEL_DSP_CONFIG
 	help
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 85a34e37316d..81c7cb94b68b 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -22,7 +22,6 @@
 #include <sound/intel-dsp-config.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include <sound/soc-acpi-intel-match.h>
 #include "core.h"
 #include "registers.h"
 
@@ -313,8 +312,36 @@ static int catpt_acpi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+struct snd_soc_acpi_mach lpt_machines[] = {
+	{
+		.id = "INT33CA",
+		.drv_name = "haswell-audio",
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach wpt_machines[] = {
+	{
+		.id = "INT343A",
+		.drv_name = "broadwell-audio",
+	},
+	{
+		.id = "10EC5650",
+		.drv_name = "bdw-rt5650",
+	},
+	{
+		.id = "RT5677CE",
+		.drv_name = "bdw-rt5677",
+	},
+	{
+		.id = "INT33CA",
+		.drv_name = "haswell-audio",
+	},
+	{}
+};
+
 static struct catpt_spec lpt_desc = {
-	.machines = snd_soc_acpi_intel_haswell_machines,
+	.machines = lpt_machines,
 	.core_id = 0x01,
 	.host_dram_offset = 0x000000,
 	.host_iram_offset = 0x080000,
@@ -329,7 +356,7 @@ static struct catpt_spec lpt_desc = {
 };
 
 static struct catpt_spec wpt_desc = {
-	.machines = snd_soc_acpi_intel_broadwell_machines,
+	.machines = wpt_machines,
 	.core_id = 0x02,
 	.host_dram_offset = 0x000000,
 	.host_iram_offset = 0x0A0000,
-- 
2.25.1

