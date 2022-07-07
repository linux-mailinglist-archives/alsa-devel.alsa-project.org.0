Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34356A20A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06B51651;
	Thu,  7 Jul 2022 14:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06B51651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197212;
	bh=s8nu2trcXAU6d4rmDzjfp9vfQkXb4kOjxyApbM6NVHw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oT9OvKKjpJiZhs0SYC0k5GnrM+PUecjl5gz90QrawCB8u5LorweJdpYYHBNVgcyhY
	 mb9I0ZPhkyLLV07bdCj5wJBAyqDCt77APRUvj0F2C72LmP0vsdGPBoGw8imFIyLKhj
	 Pc5fHLFcT8YTOLI0Pt+xLKkXDqPWrc0nUyigeefU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA484F8053B;
	Thu,  7 Jul 2022 14:32:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C37F80539; Thu,  7 Jul 2022 14:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3153F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3153F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NhyAzxH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197117; x=1688733117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8nu2trcXAU6d4rmDzjfp9vfQkXb4kOjxyApbM6NVHw=;
 b=NhyAzxH4AzLb8n+4WbI10rFupLld6VQNjFli13i2/HQXvK3BGbZV5hqA
 MO0UwfZJsqO5k1nbhdU6Fhu5K21oE/LzvhcWesE3T5hXPbS1i41hGv1ho
 dljEoLZglSimA4XL683SPfDtv2WjAvhkwaojH7QfigBiQiX+GZmItybva
 AHEaP50RIz2eq+JRkqAbD6uspeLUDzqfMwVPdhdm0dTY1/m/ej+UlQ+Rw
 ehFeNfzzbSJrNRil34mtL5cSqx1pMe2BSTJL/x6YL6YnKs3N6RyHc56zx
 5LZzWSze+57akHa8Sb6DHZHX7ikRWW7RH0kSdHmjL3JUtyenr9IJtYnKx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805882"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805882"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720550"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 01/12] ASoC: Intel: avs: Register HDAudio ext-bus operations
Date: Thu,  7 Jul 2022 14:41:42 +0200
Message-Id: <20220707124153.1858249-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
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

With ASoC representation of HDAudio codec added, update bus initiazation
to complete it.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig    | 2 +-
 sound/soc/intel/avs/core.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index e5107a3ce16a..ded903f95b67 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -216,7 +216,7 @@ config SND_SOC_INTEL_AVS
 	depends on COMMON_CLK
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_TOPOLOGY
-	select SND_HDA
+	select SND_SOC_HDA
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_DSP_CONFIG
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 3a0997c3af2b..664f87c33e9d 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -23,6 +23,7 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
+#include "../../codecs/hda.h"
 #include "avs.h"
 #include "cldma.h"
 
@@ -356,7 +357,7 @@ static int avs_bus_init(struct avs_dev *adev, struct pci_dev *pci, const struct
 	struct device *dev = &pci->dev;
 	int ret;
 
-	ret = snd_hdac_ext_bus_init(&bus->core, dev, NULL, NULL);
+	ret = snd_hdac_ext_bus_init(&bus->core, dev, NULL, &soc_hda_ext_bus_ops);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1

