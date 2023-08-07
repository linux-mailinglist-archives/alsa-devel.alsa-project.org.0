Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478977730F2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8FD847;
	Mon,  7 Aug 2023 23:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8FD847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442736;
	bh=jgymx4mmC5mKtvqf1f6iKS++qHkEJTbB+DWVED3mUjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GCF/KNsia5uvl5wn91ZVRcWmo/RBCLe3Po/riWINAPGLhJNnbbheLCY+/P2BnmNTE
	 LF0+KJuxNDCfcxPy5TI7kdmBNJI0XjbtA9MoQ65lDcd332YFnjPOedYO3UF+JxOFAw
	 vDLxzp2I30YupIAF1sKLPxTYEWbHbz1YGZWtNv50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E33EF8059F; Mon,  7 Aug 2023 23:10:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98CA0F80520;
	Mon,  7 Aug 2023 23:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A920F80558; Mon,  7 Aug 2023 23:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 834AFF8051E
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 834AFF8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZVApWFg5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442619; x=1722978619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jgymx4mmC5mKtvqf1f6iKS++qHkEJTbB+DWVED3mUjY=;
  b=ZVApWFg5i5jOF/otBXArWggjJvOz52446s+g1IMzTQdxIYbVFBDP1KzF
   52RuQq34CDPgJHI68lAdkvhZEPsQ3sihUGp2qVYRirqEubO2Gh9jscVxh
   dIM1xa9zMcUUP2F3uNHUdnWjVQWSzc74SJ/OBQdpivoSjujtNZ6FBk8Bg
   hcmDkU3Sie/9IqDlemrGKrMQY1jGCskoU5yjclDMtTELgsOKqB4QoYF14
   vX7OmxYWPIM9aw47kiX+k8VmkFiJgdIhQDS9BCTXG5L9UpmtihmVI7ewd
   F7/dz1l4NUruuDeeNgCJbMZevVUnu4Wk4yVG+srUrK6SAp66Ru4jtOeBr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244320"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244320"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465174"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465174"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 04/20] ASoC: SOF: ipc4-topology: restore gateway config length
Date: Mon,  7 Aug 2023 16:09:43 -0500
Message-Id: <20230807210959.506849-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ITRQWETYJLWHUIOCOQVJL7BETMEIJEXT
X-Message-ID-Hash: ITRQWETYJLWHUIOCOQVJL7BETMEIJEXT
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The initial code had a logic flaw where the gateway config length kept
increasing after each playback/capture trigger, with the DMA config
TLV being added at every call of sof_ipc4_prepare_copier_module()

This didn't cause any issues with regular playback/capture, but this
was flagged as an error by firmware in the case of multiple amplifiers
on different links.

Fixes: a0659f81c348 ("ASoC: SOF: ipc4-topology: add DMA config TLV to IPC data")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 9bc94be072aa..0196cbfc0998 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1746,6 +1746,12 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
 
+	/*
+	 * Restore gateway config length now that IPC payload is prepared. This avoids
+	 * counting the DMA CONFIG TLV multiple times
+	 */
+	copier_data->gtw_cfg.config_length = gtw_cfg_config_length / 4;
+
 	return 0;
 }
 
-- 
2.39.2

