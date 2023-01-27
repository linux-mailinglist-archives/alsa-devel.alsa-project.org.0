Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9B767E479
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A37ED7;
	Fri, 27 Jan 2023 13:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A37ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821017;
	bh=o7PqVOj4UA9kzrLik5m1/juhbWoX6yinf+DXgI5qQQg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pB6uQaaaTJaXZ5ZoolvB4pY91k5KpHHvq/MHiOMwNRA5AQnD9wx7dzDVslYIx7tj8
	 h1nrCU1u6DGQOVAYWD2BkhLnwSF1sD5DxzGI/m/PcOgQ7ye+dmglmHCmdfqUuczx44
	 iCaW3WClrqwt5WCOIg1jDQT+uL3NmgrZDKaVdjSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129E0F8057E;
	Fri, 27 Jan 2023 13:01:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8978FF8055C; Fri, 27 Jan 2023 13:00:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BAFCF80548
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BAFCF80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gKX9MDq6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820845; x=1706356845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7PqVOj4UA9kzrLik5m1/juhbWoX6yinf+DXgI5qQQg=;
 b=gKX9MDq6s2282ivWagHl364ULZ0mYgjmY6yGkY4ZLmgVl9z8coFr7Bt8
 Kv7iRWRVNl8lKApSNpG8i82pbt9fK6Mjbq60fVCIU6voS5T19NcK1IQJ6
 Vbs7gz7ADkRellaBKoNzWUyIpP6sdLY1+8S8f+sdqsLvRews7trb0Wv2R
 byEbcup5Yyi1KQuWXlCUXqBj09jJmCzGAjnVVoDuQ5S+qdm/Nwg7eWLPt
 ppkb7SjM2XrmyGA8NheBWeZh7xlop74cWNEqWdk1EHzumo+sAW8SCjRac
 J10wXp7jSIEWjt7tqYuGMmV7khYb012vkicpe/Ui0nLtZ8NBxY8VjhC9f g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091847"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091847"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782164"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782164"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 07/18] ASoC: SOF: Introduce PCM setup/free PCM IPC ops
Date: Fri, 27 Jan 2023 14:00:20 +0200
Message-Id: <20230127120031.10709-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

These will be used to perform IPC-specific PCM setup/free.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.h |  7 +++++++
 sound/soc/sof/topology.c  | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 28062a0c3a43..bcde2ebaf022 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -85,6 +85,7 @@ struct snd_sof_widget;
 struct snd_sof_route;
 struct snd_sof_control;
 struct snd_sof_dai;
+struct snd_sof_pcm;
 
 struct snd_sof_dai_config_data {
 	int dai_index;
@@ -97,6 +98,10 @@ struct snd_sof_dai_config_data {
  * @hw_free: Function pointer for hw_free
  * @trigger: Function pointer for trigger
  * @dai_link_fixup: Function pointer for DAI link fixup
+ * @pcm_setup: Function pointer for IPC-specific PCM set up that can be used for allocating
+ *	       additional memory in the SOF PCM stream structure
+ * @pcm_free: Function pointer for PCM free that can be used for freeing any
+ *	       additional memory in the SOF PCM stream structure
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -106,6 +111,8 @@ struct sof_ipc_pcm_ops {
 	int (*trigger)(struct snd_soc_component *component,  struct snd_pcm_substream *substream,
 		       int cmd);
 	int (*dai_link_fixup)(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
+	int (*pcm_setup)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
+	void (*pcm_free)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
 };
 
 /**
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index f67c39c47930..51f6fed45ae7 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1669,6 +1669,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 			struct snd_soc_tplg_pcm *pcm, struct snd_soc_dai *dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_pcm_ops *ipc_pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_soc_tplg_stream_caps *caps;
 	struct snd_soc_tplg_private *private = &pcm->priv;
 	struct snd_sof_pcm *spcm;
@@ -1696,6 +1697,13 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
 
+	/* perform pcm set op */
+	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
+		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
+		if (ret < 0)
+			return ret;
+	}
+
 	dai_drv->dobj.private = spcm;
 	list_add(&spcm->list, &sdev->pcm_list);
 
@@ -1773,6 +1781,8 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 static int sof_dai_unload(struct snd_soc_component *scomp,
 			  struct snd_soc_dobj *dobj)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_pcm_ops *ipc_pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm = dobj->private;
 
 	/* free PCM DMA pages */
@@ -1782,6 +1792,10 @@ static int sof_dai_unload(struct snd_soc_component *scomp,
 	if (spcm->pcm.capture)
 		snd_dma_free_pages(&spcm->stream[SNDRV_PCM_STREAM_CAPTURE].page_table);
 
+	/* perform pcm free op */
+	if (ipc_pcm_ops && ipc_pcm_ops->pcm_free)
+		ipc_pcm_ops->pcm_free(sdev, spcm);
+
 	/* remove from list and free spcm */
 	list_del(&spcm->list);
 	kfree(spcm);
-- 
2.39.1

