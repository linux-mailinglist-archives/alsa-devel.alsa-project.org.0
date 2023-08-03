Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6176F63B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 01:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18DAD6C0;
	Fri,  4 Aug 2023 01:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18DAD6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691106079;
	bh=dUNK42D/aDgz+p28FCgpob7Eb7/awzfqJ73xx8+JgW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iOPoayHnit3AISV+ylnkh+PLAao7Qx8YwKEqeJgbJ3p3euAWioEbwIKQO6Nk3yhDd
	 W98osGfD18Dy4Chd4e5B0axKx4NLwqmj4kOaiKun0wFxDUP2YmCoCi1scxnlqsUU6a
	 +EeoZH+J9JIyxD+muR6oj9pKZ5eevZ1Hjfq5nQKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3DBFF8015B; Fri,  4 Aug 2023 01:40:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10791F801D5;
	Fri,  4 Aug 2023 01:40:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 448F8F8025A; Fri,  4 Aug 2023 01:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A404AF8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 01:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A404AF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=3iZkMkWh
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-26837895fbbso979321a91.3
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 16:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691105982; x=1691710782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9VEIaKpfpdTBL4IiWAoYkhAALdv7hmwiqtiey7K6/s=;
        b=3iZkMkWh6cf41EBTbNmivvNQ62e2227Hav9A7P4c42dU+5tfzZxTrChU4n1wf7zigj
         r5xRr7fC85cPoDyAUOpYT/2vefzelR/OZooZDAbCsDBHU+fphBsc6CTBWvu0xOVA15u3
         A5EAmgHfqnKPDKdE/fhbHmFhxwfTT0lT87gpAYXKhShrcPEk7unAbvOiXciLI6whIWgS
         i3tbkoMHuPmXccIq3HQK6hIYgREKp7pCPhhCJupVYCd5pj2EcvdrWgbTXp+qf3Yvun5n
         nuhRMn6b/QALk0MTwpsL44dfPhS3L7/Eqj0UYQUdNCodfV/H3RSrcUYvKlC02M+AZm54
         S4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691105982; x=1691710782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9VEIaKpfpdTBL4IiWAoYkhAALdv7hmwiqtiey7K6/s=;
        b=FI3YoXoVBs1BJXW2SIQxjFKvLRh5gt78y+6nMzgwCB+nEbZGMJJZ9SMGBURddlL4xD
         Jbx+KUnmAoXI/+Ae+UEeDvzPD+109ecjnSu+Qh4mOyzfxxKatJdd613sMPff0R0/TZtf
         w8c3YF782gKbe8QntWG3tEzHisNNFu6GPMbMnDIyZpIi5HcIVSbC4OwTCNcstw93s6Rm
         3XhAcMRK0s2z9ioTmeym4bdfFWDROx/ZDtdQW8UHuSFT0ttXgebyzZWc7W9Wh1VzgXz3
         j1zmLwzA5lJnmGSdqH4cIFxyYxCsO6HMQHV4bS/XgSmMJ0VnOUP8yPM6qj0MLoOPKEPA
         vgdA==
X-Gm-Message-State: AOJu0YzUnAo0DUdcrct0HnMcHcTPCLNQWRuCyRfBCscfa4z4Y6yuf3mu
	nj1kBnZIS4HkdFgxY+Hu9uC56WfM46IetY2XWX/ukw==
X-Google-Smtp-Source: 
 AGHT+IFkLaiKp7q03FMMQPr0X75L9sW23WQ3EeS6XQg6YYy8RYKHBUEvxiRk2evVqYReHK2OeqyMShn4y29m01kgM1Q=
X-Received: by 2002:a17:90a:8045:b0:268:99f:b2c1 with SMTP id
 e5-20020a17090a804500b00268099fb2c1mr216613pjw.26.1691105981852; Thu, 03 Aug
 2023 16:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
 <87cz06djxo.wl-tiwai@suse.de>
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
 <87sf90b7hw.wl-tiwai@suse.de> <87cz04b0ku.wl-tiwai@suse.de>
In-Reply-To: <87cz04b0ku.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 3 Aug 2023 16:39:30 -0700
Message-ID: 
 <CAOReqxhVXEL0ifkhEhBG1NYHOAVPS5y2oEuHfEO8gDvZjF30fQ@mail.gmail.com>
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
Message-ID-Hash: 3KGN4IMVUIEMIRVFL7CCYUYDYC4Q7TNE
X-Message-ID-Hash: 3KGN4IMVUIEMIRVFL7CCYUYDYC4Q7TNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KGN4IMVUIEMIRVFL7CCYUYDYC4Q7TNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 3, 2023 at 8:35=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 03 Aug 2023 15:06:19 +0200,
> Takashi Iwai wrote:
> >
> > On Wed, 02 Aug 2023 19:06:05 +0200,
> > Curtis Malainey wrote:
> > >
> > > On Tue, Aug 1, 2023 at 11:42=E2=80=AFPM Takashi Iwai <tiwai@suse.de> =
wrote:
> > > >
> > > > On Tue, 01 Aug 2023 19:18:41 +0200,
> > > > cujomalainey@chromium.org wrote:
> > > > >
> > > > > From: Curtis Malainey <cujomalainey@chromium.org>
> > > > >
> > > > > The current implementation of how devices are released is valid f=
or
> > > > > production use cases (root control of memory is handled by card_d=
ev, all
> > > > > other devices are no-ops).
> > > > >
> > > > > This model does not work though in a kernel hacking environment w=
here
> > > > > KASAN and delayed release on kobj is enabled. If the card_dev dev=
ice is
> > > > > released before any of the child objects a use-after-free bug is =
caught
> > > > > by KASAN as the delayed release still has a reference to the devi=
ces
> > > > > that were freed by the card_dev release. Also both snd_card and s=
nd_pcm
> > > > > both own two devices internally, so even if they released indepen=
dently,
> > > > > the shared struct would result in another use after free.
> > > > >
> > > > > Solution is to move the child devices into their own memory so th=
ey can
> > > > > be handled independently and released on their own schedule.
> > > > >
> > > > > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > > > > Cc: Doug Anderson <dianders@chromium.org>
> > > >
> > > > Thanks, it's an interesting bug.
> > > >
> > > > I'm not much against the proposed solution, but still this has to b=
e
> > > > carefully evaluated.  So, could you give more details about the bug
> > > > itself?  It's related with CONFIG_DEBUG_KOBJECT_RELEASE, right?
> > > > In which condition it's triggered and how the UAF looks like?
> > >
> > >
> > > Hi Takashi
> > >
> > > Here is one of the stack traces we are seeing (for snd_pcm)
> > >
> > > [ 1098.876460] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [ 1098.884763] BUG: KASAN: use-after-free in enqueue_timer+0xa0/0x628
> > > [ 1098.884849] Write of size 8 at addr ffffff80cbdc6800 by task kwork=
er/7:4/255
> > > [ 1098.884888]
> > > [ 1098.884909] CPU: 7 PID: 255 Comm: kworker/7:4 Not tainted
> > > 5.15.117-lockdep-19614-g05bc12fd18a9 #1
> > > 5a757fac993273e9fde5e8de9925ee0cebe8540f
> > > [ 1098.884961] Hardware name: Google Pompom (rev3+) with LTE (DT)
> > > [ 1098.884990] Workqueue: events kobject_delayed_cleanup
> > > [ 1098.885038] Call trace:
> > > [ 1098.885059]  dump_backtrace+0x0/0x4e8
> > > [ 1098.885095]  show_stack+0x34/0x44
> > > [ 1098.885129]  dump_stack_lvl+0xdc/0x11c
> > > [ 1098.885165]  print_address_description+0x30/0x2d8
> > > [ 1098.885203]  kasan_report+0x178/0x1e4
> > > [ 1098.885237]  __asan_report_store8_noabort+0x44/0x50
> > > [ 1098.885276]  enqueue_timer+0xa0/0x628
> > > [ 1098.885309]  internal_add_timer+0xa0/0x254
> > > [ 1098.885346]  __mod_timer+0x588/0xc4c
> > > [ 1098.885378]  add_timer+0x74/0x94
> > > [ 1098.885411]  __queue_delayed_work+0x170/0x208
> > > [ 1098.885447]  queue_delayed_work_on+0x128/0x160
> > > [ 1098.885483]  kobject_put+0x278/0x2cc
> > > [ 1098.885517]  put_device+0x30/0x48
> > > [ 1098.885553]  snd_ctl_dev_free+0xc8/0xe4
> > > [ 1098.885590]  __snd_device_free+0x124/0x1b8
> > > [ 1098.885626]  snd_device_free_all+0x148/0x184
> > > [ 1098.885663]  release_card_device+0x5c/0x180
> > > [ 1098.885698]  device_release+0xd4/0x1b4
> > > [ 1098.885732]  kobject_delayed_cleanup+0x130/0x304
> > > [ 1098.885765]  process_one_work+0x620/0x137c
> > > [ 1098.885802]  worker_thread+0x43c/0xa08
> > > [ 1098.885837]  kthread+0x2e4/0x3a0
> > > [ 1098.885872]  ret_from_fork+0x10/0x20
> > > [ 1098.885907]
> > > [ 1098.885926] Allocated by task 11891:
> > > [ 1098.885953]  kasan_save_stack+0x38/0x68
> > > [ 1098.885992]  __kasan_kmalloc+0x90/0xac
> > > [ 1098.886026]  kmem_cache_alloc_trace+0x258/0x40c
> > > [ 1098.886063]  _snd_pcm_new+0xc4/0x2c8
> > > [ 1098.886098]  snd_pcm_new+0x5c/0x74
> > > [ 1098.886132]  loopback_pcm_new+0xa0/0x20c [snd_aloop]
> > > [ 1098.886194]  loopback_probe+0x210/0x850 [snd_aloop]
> > > [ 1098.886235]  platform_probe+0x150/0x1c8
> > > [ 1098.886273]  really_probe+0x274/0xa20
> > > [ 1098.886308]  __driver_probe_device+0x1b4/0x3b4
> > > [ 1098.886344]  driver_probe_device+0x78/0x1c0
> > > [ 1098.886379]  __device_attach_driver+0x1ac/0x2c8
> > > [ 1098.886414]  bus_for_each_drv+0x11c/0x190
> > > [ 1098.886448]  __device_attach+0x278/0x3c8
> > > [ 1098.886482]  device_initial_probe+0x2c/0x3c
> > > [ 1098.886517]  bus_probe_device+0xbc/0x1c8
> > > [ 1098.886550]  device_add+0x1174/0x1630
> > > [ 1098.886581]  platform_device_add+0x3f8/0x6f8
> > > [ 1098.886617]  platform_device_register_full+0x36c/0x3f8
> > > [ 1098.886656]  0xffffffc0032e3174
> > > [ 1098.886691]  do_one_initcall+0x1e8/0x91c
> > > [ 1098.886727]  do_init_module+0x16c/0x444
> > > [ 1098.886762]  load_module+0x63e0/0x7f8c
> > > [ 1098.886795]  __arm64_sys_finit_module+0x1e4/0x214
> > > [ 1098.886830]  invoke_syscall+0x98/0x278
> > > [ 1098.886862]  el0_svc_common+0x214/0x274
> > > [ 1098.886894]  do_el0_svc+0x9c/0x19c
> > > [ 1098.886926]  el0_svc+0x5c/0xc0
> > > [ 1098.886959]  el0t_64_sync_handler+0x78/0x108
> > > [ 1098.886994]  el0t_64_sync+0x1a4/0x1a8
> > > [ 1098.887027]
> > > [ 1098.887046] Freed by task 255:
> > > [ 1098.887071]  kasan_save_stack+0x38/0x68
> > > [ 1098.887106]  kasan_set_track+0x28/0x3c
> > > [ 1098.887139]  kasan_set_free_info+0x28/0x4c
> > > [ 1098.887174]  ____kasan_slab_free+0x110/0x164
> > > [ 1098.887209]  __kasan_slab_free+0x18/0x28
> > > [ 1098.887242]  kfree+0x200/0x868
> > > [ 1098.887275]  snd_pcm_free+0x88/0x98
> > > [ 1098.887311]  snd_pcm_dev_free+0x48/0x5c
> > > [ 1098.887347]  __snd_device_free+0x124/0x1b8
> > > [ 1098.887384]  snd_device_free_all+0xc8/0x184
> > > [ 1098.887419]  release_card_device+0x5c/0x180
> > > [ 1098.887453]  device_release+0xd4/0x1b4
> > > [ 1098.887486]  kobject_delayed_cleanup+0x130/0x304
> > > [ 1098.887519]  process_one_work+0x620/0x137c
> > > [ 1098.887555]  worker_thread+0x43c/0xa08
> > > [ 1098.887590]  kthread+0x2e4/0x3a0
> > > [ 1098.887623]  ret_from_fork+0x10/0x20
> > >
> > > A similar one is generated for snd_card if card_dev.release runs
> > > before ctl_dev.release. This patch is solving the same bug in both
> > > places at once.
> >
> > Hmm.  It's still puzzling, and I'm not 100% sure whether your analysis
> > is right.  The above shows it's freed by task 255, while the task
> > hitting UAF itself is 255.  It might be rather the combination of
> > devres and delayed releases.
> >
> > With CONFIG_DEBUG_KOBJECT_RELEASE, the kernel should show the info of
> > each delayed release kobject.  Could you give them together with the
> > Oops, so that we can see the flow how it hits UAF?
>
> Now I slowly understand what's happening.  Essentially, it's because
> the *embedded* struct device is released asynchronously from the
> ALSA's resource management (via dev_free ops).  The objects may be
> already released via card's device release (that calls
> snd_device_free_all()), while the release of each struct device that
> was already triggered beforehand can be delayed due to the debug
> option.

Ah that actually is the second bug I am still working on and not this
one. This patch fixes a bug in both the devm and non-devm case.

If you look at snd_card_init it installs release_card_device as the
release function for the struct device card_dev.

snd_card also has another struct device embedded in it, ctl_dev.

release_card_device calls snd_card_do_free which at the end releases
the snd_card struct.

The problem here is that in the kernel hacking situation, the release
function on the devices are not always called inplace (i.e. assuming
proper referencing counting behaviour). So with a bit of RNG, you hit
a case where card_dev runs release_card_device before ctl_dev, or even
before the PCM devices which results in the release function operating
on a freed pointer.

The other sign this is an issue is that we have 2 struct devices in
the same memory allocation (both in card and pcm), therefore they
cannot properly own their release.

>
> You code change looks mostly fine, but as far as I see,
> compress_offload also needs a similar change.  Meanwhile, rawmidi and
> hwdep do release the object via device release properly, so those are
> fine.  Ditto for sequencer.  And timer is only a global device, hence
> it must be fine.

Yes I noticed this too, will draft versions for them once I have the
snd_card devm version solved. So far though only snd_card has
reproduced the devm/release race.

>
> And, I believe we need a bit more detailed patch description.  So,
> could you improve the patch description, split the change to each
> component (control, pcm and compress_offload), and resubmit?

I can definitely update this to contain a bit more detail. That being
said, given the confusion about which bug this solves, do you still
want me to split this up? The bug is not resolved without both PCM and
card change for this bug which is hit in the delayed release, but they
are for two different paths reported by KASAN.

>
> Also, maybe it's worth to change snd_device_initialize() to take the
> release (optional) argument, too, instead of setting it explicitly
> afterwards at each place.  Already majority of callers will set own
> release callbacks.  This can be done at one more additional patch at
> last.

Sounds like a good idea, definitely an option once we get the
underlying issue solved.

Curtis

>
>
> thanks,
>
> Takashi
