Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02253895817
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:23:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FCEF2C5A;
	Tue,  2 Apr 2024 17:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FCEF2C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071396;
	bh=TIDcl3HkmuBuvfpa50RLwxWaoTu2GNlR2qwiNtVLZyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JHfWsEWc5aAdZcNlR8qvvDglWunb8FQjAWkwM8iJjy3KuUV3pfOdAxaRJIYCx7vFU
	 zfPNDhv2UaakEkWrk35+PTtJamWPs4W9FxcSDCPLf3FrGFu9LFWV8em9yz/uAhv2KK
	 ktWa041K/8qZI48JU8mVDaemEPeReaBdgBzorgpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2327BF805C9; Tue,  2 Apr 2024 17:19:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3909F805E1;
	Tue,  2 Apr 2024 17:19:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ECB3F80649; Tue,  2 Apr 2024 17:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 632BFF805DF
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 632BFF805DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=em5qCXlZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071134; x=1743607134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TIDcl3HkmuBuvfpa50RLwxWaoTu2GNlR2qwiNtVLZyU=;
  b=em5qCXlZE53aDgE3LNIgCsVwKi963JuljTedDElT/baHyve+9vkMkOiY
   NolVDR7iYQrWGJNrmIqovGw8vquSowR6HCYV6PK31TgTIo/SlDjZOM7AM
   2q+5TadTHerIMmsTAxEP2NJ0E7SQBXh+e3gFHr2uEtCXHALEKXIDzZ9WD
   vYtCG8S0PmTD8HQ2kHSBcdffZwkGHjxYUBQZClSL6IcigsiLtwHyST5cl
   Gs8KyTdSDmg69SM0onPgsp/gJ5HebAE0eG63zabnIYLl6TwMbGLzQvMXJ
   +jGzAirWnA2nkBPYJ3x5rl5U/crLSCqxllNoqLeeCIiJgOMpu/fHlnGUy
   g==;
X-CSE-ConnectionGUID: j89d4X/kTeytEpmr53ofDQ==
X-CSE-MsgGUID: ldTtQ+3wT5SkOja1lN/+jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730194"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:47 -0700
X-CSE-ConnectionGUID: QQ6oZkIIQV2pxSeYN7EJMQ==
X-CSE-MsgGUID: VA6F25PTRz2MyA9bEJNkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796546"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 15/17] ASoC: SOF: pcm: add pending_stop state variable
Date: Tue,  2 Apr 2024 10:18:26 -0500
Message-Id: <20240402151828.175002-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X56FIRKYSTUJHEBQRW7NZWFXOHTB2BBD
X-Message-ID-Hash: X56FIRKYSTUJHEBQRW7NZWFXOHTB2BBD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X56FIRKYSTUJHEBQRW7NZWFXOHTB2BBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a state variable to keep track of delayed stops, in case
pcm_ops->platform_stop_during_hw_free is set.

This patch should be iso-functionality, possibly removing no-op
cases. The main purpose of this new state variable is to prepare a
follow-up patch to reset all PCM and DMAs in case of stop/prepare xrun
sequences.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 11 +++++++++++
 sound/soc/sof/sof-audio.c |  1 +
 sound/soc/sof/sof-audio.h |  1 +
 3 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index ed09756f6af6..fbd7e045bcfb 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -276,6 +276,8 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: trigger stream %d dir %d cmd %d\n",
 		spcm->pcm.pcm_id, substream->stream, cmd);
 
+	spcm->pending_stop[substream->stream] = false;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		ipc_first = true;
@@ -345,6 +347,15 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		/* invoke platform trigger to stop DMA even if pcm_ops isn't set or if it failed */
 		if (!pcm_ops || !pcm_ops->platform_stop_during_hw_free)
 			snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+
+		/*
+		 * set the pending_stop flag to indicate that pipeline stop has been delayed.
+		 * This will be used later to stop the pipelines during prepare when recovering
+		 * from xruns.
+		 */
+		if (pcm_ops && pcm_ops->platform_stop_during_hw_free &&
+		    cmd == SNDRV_PCM_TRIGGER_STOP)
+			spcm->pending_stop[substream->stream] = true;
 		break;
 	default:
 		break;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b5ca2861edbd..32fef64ef10d 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -852,6 +852,7 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 		}
 
 		spcm->prepared[substream->stream] = false;
+		spcm->pending_stop[substream->stream] = false;
 	}
 
 	/* reset the DMA */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 7c08f915b35b..f4134257789e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -349,6 +349,7 @@ struct snd_sof_pcm {
 	struct list_head list;	/* list in sdev pcm list */
 	struct snd_pcm_hw_params params[2];
 	bool prepared[2]; /* PCM_PARAMS set successfully */
+	bool pending_stop[2]; /* only used if (!pcm_ops->platform_stop_during_hw_free) */
 };
 
 struct snd_sof_led_control {
-- 
2.40.1

