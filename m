Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6E145B69
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 19:15:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D001E169F;
	Wed, 22 Jan 2020 19:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D001E169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579716912;
	bh=CtjXmjrOQWz62DaVe8CPmj8T0DTYfMbHmat1KoRiKIk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bUPN839NsNFAgDLJfRmx4CRvSa+KDI4RSoqCMm3enAe5EX9fSXi2HDbzVevxePyiI
	 Sg8i3OUO1pXKUMeVI6rB8W9QGTmYkLVwAca/bQ5/P3O8DIj1sLcFp/X5wehqEHuObB
	 9RzVrp5Y0BSRm6kDfDBBY++sMJwk8Kcrn5pioh8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD06F801D8;
	Wed, 22 Jan 2020 19:13:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D7DFF8020C; Wed, 22 Jan 2020 19:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B45BF8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 19:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B45BF8007E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 10:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="259555169"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2020 10:13:18 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 Jan 2020 19:12:54 +0100
Message-Id: <20200122181254.22801-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
	global-out-of-bounds bug
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Definitions for idisp snd_soc_dai_links within skl_hda_dsp_common are
missing platform component. Add it to address following bug reported by
KASAN:

[   10.538502] BUG: KASAN: global-out-of-bounds in skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
[   10.538509] Write of size 8 at addr ffffffffc0606840 by task systemd-udevd/299
(...)
[   10.538519] Call Trace:
[   10.538524]  dump_stack+0x62/0x95
[   10.538528]  print_address_description+0x2f5/0x3b0
[   10.538532]  ? skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
[   10.538535]  __kasan_report+0x134/0x191
[   10.538538]  ? skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
[   10.538542]  ? skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
[   10.538544]  kasan_report+0x12/0x20
[   10.538546]  __asan_store8+0x57/0x90
[   10.538550]  skl_hda_audio_probe+0x13a/0x2b0 [snd_soc_skl_hda_dsp]
[   10.538553]  platform_drv_probe+0x51/0xb0
[   10.538556]  really_probe+0x311/0x600
[   10.538559]  driver_probe_device+0x87/0x1b0
[   10.538562]  device_driver_attach+0x8f/0xa0
[   10.538565]  ? device_driver_attach+0xa0/0xa0
[   10.538567]  __driver_attach+0x102/0x1a0
[   10.538569]  ? device_driver_attach+0xa0/0xa0
[   10.538572]  bus_for_each_dev+0xe8/0x160
[   10.538574]  ? subsys_dev_iter_exit+0x10/0x10
[   10.538577]  ? preempt_count_sub+0x18/0xc0
[   10.538580]  ? _raw_write_unlock+0x1f/0x40
[   10.538582]  driver_attach+0x2b/0x30
[   10.538585]  bus_add_driver+0x251/0x340
[   10.538588]  driver_register+0xd3/0x1c0
[   10.538590]  __platform_driver_register+0x6c/0x80
[   10.538592]  ? 0xffffffffc03e8000
[   10.538595]  skl_hda_audio_init+0x1c/0x1000 [snd_soc_skl_hda_dsp]
[   10.538598]  do_one_initcall+0xd0/0x36a
[   10.538600]  ? trace_event_raw_event_initcall_finish+0x160/0x160
[   10.538602]  ? kasan_unpoison_shadow+0x36/0x50
[   10.538605]  ? __kasan_kmalloc+0xcc/0xe0
[   10.538607]  ? kasan_unpoison_shadow+0x36/0x50
[   10.538609]  ? kasan_poison_shadow+0x2f/0x40
[   10.538612]  ? __asan_register_globals+0x65/0x80
[   10.538615]  do_init_module+0xf9/0x36f
[   10.538619]  load_module+0x398e/0x4590
[   10.538625]  ? module_frob_arch_sections+0x20/0x20
[   10.538628]  ? __kasan_check_write+0x14/0x20
[   10.538630]  ? kernel_read+0x9a/0xc0
[   10.538632]  ? __kasan_check_write+0x14/0x20
[   10.538634]  ? kernel_read_file+0x1d3/0x3c0
[   10.538638]  ? cap_capable+0xca/0x110
[   10.538642]  __do_sys_finit_module+0x190/0x1d0
[   10.538644]  ? __do_sys_finit_module+0x190/0x1d0
[   10.538646]  ? __x64_sys_init_module+0x50/0x50
[   10.538649]  ? expand_files+0x380/0x380
[   10.538652]  ? __kasan_check_write+0x14/0x20
[   10.538654]  ? fput_many+0x20/0xc0
[   10.538658]  __x64_sys_finit_module+0x43/0x50
[   10.538660]  do_syscall_64+0xce/0x700
[   10.538662]  ? syscall_return_slowpath+0x230/0x230
[   10.538665]  ? __do_page_fault+0x51e/0x640
[   10.538668]  ? __kasan_check_read+0x11/0x20
[   10.538670]  ? prepare_exit_to_usermode+0xc7/0x200
[   10.538673]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fixes: a78959f407e6 ("ASoC: Intel: skl_hda_dsp_common: use modern dai_link style")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index eb419e1ec42b..78ff5f24c40e 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -41,16 +41,19 @@ int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
 	return 0;
 }
 
-SND_SOC_DAILINK_DEFS(idisp1,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")),
+SND_SOC_DAILINK_DEF(idisp1_cpu,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
+SND_SOC_DAILINK_DEF(idisp1_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
 
-SND_SOC_DAILINK_DEFS(idisp2,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")),
+SND_SOC_DAILINK_DEF(idisp2_cpu,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
+SND_SOC_DAILINK_DEF(idisp2_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
 
-SND_SOC_DAILINK_DEFS(idisp3,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")),
+SND_SOC_DAILINK_DEF(idisp3_cpu,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
+SND_SOC_DAILINK_DEF(idisp3_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
 
 SND_SOC_DAILINK_DEF(analog_cpu,
@@ -83,21 +86,21 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 		.id = 1,
 		.dpcm_playback = 1,
 		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1),
+		SND_SOC_DAILINK_REG(idisp1_cpu, idisp1_codec, platform),
 	},
 	{
 		.name = "iDisp2",
 		.id = 2,
 		.dpcm_playback = 1,
 		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2),
+		SND_SOC_DAILINK_REG(idisp2_cpu, idisp2_codec, platform),
 	},
 	{
 		.name = "iDisp3",
 		.id = 3,
 		.dpcm_playback = 1,
 		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3),
+		SND_SOC_DAILINK_REG(idisp3_cpu, idisp3_codec, platform),
 	},
 	{
 		.name = "Analog Playback and Capture",
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
