Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB20898E3E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 20:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218662CCF;
	Thu,  4 Apr 2024 20:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218662CCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712256568;
	bh=2+dgq3iM1tCDqIJsEHHG3CHI9NyitJ0gRuUJCe4auZ8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fZIatzkS78I/Rh2ll11Mn9G6BnojvzkGdEnDcWEA56ohFVhaNcSo/Q94TvCNtW7MT
	 jb2kKALb/Vv/W+uWwPKunZCC1srqdL43FGxup/jsQZ/ItdvH7X3LklKq4h0aDSZe5z
	 gz9RERhhTZ4tbyWCex1rhWKPiIIZIoNH2gCnNn+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 886E5F805AA; Thu,  4 Apr 2024 20:48:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEBB1F80568;
	Thu,  4 Apr 2024 20:48:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8398EF8020D; Thu,  4 Apr 2024 20:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B27EBF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 20:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B27EBF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FjXE1PXz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256515; x=1743792515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2+dgq3iM1tCDqIJsEHHG3CHI9NyitJ0gRuUJCe4auZ8=;
  b=FjXE1PXzQRL1zdMn89E4Y+xCCU4eSJLODi6eGPpBZQ4JQwnCaN4JCj2v
   Sv3wJLCMi0WRtbZT0v2HC/rf06UQBLyu9Hr5irRb35aBv4wXP/oZwwF8K
   E74PU5cd9qXWMGrCNqSeY+rlt/1kJm8Xf5oivtauIZgDSlOxU8zN20PDW
   Cnivrmx2Z2Wzr/3x69HWOnRRs7qlp+t7iARUegXVy2y/dlNqE6pMwLS+z
   80Otwo4bfDhQDVYr1cGSbCZi01IQsEYLL3NHYzDiDr/wvEEFOUsYDeB3f
   /0ExxRzMY4FKVMdym+SfX33uU+X2Wnhg0Xt3gJa32gzh1535u0pFBesqs
   A==;
X-CSE-ConnectionGUID: geG9pHNsSZGYrn0yVL9vrg==
X-CSE-MsgGUID: SoS9xT+JSV6J3qEaa4/AVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7800023"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7800023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:48:29 -0700
X-CSE-ConnectionGUID: w6WYMV8BTbWWdFrPXf1igQ==
X-CSE-MsgGUID: O75NgDFEQIWV86cvnRCXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="23542014"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:48:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Core: Add remove_late() to  sof_init_environment
 failure path
Date: Thu,  4 Apr 2024 13:48:13 -0500
Message-Id: <20240404184813.134566-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BVIYVAEIEHAXCPFQAOXDR7THTYPVY6VF
X-Message-ID-Hash: BVIYVAEIEHAXCPFQAOXDR7THTYPVY6VF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVIYVAEIEHAXCPFQAOXDR7THTYPVY6VF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

In cases where the sof driver is unable to find the firmware and/or
topology file [1], it exits without releasing the i915 runtime
pm wakeref [2]. This results in dmesg warnings[3] during
suspend/resume or driver unbind. Add remove_late() to the failure path
of sof_init_environment so that i915 wakeref is released appropriately

[1]

[    8.990366] sof-audio-pci-intel-mtl 0000:00:1f.3: SOF firmware and/or topology file not found.
[    8.990396] sof-audio-pci-intel-mtl 0000:00:1f.3: Supported default profiles
[    8.990398] sof-audio-pci-intel-mtl 0000:00:1f.3: - ipc type 1 (Requested):
[    8.990399] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file: intel/sof-ipc4/mtl/sof-mtl.ri
[    8.990401] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file: intel/sof-ace-tplg/sof-mtl-rt711-2ch.tplg
[    8.990402] sof-audio-pci-intel-mtl 0000:00:1f.3: Check if you have 'sof-firmware' package installed.
[    8.990403] sof-audio-pci-intel-mtl 0000:00:1f.3: Optionally it can be manually downloaded from:
[    8.990404] sof-audio-pci-intel-mtl 0000:00:1f.3:    https://github.com/thesofproject/sof-bin/
[    8.999088] sof-audio-pci-intel-mtl 0000:00:1f.3: error: sof_probe_work failed err: -2

[2]

ref_tracker: 0000:00:02.0@ffff9b8511b6a378 has 1/5 users at
     track_intel_runtime_pm_wakeref.part.0+0x36/0x70 [i915]
     __intel_runtime_pm_get+0x51/0xb0 [i915]
     intel_runtime_pm_get+0x17/0x20 [i915]
     intel_display_power_get+0x2f/0x70 [i915]
     i915_audio_component_get_power+0x23/0x120 [i915]
     snd_hdac_display_power+0x89/0x130 [snd_hda_core]
     hda_codec_i915_init+0x3f/0x50 [snd_sof_intel_hda]
     hda_dsp_probe_early+0x170/0x250 [snd_sof_intel_hda_common]
     snd_sof_device_probe+0x224/0x320 [snd_sof]
     sof_pci_probe+0x15b/0x220 [snd_sof_pci]
     hda_pci_intel_probe+0x30/0x70 [snd_sof_intel_hda_common]
     local_pci_probe+0x4c/0xb0
     pci_device_probe+0xcc/0x250
     really_probe+0x18e/0x420
     __driver_probe_device+0x7e/0x170
     driver_probe_device+0x23/0xa0

[3]
[  484.105070] ------------[ cut here ]------------
[  484.108238] thunderbolt 0000:00:0d.2: PM: pci_pm_suspend_late+0x0/0x50 returned 0 after 0 usecs
[  484.117106] i915 0000:00:02.0: i915 raw-wakerefs=1 wakelocks=1 on cleanup
[  484.792005] WARNING: CPU: 2 PID: 2405 at drivers/gpu/drm/i915/intel_runtime_pm.c:444 intel_runtime_pm_driver_release+0x6c/0x80

Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 9b00ede2a486..cc84d4c81be9 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -339,8 +339,7 @@ static int sof_init_environment(struct snd_sof_dev *sdev)
 	ret = snd_sof_probe(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to probe DSP %d\n", ret);
-		sof_ops_free(sdev);
-		return ret;
+		goto err_sof_probe;
 	}
 
 	/* check machine info */
@@ -358,15 +357,18 @@ static int sof_init_environment(struct snd_sof_dev *sdev)
 		ret = validate_sof_ops(sdev);
 		if (ret < 0) {
 			snd_sof_remove(sdev);
+			snd_sof_remove_late(sdev);
 			return ret;
 		}
 	}
 
+	return 0;
+
 err_machine_check:
-	if (ret) {
-		snd_sof_remove(sdev);
-		sof_ops_free(sdev);
-	}
+	snd_sof_remove(sdev);
+err_sof_probe:
+	snd_sof_remove_late(sdev);
+	sof_ops_free(sdev);
 
 	return ret;
 }
-- 
2.40.1

