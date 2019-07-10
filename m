Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5504364DFF
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 23:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED8E16B3;
	Wed, 10 Jul 2019 23:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED8E16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562794010;
	bh=WhChQ+wTHgqzCXCSue/qJ74jjUo0l9QE/ft1cLVxYcg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mgTvQYpCCKX/welGUjd9MKio7ueW43BLV/yYd3k/9Y9ccZekOE2WQSzmdDfl6e1Jp
	 Xy/9yE2Siyqvidc/vifLjyhokYgDLkP+XMf/rhbiOPoL7kdy44cnLoN2y59Zqjvlfn
	 HDPIkwu7zV3K1f585fyhkEHgsAQKr3rmmMMmvKa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2470DF802BC;
	Wed, 10 Jul 2019 23:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A62F802A1; Wed, 10 Jul 2019 23:25:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
 SPF_HELO_NONE, 
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F29F801A4
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 23:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F29F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="UqJKzTWH"
Received: by mail-lj1-x244.google.com with SMTP id h10so3568424ljg.0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4bG84wK40qDkdpSE59qosZ/l6ceKXgaVJ4hyCazYtQ=;
 b=UqJKzTWH55Qnc7Y73FL6Fqo2CehwhARwQ6Y2Nb4QlrRDShmN6md5UpHM3IlbELgx23
 7M8NUeAmE5hggOPFu4iBbgx/TVprQcBokGekw5/mVvS7wI00MDNbLbyM1GIuMUtO7qb5
 ji9FxWL1oPX4NbaxEJmF/RMux8E+GKed+pSTG1lLhQdB2d3OAPKT7lcOTfe8JsCbVJkq
 p9iRzvNlHTqdl+AKmx1x/GUUnvLukSPKkZqCJEFNanYvOivK/yH3b2z13pwLsYgnMruA
 n3UPYunInQAReTsR/MAH1p7IKnX8DvhpWGJ0Vhnuir4A2WghX0PkFp9FISpUmaBu7jCv
 06XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4bG84wK40qDkdpSE59qosZ/l6ceKXgaVJ4hyCazYtQ=;
 b=toa4oIbD0jrZjsKNE8VaYldenfHvh2GbYmDwq0WP24UWbvxEcSJH2LyN28/Qo1HgN6
 faR+KGe35C+1i2sayjXKgBWkdpibhtH8JkLs/2DY+AqYkWi93cHQD2NNeELYkx5H2mto
 YHSQNJxaAqWicjQrG3k/GNdDsuD7quxQj9K/B+P41RRe2PN5rktWZ9P9aQxiYU3ju6Rc
 hyVKoR6xfrpZLebWxVBLK5N0usngW1KOEQfNTKDjvO2NsVphvbnZqpYcJ5v+71uAB4rv
 GqcTa5dhGK1AtZ6RTZwQf4UUtEeWg6wzzg8Spqdeg692VC3HgMvqFcQ/D+aacB8JzTBz
 3yaA==
X-Gm-Message-State: APjAAAVRhej/ilpMu6ocb5znluYKJjJq1KWtrVmUH5kjp2bLhEvUee75
 Dg7LzjkCALGVtsC4SfcZ7UcY+fI3nuQYuysuIXv2Pw==
X-Google-Smtp-Source: APXvYqyP9hIkJyX6oMZXDk8+YnjeP5H9zUCabdB0q6zZYWNnBKsHQ+YxxoaXdSvBjTxjXbdE9z4F6CyuW4u9X+ZMtlo=
X-Received: by 2002:a2e:890a:: with SMTP id d10mr183491lji.145.1562793900289; 
 Wed, 10 Jul 2019 14:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
 <20190709131401.GA9224@smile.fi.intel.com>
 <20190709132943.GB9224@smile.fi.intel.com>
 <20190709133448.GC9224@smile.fi.intel.com>
 <20190709133847.GD9224@smile.fi.intel.com>
 <CAOReqxgnbDJsEcv7vdX3w44rzB=B69sHj95E8yBZ8DnZq0=63Q@mail.gmail.com>
 <20190710164346.GP9224@smile.fi.intel.com>
In-Reply-To: <20190710164346.GP9224@smile.fi.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 10 Jul 2019 14:24:48 -0700
Message-ID: <CAOReqxgnUp2tTp__YCjF_QH4166FAA1CE8Yq_VdE9jLW6Q4s3A@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Fletcher Woodruff <fletcherw@google.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, dmaengine@vger.kernel.org,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] DW-DMA: Probe failures on broadwell
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

On Wed, Jul 10, 2019 at 9:43 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 09, 2019 at 12:27:49PM -0700, Curtis Malainey wrote:
> > Hi Andy,
>
> Please, don't top post in the public mailing lists, community doesn't like it.
>
Apologies, forgot you looped in the mailing lists.
> > Thanks for the information, we are running a 4.14 kernel so we don't
> > have the idma32 driver, I will see if I can backport it and report
> > back if the fix works.
>
> Driver is supporting iDMA 32-bit in v4.14 AFAICS.
> The missed stuff is a split and some fixes here and there.
> Here is the list of patches I have in a range v4.14..v5.2
> (I deliberately dropped the insignificant ones)
>
> 934891b0a16c dmaengine: dw: Don't pollute CTL_LO on iDMA 32-bit
> 91f0ff883e9a dmaengine: dw: Reset DRAIN bit when resume the channel
> 69da8be90d5e dmaengine: dw: Split DW and iDMA 32-bit operations
> 87fe9ae84d7b dmaengine: dw: Add missed multi-block support for iDMA 32-bit
> ffe843b18211 dmaengine: dw: Fix FIFO size for Intel Merrifield
> 7b0c03ecc42f dmaengine: dw-dmac: implement dma protection control setting
>
> For me sounds like fairly easy to backport.
>
I got the code integrated, and ran some tests. The test device
regularly hits a BUG_ON in the dw/core.c, debug is turned on in dw
core

The bug code line corresponds to
BUG_ON(!list_empty(&dwc->active_list));
in dwc_free_chan_resources.

[    3.576829] sst-acpi INT3438:00: DesignWare DMA Controller, 8 channels
....
[    8.595007] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   13.595019] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   18.595025] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   23.595017] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   28.595017] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   33.595018] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   38.595018] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   43.595008] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   48.595011] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   53.595008] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   58.595019] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   63.595018] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   63.835059] udevd[172]: seq 1704
'/devices/pci0000:00/INT3438:00/haswell-pcm-audio' is taking a long
time
[   63.835078] udevd[172]: seq 1697
'/devices/pci0000:00/INT3438:00/bdw-rt5677' is taking a long time
[   68.595019] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   73.595007] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   78.595014] sst-acpi INT3438:00: dma_sync_wait: timeout!
[   78.595062] ------------[ cut here ]------------
[   78.595065] kernel BUG at
/mnt/host/source/src/third_party/kernel/v4.14/drivers/dma/dw/core.c:1035!
[   78.595074] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[   78.656023] gsmi: Log Shutdown Reason 0x03
[   78.656026] Modules linked in: snd_seq_dummy snd_seq snd_seq_device
bridge stp llc nf_nat_tftp nf_conntrack_tftp nf_nat_ftp
nf_conntrack_ftp esp6 ah6 xfrm6_mode_tunnel xfrm6_mode_transport
xfrm4_mode_tunnel xfrm4_mode_transport lzo_rle lzo_compress
ip6t_REJECT ip6t_ipv6header zram
 ipt_MASQUERADE nf_nat_masquerade_ipv4 snd_soc_sst_haswell_pcm(+)
snd_soc_sst_dsp snd_soc_sst_ipc snd_soc_sst_firmware xt_mark uvcvideo
videobuf2_vmalloc snd_hda_codec_hdmi acpi_als snd_soc_rt5677
snd_soc_sst_acpi snd_soc_acpi_intel_match snd_hda_intel snd_soc_acpi
snd_soc_rt5677_spi
 snd_soc_rl6231 snd_hda_codec snd_hwdep snd_hda_core fuse
iio_trig_sysfs cros_ec_sensors_ring cros_ec_sensors
cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf
industrialio iwlmvm iwl7000_mac80211 r8152 mii iwlwifi cfg80211 btusb
btrtl
[   78.656072]  btbcm btintel bluetooth ecdh_generic joydev
[   78.656079] CPU: 2 PID: 2006 Comm: udevd Not tainted 4.14.132 #38
[   78.656081] Hardware name: GOOGLE Samus, BIOS
Google_Samus.6300.276.0 08/17/2016
[   78.656084] task: ffff9a4c86dde580 task.stack: ffffbae9817e8000
[   78.656089] RIP: 0010:dwc_free_chan_resources+0x140/0x151
[   78.656091] RSP: 0018:ffffbae9817eb8f0 EFLAGS: 00010293
[   78.656094] RAX: ffff9a4c827c60b8 RBX: ffff9a4c827c6028 RCX: ffff9a48b881f020
[   78.656095] RDX: 0000000000000007 RSI: 0000000000000006 RDI: ffff9a4cbed15418
[   78.656097] RBP: ffffbae9817eb920 R08: fffffffffffffcf6 R09: ffffffff8c8d2400
[   78.656099] R10: 0000000000000007 R11: ffffffff8c8c2130 R12: ffff9a4c8a6b8c00
[   78.656101] R13: 000000000003f8e0 R14: ffff9a4c8520bc28 R15: ffff9a4c86c49220
[   78.656103] FS:  00007c53e45ed040(0000) GS:ffff9a4cbed00000(0000)
knlGS:0000000000000000
[   78.656106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   78.656108] CR2: 00003deb215fc004 CR3: 00000004451dc002 CR4: 00000000003606e0
[   78.656109] Call Trace:
[   78.656115]  dma_chan_put+0x83/0xb1
[   78.656118]  dma_release_channel+0x33/0x6b
[   78.656123]  sst_fw_new+0x13f/0x274 [snd_soc_sst_firmware]
[   78.656135]  sst_hsw_module_load+0x108/0x167 [snd_soc_sst_haswell_pcm]
[   78.656141]  sst_hsw_dsp_init+0x1b9/0x429 [snd_soc_sst_haswell_pcm]
[   78.656147]  hsw_pcm_dev_probe+0x48/0xa7 [snd_soc_sst_haswell_pcm]
[   78.656152]  platform_drv_probe+0x3f/0x8b
[   78.656156]  driver_probe_device+0x272/0x2bf
[   78.656159]  __driver_attach+0x7a/0x9e
[   78.656162]  ? driver_attach+0x1f/0x1f
[   78.656165]  bus_for_each_dev+0x8e/0xc9
[   78.656168]  bus_add_driver+0x133/0x205
[   78.656175]  ?
trace_event_define_fields_hsw_device_config_req+0xc0/0xc0
[snd_soc_sst_haswell_pcm]
[   78.656178]  driver_register+0x8e/0xcd
[   78.656184]  ?
trace_event_define_fields_hsw_device_config_req+0xc0/0xc0
[snd_soc_sst_haswell_pcm]
[   78.656187]  do_one_initcall+0x113/0x206
[   78.656191]  ? __wake_up_common_lock+0x87/0xe5
[   78.656194]  ? __free_one_page+0x30/0x1eb
[   78.656198]  ? _raw_spin_unlock+0x1f/0x52
[   78.656201]  ? free_pcppages_bulk+0x222/0x245
[   78.656204]  ? kmem_cache_alloc_trace+0x55/0x1d1
[   78.656208]  do_init_module+0x61/0x1bc
[   78.656211]  load_module+0x252a/0x28c8
[   78.656215]  ? kernel_read_file+0x133/0x1ab
[   78.656218]  ? kernel_read_file_from_fd+0x46/0x71
[   78.656222]  SyS_finit_module+0xb6/0xda
[   78.656226]  do_syscall_64+0x6b/0x7f
[   78.656229]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[   78.656232] RIP: 0033:0x7c53e3d7c199
[   78.656234] RSP: 002b:00007ffef05b2ec8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   78.656237] RAX: ffffffffffffffda RBX: 00005adda7225fb0 RCX: 00007c53e3d7c199
[   78.656239] RDX: 0000000000000000 RSI: 00007c53e4628b85 RDI: 0000000000000011
[   78.656242] RBP: 00007ffef05b2f10 R08: 0000000000000000 R09: 00005adda720c5c0
[   78.656244] R10: 0000000000000011 R11: 0000000000000246 R12: 0000000000000000
[   78.656246] R13: 00005adda72140c0 R14: 00007c53e4628b85 R15: 0000000000000000
[   78.656249] Code: 41 20 86 81 01 00 00 75 08 4c 89 f7 e8 35 f4 ff
ff 65 48 8b 04 25 28 00 00 00 48 3b 45 e0 75 17 48 83 c4 18 5b 41 5e
41 5f 5d c3 <0f> 0b eb fe 0f 0b eb fe 0f 0b eb fe e8 96 76 c7 ff 0f 1f
44 00
[   78.656285] RIP: dwc_free_chan_resources+0x140/0x151 RSP: ffffbae9817eb8f0
[   78.656332] ---[ end trace 7557efe63d2179e8 ]---
[   78.659486] Kernel panic - not syncing: Fatal exception
[   78.659499] Kernel Offset: 0xa200000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   78.659604] gsmi: Log Shutdown Reason 0x02
[   78.662188] ACPI MEMORY or I/O RESET_REG.

We have only been able to consistently reproduce the DMA boot issue on
our original code consistently on 1 device and sporadically on another
handful of devices.
When the device did finally booted after 2-3 device crashes the device
failed to load the DSP.

[    3.709573] sst-acpi INT3438:00: DesignWare DMA Controller, 8 channels
[    3.959027] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
boot timeout IPCD 0x0 IPCX 0x0
[    3.970336] bdw-rt5677 bdw-rt5677: ASoC: failed to init link System PCM

> > On Tue, Jul 9, 2019 at 6:38 AM Andy Shevchenko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
