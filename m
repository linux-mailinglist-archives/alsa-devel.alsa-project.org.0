Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF55F9413
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 01:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26DE716D0;
	Mon, 10 Oct 2022 01:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26DE716D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665359565;
	bh=8vlZOH+1gnjwy2xjkBABceLfZcQrgsu6aRHtvXp0IEs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HwtM4Oaf4gLuZHc7d9Nc9fgONR3w2Yaw+hWgsecpQVnSqeVPSZ+jiTEQVSrKJQ15k
	 syQJ7WIBplYhAL4G5hsdknqNrrf0RlwFy72C7OBJNcbmxLAAk9OEM2+RE9v/B2oG63
	 iIaKmXvZCu6XvcUtKvYtOmNahr+mzZkrc2iRbugs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1F0F80563;
	Mon, 10 Oct 2022 01:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3484EF80552; Mon, 10 Oct 2022 01:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A77D0F80552;
 Mon, 10 Oct 2022 01:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A77D0F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T7nyoKmb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1CE9B80DE4;
 Sun,  9 Oct 2022 23:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2379CC433B5;
 Sun,  9 Oct 2022 23:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359463;
 bh=8vlZOH+1gnjwy2xjkBABceLfZcQrgsu6aRHtvXp0IEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T7nyoKmbm4RSrJBh8Zeh9F0+mJzASl2ZTO+jBK/XQNOyredgvQTB20KjLpqaJlJ77
 LjSzDs81/kTS+Z5ZqlC7cFc5Ww9kwOjNfMuEEV9Wm3pdTKhIinLWk5IXIoxAJVRvbv
 JuPZv8q7JP3ranPDHaZHayM5NbqHPqCROd+/A0DcDUP2tm3gkeJsEzL2YpggLSkhER
 VhyNKT7suqLPZ4iPq5wjIN164RNjSXHn/Qazg7j+gNgOa3qQkxtymMLHVwBN+nT3K0
 CtqXCi2jIZ/BO6YJCZ3hvd6h3IKEF1LvIxUBXMdIFdpVzR5TR4/jw4rp4FKUBMm6eL
 ol4+ztu4/4VWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 28/44] ASoC: SOF: add quirk to override topology
 mclk_id
Date: Sun,  9 Oct 2022 19:49:16 -0400
Message-Id: <20221009234932.1230196-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009234932.1230196-1-sashal@kernel.org>
References: <20221009234932.1230196-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 daniel.baluta@nxp.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit d136949dd8e2e309dc2f186507486b71cbe9acdb ]

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
Link: https://lore.kernel.org/r/20220919115350.43104-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda.c     | 11 +++++++++++
 sound/soc/sof/ipc3-topology.c |  7 +++++++
 sound/soc/sof/sof-priv.h      |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6d4ecbe14adf..ada2e6775749 100644
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
index 65923e7a5976..a39b43850f0e 100644
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
index 823583086279..828c74bb75f8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -594,6 +594,10 @@ struct snd_sof_dev {
 	/* to protect the ipc_rx_handler_list  and  dsp_state_handler_list list */
 	struct mutex client_event_handler_mutex;
 
+	/* quirks to override topology values */
+	bool mclk_id_override;
+	u16  mclk_id_quirk; /* same size as in IPC3 definitions */
+
 	void *private;			/* core does not touch this */
 };
 
-- 
2.35.1

