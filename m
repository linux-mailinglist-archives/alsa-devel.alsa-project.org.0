Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 825697739D7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 13:06:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD45846;
	Tue,  8 Aug 2023 13:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD45846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691492802;
	bh=G0Hb/DMeFaJoBbeeWZZ/FcVgBzoq1NFcR6FwpBQykMg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=loHQLp8zkT6NwP03k/54HEB8lRI+2I1v31zSFJYnnFEd+InzjSafK7V/OhA/loySw
	 A2Jc5tjjlRy8jQ+0FGYU2+T8tRY00FkyfFiPaEgTsPBEeIOmS8hJq97aNzMWs/QHF+
	 lLOL03/9YVt60BpvHo5bcRxETncdmzQLX94h+20E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B277EF80107; Tue,  8 Aug 2023 13:05:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31CFCF80154;
	Tue,  8 Aug 2023 13:05:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC100F80534; Tue,  8 Aug 2023 13:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0810F80107
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 13:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0810F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FLsXke1q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691492715; x=1723028715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G0Hb/DMeFaJoBbeeWZZ/FcVgBzoq1NFcR6FwpBQykMg=;
  b=FLsXke1q+9FjkDqneIOYmFtWk9oaAsPACduXIDUdByH7dMnYSysmH1Vn
   ePiluMBdtum3CEpfiK0WSfpwg2Z1fxDt+vvgpav9mtRijpfwe0UfdApOp
   HBV/FhJ6TL6Zb3zrrnXIJn968Wq7b/vIYsUJFXLyZmXYqCVusnSDKBmMD
   U0Klw/MRvSlG0Upy7VP9qYaXWLJH8ie1q6vY2fboyxAH9z+5eAfuWUSSc
   9Os1Uxbdjx/x7UcAmwq9OlP3UH4MULZXLndrjOA/oqF2RJPYjcRXCE17c
   KMnD/MtnTJNnWad6rxyHL3JSclpDZHRyUXOOX3a68YTQGwr2kH74og1vM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374465516"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="374465516"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905181218"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="905181218"
Received: from romanagn-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.49.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:05:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	regressions@leemhuis.info
Subject: [PATCH] ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
Date: Tue,  8 Aug 2023 14:06:27 +0300
Message-ID: <20230808110627.32375-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQB5N35VSP3I24JOU65YNTFH77JIPXY6
X-Message-ID-Hash: ZQB5N35VSP3I24JOU65YNTFH77JIPXY6
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQB5N35VSP3I24JOU65YNTFH77JIPXY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

With IPC3, we reset hw_params during the stop trigger, so we should also
clean up the link DMA during the stop trigger.

Fixes: 1bf83fa6654c ("ASoC: SOF: Intel: hda-dai: Do not perform DMA cleanup during stop")
Closes: https://github.com/thesofproject/linux/issues/4455
Closes: https://github.com/thesofproject/linux/issues/4482
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217673
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 11 ++++++++++-
 sound/soc/sof/intel/hda-dai.c     |  5 ++---
 sound/soc/sof/intel/hda.h         |  2 ++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index f3513796c189..f33051eac1c0 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -372,6 +372,7 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				 struct snd_pcm_substream *substream, int cmd)
 {
+	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 
 	switch (cmd) {
@@ -379,9 +380,17 @@ static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 	case SNDRV_PCM_TRIGGER_STOP:
 	{
 		struct snd_sof_dai_config_data data = { 0 };
+		int ret;
 
 		data.dai_data = DMA_CHAN_INVALID;
-		return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
+		ret = hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
+		if (ret < 0)
+			return ret;
+
+		if (cmd == SNDRV_PCM_TRIGGER_STOP)
+			return hda_link_dma_cleanup(substream, hext_stream, cpu_dai);
+
+		break;
 	}
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_PAUSE, NULL);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 3297dea493aa..863865f3d77e 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -107,9 +107,8 @@ hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai
 	return sdai->platform_private;
 }
 
-static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
-				struct hdac_ext_stream *hext_stream,
-				struct snd_soc_dai *cpu_dai)
+int hda_link_dma_cleanup(struct snd_pcm_substream *substream, struct hdac_ext_stream *hext_stream,
+			 struct snd_soc_dai *cpu_dai)
 {
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
 	struct sof_intel_hda_stream *hda_stream;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3f7c6fb05e5d..5b9e4ebcc18b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -963,5 +963,7 @@ const struct hda_dai_widget_dma_ops *
 hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 		   struct snd_sof_dai_config_data *data);
+int hda_link_dma_cleanup(struct snd_pcm_substream *substream, struct hdac_ext_stream *hext_stream,
+			 struct snd_soc_dai *cpu_dai);
 
 #endif
-- 
2.41.0

