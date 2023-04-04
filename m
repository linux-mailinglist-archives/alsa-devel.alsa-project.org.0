Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C736D5BD6
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76FD83E7;
	Tue,  4 Apr 2023 11:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76FD83E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600311;
	bh=x157ULv2Xl+MdfEY0HSEmNl0jgscs3UoEZE2dDY5gsQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQ0Yuf/NhvVBhnkfTxrNrz2mV4vgIVdXesqcgnEvNaXyZolM0mG2XNmMIE80JVGw0
	 v3OJfkJFeSisj4zll3liRArR9AzXKrpoaTJxJTELCf1RCTn68673x+c4DG3TPpMYcF
	 3VMmKUQLoU15o51sAmaYUSDjIpmKBbfCPOnH6qCI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 236DCF8052E;
	Tue,  4 Apr 2023 11:23:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80778F80529; Tue,  4 Apr 2023 11:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2341F80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2341F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H39zIsiO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600050; x=1712136050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x157ULv2Xl+MdfEY0HSEmNl0jgscs3UoEZE2dDY5gsQ=;
  b=H39zIsiO0v7sJD0nEFlBtbcqG3I0sYErqzv5X5gMMECLCx7QqGf46U+h
   il5fBnO9GyGw6Bhj8K4d9GzP+wDuauWnLtbVm80TAL9H6hLvvli89h2Yk
   vdl9IcC8K5tgJEtAut5SVv0GMq9bqsb32HtrzRplBwPnjdzHik7Kb2a0l
   o7sSoQLXXa3rvFiVgn6zGqpPe4XWpGu3hQiHpSL5IkR/u0C0SWdNSYl9k
   RQM7264Hy28H5Q3mtn8kB2j+G3BtMgo9QPrerYgiMXiWhyfXli2konJ3Y
   zqlCyj0Z0lDOJ2pWLCs6ZU3G34VuVxbl9m6KCLO+2NVV3+fcIqrfJU3dH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620524"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620524"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688819969"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688819969"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 02/12] ASoC: SOF: Add flag and state which will be used for
 DSP-less mode
Date: Tue,  4 Apr 2023 12:21:05 +0300
Message-Id: <20230404092115.27949-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GKWQ4VFCFBPYAF3U5XJI43N55LUBRWJI
X-Message-ID-Hash: GKWQ4VFCFBPYAF3U5XJI43N55LUBRWJI
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKWQ4VFCFBPYAF3U5XJI43N55LUBRWJI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The DSPless mode of the ASoC/SOF driver can be used for hardware
verification and debug on platforms with HDaudio codecs. The DSP mode is
still needed on existing platforms for SSP, DMIC, SoundWire interfaces
managed by the GP-DMA.

This mode is also helpful to compare the legacy HDaudio driver with the
ASoC/SOF driver wrt. codec management and handling. In theory we use the
same code but differences are sometimes seen on jack detection and event
handling.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 include/sound/sof.h      |  5 +++++
 sound/soc/sof/core.c     |  9 +++++++++
 sound/soc/sof/sof-priv.h | 11 +++++++++++
 3 files changed, 25 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 266e66318f9c..d3c41f87ac31 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -21,6 +21,7 @@ struct snd_sof_dev;
 /**
  * enum sof_fw_state - DSP firmware state definitions
  * @SOF_FW_BOOT_NOT_STARTED:	firmware boot is not yet started
+ * @SOF_DSPLESS_MODE:		DSP is not used
  * @SOF_FW_BOOT_PREPARE:	preparing for boot (firmware loading for exaqmple)
  * @SOF_FW_BOOT_IN_PROGRESS:	firmware boot is in progress
  * @SOF_FW_BOOT_FAILED:		firmware boot failed
@@ -31,6 +32,7 @@ struct snd_sof_dev;
  */
 enum sof_fw_state {
 	SOF_FW_BOOT_NOT_STARTED = 0,
+	SOF_DSPLESS_MODE,
 	SOF_FW_BOOT_PREPARE,
 	SOF_FW_BOOT_IN_PROGRESS,
 	SOF_FW_BOOT_FAILED,
@@ -130,6 +132,9 @@ struct sof_dev_desc {
 	unsigned int ipc_supported_mask;
 	enum sof_ipc_type ipc_default;
 
+	/* The platform supports DSPless mode */
+	bool dspless_mode_supported;
+
 	/* defaults paths for firmware, library and topology files */
 	const char *default_fw_path[SOF_IPC_TYPE_COUNT];
 	const char *default_lib_path[SOF_IPC_TYPE_COUNT];
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 7de8673a01ce..06bcae631612 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -365,6 +365,15 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	if (sof_core_debug)
 		dev_info(dev, "sof_debug value: %#x\n", sof_core_debug);
 
+	if (sof_debug_check_flag(SOF_DBG_DSPLESS_MODE)) {
+		if (plat_data->desc->dspless_mode_supported) {
+			dev_info(dev, "Switching to DSPless mode\n");
+			sdev->dspless_mode_selected = true;
+		} else {
+			dev_info(dev, "DSPless mode is not supported by the platform\n");
+		}
+	}
+
 	/* check IPC support */
 	if (!(BIT(plat_data->ipc_type) & plat_data->desc->ipc_supported_mask)) {
 		dev_err(dev, "ipc_type %d is not supported on this platform, mask is %#x\n",
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5f919162a555..1170989bea57 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -48,6 +48,7 @@ struct snd_sof_pcm_stream;
 #define SOF_DBG_FORCE_NOCODEC			BIT(10) /* ignore all codec-related
 							 * configurations
 							 */
+#define SOF_DBG_DSPLESS_MODE			BIT(15) /* Do not initialize and use the DSP */
 
 /* Flag definitions used for controlling the DSP dump behavior */
 #define SOF_DBG_DUMP_REGS		BIT(0)
@@ -528,6 +529,16 @@ struct snd_sof_dev {
 	spinlock_t ipc_lock;	/* lock for IPC users */
 	spinlock_t hw_lock;	/* lock for HW IO access */
 
+	/*
+	 * When true the DSP is not used.
+	 * It is set under the following condition:
+	 * User sets the SOF_DBG_DSPLESS_MODE flag in sof_debug module parameter
+	 * and
+	 * the platform advertises that it can support such mode
+	 * pdata->desc->dspless_mode_supported is true.
+	 */
+	bool dspless_mode_selected;
+
 	/* Main, Base firmware image */
 	struct sof_firmware basefw;
 
-- 
2.40.0

