Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B676D7C7696
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37D7E85;
	Thu, 12 Oct 2023 21:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37D7E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138412;
	bh=cLSWN8tjPNfXfRL9UK3x9LXGEbYmkwgHFyH8YhbtSxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jUlCrVjQDMr8LxaTWEvMNnM6gXIG72BpCJ9PVxwXz2BY21RwmwinKQ46mEOSeiq6S
	 kqH3a8xmdqCJEdlYSGiJk6sDvgUexPO+lPidSW4ESBFjNxGW6zRUiRAbT4rK3uZLfa
	 g/oJKtk9EGmpp0eN86jG3bnLZLABj1YbM//I+S6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC16F8027B; Thu, 12 Oct 2023 21:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7011DF8027B;
	Thu, 12 Oct 2023 21:19:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1910F80310; Thu, 12 Oct 2023 21:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 049F4F8027B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 049F4F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iOUvUze0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697138355; x=1728674355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cLSWN8tjPNfXfRL9UK3x9LXGEbYmkwgHFyH8YhbtSxs=;
  b=iOUvUze0VlK1RC4UL+tKFpJYE8xSOMqpuW6LGrCKcRopCgyv/LUgmUQC
   swu0kaXQ2CeFs/hrLexAXmD3+lCaD0C6Xw0SNIdM8OchBsXDRRBJwJ9AS
   emTBWLc/j1W/qetp01swhnrhCr1mqZk8NzUMhwb5ivvN2ALxydX/dSpm3
   9lIpOSxhXy4NSAdMB4c4XSOrSPBzO26jJ2HY8ODMTtsGPN49hxOTWIPX7
   fwfiHbRvCH10Kqu3t6qgkWTJInxCXbKdld6VGuA68ClwJ1V9ylHu02jYF
   3zoz3zBGxuQJA7hvuWWd2IJFCHzhRq78DjqoZD+6oFiJtr5RrMqVIbPuB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383875351"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="383875351"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001628004"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="1001628004"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:18:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Arun T <arun.t@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: Intel: pci-mtl: use ARL specific firmware
 definitions
Date: Thu, 12 Oct 2023 15:18:47 -0400
Message-Id: <20231012191850.147140-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
References: <20231012191850.147140-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WMS5RAI2CYTDQO55SWLD7G4FZIYTSNNN
X-Message-ID-Hash: WMS5RAI2CYTDQO55SWLD7G4FZIYTSNNN
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMS5RAI2CYTDQO55SWLD7G4FZIYTSNNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arun T <arun.t@intel.com>

Split out firmware definitions for Intel Arrow Lake platforms.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Arun T <arun.t@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-mtl.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 235e31a26106..0f378f45486d 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -50,9 +50,40 @@ static const struct sof_dev_desc mtl_desc = {
 	.ops_free = hda_ops_free,
 };
 
+static const struct sof_dev_desc arl_desc = {
+	.use_acpi_target_states = true,
+	.machines               = snd_soc_acpi_intel_arl_machines,
+	.alt_machines           = snd_soc_acpi_intel_arl_sdw_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.chip_info = &mtl_chip_info,
+	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_4),
+	.ipc_default            = SOF_IPC_TYPE_4,
+	.dspless_mode_supported = true,         /* Only supported for HDaudio */
+	.default_fw_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/arl",
+	},
+	.default_lib_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/arl",
+	},
+	.default_tplg_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC_TYPE_4] = "sof-arl.ri",
+	},
+	.nocodec_tplg_filename = "sof-arl-nocodec.tplg",
+	.ops = &sof_mtl_ops,
+	.ops_init = sof_mtl_ops_init,
+	.ops_free = hda_ops_free,
+};
+
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, &mtl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S, &arl_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.39.2

