Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4C8F471
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 21:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490F01678;
	Thu, 15 Aug 2019 21:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490F01678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565897078;
	bh=sEN1OptKuCz9Ik9Hp7o+ts04Jj8kf9wSpI1ItwhARvk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDwbjws1VkKJCarSgaOwe1QfpSxwuWC7gr1nanCJ5peKCixx1fNN+Ojjk9X/jYvR9
	 zhZaLqecIF2lr0cj1tSNTA9zW0s6g5k8nKWyVGrJgfkcxgmg7GwkiNmpTQ73DmCX0L
	 ZbIaImP4mWaU2bCUPuEr0HVL9edxkeL7WyFEsTB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84CFDF804CA;
	Thu, 15 Aug 2019 21:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69965F8015B; Thu, 15 Aug 2019 21:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DFD3F8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 21:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DFD3F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 12:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="179457178"
Received: from smharb-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.228.248])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2019 12:20:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 14:20:15 -0500
Message-Id: <20190815192018.30570-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815192018.30570-1-pierre-louis.bossart@linux.intel.com>
References: <20190815192018.30570-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: SOF: topology: Add dummy support for
	i.MX8 DAIs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Add dummy support for SAI/ESAI digital audio interface
IPs found on i.MX8 boards.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/tokens.h |  8 ++++++++
 sound/soc/sof/topology.c        | 30 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index daefcd26cbd3..a7c5f9876e32 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -50,6 +50,8 @@ enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_DMIC,		/**< Intel DMIC */
 	SOF_DAI_INTEL_HDA,		/**< Intel HD/A */
 	SOF_DAI_INTEL_SOUNDWIRE,	/**< Intel SoundWire */
+	SOF_DAI_IMX_SAI,		/**< i.MX SAI */
+	SOF_DAI_IMX_ESAI,		/**< i.MX ESAI */
 };
 
 /* general purpose DAI configuration */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 6435240cef13..8f996857fb24 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -106,4 +106,12 @@
 /* for backward compatibility */
 #define SOF_TKN_EFFECT_TYPE	SOF_TKN_PROCESS_TYPE
 
+/* SAI */
+#define SOF_TKN_IMX_SAI_FIRST_TOKEN		1000
+/* TODO: Add SAI tokens */
+
+/* ESAI */
+#define SOF_TKN_IMX_ESAI_FIRST_TOKEN		1100
+/* TODO: Add ESAI tokens */
+
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9cffea142395..a215bf58b138 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -346,6 +346,8 @@ static const struct sof_dai_types sof_dais[] = {
 	{"SSP", SOF_DAI_INTEL_SSP},
 	{"HDA", SOF_DAI_INTEL_HDA},
 	{"DMIC", SOF_DAI_INTEL_DMIC},
+	{"SAI", SOF_DAI_IMX_SAI},
+	{"ESAI", SOF_DAI_IMX_ESAI},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -2513,6 +2515,26 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	/*TODO: Add implementation */
+	return 0;
+}
+
+static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
+			      struct snd_soc_dai_link *link,
+			      struct snd_soc_tplg_link_config *cfg,
+			      struct snd_soc_tplg_hw_config *hw_config,
+			      struct sof_ipc_dai_config *config)
+{
+	/*TODO: Add implementation */
+	return 0;
+}
+
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_dai_link *link,
 			      struct snd_soc_tplg_link_config *cfg,
@@ -2837,6 +2859,14 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config,
 					&config);
 		break;
+	case SOF_DAI_IMX_SAI:
+		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config,
+					&config);
+		break;
+	case SOF_DAI_IMX_ESAI:
+		ret = sof_link_esai_load(scomp, index, link, cfg, hw_config,
+					 &config);
+		break;
 	default:
 		dev_err(sdev->dev, "error: invalid DAI type %d\n", config.type);
 		ret = -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
