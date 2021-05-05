Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F03742EC
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A3E1785;
	Wed,  5 May 2021 18:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A3E1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233358;
	bh=2TXMDc/1N+rHQTxo4OqHGjMeJyB4eF5//bFPDv5H4qc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTRgFihrhLpCWxjznNSBRU3RB4WhNMsPT23zKI9ezTYAnjUsnmKLtcYCthaGIUg30
	 W+4GK63+5EN4bIzJVpWMer7NZOnZPXTvSTp40rsHuv17GjiPMmAsAWgzzzRQz0IQJh
	 FkAsCDHWa673q995gspPUj01eoFL0CAkmNtLYXrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5912AF805C9;
	Wed,  5 May 2021 18:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A7AF805BB; Wed,  5 May 2021 18:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40D5BF8057A
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D5BF8057A
IronPort-SDR: nTDrTc3+ncwaQMhFX9fHnTnKccD8cIxG9+TbhC7LIOe76r8GiRmNmz+yXHCKfnIzeR2D4ZYgPU
 xyi1vh/icTFA==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219196"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219196"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:23 -0700
IronPort-SDR: Ziha49S2WR1YPjo27PAGRwJB6Bh6w6b+lHPVzXMUDaBVoYgZc+cv/wVQWKtEaC2U2OggQbgPWb
 1MskwDzCYcqA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800032"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/13] ASoC: Intel: sof_sdw: add support for Bluetooth offload
Date: Wed,  5 May 2021 11:36:59 -0500
Message-Id: <20210505163705.305616-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

This patch enables BT offload feature on TGL Volteer reference design.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 32 ++++++++++++++++++++++++-
 sound/soc/intel/boards/sof_sdw_common.h |  7 ++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d65e29ab70c3..9b32d729cc72 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -147,7 +147,9 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK),
+					SOF_SDW_FOUR_SPK |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -977,6 +979,9 @@ static int sof_card_dai_links_create(struct device *dev,
 	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num) ? 2 : 0;
 	comp_num += dmic_num;
 
+	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+		comp_num++;
+
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d", sdw_be_num, ssp_num,
 		dmic_num, ctx->idisp_codec ? hdmi_num : 0);
 
@@ -1162,6 +1167,31 @@ static int sof_card_dai_links_create(struct device *dev,
 		INC_ID(be_id, cpu_id, link_id);
 	}
 
+	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		int port = (sof_sdw_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+				SOF_BT_OFFLOAD_SSP_SHIFT;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
+		if (!name)
+			return -ENOMEM;
+
+		ssp_components = devm_kzalloc(dev, sizeof(*ssp_components),
+						GFP_KERNEL);
+		if (!ssp_components)
+			return -ENOMEM;
+
+		ssp_components->name = "snd-soc-dummy";
+		ssp_components->dai_name = "snd-soc-dummy-dai";
+
+		cpu_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
+		if (!cpu_name)
+			return -ENOMEM;
+
+		cpus[cpu_id].dai_name = cpu_name;
+		init_dai_link(dev, links + link_id, be_id, name, 1, 1,
+				cpus + cpu_id, 1, ssp_components, 1, NULL, NULL);
+	}
+
 	card->dai_link = links;
 	card->num_links = num_links;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index ea60e8ed215c..37ae3a19fa49 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -50,6 +50,13 @@ enum {
 #define SOF_RT715_DAI_ID_FIX		BIT(11)
 #define SOF_SDW_NO_AGGREGATION		BIT(12)
 
+/* BT audio offload: reserve 3 bits for future */
+#define SOF_BT_OFFLOAD_SSP_SHIFT	13
+#define SOF_BT_OFFLOAD_SSP_MASK	(GENMASK(15, 13))
+#define SOF_BT_OFFLOAD_SSP(quirk)	\
+	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
+#define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(16)
+
 struct sof_sdw_codec_info {
 	const int part_id;
 	const int version_id;
-- 
2.25.1

