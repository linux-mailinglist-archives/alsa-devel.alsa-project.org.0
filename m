Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A5895810
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:22:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 833091060;
	Tue,  2 Apr 2024 17:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 833091060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071346;
	bh=Pv5VsCRUPEy45V9LDEImBhiwWfDOxWF4sH/Qxur1TJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K/46xrhYqIL78clMUYiRHBdJn/4RoNOJOl4Qcpl9uI5ne0z+2b0VpxXClTUB3P3ce
	 4n4iSiP+jmdpHdx4AkCkmrEbv0eJ/s7+X6ZFyRDgC7L93NihV555N6tMiCcmG8KHNT
	 VYocfsLClY7AOXqG4605IBR5ZANf3GCcdTdP8Si8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81608F80771; Tue,  2 Apr 2024 17:19:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A2BF80769;
	Tue,  2 Apr 2024 17:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E1B7F80587; Tue,  2 Apr 2024 17:19:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAFC8F805D3
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAFC8F805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jo+EUJh8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071134; x=1743607134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pv5VsCRUPEy45V9LDEImBhiwWfDOxWF4sH/Qxur1TJE=;
  b=jo+EUJh89lVoyJVFRFowsiXhWDpbKjjbMKsXYUoXEpIsYQ9jN6CzntGI
   +g4NWxhh0Ja4NRh268leT3rGLYtcFX1YiWe8i93hsuDfkhEWYIZfvQcP3
   r0a5Aoe8yVgI65z4R5+ud+IUaVfY7sF8dl0/m3pJalAzWFCVzpQ27iI8K
   ea/9kYC/pPM2L5ruTeQmfEpXd0rForLLtZH/5XaW4/R58NyBVugg1SBK3
   uVPetm00WzCI8eXr4O9ONuzawHWzmr4Tx+CaU6riNFzfslLy7r9QFedrC
   YsCp6g0sCphBrEvK6GsFW9tHiONSr8fbUjw2+z5TObJOIBAvVNVoXfUGc
   Q==;
X-CSE-ConnectionGUID: y/ric47QRNKBcDisXkc8qw==
X-CSE-MsgGUID: jXq/yQKIRvKigMAQQAFVLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730157"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:45 -0700
X-CSE-ConnectionGUID: 7QEPXCQaRwy0PUDC3eaacA==
X-CSE-MsgGUID: zqpLv5qLSO284Z0Bg9xMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796538"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 13/17] ASoC: SOF: sof-audio: revisit sof_pcm_stream_free()
 error handling and logs
Date: Tue,  2 Apr 2024 10:18:24 -0500
Message-Id: <20240402151828.175002-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CIEU3CXCP5HZCUB4U7SMHXG2RL6XCUOP
X-Message-ID-Hash: CIEU3CXCP5HZCUB4U7SMHXG2RL6XCUOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIEU3CXCP5HZCUB4U7SMHXG2RL6XCUOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason the existing code stops on the first error, which
potentially leaves the DMA and widgets in a weird state.

Change to free-up all resources even in case of errors.

Also add a more consistent error handling and logs, with the first
error code returned to the caller.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e693dcb475e4..b5ca2861edbd 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -834,17 +834,21 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 {
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	int ret;
+	int err = 0;
 
 	if (spcm->prepared[substream->stream]) {
 		/* stop DMA first if needed */
 		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
 			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
 
-		/* Send PCM_FREE IPC to reset pipeline */
+		/* free PCM in the DSP */
 		if (pcm_ops && pcm_ops->hw_free) {
 			ret = pcm_ops->hw_free(sdev->component, substream);
-			if (ret < 0)
-				return ret;
+			if (ret < 0) {
+				dev_err(sdev->dev, "%s: pcm_ops hw_free failed %d\n",
+					__func__, ret);
+				err = ret;
+			}
 		}
 
 		spcm->prepared[substream->stream] = false;
@@ -852,17 +856,25 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 
 	/* reset the DMA */
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: platform hw free failed %d\n",
+			__func__, ret);
+		if (!err)
+			err = ret;
+	}
 
 	/* free widget list */
 	if (free_widget_list) {
 		ret = sof_widget_list_free(sdev, spcm, dir);
-		if (ret < 0)
-			dev_err(sdev->dev, "failed to free widgets during suspend\n");
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: sof_widget_list_free failed %d\n",
+				__func__, ret);
+			if (!err)
+				err = ret;
+		}
 	}
 
-	return ret;
+	return err;
 }
 
 /*
-- 
2.40.1

