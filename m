Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874B895813
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:22:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042532C5A;
	Tue,  2 Apr 2024 17:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042532C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071361;
	bh=pvf02amI0FeM/33GrNU+1kEDh57vg/K+58jbwJAR05Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NVtmD1LeHps61B2uLHzWu7kcYpQZRiz4mbop+SjXfsTVewgxjGaGNf3sfJSOi0o2u
	 rjhlosvotWJ7NlXEOTKzVG53WqrxEdxnebn+nmXvff2csB/zM7DtaqSAA9ag1eFOL9
	 Mn4QGOzAMg2009hScUfxSNdsPIiZOavhD/hZbxHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25C81F807CA; Tue,  2 Apr 2024 17:19:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54309F80799;
	Tue,  2 Apr 2024 17:19:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9676F80620; Tue,  2 Apr 2024 17:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAEEBF805C5
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAEEBF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h2G1gWrw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071134; x=1743607134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvf02amI0FeM/33GrNU+1kEDh57vg/K+58jbwJAR05Y=;
  b=h2G1gWrw/ap4drI/ZtEIWDi2L27mey1RqjH7uX6CqqwO5VvDBWJqvjbN
   qdZtJKZU8dc7mpwmDWNbnsT6/zOC1RK57VmhOKXuSAHnGPRPiSsXGy5pA
   MkrSdN9sFzhYBSMaNiJTzkO0/fJftD2MFjw0etgpZ/aWt9HCddgDalBIW
   J/GULnRfGDRxOpgqoHyHftN1mMDfzfWo4Tv71p1vrAnLbqd3XUIPveowR
   Bl+FiOducLM5z/19EWYpm0IwvuR86ji0G4U+6m0h4kQ6UbEb1oNh5U4EZ
   lFQCFXuAMHDny0jTumE28gZpa55MYYFPiEGCfSSfpYjuu5e8gghbMtgyN
   A==;
X-CSE-ConnectionGUID: dl4j6lPTSKW/KnLgJWiuIw==
X-CSE-MsgGUID: ch+nMRMiTmCPJ/Kr3Za6HA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730169"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:46 -0700
X-CSE-ConnectionGUID: Pcloce0iSZ+u39QEAIwUsA==
X-CSE-MsgGUID: WUHTcC+aTemVfzQeUhjQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796541"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 14/17] ASoC: SOF: pcm: simplify sof_pcm_hw_free() with helper
Date: Tue,  2 Apr 2024 10:18:25 -0500
Message-Id: <20240402151828.175002-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G2W74OELNSV5EZ67PZ2TV7RQ2NODCXN7
X-Message-ID-Hash: G2W74OELNSV5EZ67PZ2TV7RQ2NODCXN7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2W74OELNSV5EZ67PZ2TV7RQ2NODCXN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The same sequence is used twice, use common helper.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f03cee94bce6..ed09756f6af6 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -196,9 +196,8 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
-	int ret, err = 0;
+	int ret;
 
 	/* nothing to do for BE */
 	if (rtd->dai_link->no_pcm)
@@ -211,36 +210,11 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: free stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	if (spcm->prepared[substream->stream]) {
-		/* stop DMA first if needed */
-		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
-			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
-
-		/* free PCM in the DSP */
-		if (pcm_ops && pcm_ops->hw_free) {
-			ret = pcm_ops->hw_free(component, substream);
-			if (ret < 0)
-				err = ret;
-		}
-
-		spcm->prepared[substream->stream] = false;
-	}
-
-	/* reset DMA */
-	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0) {
-		dev_err(component->dev, "error: platform hw free failed\n");
-		err = ret;
-	}
-
-	/* free the DAPM widget list */
-	ret = sof_widget_list_free(sdev, spcm, substream->stream);
-	if (ret < 0)
-		err = ret;
+	ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream, true);
 
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
-	return err;
+	return ret;
 }
 
 static int sof_pcm_prepare(struct snd_soc_component *component,
-- 
2.40.1

