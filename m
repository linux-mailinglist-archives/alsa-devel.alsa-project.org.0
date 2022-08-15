Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174FF593380
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99B21663;
	Mon, 15 Aug 2022 18:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99B21663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660582219;
	bh=7CtIoJsTfO46HEjok6ZWOpFCg+lRcf2v9iBURRJfdtI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCPC9PL9SRD1AdSIMaa21TuodYDVMZ9Q3T/sQhRUhmF+hlZwCwuql8JYJuaN/hIYv
	 a9FLOzPJ35tvkShv6LwZMne0HA5f4ZjgGMyk5uy0zfk9JTgTzrvBEDGTdYnWS7FYXA
	 uWN+qo2e0H91HnsG+SGu9DgcFTzlHPti09FPqwTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68040F80125;
	Mon, 15 Aug 2022 18:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC052F80552; Mon, 15 Aug 2022 18:48:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E99F80271
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E99F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gyg7rj9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660582105; x=1692118105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7CtIoJsTfO46HEjok6ZWOpFCg+lRcf2v9iBURRJfdtI=;
 b=gyg7rj9PYrvlaZN5ocBuiU0NjXfQa4Tpa4+wQ4b6kmHUP3ZYbgcZsMov
 fZYQYb0KUArhDnHFinlEJSa6Sg6BxApq0wCt5jbG/3OmZZ2fjyvTDPOyj
 KHxRgmaNsltAiFIRUC8I5KHO7lKC2et2OVxTj1BOSK2aWvXaM6JAMrBy5
 Z5V10ex/qeUhhsYzpmpyrJvpCQGHaavRTfiOCtwdvx2dOI95WyvBjiLhB
 hnCdaSWUHJF+icxUNI8WpSXg0DfZgZhiNvkZd/4nGlE3sMtL4jeYd4UrK
 5Rvql16onRuSPBoe+ASzBT2bJbwSYtO1P9A7nlzORHxKgctr8XhHhYc5g A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="289570717"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="289570717"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 09:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="582946880"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 09:48:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
Date: Mon, 15 Aug 2022 18:58:17 +0200
Message-Id: <20220815165818.3050649-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815165818.3050649-1-cezary.rojewski@intel.com>
References: <20220815165818.3050649-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, kai.vehmanen@linux.intel.co,
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

catpt-driver does not make use of most of the fields found in the
descriptor table and is the sole user of haswell machines list. Move the
tables to local directory and clean them up so it's clear what's
actually used by the solution.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |  2 +-
 sound/soc/intel/catpt/device.c | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index ded903f95b67..d2ca710ac3fa 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -23,7 +23,7 @@ config SND_SOC_INTEL_CATPT
 	depends on ACPI || COMPILE_TEST
 	depends on DMADEVICES && SND_DMA_SGBUF
 	select DW_DMAC_CORE
-	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_SOC_ACPI if ACPI
 	select WANT_DEV_COREDUMP
 	select SND_INTEL_DSP_CONFIG
 	help
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index d48a71d2cf1e..d5d08bd766c7 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -22,7 +22,6 @@
 #include <sound/intel-dsp-config.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include <sound/soc-acpi-intel-match.h>
 #include "core.h"
 #include "registers.h"
 
@@ -310,8 +309,36 @@ static int catpt_acpi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct snd_soc_acpi_mach lpt_machines[] = {
+	{
+		.id = "INT33CA",
+		.drv_name = "hsw_rt5640",
+	},
+	{}
+};
+
+static struct snd_soc_acpi_mach wpt_machines[] = {
+	{
+		.id = "INT33CA",
+		.drv_name = "hsw_rt5640",
+	},
+	{
+		.id = "INT343A",
+		.drv_name = "bdw_rt286",
+	},
+	{
+		.id = "10EC5650",
+		.drv_name = "bdw-rt5650",
+	},
+	{
+		.id = "RT5677CE",
+		.drv_name = "bdw-rt5677",
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
@@ -326,7 +353,7 @@ static struct catpt_spec lpt_desc = {
 };
 
 static struct catpt_spec wpt_desc = {
-	.machines = snd_soc_acpi_intel_broadwell_machines,
+	.machines = wpt_machines,
 	.core_id = 0x02,
 	.host_dram_offset = 0x000000,
 	.host_iram_offset = 0x0A0000,
-- 
2.25.1

