Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D93564315
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jul 2022 00:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C080D16AE;
	Sun,  3 Jul 2022 00:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C080D16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656801237;
	bh=cGLiC8mmOC+hPN2iurZ2+B4LWJ9RFal0ibK69bgVPuo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A3xbk/xLXdON0lpYu0cbW9FoxybHYE3gnFDMVWqQkm8JlnUxZyQnt7SqpRy+7P1aC
	 7C1CG+W8U6EWbBEF3PiSo/gZuaztBX3FH8+D2KJ2YqaZg6z2NfsTOqhHQuJNFUx45E
	 KIdxpKse2cdeOslZVbY2GKo0mW34zasZb0I6i2CY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF34F8019B;
	Sun,  3 Jul 2022 00:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70ACEF8032D; Sun,  3 Jul 2022 00:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C7EF8019B
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 00:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C7EF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ARfMW6S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656801170; x=1688337170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cGLiC8mmOC+hPN2iurZ2+B4LWJ9RFal0ibK69bgVPuo=;
 b=ARfMW6S5B+BR2AONxCqTF0+6p5HFtrZUK1kswnuGsyELbN0A2gXOAiSR
 qgIvjajEJKBlwMdQYPaOu19jEkTYpZA739xizWyYzh+Wv9vPYB2ZQKvRO
 PdD0cRPY8jnbnoXV5ngt/Pwl8Xgpsp3CyknOTQILGmcXG54dcg5dv+rkW
 YngmqP1meBB0Rv33P/24dWonoMA9LRFDiTg3MmIAa5YCWftCWv3jEtTuw
 szKVqisSILEPiXgdSLDejIFCzB5KOL/EtljUdcauE9USJeYexryrf+hBF
 xUc8OjyTJDN1UtiUPgyr/DPEorI2m1XBr7xd0m45XCQSL/rwaJJE6WDNT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="344558880"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="344558880"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2022 15:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="838434018"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2022 15:32:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5F52711D; Sun,  3 Jul 2022 01:32:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Date: Sun,  3 Jul 2022 01:32:43 +0300
Message-Id: <20220702223243.51364-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

device_get_match_data() in ACPI case calls similar to acpi_match_device() API.
Hence there is no need to duplicate the call. Just check what the former
returns.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/catpt/device.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 85a34e37316d..21856a394c3d 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -12,13 +12,14 @@
 // helping backtrack its historical background
 //
 
-#include <linux/acpi.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <sound/intel-dsp-config.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
@@ -244,8 +245,8 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	id = acpi_match_device(dev->driver->acpi_match_table, dev);
-	if (!id)
+	spec = device_get_match_data(dev);
+	if (!spec)
 		return -ENODEV;
 
 	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
@@ -254,10 +255,6 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	spec = device_get_match_data(dev);
-	if (!spec)
-		return -ENODEV;
-
 	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
 		return -ENOMEM;
-- 
2.35.1

