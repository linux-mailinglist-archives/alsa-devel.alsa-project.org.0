Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBEB564827
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jul 2022 16:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21D216B9;
	Sun,  3 Jul 2022 16:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21D216B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656859985;
	bh=1Swa9EyBO2RNDfjUjVHJNEs947l9uCAsdG7L2gwvtBE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d1OjSqzXNb+XCbxjbLgSIAPFO362tGjzdCM9fX6R3Bes+/LUnbrbSnU3v/9TBsbVk
	 T+6Ufa4D3DByJMm1sPIBs3RoLfm+1b5zOK7V1PaE4H5qpdwRuHGLx+M++z33liDVtY
	 7k2XRhirk1C9OuSPdEqn8lk61l+mxCCk3ku1xFuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C7E8F80254;
	Sun,  3 Jul 2022 16:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C2A1F80249; Sun,  3 Jul 2022 16:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE9CF80089
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 16:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE9CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Uil4KhNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656859918; x=1688395918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Swa9EyBO2RNDfjUjVHJNEs947l9uCAsdG7L2gwvtBE=;
 b=Uil4KhNCFZVoftgYaKxY0aawprQcpovzF99ikrRqSM3301jRb4EAEKLP
 AaaH1bm0G6n57Tx7WIv5YyXReZIloGsmugcSxXTbS+3E1TYiYy5bm3Pcx
 WCWQ1QqCfwILpiHtqprdB8tvEkMe/GPard6353aaa3W+HsEstRwf89387
 ms0kkpqZkz+MtpMngpgyF4C7UxHB8cYZuiYZDeFmDl89jBTlQXQEUDm0+
 eH2MnHvy/Jg/ZOtA9kcFhpAxUFfraBsrzs54KExmTckRnUaO9DPqfmCW+
 iioc6pfom8B3Av+6XRuOtCwaOvmeAK5GZlzQWP0TP+rIyGuh9xldHdeR4 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="281715571"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="281715571"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2022 07:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="838564919"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 03 Jul 2022 07:51:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 066E311D; Sun,  3 Jul 2022 17:51:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Date: Sun,  3 Jul 2022 17:51:52 +0300
Message-Id: <20220703145152.62297-1-andriy.shevchenko@linux.intel.com>
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

device_get_match_data() in ACPI case calls similar to acpi_match_device().
Hence there is no need to duplicate the call. Just assign what is in
the id->driver_data.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: dropped device_get_match_data() and rewrote commit message
 sound/soc/intel/catpt/device.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 85a34e37316d..2eeaeb962532 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -247,6 +247,7 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 	id = acpi_match_device(dev->driver->acpi_match_table, dev);
 	if (!id)
 		return -ENODEV;
+	spec = (const struct catpt_spec *)id->driver_data;
 
 	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
 	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
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

