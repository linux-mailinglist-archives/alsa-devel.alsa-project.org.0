Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81005520356
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 19:11:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E27818F7;
	Mon,  9 May 2022 19:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E27818F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652116286;
	bh=9AdV0n94HVlFnbbxYfPaMxIQt8asvbfvtYpOnrLIhu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojcJqK8IKz4S1qrMrux6kcUGReo7hSJ/yQlb/BkBtSWQ+WpKxNa/T/FoRldnIAYQp
	 uH62LaDXvaw95KMcJK3wSrxexNwi3RqeuzZw9krRppLK8zn07mSLf1QfRd5tbptqfo
	 OKaTaGeGvYL7joKXPFWLeLZ/ODrCgy2NMUCeQEKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96223F802E3;
	Mon,  9 May 2022 19:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A56F80510; Mon,  9 May 2022 19:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 957FEF802E3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 19:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 957FEF802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DDNIhwVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652116192; x=1683652192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9AdV0n94HVlFnbbxYfPaMxIQt8asvbfvtYpOnrLIhu8=;
 b=DDNIhwVQZ4YlCczMY3OAhcKAZB+dPzoCEtL3+d71kcw90sL5dPIWnf/T
 WsPwHL5taJCTdaG8N3hyTIGtVwdxWApcbt4do6AbJuGMMvzb8V6QIoDqR
 o3HV0WNQkbwoSBxawN/+R9M5Jkim7NQTQZjLjSxK3lgfHhjomRFPgcInf
 UuRRnhOauxvbFKVx0o1g6L5R50tUgPyqnyhe/7V2+LsWGlTBLEVmEZRNG
 8Ub+S4byP4eDnUoET4EMjr+Gqz1KFofhx7wE+jGL4/WH+OMQU10Qu+FAe
 bTT1odIC/d0dTH+y1qtA6ihVIv2UEBNzyEXYAQxc5xtTEDWxXEF8JBppe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266701903"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="266701903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592909317"
Received: from mkarkhan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.61.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: sof_ssp_amp: fix no DMIC BE Link on
 Chromebooks
Date: Mon,  9 May 2022 12:09:21 -0500
Message-Id: <20220509170922.54868-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
References: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The SOF topology supports 2 BE Links(dmic01 and dmic16k) and each
link supports up to four DMICs. However, Chromebook does not implement
ACPI NHLT table so the mach->mach_params.dmic_num is always zero. We
add a quirk so machine driver knows it's running on a Chromebook and
need to create BE Links for DMIC.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 8f5b9ebbe8287..675ade8187b65 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
@@ -78,6 +79,16 @@ struct sof_card_private {
 	bool idisp_codec;
 };
 
+static const struct dmi_system_id chromebook_platforms[] = {
+	{
+		.ident = "Google Chromebooks",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+		}
+	},
+	{},
+};
+
 static const struct snd_soc_dapm_widget sof_ssp_amp_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
@@ -371,7 +382,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_links;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
-	int dmic_be_num, hdmi_num = 0;
+	int dmic_be_num = 0, hdmi_num = 0;
 	int ret, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -383,7 +394,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 
 	mach = pdev->dev.platform_data;
 
-	dmic_be_num = mach->mach_params.dmic_num;
+	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
+		dmic_be_num = 2;
 
 	ssp_codec = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
-- 
2.30.2

