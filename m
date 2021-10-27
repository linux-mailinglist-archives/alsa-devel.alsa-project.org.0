Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A843BF8B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B234F16C1;
	Wed, 27 Oct 2021 04:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B234F16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301278;
	bh=yFow6GM19+rAA4GgF6k8+OHcsICxLsaP/qHg5zbXb3U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nt+DVGBg12tLWBpbqoKBntefYc7yyp7tuxcnzi1bucInu9gKbyFuleo1wt9wJL8D4
	 FNL6oP/PYuYFm2nTQ5vyp6gk4++YtyDaLi15NnEz36drUjfOaG117pv2pSC9by2QdF
	 KAVg6PWK7tlHoqi01Z1hc2RJNc29LDu5CC3DMLxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BABF804F2;
	Wed, 27 Oct 2021 04:19:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE036F804ED; Wed, 27 Oct 2021 04:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B422F8025A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B422F8025A
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229412"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229412"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446309"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 07/10] ASoC: intel: sof_sdw: remove SOF_RT715_DAI_ID_FIX quirk
Date: Wed, 27 Oct 2021 10:18:21 +0800
Message-Id: <20211027021824.24776-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

SOF_RT715_DAI_ID_FIX is not used anywhere. Remove it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 23 +++++------------------
 sound/soc/intel/boards/sof_sdw_common.h |  1 -
 2 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3fb600083225..c59e0a553ffb 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -36,8 +36,6 @@ static void log_quirks(struct device *dev)
 	if (SOF_SSP_GET_PORT(sof_sdw_quirk))
 		dev_dbg(dev, "SSP port %ld\n",
 			SOF_SSP_GET_PORT(sof_sdw_quirk));
-	if (sof_sdw_quirk & SOF_RT715_DAI_ID_FIX)
-		dev_dbg(dev, "quirk SOF_RT715_DAI_ID_FIX enabled\n");
 	if (sof_sdw_quirk & SOF_SDW_NO_AGGREGATION)
 		dev_dbg(dev, "quirk SOF_SDW_NO_AGGREGATION enabled\n");
 }
@@ -64,8 +62,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "09C6")
 		},
-		.driver_data = (void *)(RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX),
+		.driver_data = (void *)RT711_JD2,
 	},
 	{
 		/* early version of SKU 09C6 */
@@ -74,8 +71,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0983")
 		},
-		.driver_data = (void *)(RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX),
+		.driver_data = (void *)RT711_JD2,
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -84,7 +80,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "098F"),
 		},
 		.driver_data = (void *)(RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
 	{
@@ -94,7 +89,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0990"),
 		},
 		.driver_data = (void *)(RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
 	/* IceLake devices */
@@ -126,8 +120,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3E")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX),
+					RT711_JD2),
 	},
 	{
 		/* another SKU of Dell Latitude 9520 */
@@ -137,8 +130,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3F")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX),
+					RT711_JD2),
 	},
 	{
 		/* Dell XPS 9710 */
@@ -149,7 +141,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
 	{
@@ -160,7 +151,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
 	{
@@ -221,7 +211,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
 	{
@@ -231,8 +220,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A45")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_RT715_DAI_ID_FIX),
+					RT711_JD2),
 	},
 	/* AlderLake devices */
 	{
@@ -243,7 +231,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2_100K |
 					SOF_SDW_TGL_HDMI |
-					SOF_RT715_DAI_ID_FIX |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c6200aa14089..e2457738a332 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -43,7 +43,6 @@ enum {
 #define SOF_SDW_PCH_DMIC		BIT(6)
 #define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 7)
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
-#define SOF_RT715_DAI_ID_FIX		BIT(13)
 #define SOF_SDW_NO_AGGREGATION		BIT(14)
 
 /* BT audio offload: reserve 3 bits for future */
-- 
2.17.1

