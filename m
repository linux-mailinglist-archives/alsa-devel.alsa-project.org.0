Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE554829B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A21185D;
	Mon, 13 Jun 2022 11:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A21185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111290;
	bh=6JtxhdVF68FxjUQnyy4IHfIL6UuGS31kUjgIV/EBCks=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFLaFzEme4RJDBRML/gCeVLOvqyrgOg4wtJrcDSxMMGewYoQAQkRQvvpDZbQGgxwJ
	 kyCf7YJ6oBYRSFsRRki2MIKnNNTC7rmKAJtKd8+9Jxxo6LlNp0T7DFx4jad36supIJ
	 5GWQu6FEJILAh8KsT/ytPF2du/3pehcm7uLTqN64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47EA8F8052D;
	Mon, 13 Jun 2022 11:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB18F8053D; Mon, 13 Jun 2022 11:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62319F804F1
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62319F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XY3pOrrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111141; x=1686647141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JtxhdVF68FxjUQnyy4IHfIL6UuGS31kUjgIV/EBCks=;
 b=XY3pOrrcGMB1fIVS1RvvjkURFXgzJVI0+H+VSE8Hp5+jNRjjI2L2laYj
 vxb8Gu+4S0+mi1m2U/AZa9lN+ww7EZX3oa7Lh/DBeYj6REkyThhPuxw4p
 7xxrHXvXabOgBCEpNAD4hqUBU9BN7m4dUXUu6qkksX3NOkAn1bxrDbOss
 OvVbOrOnD6Ma4lw0wbRu5F+8rLO/4z7l4GX031XG7oyUnKYuuvlmEi01G
 Do6E4IXHgD8Hu35Fr2seZBdhfl5rUXP2Hz845q7Yb9XBQxbjF94/x/mbf
 NQvZ47Dm3itcm8K20fNzFxoL74y1OgHv9vd81iWlWDmiGSu2JzajRZ3ZB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753783"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753783"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639625666"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 03/17] ASoC: Intel: hsw_rt5640: Reword driver name
Date: Mon, 13 Jun 2022 11:15:32 +0200
Message-Id: <20220613091546.1565167-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613091546.1565167-1-cezary.rojewski@intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
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

