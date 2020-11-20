Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069022BABC6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 15:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA6316F7;
	Fri, 20 Nov 2020 15:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA6316F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605882060;
	bh=G1JMxA19RFw3Ftd9a2vgNiP6Nw8AKDS/8ednLvRnREI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KnzgZYECn6a9RaT6kcuk+Jxlk4HiYHW50cSB5fmu7YAaq7EqClEMuYUoeAnafmIlE
	 hZA3M+TN0pgtaiXNoXCqIo3s9gWuYNw7aPS1N+EP3kfKqjqEKHFPmESinwZ1pTHmYi
	 Ybq3e6vD5LWQOeKd/Sg5/rGuazo6q3Xjl3bF7/5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23AEAF8016D;
	Fri, 20 Nov 2020 15:19:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E305F8016C; Fri, 20 Nov 2020 15:19:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B615F800F3
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 15:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B615F800F3
IronPort-SDR: BTLfsI2eq+9Iz3qliIHAgoY/aeM4Ujgpt5Uil1etWM6svcwgUhxHiJhOfrz3Mv8NPbzCcvK08k
 rOkl3RgcyLcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="235623334"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="235623334"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 06:19:15 -0800
IronPort-SDR: oGiHTJ40o4mVIuJMrUQ4pOp4FSPK4jn7Jtmp52ZaAC3yb9VYuZFlko6EkYm0VmeL1GNP+yS15V
 l/mp5IJrMCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="331330998"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 20 Nov 2020 06:19:12 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: nocodec: modify DAI link definitions
Date: Fri, 20 Nov 2020 16:16:53 +0200
Message-Id: <20201120141653.2160134-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The ignore_machine field in the component driver is used to
ignore the FE DAI links defined in the machine driver,
override BE fixups and set the stream names for the
DAI links defined in the machine driver. This is required
to make SOF compatible with the legacy machine drivers.

In the case of the nocodec machine driver in SOF, there is
no need to rely upon this ignore_machine logic in the core.
Modify the machine driver to set DAI link stream names and the
BE hw_params_fixup callback appropriately.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h       |  6 ++++--
 sound/soc/sof/nocodec.c   | 18 ++++++++++++++----
 sound/soc/sof/pcm.c       |  3 +--
 sound/soc/sof/sof-audio.c |  2 +-
 sound/soc/sof/sof-audio.h |  3 +++
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 9aa055289dcc..646a655c3c6b 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -100,6 +100,8 @@ struct sof_dev_desc {
 	const struct snd_sof_dsp_ops *ops;
 };
 
-int sof_nocodec_setup(struct device *dev,
-		      const struct snd_sof_dsp_ops *ops);
+int sof_nocodec_setup(struct device *dev, const struct snd_sof_dsp_ops *ops,
+		      int (*pcm_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
+						struct snd_pcm_hw_params *params));
+
 #endif
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 9e922df6a710..3b9bb2e83a86 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -10,17 +10,21 @@
 
 #include <linux/module.h>
 #include <sound/sof.h>
+#include "sof-audio.h"
 #include "sof-priv.h"
 
 static struct snd_soc_card sof_nocodec_card = {
 	.name = "nocodec", /* the sof- prefix is added by the core */
+	.topology_shortname = "sof-nocodec",
 	.owner = THIS_MODULE
 };
 
 static int sof_nocodec_bes_setup(struct device *dev,
 				 const struct snd_sof_dsp_ops *ops,
 				 struct snd_soc_dai_link *links,
-				 int link_num, struct snd_soc_card *card)
+				 int link_num, struct snd_soc_card *card,
+				 int (*pcm_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
+							   struct snd_pcm_hw_params *params))
 {
 	struct snd_soc_dai_link_component *dlc;
 	int i;
@@ -39,6 +43,8 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		if (!links[i].name)
 			return -ENOMEM;
 
+		links[i].stream_name = links[i].name;
+
 		links[i].cpus = &dlc[0];
 		links[i].codecs = &dlc[1];
 		links[i].platforms = &dlc[2];
@@ -57,6 +63,8 @@ static int sof_nocodec_bes_setup(struct device *dev,
 			links[i].dpcm_playback = 1;
 		if (ops->drv[i].capture.channels_min)
 			links[i].dpcm_capture = 1;
+
+		links[i].be_hw_params_fixup = pcm_dai_link_fixup;
 	}
 
 	card->dai_link = links;
@@ -65,8 +73,9 @@ static int sof_nocodec_bes_setup(struct device *dev,
 	return 0;
 }
 
-int sof_nocodec_setup(struct device *dev,
-		      const struct snd_sof_dsp_ops *ops)
+int sof_nocodec_setup(struct device *dev, const struct snd_sof_dsp_ops *ops,
+		      int (*pcm_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
+						struct snd_pcm_hw_params *params))
 {
 	struct snd_soc_dai_link *links;
 
@@ -77,7 +86,7 @@ int sof_nocodec_setup(struct device *dev,
 		return -ENOMEM;
 
 	return sof_nocodec_bes_setup(dev, ops, links, ops->num_drv,
-				     &sof_nocodec_card);
+				     &sof_nocodec_card, pcm_dai_link_fixup);
 }
 EXPORT_SYMBOL(sof_nocodec_setup);
 
@@ -86,6 +95,7 @@ static int sof_nocodec_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &sof_nocodec_card;
 
 	card->dev = &pdev->dev;
+	card->topology_shortname_created = true;
 
 	return devm_snd_soc_register_card(&pdev->dev, card);
 }
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 37d12162e448..0dc39fbcd81d 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -620,8 +620,7 @@ static int sof_pcm_new(struct snd_soc_component *component,
 }
 
 /* fixup the BE DAI link to match any values from topology */
-static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
-				  struct snd_pcm_hw_params *params)
+int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params)
 {
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9a8ce25a8fc8..3277489fee5e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -468,7 +468,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	mach->drv_name = "sof-nocodec";
 	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
-	ret = sof_nocodec_setup(sdev->dev, desc->ops);
+	ret = sof_nocodec_setup(sdev->dev, desc->ops, sof_pcm_dai_link_fixup);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 9f645a2e5a6c..5b016f00956b 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -212,6 +212,9 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 				  enum sof_ipc_ctrl_cmd ctrl_cmd,
 				  bool send);
 
+/* DAI link fixup */
+int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
+
 /* PM */
 int sof_restore_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
-- 
2.28.0

