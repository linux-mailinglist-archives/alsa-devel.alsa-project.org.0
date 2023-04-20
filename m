Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D16E932A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ABB5EE3;
	Thu, 20 Apr 2023 13:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ABB5EE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681990970;
	bh=gVMqC/NvgURcBf5FUu5vPKKkV/ORRTMka7i36a0SjeY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ycf6RQtZt8/Fgd8WrYOZkFrbFzeYE20TY0NJjeUfH6t5pSIY6mVD39R8oWgkdYZ0F
	 MnGGdkAwxOOivdXYVXDwEXMa34fx69/f6tPz50pPZA/KuOWyYndGOksOR2sQrdxdrT
	 spRJEMj53F2OXxD0aSTcDWfHNdhednQePgHEKUvI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD197F8052E;
	Thu, 20 Apr 2023 13:41:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E17F80155; Thu, 20 Apr 2023 13:41:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C27F2F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C27F2F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jhLsklP4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681990861; x=1713526861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gVMqC/NvgURcBf5FUu5vPKKkV/ORRTMka7i36a0SjeY=;
  b=jhLsklP42mbuu4exQdDefg17dfaahk7F6K4ZQ9fZAG+iToYMg/iyXj2D
   p0ZUA1+V4d5M6LGm2Kp/YLAE+zNsrtku5a1HQApLjHkkTR2vLFiFX8/gK
   exznhA/5yKBljlSHoM93tLXisafRVnoSNzxwMtGUne4DSb+KH43lKerF3
   DvntEYeYE06xp9DQNJJbGeF3/As2N4ReQTw+j1ZaOG5zHPxPFnk7zpg6n
   RK9eLnofWpsDK7vUAtJKPUaqz5FBUkDtn7FBmodYLiXqjfdPkwGBltChU
   LM/65HTA3ljYhkIKGpDtG9mc5JSPUHtyYnesk7A74mlEL+FLQ1EURtQet
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373606517"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="373606517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021553558"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="1021553558"
Received: from draj-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.253])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:40:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda: Do not stop/start DMA during
 pause/release
Date: Thu, 20 Apr 2023 14:41:36 +0300
Message-Id: <20230420114137.27613-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
References: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XT74IUCKFYFZ63535UXSLTD7HG5GQOAQ
X-Message-ID-Hash: XT74IUCKFYFZ63535UXSLTD7HG5GQOAQ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XT74IUCKFYFZ63535UXSLTD7HG5GQOAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The FW does not pause/stop the host DMA during pause and stopping the
host DMA from the driver could result in an unknown behaviour. So, skip
triggering the HD-Audio host DMA during pause/release.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 79d818e6a0fa..8de422604ad5 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -337,7 +337,13 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 	/* cmd must be for audio stream */
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!sdev->dspless_mode_selected)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
+		if (hstream->running)
+			break;
+
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
 					1 << hstream->index,
 					1 << hstream->index);
@@ -360,8 +366,11 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 			hstream->running = true;
 
 		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (!sdev->dspless_mode_selected)
+			break;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 					sd_offset,
-- 
2.40.0

