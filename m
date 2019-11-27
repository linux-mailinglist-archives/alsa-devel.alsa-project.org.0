Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C790010A8EC
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 03:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38729173B;
	Wed, 27 Nov 2019 03:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38729173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574823507;
	bh=dFAoW67gALgILdUIe3X1KiJahJy1cN3jeqP1VZmpFBM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FgIOyyNghBcnBXKaoHKi69QNTb1/QciYF9BI+qlZqQ+3XHEJhpLzPM2Vf8GwvbmZH
	 dVNQq+aT93Rod9aRlZSpmpO2WJS7k8339QMJ+1McgFHifKWzzErW9YKAA85YXFzlo2
	 BrKBN85WZiLCOAsg6d4YtyZpGmVFCMk/6+RZowOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95083F800E9;
	Wed, 27 Nov 2019 03:56:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54314F8014D; Wed, 27 Nov 2019 03:56:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 189A3F800E9
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 03:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 189A3F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 18:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="199033840"
Received: from maupad-mobl1.amr.corp.intel.com (HELO [10.255.87.110])
 ([10.255.87.110])
 by orsmga007.jf.intel.com with ESMTP; 26 Nov 2019 18:56:32 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <877e3og50x.wl-kuninori.morimoto.gx@renesas.com>
 <87pnhgeqc2.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8b7a2bc1-6d89-ea18-0816-70448cbf9cb0@linux.intel.com>
Date: Tue, 26 Nov 2019 20:56:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87pnhgeqc2.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 12/15] ASoC: soc-core: add missing
 return value check for soc_link_init()
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


> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 79a4753..bdae48e 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1983,8 +1983,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   		goto probe_end;
>   	}
>   
> -	for_each_card_rtds(card, rtd)
> -		soc_link_init(card, rtd);
> +	for_each_card_rtds(card, rtd) {
> +		ret = soc_link_init(card, rtd);
> +		if (ret < 0)
> +			goto probe_end;
> +	}

Morimoto-san, this patch proves very useful to avoid a kernel oops when 
a dailink init fails, but I still see a warning when cleaning-up.

I was experimenting with a topology file that wasn't complete and came 
across the warning below, would you have any ideas/recommendations on 
what might be missing? I am running out of time this week so thought I 
would ask, in case this rings a bell.

Thanks!

[   21.098662] bytcr_rt5640 bytcr_rt5640: ASoC: no source widget found 
for modem_out
[   21.098677] bytcr_rt5640 bytcr_rt5640: ASoC: Failed to add route 
modem_out -> direct -> ssp0 Tx
[   21.098694] bytcr_rt5640 bytcr_rt5640: ASoC: no sink widget found for 
modem_in
[   21.098703] bytcr_rt5640 bytcr_rt5640: ASoC: Failed to add route ssp0 
Rx -> direct -> modem_in
[   21.098732] bytcr_rt5640 bytcr_rt5640: ASoC: failed to init 
SSP2-Codec: -19

<<< this is the dailink init failure due to missing routes

[   21.098790] ------------[ cut here ]------------
[   21.098807] WARNING: CPU: 3 PID: 1028 at kernel/workqueue.c:3031 
__flush_work+0x1a3/0x1c0
[   21.098809] Modules linked in: snd_soc_sst_bytcr_rt5640(+) 
snd_sof_acpi snd_sof_intel_byt snd_soc_acpi_intel_match 
snd_sof_intel_bdw snd_sof_intel_ipc snd_sof snd_sof_xtensa_dsp 
snd_soc_acpi ax88179_178a usbnet intel_soc_dts_thermal intel_powerclamp 
hid_multitouch mei_txe mei wmi snd_soc_rt5640 snd_soc_rl6231 
int3406_thermal snd_soc_core processor_thermal_device int3403_thermal 
intel_soc_dts_iosf int3400_thermal snd_pcm int340x_thermal_zone 
acpi_thermal_rel snd_timer snd soundcore efivarfs mmc_block i915 
i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt 
fb_sys_fops xhci_pci drm xhci_hcd i2c_hid sdhci_acpi sdhci
[   21.098877] CPU: 3 PID: 1028 Comm: systemd-udevd Not tainted 
5.4.0-rc8-test+ #15
[   21.098880] Hardware name: ASUSTeK COMPUTER INC. T100TAF/T100TAF, 
BIOS T100TAF.207 09/10/2014
[   21.098889] RIP: 0010:__flush_work+0x1a3/0x1c0
[   21.098896] Code: ff ff 41 c6 04 24 00 fb 45 31 f6 eb 8e 8b 0b 48 8b 
53 08 83 e1 08 48 0f ba 2b 03 80 c9 f0 e9 5d ff ff ff 0f 0b e9 71 ff ff 
ff <0f> 0b 45 31 f6 e9 67 ff ff ff e8 de 2f fe ff 66 66 2e 0f 1f 84 00
[   21.098901] RSP: 0018:ffff9e05804cf910 EFLAGS: 00010246
[   21.098906] RAX: 0000000000000000 RBX: ffff8add3859c640 RCX: 
ffffffffc0748248
[   21.098910] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 
ffff8add3859c640
[   21.098913] RBP: 0000000000000000 R08: 0000000000000000 R09: 
ffff8add3679ae00
[   21.098917] R10: ffff8add35ff5840 R11: ffff9e05804cf7bd R12: 
ffff8add37558ed8
[   21.098921] R13: ffff8add37558e28 R14: 0000000000000001 R15: 
ffff8add36d36610
[   21.098926] FS:  00007f3ce09c7d40(0000) GS:ffff8add39580000(0000) 
knlGS:0000000000000000
[   21.098930] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.098934] CR2: 0000561745975f10 CR3: 0000000076f26000 CR4: 
00000000001006e0
[   21.098937] Call Trace:
[   21.098951]  ? try_to_del_timer_sync+0x4a/0x80
[   21.098973]  soc_free_pcm_runtime.part.0+0x38/0x50 [snd_soc_core]
[   21.098994]  snd_soc_tplg_component_remove+0x2f5/0x4f0 [snd_soc_core]
[   21.099015]  soc_remove_component+0x76/0x80 [snd_soc_core]
[   21.099033]  soc_cleanup_card_resources+0x100/0x2b0 [snd_soc_core]
[   21.099051]  snd_soc_bind_card+0x1f5/0xa00 [snd_soc_core]
[   21.099073]  devm_snd_soc_register_card+0x3e/0x80 [snd_soc_core]
[   21.099094]  snd_byt_rt5640_mc_probe.cold+0x4d3/0x55a 
[snd_soc_sst_bytcr_rt5640]
[   21.099110]  platform_drv_probe+0x30/0x80
[   21.099120]  really_probe+0x293/0x3c0
[   21.099130]  driver_probe_device+0xb1/0x100
[   21.099139]  device_driver_attach+0x4e/0x60
[   21.099148]  __driver_attach+0x85/0x140
[   21.099157]  ? device_driver_attach+0x60/0x60
[   21.099164]  bus_for_each_dev+0x73/0xb0
[   21.099174]  bus_add_driver+0x148/0x1e0
[   21.099183]  driver_register+0x67/0xb0
[   21.099191]  ? 0xffffffffc042b000
[   21.099199]  do_one_initcall+0x41/0x1df
[   21.099207]  ? __schedule+0x28c/0x5a0
[   21.099217]  ? free_vmap_area_noflush+0x8d/0xe0
[   21.099223]  ? _cond_resched+0x10/0x20
[   21.099232]  ? kmem_cache_alloc_trace+0x3a/0x1b0
[   21.099243]  do_init_module+0x56/0x200
[   21.099252]  load_module+0x243a/0x2730
[   21.099268]  ? __do_sys_finit_module+0xaa/0x110
[   21.099276]  __do_sys_finit_module+0xaa/0x110
[   21.099287]  do_syscall_64+0x43/0x110
[   21.099297]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   21.099304] RIP: 0033:0x7f3ce11b1f59
[   21.099312] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
[   21.099316] RSP: 002b:00007ffde804cc38 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   21.099324] RAX: ffffffffffffffda RBX: 000055a55f902bf0 RCX: 
00007f3ce11b1f59
[   21.099328] RDX: 0000000000000000 RSI: 00007f3ce10b6cad RDI: 
0000000000000006
[   21.099332] RBP: 00007f3ce10b6cad R08: 0000000000000000 R09: 
0000000000000000
[   21.099336] R10: 0000000000000006 R11: 0000000000000246 R12: 
0000000000000000
[   21.099341] R13: 000055a55f8f0940 R14: 0000000000020000 R15: 
000055a55f902bf0
[   21.099348] ---[ end trace c7c2a98f406474f6 ]---
[   21.099452] ------------[ cut here ]------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
