Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E6311BA4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 06:47:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80BCE15E4;
	Sat,  6 Feb 2021 06:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80BCE15E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612590468;
	bh=rbz6nObGmw3Djd47RcGDFdurlk8xtLubehuHOG6dU7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDX5fwUpxAQDZ+83mh9byLQTvR04Ip0D0A/nI8MOOPLNi9PjDSqH5Ch/+AT4gRO7x
	 PiusPmA3gioB2of7BbVsG+A7KnX9zmRGgtipb5C2CU53GLRBvQFj1Sso8luI9/g1Ri
	 c0pssEMuVNg8FKUvCiry7Ptjkk02FKxAu00HkhjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E76A5F80095;
	Sat,  6 Feb 2021 06:46:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5055F80171; Sat,  6 Feb 2021 06:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn
 [202.108.3.18]) by alsa1.perex.cz (Postfix) with SMTP id C9519F80095
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 06:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9519F80095
Received: from unknown (HELO localhost.localdomain)([114.246.224.195])
 by sina.com (172.16.97.35) with ESMTP
 id 601E2D060000683C; Sat, 6 Feb 2021 13:45:44 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 42860815073552
From: Hillf Danton <hdanton@sina.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: BUG: KASAN: use-after-free in snd_complete_urb+0x109e/0x1740
 [snd_usb_audio] (5.11-rc6)
Date: Sat,  6 Feb 2021 13:45:32 +0800
Message-Id: <20210206054533.120-1-hdanton@sina.com>
In-Reply-To: <CABXGCsOposU1A_HavA_jmtkJMKhDZgh5m1b_YJK1Es5wyE-hZw@mail.gmail.com>
References: <CABXGCsOposU1A_HavA_jmtkJMKhDZgh5m1b_YJK1Es5wyE-hZw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hillf Danton <hdanton@sina.com>, alsa-devel@alsa-project.org, tiwai@suse.de,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 zonque@gmail.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 6 Feb 2021 02:02:16 +0500 Mikhail Gavrilov wrote:
> Hi folks.
> On 5.11-rc6 (git 3aaf0a27ffc2) I caught a new issue.

Thanks for your report.

> For unknown reason sound disappeared in my headset Hyperx orbit s.
> But after reconnecting to another USB port headset stopped being

Here reconnecting is one of the key words - I suspect we will not
have a chance for seeing the UAF below without it.

> detected as USB device in dmesg
> and in log appears a record about bug KASAN: use-after-free.
> 
> [37920.370627] xhci_hcd 0000:06:00.3: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=0x0013 address=0xfe836480 flags=0x0000]
> [37920.370720] xhci_hcd 0000:06:00.3: WARNING: Host System Error
> [37925.514865] xhci_hcd 0000:06:00.3: xHCI host not responding to stop
> endpoint command.
> [37925.514875] xhci_hcd 0000:06:00.3: USBSTS: HCHalted HSE EINT HCE
> [37925.514883] xhci_hcd 0000:06:00.3: xHCI host controller not
> responding, assume dead
> [37925.515700] xhci_hcd 0000:06:00.3: HC died; cleaning up
> [37925.515760] usb 3-1: USB disconnect, device number 2
> [37925.515765] usb 3-1.1: USB disconnect, device number 5
> [37925.515896] ==================================================================
> [37925.515899] BUG: KASAN: use-after-free in
> snd_complete_urb+0x109e/0x1740 [snd_usb_audio]
> [37925.515919] Read of size 8 at addr ffff88813a264260 by task
> kworker/19:0/649395
> 
> [37925.515926] CPU: 19 PID: 649395 Comm: kworker/19:0 Tainted: G
>  W        --------- ---
> 5.11.0-0.rc6.20210203git3aaf0a27ffc2.144.fc34.x86_64 #1
> [37925.515930] Hardware name: System manufacturer System Product
> Name/ROG STRIX X570-I GAMING, BIOS 3402 01/13/2021
> [37925.515934] Workqueue: usb_hub_wq hub_event
> [37925.515940] Call Trace:
> [37925.515943]  <IRQ>
> [37925.515945]  dump_stack+0xae/0xe5
> [37925.515955]  print_address_description.constprop.0+0x18/0x160
> [37925.515960]  ? snd_complete_urb+0x109e/0x1740 [snd_usb_audio]
> [37925.515976]  kasan_report.cold+0x7f/0x10e
> [37925.515981]  ? snd_complete_urb+0x109e/0x1740 [snd_usb_audio]
> [37925.515997]  snd_complete_urb+0x109e/0x1740 [snd_usb_audio]

The urb is submitted and left behind alone.

> [37925.516013]  ? usb_hcd_unmap_urb_for_dma+0x22/0x660
> [37925.516020]  ? xhci_unmap_urb_for_dma+0x21/0x3f0
> [37925.516025]  __usb_hcd_giveback_urb+0x24b/0x400
> [37925.516029]  usb_giveback_urb_bh+0x239/0x3f0
> [37925.516034]  ? __usb_hcd_giveback_urb+0x400/0x400
> [37925.516037]  ? ktime_get+0xbd/0x180
> [37925.516042]  ? sched_clock+0x5/0x10
> [37925.516046]  tasklet_action_common.constprop.0+0x166/0x320
> [37925.516052]  __do_softirq+0x1f6/0x9e9
> [37925.516058]  asm_call_irq_on_stack+0x12/0x20
> [37925.516062]  </IRQ>
> [37925.516064]  do_softirq_own_stack+0x85/0xa0
> [37925.516068]  __irq_exit_rcu+0x201/0x2e0
> [37925.516071]  irq_exit_rcu+0xa/0x20
> [37925.516074]  sysvec_apic_timer_interrupt+0x48/0xa0

Timer picked up a random urb and scheduled softint for it.

> [37925.516079]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> [37925.516083] RIP: 0010:__list_del_entry_valid+0xad/0xf0
> [37925.516088] Code: 02 00 75 51 49 8b 14 24 48 39 ea 0f 85 55 d1 2a
> 01 48 b8 00 00 00 00 00 fc ff df 49 8d 7d 08 48 89 fa 48 c1 ea 03 80
> 3c 02 00 <75> 22 49 8b 55 08 48 39 ea 0f 85 66 d1 2a 01 5d b8 01 00 00
> 00 41
> [37925.516092] RSP: 0018:ffffc9001b9f77f8 EFLAGS: 00000246
> [37925.516096] RAX: dffffc0000000000 RBX: 0000000000000001 RCX: ffffffffb0464036
> [37925.516099] RDX: 1ffff1102569fa0f RSI: 0000000000000004 RDI: ffff88812b4fd078
> [37925.516101] RBP: ffff88812ac8b070 R08: 0000000000000001 R09: ffff88812ac8b083
> [37925.516104] R10: ffffed1025591610 R11: 0000000000000001 R12: ffff888129d63048
> [37925.516106] R13: ffff88812b4fd070 R14: ffff88812ac8b078 R15: dffffc0000000000
> [37925.516114]  ? klist_put+0x76/0x170
> [37925.516119]  klist_release+0x4e/0x450
> [37925.516123]  ? __device_link_free_srcu+0xe0/0xe0
> [37925.516128]  klist_put+0xa9/0x170
> [37925.516132]  device_del+0x22c/0xb50
> [37925.516137]  ? __device_link_del+0x350/0x350
> [37925.516141]  ? lock_acquire+0x5ab/0x790
> [37925.516144]  ? mutex_lock_io_nested+0x1010/0x1010
> [37925.516147]  ? lock_release+0x579/0xd20
> [37925.516151]  device_unregister+0x16/0xa0
> [37925.516155]  usb_remove_ep_devs+0x37/0x70
> [37925.516158]  usb_disable_device+0x25c/0x5f0
> [37925.516163]  usb_disconnect.cold+0x20c/0x683

The disconnect failed to wait for every urb submitted to go home.

> [37925.516172]  usb_disconnect.cold+0x107/0x683
> [37925.516176]  ? trace_hardirqs_on+0x1c/0x160
> [37925.516181]  hub_quiesce+0x148/0x2d0
> [37925.516186]  hub_event+0xcb1/0x3880
> [37925.516189]  ? lock_acquire+0x5ab/0x790
> [37925.516192]  ? lock_acquire+0x5ab/0x790
> [37925.516196]  ? lock_acquire+0x5ab/0x790
> [37925.516199]  ? lock_release+0x579/0xd20
> [37925.516204]  ? lock_downgrade+0x6b0/0x6b0
> [37925.516207]  ? lock_contended+0xbe0/0xbe0
> [37925.516209]  ? do_raw_spin_lock+0x250/0x250
> [37925.516214]  ? hub_port_debounce+0x2e0/0x2e0
> [37925.516217]  ? lock_acquire+0x5ab/0x790
> [37925.516220]  ? lock_release+0xd20/0xd20
> [37925.516223]  ? lock_downgrade+0x6b0/0x6b0
> [37925.516226]  ? do_raw_spin_trylock+0xa5/0x160
> [37925.516230]  ? lock_contended+0xbe0/0xbe0
> [37925.516237]  process_one_work+0x89f/0x1450
> [37925.516243]  ? pwq_dec_nr_in_flight+0x260/0x260
> [37925.516247]  ? lock_acquired+0x5d4/0xaf0
> [37925.516251]  worker_thread+0x590/0xf80
> [37925.516258]  ? process_one_work+0x1450/0x1450
> [37925.516262]  kthread+0x368/0x440
> [37925.516265]  ? _raw_spin_unlock_irq+0x24/0x40
> [37925.516268]  ? __kthread_bind_mask+0x90/0x90
> [37925.516272]  ret_from_fork+0x22/0x30
> 
> [37925.516282] Allocated by task 662343:
> [37925.516285]  kasan_save_stack+0x1b/0x40
> [37925.516292]  ____kasan_kmalloc.constprop.0+0x84/0xa0
> [37925.516295]  snd_usb_add_endpoint+0xf9/0x4f0 [snd_usb_audio]
> [37925.516311]  __snd_usb_parse_audio_interface+0xab3/0x35e0 [snd_usb_audio]
> [37925.516328]  snd_usb_parse_audio_interface+0x5f/0xb0 [snd_usb_audio]
> [37925.516343]  snd_usb_create_stream.isra.0+0x1be/0x430 [snd_usb_audio]
> [37925.516358]  usb_audio_probe+0x731/0x21d0 [snd_usb_audio]
> [37925.516376]  usb_probe_interface+0x26e/0x750
> [37925.516379]  really_probe+0x224/0xcc0
> [37925.516382]  driver_probe_device+0x1f2/0x380
> [37925.516384]  bus_for_each_drv+0x119/0x180
> [37925.516388]  __device_attach+0x26d/0x3d0
> [37925.516390]  bus_probe_device+0x1a5/0x260
> [37925.516393]  device_add+0x8c6/0x19e0
> [37925.516398]  usb_set_configuration+0x9df/0x1550
> [37925.516401]  usb_generic_driver_probe+0x79/0xa0
> [37925.516404]  usb_probe_device+0xa3/0x250
> [37925.516407]  really_probe+0x224/0xcc0
> [37925.516409]  driver_probe_device+0x1f2/0x380
> [37925.516412]  bus_for_each_drv+0x119/0x180
> [37925.516415]  __device_attach+0x26d/0x3d0
> [37925.516422]  bus_probe_device+0x1a5/0x260
> [37925.516424]  device_add+0x8c6/0x19e0
> [37925.516427]  usb_new_device.cold+0x536/0xc06
> [37925.516430]  hub_event+0x219b/0x3880
> [37925.516433]  process_one_work+0x89f/0x1450
> [37925.516436]  worker_thread+0x590/0xf80
> [37925.516440]  kthread+0x368/0x440
> [37925.516443]  ret_from_fork+0x22/0x30
> 
> [37925.516450] Last potentially related work creation:
> [37925.516452]  kasan_save_stack+0x1b/0x40
> [37925.516455]  kasan_record_aux_stack+0xbc/0xe0
> [37925.516459]  call_rcu+0x162/0x1100
> [37925.516462]  amdgpu_bo_list_put+0x16c/0x1b0 [amdgpu]
> [37925.516650]  amdgpu_cs_ioctl+0x2117/0x4d10 [amdgpu]
> [37925.516839]  drm_ioctl_kernel+0x1af/0x240 [drm]
> [37925.516870]  drm_ioctl+0x43b/0x8e0 [drm]
> [37925.516898]  amdgpu_drm_ioctl+0xce/0x1b0 [amdgpu]
> [37925.517074]  __x64_sys_ioctl+0x127/0x190
> [37925.517078]  do_syscall_64+0x33/0x40
> [37925.517083]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> [37925.517089] Second to last potentially related work creation:
> [37925.517091]  kasan_save_stack+0x1b/0x40
> [37925.517093]  kasan_record_aux_stack+0xbc/0xe0
> [37925.517096]  call_rcu+0x162/0x1100
> [37925.517101]  amdgpu_bo_list_put+0x16c/0x1b0 [amdgpu]
> [37925.517282]  amdgpu_cs_ioctl+0x2117/0x4d10 [amdgpu]
> [37925.517461]  drm_ioctl_kernel+0x1af/0x240 [drm]
> [37925.517489]  drm_ioctl+0x43b/0x8e0 [drm]
> [37925.517518]  amdgpu_drm_ioctl+0xce/0x1b0 [amdgpu]
> [37925.517694]  __x64_sys_ioctl+0x127/0x190
> [37925.517700]  do_syscall_64+0x33/0x40
> [37925.517704]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> [37925.517709] The buggy address belongs to the object at ffff88813a264000
>                 which belongs to the cache kmalloc-8k of size 8192
> [37925.517712] The buggy address is located 608 bytes inside of
>                 8192-byte region [ffff88813a264000, ffff88813a266000)
> [37925.517716] The buggy address belongs to the page:
> [37925.517718] page:00000000a07d7675 refcount:1 mapcount:0
> mapping:0000000000000000 index:0xffff88813a264000 pfn:0x13a260
> [37925.517726] head:00000000a07d7675 order:3 compound_mapcount:0
> compound_pincount:0
> [37925.517729] flags: 0x17ffffc0010200(slab|head)
> [37925.517735] raw: 0017ffffc0010200 0000000000000000 0000000100000001
> ffff888100042280
> [37925.517738] raw: ffff88813a264000 0000000080020001 00000001ffffffff
> ffff8882fa23cca1
> [37925.517740] page dumped because: kasan: bad access detected
> [37925.517742] pages's memcg:ffff8882fa23cca1
> 
> [37925.517746] Memory state around the buggy address:
> [37925.517751]  ffff88813a264100: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [37925.517754]  ffff88813a264180: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [37925.517756] >ffff88813a264200: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [37925.517758]                                                        ^
> [37925.517761]  ffff88813a264280: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [37925.517763]  ffff88813a264300: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [37925.517765] ==================================================================
> [37925.521109] usb 3-1.2: USB disconnect, device number 9
> [37925.521116] usb 3-1.2.4: USB disconnect, device number 21
> [37925.522472] usb 4-1: USB disconnect, device number 2
> [37925.522477] usb 4-1.1: USB disconnect, device number 3
> [37925.525597] usb 4-1.2: USB disconnect, device number 4
> 
> 
> $ eu-addr2line -e
> /lib/debug/lib/modules/5.11.0-0.rc6.20210203git3aaf0a27ffc2.144.fc34.x86_64/kernel/sound/usb/snd-usb-audio.ko.debug
> snd_complete_urb+0x109e
> sound/usb/endpoint.c:444:27
> 
> $ cat -s -n /usr/src/debug/kernel-20210204git61556703b610/linux-5.11.0-0.rc6.20210204git61556703b610.144.fc34.x86_64/sound/usb/endpoint.c
> | head -454 | tail -20
>    435 }
>    436 }
>    437
>    438 /*
>    439 * complete callback for urbs
>    440 */
>    441 static void snd_complete_urb(struct urb *urb)
>    442 {
>    443 struct snd_urb_ctx *ctx = urb->context;
>    444 struct snd_usb_endpoint *ep = ctx->ep;
>    445 unsigned long flags;
>    446 int err;
>    447
>    448 if (unlikely(urb->status == -ENOENT || /* unlinked */
>    449      urb->status == -ENODEV || /* device removed */
>    450      urb->status == -ECONNRESET || /* unlinked */
>    451      urb->status == -ESHUTDOWN)) /* device disabled */
>    452 goto exit_clear;
>    453 /* device disconnected */
>    454 if (unlikely(atomic_read(&ep->chip->shutdown)))
> 
> 
> $ git blame sound/usb/endpoint.c -L435,454
> Blaming lines:   1% (20/1631), done.
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 435)      }
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 436) }
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 437)
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 438) /*
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 439)  * complete
> callback for urbs
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 440)  */
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 441) static void
> snd_complete_urb(struct urb *urb)
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 442) {
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 443)      struct
> snd_urb_ctx *ctx = urb->context;
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 444)      struct
> snd_usb_endpoint *ep = ctx->ep;
> 67e225009bb15 (Takashi Iwai 2014-11-06 13:04:49 +0100 445)
> unsigned long flags;
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 446)      int err;
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 447)
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 448)      if
> (unlikely(urb->status == -ENOENT ||          /* unlinked */
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 449)
>       urb->status == -ENODEV ||          /* device removed */
> 8fdff6a319e7d (Daniel Mack  2012-04-12 13:51:11 +0200 450)
>       urb->status == -ECONNRESET ||      /* unlinked */
> 47ab154593827 (Takashi Iwai 2015-08-25 16:09:00 +0200 451)
>       urb->status == -ESHUTDOWN))        /* device disabled */
> 47ab154593827 (Takashi Iwai 2015-08-25 16:09:00 +0200 452)
>  goto exit_clear;
> 47ab154593827 (Takashi Iwai 2015-08-25 16:09:00 +0200 453)      /*
> device disconnected */
> 47ab154593827 (Takashi Iwai 2015-08-25 16:09:00 +0200 454)      if
> (unlikely(atomic_read(&ep->chip->shutdown)))
> 
> 
> Full kernel log here: https://pastebin.com/dRrF8Q8B
> 
> -- 
> Best Regards,
> Mike Gavrilov.

Due to the reconnecting key word mentioned, no fix to
d0f09d1e4a88 ("ALSA: usb-audio: Refactoring endpoint URB deactivation")
will be added.

What is added is to capture EP_FLAG_STOPPING and remove the one
second wait limit if the reconnecting acts may make it easier to
repro the uaf. The diff is only for idea show.

--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -832,24 +832,14 @@ void snd_usb_endpoint_suspend(struct snd
  */
 static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 {
-	unsigned long end_time = jiffies + msecs_to_jiffies(1000);
-	int alive;
-
-	if (!test_bit(EP_FLAG_STOPPING, &ep->flags))
-		return 0;
-
+	WARN_ON_ONCE(!test_bit(EP_FLAG_STOPPING, &ep->flags));
 	do {
-		alive = bitmap_weight(&ep->active_mask, ep->nurbs);
-		if (!alive)
+		if (!bitmap_weight(&ep->active_mask, ep->nurbs))
 			break;
 
 		schedule_timeout_uninterruptible(1);
-	} while (time_before(jiffies, end_time));
+	} while (1);
 
-	if (alive)
-		usb_audio_err(ep->chip,
-			"timeout: still %d active urbs on EP #%x\n",
-			alive, ep->ep_num);
 	clear_bit(EP_FLAG_STOPPING, &ep->flags);
 
 	ep->sync_sink = NULL;
