Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40956B291
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 08:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD471654;
	Fri,  8 Jul 2022 08:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD471654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657260914;
	bh=ENT73aWnAztm46LKNlhTKMt+fCuUob46bDVIkTPIOIg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkMJzdTjK9fa0kJ3EGuQpK3bXFWrMfeAmH18UhQPw3g5EJdDQkylYGHbeFsH8EEcF
	 cJm8ex1YBtnjjB50znLyfkYePKIsoHst20f+ZVkLzrqoi/dcl8I9QYH+06QdvtzyVX
	 i+bs8WRqPBn8qKSqy9ihMkTKRBDDXbN3pcJYTZgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF92F8049E;
	Fri,  8 Jul 2022 08:13:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D4B6F80538; Fri,  8 Jul 2022 08:13:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E97BF8049E
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 08:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E97BF8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RcH/lVxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657260815; x=1688796815;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ENT73aWnAztm46LKNlhTKMt+fCuUob46bDVIkTPIOIg=;
 b=RcH/lVxAlb/+ZbjtmA1Ly2VI6drJ77htFnq63GnAz2JifKPEH096Y3Ue
 XeaUug0qYpaWuFuQxgWD2hhk4rsIj8UfJzJjq/4o/PaZpiAXnHS5bB6Xj
 piVyENNHhRf/XfSse8ZWwlXKEZQdsxh0AIMOHEAf/gba+UM7wNL5jlJ4x
 k4Olzd6WhTEVNDYtnNR2o2WmL9jv0vjoNoxdQbii1OzZVRAANnr9GDipM
 /5VGye43+Ye1RD/FiOzY6wGQLPT7X4EDL/QgJvtBCw+kMlARSeDWfeThI
 tnSJ3rEOwa85s7aY7bIsEq06+k4jGAT+Vv2V9qDa0mXeijEf5cHNvVhM/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281750595"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="281750595"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 23:13:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="651440361"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 23:13:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 2/2] ASoC: SOF: Intel: add trigger callback into
 sdw_callback
Date: Fri,  8 Jul 2022 14:13:12 +0800
Message-Id: <20220708061312.25878-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220708061312.25878-1-yung-chuan.liao@linux.intel.com>
References: <20220708061312.25878-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

For IPC4, we need to set pipeline state in BE DAI trigger.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 14 +++++++++++---
 sound/soc/sof/intel/hda.c     |  2 +-
 sound/soc/sof/intel/hda.h     |  1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ed74a1f264e8..ce5a39326dce 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -714,8 +714,7 @@ static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
 	.shutdown = ssp_dai_shutdown,
 };
 
-static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
-			       int cmd, struct snd_soc_dai *dai)
+static int ipc4_be_dai_common_trigger(struct snd_soc_dai *dai, int cmd, int stream)
 {
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
@@ -724,7 +723,7 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_sof_dev *sdev;
 	int ret;
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
+	w = snd_soc_dai_get_widget(dai, stream);
 	swidget = w->dobj.private;
 	pipe_widget = swidget->pipe_widget;
 	pipeline = pipe_widget->private;
@@ -759,6 +758,12 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *dai)
+{
+	return ipc4_be_dai_common_trigger(dai, cmd, substream->stream);
+}
+
 static const struct snd_soc_dai_ops ipc4_dmic_dai_ops = {
 	.trigger = ipc4_be_dai_trigger,
 };
@@ -810,6 +815,9 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		if (!hda_use_tplg_nhlt)
 			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
 
+		if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))
+			sdw_callback.trigger = ipc4_be_dai_common_trigger;
+
 		break;
 	}
 	default:
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index bc07df1fc39f..cdd3601e84f5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -147,7 +147,7 @@ static int sdw_free_stream(struct device *dev,
 	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
 }
 
-static const struct sdw_intel_ops sdw_callback = {
+struct sdw_intel_ops sdw_callback = {
 	.params_stream = sdw_params_stream,
 	.free_stream = sdw_free_stream,
 };
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index dc713c20ba1d..5439fcfe2b4d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -778,5 +778,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+extern struct sdw_intel_ops sdw_callback;
 
 #endif
-- 
2.17.1

