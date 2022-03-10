Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339994D4056
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52A517F1;
	Thu, 10 Mar 2022 05:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52A517F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886713;
	bh=7MYXtZnKDHSo2xbbMJ6vVclEE+XkS9Gx/S0AK9K0fXM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glJy/6usxqgM87XeBP8O4SjrQZoGJhNezX1x/bpBRaE3zZe02UHErdPgKjHTVAyEA
	 Nc1r2vB+B3+wpmCZOKopAQ5tHbvHSk6AEb7PSCNA3iyYN6/Thzk68BHBc9yLrShypt
	 HcYpRcw3MaYOULWyZZm/p73rmPV7845JT2uFawr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54DE2F80558;
	Thu, 10 Mar 2022 05:28:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BA4DF8052F; Thu, 10 Mar 2022 05:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CE44F80516
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CE44F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="agYhfiwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886471; x=1678422471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7MYXtZnKDHSo2xbbMJ6vVclEE+XkS9Gx/S0AK9K0fXM=;
 b=agYhfiwz7J9MfwQ6XrTDVTewhcN4iq5vhN/BAXodVBRdatKSyRJW4fRp
 LbLwHqcbeLNzRkgA9QGKWVwD+66/VPnk38s59mzRrOUFxAMnhO0Yy8ibw
 YnuqttJbr9eOSDq4mSt1R30LNu4EHZHMOqM/0hqpu6CL++Uc2c8RdKJCk
 hjg71FKcniQPT3JNFx/pqGVF2+J8sWtcf2IJoTAIwZuuszJkG/n8/zlTE
 meeC/zW8jQfgB/SOuhKeqCK8chGYxXNWlIMq2zi+TX5M2W1B3d64ASNiz
 TdKTvIvFR8M86Z5RXvXWhY9Bc6BxUeCFnHhdInDyyDouUVcSKmTJ99eJ2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380900"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:33 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884698"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: SOF: Remove ipc_pcm_params() ops
Date: Wed,  9 Mar 2022 20:27:20 -0800
Message-Id: <20220310042720.976809-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

All users have been converted to use the IPC agnostic
set_stream_data_offsett()

Remove all code related to the old API.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ops.h        | 13 -------------
 sound/soc/sof/pcm.c        |  7 -------
 sound/soc/sof/sof-priv.h   |  8 --------
 sound/soc/sof/stream-ipc.c |  8 --------
 4 files changed, 36 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index aeea73efcb2f..a19474663767 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -466,19 +466,6 @@ static inline int snd_sof_ipc_msg_data(struct snd_sof_dev *sdev,
 {
 	return sof_ops(sdev)->ipc_msg_data(sdev, substream, p, sz);
 }
-
-/* host configure DSP HW parameters */
-static inline int
-snd_sof_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply)
-{
-	if (sof_ops(sdev) && sof_ops(sdev)->ipc_pcm_params)
-		return sof_ops(sdev)->ipc_pcm_params(sdev, substream, reply);
-
-	return 0;
-}
-
 /* host side configuration of the stream's data offset in stream mailbox area */
 static inline int
 snd_sof_set_stream_data_offset(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index af8c367cd55c..d402f288acf5 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -269,13 +269,6 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	ret = snd_sof_ipc_pcm_params(sdev, substream, &ipc_params_reply);
-	if (ret < 0) {
-		dev_err(component->dev, "%s: got wrong reply for PCM %d\n",
-			__func__, spcm->pcm.pcm_id);
-		return ret;
-	}
-
 	ret = snd_sof_set_stream_data_offset(sdev, substream,
 					     ipc_params_reply.posn_offset);
 	if (ret < 0) {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 49e4d87bd467..0a916eb4f149 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -221,11 +221,6 @@ struct snd_sof_dsp_ops {
 			    struct snd_pcm_substream *substream,
 			    void *p, size_t sz); /* mandatory */
 
-	/* host configure DSP HW parameters */
-	int (*ipc_pcm_params)(struct snd_sof_dev *sdev,
-			      struct snd_pcm_substream *substream,
-			      const struct sof_ipc_pcm_params_reply *reply); /* optional */
-
 	/* host side configuration of the stream's data offset in stream mailbox area */
 	int (*set_stream_data_offset)(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream,
@@ -623,9 +618,6 @@ int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
 int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream,
 		     void *p, size_t sz);
-int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply);
 int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
 			       size_t posn_offset);
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index b7b96b9f5279..5f1ceeea893a 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -65,14 +65,6 @@ int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL(sof_set_stream_data_offset);
 
-int sof_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply)
-{
-	return sof_set_stream_data_offset(sdev, substream, reply->posn_offset);
-}
-EXPORT_SYMBOL(sof_ipc_pcm_params);
-
 int sof_stream_pcm_open(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream)
 {
-- 
2.25.1

