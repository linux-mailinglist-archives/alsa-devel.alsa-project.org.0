Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D086DEBA0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 08:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3ECF7C;
	Wed, 12 Apr 2023 08:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3ECF7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681280150;
	bh=A8ULYxpv0wmpZIykCOOkXA/iCsiwXVwDSOSzzk4zAJE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EgcsH4lUZ1Yt3SijPOyewX7aPyhEV1xOYp901myCImNmO6YbqPZd7Lqv3Y8luB0oV
	 wOEm2rCmjx2HayHfBZuYk2PVn/p6BliCym66BHdKY68FrX9B7+9+7Z3yUiDqHAaB1R
	 5J2+9YYl9+dUN7cUF0JTY8hMI5HOkMSGrjx2iQYY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F631F8025E;
	Wed, 12 Apr 2023 08:15:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B37DF8032B; Wed, 12 Apr 2023 08:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 382D7F80100
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 08:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 382D7F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L4kHdjlJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681280065; x=1712816065;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A8ULYxpv0wmpZIykCOOkXA/iCsiwXVwDSOSzzk4zAJE=;
  b=L4kHdjlJw5d63imWEcTmYyccB5yD3Y4Um8nP2a4PYwIiXUuzDpmWVuOH
   qUTYGgwC+M3lQv7ZMdpgQ+si9x1rGTfa4iO/sxPNb2Jod7/0zUUNn2v/i
   35CsOhBHg30U599yk02bVCiQ9/+MaLBiAbjFF1f0rPj0LAZLzopzFJx+H
   pQMTnIwXhMsMksYgdn3zXWvBldeyKkikN2VtXt8Ya0S+gcGEwxUNlwi1k
   8yz9RVHnCoEB0gjW8ls/Rri/T+jvXCGMRMK6WLbt/YrSJlJKh9M4OWJ8t
   Io8YbnMbUbUXyk53RgpFRKn6qL9b8WOzvq9VoPEvltIMgcgpsGWiA1Lu6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341301344"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400";
   d="scan'208";a="341301344"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 23:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812868437"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400";
   d="scan'208";a="812868437"
Received: from hlakyil-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.212.238])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 23:14:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: mtl: fix page fault in dspless mode when
 DSP is disabled
Date: Wed, 12 Apr 2023 09:14:57 +0300
Message-Id: <20230412061457.27937-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5B6DYBM6SKR3CMTGBLHP6S67ZMSFE7MQ
X-Message-ID-Hash: 5B6DYBM6SKR3CMTGBLHP6S67ZMSFE7MQ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 fred.oh@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5B6DYBM6SKR3CMTGBLHP6S67ZMSFE7MQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

The patch to make DSPless mode work even if the DSP is
disabled in BIOS missed to touch the MTL code to add
the needed checks.
If the DSP is disabled this can lead to page fault due to not
accesible registers.

Fixes: 9fc6786f549c ("ASoC: SOF: Intel: hda: make DSPless mode work with DSP disabled in BIOS")
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 882ce5536ab6..9f969e07fc27 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -60,6 +60,9 @@ static bool mtl_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 	u32 irq_status;
 	u32 hfintipptr;
 
+	if (sdev->dspless_mode_selected)
+		return false;
+
 	/* read Interrupt IP Pointer */
 	hfintipptr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFINTIPPTR) & MTL_HFINTIPPTR_PTR_MASK;
 	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, hfintipptr + MTL_DSP_IRQSTS);
@@ -120,6 +123,9 @@ static void mtl_enable_ipc_interrupts(struct snd_sof_dev *sdev)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
+	if (sdev->dspless_mode_selected)
+		return;
+
 	/* enable IPC DONE and BUSY interrupts */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
 				MTL_DSP_REG_HFIPCXCTL_BUSY | MTL_DSP_REG_HFIPCXCTL_DONE,
@@ -131,6 +137,9 @@ static void mtl_disable_ipc_interrupts(struct snd_sof_dev *sdev)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
+	if (sdev->dspless_mode_selected)
+		return;
+
 	/* disable IPC DONE and BUSY interrupts */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
 				MTL_DSP_REG_HFIPCXCTL_BUSY | MTL_DSP_REG_HFIPCXCTL_DONE, 0);
@@ -143,6 +152,9 @@ static void mtl_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
 	u32 val;
 	int ret;
 
+	if (sdev->dspless_mode_selected)
+		return;
+
 	/* Enable/Disable SoundWire interrupt */
 	mask = MTL_DSP_REG_HfSNDWIE_IE_MASK;
 	if (enable)
@@ -170,6 +182,9 @@ static int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 	u32 val;
 	int ret;
 
+	if (sdev->dspless_mode_selected)
+		return 0;
+
 	/* read Interrupt IP Pointer */
 	hfintipptr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFINTIPPTR) & MTL_HFINTIPPTR_PTR_MASK;
 
-- 
2.40.0

