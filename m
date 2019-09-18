Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1CB59D8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 04:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59EA166B;
	Wed, 18 Sep 2019 04:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59EA166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568774967;
	bh=/EB6n0qFP/qxH08A2uI1TVFV3WDgNJnyhK6b0tUmzUo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6Nm3CLpNwo9gggbGJC0eM/ePuzPhv42ESpQdOt539f81UXaTnYj69ZRAzUy4W8V9
	 1IndWgnv4yeI0YjX4ucwQ13PXULTFmMtAjzRDg1adglaTO993nW1H+39sOauZep5C/
	 BOmdKWPNLY+osOggKXgVgFJG/UUglBaZJX1OF0Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3799CF804FF;
	Wed, 18 Sep 2019 04:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F196CF80506; Wed, 18 Sep 2019 04:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B263EF80292
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 04:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B263EF80292
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 19:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,519,1559545200"; d="scan'208";a="191583196"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga006.jf.intel.com with ESMTP; 17 Sep 2019 19:47:30 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 17 Sep 2019 19:47:30 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 17 Sep 2019 19:47:30 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.92]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.86]) with mapi id 14.03.0439.000;
 Wed, 18 Sep 2019 10:47:28 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Bard liao
 <yung-chuan.liao@linux.intel.com>
Thread-Topic: [PATCH] ASoC: core: delete component->card_list in
 soc_remove_component only
Thread-Index: AQHVbTaQ2ok0yj9UNUGKVA8zkqZyvKcwFfkAgACPtNA=
Date: Wed, 18 Sep 2019 02:47:28 +0000
Message-ID: <567A313375B6F043A9BE3A1D9B8C6E7F0B49706B@SHSMSX101.ccr.corp.intel.com>
References: <20190916210353.6318-1-yung-chuan.liao@linux.intel.com>
 <87ef0ewhnd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef0ewhnd.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTY3MTFiMDMtMjg4Yi00NWY3LTg4MTItNTYzZWU2OWE0NWJmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOExtSCtJVXFMVGNzbWFra0NnbGhteFc3YzRSamJTeVwvVUpZQW1Ya1IwYzNoWnl5REhTQUZZazZjbDZvbkU1akcifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: delete component->card_list in
 soc_remove_component only
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



> -----Original Message-----
> From: Kuninori Morimoto [mailto:kuninori.morimoto.gx@renesas.com]
> Sent: Wednesday, September 18, 2019 8:52 AM
> To: Bard liao <yung-chuan.liao@linux.intel.com>
> Cc: broonie@kernel.org; tiwai@suse.de; alsa-devel@alsa-project.org; pierre-
> louis.bossart@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH] ASoC: core: delete component->card_list in
> soc_remove_component only
> 
> 
> Hi Bard
> 
> Thank you for your patch
> 
> > From: Bard Liao <yung-chuan.liao@linux.intel.com>
> >
> > We add component->card_list in the end of soc_probe_component(). In
> > other words, component->card_list will not be added if there is an
> > error in the soc_probe_component() function. So we can't delete
> > component->card_list in the error handling of soc_probe_component().
> >
> > Fixes: 22d1423187e5 ("ASoC: soc-core: add soc_cleanup_component()")
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > ---
> 
> Hmm... what happen if you get error at soc_probe_component() ?
> What does your "can't delete component->card_list" mean ?
> Kernel Oops or warning ?

That is Kernel Oops, see the dmesg below.
[   84.180608] rt711 sdw:0:25d:711:0:1: ASoC: failed to probe component -517
[   84.180653] sdw_rt711_rt1308_rt715 sdw_rt711_rt1308_rt715: ASoC: failed to instantiate card -517
[   84.180701] sdw_rt711_rt1308_rt715 sdw_rt711_rt1308_rt715: snd_soc_register_card failed -517
...
[   94.419962] rt711 sdw:0:25d:711:0:1: ASoC: failed to probe component -517
[   94.419983] general protection fault: 0000 [#1] SMP PTI
[   94.419986] CPU: 6 PID: 119 Comm: kworker/6:1 Not tainted 5.3.0-rc7+ #821
[   94.419988] Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP TLC, BIOS ICLSFWR1.R00.3042.A02.1901222005 01/22/2019
[   94.419994] Workqueue: events deferred_probe_work_func
[   94.420012] RIP: 0010:soc_cleanup_component+0x1c/0x70 [snd_soc_core]
[   94.420015] Code: c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 53 31 d2 48 89 fb 31 f6 e8 03 bc 00 00 48 8b 43 58 48 8b 53 50 48 8d bb c0 00 00 00 <48> 89 42 08 48 89 10 48 b8 00 01 00 00 00 00 ad de 48 89 43 50 48
[   94.420017] RSP: 0000:ffffa40340317c38 EFLAGS: 00010246
[   94.420019] RAX: dead000000000122 RBX: ffff8fe22576ac28 RCX: 0000000000000006
[   94.420023] RDX: dead000000000100 RSI: 0000000000000000 RDI: ffff8fe22576ace8
[   94.420024] RBP: ffffffffc07430c0 R08: 0000000000000586 R09: 000000000000004c
[   94.420026] R10: ffffa40340317a68 R11: ffffa403403179a0 R12: ffff8fe22576ac20
[   94.420027] R13: ffff8fe22576ace8 R14: ffff8fe22576ac90 R15: 0000000000000000
[   94.420028] FS:  0000000000000000(0000) GS:ffff8fe227f80000(0000) knlGS:0000000000000000
[   94.420030] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   94.420034] CR2: 00007ffdf5555c40 CR3: 000000028cd5c002 CR4: 0000000000760ee0
[   94.420036] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   94.420037] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   94.420038] PKRU: 55555554
[   94.420039] Call Trace:
[   94.420050]  soc_probe_component+0x218/0x370 [snd_soc_core]
[   94.420059]  snd_soc_instantiate_card+0x4da/0xd10 [snd_soc_core]
[   94.420064]  ? devm_snd_soc_register_card+0x2e/0x80 [snd_soc_core]
[   94.420071]  snd_soc_register_card+0x169/0x190 [snd_soc_core]
[   94.420076]  devm_snd_soc_register_card+0x3e/0x80 [snd_soc_core]
[   94.420082]  mc_probe+0x152/0x1ac [snd_soc_sdw_rt711_rt1308_rt715]
[   94.420087]  ? acpi_dev_pm_attach+0x1b/0xa0
[   94.420090]  platform_drv_probe+0x32/0x90
[   94.420095]  really_probe+0xea/0x3d0
[   94.420097]  ? driver_allows_async_probing+0x50/0x50
[   94.420100]  driver_probe_device+0x10b/0x120
[   94.420102]  ? driver_allows_async_probing+0x50/0x50
[   94.420107]  bus_for_each_drv+0x61/0xa0
[   94.420110]  __device_attach+0xcf/0x150
[   94.420113]  bus_probe_device+0x82/0x90
[   94.420115]  deferred_probe_work_func+0x6f/0xc0
[   94.420121]  process_one_work+0x1e3/0x3d0
[   94.420124]  worker_thread+0x28/0x3c0
[   94.420126]  ? cancel_delayed_work+0x80/0x80
[   94.420128]  kthread+0x10e/0x130
[   94.420132]  ? kthread_park+0xa0/0xa0
[   94.420135]  ret_from_fork+0x35/0x40
[   94.420138] Modules linked in: snd_soc_rt715 snd_soc_rt1308_sdw snd_soc_rt711 regmap_sdw soundwire_intel snd_soc_sdw_rt711_rt1308_rt715 soundwire_cadence snd_soc_hdac_hdmi snd_soc_dmic snd_sof_pci snd_sof_intel_hda_common snd_soc_hdac_hda snd_hda_codec soundwire_intel_init snd_intel_nhlt snd_sof_intel_hda snd_sof_intel_byt snd_soc_acpi_intel_match snd_soc_acpi snd_sof_intel_ipc snd_sof snd_sof_xtensa_dsp snd_hda_ext_core snd_hda_core snd_soc_core snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device snd_timer snd soundcore ax88179_178a usbnet x86_pkg_temp_thermal intel_powerclamp intel_lpss_pci mei_me intel_lpss mfd_core mei efivarfs i915 i2c_algo_bit drm_kms_helper syscopyarea xhci_pci sysfillrect sysimgblt sdhci_pci fb_sys_fops cqhci sdhci xhci_hcd drm
[   94.420169] ---[ end trace 32434ffe9a1d6bab ]---

> 
> I tried to create an error on purpose at soc_probe_component(), but, there was
> no kernel oops, no warning, etc.
> It just can't create sound card. It is very normal for me.
> Or, which kernel are you using ?

Somehow I can only see the second attempt of component probe when it return
-517 (EPROBE_DEFER) in the first attempt by using below kernel.
https://github.com/plbossart/sound/commits/fix/soundwire-split-lookup-init

To me, the easiest way to see the issue is force return - EPROBE_DEFER on
codec driver's probe function and call list_del(&component->card_list);
before calling soc_cleanup_component(component);
So list_del() will be called twice and you will see the issue.

> 
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
