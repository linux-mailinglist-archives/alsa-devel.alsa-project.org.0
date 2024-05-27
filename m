Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD838D0E52
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E23B76;
	Mon, 27 May 2024 21:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E23B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838882;
	bh=qcL7xbeSMDErVFyI4rRF6ar189USQKM7MaYTw28Whe4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QX/ndXU1brvodG0G9rY/r/u0HxBqCiNzl70iyGKZtx2lpgbxmXgvuXiEXZWiy8TFH
	 azHXZSku8FvOWFzpV/BALt6LLIYQ3DZ7xsmcSAs9YyUl/lU7vfrf22H3uuuKclhCip
	 +4US08PMaDPDkw4/LDz//F4w0V/XUBKxWXCHZu7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E99F80623; Mon, 27 May 2024 21:38:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E05FF80621;
	Mon, 27 May 2024 21:38:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DE73F80613; Mon, 27 May 2024 21:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB7CEF8060D
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7CEF8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jby63MsK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838701; x=1748374701;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qcL7xbeSMDErVFyI4rRF6ar189USQKM7MaYTw28Whe4=;
  b=jby63MsKBJVyJBdYAC9Cz3pGXXLo2yYTPLIDQjlqIbikQURgh84/QntG
   YpVckEICkvM9l0Qf814rX6aQDjCtO2J4RjVT9FceKaq0Yw/V5eD05dZ++
   wU+kh9cBO5MH0LfJtbI7L7q28D6VY9N9e6uH5FLtT1iIPSnnvnGce2KuR
   vxMSrrrdktX2W9VHGP3l10768BM6YdxZ7RitdHZoo7mvYp+PR54tgo/rm
   nWwh9rC8e4q2DtrdUNLxLEQLtv6fg7Reqbc8RLV2cuSZTg8U6I7sxiBeS
   ifRvUDuJJ5kYyQ4Z2gvhJFtA6BWVWSFrTddgPDEk42koxB8zV6yzn9xhs
   w==;
X-CSE-ConnectionGUID: KPrelVt3Q32NsI+YpyWDdA==
X-CSE-MsgGUID: JZMLluF9QZSkXewdQJt17w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13016255"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13016255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:38:18 -0700
X-CSE-ConnectionGUID: rJK/F46bQ0ms/RFHC04zUA==
X-CSE-MsgGUID: YqawX1uwQDOJGMOnW6ntmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="35441446"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:38:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ALSA/hda: intel-dsp-config: reduce log verbosity
Date: Mon, 27 May 2024 14:38:08 -0500
Message-ID: <20240527193808.165652-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RHWMTLG25NUQFN2NTT3PBNAEP6TCLWG6
X-Message-ID-Hash: RHWMTLG25NUQFN2NTT3PBNAEP6TCLWG6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHWMTLG25NUQFN2NTT3PBNAEP6TCLWG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The information on PCI class/subclass was interesting in the Skylake
timeframe, since the DSP was only enabled on a limited number of
platforms. Now most Intel platforms do enable the DSP, so the
information is less interesting to log.

When a DSP driver is used, the common helper may be called multiple
times due to deferred probes, but there's no reason to print the same
information multiple times. Using dev_info_once() covers all the
existing usages for internal cards with DSPs. External cards don't
rely on DSPs so far.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index cfdb1b73c88c..537863447358 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -668,7 +668,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 		return SND_INTEL_DSP_DRIVER_LEGACY;
 	}
 
-	dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
+	dev_dbg(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
 
 	/* find the configuration for the specific device */
 	cfg = snd_intel_dsp_find_config(pci, config_table, ARRAY_SIZE(config_table));
@@ -678,12 +678,12 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	if (cfg->flags & FLAG_SOF) {
 		if (cfg->flags & FLAG_SOF_ONLY_IF_SOUNDWIRE &&
 		    snd_intel_dsp_check_soundwire(pci) > 0) {
-			dev_info(&pci->dev, "SoundWire enabled on CannonLake+ platform, using SOF driver\n");
+			dev_info_once(&pci->dev, "SoundWire enabled on CannonLake+ platform, using SOF driver\n");
 			return SND_INTEL_DSP_DRIVER_SOF;
 		}
 		if (cfg->flags & FLAG_SOF_ONLY_IF_DMIC &&
 		    snd_intel_dsp_check_dmic(pci)) {
-			dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
+			dev_info_once(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
 			return SND_INTEL_DSP_DRIVER_SOF;
 		}
 		if (!(cfg->flags & FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE))
@@ -694,7 +694,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
 	if (cfg->flags & FLAG_SST) {
 		if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
 			if (snd_intel_dsp_check_dmic(pci)) {
-				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SST driver\n");
+				dev_info_once(&pci->dev, "Digital mics found on Skylake+ platform, using SST driver\n");
 				return SND_INTEL_DSP_DRIVER_SST;
 			}
 		} else {
-- 
2.43.0

