Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843785852
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 04:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32151615;
	Thu,  8 Aug 2019 04:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32151615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565232816;
	bh=PqUZZq+G9x4Wi71lPXG4AHZa4YPSyDe6tvyMn74nijQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mkLKc5qbqzceM3UDU0ZrdeQvGM4MpcRt3XbJ7wVZn2m0s+dlxud72Bpk9khGFC+YT
	 j3f3lC2XUmZuBZrYotMJMks/7geFyozDhbblYcx3MeDZZyp36nyOX8791xxzwthkor
	 4XuLhXeDozvNqvs7rR1T5RqkACvjjkhgYbr8oEYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7624F800E3;
	Thu,  8 Aug 2019 04:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 745DBF80534; Thu,  8 Aug 2019 04:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90471F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 04:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90471F800E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 19:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="186209748"
Received: from kbackebe-sp6.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.201.166])
 by orsmga002.jf.intel.com with ESMTP; 07 Aug 2019 19:51:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 21:51:31 -0500
Message-Id: <20190808025131.32482-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: soc-core: fix module_put() warning in
	soc_cleanup_component
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The recent changes introduce warnings in the SOF load/unload module
tests. The code does not seem balanced with a confusion between
_close() and _remove() macros. Using _remove() fixes the issue and
removes the warning.

Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Fixes: 4a81e8f30d0b4 ('ASoC: soc-component: add snd_soc_component_get/put()')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---

Full trace for reference:
[   98.735393] WARNING: CPU: 3 PID: 1397 at kernel/module.c:1137 module_put+0x83/0x90
[   98.735393] Modules linked in: snd_soc_cnl_rt700 soundwire_intel soundwire_cadence snd_soc_dmic snd_sof_pci(-) snd_sof_intel_hda_common soundwire_intel_init snd_sof_acpi snd_sof_intel_byt snd_soc_acpi_intel_match snd_sof_intel_bdw snd_sof_intel_ipc snd_sof snd_sof_xtensa_dsp snd_soc_acpi snd_soc_rt700 regmap_sdw soundwire_bus snd_soc_max98357a snd_soc_wm8804_i2c snd_soc_wm8804 snd_soc_pcm512x_i2c snd_soc_pcm512x snd_soc_rt5640 snd_soc_rl6231 snd_soc_rt286 snd_soc_rl6347a snd_soc_core snd_pcm snd_seq snd_seq_device snd_timer snd soundcore wmi_bmof asix usbnet x86_pkg_temp_thermal intel_powerclamp i915 i2c_algo_bit mei_me mei drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops iwlwifi drm wmi efivarfs sdhci_pci intel_lpss_pci xhci_pci cqhci intel_lpss sdhci mfd_core xhci_hcd
[   98.735410] CPU: 3 PID: 1397 Comm: rmmod Not tainted 5.3.0-rc3-test+ #122
[   98.735411] Hardware name: Intel Corporation Ice Lake Client Platform/IceLake<DETAILS REMOVED>
[   98.735413] RIP: 0010:module_put+0x83/0x90
[   98.735414] Code: 48 83 c5 18 4c 89 e2 48 89 de e8 68 1c b1 00 48 8b 45 00 48 85 c0 75 e4 5b 5d 41 5c c3 c3 48 c7 c7 20 f9 7b 9d e8 d6 97 fc ff <0f> 0b eb 9c 66 0f 1f 84 00 00 00 00 00 53 48 89 f3 e8 67 ff ff ff
[   98.735415] RSP: 0018:ffffa88200a33c80 EFLAGS: 00010246
[   98.735416] RAX: 0000000000000024 RBX: ffffffffc0754280 RCX: 0000000000000000
[   98.735417] RDX: 0000000000000000 RSI: ffff8cc167ed63d8 RDI: ffff8cc167ed63d8
[   98.735417] RBP: ffff8cc162cc0028 R08: 000000000000041d R09: 0000000000000004
[   98.735418] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8cc1456fceb0
[   98.735419] R13: 0000000000000000 R14: 0000000000000001 R15: ffffffff9d7d85c5
[   98.735420] FS:  00007fe72a461740(0000) GS:ffff8cc167ec0000(0000) knlGS:0000000000000000
[   98.735420] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   98.735421] CR2: 000056509f6f2fe4 CR3: 0000000268d8a005 CR4: 0000000000760ee0
[   98.735422] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   98.735422] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   98.735423] PKRU: 55555554
[   98.735423] Call Trace:
[   98.735430]  soc_remove_link_components.isra.50+0x56/0x70 [snd_soc_core]
[   98.735434]  snd_soc_unbind_card.part.52+0x75/0xf0 [snd_soc_core]
[   98.735437]  snd_soc_unregister_card+0x8d/0x90 [snd_soc_core]
[   98.735441]  release_nodes+0x1ae/0x200
[   98.735443]  device_release_driver_internal+0xe3/0x1b0
[   98.735445]  bus_remove_device+0xd6/0x140
[   98.735447]  device_del+0x167/0x380
[   98.735449]  platform_device_del.part.16+0xe/0x60
[   98.735451]  platform_device_unregister+0x17/0x30
[   98.735453]  snd_sof_device_remove+0x44/0x80 [snd_sof]
[   98.735455]  sof_pci_remove+0x10/0x30 [snd_sof_pci]
[   98.735457]  pci_device_remove+0x36/0xb0
[   98.735459]  device_release_driver_internal+0xd3/0x1b0
[   98.735460]  driver_detach+0x37/0x6b
[   98.735461]  bus_remove_driver+0x6f/0xc1
[   98.735462]  pci_unregister_driver+0x31/0x90

 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index bb1e9e2c4ff4..00e8ad122ce7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -924,7 +924,7 @@ static void soc_cleanup_component(struct snd_soc_component *component)
 	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
 	soc_cleanup_component_debugfs(component);
 	component->card = NULL;
-	snd_soc_component_module_put_when_close(component);
+	snd_soc_component_module_put_when_remove(component);
 }
 
 static void soc_remove_component(struct snd_soc_component *component)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
