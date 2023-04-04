Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AABE6D5BC3
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9AE7F1;
	Tue,  4 Apr 2023 11:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9AE7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600203;
	bh=aiFZlZdZQJb8T6qrVga5Q643j84eGcrdshxzh+yfpCo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NbQCFUaSNTpa6Xh+juVYyIDmj0Nj8POcm6RIMod95MgjbyJAZeVBcWf3cWrorTyco
	 c0JORazeDEoc+aRYlrhWuQ5I7GCGEIUihqrD8S5fVmNpYIky9XW66C7niRH7FbkJ/U
	 C6ugn01pDIIeJQUBy131TJGVx58TlaBXmij9jaKg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D102F80553;
	Tue,  4 Apr 2023 11:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5660F80557; Tue,  4 Apr 2023 11:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF56EF80534
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF56EF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NfI1zc+0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600064; x=1712136064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aiFZlZdZQJb8T6qrVga5Q643j84eGcrdshxzh+yfpCo=;
  b=NfI1zc+0Qz/mDchAbli5GzlQ4xu0YjoZsdaI4lv78RPGaVO/zGN0bFbG
   Avzzux+39Cv08/MD3/cduvHVMtJ+ZqvaY6bZG1I4PpR5IWYq+Ij8dcq2N
   K9BoSLl5VzEGcmfvrlx0E2/fCuAlECuuAxjn2oqZLDGlP40NedOL61czP
   miqM8yGQrqyrzhhAIB90WMIS+Q5AAtUkP3nanyRL0WP1pf/ok8dJuDl1v
   UVey39CJC9rsMBLEYtatmSiwAEYCPv+FreLuPVe/bdiwjQI1Q3TtYItcp
   i1dbrFvV5Q6HsYmky7WLoB7ejXX+C1wzz7LZCYdOGVKdNLU6NOtV9C98A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620617"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620617"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820076"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820076"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/12] ASoC: SOF: Intel: pci-cnl: Allow DSPless mode
Date: Tue,  4 Apr 2023 12:21:11 +0300
Message-Id: <20230404092115.27949-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5D2KXDPI3O72XZXL5DNPSGNSTPHJD5RD
X-Message-ID-Hash: 5D2KXDPI3O72XZXL5DNPSGNSTPHJD5RD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5D2KXDPI3O72XZXL5DNPSGNSTPHJD5RD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

set the dspless_mode_supported flag to true for cnl/cfl/cml family to
allow DSPless mode.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/pci-cnl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 4c0c1c369dcd..8895508a0be6 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -30,6 +30,7 @@ static const struct sof_dev_desc cnl_desc = {
 	.chip_info = &cnl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/cnl",
@@ -62,6 +63,7 @@ static const struct sof_dev_desc cfl_desc = {
 	.chip_info = &cnl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/cnl",
@@ -94,6 +96,7 @@ static const struct sof_dev_desc cml_desc = {
 	.chip_info = &cnl_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC) | BIT(SOF_INTEL_IPC4),
 	.ipc_default		= SOF_IPC,
+	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/cnl",
-- 
2.40.0

