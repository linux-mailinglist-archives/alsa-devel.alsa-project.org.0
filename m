Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB27708DD
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 21:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6087F4;
	Fri,  4 Aug 2023 21:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6087F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691176761;
	bh=Er6GNk864oOsMJlNLlxok1254zZpFDyfAlM6HRW8OEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pM9SmQBfBAkNzVIpjsQvDq/mR1ftgMqd3EzXD5hxigtx1bqu9YytDQ+k0qlwQdAJs
	 CR/Aeoy/TNE+Nk3PX3RVpYpBe5szPzI4BawWjDSQWqQoOJlK0/bVH9H7Q1J8TDWny0
	 ECQx0s7ShCYO9SgQXcfbLRTgobn8BmNRyBK5qc4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87F9FF8015B; Fri,  4 Aug 2023 21:18:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE81F801D5;
	Fri,  4 Aug 2023 21:18:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59518F8025A; Fri,  4 Aug 2023 21:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C7E0F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 21:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C7E0F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=nEd9+9tA
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1ba5cda3530so1758731fac.3
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 12:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691176687; x=1691781487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04K5h25eVj+gyGjjUBrx4fx3WUFSjO7quLaX5FQN6qs=;
        b=nEd9+9tAielmSoYz1voiy91VJENw/YN2zrJ7UtAqHdxq4JYFvzkH9VSUDJscqlxnQT
         1R08RduGTYdK93aDTBbWiKQVB9CpNmej1k34mHdvzkGWs0eLvDnYmoUOyzrWf30rF83r
         uln4ifgA2XZnscWc/ET/Gx0SLWevOmhl8GvNYobCux+pa6toXj+OBnyUGojouJfySRjk
         sI/yqLbXEhqC+NkpsX2TMqxNjUwBbrj3zCeesYMBU3iYhHK5RustFHnhREb3DbgdHqfU
         tI1yR+QGJY+HDK/nAeRCsAqkce9Q+0yCASg0VPj6T8cV1Lo5ENOuX30dPPwm6MBxJ69j
         e7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691176687; x=1691781487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04K5h25eVj+gyGjjUBrx4fx3WUFSjO7quLaX5FQN6qs=;
        b=FxnKpY7tQ7hZ9PW4vHuLvoK0ttD664iEkzB0XT4x4nBbeitaizmiA0cyu1iZsVJIdB
         g5K2xxLQ+6pkdDzGHY3mr2hnWAWatck77UwuSdWUvXQ2qjp9cJwq6ntDH0+//HaWiweQ
         uu2dSyF9azw2XR5VdLTv9MyDIQ0Fd9zqN7TKwoJWJK79cQmfNLnfbjAONRTG+TKdwUUN
         8JwmGR+lsbWumoS7dUEU3rV4ZekOq4CnWPnptMggxenzWtd8c7joEJR4ebfZYZdep/km
         IUIbWtL22AakzMt5Atpws+/2DBMzAh6hSjkwBnubEAdp/hl8nmulbwadfjBsVW0wqTu7
         4Hpw==
X-Gm-Message-State: AOJu0Yy7/alZBLlGWIV2UwGvNHiq2xQdUfEpKPZDk7m2E4GuLU4TMJwy
	O6H2GoDU/+tTyzWCM2pC7TwZP4jbaewHNKKvityNKA==
X-Google-Smtp-Source: 
 AGHT+IHvbv8b7QZ7qn1z1Q8CjT+lZVs+rVZVOnZPzUIu8mGR9MIGazCXiJ0K1Zl3JcPZ/PmZsrK4W4ctfrNoKiqmOtI=
X-Received: by 2002:a05:6870:73d1:b0:1ba:ddf2:417f with SMTP id
 a17-20020a05687073d100b001baddf2417fmr4012480oan.2.1691176687205; Fri, 04 Aug
 2023 12:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
 <87cz06djxo.wl-tiwai@suse.de>
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
 <87sf90b7hw.wl-tiwai@suse.de> <87cz04b0ku.wl-tiwai@suse.de>
 <CAOReqxhVXEL0ifkhEhBG1NYHOAVPS5y2oEuHfEO8gDvZjF30fQ@mail.gmail.com>
 <87zg379oap.wl-tiwai@suse.de>
In-Reply-To: <87zg379oap.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 4 Aug 2023 12:17:56 -0700
Message-ID: 
 <CAOReqxjjwJec+Ho7vHg6tOjXHc8VEpVL317f6KE6gnmfDofa-g@mail.gmail.com>
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
Message-ID-Hash: WMIN6BIC3DM7VH4KKD2GCEAGEAWYQ45U
X-Message-ID-Hash: WMIN6BIC3DM7VH4KKD2GCEAGEAWYQ45U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMIN6BIC3DM7VH4KKD2GCEAGEAWYQ45U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 4, 2023 at 1:58=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Now I've been reconsidering the problem, and thought of another
> possible workaround.  We may add the card's refcount control for the
> device init and release, so that we delay the actual resource free.
> The basic idea is to take card->card_ref at the device init and unref
> it at the actual device release callback.  Then the snd_card_free()
> call is held until all those refcounted devices are released.
>
> Below is a PoC patch (yes, this can be split, too ;)
> A quick test on VM seems OK, but needs more reviews and tests.
>
> It contains somewhat ugly conditional put_device() at the dev_free
> ops.  We can make those a bit saner with some helpers later, too.
>
> BTW, this approach may avoid another potential problem by the delayed
> release; if we finish the driver remove without waiting for the actual
> device releases, it may hit a code (the piece of the device release
> callback) of the already removed module, and it's not guaranteed to be
> present.
> I'm not sure whether this really happens, but it's another thing to be
> considered.
>
>
> thanks,
>
> Takashi
>
> ---
> diff --git a/include/sound/core.h b/include/sound/core.h
> index f6e0dd648b80..00c514a80a4a 100644
> --- a/include/sound/core.h
> +++ b/include/sound/core.h

Unfortunately it doesn't hold up in my testing, hit the devm vs device
race bug after a little over 30min of hammering snd-dummy (on top of
your for-next branch)

[ 2214.013410] kobject: 'BAT0' (000000006eb2300b): kobject_uevent_env
[ 2214.013433] kobject: 'BAT0' (000000006eb2300b): fill_kobj_path:
path =3D '/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/PNP0C09:00/=
PNP0C0A:00/power_supply/BAT0'
[ 2214.142604] kobject: 'card1' (00000000f5621ef1): kobject_cleanup,
parent 0000000000000000
[ 2214.142627] kobject: 'card1' (00000000f5621ef1): calling ktype release
[ 2214.145618] kobject: 'snd_dummy.0' (00000000965e7bc3): kobject_uevent_en=
v
[ 2214.145648] kobject: 'snd_dummy.0' (00000000965e7bc3):
fill_kobj_path: path =3D '/devices/platform/snd_dummy.0'
[ 2214.145773] kobject: 'snd_dummy.0' (00000000965e7bc3): kobject_uevent_en=
v
[ 2214.145793] kobject: 'snd_dummy.0' (00000000965e7bc3):
fill_kobj_path: path =3D '/devices/platform/snd_dummy.0'
[ 2214.145867] kobject: 'snd_dummy.0' (00000000965e7bc3):
kobject_release, parent 0000000000000000 (delayed 4000)
[ 2214.145941] kobject: 'snd_dummy' (000000003e14c027):
kobject_release, parent 0000000092654d15 (delayed 2000)
[ 2214.146355] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 2214.146363] kobject: 'drivers' (000000007b7f6032): kobject_release,
parent 000000009dc04f8f (delayed 2000)
[ 2214.146364] BUG: KASAN: slab-use-after-free in release_card_device+0x86/=
0xd0
[ 2214.146384] kobject: 'holders' (000000000b4379d6): kobject_release,
parent 000000009dc04f8f (delayed 2000)
[ 2214.146384] Read of size 1 at addr ffff888184a0c949 by task kworker/9:2/=
1012

[ 2214.146403] CPU: 9 PID: 1012 Comm: kworker/9:2 Tainted: G     U  W
        6.5.0-rc3-00286-gb6697501cf3e-dirty #19
27c5c3da575c6eb45fc95c08db2c659f33df80d3
[ 2214.146417] Hardware name: Google Anahera/Anahera, BIOS
Google_Anahera.14505.315.0 12/02/2022
[ 2214.146425] Workqueue: events kobject_delayed_cleanup
[ 2214.146439] Call Trace:
[ 2214.146446]  <TASK>
[ 2214.146447] kobject: 'notes' (00000000f7709af3): kobject_release,
parent 000000009dc04f8f (delayed 1000)
[ 2214.146452]  dump_stack_lvl+0x91/0xd0
[ 2214.146466]  print_report+0x15b/0x4d0
[ 2214.146478]  ? __virt_addr_valid+0xbb/0x130
[ 2214.146491]  ? kasan_addr_to_slab+0x11/0x80
[ 2214.146504]  ? release_card_device+0x86/0xd0
[ 2214.146516]  kasan_report+0xb1/0xf0
[ 2214.146526]  ? release_card_device+0x86/0xd0
[ 2214.146539]  ? _raw_spin_unlock_irqrestore+0x1b/0x40
[ 2214.146552]  release_card_device+0x86/0xd0
[ 2214.146565]  device_release+0x66/0x110
[ 2214.146576]  kobject_delayed_cleanup+0x133/0x140
[ 2214.146587]  process_one_work+0x3e3/0x680
[ 2214.146600]  worker_thread+0x487/0x6d0
[ 2214.146613]  ? __pfx_worker_thread+0x10/0x10
[ 2214.146624]  kthread+0x199/0x1c0
[ 2214.146634]  ? __pfx_worker_thread+0x10/0x10
[ 2214.146644]  ? __pfx_kthread+0x10/0x10
[ 2214.146655]  ret_from_fork+0x3c/0x60
[ 2214.146667]  ? __pfx_kthread+0x10/0x10
[ 2214.146677]  ret_from_fork_asm+0x1b/0x30
[ 2214.146689] RIP: 0000:0x0
[ 2214.146703] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[ 2214.146710] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX:
0000000000000000
[ 2214.146723] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[ 2214.146731] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
[ 2214.146739] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00000
[ 2214.146747] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[ 2214.146760] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[ 2214.146769]  </TASK>

[ 2214.146779] Allocated by task 12068:
[ 2214.146785]  kasan_set_track+0x4f/0x80
[ 2214.146797]  __kasan_kmalloc+0x92/0xb0
[ 2214.146804]  __kmalloc_node_track_caller+0x72/0x140
[ 2214.146815]  __devres_alloc_node+0x50/0xc0
[ 2214.146825]  snd_devm_card_new+0x5a/0xe0
[ 2214.146835]  snd_dummy_probe+0x91/0x660 [snd_dummy]
[ 2214.146852]  platform_probe+0xb5/0xf0
[ 2214.146861]  really_probe+0x177/0x3c0
[ 2214.146871]  __driver_probe_device+0xec/0x1b0
[ 2214.146881]  driver_probe_device+0x4f/0xd0
[ 2214.146890]  __device_attach_driver+0xd0/0xf0
[ 2214.146900]  bus_for_each_drv+0xc6/0x120
[ 2214.146909]  __device_attach+0x15c/0x210
[ 2214.146918]  bus_probe_device+0x5b/0xe0
[ 2214.146926]  device_add+0x462/0x6d0
[ 2214.146936]  platform_device_add+0x27a/0x360
[ 2214.146945]  platform_device_register_full+0x1e7/0x1f0
[ 2214.146954]  0xffffffffc0ec0118
[ 2214.146961]  do_one_initcall+0x153/0x370
[ 2214.146970]  do_init_module+0x126/0x350
[ 2214.146979]  __se_sys_finit_module+0x2d7/0x460
[ 2214.146988]  do_syscall_64+0x4c/0xa0
[ 2214.147000]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

[ 2214.147028] Freed by task 12072:
[ 2214.147038]  kasan_set_track+0x4f/0x80
[ 2214.147054]  kasan_save_free_info+0x2c/0x50
[ 2214.147069]  ____kasan_slab_free+0x12c/0x180
[ 2214.147086]  __kmem_cache_free+0x104/0x2a0
[ 2214.147103]  release_nodes+0x69/0x80
[ 2214.147119]  devres_release_all+0xbe/0x100
[ 2214.147135]  device_unbind_cleanup+0x14/0xd0
[ 2214.147152]  device_release_driver_internal+0x12c/0x180
[ 2214.147169]  bus_remove_device+0x158/0x190
[ 2214.147183]  device_del+0x2dd/0x490
[ 2214.147198]  platform_device_del+0x38/0xf0
[ 2214.147214]  platform_device_unregister+0x16/0x40
[ 2214.147229]  snd_dummy_unregister_all+0x26/0x50 [snd_dummy]
[ 2214.147256]  __se_sys_delete_module+0x25a/0x380
[ 2214.147273]  do_syscall_64+0x4c/0xa0
[ 2214.147288]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

[ 2214.147311] Last potentially related work creation:
[ 2214.147320]  kasan_save_stack+0x3e/0x60
[ 2214.147335]  __kasan_record_aux_stack+0xaf/0xc0
[ 2214.147350]  insert_work+0x36/0x160
[ 2214.147365]  __queue_work+0x54d/0x5c0
[ 2214.147380]  call_timer_fn+0x9f/0x190
[ 2214.147394]  __run_timers+0x427/0x4c0
[ 2214.147408]  run_timer_softirq+0x21/0x40
[ 2214.147421]  __do_softirq+0x164/0x344

[ 2214.147443] Second to last potentially related work creation:
[ 2214.147451]  kasan_save_stack+0x3e/0x60
[ 2214.147466]  __kasan_record_aux_stack+0xaf/0xc0
[ 2214.147480]  insert_work+0x36/0x160
[ 2214.147495]  __queue_work+0x54d/0x5c0
[ 2214.147509]  call_timer_fn+0x9f/0x190
[ 2214.147522]  __run_timers+0x427/0x4c0
[ 2214.147535]  run_timer_softirq+0x21/0x40

<snipped due to grep context being set at 100 lines>

I was talking with Stephen Boyd about this bug and his recommendation
was to keep snd_card always out of devm and just allocate a pointer in
devm to snd_card to puppet it as if it was managed via devm and just
reference count rather than release the card so that its always
handled through device->release. What do you think? This would go
alongside the current patch proposed.
