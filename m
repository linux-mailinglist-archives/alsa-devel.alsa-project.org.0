Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D168D0E62
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB7B1060;
	Mon, 27 May 2024 21:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB7B1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716839214;
	bh=xm85HU+bJyfDh+V6EKJbC59iQosjDzquy/pZg3QMON0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kc+fdKJZi6jcf5SG/2jJyeZvJKK2Uskqux5WorHpcXOn+wPBwFNl8ILzmw4dJVyry
	 ZlrwRiDUjQMF+N3M6Rvx+yuq9sDCD568Jvm6wcaoajeUFzSx17b1Z1XR0YmMDmmu8U
	 nEBGcyOnZJ/Fpt2S+T9AMgPF1NPyLqv5gd7w187Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E9CF80649; Mon, 27 May 2024 21:45:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DFFAF80634;
	Mon, 27 May 2024 21:45:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 892EFF805D9; Mon, 27 May 2024 21:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C29D4F8047C
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C29D4F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=etSO08b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839109; x=1748375109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xm85HU+bJyfDh+V6EKJbC59iQosjDzquy/pZg3QMON0=;
  b=etSO08b5yez9NiLUsdgHSViw4s37b8Xl+5NLLD3jrgw8GZvEYcXASbdt
   SgrA2vGFtuORS4DYnOo2cIzBaqx0PSbjK4kRJ+r0ywWvnbJPGKNKk2RhM
   Jc29qrRLu+TtcDSwFMpgPVZoScwHrEC5txWdJi3civPH0feXGIi1V3mJ4
   8moV1oRWJWTGVtRdRKsWdqqktPQZAhGe5MbJ75MSH96MGe1wtHoCwAA6e
   /ekzHU447nmA+WIv13T+L1DsQZZBv/ysf44uFk23+IYBJOlz5uackCSSo
   c3NKRVH6SyPYuqbaGz+J+SnAaMhI4NlRzK8wgqB10RtTpTelyOzt5JYUd
   Q==;
X-CSE-ConnectionGUID: S8SAfbINScijslq0Cdh2rg==
X-CSE-MsgGUID: VDiqfDj4SY2oCUdcjmvtmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679493"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="30679493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:04 -0700
X-CSE-ConnectionGUID: QjZKROK0T9ycnmSnLeTsUQ==
X-CSE-MsgGUID: NoCHX2IFRUWYZyXfMSrsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="39280547"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: reorder MODULE_ definitions
Date: Mon, 27 May 2024 14:44:13 -0500
Message-ID: <20240527194414.166156-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2NAYOUX2YU3X56QH4NXLNUDLILH25LEB
X-Message-ID-Hash: 2NAYOUX2YU3X56QH4NXLNUDLILH25LEB
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NAYOUX2YU3X56QH4NXLNUDLILH25LEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Follow the arbitrary Intel convention order to allow for easier grep.

MODULE_LICENSE
MODULE_DESCRIPTION
MODULE_IMPORT

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/amd/acp-common.c                 | 4 ++--
 sound/soc/sof/amd/acp.c                        | 2 +-
 sound/soc/sof/core.c                           | 2 +-
 sound/soc/sof/nocodec.c                        | 2 +-
 sound/soc/sof/sof-client-ipc-flood-test.c      | 2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c | 2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    | 2 +-
 sound/soc/sof/sof-client-probes.c              | 2 +-
 sound/soc/sof/xtensa/core.c                    | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index b26fa471b431..81bb93e98358 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -258,8 +258,8 @@ const struct snd_sof_dsp_ops sof_acp_common_ops = {
 };
 EXPORT_SYMBOL_NS(sof_acp_common_ops, SND_SOC_SOF_AMD_COMMON);
 
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("ACP SOF COMMON Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
-MODULE_DESCRIPTION("ACP SOF COMMON Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index c12c7f820529..74fd5f2b148b 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -801,7 +801,7 @@ void amd_sof_acp_remove(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_remove, SND_SOC_SOF_AMD_COMMON);
 
+MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("AMD ACP sof driver");
 MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
 MODULE_IMPORT_NS(SND_AMD_SOUNDWIRE_ACPI);
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 0a4917136ff9..83fe0401baf8 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -769,7 +769,7 @@ void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
 EXPORT_SYMBOL(sof_machine_unregister);
 
 MODULE_AUTHOR("Liam Girdwood");
-MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_ALIAS("platform:sof-audio");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index fdcbe33d3dcf..b12b3d865ae3 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -110,7 +110,7 @@ static struct platform_driver sof_nocodec_audio = {
 };
 module_platform_driver(sof_nocodec_audio)
 
+MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("ASoC sof nocodec");
 MODULE_AUTHOR("Liam Girdwood");
-MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("platform:sof-nocodec");
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 435614926092..e7d2001140e8 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -394,6 +394,6 @@ static struct auxiliary_driver sof_ipc_flood_client_drv = {
 
 module_auxiliary_driver(sof_ipc_flood_client_drv);
 
-MODULE_DESCRIPTION("SOF IPC Flood Test Client Driver");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SOF IPC Flood Test Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index 6973b6690df4..d3f541069b24 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -157,6 +157,6 @@ static struct auxiliary_driver sof_msg_inject_client_drv = {
 
 module_auxiliary_driver(sof_msg_inject_client_drv);
 
-MODULE_DESCRIPTION("SOF IPC Kernel Injector Client Driver");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SOF IPC Kernel Injector Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index af22e6421029..d0f8beb9d000 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -335,6 +335,6 @@ static struct auxiliary_driver sof_msg_inject_client_drv = {
 
 module_auxiliary_driver(sof_msg_inject_client_drv);
 
-MODULE_DESCRIPTION("SOF IPC Message Injector Client Driver");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SOF IPC Message Injector Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index b8f297307565..ccc7d38ddc38 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -540,6 +540,6 @@ static struct auxiliary_driver sof_probes_client_drv = {
 
 module_auxiliary_driver(sof_probes_client_drv);
 
-MODULE_DESCRIPTION("SOF Probes Client Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("SOF Probes Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index ccbc3fcdadd5..3cf8c84beff9 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -151,5 +151,5 @@ const struct dsp_arch_ops sof_xtensa_arch_ops = {
 };
 EXPORT_SYMBOL_NS(sof_xtensa_arch_ops, SND_SOC_SOF_XTENSA);
 
-MODULE_DESCRIPTION("SOF Xtensa DSP support");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF Xtensa DSP support");
-- 
2.43.0

