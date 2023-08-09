Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A377564C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 11:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CAA210;
	Wed,  9 Aug 2023 11:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CAA210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691573012;
	bh=rgoOmqOcSirYrBFc9S8ea4wogUX8Ghe6L+0+QheD3xE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JdPEUJbN+MrDLOk8bf2JEV2MpZ92rx3aLNI+m8sm4Uph4vN4U4p5nKeUjr5YdwgIg
	 SVYfpTZ+19TEo4UjYRvLN3WO0LzQJ+Ann/17b+540NRSTSFUn+77kxTpLVUfK2IthA
	 O7jQkCM19w7CjTtFp1Z6bMbuhpOPsTsEEREjYcQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E9DF80551; Wed,  9 Aug 2023 11:22:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F0BAF80116;
	Wed,  9 Aug 2023 11:22:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF092F80134; Wed,  9 Aug 2023 11:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 631C3F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 11:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 631C3F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G2q0pv6H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691572950; x=1723108950;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rgoOmqOcSirYrBFc9S8ea4wogUX8Ghe6L+0+QheD3xE=;
  b=G2q0pv6Hc9IiNDxTxKUy6ZM9zEa/3ldfKMNfU2B+Pk6uovuLZYjnxjVS
   TXwQMBL0aX6iVo5A8tUtH+SmBOLE2HKvAagNFgVRxDgs4jMlPgzpub623
   4h4uJ/LooEup/k+wm+tjIsvVXaIkh6/HWzfgNXJ0ptVSKFzVtAnOlN3ro
   5mWDDAz04lwQcFLVAEvLsV+sHSgFEdFZFhC4b1sLmtRjFZBOrfDIyk248
   8q1TUTII7yQ7azItLXCkhpFjAWfAN/ydmUljxTH/kXq8rOq90JETkfT6V
   ZNrrpugIXTfr8LrbKcdaiyK25fnaSrkz/dD8RfnCIGeuY1VwQ2lGV2qog
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374783641"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200";
   d="scan'208";a="374783641"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 02:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="725300226"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200";
   d="scan'208";a="725300226"
Received: from hsyrja-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.210.72])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 02:22:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	adrian.bonislawski@intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Update the basecfg for copier
 earlier
Date: Wed,  9 Aug 2023 12:23:43 +0300
Message-ID: <20230809092343.12666-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HYHGJ6PK4LXVLPNSIO3M55H7W4AOJZZR
X-Message-ID-Hash: HYHGJ6PK4LXVLPNSIO3M55H7W4AOJZZR
X-MailFrom: peter.ujfalusi@linux.intel.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYHGJ6PK4LXVLPNSIO3M55H7W4AOJZZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sof_ipc4_update_resource_usage() call updates the CPC value in basecfg
and it must be done prior to making a copy of the copier configuration
for the init message.
Other module types do the resource update as last step or in case of a
process module at the correct time, before the memcpy.

Fixes: d8a2c9879349 ("ASoC: SOF: ipc4-loader/topology: Query the CPC value from manifest")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Adrian Bonislawski <adrian.bonislawski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 0196cbfc0998..633f6040d712 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1731,6 +1731,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	*ipc_config_size = ipc_size;
 
+	/* update pipeline memory usage */
+	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
+
 	/* copy IPC data */
 	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
 	if (gtw_cfg_config_length)
@@ -1743,9 +1746,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		       gtw_cfg_config_length,
 		       &ipc4_copier->dma_config_tlv, dma_config_tlv_size);
 
-	/* update pipeline memory usage */
-	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
-
 	/*
 	 * Restore gateway config length now that IPC payload is prepared. This avoids
 	 * counting the DMA CONFIG TLV multiple times
-- 
2.41.0

