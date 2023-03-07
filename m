Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650896AE1CA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBB81470;
	Tue,  7 Mar 2023 15:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBB81470
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198164;
	bh=rFLNWWbDrEG4jjghXIL8Aos8aNZS6uoMOE1mBgh6Irc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=buBigZwIazBDukBraNpP+KG+eQCYq7tUgifqsV954r7ZsoD+rrN/scvjFampvi6Kd
	 GV5jRuRA2KREAIekJHGRWjrLg4n3ge9SDg/rVwK/4rQQsHdZXjxUnd05+82Qhs49Ma
	 alvf5GKE94aSqXxiVsCVFnctnItTj205M4vzKQfE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3DFF805B2;
	Tue,  7 Mar 2023 15:05:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5253FF80564; Tue,  7 Mar 2023 15:04:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1D4AF80552
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D4AF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e4toNeLd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197890; x=1709733890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rFLNWWbDrEG4jjghXIL8Aos8aNZS6uoMOE1mBgh6Irc=;
  b=e4toNeLdybpMid4HPX2VlbN0Yw5lKj4AKbOKdZYTSABx/rPds7SkdT4t
   t1kwK2y06LC7huo8ooXJsKnxCTFhDk0x4TZhFmw7MOqKDiWrcsEFeUiCz
   i2CDSj6VbbqCFRO0o2GOYTbDrcK1qVZWLsCiuKYuKG1x3EZEv1yVfR00C
   Vrd+QusEIuwKJbU+0kylA67syXGy7lVrIKbwOaz2Ou+vJXds+loqLL2hj
   6lkOVg0J/gHRYveV4Hamh38wwIFflcBqM+GonaNoDnX8tF1JLl4OYQIi9
   jjDrgZT28BytgfH5FywnrESNosdWs66A6awILxSDNyU9yRHSdyZ/iZ57S
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255321"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255321"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706998"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706998"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 13/14] ASoC: SOF: Intel: hda: Remove
 hda_ctrl_dai_widget_setup/free()
Date: Tue,  7 Mar 2023 16:04:34 +0200
Message-Id: <20230307140435.2808-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CACTJRDVW2BH56N3YXBUPG4WCB453SSO
X-Message-ID-Hash: CACTJRDVW2BH56N3YXBUPG4WCB453SSO
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CACTJRDVW2BH56N3YXBUPG4WCB453SSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove these functions and reuse hda_dai_config().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 78 +++------------------------------------
 sound/soc/sof/intel/hda.h |  4 --
 2 files changed, 6 insertions(+), 76 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 81c697e20108..890993b2f14b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -44,70 +44,6 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
-int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_flags,
-			      struct snd_sof_dai_config_data *data)
-{
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *component = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
-	struct snd_sof_dai *sof_dai = swidget->private;
-	int ret;
-
-	if (!sof_dai) {
-		dev_err(sdev->dev, "%s: No DAI for DAI widget %s\n", __func__, w->name);
-		return -EINVAL;
-	}
-
-	if (tplg_ops->dai_config) {
-		unsigned int flags;
-
-		/* set HW_PARAMS flag along with quirks */
-		flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS |
-			quirk_flags << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
-
-		ret = tplg_ops->dai_config(sdev, swidget, flags, data);
-		if (ret < 0) {
-			dev_err(sdev->dev, "%s: DAI config failed for widget %s\n", __func__,
-				w->name);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_flags,
-			     struct snd_sof_dai_config_data *data)
-{
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *component = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
-	struct snd_sof_dai *sof_dai = swidget->private;
-
-	if (!sof_dai) {
-		dev_err(sdev->dev, "%s: No DAI for BE DAI widget %s\n", __func__, w->name);
-		return -EINVAL;
-	}
-
-	if (tplg_ops->dai_config) {
-		unsigned int flags;
-		int ret;
-
-		/* set HW_FREE flag along with any quirks */
-		flags = SOF_DAI_CONFIG_FLAGS_HW_FREE |
-			quirk_flags << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
-
-		ret = tplg_ops->dai_config(sdev, swidget, flags, data);
-		if (ret < 0)
-			dev_err(sdev->dev, "%s: DAI config failed for widget '%s'\n", __func__,
-				w->name);
-	}
-
-	return 0;
-}
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -124,30 +60,28 @@ static int sdw_params_stream(struct device *dev,
 			     struct sdw_intel_stream_params_data *params_data)
 {
 	struct snd_soc_dai *d = params_data->dai;
-	struct snd_sof_dai_config_data data;
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, params_data->stream);
+	struct snd_sof_dai_config_data data = { 0 };
 
-	w = snd_soc_dai_get_widget(d, params_data->stream);
 	data.dai_index = (params_data->link_id << 8) | d->id;
 	data.dai_data = params_data->alh_stream_id;
 
-	return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
+	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_PARAMS, &data);
 }
 
 static int sdw_free_stream(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data)
 {
 	struct snd_soc_dai *d = free_data->dai;
-	struct snd_sof_dai_config_data data;
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, free_data->stream);
+	struct snd_sof_dai_config_data data = { 0 };
 
-	w = snd_soc_dai_get_widget(d, free_data->stream);
 	data.dai_index = (free_data->link_id << 8) | d->id;
 
 	/* send invalid stream_id */
 	data.dai_data = 0xFFFF;
 
-	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
+	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
 }
 
 struct sdw_intel_ops sdw_callback = {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 815f73d3acd2..2a43bfc14583 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -896,10 +896,6 @@ int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 struct snd_sof_dai;
 struct sof_ipc_dai_config;
-int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_flags,
-			      struct snd_sof_dai_config_data *data);
-int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_flags,
-			     struct snd_sof_dai_config_data *data);
 
 #define SOF_HDA_POSITION_QUIRK_USE_SKYLAKE_LEGACY	(0) /* previous implementation */
 #define SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS	(1) /* recommended if VC0 only */
-- 
2.39.2

