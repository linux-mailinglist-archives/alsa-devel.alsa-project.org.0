Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B429D7FD740
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:56:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EBDDF0;
	Wed, 29 Nov 2023 13:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EBDDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262570;
	bh=RwxIUDEAMlV2abnxADO+KNz5UWOsUSZv/pAFbBcJ+1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VWMuQtA0TVCcq94ulFioBijCI86j2DQWWN09RqukPH89ztlwA42ZNMZokcGuzQ+5X
	 k0FfMOo3bTgHjWZQghCDAS6yWv8HzLDzsoeQYxOVlnIlMB9CL7AtLmiq6OuuMecyh6
	 ZI94vJ9ohkQNBcMYIWiVSa/bwKxyz7hzh1mQOvIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55D5AF806EC; Wed, 29 Nov 2023 13:53:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B50F806F2;
	Wed, 29 Nov 2023 13:53:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E17F806B8; Wed, 29 Nov 2023 13:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF585F8060D
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF585F8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NuXxpnxz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262401; x=1732798401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RwxIUDEAMlV2abnxADO+KNz5UWOsUSZv/pAFbBcJ+1Q=;
  b=NuXxpnxzmUmUbIuyK6fa5ttdSPq2621L+X9s1J5WaNp+eiBPATi7pmzm
   O++92fsTV3dhFMuvjR62jtas10MBoDWJX9rxUI3yTda0/AdUEyc4EBt4p
   rRuLvnaMBRCYgRPJTUGb6mNim+6kVE5dqQBPPv6AhCo7pUWyPN1nJuDRS
   hYAxFMuXmMyIU9o7eRTpvPAil++oWNROXhNE+M4KzAhO/RT6rg37Z5Wvi
   pykzX4/YFIWbYdZ5nCZFWsdjvmCFKv+3G83OH9hk+o+n8HUvXNOOyEnx2
   NLCWPAs0CI7P+pk83i2xVE3Pixrgc7low45tkJE+g/dcovduG7x2WyUz8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022970"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174648"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 12/13] ASoC: SOF: Intel: Do not use resource managed
 allocation for ipc4_data
Date: Wed, 29 Nov 2023 14:53:26 +0200
Message-ID: <20231129125327.23708-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOGGEHBY2D4GCQOLBFN6X2GJEBCCORB5
X-Message-ID-Hash: WOGGEHBY2D4GCQOLBFN6X2GJEBCCORB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOGGEHBY2D4GCQOLBFN6X2GJEBCCORB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Manage the ipc4_data allocation in code instead of devm since the ops_init
might be called more than once due to IPC type fallback.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     | 2 +-
 sound/soc/sof/intel/cnl.c     | 2 +-
 sound/soc/sof/intel/hda-dai.c | 3 +++
 sound/soc/sof/intel/icl.c     | 2 +-
 sound/soc/sof/intel/lnl.c     | 2 +-
 sound/soc/sof/intel/mtl.c     | 2 +-
 sound/soc/sof/intel/skl.c     | 2 +-
 sound/soc/sof/intel/tgl.c     | 2 +-
 8 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 776b66389c34..dee6c7f73e80 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -55,7 +55,7 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 598cf50abadb..85e1e4760d0e 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -402,7 +402,7 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a20deaf3b428..f4cbc0ad5de3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -621,6 +621,9 @@ void hda_ops_free(struct snd_sof_dev *sdev)
 
 		if (!hda_use_tplg_nhlt)
 			intel_nhlt_free(ipc4_data->nhlt);
+
+		kfree(sdev->private);
+		sdev->private = NULL;
 	}
 }
 EXPORT_SYMBOL_NS(hda_ops_free, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 8e29d6bb6fe8..040698591992 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -123,7 +123,7 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index db94b45e53af..03308721ebd4 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -120,7 +120,7 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	sof_lnl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
 
-	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
+	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 3ef9e5c37028..f941e2c49d78 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -709,7 +709,7 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 
 	sof_mtl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
 
-	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
+	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index d24e64e71b58..93824e6ce573 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -62,7 +62,7 @@ int sof_skl_ops_init(struct snd_sof_dev *sdev)
 	/* probe/remove/shutdown */
 	sof_skl_ops.shutdown	= hda_dsp_shutdown;
 
-	sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+	sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index f7de1f5ba06d..d890cac6cb01 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -82,7 +82,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
-- 
2.43.0

