Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B46C46C3
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 10:45:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC3B8E0F;
	Wed, 22 Mar 2023 10:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC3B8E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679478316;
	bh=kSinWM/jmXBFxHcqKoZ00NUSHWPMN0YEnENurhkIJVg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ei5oA1q2eHGsLanvdyjsa5mApZmL3ZVjb5+jxSOz6wHJ04SymVW54baha77O9j/Cq
	 ZSrhJZ+vKRF4mDJD4eUGAxCQ9bklUHItFU8lQvVBmZSaPlW6jAUbedYzufo+kkJI4G
	 RHX5q4wlTx2QBCrZm9RMElLJRw1k27vA6Pj8j1eo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56922F80529;
	Wed, 22 Mar 2023 10:43:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE35F8051B; Wed, 22 Mar 2023 10:43:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1828EF80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 10:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1828EF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j96EZrYn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478207; x=1711014207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kSinWM/jmXBFxHcqKoZ00NUSHWPMN0YEnENurhkIJVg=;
  b=j96EZrYnu//wUH4CR+Yrhafm5uZGG7N3QQNrxvDmabpG3yRlifVo5gRG
   GpLvyH8YhyTRPIwgf2MmF1tK5A3pDB2Y5MTWtLroMs6LhwdGcRB3xVU3F
   4ApO9IwtU1hhqP2cydmOljyO4UaD6BLxa48FOkkSwLm3GTMSvWMEBI9Ny
   yBaCatVjVtrG/1GU599xHl20wtylqtZktzkdfpjPYJQNm6LVaJs8rNx6j
   DT9VADyFtJ8plXq0aFa2EKqcUUPn+XeU8XKv2ahlY8UWeayu0d19qvjIJ
   mnmgGF06qlugaXfnakKZltK9dGDmutDiCesoUtB3YZLosJrRXcXmKB2MS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404055564"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="404055564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714344728"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="714344728"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda-dai: Do not perform DMA cleanup
 during stop
Date: Wed, 22 Mar 2023 11:43:44 +0200
Message-Id: <20230322094346.6019-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
References: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UMBPAZHSNGFZ4SJ5EKJIE5IFZJCCFIVY
X-Message-ID-Hash: UMBPAZHSNGFZ4SJ5EKJIE5IFZJCCFIVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMBPAZHSNGFZ4SJ5EKJIE5IFZJCCFIVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In the case of repeated start/stop without involving hw_free, the stream
tag needs to be preserved for the subsequent starts. So, skip performing
the DMA clean up during stop and handle it only during suspend or
hw_free.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 9637f0f44b01..46a17afdd1ea 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -305,7 +305,6 @@ static int hda_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
 		ret = hda_link_dma_cleanup(substream, hext_stream, dai, codec_dai);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
-- 
2.40.0

