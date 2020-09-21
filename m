Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF3272181
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D0016FD;
	Mon, 21 Sep 2020 12:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7D0016FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600685644;
	bh=4eWZegthZbCv1dZb3Dzt2zTCpzy8roanm0tHokOOLnE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YSvPJIV1CMcY722LFl8ezwAH0T003UWECFg4RbiUA7FmaJfo+xfpcXMWCTQtEgY1C
	 FLaiC9093Nsv1dAPE4a9MSdEGjfYCugtg07KR1Al1ghCsjQywPRiFCT8lkNnWVS5sq
	 a1N5aNFq0dnVbn6hfR/pHA7cOXjTCcAtrv6YCsbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23088F8015F;
	Mon, 21 Sep 2020 12:52:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8419DF80162; Mon, 21 Sep 2020 12:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57A8FF8015F
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A8FF8015F
IronPort-SDR: qMzNm0T8+GWxxNxTqn1Uh1KeTKpn+CoUhpnb6Sr50j5sAW7huLP+ljJcRCmMgpfsDA4wemaJ56
 Wuuoipkk0rbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148007807"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148007807"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:52:10 -0700
IronPort-SDR: 2s7EHdODLkaMf4vRPhBIokWSknuqOz9RiEMB7e6P/FydHrkaSMZpFbudINSkJgu+gzQD3IcLTF
 ECe7cknxjdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="289873878"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2020 03:52:08 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: pm: Fix prepare callback behavior for OF usecase
Date: Mon, 21 Sep 2020 13:50:38 +0300
Message-Id: <20200921105038.2909899-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

On i.MX platforms PM is not managed via ACPI although CONFIG_ACPI
can be set. So, in order to correctly set the system target state
we introduce a flag for platforms that require to use acpi target
states.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h         |  2 ++
 sound/soc/sof/pm.c          | 12 +++++++-----
 sound/soc/sof/sof-pci-dev.c |  9 +++++++++
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index f3e716c8ce1c..9aa055289dcc 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -66,6 +66,8 @@ struct sof_dev_desc {
 	/* alternate list of machines using this configuration */
 	struct snd_soc_acpi_mach *alt_machines;
 
+	bool use_acpi_target_states;
+
 	/* Platform resource indexes in BAR / ACPI resources. */
 	/* Must set to -1 if not used - add new items to end */
 	int resindex_lpe_base;
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index a5f7c7f024a1..c83fb6255961 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -305,15 +305,17 @@ EXPORT_SYMBOL(snd_sof_suspend);
 int snd_sof_prepare(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	const struct sof_dev_desc *desc = sdev->pdata->desc;
+
+	/* will suspend to S3 by default */
+	sdev->system_suspend_target = SOF_SUSPEND_S3;
+
+	if (!desc->use_acpi_target_states)
+		return 0;
 
 #if defined(CONFIG_ACPI)
 	if (acpi_target_system_state() == ACPI_STATE_S0)
 		sdev->system_suspend_target = SOF_SUSPEND_S0IX;
-	else
-		sdev->system_suspend_target = SOF_SUSPEND_S3;
-#else
-	/* will suspend to S3 by default */
-	sdev->system_suspend_target = SOF_SUSPEND_S3;
 #endif
 
 	return 0;
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 8c53f6935417..8f62e3487dc1 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -77,6 +77,7 @@ static const struct dmi_system_id community_key_platforms[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 static const struct sof_dev_desc bxt_desc = {
 	.machines		= snd_soc_acpi_intel_bxt_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -94,6 +95,7 @@ static const struct sof_dev_desc bxt_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
 static const struct sof_dev_desc glk_desc = {
 	.machines		= snd_soc_acpi_intel_glk_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -139,6 +141,7 @@ static const struct sof_dev_desc tng_desc = {
 static const struct sof_dev_desc cnl_desc = {
 	.machines		= snd_soc_acpi_intel_cnl_machines,
 	.alt_machines		= snd_soc_acpi_intel_cnl_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -157,6 +160,7 @@ static const struct sof_dev_desc cnl_desc = {
 static const struct sof_dev_desc cfl_desc = {
 	.machines		= snd_soc_acpi_intel_cfl_machines,
 	.alt_machines		= snd_soc_acpi_intel_cfl_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -175,6 +179,7 @@ static const struct sof_dev_desc cfl_desc = {
 static const struct sof_dev_desc cml_desc = {
 	.machines		= snd_soc_acpi_intel_cml_machines,
 	.alt_machines		= snd_soc_acpi_intel_cml_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -193,6 +198,7 @@ static const struct sof_dev_desc cml_desc = {
 static const struct sof_dev_desc icl_desc = {
 	.machines               = snd_soc_acpi_intel_icl_machines,
 	.alt_machines		= snd_soc_acpi_intel_icl_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
@@ -211,6 +217,7 @@ static const struct sof_dev_desc icl_desc = {
 static const struct sof_dev_desc tgl_desc = {
 	.machines               = snd_soc_acpi_intel_tgl_machines,
 	.alt_machines		= snd_soc_acpi_intel_tgl_sdw_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
@@ -244,6 +251,7 @@ static const struct sof_dev_desc tglh_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 static const struct sof_dev_desc ehl_desc = {
 	.machines               = snd_soc_acpi_intel_ehl_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
@@ -261,6 +269,7 @@ static const struct sof_dev_desc ehl_desc = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_JASPERLAKE)
 static const struct sof_dev_desc jsl_desc = {
 	.machines               = snd_soc_acpi_intel_jsl_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
-- 
2.27.0

