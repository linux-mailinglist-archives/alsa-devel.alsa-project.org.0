Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1F59C7B7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 21:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DABB41638;
	Mon, 22 Aug 2022 21:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DABB41638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661194875;
	bh=o+KXOFTqtH8s8upVfTwOEMUH1AZquDa63HNUjDErzyA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aq5HiaWKxZMpmzvorRLeBKLL77Zr7QccTxFlzHYvItkLWgjxigMfp7VqaTOpIGgLB
	 xX1moHwMduqU2+4kkTu/RSfqbRhiXa2jsYv1Y6sIAl/yEATGMfHmkcxjJmbZAb7A/m
	 mVzX542EK5XBEQSboWSp0xNP8nWKR/oiXqd0hYIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A7D8F80537;
	Mon, 22 Aug 2022 20:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53422F80527; Mon, 22 Aug 2022 20:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7D75F80527
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D75F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bEzI6+ev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661194779; x=1692730779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+KXOFTqtH8s8upVfTwOEMUH1AZquDa63HNUjDErzyA=;
 b=bEzI6+evn8F9XvYY/KUZriy7i4bW6g0I02udXTyCCESGf/jQ8ivq3RxY
 7vyuivskG4VU2E/8zNiPmOQdQPsxFdVkISgwZnAviHeu5NYBzFT2eHT9a
 BiQOUdgfAU0unMItBuMgGJIqiBL4cQZyDHsb//Td3Zf6gdxl8APWWoM36
 JCSHvjRtFbD1Bfx9gfyrjVCerpWgj3EhBX24aeAj8QR7I7wRp1bO8XIfd
 A/DqcCZkIUJBS1dUxv/f+4xUxowRHK8U89Dpl4+rbBwZOXAYsvak0k4wV
 MDzSKfy1hTUmEqSDVJhdmZbPIkVB8m7LS6dpzyx8mLjMWbhn4nU0va6L/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379786498"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="379786498"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669676497"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: SOF: add quirk to override topology mclk_id
Date: Mon, 22 Aug 2022 20:59:08 +0200
Message-Id: <20220822185911.170440-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
References: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Some Intel-based platforms rely on a topology file that hard-codes the
use of MCLK0. This is incorrect in 10% of the cases. Rather than
generating yet another set of topology files, this patch adds a kernel
module parameter to override the topology value.

In hindsight, we should never have allowed mclks to be specified in
topology, this is a hardware-level information that should not have
been visible in the topology.

Future patches will try to set this value automagically, e.g. by
parsing the NHLT content.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c     | 11 +++++++++++
 sound/soc/sof/ipc3-topology.c |  7 +++++++
 sound/soc/sof/sof-priv.h      |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6d4ecbe14adf3..ada2e67757494 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -376,6 +376,10 @@ static int dmic_num_override = -1;
 module_param_named(dmic_num, dmic_num_override, int, 0444);
 MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
 
+static int mclk_id_override = -1;
+module_param_named(mclk_id, mclk_id_override, int, 0444);
+MODULE_PARM_DESC(mclk_id, "SOF SSP mclk_id");
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 static bool hda_codec_use_common_hdmi = IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI);
 module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
@@ -1565,6 +1569,13 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 
 			sof_pdata->tplg_filename = tplg_filename;
 		}
+
+		/* check if mclk_id should be modified from topology defaults */
+		if (mclk_id_override >= 0) {
+			dev_info(sdev->dev, "Overriding topology with MCLK %d from kernel_parameter\n", mclk_id_override);
+			sdev->mclk_id_override = true;
+			sdev->mclk_id_quirk = mclk_id_override;
+		}
 	}
 
 	/*
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 65923e7a5976f..a39b43850f0ed 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1249,6 +1249,7 @@ static int sof_link_afe_load(struct snd_soc_component *scomp, struct snd_sof_dai
 static int sof_link_ssp_load(struct snd_soc_component *scomp, struct snd_sof_dai_link *slink,
 			     struct sof_ipc_dai_config *config, struct snd_sof_dai *dai)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_hw_config *hw_config = slink->hw_configs;
 	struct sof_dai_private_data *private = dai->private;
 	u32 size = sizeof(*config);
@@ -1273,6 +1274,12 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, struct snd_sof_dai
 
 		config[i].hdr.size = size;
 
+		if (sdev->mclk_id_override) {
+			dev_dbg(scomp->dev, "tplg: overriding topology mclk_id %d by quirk %d\n",
+				config[i].ssp.mclk_id, sdev->mclk_id_quirk);
+			config[i].ssp.mclk_id = sdev->mclk_id_quirk;
+		}
+
 		/* copy differentiating hw configs to ipc structs */
 		config[i].ssp.mclk_rate = le32_to_cpu(hw_config[i].mclk_rate);
 		config[i].ssp.bclk_rate = le32_to_cpu(hw_config[i].bclk_rate);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 33165299a20f1..de08825915b35 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -601,6 +601,10 @@ struct snd_sof_dev {
 	/* to protect the ipc_rx_handler_list  and  dsp_state_handler_list list */
 	struct mutex client_event_handler_mutex;
 
+	/* quirks to override topology values */
+	bool mclk_id_override;
+	u16  mclk_id_quirk; /* same size as in IPC3 definitions */
+
 	void *private;			/* core does not touch this */
 };
 
-- 
2.34.1

