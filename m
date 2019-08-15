Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE78F47F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 21:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F30167C;
	Thu, 15 Aug 2019 21:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F30167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565897200;
	bh=foJRnkh2oD52+3nDa3ZJzYRhxoifHuGYYRdy/0Hj/Zw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4iJy+/0/zPzwecjNMKk+aV4x9uICSHE8myBB2XQDAVH184EvgDnI0nr0Zh9ft9CU
	 6p8a8Phm+VDW956pqt1JEIlCSBt9Ujcg/OJ/Va10z/AkddbLudV3HFKAqd0t1rcaCQ
	 5Oeec4B3V6woc8U1oKntbnSXQujfHkvDBbjScNIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B07BFF805FF;
	Thu, 15 Aug 2019 21:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E87B5F805AE; Thu, 15 Aug 2019 21:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C55F80273
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 21:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C55F80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 12:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="179457181"
Received: from smharb-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.228.248])
 by orsmga003.jf.intel.com with ESMTP; 15 Aug 2019 12:20:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 14:20:17 -0500
Message-Id: <20190815192018.30570-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815192018.30570-1-pierre-louis.bossart@linux.intel.com>
References: <20190815192018.30570-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/4] ASoC: SOF: topology: initial support for
	Intel ALH DAI type
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

The Audio Link Hub DAI does not require any static configuration from
topology for now. We still need to pass the frame rate and format to
firmware.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 42 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a215bf58b138..28a7a6e06a53 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -346,6 +346,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"SSP", SOF_DAI_INTEL_SSP},
 	{"HDA", SOF_DAI_INTEL_HDA},
 	{"DMIC", SOF_DAI_INTEL_DMIC},
+	{"ALH", SOF_DAI_INTEL_ALH},
 	{"SAI", SOF_DAI_IMX_SAI},
 	{"ESAI", SOF_DAI_IMX_ESAI},
 };
@@ -2763,6 +2764,40 @@ static int sof_link_hda_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc_reply reply;
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* init IPC */
+	config->hdr.size = size;
+
+	/* send message to DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 config->hdr.cmd, config, size, &reply,
+				 sizeof(reply));
+
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to set DAI config for ALH %d\n",
+			config->dai_index);
+		return ret;
+	}
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to save DAI config for ALH %d\n",
+			config->dai_index);
+
+	return ret;
+}
+
 /* DAI link - used for any driver specific init */
 static int sof_link_load(struct snd_soc_component *scomp, int index,
 			 struct snd_soc_dai_link *link,
@@ -2859,6 +2894,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config,
 					&config);
 		break;
+	case SOF_DAI_INTEL_ALH:
+		ret = sof_link_alh_load(scomp, index, link, cfg, hw_config,
+					&config);
+		break;
 	case SOF_DAI_IMX_SAI:
 		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config,
 					&config);
@@ -2924,7 +2963,8 @@ static int sof_link_unload(struct snd_soc_component *scomp,
 	switch (sof_dai->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
 	case SOF_DAI_INTEL_DMIC:
-		/* no resource needs to be released for SSP and DMIC */
+	case SOF_DAI_INTEL_ALH:
+		/* no resource needs to be released for SSP, DMIC and ALH */
 		break;
 	case SOF_DAI_INTEL_HDA:
 		ret = sof_link_hda_unload(sdev, link);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
