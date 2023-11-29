Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A47FD6A6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:22:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F590BC0;
	Wed, 29 Nov 2023 13:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F590BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701260563;
	bh=+h/1jrB8qMUMeoBFiHU2NC+s08NbthFNAtV/926NzjQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TlHnDrNEmggyHA87eF/3xO2V7Yk983VIN/wK997KOuk3xiFX0qu+nEcw+VuC0TrBq
	 VB+05cdzxcUgYWUxpg9Vkzer6fbY1nXTCAFEf8uItmy5kCulPRLgvzxJWNvhQR+S75
	 qV7j4CMX2UkDx1hlGRdEGexDLmBcDLQdewbpT70s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB89CF8055A; Wed, 29 Nov 2023 13:22:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C95A9F80570;
	Wed, 29 Nov 2023 13:22:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96926F8016E; Wed, 29 Nov 2023 13:22:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC7B2F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7B2F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IkcrLzHp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701260525; x=1732796525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+h/1jrB8qMUMeoBFiHU2NC+s08NbthFNAtV/926NzjQ=;
  b=IkcrLzHp5LMbcwmH7Gtbo4p+zbc6Bak3k5k65qYt7MLDXQ5v2EsC7ZQR
   4ZRFKQxR6WAyYgcPREzB8hEcOBy4+5mP9l/qNPmIq5+GEkcX9vtm02Fvd
   PXOBVayfcfvrb6pwlkLFrEtL7jhohDUisQ+yz6rj0yl3KYCWgBkW/NtFe
   /PrSx0rV6fUTDY0tvBnsMmiqZQMtx0jEKeWMTJV/nBZLiNjJG1yNh8wCQ
   4VeWdvyYMLg5rpOaeevQ68LHAjocHH6Nd0eE64y735/NcBm9BPHPD8qaN
   JVgUYBdqJOuKY41d1F5w1feKINZgRnFqXbnJ6wMrAx876YswUm7Xo6Xcl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="397051476"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="397051476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="718746647"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="718746647"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:21:59 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	baofeng.tian@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Add module ID print during module
 set up
Date: Wed, 29 Nov 2023 14:22:34 +0200
Message-ID: <20231129122234.14515-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZ3YQOPYLN7UNDKJ23433Z3LLBPHJXLP
X-Message-ID-Hash: KZ3YQOPYLN7UNDKJ23433Z3LLBPHJXLP
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZ3YQOPYLN7UNDKJ23433Z3LLBPHJXLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Baofeng Tian <baofeng.tian@intel.com>

This module ID will be used for module performance automatic analysis
for different modules, module name, module ID and module instance ID
will be combined as a new generated ID for current module, this ID
will be further used by analysis tools to identify current module.

Take below case as example:
0x030006 gain.11.1
3 is module instance ID, 6 is module ID and gain.11.1 is module name.

For pipeline widget print, keep as it is.

Signed-off-by: Baofeng Tian <baofeng.tian@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b89065abb511..01f3f56495cd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2392,6 +2392,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	}
 
 	if (swidget->id != snd_soc_dapm_scheduler) {
+		int module_id = msg->primary & SOF_IPC4_MOD_ID_MASK;
+
 		ret = sof_ipc4_widget_assign_instance_id(sdev, swidget);
 		if (ret < 0) {
 			dev_err(sdev->dev, "failed to assign instance id for %s\n",
@@ -2407,9 +2409,15 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		msg->extension &= ~SOF_IPC4_MOD_EXT_PPL_ID_MASK;
 		msg->extension |= SOF_IPC4_MOD_EXT_PPL_ID(pipe_widget->instance_id);
+
+		dev_dbg(sdev->dev, "Create widget %s (pipe %d) - ID %d, instance %d, core %d\n",
+			swidget->widget->name, swidget->pipeline_id, module_id,
+			swidget->instance_id, swidget->core);
+	} else {
+		dev_dbg(sdev->dev, "Create pipeline %s (pipe %d) - instance %d, core %d\n",
+			swidget->widget->name, swidget->pipeline_id,
+			swidget->instance_id, swidget->core);
 	}
-	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
-		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
 
 	msg->data_size = ipc_size;
 	msg->data_ptr = ipc_data;
-- 
2.43.0

