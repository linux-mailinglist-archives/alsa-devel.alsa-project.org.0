Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DE551542
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9537618D8;
	Mon, 20 Jun 2022 12:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9537618D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719554;
	bh=6JtxhdVF68FxjUQnyy4IHfIL6UuGS31kUjgIV/EBCks=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jN/6PIQejpouj9OQcvvXyVbL0hrpnUbf7ce3fbj6xH+ifqT7O4+J8aaxFNHgaxyQQ
	 W0t7LJHS8lW6iI/amBChEWZWimbhTKFMN4sFCVVzrKGTOguCffeZ/CvyoWCdbB4WhQ
	 fUX5CSElHzeyhkd5m2rpn8O4q+hDQW8699DQ1ehc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37218F80539;
	Mon, 20 Jun 2022 12:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05742F80538; Mon, 20 Jun 2022 12:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1FB2F8052E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1FB2F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iUHlCfc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719437; x=1687255437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JtxhdVF68FxjUQnyy4IHfIL6UuGS31kUjgIV/EBCks=;
 b=iUHlCfc1AA7Gbw1VzJWEgRnE8hSz/lvgCvpAqsbL2/pSSgUCDPWCelBo
 Cs8zccHqaeO8/jvZxzyJdHzfLm3Cmzk+rMicboArxkw41oaDoMXDAjwVb
 wlTT2MMTGxXOXySLQtwq8FDpWxIneX4owUrAOdRdU/VdV7Ogl4aI/GUmN
 dc3ZSJtLRAxHgLr/56KwIhjhGG9ucfIouQ78qlo+s5AY0nCi0L2gOjOjm
 7l7CREQ4IGe9+eUR9t/CLwafV8eZZ6KaFsshSVucdY2OeoenI60h184uR
 bqztnJDSN2aTyvLn02iwD0/ZVbjl49OCIJiQ37bFubA0Ep/Hl1eg5toK6 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180662"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046267"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:03:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 03/17] ASoC: Intel: hsw_rt5640: Reword driver name
Date: Mon, 20 Jun 2022 12:13:48 +0200
Message-Id: <20220620101402.2684366-4-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/hsw_rt5640.c                   | 4 ++--
 sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index b51ce8d0ca22..a096453bf1df 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -188,7 +188,7 @@ static int hsw_rt5640_probe(struct platform_device *pdev)
 static struct platform_driver hsw_rt5640_driver = {
 	.probe = hsw_rt5640_probe,
 	.driver = {
-		.name = "haswell-audio",
+		.name = "hsw_rt5640",
 		.pm = &snd_soc_pm_ops,
 	},
 };
@@ -199,4 +199,4 @@ module_platform_driver(hsw_rt5640_driver)
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
 MODULE_DESCRIPTION("Intel SST Audio for Haswell Lynxpoint");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:haswell-audio");
+MODULE_ALIAS("platform:hsw_rt5640");
diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
index 0441df97b260..4e00f8f6c521 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
@@ -12,7 +12,7 @@
 struct snd_soc_acpi_mach snd_soc_acpi_intel_haswell_machines[] = {
 	{
 		.id = "INT33CA",
-		.drv_name = "haswell-audio",
+		.drv_name = "hsw_rt5640",
 		.fw_filename = "intel/IntcSST1.bin",
 		.sof_tplg_filename = "sof-hsw.tplg",
 	},
@@ -41,7 +41,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[] = {
 	},
 	{
 		.id = "INT33CA",
-		.drv_name = "haswell-audio",
+		.drv_name = "hsw_rt5640",
 		.fw_filename = "intel/IntcSST2.bin",
 		.sof_tplg_filename = "sof-bdw-rt5640.tplg",
 	},
-- 
2.25.1

