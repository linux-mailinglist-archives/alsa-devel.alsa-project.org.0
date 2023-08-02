Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A979676D4B2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 19:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47977F4;
	Wed,  2 Aug 2023 19:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47977F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690996076;
	bh=WZwrwXg9/y/HMr+HnLJrQ7O2+DNO3pu7zPeFQHmteFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l7AJTxIecD9La2u/S3U6EBxcZIfLWs7zLeUENdtpeqtXdCD6rh1Xk3AZHDbNnTIsk
	 WUf2adQVG0zZH4w6qb9Amtwk5PoT9GU8bMra9XxcQtBvPT5vtlVyTOa83DRV3qmZg0
	 djiork+dxrYWJFbURMyfaXWbtPrs+u3ZmWPyQKi0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F803F80149; Wed,  2 Aug 2023 19:06:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76263F801D5;
	Wed,  2 Aug 2023 19:06:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE2F9F8025A; Wed,  2 Aug 2023 19:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12F38F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F38F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=SjpUhQ2H
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3490ebe5286so53575ab.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690995977; x=1691600777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFar5A4zwcSoSzdK3GU8U842Yu9eNdOsnL86sj/xgrY=;
        b=SjpUhQ2HixjGiq5fceISm4toPkN8CSIB5j+sd02c7+sT5YgZmcZS0q1MQ30z0k1NCj
         Q27qodHtfS3K/nuTuFo2GhvADg//RxCEY2wmobsZAum1rD2g4G1sCct8zzo0SPmioFp+
         BuVbasSmWAAEmkH7JsAp74n1KsA8omrLsSmbIZbtNaT2ZytuRUAN1lLTCBkwKJSD5O30
         0FBf/lBL0zyRcQKZlocAxn9pMSg6LFAw4xLBBosYSUWbzbRpKWSp1MjZgPU0rk/me+wI
         jz7bJsiu+F0rmNHWQsSkUdxhPJho2xTuEftq2UQDhEPFZiY3n1wLAMRxd3s47ud+jegB
         qzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995977; x=1691600777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFar5A4zwcSoSzdK3GU8U842Yu9eNdOsnL86sj/xgrY=;
        b=Gr1ssfqUU6ubgjdyeaySQ/dVEY7S+ALzomH4biwPyhfdK0iWTYCSVCNI5yrugILVfb
         GnFDbOc6cp+PdYRqyiDwZG3nqCKfALxyRA1rqVdAjOwQqxMPy3P7M+FQG8ltVkYPowiY
         QT/kc5m/sPiGkGs20cqEgTSo5gfQPoOC51cHY6UPWzSXFly7pmqfqPS/8JYx6h4XqK/0
         uBJeQVLgq4LJ2lPcQyYDjQoVhTC6N4a5W0hgKDJiK+syM/wMHR/+NkQto4c7KotxAgwL
         /0xYEMbLnsT/zjVT165a7zE+O7vt/iIPWQb2j9HRsmEflggF/r4Y3ng64A66PwXWaE9H
         Y9ZA==
X-Gm-Message-State: ABy/qLaudk59iwfc0fflPCeSQ5gT6Jk/TBEi8UWhUgyagno6m6OR2kJs
	p5dPbmThuc72mrZQT2tOvm5rXrxn5tMFDR4dLHGBEw==
X-Google-Smtp-Source: 
 APBJJlEVs/VrUFqfckkXsLsL7bFUG9U6gsYv1px9Aj4kC/L93Tn1HtIgqFyQuB59q68ptV6OCwGP9kDmUlCkgJLIJdA=
X-Received: by 2002:a05:6e02:1201:b0:348:7396:184b with SMTP id
 a1-20020a056e02120100b003487396184bmr13539999ilq.24.1690995976733; Wed, 02
 Aug 2023 10:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
 <87cz06djxo.wl-tiwai@suse.de>
In-Reply-To: <87cz06djxo.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 2 Aug 2023 10:06:05 -0700
Message-ID: 
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
To: Takashi Iwai <tiwai@suse.de>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Doug Anderson <dianders@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>, Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: G7FQSYW5OVPTMZEK46DGMFTTPZNUZ4SY
X-Message-ID-Hash: G7FQSYW5OVPTMZEK46DGMFTTPZNUZ4SY
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7FQSYW5OVPTMZEK46DGMFTTPZNUZ4SY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 1, 2023 at 11:42=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 01 Aug 2023 19:18:41 +0200,
> cujomalainey@chromium.org wrote:
> >
> > From: Curtis Malainey <cujomalainey@chromium.org>
> >
> > The current implementation of how devices are released is valid for
> > production use cases (root control of memory is handled by card_dev, al=
l
> > other devices are no-ops).
> >
> > This model does not work though in a kernel hacking environment where
> > KASAN and delayed release on kobj is enabled. If the card_dev device is
> > released before any of the child objects a use-after-free bug is caught
> > by KASAN as the delayed release still has a reference to the devices
> > that were freed by the card_dev release. Also both snd_card and snd_pcm
> > both own two devices internally, so even if they released independently=
,
> > the shared struct would result in another use after free.
> >
> > Solution is to move the child devices into their own memory so they can
> > be handled independently and released on their own schedule.
> >
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > Cc: Doug Anderson <dianders@chromium.org>
>
> Thanks, it's an interesting bug.
>
> I'm not much against the proposed solution, but still this has to be
> carefully evaluated.  So, could you give more details about the bug
> itself?  It's related with CONFIG_DEBUG_KOBJECT_RELEASE, right?
> In which condition it's triggered and how the UAF looks like?


Hi Takashi

Here is one of the stack traces we are seeing (for snd_pcm)

[ 1098.876460] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 1098.884763] BUG: KASAN: use-after-free in enqueue_timer+0xa0/0x628
[ 1098.884849] Write of size 8 at addr ffffff80cbdc6800 by task kworker/7:4=
/255
[ 1098.884888]
[ 1098.884909] CPU: 7 PID: 255 Comm: kworker/7:4 Not tainted
5.15.117-lockdep-19614-g05bc12fd18a9 #1
5a757fac993273e9fde5e8de9925ee0cebe8540f
[ 1098.884961] Hardware name: Google Pompom (rev3+) with LTE (DT)
[ 1098.884990] Workqueue: events kobject_delayed_cleanup
[ 1098.885038] Call trace:
[ 1098.885059]  dump_backtrace+0x0/0x4e8
[ 1098.885095]  show_stack+0x34/0x44
[ 1098.885129]  dump_stack_lvl+0xdc/0x11c
[ 1098.885165]  print_address_description+0x30/0x2d8
[ 1098.885203]  kasan_report+0x178/0x1e4
[ 1098.885237]  __asan_report_store8_noabort+0x44/0x50
[ 1098.885276]  enqueue_timer+0xa0/0x628
[ 1098.885309]  internal_add_timer+0xa0/0x254
[ 1098.885346]  __mod_timer+0x588/0xc4c
[ 1098.885378]  add_timer+0x74/0x94
[ 1098.885411]  __queue_delayed_work+0x170/0x208
[ 1098.885447]  queue_delayed_work_on+0x128/0x160
[ 1098.885483]  kobject_put+0x278/0x2cc
[ 1098.885517]  put_device+0x30/0x48
[ 1098.885553]  snd_ctl_dev_free+0xc8/0xe4
[ 1098.885590]  __snd_device_free+0x124/0x1b8
[ 1098.885626]  snd_device_free_all+0x148/0x184
[ 1098.885663]  release_card_device+0x5c/0x180
[ 1098.885698]  device_release+0xd4/0x1b4
[ 1098.885732]  kobject_delayed_cleanup+0x130/0x304
[ 1098.885765]  process_one_work+0x620/0x137c
[ 1098.885802]  worker_thread+0x43c/0xa08
[ 1098.885837]  kthread+0x2e4/0x3a0
[ 1098.885872]  ret_from_fork+0x10/0x20
[ 1098.885907]
[ 1098.885926] Allocated by task 11891:
[ 1098.885953]  kasan_save_stack+0x38/0x68
[ 1098.885992]  __kasan_kmalloc+0x90/0xac
[ 1098.886026]  kmem_cache_alloc_trace+0x258/0x40c
[ 1098.886063]  _snd_pcm_new+0xc4/0x2c8
[ 1098.886098]  snd_pcm_new+0x5c/0x74
[ 1098.886132]  loopback_pcm_new+0xa0/0x20c [snd_aloop]
[ 1098.886194]  loopback_probe+0x210/0x850 [snd_aloop]
[ 1098.886235]  platform_probe+0x150/0x1c8
[ 1098.886273]  really_probe+0x274/0xa20
[ 1098.886308]  __driver_probe_device+0x1b4/0x3b4
[ 1098.886344]  driver_probe_device+0x78/0x1c0
[ 1098.886379]  __device_attach_driver+0x1ac/0x2c8
[ 1098.886414]  bus_for_each_drv+0x11c/0x190
[ 1098.886448]  __device_attach+0x278/0x3c8
[ 1098.886482]  device_initial_probe+0x2c/0x3c
[ 1098.886517]  bus_probe_device+0xbc/0x1c8
[ 1098.886550]  device_add+0x1174/0x1630
[ 1098.886581]  platform_device_add+0x3f8/0x6f8
[ 1098.886617]  platform_device_register_full+0x36c/0x3f8
[ 1098.886656]  0xffffffc0032e3174
[ 1098.886691]  do_one_initcall+0x1e8/0x91c
[ 1098.886727]  do_init_module+0x16c/0x444
[ 1098.886762]  load_module+0x63e0/0x7f8c
[ 1098.886795]  __arm64_sys_finit_module+0x1e4/0x214
[ 1098.886830]  invoke_syscall+0x98/0x278
[ 1098.886862]  el0_svc_common+0x214/0x274
[ 1098.886894]  do_el0_svc+0x9c/0x19c
[ 1098.886926]  el0_svc+0x5c/0xc0
[ 1098.886959]  el0t_64_sync_handler+0x78/0x108
[ 1098.886994]  el0t_64_sync+0x1a4/0x1a8
[ 1098.887027]
[ 1098.887046] Freed by task 255:
[ 1098.887071]  kasan_save_stack+0x38/0x68
[ 1098.887106]  kasan_set_track+0x28/0x3c
[ 1098.887139]  kasan_set_free_info+0x28/0x4c
[ 1098.887174]  ____kasan_slab_free+0x110/0x164
[ 1098.887209]  __kasan_slab_free+0x18/0x28
[ 1098.887242]  kfree+0x200/0x868
[ 1098.887275]  snd_pcm_free+0x88/0x98
[ 1098.887311]  snd_pcm_dev_free+0x48/0x5c
[ 1098.887347]  __snd_device_free+0x124/0x1b8
[ 1098.887384]  snd_device_free_all+0xc8/0x184
[ 1098.887419]  release_card_device+0x5c/0x180
[ 1098.887453]  device_release+0xd4/0x1b4
[ 1098.887486]  kobject_delayed_cleanup+0x130/0x304
[ 1098.887519]  process_one_work+0x620/0x137c
[ 1098.887555]  worker_thread+0x43c/0xa08
[ 1098.887590]  kthread+0x2e4/0x3a0
[ 1098.887623]  ret_from_fork+0x10/0x20

A similar one is generated for snd_card if card_dev.release runs
before ctl_dev.release. This patch is solving the same bug in both
places at once.

You should be able to easily reproduce this if you turn on the following

CONFIG_DEBUG_KOBJECT=3Dy
CONFIG_DEBUG_KOBJECT_RELEASE=3Dy
CONFIG_DEBUG_OBJECTS=3Dy
CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
CONFIG_KASAN=3Dy

Then just unload and reload snd-dummy or snd-aloop in a loop. E.g.

while true; do modprobe snd-dummy; rmmod snd-dummy; done

The issue is that kobj should be able to be released independently of
each other, but since all of them depend on card_dev for memory
release and sometimes they even share the same allocation, it breaks
this rule.

There is still another latent bug hiding in the system as well that I
am working on today related to devm memory release of snd_card running
before card_dev.release

It will reproduce with the same setup even with the above patch
applied, so just an FYI if you spot it.

[ 4972.098280] kobject: 'snd_dummy' (000000006c6d3069):
kobject_release, parent 000000009bf07dfe (delayed 2000)
[ 4972.098278] CPU: 9 PID: 16058 Comm: kworker/9:0 Tainted: G     U
         6.5.0-rc3-00236-gd54aad9920bd-dirty #18
a69e57e648f1e29627a189036c9fd8083c170225
[ 4972.098294] Hardware name: Google Anahera/Anahera, BIOS
Google_Anahera.14505.315.0 12/02/2022
[ 4972.098302] Workqueue: events kobject_delayed_cleanup
[ 4972.098317] Call Trace:
[ 4972.098324]  <TASK>
[ 4972.098330]  dump_stack_lvl+0x91/0xd0
[ 4972.098344]  print_report+0x15b/0x4d0
[ 4972.098356]  ? __virt_addr_valid+0xbb/0x130
[ 4972.098369]  ? kasan_addr_to_slab+0x11/0x80
[ 4972.098381]  ? release_card_device+0x86/0xd0
[ 4972.098392]  kasan_report+0xb1/0xf0
[ 4972.098403]  ? release_card_device+0x86/0xd0
[ 4972.098415]  ? _raw_spin_unlock_irqrestore+0x1b/0x40
[ 4972.098427]  release_card_device+0x86/0xd0
[ 4972.098438]  device_release+0x66/0x110
[ 4972.098449]  kobject_delayed_cleanup+0x133/0x140
[ 4972.098462]  process_one_work+0x3e3/0x680
[ 4972.098474]  worker_thread+0x487/0x6d0
[ 4972.098487]  ? __pfx_worker_thread+0x10/0x10
[ 4972.098497]  kthread+0x199/0x1c0
[ 4972.098508]  ? __pfx_worker_thread+0x10/0x10
[ 4972.098518]  ? __pfx_kthread+0x10/0x10
[ 4972.098528]  ret_from_fork+0x3c/0x60
[ 4972.098540]  ? __pfx_kthread+0x10/0x10
[ 4972.098552]  ret_from_fork_asm+0x1b/0x30
[ 4972.098563] RIP: 0000:0x0
[ 4972.098577] Code: Unable to access opcode bytes at
0xffffffffffffffd6.
[ 4972.098584] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX:
0000000000000000
[ 4972.098596] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[ 4972.098604] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[ 4972.098612] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
[ 4972.098620] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
[ 4972.098622] kobject: 'drivers' (00000000d71d1f56): kobject_release,
parent 000000007062c760 (delayed 4000)
[ 4972.098631] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
[ 4972.098641] kobject: 'holders' (0000000091718821): kobject_release,
parent 000000007062c760 (delayed 2000)
[ 4972.098641]  </TASK>

Curtis

>
>
>
> Takashi
