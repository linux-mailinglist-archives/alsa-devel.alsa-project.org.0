Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519FBA1C8F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27F21697;
	Thu, 29 Aug 2019 16:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27F21697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088379;
	bh=AcTR1lr48GBhtZDnzaOljAXm5vTrd2VHILp5ry1CQLA=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DR7bGPbf1d51CtDGcUj4TXZdBhZ1H8A/82mSYGzVWMvOqGZWpP7sIkjOVq8sgHK6J
	 fLnNKHikapP27JU5ULP4SUfgMpv6pKFrlOeRZrAGpfm/XuVNpeJ/6KfOxX9lgvm29l
	 71TFIkEibEkR3i4TnGhPkItBWODo9GmljcIbiuZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FAFF8973A;
	Wed, 28 Aug 2019 11:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4166CF89739; Wed, 28 Aug 2019 11:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D89FF8972A
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 11:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D89FF8972A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 02:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="210105867"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.142.163])
 ([10.237.142.163])
 by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2019 02:38:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
 <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
 <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
 <90925296-5cb4-fa87-9c35-a7008f5e8df5@linux.intel.com>
 <3ff82f6b-647f-5f9c-09c7-be42a00c8bd4@intel.com>
 <4722ef7e-0fc7-4ec5-c37c-a0e58961345d@linux.intel.com>
 <c5f8d006-fe17-9772-c681-13f0ad064172@intel.com>
Message-ID: <0ed8e2ee-c396-74d7-29c8-fa0ecac77f61@intel.com>
Date: Wed, 28 Aug 2019 11:38:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c5f8d006-fe17-9772-c681-13f0ad064172@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-08-23 09:27, Cezary Rojewski wrote:
> On 2019-08-22 22:44, Pierre-Louis Bossart wrote:
>>>
>>> Please checkout sst-acpi.c file and see declaration of legacy 
>>> platform descriptors. See the names of PCM devices (platform devices) 
>>> being declared.
>>
>> what happens in sst-acpi.c stays in sst-acpi.c
>> I don't get how you retrieve the pdata in the machine driver from 
>> *another* driver. Different devices, different platform data.
> 
> DAI is tied with platform device called "haswell-pcm-audio" whereas 
> machine board is represented by "broadwell-audio" platform deivce. Which 
> part is still unclear?

Did what you ask and must say, results are not entirely unexpected..


Change:

diff --git a/sound/soc/intel/boards/broadwell.c 
b/sound/soc/intel/boards/broadwell.c
index db7e1e87156d..ee52564437c3 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -126,7 +126,8 @@ static const struct snd_soc_ops broadwell_rt286_ops = {
  static int broadwell_rtd_init(struct snd_soc_pcm_runtime *rtd)
  {
         struct snd_soc_component *component = 
snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-       struct sst_pdata *pdata = dev_get_platdata(component->dev);
+       struct snd_soc_acpi_mach *mach = dev_get_platdata(component->dev);
+       struct sst_pdata *pdata = mach->pdata;
         struct sst_hsw *broadwell = pdata->dsp;
         int ret;



Generates:

[   24.841747] hsw-acpi INT3438:00: DesignWare DMA Controller, 8 channels
[   24.862260] haswell-pcm-audio haswell-pcm-audio: Direct firmware load 
for intel/IntcPP01.bin failed with error -2
[   24.862320] haswell-pcm-audio haswell-pcm-audio: fw image 
intel/IntcPP01.bin not available(-2)
[   24.862924] haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox 
readback FW info: type 01, - version: 00.00, build 77, source commit id: 
876ac6906f31a43b6772b23c7c983ce9dcb18a19
[   24.946651] rt286 i2c-INT343A:00: ASoC: sink widget DMIC1 overwritten
[   24.946882] rt286 i2c-INT343A:00: ASoC: source widget DMIC1 overwritten
[   24.948251] 
==================================================================
[   24.948275] BUG: KASAN: user-memory-access in 
_raw_spin_lock_irqsave+0x7e/0xf0
[   24.948290] Write of size 4 at addr 0000010400000000 by task 
systemd-udevd/292

[   24.948313] CPU: 1 PID: 292 Comm: systemd-udevd Not tainted 
5.3.0-rc4+ #111
[   24.948317] Hardware name: Intel Corporation Broadwell Client 
platform/Pearl Valley, BIOS BDW-E1R1.86C.0119.R01.1503252201 03/25/2015
[   24.948319] Call Trace:
[   24.948327]  dump_stack+0x71/0xab
[   24.948334]  ? _raw_spin_lock_irqsave+0x7e/0xf0
[   24.948339]  ? _raw_spin_lock_irqsave+0x7e/0xf0
[   24.948346]  __kasan_report+0x176/0x192
[   24.948352]  ? _raw_spin_lock_irqsave+0x7e/0xf0
[   24.948359]  kasan_report+0xe/0x20
[   24.948366]  check_memory_region+0x149/0x1a0
[   24.948372]  _raw_spin_lock_irqsave+0x7e/0xf0
[   24.948378]  ? _raw_write_lock_bh+0xe0/0xe0
[   24.948426]  ? snd_soc_dapm_add_route+0x2da/0x4f0 [snd_soc_core]
[   24.948435]  ipc_tx_message+0xa8/0x540 [snd_soc_sst_ipc]
[   24.948485]  ? snd_soc_dapm_add_path+0x9c0/0x9c0 [snd_soc_core]
[   24.948490]  ? 0xffffffffc0bc0000
[   24.948512]  ? snd_ctl_dev_free+0x80/0x80 [snd]
[   24.948522]  sst_ipc_tx_message_wait+0x63/0xb0 [snd_soc_sst_ipc]
[   24.948545]  sst_hsw_device_set_config+0x13f/0x2d0 
[snd_soc_sst_haswell_pcm]
[   24.948552]  ? mutex_unlock+0x1d/0x40
[   24.948572]  ? hsw_notification_work+0x2c0/0x2c0 
[snd_soc_sst_haswell_pcm]
[   24.948578]  ? strcmp+0x30/0x50
[   24.948584]  ? strcmp+0x30/0x50
[   24.948597]  broadwell_rtd_init+0x68/0xa0 [snd_soc_sst_broadwell]
[   24.948642]  snd_soc_instantiate_card+0xd81/0x1720 [snd_soc_core]
[   24.948690]  ? soc_cleanup_card_resources+0x5a0/0x5a0 [snd_soc_core]
[   24.948697]  ? __kasan_kmalloc.constprop.8+0xa0/0xd0
[   24.948703]  ? __kmalloc_node_track_caller+0xf3/0x320
[   24.948749]  snd_soc_register_card+0x25b/0x280 [snd_soc_core]
[   24.948756]  ? devres_alloc_node+0x55/0x70
[   24.948801]  devm_snd_soc_register_card+0x3c/0x80 [snd_soc_core]
[   24.948809]  platform_drv_probe+0x4d/0xb0
[   24.948816]  really_probe+0x35c/0x5c0
[   24.948824]  driver_probe_device+0x181/0x1b0
[   24.948831]  device_driver_attach+0x8a/0x90
[   24.948838]  ? device_driver_attach+0x90/0x90
[   24.948843]  __driver_attach+0xc1/0x190
[   24.948849]  ? device_driver_attach+0x90/0x90
[   24.948854]  bus_for_each_dev+0xe6/0x140
[   24.948859]  ? _raw_write_trylock+0xe0/0xe0
[   24.948865]  ? subsys_dev_iter_exit+0x10/0x10
[   24.948871]  ? klist_node_init+0x61/0x90
[   24.948878]  bus_add_driver+0x212/0x310
[   24.948887]  driver_register+0xcf/0x1b0
[   24.948892]  ? 0xffffffffc09d8000
[   24.948900]  do_one_initcall+0x8b/0x2b4
[   24.948907]  ? trace_event_raw_event_initcall_finish+0x140/0x140
[   24.948914]  ? kasan_unpoison_shadow+0x30/0x40
[   24.948921]  ? kasan_unpoison_shadow+0x30/0x40
[   24.948926]  ? kasan_unpoison_shadow+0x30/0x40
[   24.948935]  do_init_module+0xe5/0x364
[   24.948941]  load_module+0x4385/0x4b80
[   24.948960]  ? module_frob_arch_sections+0x20/0x20
[   24.948965]  ? ima_read_file+0x10/0x10
[   24.948971]  ? vfs_read+0xc2/0x1a0
[   24.948978]  ? kernel_read+0x95/0xb0
[   24.948984]  ? kernel_read_file+0x14a/0x330
[   24.948992]  ? get_unmapped_area+0x16c/0x1c0
[   24.949000]  ? __do_sys_finit_module+0x193/0x1c0
[   24.949005]  __do_sys_finit_module+0x193/0x1c0
[   24.949012]  ? __ia32_sys_init_module+0x40/0x40
[   24.949019]  ? __do_sys_newfstat+0x7c/0xd0
[   24.949029]  do_syscall_64+0x73/0x1b0
[   24.949037]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   24.949042] RIP: 0033:0x7f03ff6124d9
[   24.949049] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8f 29 2c 00 f7 d8 64 89 01 48
[   24.949052] RSP: 002b:00007ffd2a5fcce8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   24.949058] RAX: ffffffffffffffda RBX: 000055c89fafe8e0 RCX: 
00007f03ff6124d9
[   24.949062] RDX: 0000000000000000 RSI: 00007f03ffb08e23 RDI: 
0000000000000012
[   24.949065] RBP: 00007f03ffb08e23 R08: 0000000000000000 R09: 
0000000000000000
[   24.949068] R10: 0000000000000012 R11: 0000000000000246 R12: 
0000000000000000
[   24.949072] R13: 000055c89fb33d50 R14: 0000000000020000 R15: 
000000000aba9500
[   24.949077] 
==================================================================
[   24.949092] Disabling lock debugging due to kernel taint
[   24.949100] BUG: unable to handle page fault for address: 
0000010400000000
[   24.949113] #PF: supervisor write access in kernel mode
[   24.949125] #PF: error_code(0x0002) - not-present page
[   24.949135] PGD 0 P4D 0
[   24.949147] Oops: 0002 [#1] SMP KASAN PTI
[   24.949160] CPU: 1 PID: 292 Comm: systemd-udevd Tainted: G    B 
       5.3.0-rc4+ #111
[   24.949176] Hardware name: Intel Corporation Broadwell Client 
platform/Pearl Valley, BIOS BDW-E1R1.86C.0119.R01.1503252201 03/25/2015
[   24.949198] RIP: 0010:_raw_spin_lock_irqsave+0x96/0xf0
[   24.949212] Code: be 04 00 00 00 c7 44 24 20 00 00 00 00 e8 82 00 3b 
ff 48 8d 7c 24 20 be 04 00 00 00 e8 73 00 3b ff ba 01 00 00 00 8b 44 24 
20 <f0> 0f b1 13 75 2f 48 b8 00 00 00 00 00 fc ff df 48 c7 44 05 00 00
[   24.949238] RSP: 0018:ffff888116d9f350 EFLAGS: 00010097
[   24.949251] RAX: 0000000000000000 RBX: 0000010400000000 RCX: 
ffffffffad01224d
[   24.949264] RDX: 0000000000000001 RSI: 0000000000000004 RDI: 
ffff888116d9f370
[   24.949277] RBP: 1ffff11022db3e6a R08: 0000000000000004 R09: 
ffffed1022db3e6e
[   24.949291] R10: 0000000000000001 R11: ffffed1022db3e6e R12: 
0000000000000246
[   24.949304] R13: 0000000000000000 R14: 0000000000000000 R15: 
0000000000000010
[   24.949320] FS:  00007f04007898c0(0000) GS:ffff888129480000(0000) 
knlGS:0000000000000000
[   24.949335] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.949348] CR2: 0000010400000000 CR3: 00000001277cc006 CR4: 
00000000003606e0
[   24.949360] Call Trace:
[   24.949372]  ? _raw_write_lock_bh+0xe0/0xe0
[   24.949426]  ? snd_soc_dapm_add_route+0x2da/0x4f0 [snd_soc_core]
[   24.949445]  ipc_tx_message+0xa8/0x540 [snd_soc_sst_ipc]
[   24.949501]  ? snd_soc_dapm_add_path+0x9c0/0x9c0 [snd_soc_core]
[   24.949515]  ? 0xffffffffc0bc0000
[   24.949543]  ? snd_ctl_dev_free+0x80/0x80 [snd]
[   24.949560]  sst_ipc_tx_message_wait+0x63/0xb0 [snd_soc_sst_ipc]
[   24.949592]  sst_hsw_device_set_config+0x13f/0x2d0 
[snd_soc_sst_haswell_pcm]
[   24.949609]  ? mutex_unlock+0x1d/0x40
[   24.949636]  ? hsw_notification_work+0x2c0/0x2c0 
[snd_soc_sst_haswell_pcm]
[   24.949651]  ? strcmp+0x30/0x50
[   24.949664]  ? strcmp+0x30/0x50
[   24.949682]  broadwell_rtd_init+0x68/0xa0 [snd_soc_sst_broadwell]
[   24.949736]  snd_soc_instantiate_card+0xd81/0x1720 [snd_soc_core]
[   24.949795]  ? soc_cleanup_card_resources+0x5a0/0x5a0 [snd_soc_core]
[   24.949811]  ? __kasan_kmalloc.constprop.8+0xa0/0xd0
[   24.949825]  ? __kmalloc_node_track_caller+0xf3/0x320
[   24.949879]  snd_soc_register_card+0x25b/0x280 [snd_soc_core]
[   24.949894]  ? devres_alloc_node+0x55/0x70
[   24.949947]  devm_snd_soc_register_card+0x3c/0x80 [snd_soc_core]
[   24.949964]  platform_drv_probe+0x4d/0xb0
[   24.949978]  really_probe+0x35c/0x5c0
[   24.949992]  driver_probe_device+0x181/0x1b0
[   24.950006]  device_driver_attach+0x8a/0x90
[   24.950020]  ? device_driver_attach+0x90/0x90
[   24.950033]  __driver_attach+0xc1/0x190
[   24.950047]  ? device_driver_attach+0x90/0x90
[   24.950059]  bus_for_each_dev+0xe6/0x140
[   24.950071]  ? _raw_write_trylock+0xe0/0xe0
[   24.950084]  ? subsys_dev_iter_exit+0x10/0x10
[   24.950097]  ? klist_node_init+0x61/0x90
[   24.950111]  bus_add_driver+0x212/0x310
[   24.950126]  driver_register+0xcf/0x1b0
[   24.950138]  ? 0xffffffffc09d8000
[   24.950151]  do_one_initcall+0x8b/0x2b4
[   24.950165]  ? trace_event_raw_event_initcall_finish+0x140/0x140
[   24.950181]  ? kasan_unpoison_shadow+0x30/0x40
[   24.950196]  ? kasan_unpoison_shadow+0x30/0x40
[   24.950209]  ? kasan_unpoison_shadow+0x30/0x40
[   24.950224]  do_init_module+0xe5/0x364
[   24.950238]  load_module+0x4385/0x4b80
[   24.950262]  ? module_frob_arch_sections+0x20/0x20
[   24.950275]  ? ima_read_file+0x10/0x10
[   24.950288]  ? vfs_read+0xc2/0x1a0
[   24.950300]  ? kernel_read+0x95/0xb0
[   24.950314]  ? kernel_read_file+0x14a/0x330
[   24.950328]  ? get_unmapped_area+0x16c/0x1c0
[   24.950343]  ? __do_sys_finit_module+0x193/0x1c0
[   24.950356]  __do_sys_finit_module+0x193/0x1c0
[   24.950369]  ? __ia32_sys_init_module+0x40/0x40
[   24.950384]  ? __do_sys_newfstat+0x7c/0xd0
[   24.950401]  do_syscall_64+0x73/0x1b0
[   24.950415]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   24.950427] RIP: 0033:0x7f03ff6124d9
[   24.950440] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8f 29 2c 00 f7 d8 64 89 01 48
[   24.950467] RSP: 002b:00007ffd2a5fcce8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   24.950484] RAX: ffffffffffffffda RBX: 000055c89fafe8e0 RCX: 
00007f03ff6124d9
[   24.950497] RDX: 0000000000000000 RSI: 00007f03ffb08e23 RDI: 
0000000000000012
[   24.950510] RBP: 00007f03ffb08e23 R08: 0000000000000000 R09: 
0000000000000000
[   24.950523] R10: 0000000000000012 R11: 0000000000000246 R12: 
0000000000000000
[   24.950537] R13: 000055c89fb33d50 R14: 0000000000020000 R15: 
000000000aba9500
[   24.950551] Modules linked in: snd_soc_sst_broadwell(+) 
intel_rapl_msr snd_soc_sst_haswell_pcm snd_soc_sst_ipc intel_rapl_common 
x86_pkg_temp_thermal snd_soc_sst_firmware intel_powerclamp coretemp 
snd_soc_rt298 kvm_intel kvm irqbypass snd_soc_rt286 snd_soc_rl6347a 
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_soc_core 
snd_pcm_dmaengine ac97_bus aesni_intel snd_pcm aes_x86_64 crypto_simd 
input_leds cryptd glue_helper snd_seq_midi serio_raw snd_seq_midi_event 
intel_pch_thermal snd_rawmidi mei_me mei lpc_ich snd_seq snd_seq_device 
soc_button_array intel_vbtn snd_timer snd_soc_hsw_acpi snd 
snd_soc_sst_dsp snd_soc_acpi_intel_match dw_dmac snd_soc_acpi soundcore 
8250_dw intel_hid intel_pmc_core sparse_keymap acpi_pad parport_pc ppdev 
lp parport autofs4 i915 ahci e1000e libahci sdhci_acpi video sdhci
[   24.950717] CR2: 0000010400000000
[   24.950728] ---[ end trace 7c9279db22368aac ]---
[   24.950742] RIP: 0010:_raw_spin_lock_irqsave+0x96/0xf0
[   24.950756] Code: be 04 00 00 00 c7 44 24 20 00 00 00 00 e8 82 00 3b 
ff 48 8d 7c 24 20 be 04 00 00 00 e8 73 00 3b ff ba 01 00 00 00 8b 44 24 
20 <f0> 0f b1 13 75 2f 48 b8 00 00 00 00 00 fc ff df 48 c7 44 05 00 00
[   24.950783] RSP: 0018:ffff888116d9f350 EFLAGS: 00010097
[   24.950795] RAX: 0000000000000000 RBX: 0000010400000000 RCX: 
ffffffffad01224d
[   24.950808] RDX: 0000000000000001 RSI: 0000000000000004 RDI: 
ffff888116d9f370
[   24.950822] RBP: 1ffff11022db3e6a R08: 0000000000000004 R09: 
ffffed1022db3e6e
[   24.950835] R10: 0000000000000001 R11: ffffed1022db3e6e R12: 
0000000000000246
[   24.950848] R13: 0000000000000000 R14: 0000000000000000 R15: 
0000000000000010
[   24.950863] FS:  00007f04007898c0(0000) GS:ffff888129480000(0000) 
knlGS:0000000000000000
[   24.950879] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.950891] CR2: 0000010400000000 CR3: 00000001277cc006 CR4: 
00000000003606e0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
