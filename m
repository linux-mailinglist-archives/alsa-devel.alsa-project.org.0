Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF352783A3C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 08:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5113827;
	Tue, 22 Aug 2023 08:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5113827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692687584;
	bh=uq5d2VFwbo61xqp3noA3m9L83VIu7Z/eBc/51tysU5g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T6kcq+289lz+b1sNIRuXhQBsmJCvVQNmr5rofizzmT4GDy35bTQ8BwKfmUz7SRlSC
	 FNWR5gnbRos6bdzkqyCVLkot2TOvmzlclnePB09Z2X04W7Y8HIHblEn8ySpEfIavrE
	 iZXhuXvoKHLsBFxm9oOc4plEb1yul+BYA12/5rsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66D91F80551; Tue, 22 Aug 2023 08:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 868F8F800F5;
	Tue, 22 Aug 2023 08:58:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE90CF80158; Tue, 22 Aug 2023 08:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1448F800BF
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 08:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1448F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ds1TkpL5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692687270; x=1724223270;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uq5d2VFwbo61xqp3noA3m9L83VIu7Z/eBc/51tysU5g=;
  b=ds1TkpL5TNr8W0b9VXCheKQmeXtOBUZf06/6f142L/URRKX6gTG9PBBk
   oIQIyPV/nTlU1UaO9SXFyJ/kCVJ7BmDsjqpwWZJiWfqS9bJme1H0KChg5
   q5sykfK7++RmjGai4I64lfRIelhX3Edt7YN+BXRzk2kS71gZsZk3DkTXi
   D0kJrHhShJd1NAzR/BTMgQlRvmiKSVOPrGfVWzD3EJlI+jUgGmJ2umUIm
   /TpVtVSW33Cz371QDfULuc29RCDFbV03MPANkWG6VGnsaB+C6Iuz44xXh
   FStrUGan2ywz7EYeRpSXVuLUI1Nw3ZTNkvszj5o8MQYg4KTZdsg9U5PNf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358788070"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200";
   d="scan'208";a="358788070"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 23:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826214772"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200";
   d="scan'208";a="826214772"
Received: from omillerx-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.40.215])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 23:54:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Add module parameter to ignore the
 CPC value
Date: Tue, 22 Aug 2023 09:54:19 +0300
Message-ID: <20230822065419.24374-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZP5BAGZAEBJSLD4RFI4WW7CTJB3J5K2G
X-Message-ID-Hash: ZP5BAGZAEBJSLD4RFI4WW7CTJB3J5K2G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZP5BAGZAEBJSLD4RFI4WW7CTJB3J5K2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new module parameter ipc4_ignore_cpc which can be used to force the
kernel to ignore the queried CPC value for all firmware modules and use 0
instead.

The CPC lookup is still done to report missing configurations and the
debug print is going to be different to be explicit that the CPC is ignored
and what was the value we would have used.

The CPC value is sent to the firmware with the MOD_INIT_INSTANCE message
and it is used by the firmware as a parameter for clock scaling.

The flag is intended to be used only when there is a need to validate the
firmware behavior regarding to clock scaling since the 0 CPC value will
force the DSP to run in full speed, disabling the scaling and provides
additional counter point to rule out clock management related issues.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 633f6040d712..733e5bff59a1 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -17,6 +17,19 @@
 #include "ipc4-topology.h"
 #include "ops.h"
 
+/*
+ * The ignore_cpc flag can be used to ignore the CPC value for all modules by
+ * using 0 instead.
+ * The CPC is sent to the firmware along with the SOF_IPC4_MOD_INIT_INSTANCE
+ * message and it is used for clock scaling.
+ * 0 as CPC value will instruct the firmware to use maximum frequency, thus
+ * deactivating the clock scaling.
+ */
+static bool ignore_cpc;
+module_param_named(ipc4_ignore_cpc, ignore_cpc, bool, 0444);
+MODULE_PARM_DESC(ipc4_ignore_cpc,
+		 "Ignore CPC values. This option will disable clock scaling in firmware.");
+
 #define SOF_IPC4_GAIN_PARAM_ID  0
 #define SOF_IPC4_TPLG_ABI_SIZE 6
 #define SOF_IPC4_CHAIN_DMA_BUF_SIZE_MS 2
@@ -970,9 +983,16 @@ sof_ipc4_update_resource_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	/* Update base_config->cpc from the module manifest */
 	sof_ipc4_update_cpc_from_manifest(sdev, fw_module, base_config);
 
-	dev_dbg(sdev->dev, "%s: ibs / obs / cpc: %u / %u / %u\n",
-		swidget->widget->name, base_config->ibs, base_config->obs,
-		base_config->cpc);
+	if (ignore_cpc) {
+		dev_dbg(sdev->dev, "%s: ibs / obs: %u / %u, forcing cpc to 0 from %u\n",
+			swidget->widget->name, base_config->ibs, base_config->obs,
+			base_config->cpc);
+		base_config->cpc = 0;
+	} else {
+		dev_dbg(sdev->dev, "%s: ibs / obs / cpc: %u / %u / %u\n",
+			swidget->widget->name, base_config->ibs, base_config->obs,
+			base_config->cpc);
+	}
 }
 
 static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
-- 
2.41.0

