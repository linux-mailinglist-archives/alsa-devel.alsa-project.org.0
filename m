Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C26320A7C
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 14:15:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3467B1674;
	Sun, 21 Feb 2021 14:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3467B1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613913349;
	bh=8Q7dZDIu4xhHCkasmLsHeBIq27G1hffjpFfr6+mS2Xw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXPnzDayxEfqWyC1TRB+x9Vmw3XhT8IS3z09qq2KDd97P/CfooaQASiHBWJCUbGii
	 dsDKKLrMHoxjIpZbkBuG8B/XSGlb3PUK6w8QchaiOSOHWzoslmRL3vVElaWHtUh/M5
	 Y8NtETwu23YW80/qgEzUkjNU+OgSkR+KCpXfdDlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90500F80152;
	Sun, 21 Feb 2021 14:14:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D10F8016A; Sun, 21 Feb 2021 14:14:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 212C4F80152
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 14:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 212C4F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XbsQ9vYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613913249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKaN0ab9bRjZjxAcO8vckeoPBeMkZ2tRuGLBvWBdUaI=;
 b=XbsQ9vYnMLKx8rsMVkEhbjFdjAsOfU9N97qvhwtek6DZgTg9yJ5InWohPCvZvBaEpVSTBg
 rSEPu/Se22P+LyZb5oEVu/s2ed014wQb5RCGUfcktp60mnKYpVfawVYNjUu742jV369g0y
 5Yy3xV94qNbWE1TSAQ5EoDI+OoG4FMQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-5EzQeA7MOtiddpvlkSX45w-1; Sun, 21 Feb 2021 08:14:07 -0500
X-MC-Unique: 5EzQeA7MOtiddpvlkSX45w-1
Received: by mail-ed1-f70.google.com with SMTP id u2so5535114edj.20
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 05:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LKaN0ab9bRjZjxAcO8vckeoPBeMkZ2tRuGLBvWBdUaI=;
 b=Iz3Po+spOoL4k30ebgfMXd19FljOmawbY/1NVbu7FoBzh99pIeQDaOifnQDkBtkGRk
 yhcMMoWcGtetpBjfEhBaKPwQScftl5lpDxTDQOUt5Se5IH017UqXLMmh6iO7tLTxBLQk
 K7ROgh9knu1khUrYDpfek0UYo/8R6jZ5/9miAIlbh6irlWEXIZuRf8kvimNoOM45MJ+z
 8G2Kk57VaL76Yrbv6RdU4OXHWMIoCAHk9CZ33wfvXClwbmz8PYvBueRtPwDoAQh5Lr70
 hV8eryqoSzXovuw2XG7DnpJ6cOpG3f7AiVTkpJ2LNWJYBamvNsar7+jDjTDTqhPTxolj
 8KHA==
X-Gm-Message-State: AOAM532+nnqMQulwHeaGBSC8Hlsk9UzMWAV0zZJM4QXDsHcabh4GXN2q
 InN71C18HOVA8LohLtEWZUoJa31AIusKTYD5NmeYNbw14EuN8LAfX82WWImpvZaYDg8FU4CpgHG
 TVY27sCxYtkOun+/2oUSRiLo=
X-Received: by 2002:a17:907:7608:: with SMTP id
 jx8mr730384ejc.99.1613913245410; 
 Sun, 21 Feb 2021 05:14:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTS0OJwQaBhF0uEOZ94LWV1xaaPcA6QxGIx9Ksnk/qq5uCS8/SIC/7E+K9hOwcG7+FpgHJlw==
X-Received: by 2002:a17:907:7608:: with SMTP id
 jx8mr730373ejc.99.1613913245166; 
 Sun, 21 Feb 2021 05:14:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cr20sm8031465ejc.57.2021.02.21.05.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 05:14:04 -0800 (PST)
Subject: Re: [PATCH v2 0/5] ALSA: control - add generic LED API
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210215172418.1322825-1-perex@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d1582696-b8db-7c7e-3279-9ce016a7fa8a@redhat.com>
Date: Sun, 21 Feb 2021 14:14:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215172418.1322825-1-perex@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Perry Yuan <Perry.Yuan@dell.com>
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

Hi,

On 2/15/21 6:24 PM, Jaroslav Kysela wrote:
> This patchset tries to resolve the diversity in the audio LED
> control among the ALSA drivers. A new control layer registration
> is introduced which allows to run additional operations on
> top of the elementary ALSA sound controls.
> 
> A new control access group (three bits in the access flags)
> was introduced to carry the LED group information for
> the sound controls. The low-level sound drivers can just
> mark those controls using this access group. This information
> is exported to the user space and eventually the user space
> can create sound controls which can belong to a LED group.
> 
> The actual state ('route') evaluation is really easy
> (the minimal value check for all channels / controls / cards).
> If there's more complicated logic for a given hardware,
> the card driver may eventually export a new read-only
> sound control for the LED group and do the logic itself.
> 
> The new LED trigger control code is completely separated
> and possibly optional (there's no symbol dependency).
> The full code separation allows eventually to move this
> LED trigger control to the user space in future.
> Actually it replaces the already present functionality
> in the kernel space (HDA drivers) and allows a quick adoption
> for the recent hardware (SoundWire / ASoC codecs).
> 
> # lsmod | grep snd_ctl_led
> snd_ctl_led            16384  0
> 
> The sound driver implementation is really easy:
> 
> 1) call snd_ctl_led_request() when control LED layer should be
>    automatically activated
>    / it calls module_request("snd-ctl-led") on demand /
> 2) mark all related kcontrols with
> 	SNDRV_CTL_ELEM_ACCESS_SPK_LED or
> 	SNDRV_CTL_ELEM_ACCESS_MIC_LED
> 
> v2 changes:
>   - fix the locking - remove the controls_rwsem read lock
>     in the element get (the consistency is already protected
>     with the global snd_ctl_led_mutex and possible partial
>     value writes are catched with the next value change
>     notification callback)

I'm afraid that lockdep still is unhappy. With v2 there is a new
(different) lockdep warning.

In case you don't know, lockdep disables itself after catching
the first problem, to avoid spamming the logs too much.
So the previous issue was masking this one (or it could be new):

[   22.213898] ======================================================
[   22.213903] WARNING: possible circular locking dependency detected
[   22.213909] 5.11.0+ #255 Tainted: G            E
[   22.213914] ------------------------------------------------------
[   22.213918] systemd-udevd/390 is trying to acquire lock:
[   22.213923] ffff8a7f03d5a720 (&card->controls_rwsem){++++}-{3:3}, at: 0xffffffffc0861896
[   22.213948] 
               but task is already holding lock:
[   22.213952] ffffffffc07772b0 (snd_ctl_layer_rwsem){++++}-{3:3}, at: snd_ctl_register_layer+0x16b/0x360 [snd]
[   22.213977] 
               which lock already depends on the new lock.

[   22.213981] 
               the existing dependency chain (in reverse order) is:
[   22.213985] 
               -> #1 (snd_ctl_layer_rwsem){++++}-{3:3}:
[   22.213998]        down_read+0x40/0x50
[   22.214009]        snd_ctl_notify_one+0x8d/0x150 [snd]
[   22.214022]        snd_ctl_find_id+0x24e/0x350 [snd]
[   22.214034]        snd_ctl_find_id+0x2f3/0x350 [snd]
[   22.214047]        init_module+0x5bbab/0x5da91 [snd_hdmi_lpe_audio]
[   22.214057]        platform_probe+0x3f/0x90
[   22.214065]        really_probe+0xf2/0x440
[   22.214073]        driver_probe_device+0xe1/0x150
[   22.214080]        device_driver_attach+0xa8/0xb0
[   22.214087]        __driver_attach+0x8c/0x150
[   22.214095]        bus_for_each_dev+0x78/0xa0
[   22.214102]        bus_add_driver+0x12e/0x1f0
[   22.214109]        driver_register+0x8f/0xe0
[   22.214116]        do_one_initcall+0x6e/0x2e0
[   22.214125]        do_init_module+0x5c/0x260
[   22.214135]        load_module+0x2570/0x27e0
[   22.214143]        __do_sys_init_module+0x130/0x190
[   22.214151]        do_syscall_64+0x33/0x40
[   22.214158]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   22.214166]
               -> #0 (&card->controls_rwsem){++++}-{3:3}:
[   22.214179]        __lock_acquire+0x113d/0x1e10
[   22.214187]        lock_acquire+0xe4/0x390
[   22.214194]        down_read+0x40/0x50
[   22.214200]        0xffffffffc0861896
[   22.214207]        snd_ctl_register_layer+0x183/0x360 [snd]
[   22.214220]        snd_device_register_all+0x4c/0x60 [snd]
[   22.214232]        snd_card_register+0x74/0x1d0 [snd]
[   22.214244]        init_module+0x5bccb/0x5da91 [snd_hdmi_lpe_audio]
[   22.214253]        platform_probe+0x3f/0x90
[   22.214259]        really_probe+0xf2/0x440
[   22.214266]        driver_probe_device+0xe1/0x150
[   22.214273]        device_driver_attach+0xa8/0xb0
[   22.214281]        __driver_attach+0x8c/0x150
[   22.214288]        bus_for_each_dev+0x78/0xa0
[   22.214295]        bus_add_driver+0x12e/0x1f0
[   22.214302]        driver_register+0x8f/0xe0
[   22.214309]        do_one_initcall+0x6e/0x2e0
[   22.214316]        do_init_module+0x5c/0x260
[   22.214324]        load_module+0x2570/0x27e0
[   22.214332]        __do_sys_init_module+0x130/0x190
[   22.214339]        do_syscall_64+0x33/0x40
[   22.214346]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   22.214354] 
               other info that might help us debug this:

[   22.214357]  Possible unsafe locking scenario:

[   22.214361]        CPU0                    CPU1
[   22.214365]        ----                    ----
[   22.214368]   lock(snd_ctl_layer_rwsem);
[   22.214376]                                lock(&card->controls_rwsem);
[   22.214383]                                lock(snd_ctl_layer_rwsem);
[   22.214390]   lock(&card->controls_rwsem);
[   22.214397] 
                *** DEADLOCK ***
[   22.214401] 2 locks held by systemd-udevd/390:
[   22.214406]  #0: ffff8a7f0768f188 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x3b/0xb0
[   22.214426]  #1: ffffffffc07772b0 (snd_ctl_layer_rwsem){++++}-{3:3}, at: snd_ctl_register_layer+0x16b/0x360 [snd]
[   22.214450] 
               stack backtrace:
[   22.214455] CPU: 0 PID: 390 Comm: systemd-udevd Tainted: G            E     5.11.0+ #255
[   22.214463] Hardware name: HP HP x2 Detachable 10-p0XX/827C, BIOS F.11 09/30/2016
[   22.214468] Call Trace:
[   22.214477]  dump_stack+0x8b/0xb0
[   22.214491]  check_noncircular+0xfb/0x110
[   22.214505]  __lock_acquire+0x113d/0x1e10
[   22.214518]  lock_acquire+0xe4/0x390
[   22.214527]  ? 0xffffffffc0861896
[   22.214539]  down_read+0x40/0x50
[   22.214547]  ? 0xffffffffc0861896
[   22.214554]  0xffffffffc0861896
[   22.214562]  snd_ctl_register_layer+0x183/0x360 [snd]
[   22.214578]  snd_device_register_all+0x4c/0x60 [snd]
[   22.214593]  snd_card_register+0x74/0x1d0 [snd]
[   22.214608]  init_module+0x5bccb/0x5da91 [snd_hdmi_lpe_audio]
[   22.214624]  platform_probe+0x3f/0x90
[   22.214633]  really_probe+0xf2/0x440
[   22.214643]  driver_probe_device+0xe1/0x150
[   22.214652]  device_driver_attach+0xa8/0xb0
[   22.214662]  __driver_attach+0x8c/0x150
[   22.214670]  ? device_driver_attach+0xb0/0xb0
[   22.214678]  ? device_driver_attach+0xb0/0xb0
[   22.214687]  bus_for_each_dev+0x78/0xa0
[   22.214696]  bus_add_driver+0x12e/0x1f0
[   22.214706]  driver_register+0x8f/0xe0
[   22.214715]  ? 0xffffffffc06f5000
[   22.214721]  do_one_initcall+0x6e/0x2e0
[   22.214735]  do_init_module+0x5c/0x260
[   22.214745]  load_module+0x2570/0x27e0
[   22.214768]  ? __do_sys_init_module+0x130/0x190
[   22.214776]  __do_sys_init_module+0x130/0x190
[   22.214791]  do_syscall_64+0x33/0x40
[   22.214799]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   22.214809] RIP: 0033:0x7fbdcf3cc6be
[   22.214817] Code: 48 8b 0d bd 27 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8a 27
[   22.214825] RSP: 002b:00007ffea888abe8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
[   22.214835] RAX: ffffffffffffffda RBX: 000055bdd044d9f0 RCX: 00007fbdcf3cc6be
[   22.214841] RDX: 00007fbdcf50235a RSI: 000000000000b1f8 RDI: 000055bdd0c549a0
[   22.214846] RBP: 000055bdd0c549a0 R08: 000055bdd0c549a0 R09: 00007ffea8887c88
[   22.214852] R10: 000055bdd0143010 R11: 0000000000000246 R12: 00007fbdcf50235a
[   22.214857] R13: 000055bdd042af40 R14: 0000000000000007 R15: 000055bdd0430bf0

I did not get around to testing your fixup-diff before you send
out v2 last time.

If you can send me another fixup-diff then I'll make sure to
test this before you do a v3, so that we can be sure that
all cases which my setup catches are resolved before sending
out v3.

Regards,

Hans

