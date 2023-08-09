Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA19775FEF
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 14:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC632823;
	Wed,  9 Aug 2023 14:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC632823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691585794;
	bh=vRB65wtDO5YhhgwvbOzlaUWv4c497lx7Jk5HwEtD6dg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OrVy1hPSHC8EihIujRXAsu6Dmc+yR1dFU57uUaVkxgZoe7iO4Pyhnoyh07OjmWbD/
	 +LDnkzTsYuWBkM53gqOjDJNBXkojEqS3BdQtsJxXWdC+zJAC7vHUV4PELIcl/JiDeT
	 InoNkRqs7dNSh3jeEMS4wVFiqB9LPtdBhosBPLPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C78F801EB; Wed,  9 Aug 2023 14:55:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EADE4F80116;
	Wed,  9 Aug 2023 14:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F08DF80134; Wed,  9 Aug 2023 14:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 420A0F800F4
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 14:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 420A0F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=He+eptaX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691585739; x=1723121739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vRB65wtDO5YhhgwvbOzlaUWv4c497lx7Jk5HwEtD6dg=;
  b=He+eptaXN0pMplKpB9HC/Wa58osPVfdJyz6sPV5l1uF+o3YYnJ01H02l
   FsBmDGSHJbIJbZRhmVApFQie/dcdr7vlWx1HSyoWpAhdbHddd4RUQsI6B
   TNdqTNGpqA0h5EdKOGr1dC3qut9hc9cFvDqVp8meLmcwYKi0a8HCHiHpP
   7j/I5svBhPSPLArY9VnR6KKOsGMkPcRe8mIOeqDmo2UuB4QQGrYt7I7s0
   jfxyXBDbfROxd8rwik7G3HlC/R6fF5B6SNVA1WJ/+WPWkZfgpZoOrRQ+C
   SOm2/Kql26PIpbejXF9cc1ije37VNmScd75J1ulacABQdlGRhezlX+KNH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="356079075"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="356079075"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821842608"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200";
   d="scan'208";a="821842608"
Received: from hsyrja-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.210.72])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:55:33 -0700
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
Subject: [PATCH v2] ASoC: SOF: ipc4-topology: Update the basecfg for copier
 earlier
Date: Wed,  9 Aug 2023 15:56:56 +0300
Message-ID: <20230809125656.27585-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3VOR524HYCBBFV6LNTQKGLUBXWXP2OBY
X-Message-ID-Hash: 3VOR524HYCBBFV6LNTQKGLUBXWXP2OBY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VOR524HYCBBFV6LNTQKGLUBXWXP2OBY/>
List-Archive: <>
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
Hi,

changes since v1:
- created on top of for-6.5 branch

The conflict caused by this for 6.6 is trivial as it is just a move
two lines patch.

Regards,
Peter

 sound/soc/sof/ipc4-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a4e1a70b607d..11361e1cd688 100644
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
 	return 0;
 }
 
-- 
2.41.0

