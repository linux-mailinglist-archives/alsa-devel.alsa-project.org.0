Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5176EE47
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 17:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE964E;
	Thu,  3 Aug 2023 17:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE964E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691077017;
	bh=xgYa7oJIB33DPIF2WvjYnCIbWj3nsMQz3LdIPVaqtxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T52ofn5/58wLhBYQ8foyv2pphXOpFCN/Yp3/uQS7z6q7mr9aRK0Rv8NXcKDvuY6cU
	 R9Q2Md+cKJCn+UDyOkkPhpT4PBLGegnWJJXt4YeMdvv7FYRrKom9JU+scQ/hlvFT47
	 T9aJjDbnuxiN7WJprxfNBwjZilA/7vKAHRbbzzGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CC89F80548; Thu,  3 Aug 2023 17:36:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE156F801D5;
	Thu,  3 Aug 2023 17:36:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77A37F8025A; Thu,  3 Aug 2023 17:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DB65F8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 17:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB65F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PtM/bb1y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LGwpwKwD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C62F21F45A;
	Thu,  3 Aug 2023 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691076945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMqInBerOpkafkqBYKZ53+Ogu2ZPXmsNX+Q+iEe0W2Q=;
	b=PtM/bb1y2Si/a0Jb7xsdYwliMbZ/8Vt2QAzKHnYrVSVOa0v9i7IwUvyYetkSm/EHdFrqPF
	LdOqLDnQgECjCsQqPIgh6cAEmG+L9LzNXEoO2p//YCizzH1i4k492aeo7f4mkPPMYyQK4F
	xheIbaL3eyURIUXO/vFuNQwM41E+Ork=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691076945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMqInBerOpkafkqBYKZ53+Ogu2ZPXmsNX+Q+iEe0W2Q=;
	b=LGwpwKwDWGCGZbTQgs+saZX28wykiux4rjvNfE27PErVtLnT7aBH1VvD+vxRY8IBvq+aws
	rH2dQfkwf3Uvd8Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 825C6134B0;
	Thu,  3 Aug 2023 15:35:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id o6jIHlHJy2RpMwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 03 Aug 2023 15:35:45 +0000
Date: Thu, 03 Aug 2023 17:35:45 +0200
Message-ID: <87cz04b0ku.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org,
	alsa-devel@alsa-project.org,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
In-Reply-To: <87sf90b7hw.wl-tiwai@suse.de>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
	<87cz06djxo.wl-tiwai@suse.de>
	<CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
	<87sf90b7hw.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XUYCAHKHP5RHF2AW343JF56GCSHXWLND
X-Message-ID-Hash: XUYCAHKHP5RHF2AW343JF56GCSHXWLND
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUYCAHKHP5RHF2AW343JF56GCSHXWLND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 15:06:19 +0200,
Takashi Iwai wrote:
> 
> On Wed, 02 Aug 2023 19:06:05 +0200,
> Curtis Malainey wrote:
> > 
> > On Tue, Aug 1, 2023 at 11:42 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Tue, 01 Aug 2023 19:18:41 +0200,
> > > cujomalainey@chromium.org wrote:
> > > >
> > > > From: Curtis Malainey <cujomalainey@chromium.org>
> > > >
> > > > The current implementation of how devices are released is valid for
> > > > production use cases (root control of memory is handled by card_dev, all
> > > > other devices are no-ops).
> > > >
> > > > This model does not work though in a kernel hacking environment where
> > > > KASAN and delayed release on kobj is enabled. If the card_dev device is
> > > > released before any of the child objects a use-after-free bug is caught
> > > > by KASAN as the delayed release still has a reference to the devices
> > > > that were freed by the card_dev release. Also both snd_card and snd_pcm
> > > > both own two devices internally, so even if they released independently,
> > > > the shared struct would result in another use after free.
> > > >
> > > > Solution is to move the child devices into their own memory so they can
> > > > be handled independently and released on their own schedule.
> > > >
> > > > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > > > Cc: Doug Anderson <dianders@chromium.org>
> > >
> > > Thanks, it's an interesting bug.
> > >
> > > I'm not much against the proposed solution, but still this has to be
> > > carefully evaluated.  So, could you give more details about the bug
> > > itself?  It's related with CONFIG_DEBUG_KOBJECT_RELEASE, right?
> > > In which condition it's triggered and how the UAF looks like?
> > 
> > 
> > Hi Takashi
> > 
> > Here is one of the stack traces we are seeing (for snd_pcm)
> > 
> > [ 1098.876460] ==================================================================
> > [ 1098.884763] BUG: KASAN: use-after-free in enqueue_timer+0xa0/0x628
> > [ 1098.884849] Write of size 8 at addr ffffff80cbdc6800 by task kworker/7:4/255
> > [ 1098.884888]
> > [ 1098.884909] CPU: 7 PID: 255 Comm: kworker/7:4 Not tainted
> > 5.15.117-lockdep-19614-g05bc12fd18a9 #1
> > 5a757fac993273e9fde5e8de9925ee0cebe8540f
> > [ 1098.884961] Hardware name: Google Pompom (rev3+) with LTE (DT)
> > [ 1098.884990] Workqueue: events kobject_delayed_cleanup
> > [ 1098.885038] Call trace:
> > [ 1098.885059]  dump_backtrace+0x0/0x4e8
> > [ 1098.885095]  show_stack+0x34/0x44
> > [ 1098.885129]  dump_stack_lvl+0xdc/0x11c
> > [ 1098.885165]  print_address_description+0x30/0x2d8
> > [ 1098.885203]  kasan_report+0x178/0x1e4
> > [ 1098.885237]  __asan_report_store8_noabort+0x44/0x50
> > [ 1098.885276]  enqueue_timer+0xa0/0x628
> > [ 1098.885309]  internal_add_timer+0xa0/0x254
> > [ 1098.885346]  __mod_timer+0x588/0xc4c
> > [ 1098.885378]  add_timer+0x74/0x94
> > [ 1098.885411]  __queue_delayed_work+0x170/0x208
> > [ 1098.885447]  queue_delayed_work_on+0x128/0x160
> > [ 1098.885483]  kobject_put+0x278/0x2cc
> > [ 1098.885517]  put_device+0x30/0x48
> > [ 1098.885553]  snd_ctl_dev_free+0xc8/0xe4
> > [ 1098.885590]  __snd_device_free+0x124/0x1b8
> > [ 1098.885626]  snd_device_free_all+0x148/0x184
> > [ 1098.885663]  release_card_device+0x5c/0x180
> > [ 1098.885698]  device_release+0xd4/0x1b4
> > [ 1098.885732]  kobject_delayed_cleanup+0x130/0x304
> > [ 1098.885765]  process_one_work+0x620/0x137c
> > [ 1098.885802]  worker_thread+0x43c/0xa08
> > [ 1098.885837]  kthread+0x2e4/0x3a0
> > [ 1098.885872]  ret_from_fork+0x10/0x20
> > [ 1098.885907]
> > [ 1098.885926] Allocated by task 11891:
> > [ 1098.885953]  kasan_save_stack+0x38/0x68
> > [ 1098.885992]  __kasan_kmalloc+0x90/0xac
> > [ 1098.886026]  kmem_cache_alloc_trace+0x258/0x40c
> > [ 1098.886063]  _snd_pcm_new+0xc4/0x2c8
> > [ 1098.886098]  snd_pcm_new+0x5c/0x74
> > [ 1098.886132]  loopback_pcm_new+0xa0/0x20c [snd_aloop]
> > [ 1098.886194]  loopback_probe+0x210/0x850 [snd_aloop]
> > [ 1098.886235]  platform_probe+0x150/0x1c8
> > [ 1098.886273]  really_probe+0x274/0xa20
> > [ 1098.886308]  __driver_probe_device+0x1b4/0x3b4
> > [ 1098.886344]  driver_probe_device+0x78/0x1c0
> > [ 1098.886379]  __device_attach_driver+0x1ac/0x2c8
> > [ 1098.886414]  bus_for_each_drv+0x11c/0x190
> > [ 1098.886448]  __device_attach+0x278/0x3c8
> > [ 1098.886482]  device_initial_probe+0x2c/0x3c
> > [ 1098.886517]  bus_probe_device+0xbc/0x1c8
> > [ 1098.886550]  device_add+0x1174/0x1630
> > [ 1098.886581]  platform_device_add+0x3f8/0x6f8
> > [ 1098.886617]  platform_device_register_full+0x36c/0x3f8
> > [ 1098.886656]  0xffffffc0032e3174
> > [ 1098.886691]  do_one_initcall+0x1e8/0x91c
> > [ 1098.886727]  do_init_module+0x16c/0x444
> > [ 1098.886762]  load_module+0x63e0/0x7f8c
> > [ 1098.886795]  __arm64_sys_finit_module+0x1e4/0x214
> > [ 1098.886830]  invoke_syscall+0x98/0x278
> > [ 1098.886862]  el0_svc_common+0x214/0x274
> > [ 1098.886894]  do_el0_svc+0x9c/0x19c
> > [ 1098.886926]  el0_svc+0x5c/0xc0
> > [ 1098.886959]  el0t_64_sync_handler+0x78/0x108
> > [ 1098.886994]  el0t_64_sync+0x1a4/0x1a8
> > [ 1098.887027]
> > [ 1098.887046] Freed by task 255:
> > [ 1098.887071]  kasan_save_stack+0x38/0x68
> > [ 1098.887106]  kasan_set_track+0x28/0x3c
> > [ 1098.887139]  kasan_set_free_info+0x28/0x4c
> > [ 1098.887174]  ____kasan_slab_free+0x110/0x164
> > [ 1098.887209]  __kasan_slab_free+0x18/0x28
> > [ 1098.887242]  kfree+0x200/0x868
> > [ 1098.887275]  snd_pcm_free+0x88/0x98
> > [ 1098.887311]  snd_pcm_dev_free+0x48/0x5c
> > [ 1098.887347]  __snd_device_free+0x124/0x1b8
> > [ 1098.887384]  snd_device_free_all+0xc8/0x184
> > [ 1098.887419]  release_card_device+0x5c/0x180
> > [ 1098.887453]  device_release+0xd4/0x1b4
> > [ 1098.887486]  kobject_delayed_cleanup+0x130/0x304
> > [ 1098.887519]  process_one_work+0x620/0x137c
> > [ 1098.887555]  worker_thread+0x43c/0xa08
> > [ 1098.887590]  kthread+0x2e4/0x3a0
> > [ 1098.887623]  ret_from_fork+0x10/0x20
> > 
> > A similar one is generated for snd_card if card_dev.release runs
> > before ctl_dev.release. This patch is solving the same bug in both
> > places at once.
> 
> Hmm.  It's still puzzling, and I'm not 100% sure whether your analysis
> is right.  The above shows it's freed by task 255, while the task
> hitting UAF itself is 255.  It might be rather the combination of
> devres and delayed releases.
> 
> With CONFIG_DEBUG_KOBJECT_RELEASE, the kernel should show the info of
> each delayed release kobject.  Could you give them together with the
> Oops, so that we can see the flow how it hits UAF?

Now I slowly understand what's happening.  Essentially, it's because
the *embedded* struct device is released asynchronously from the
ALSA's resource management (via dev_free ops).  The objects may be
already released via card's device release (that calls
snd_device_free_all()), while the release of each struct device that
was already triggered beforehand can be delayed due to the debug
option.

You code change looks mostly fine, but as far as I see,
compress_offload also needs a similar change.  Meanwhile, rawmidi and
hwdep do release the object via device release properly, so those are
fine.  Ditto for sequencer.  And timer is only a global device, hence
it must be fine.

And, I believe we need a bit more detailed patch description.  So,
could you improve the patch description, split the change to each
component (control, pcm and compress_offload), and resubmit?

Also, maybe it's worth to change snd_device_initialize() to take the
release (optional) argument, too, instead of setting it explicitly
afterwards at each place.  Already majority of callers will set own
release callbacks.  This can be done at one more additional patch at
last.


thanks,

Takashi
