Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7C7FD73F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:55:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7F0E72;
	Wed, 29 Nov 2023 13:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7F0E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262548;
	bh=lqQiFIs0p9s2KrlZP8z+iUyiVQdSrOyJh+D15uaRyLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bD1KEvLU67njHIjXnn+8KwFKq0pfeBG6n3LeSSumw6lUw7yjCP0Ao1Us9nxzP9BBW
	 2kyWADVjCchDxcU45bZXG+F38NWFNYjhG1bqtJDh0mN+tW2eEttZW3exkEVECArW6G
	 JTwm+HUlWCHZOZYRsYRiyiIVfLl8MKNcvd64J02U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82FC4F806C2; Wed, 29 Nov 2023 13:53:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB2ACF806CD;
	Wed, 29 Nov 2023 13:53:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA250F8069E; Wed, 29 Nov 2023 13:53:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 403F4F8056F
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403F4F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MDuBdhWt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262399; x=1732798399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lqQiFIs0p9s2KrlZP8z+iUyiVQdSrOyJh+D15uaRyLY=;
  b=MDuBdhWti4MXO7yL+XctFZKWJv9ejB4qautkcVmOyWZ4vfCji0VauXOi
   46hywB3zwp3q1Qdo7gYItfRKYh5RfnoAgy+sBEujtCzIMKtIocRJ7rpM7
   WQ3aWgu4gdOPZvnr7tB8QBmRVLTmZ4DqR7kl8jczTkbnrZsIkBn2Qc4D+
   jcraHDbd6iN86c/Pxst+JcTB0NTjLDMjmO0zZF4zAbgfkBChQhpp9a9aC
   3GIUp4Kx9CBm1OBmJEC8D9toqvcXgieNZG/QmRotXjw/iIj2Bt6qhqpgB
   qDSq+YTnTTvOt2m4IT6aawBagccsCGVLRnRJiS8A1xarsXRy67e0txBEm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022958"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174646"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 10/13] ASoC: SOF: sof-pci-dev: Rely on core to create the file
 paths
Date: Wed, 29 Nov 2023 14:53:24 +0200
Message-ID: <20231129125327.23708-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PDVYAIEIGKUOPAVOQGCC6PH3FEM6DKDE
X-Message-ID-Hash: PDVYAIEIGKUOPAVOQGCC6PH3FEM6DKDE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDVYAIEIGKUOPAVOQGCC6PH3FEM6DKDE/>
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
 sound/soc/sof/sof-pci-dev.c | 115 ++++++------------------------------
 1 file changed, 17 insertions(+), 98 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index becc85b27d51..aab5c900cecf 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -233,120 +233,39 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	sof_pdata->desc = desc;
 	sof_pdata->dev = dev;
 
-	sof_pdata->ipc_type = desc->ipc_default;
+	path_override = &sof_pdata->ipc_file_profile_base;
 
 	if (sof_pci_ipc_type < 0) {
-		sof_pdata->ipc_type = desc->ipc_default;
-	} else {
-		dev_info(dev, "overriding default IPC %d to requested %d\n",
-			 desc->ipc_default, sof_pci_ipc_type);
-		if (sof_pci_ipc_type >= SOF_IPC_TYPE_COUNT) {
-			dev_err(dev, "invalid request value %d\n", sof_pci_ipc_type);
-			ret = -EINVAL;
-			goto out;
-		}
-		if (!(BIT(sof_pci_ipc_type) & desc->ipc_supported_mask)) {
-			dev_err(dev, "invalid request value %d, supported mask is %#x\n",
-				sof_pci_ipc_type, desc->ipc_supported_mask);
-			ret = -EINVAL;
-			goto out;
-		}
-		sof_pdata->ipc_type = sof_pci_ipc_type;
-	}
-
-	if (fw_filename) {
-		sof_pdata->fw_filename = fw_filename;
-
-		dev_dbg(dev, "Module parameter used, changed fw filename to %s\n",
-			sof_pdata->fw_filename);
+		path_override->ipc_type = desc->ipc_default;
+	} else if (sof_pci_ipc_type < SOF_IPC_TYPE_COUNT) {
+		path_override->ipc_type = sof_pci_ipc_type;
 	} else {
-		sof_pdata->fw_filename = desc->default_fw_filename[sof_pdata->ipc_type];
+		dev_err(dev, "Invalid IPC type requested: %d\n", sof_pci_ipc_type);
+		ret = -EINVAL;
+		goto out;
 	}
 
-	/*
-	 * for platforms using the SOF community key, change the
-	 * default path automatically to pick the right files from the
-	 * linux-firmware tree. This can be overridden with the
-	 * fw_path kernel parameter, e.g. for developers.
-	 */
-
-	/* alternate fw and tplg filenames ? */
-	if (fw_path) {
-		sof_pdata->fw_filename_prefix = fw_path;
-
-		dev_dbg(dev,
-			"Module parameter used, changed fw path to %s\n",
-			sof_pdata->fw_filename_prefix);
-
-	} else if (dmi_check_system(community_key_platforms) && sof_dmi_use_community_key) {
-		sof_pdata->fw_filename_prefix =
-			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
-				       sof_pdata->desc->default_fw_path[sof_pdata->ipc_type],
-				       "community");
-
-		dev_dbg(dev,
-			"Platform uses community key, changed fw path to %s\n",
-			sof_pdata->fw_filename_prefix);
-	} else {
-		sof_pdata->fw_filename_prefix =
-			sof_pdata->desc->default_fw_path[sof_pdata->ipc_type];
-	}
+	path_override->fw_path = fw_path;
+	path_override->fw_name = fw_filename;
+	path_override->fw_lib_path = lib_path;
+	path_override->tplg_path = tplg_path;
 
-	if (lib_path) {
-		sof_pdata->fw_lib_prefix = lib_path;
-
-		dev_dbg(dev, "Module parameter used, changed fw_lib path to %s\n",
-			sof_pdata->fw_lib_prefix);
-
-	} else if (sof_pdata->desc->default_lib_path[sof_pdata->ipc_type]) {
-		if (dmi_check_system(community_key_platforms) && sof_dmi_use_community_key) {
-			sof_pdata->fw_lib_prefix =
-				devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
-					sof_pdata->desc->default_lib_path[sof_pdata->ipc_type],
-					"community");
-
-			dev_dbg(dev,
-				"Platform uses community key, changed fw_lib path to %s\n",
-				sof_pdata->fw_lib_prefix);
-		} else {
-			sof_pdata->fw_lib_prefix =
-				sof_pdata->desc->default_lib_path[sof_pdata->ipc_type];
-		}
+	if (dmi_check_system(community_key_platforms) &&
+	    sof_dmi_use_community_key) {
+		path_override->fw_path_postfix = "community";
+		path_override->fw_lib_path_postfix = "community";
 	}
 
-	if (tplg_path)
-		sof_pdata->tplg_filename_prefix = tplg_path;
-	else
-		sof_pdata->tplg_filename_prefix =
-			sof_pdata->desc->default_tplg_path[sof_pdata->ipc_type];
-
 	/*
 	 * the topology filename will be provided in the machine descriptor, unless
 	 * it is overridden by a module parameter or DMI quirk.
 	 */
 	if (tplg_filename) {
-		sof_pdata->tplg_filename = tplg_filename;
-
-		dev_dbg(dev, "Module parameter used, changed tplg filename to %s\n",
-			sof_pdata->tplg_filename);
+		path_override->tplg_name = tplg_filename;
 	} else {
 		dmi_check_system(sof_tplg_table);
 		if (sof_dmi_override_tplg_name)
-			sof_pdata->tplg_filename = sof_dmi_override_tplg_name;
-	}
-
-	path_override = &sof_pdata->ipc_file_profile_base;
-	path_override->ipc_type = sof_pdata->ipc_type;
-	path_override->fw_path = fw_path;
-	path_override->fw_name = fw_filename;
-	path_override->fw_lib_path = lib_path;
-	path_override->tplg_path = tplg_path;
-	path_override->tplg_name = sof_pdata->tplg_filename;
-
-	if (dmi_check_system(community_key_platforms) &&
-	    sof_dmi_use_community_key) {
-		path_override->fw_path_postfix = "community";
-		path_override->fw_lib_path_postfix = "community";
+			path_override->tplg_name = sof_dmi_override_tplg_name;
 	}
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
-- 
2.43.0

