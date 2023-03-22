Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C26C46C2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 10:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41817DEF;
	Wed, 22 Mar 2023 10:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41817DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679478315;
	bh=IMSUJscWj/Kf2VkSRTrJX4MwZG1P05ImvT+xKxHJqfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RS87mnxqS9vIf6HoZkHm+w5FyDY4QL7zJMjUsV6s83o4qx2LgleFgMl4g4GCg93XG
	 wI36XXQjFK1/5LjAvKrdxL4zslfQTNzV2LIFZMCtFgyN1imG7OB53Tv9nXLmeQgaLw
	 iDbKZbELRUYIBBXOk//OXb5wie5AkgQWGzD0HEro=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2860F804B1;
	Wed, 22 Mar 2023 10:43:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA53AF80482; Wed, 22 Mar 2023 10:43:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29761F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 10:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29761F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aRYdM509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478208; x=1711014208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IMSUJscWj/Kf2VkSRTrJX4MwZG1P05ImvT+xKxHJqfQ=;
  b=aRYdM509W6atnydJgn0/4ORv7WPUCdM4kdIkI2hEUuUPd1EFIYiJjMVm
   543W78sAzKSm5euB/foz1d3ph35yZF+jr9ARmPdhBkgnHDOrxZNOqEWJQ
   eupIxdnD7GbrlteniWNzAKQPKg/mSEz6fUezfcfVDg1ibnCo22wWWqab/
   SeFOIEjEZ60Sc+ADWlgFXYBR/cDX+Uyk1zMGZxktgbD086pGaNtsSYfjY
   QMuyPt12k4p9lxwKELi4oqa0O5+nhUNZBXQAq/BCN9kKPCTfUZ7yQUafw
   ETEEwof4Sq/O++lIBYEGpAh/yb6Tijux0IMJoeqk8dOMT/KV2gI22YkLs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404055585"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="404055585"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714344730"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="714344730"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: pcm: Make hw_params reset conditional for IPC3
Date: Wed, 22 Mar 2023 11:43:45 +0200
Message-Id: <20230322094346.6019-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
References: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RSJMCQNHXEOWEWFGQCOIJWWFG6JVOCBQ
X-Message-ID-Hash: RSJMCQNHXEOWEWFGQCOIJWWFG6JVOCBQ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSJMCQNHXEOWEWFGQCOIJWWFG6JVOCBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In the case of IPC4, since there is no PCM_PARAMS IPC to send the new
stream tag when restarting a stream without a hw_free, the original
stream tag needs to be preserved. So, add new a flag as part of struct
sof_ipc_pcm_ops, reset_hw_params_during_stop and set it only for IPC3.
This will ensure that the host DMA stream tag will not be given up during
the STOP trigger for IPC4.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-pcm.c  | 1 +
 sound/soc/sof/pcm.c       | 3 ++-
 sound/soc/sof/sof-audio.h | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index b29d93e0d216..b7f1eb21ca26 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -382,4 +382,5 @@ const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
 	.hw_free = sof_ipc3_pcm_hw_free,
 	.trigger = sof_ipc3_pcm_trigger,
 	.dai_link_fixup = sof_ipc3_pcm_dai_link_fixup,
+	.reset_hw_params_during_stop = true,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 445acb5c3a21..f75b161125fa 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -328,7 +328,8 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		ipc_first = true;
-		reset_hw_params = true;
+		if (pcm_ops && pcm_ops->reset_hw_params_during_stop)
+			reset_hw_params = true;
 		break;
 	default:
 		dev_err(component->dev, "Unhandled trigger cmd %d\n", cmd);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index d220af5f08fb..81685e778ad6 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -104,6 +104,8 @@ struct snd_sof_dai_config_data {
  * @pcm_free: Function pointer for PCM free that can be used for freeing any
  *	       additional memory in the SOF PCM stream structure
  * @delay: Function pointer for pcm delay calculation
+ * @reset_hw_params_during_stop: Flag indicating whether the hw_params should be reset during the
+ *				 STOP pcm trigger
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -117,6 +119,7 @@ struct sof_ipc_pcm_ops {
 	void (*pcm_free)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
 	snd_pcm_sframes_t (*delay)(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream);
+	bool reset_hw_params_during_stop;
 };
 
 /**
-- 
2.40.0

