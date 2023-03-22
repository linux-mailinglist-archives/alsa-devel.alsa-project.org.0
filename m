Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468436C6939
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:12:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58596ECF;
	Thu, 23 Mar 2023 14:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58596ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577123;
	bh=kfN9SenAdQDA4pArUtorjPOHqmMemYP6aWKfJD2B1Ec=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qelzv1C6pvRG45BTiwW7qfhWhSqSE05EPSrM07UVI7lnnWV3dYVJZd4eSVunKxHsY
	 nR+yecnCZT5md0qLyvbS98+/ZtLmZRPo3RRr+tm15ZCelqX4mdD/wCxYWJcffTFbL5
	 4LxsUbK0QOqIWmGeKl6v+vDw/lptEh8YVyiBlkjM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E203FF80568;
	Thu, 23 Mar 2023 14:10:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB25F8027B; Wed, 22 Mar 2023 19:19:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A71EF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 19:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A71EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nsIZJwxR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679509155; x=1711045155;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kfN9SenAdQDA4pArUtorjPOHqmMemYP6aWKfJD2B1Ec=;
  b=nsIZJwxRBDsc8tlcbMRJbCIU2xzcKVX/WAhIIE1Wo/IX5lFhZegoAu0c
   umUBGzyQAQSQuqpttbvtw+NFJlqZGJaqM5aHx9xjLMhit71ICcgUn3eLK
   rUZRTBbAe8BHVzsZs24NWdBYoRbbWzrwq9HwL83HCjFdtYnwohi3shLKl
   liKo+qkqOhoU888iFHOM21R3kKibbg7waqIlectyMIRxpL8w4nSBDUW3h
   msIKdiPQrziYo9XaydLH9lYU/JVr0o98DL1jh5lUdEFjx99eRTefCKkdo
   mYibXv/FnzQ/k59alaNFhFxAjyAoUT5URpxwa9eM6wGWhXOgQ9NF+hea4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="425586038"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="425586038"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 11:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011471742"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="1011471742"
Received: from harith2x-mobl1.gar.corp.intel.com (HELO jsarha-desk.intel.com)
 ([10.249.254.178])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 11:18:57 -0700
From: Jyri Sarha <jyri.sarha@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4/intel: Add missing mutex_unlock()
Date: Wed, 22 Mar 2023 20:18:30 +0200
Message-Id: <20230322181830.574635-1-jyri.sarha@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: jyri.sarha@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5PGIIYVBEL55VRAXRDTKGII5OOYQSDI7
X-Message-ID-Hash: 5PGIIYVBEL55VRAXRDTKGII5OOYQSDI7
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:10:00 +0000
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, rander.wang@intel.com, error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PGIIYVBEL55VRAXRDTKGII5OOYQSDI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There was a missing mutex_unlock() in sof_ipc4_widget_free()
use_chain_dma if-branch that caused a static analysis error. The
branch should not be used in a normal working configuration and if its
used its an indication of a bad topology. Add missing mutex_unlock()
and a warning print if the if-branch is taken, and another warning
print to a symmetric place in sof_ipc4_widget_setup().

Fixes: ca5ce0caa67fa9 ("ASoC: SOF: ipc4/intel: Add support for chained DMA")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202303222050.dCw0fPCW-lkp@intel.com/
Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f1e1aed94da4..12775fcb6b54 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1989,8 +1989,11 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
 
-		if (pipeline->use_chain_dma)
+		if (pipeline->use_chain_dma) {
+			dev_warn(sdev->dev, "use_chain_dma set for schduler %s",
+				 swidget->widget->name);
 			return 0;
+		}
 
 		dev_dbg(sdev->dev, "pipeline: %d memory pages: %d\n", swidget->pipeline_id,
 			pipeline->mem_usage);
@@ -2145,8 +2148,12 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct sof_ipc4_msg msg = {{ 0 }};
 		u32 header;
 
-		if (pipeline->use_chain_dma)
+		if (pipeline->use_chain_dma) {
+			dev_warn(sdev->dev, "use_chain_dma set for schduler %s",
+				 swidget->widget->name);
+			mutex_unlock(&ipc4_data->pipeline_state_mutex);
 			return 0;
+		}
 
 		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
 		header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_DELETE_PIPELINE);
-- 
2.34.1

