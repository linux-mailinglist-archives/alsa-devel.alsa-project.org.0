Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DAB6C46C9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 10:46:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF98AE9;
	Wed, 22 Mar 2023 10:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF98AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679478359;
	bh=NXMFXatMxOuaODRNFKJ/ihp52SVIVcWZrZnfBv9FLXU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jNbspjTYeG3FKyv2bqhIfC1NGGz0Vlc0sBmV60YUmSPJ9PEw9CNdv/rDeFa6SCDTG
	 JrHFQBt57yWGvAcPkbDG3f4QbP+kIhIFfjT8gbEdtjO0xvYANuGSn3bd8b3ufonB5s
	 bbY0KkXpz+UTKrBEsIAxtFq2Gi5uDaVCkWKWPlxs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4868CF8027B;
	Wed, 22 Mar 2023 10:45:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E985F8027B; Wed, 22 Mar 2023 10:45:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F63EF802E8
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 10:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F63EF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tl8OBhtk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478209; x=1711014209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NXMFXatMxOuaODRNFKJ/ihp52SVIVcWZrZnfBv9FLXU=;
  b=Tl8OBhtkOKqCImhS92VTOMZkRBdoaxFKHko8nwzUsLWfWmQlyzQH9U4w
   lp8fwvrr+8KK5k1ad8rZq340MI8zE0C4RVpHyaWYChPbUXppJl4Gpwiwn
   FjpgSf010v768U7iBItq+lkUPxp73w2Kzq34bbjWkwvS6XwBpK8DudQbZ
   ULFMsOUsRjJf1Ij+1Yc/QaHn571P88I0hjaylH7lCEpskRVsBTsqvuYfo
   DDYr5MltqGJBoneUoLgwzL2fJoOF684VotH0GhBdVmYuiJzu/cJ9k9zoH
   WVEcaXbAKORrdElrYCX/Jr1jslUCXrsN0uSy/6bZGA45JArFUGoLY/2S/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404055596"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="404055596"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714344731"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="714344731"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: pcm: Improve the pcm trigger sequence
Date: Wed, 22 Mar 2023 11:43:46 +0200
Message-Id: <20230322094346.6019-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
References: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZNNOWOWSENOLKPQWLLUYBDSZY4MPTEQ5
X-Message-ID-Hash: ZNNOWOWSENOLKPQWLLUYBDSZY4MPTEQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNNOWOWSENOLKPQWLLUYBDSZY4MPTEQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The recommended sequence for triggering the host DMA is to first program
the DMA in the FW before setting the RUN bit to start the stream in the
host. With IPC3, this sequence is honored because the FW programs the
DMA when the HW_PARAMS IPC is sent during PCM hw_params and then the host
sets the RUN bit during sof_pcm_trigger(). But with IPC4,
sof_pcm_trigger() sends the SET_PIPELINE_STATE IPC to program the DMA in
the FW after the DMA RUN bit is set.

In order to minimize the impact for IPC3, introduce a new flag as part
of struct sof_ipc_pcm_ops, ipc_first_on_start, which will be set for IPC4
only. With this flag set, the SET_PIPELINE_STATE IPC will be sent before
the DMA RUN bit is set by the host during the START/PAUSE_RELEASE
triggers.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c  |  3 ++-
 sound/soc/sof/pcm.c       | 26 ++++++++++++++++++++------
 sound/soc/sof/sof-audio.h |  3 +++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 4598057b7f28..b789926dce2a 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -721,5 +721,6 @@ const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
 	.dai_link_fixup = sof_ipc4_pcm_dai_link_fixup,
 	.pcm_setup = sof_ipc4_pcm_setup,
 	.pcm_free = sof_ipc4_pcm_free,
-	.delay = sof_ipc4_pcm_delay
+	.delay = sof_ipc4_pcm_delay,
+	.ipc_first_on_start = true
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f75b161125fa..d9b4633bba7a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -301,6 +301,8 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		ipc_first = true;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (pcm_ops && pcm_ops->ipc_first_on_start)
+			ipc_first = true;
 		break;
 	case SNDRV_PCM_TRIGGER_START:
 		if (spcm->stream[substream->stream].suspend_ignored) {
@@ -312,6 +314,9 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 			spcm->stream[substream->stream].suspend_ignored = false;
 			return 0;
 		}
+
+		if (pcm_ops && pcm_ops->ipc_first_on_start)
+			ipc_first = true;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		if (sdev->system_suspend_target == SOF_SUSPEND_S0IX &&
@@ -336,19 +341,28 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	/*
-	 * DMA and IPC sequence is different for start and stop. Need to send
-	 * STOP IPC before stop DMA
-	 */
 	if (!ipc_first)
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
 	if (pcm_ops && pcm_ops->trigger)
 		ret = pcm_ops->trigger(component, substream, cmd);
 
-	/* need to STOP DMA even if trigger IPC failed */
-	if (ipc_first)
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_START:
+		/* invoke platform trigger to start DMA only if pcm_ops is successful */
+		if (ipc_first && !ret)
+			snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		/* invoke platform trigger to stop DMA even if pcm_ops failed */
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+		break;
+	default:
+		break;
+	}
 
 	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
 	if (!ret && reset_hw_params)
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 81685e778ad6..6c64376858b3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -106,6 +106,8 @@ struct snd_sof_dai_config_data {
  * @delay: Function pointer for pcm delay calculation
  * @reset_hw_params_during_stop: Flag indicating whether the hw_params should be reset during the
  *				 STOP pcm trigger
+ * @ipc_first_on_start: Send IPC before invoking platform trigger during
+ *				START/PAUSE_RELEASE triggers
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -120,6 +122,7 @@ struct sof_ipc_pcm_ops {
 	snd_pcm_sframes_t (*delay)(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream);
 	bool reset_hw_params_during_stop;
+	bool ipc_first_on_start;
 };
 
 /**
-- 
2.40.0

