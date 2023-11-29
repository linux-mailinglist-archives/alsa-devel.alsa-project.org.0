Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87557FD743
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:56:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37B93950;
	Wed, 29 Nov 2023 13:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37B93950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262618;
	bh=NwkJ4JpFAhafLWsA+PodhPkUe4hcZqJFbYrmTFDkhBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HYVVjEX3VR4i9hqvTOTDVRToDc4TlwPb6Pi01I8XR91/bfym8f9QFHa74dNCLcZRY
	 lrXAmUuSN9ZFQuUYCBxCzvRDJSC2MCZyYNxAIwe4aiOarQQg/uNJ2uxcjpnUeWGpUg
	 jtJQfEU/SaA3sfhIH8nzZ/wqo/B4hVQjAFjAwr/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75DB7F807B5; Wed, 29 Nov 2023 13:53:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DD5F8079B;
	Wed, 29 Nov 2023 13:53:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 208BEF80736; Wed, 29 Nov 2023 13:53:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 688FFF8057F
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688FFF8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A9OjRcsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262392; x=1732798392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwkJ4JpFAhafLWsA+PodhPkUe4hcZqJFbYrmTFDkhBU=;
  b=A9OjRcsrzp89EDVMRk00TCXeFOgf31sp5GIjod494xWwKwk/GQGmz39E
   WzvEy5tXoJZMl/YXlv/e1e5oU97c3cQ7cC93mcregz16YN5XLtJTwoaDy
   vBIIitZcmitumqcpbWg/uoabt8iqfosoU028OhwmvAf3nqlXVdkmgh4m6
   sY5KUzHjTqMSgjnPV0e8g+Iz80+re2ccX2EoqKoK5GI8l4BfwifikcJvc
   gwyQcBY73cmNXRJzap69NFbL/aDloFr1vqU5q7cu3xmf/lW76z+DZPRKD
   i0qo+JuUheqc636qCmiHLblLkZhN0gJQ8fpNgPG3kEx6titn4zuqI3vn/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022946"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174643"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 08/13] ASoC: SOF: sof-acpi-dev: Rely on core to create the
 file paths
Date: Wed, 29 Nov 2023 14:53:22 +0200
Message-ID: <20231129125327.23708-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7LVEUWFD26ODU5FTCKBHZWIFLV2O2RRT
X-Message-ID-Hash: 7LVEUWFD26ODU5FTCKBHZWIFLV2O2RRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LVEUWFD26ODU5FTCKBHZWIFLV2O2RRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The core is now using the information from ipc_file_profile_base to create
the paths for the loadable files, no need to set it in here anymore.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 87c0c2edc4c9..2977f0a63fba 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -74,18 +74,6 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC_TYPE_3];
-
-	/* alternate fw and tplg filenames ? */
-	if (fw_path)
-		sof_pdata->fw_filename_prefix = fw_path;
-	else
-		sof_pdata->fw_filename_prefix = desc->default_fw_path[SOF_IPC_TYPE_3];
-
-	if (tplg_path)
-		sof_pdata->tplg_filename_prefix = tplg_path;
-	else
-		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
 	sof_pdata->ipc_file_profile_base.ipc_type = desc->ipc_default;
 	sof_pdata->ipc_file_profile_base.fw_path = fw_path;
-- 
2.43.0

