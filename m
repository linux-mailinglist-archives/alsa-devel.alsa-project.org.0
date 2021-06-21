Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC793AF657
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 21:43:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A7C41696;
	Mon, 21 Jun 2021 21:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A7C41696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624304629;
	bh=aMwvHDReXHQ5m3BsCBdkP59a73UGUUVaLhUX0beWeVA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Se5Y35oYac+f1lzXn7mMRkCSZTUtKHg/57/CHs0/RErISYBMmuj3jl0hJtXlvRfSO
	 gqX5Xy7VPzLtzx8DQPPKyp6/KItlLcFBajGcddSD64PI9egAXXdP6JyR5Tbl2mPeop
	 Zsu+/0wldDg7phhnO57vg62UvSt5vn4c6RP/fJPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C8EF804B0;
	Mon, 21 Jun 2021 21:41:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F44F804E0; Mon, 21 Jun 2021 21:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346FBF80245
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 21:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346FBF80245
IronPort-SDR: gt7Kdt1GXmxhvQTiefnwRR5OYBSx2txhI0c6i4irjSAOw1+JCSAnzy8u+QFXXZqkudFTbDyRPh
 5DuG7X/EEFhA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="203903326"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="203903326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:18 -0700
IronPort-SDR: lhAOVnWLQt0rxwvNrQU3Dbu1aqOwaxp3CuT2yZ2S4oOPpUVIACCq7Yar0DD04ZmRIcGkulKH15
 Fi1Q6EEygLeQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="486619026"
Received: from gwhaugh-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.175.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/10] ASoC: Intel: sof_sdw: remove hdac-hdmi support
Date: Mon, 21 Jun 2021 14:40:49 -0500
Message-Id: <20210621194057.21711-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
References: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Richard Fitzgerald <rf@opensource.cirrus.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Remove support for using hdac_hdmi codec driver. No known products use
this configuration and hdac_hdmi cannot support all the platforms
sof_sdw does.

This change also fixes a bug in Kconfig rules.
SND_SOC_INTEL_SOUNDWIRE_SOF_MACH did not have a select SND_SOC_HDAC_HDMI
and this could cause build failures.

Reported-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        |  2 --
 sound/soc/intel/boards/sof_sdw_common.h |  1 -
 sound/soc/intel/boards/sof_sdw_hdmi.c   | 37 +------------------------
 3 files changed, 1 insertion(+), 39 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 970d7892568a..34f142d7b3f9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1273,8 +1273,6 @@ static int mc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
 	/*
 	 * the default amp_num is zero for each codec and
 	 * amp_num will only be increased for active amp
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 37ae3a19fa49..ec5740486b75 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -79,7 +79,6 @@ struct sof_sdw_codec_info {
 
 struct mc_private {
 	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
 	bool idisp_codec;
 	struct snd_soc_jack sdw_headset;
 };
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index 99b04bb2f3a0..d47d8bf528c1 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -13,11 +13,8 @@
 #include <sound/soc-acpi.h>
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
-#include "../../codecs/hdac_hdmi.h"
 #include "hda_dsp_common.h"
 
-static struct snd_soc_jack hdmi[MAX_HDMI_NUM];
-
 struct hdmi_pcm {
 	struct list_head head;
 	struct snd_soc_dai *codec_dai;
@@ -49,8 +46,6 @@ int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct hdmi_pcm *pcm;
 	struct snd_soc_component *component = NULL;
-	int err, i = 0;
-	char jack_name[NAME_SIZE];
 
 	if (!ctx->idisp_codec)
 		return 0;
@@ -62,35 +57,5 @@ int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 			       head);
 	component = pcm->codec_dai->component;
 
-	if (ctx->common_hdmi_codec_drv)
-		return hda_dsp_hdmi_build_controls(card, component);
-
-	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
-		component = pcm->codec_dai->component;
-		snprintf(jack_name, sizeof(jack_name),
-			 "HDMI/DP, pcm=%d Jack", pcm->device);
-		err = snd_soc_card_jack_new(card, jack_name,
-					    SND_JACK_AVOUT, &hdmi[i],
-					    NULL, 0);
-
-		if (err)
-			return err;
-
-		err = snd_jack_add_new_kctl(hdmi[i].jack,
-					    jack_name, SND_JACK_AVOUT);
-		if (err)
-			dev_warn(component->dev, "failed creating Jack kctl\n");
-
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-					  &hdmi[i]);
-		if (err < 0)
-			return err;
-
-		i++;
-	}
-
-	if (!component)
-		return -EINVAL;
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
+	return hda_dsp_hdmi_build_controls(card, component);
 }
-- 
2.25.1

