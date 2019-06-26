Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30B57403
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 00:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28B816C0;
	Thu, 27 Jun 2019 00:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28B816C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561586526;
	bh=lXzU7A+Ru+CE2hNTyT6jikJZA/3gR4/fqINkpq1kGn8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gI48+iUYlDuxbXTPThDQ4i9SYKBQixR6snJ7gTEU2moBEAPeCdmzsIyWw9XGosf2M
	 vjhZQqiuhhuOhited96IQlpaCo1PlRDncyYIi0/Gj9o6y7/vsZCLI7SvNX8HDqbPQY
	 NrNgupgLrm4+nXzLb9uDAn9UVI6ZGOCv9p4WiZp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70345F896B7;
	Thu, 27 Jun 2019 00:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44118F896B9; Thu, 27 Jun 2019 00:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A68F8070C
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 00:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A68F8070C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZCzHjJiA"
Received: by mail-lf1-x141.google.com with SMTP id p24so152858lfo.6
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 15:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JyXUZN3d9nTl1VNrk3kDrWvLDP0lwXZGyPfqOphTUFM=;
 b=ZCzHjJiAiDiCR9mj5Ld238821g8oMPmN+tbqTDsHDNYNujdnnxeBH0EMfTaSQaqx4R
 FQ4o4nQou6dNncE6XiTTTefk2SzPqJoFKpEN8NXBacOvpEha29OTsyqxtN1GF5Lf7Ipl
 Rda/QR2gSCYdkKMUA+c3Uc6NtmZTTnWkNjqAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JyXUZN3d9nTl1VNrk3kDrWvLDP0lwXZGyPfqOphTUFM=;
 b=VswW7Wv5MilLh4d8Cxkdbg0VmSLJ0T37AMZfz3/lZvSrPYRNuBS0bQCqS69Hk/oThQ
 2QGeNRXUqh2ltd2hweVMaytSdrSuoaf0z0e4BeyBvhwzuGXSeTf8sfaHt6zay3s6uJp7
 IdlOffKndVpo31HOkPopSDtercH9e5lThhLIJ8WkkPSpgqGbmz9XLZzOnWINzGXaQxM2
 gtz96hLXd4rf953yElqlP70xEDvil8oHSelJ8D+uXTA20uK4WVMpopGbpPK0gBsQ2HZC
 rArcD+s5kEh7Yp8ZedIti03Jr1OJ2USTCHqNvxMo+0xs6IAELaZkdInuHdsORVTPUx1W
 E49A==
X-Gm-Message-State: APjAAAWHcPjp2XukMLvx2F4sFasLJRc+muVyWOVGVWWG8PEdXj0/NEji
 6MVCfzR0IgZdDiKBBtxDwnTNAfQmzs8=
X-Google-Smtp-Source: APXvYqz8E9q+kZJ4YbJ0cwfjx/wnwLEQsOgyqpzMKjb10e59NW9KjI+3/tgHL+q1bDrthF25Rl4i2A==
X-Received: by 2002:a19:491d:: with SMTP id w29mr190022lfa.149.1561586411984; 
 Wed, 26 Jun 2019 15:00:11 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id r17sm16887ljb.77.2019.06.26.15.00.11
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 15:00:11 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id y198so167355lfa.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 15:00:11 -0700 (PDT)
X-Received: by 2002:a19:3f16:: with SMTP id m22mr203847lfa.104.1561586410284; 
 Wed, 26 Jun 2019 15:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190625215418.17548-1-evgreen@chromium.org>
 <s5himsssqe8.wl-tiwai@suse.de>
 <CAE=gft62iv=V=auOhocRRfPV2Tuc2WiRYJOH5_M+HkM0qH-Jhw@mail.gmail.com>
 <s5hy31oqc8a.wl-tiwai@suse.de>
In-Reply-To: <s5hy31oqc8a.wl-tiwai@suse.de>
From: Evan Green <evgreen@chromium.org>
Date: Wed, 26 Jun 2019 14:59:33 -0700
X-Gmail-Original-Message-ID: <CAE=gft664LfHU58Hm+Xtu-OYqiZT0Xsp3X2=U-Q+ApTsgj7z+g@mail.gmail.com>
Message-ID: <CAE=gft664LfHU58Hm+Xtu-OYqiZT0Xsp3X2=U-Q+ApTsgj7z+g@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Amadeusz S*awi*ski <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Use correct start/count for
	sysfs init
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

On Wed, Jun 26, 2019 at 2:16 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 26 Jun 2019 22:34:28 +0200,
> Evan Green wrote:
> >
> > On Wed, Jun 26, 2019 at 1:27 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Tue, 25 Jun 2019 23:54:18 +0200,
> > > Evan Green wrote:
> > > >
> > > > The normal flow through the widget sysfs codepath is that
> > > > snd_hdac_refresh_widgets() is called once without the sysfs bool set
> > > > to set up codec->num_nodes and friends, then another time with the
> > > > bool set to actually allocate all the sysfs widgets. However, during
> > > > the first time allocation, hda_widget_sysfs_reinit() ignores the new
> > > > num_nodes passed in via parameter and just calls hda_widget_sysfs_init(),
> > > > using whatever was in codec->num_nodes before the update. This is not
> > > > correct in cases where num_nodes changes. Here's an example:
> > > >
> > > > Sometime earlier:
> > > > snd_hdac_refresh_widgets(hdac, false)
> > > >   sets codec->num_nodes to 2, widgets is still not allocated
> > > >
> > > > Now:
> > > > snd_hdac_refresh_widgets(hdac, true)
> > > >   hda_widget_sysfs_reinit(num_nodes=7)
> > > >     hda_widget_sysfs_init()
> > > >       widget_tree_create()
> > > >         alloc(codec->num_nodes) // this is still 2
> > > >   codec->num_nodes = 7
> > > >
> > > > Pass num_nodes and start_nid down into widget_tree_create() so that
> > > > the right number of nodes are allocated in all cases.
> > > >
> > > > Signed-off-by: Evan Green <evgreen@chromium.org>
> > >
> > > Thanks for the patch.  That's indeed a problem, but I guess a simpler
> > > approach is just to return if sysfs didn't exist.  If the sysfs
> > > entries aren't present at the second call with sysfs=true, it implies
> > > that the codec object will be exposed anyway later, and the sysfs will
> > > be created there.  So, something like below would work instead?
> >
> > Hi Takashi,
> > Thanks for taking a look. I'm not sure you'd want to do that because
> > then you end up returning from sysfs_reinit without having allocated
> > any of the sysfs widgets. You'd be relying on the implicit behavior
> > that another call to init is coming later (despite having updated
> > num_nodes and start node), which is difficult to follow and easy to
> > break. In my opinion the slight bit of extra diffs is well worth the
> > clarity of having widget_tree_create always allocate the correct
> > start/count.
>
> Well, skipping is the right behavior, actually.  The whole need of the
> refresh function is just to refresh the widget list, and the current
> behavior to create a sysfs is rather superfluous.  This action has
> never been used, so better to get removed for avoiding misuse.

Whoops, I sent out a v2 before seeing this. Sorry to jump the gun like that.

I don't quite follow what you mean by "current behavior to create a
sysfs is rather superfluous". Do you think we could delete this
conditional in re-init altogether? I wasn't totally sure, but it
seemed like if the conditional could possibly be activated, then the
behavior was also incorrect.

Actually, couldn't this happen if something goes through
widget_tree_free(), then something else goes through a reinit()? If
the reinit call doesn't have the same number of widgets as before,
then you'd need my patch to avoid initing with the wrong array size.

>
> > Actually, in looking at the widget lock patch, I don't think it's
> > sufficient either. It adds a lock around sysfs_reinit, but the setting
> > of codec->num_nodes and codec->start_nid is unprotected by the lock.
> > So you could have the two threads politely serialize through
> > sysfs_reinit, but then get reordered before setting codec->num_nodes,
> > landing you with an array whose length doesn't match num_nodes.
>
> The usage of snd_hdac_refresh_widgets() is supposed to be done only at
> the codec probe phase, hence there is no lock done in the core code;
> IOW, any concurrent access has to be protected in the caller side in
> general.
>
> Have you actually seen such concurrent accesses?  If yes, that's a
> problem in the usage.

I got into staring at this code while trying to debug a KASAN
use-after-free in this code. I found the issue in this patch by
inspection, so I'm not 100% sure if it could ever happen. My
use-after-free appears to be fixed by the new widget_lock (I didn't
have that at the time), but I think at least my other patch in v2 is
necessary to make the widget_lock work correctly.

I'll document my use-after-free here in case it helps. The cleaned up
stacks racing to mess with sysfs look like this:
Thread A:
    [   28.296049]  hda_widget_sysfs_reinit+0x184/0x552 [snd_hda_core]
    [   28.526242]  snd_hdac_refresh_widgets+0x106/0x39c [snd_hda_core]
    [   28.542238]  hdac_hdmi_dev_probe+0x19a8/0x1af5 [snd_soc_hdac_hdmi]
    [   28.586440]  really_probe+0x3f4/0x58e
    [   28.590563]  driver_probe_device+0xb1/0x1db
    [   28.595266]  __driver_attach+0x14f/0x1f7
    [   28.599684]  bus_for_each_dev+0x146/0x1a1
    [   28.621944]  bus_add_driver+0x349/0x4f6
    [   28.626266]  driver_register+0x1cb/0x328
    [   28.634411]  do_one_initcall+0x3ea/0x903
    [   28.738132]  do_init_module+0x1f9/0x56d
    [   28.742463]  load_module+0x74d6/0x8d0a
    [   28.783270]  __se_sys_finit_module+0x1d6/0x244

Thread B:
    Thread B:
    /mnt/host/source/src/third_party/kernel/v4.19/sound/hda/hdac_sysfs.c:423
hda_widget_sysfs_init+0x345/0x41d
    [snd_hda_core]
    [   29.178793]  snd_hdac_device_register+0x20/0x3a [snd_hda_core]
    [   29.185351]  snd_hdac_ext_bus_device_init+0x151/0x240 [snd_hda_ext_core]
    [   29.211982]  hda_codec_probe_bus+0x298/0x35a [snd_sof_intel_hda]
    [   29.228663]  hda_dsp_probe+0x15aa/0x1da9 [snd_sof_intel_hda_common]
    [   29.257109]  sof_probe_work+0x120/0x930 [snd_sof]
    [   29.284174]  process_one_work+0x90b/0x11b6
    [   29.318222]  worker_thread+0xad5/0xdcc
    [   29.336172]  kthread+0x34e/0x35e

The original use-after-free:
    [   27.822086]
==================================================================
    [   27.830522] BUG: KASAN: use-after-free in
add_widget_node+0xc6/0xf3 [snd_hda_core]
    [   27.839073] Write of size 8 at addr ffff888405d72f10 by task
kworker/2:1/67
    [   27.846940]
    [   27.848645] CPU: 2 PID: 67 Comm: kworker/2:1 Not tainted 4.19.44 #93
    [   27.855832] Hardware name: Google Hatch/Hatch, BIOS
Google_Hatch.12225.0.2019_05_24_1436 05/24/2019
    [   27.866009] Workqueue: events sof_probe_work [snd_sof]
    [   27.871819] Call Trace:
    [   27.874612]  dump_stack+0x122/0x1b5
    [   27.878574]  ? do_raw_spin_lock+0xbd/0x1e9
    [   27.883216]  ? show_regs_print_info+0x5/0x5
    [   27.887962]  ? log_buf_vmcoreinfo_setup+0x131/0x131
    [   27.893483]  ? _raw_spin_lock_irqsave+0xc5/0xfa
    [   27.898620]  print_address_description+0x88/0x271
    [   27.903959]  ? add_widget_node+0xc6/0xf3 [snd_hda_core]
    [   27.909876]  kasan_report+0x274/0x29e
    [   27.914032]  add_widget_node+0xc6/0xf3 [snd_hda_core]
    [   27.919759]  hda_widget_sysfs_init+0x2b8/0x3a5 [snd_hda_core]
    [   27.926283]  snd_hdac_device_register+0x20/0x3a [snd_hda_core]
    [   27.932897]  snd_hdac_ext_bus_device_init+0x151/0x240 [snd_hda_ext_core]
    [   27.940485]  ? snd_hdac_ext_bus_exit+0x44/0x44 [snd_hda_ext_core]
    [   27.947381]  ? kmem_cache_alloc_trace+0x11d/0x19a
    [   27.952712]  ? hda_codec_probe_bus+0x283/0x35a [snd_sof_intel_hda]
    [   27.959705]  hda_codec_probe_bus+0x298/0x35a [snd_sof_intel_hda]
    [   27.966517]  ? 0xffffffffa05c0000
    [   27.970288]  ? snd_sof_pci_update_bits+0x53/0x64 [snd_sof]
    [   27.976515]  hda_dsp_probe+0x15df/0x1de5 [snd_sof_intel_hda_common]
    [   27.983619]  ? print_irqtrace_events+0x223/0x223
    [   27.988861]  ? hda_dsp_get_status+0x1ba/0x1ba [snd_sof_intel_hda_common]
    [   27.996433]  ? reacquire_held_locks+0x373/0x373
    [   28.001570]  ? trace_hardirqs_on_thunk+0x1a/0x1c
    [   28.006817]  ? __lock_is_held+0x61/0x11e
    [   28.011277]  sof_probe_work+0x120/0x930 [snd_sof]
    [   28.016617]  ? snd_sof_device_probe+0x47f/0x47f [snd_sof]
    [   28.022736]  ? rcu_read_lock_sched_held+0x140/0x22a
    [   28.028260]  ? __bpf_trace_rcu_utilization+0xa/0xa
    [   28.033689]  ? read_word_at_a_time+0x12/0x18
    [   28.038539]  process_one_work+0x90b/0x11b6
    [   28.043210]  ? worker_detach_from_pool+0x1fa/0x1fa
    [   28.048636]  ? is_mmconf_reserved+0x3bc/0x3bc
    [   28.053577]  ? lock_downgrade+0x60a/0x60a
    [   28.058133]  ? lockdep_hardirqs_on+0x6d8/0x6d8
    [   28.063163]  ? _raw_spin_unlock_irq+0x83/0x100
    [   28.068208]  ? do_raw_spin_lock+0xbd/0x1e9
    [   28.068549] cr50_spi spi-PRP0001:01: SPI transfer timed out
    [   28.072842]  worker_thread+0xad5/0xdcc
    [   28.072861]  ? _raw_spin_unlock+0xfa/0xfa
    [   28.072868]  ? _raw_spin_lock_irqsave+0xc5/0xfa
    [   28.072898]  ? pr_cont_work+0xe6/0xe6
    [   28.072905]  kthread+0x34e/0x35e
    [   28.072914]  ? pr_cont_work+0xe6/0xe6
    [   28.072922]  ? kthread_blkcg+0xa2/0xa2
    [   28.109396]  ret_from_fork+0x24/0x50
    [   28.113433]
    [   28.115130] Allocated by task 67:
    [   28.118894]  kmem_cache_alloc_trace+0x11d/0x19a
    [   28.124038]  hda_widget_sysfs_init+0x8a/0x3a5 [snd_hda_core]
    [   28.130444]  snd_hdac_device_register+0x20/0x3a [snd_hda_core]
    [   28.137047]  snd_hdac_ext_bus_device_init+0x151/0x240 [snd_hda_ext_core]
    [   28.144620]  hda_codec_probe_bus+0x298/0x35a [snd_sof_intel_hda]
    [   28.151417]  hda_dsp_probe+0x15df/0x1de5 [snd_sof_intel_hda_common]
    [   28.158508]  sof_probe_work+0x120/0x930 [snd_sof]
    [   28.163829]  process_one_work+0x90b/0x11b6
    [   28.168457]  worker_thread+0xad5/0xdcc
    [   28.172693]  kthread+0x34e/0x35e
    [   28.176349]  ret_from_fork+0x24/0x50
    [   28.180388]
    [   28.182078] Freed by task 2983:
    [   28.185639]  kfree+0x239/0x723
    [   28.189106]  hda_widget_sysfs_reinit+0x47e/0x50a [snd_hda_core]
    [   28.195824]  snd_hdac_refresh_widgets+0xf8/0x2a0 [snd_hda_core]
    [   28.202527]  hdac_hdmi_dev_probe+0x19a8/0x1af5 [snd_soc_hdac_hdmi]
    [   28.209514]  really_probe+0x237/0x58e
    [   28.213673]  driver_probe_device+0xb1/0x1db
    [   28.218415]  __driver_attach+0x14f/0x1f7
    [   28.222857]  bus_for_each_dev+0x146/0x1a1
    [   28.227402]  bus_add_driver+0x349/0x4f6
    [   28.231736]  driver_register+0x1cb/0x328
    [   28.236164]  do_one_initcall+0x3ea/0x903
    [   28.240611]  do_init_module+0x1f9/0x56d
    [   28.244971]  load_module+0x74d6/0x8d0a
    [   28.249218]  __se_sys_finit_module+0x1d6/0x244
    [   28.254250]  do_syscall_64+0xcd/0x120
    [   28.258389]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
    [   28.264095]
    [   28.265794] The buggy address belongs to the object at ffff888405d72f08
    [   28.265794]  which belongs to the cache kmalloc-32 of size 32
    [   28.279733] The buggy address is located 8 bytes inside of
    [   28.279733]  32-byte region [ffff888405d72f08, ffff888405d72f28)
    [   28.292627] The buggy address belongs to the page:
    [   28.298037] page:ffffea0010175c80 count:1 mapcount:0
mapping:ffff88840cc0c5c0 index:0x0 compound_mapcount: 0
    [   28.308498] cr50_spi spi-PRP0001:01: SPI transfer timed out
    [   28.309102] flags: 0x8000000000008100(slab|head)
    [   28.309111] raw: 8000000000008100 ffffea0010175c08
ffffea00102ef108 ffff88840cc0c5c0
    [   28.329340] raw: 0000000000000000 0000000000150015
00000001ffffffff 0000000000000000
    [   28.338091] page dumped because: kasan: bad access detected
    [   28.344381]
    [   28.346079] Memory state around the buggy address:
    [   28.351497]  ffff888405d72e00: fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc fc
    [   28.359663]  ffff888405d72e80: fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc fc
    [   28.367824] >ffff888405d72f00: fc fb fb fb fb fc fc fc fc fc fc
fc fc fc fc fc
    [   28.375987]                          ^
    [   28.380236]  ffff888405d72f80: fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc fc
    [   28.388401]  ffff888405d73000: fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc fc

Again, sorry about prematurely sending out the v2. This patch hasn't
changed, so feel free to ignore that part of the v2. The other patch
though is new, and I think is needed regardless of the state of this
patch.

-Evan

>
>
> thanks,
>
> Takashi
>
> >
> > Let me craft up an additional patch to fix the locking.
> > -Evan
> >
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > --- a/sound/hda/hdac_sysfs.c
> > > +++ b/sound/hda/hdac_sysfs.c
> > > @@ -428,7 +428,7 @@ int hda_widget_sysfs_reinit(struct hdac_device *codec,
> > >         int i;
> > >
> > >         if (!codec->widgets)
> > > -               return hda_widget_sysfs_init(codec);
> > > +               return 0;
> > >
> > >         tree = kmemdup(codec->widgets, sizeof(*tree), GFP_KERNEL);
> > >         if (!tree)
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
