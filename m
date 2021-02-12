Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE131A613
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 21:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901DD1701;
	Fri, 12 Feb 2021 21:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901DD1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613161970;
	bh=J4LqtRA2yy6Z4MvQDEV01EnBj4qm9QB9vRzstyLEIIk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbeb4jJpsQEZF5X6D0VnrDkq7dkB8jw+9sumMCbRTW1KOG5lKWmwWREN9bW4p/itN
	 8LznLAfFdTnkGMlf148G0G/6EfdEUtkIluE6QZc7Y2DVPqAuWeD8f7Sa31uB6lP0D9
	 N6KVByyW2Ep44evW9tpcTeNvLQ5e9NkAI9epwF1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6268F8014D;
	Fri, 12 Feb 2021 21:31:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9CCDF8022B; Fri, 12 Feb 2021 21:31:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4389CF8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 21:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4389CF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="NXFSsDbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613161870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxxwG5vAaJC8AwvlcufOi8b261uEhByMI15TOf5eRfk=;
 b=NXFSsDbhNKhYbMGM0eNk9CG9hp93MHpHSLwJVxedp0qThgduqmmGz7KJWwMVsQ3aFrufr1
 J7M2ruoawUsuFZllIpNvFW1sQIfXq+p75LNqH1MZ70UdfQVzyry/oQj3WfobakZlu0xOFm
 4BemtOhpeaUFd1v7DlxZQB6846/igtU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-QeH6FnY2O7Of2FrwHKFQlg-1; Fri, 12 Feb 2021 15:31:07 -0500
X-MC-Unique: QeH6FnY2O7Of2FrwHKFQlg-1
Received: by mail-ed1-f69.google.com with SMTP id l23so699861edt.23
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 12:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PxxwG5vAaJC8AwvlcufOi8b261uEhByMI15TOf5eRfk=;
 b=cZVi9R0ssOzxulZ5Zw4Cv1kfBHJlbFg5klIwPP6Ebrm4w8yur7zVq0uECVPX0l2trS
 k63fi8gD0y9gLnRCBQbR5hJpmm+3vv/98GtPklTA0Hzbgq3nHFOr26UrunWJVAzctXey
 xtfMqls7R3GiS28Vxwa2B0oBAp35KFgEFIAPRhveDdSevt9E2ClfVejx3wQYikEWjB+E
 QLSOnUz4vJdOgCOhpEvGkCuGn+lvuHRlEiTNahZRz4H7gW2Ykzm94in1w6OrAHFMgWV0
 JnDhhrcy9V3xUra0XuD1iBBBmWCnaj2arF2/GwBpkjCrXddcQgX5cHoVHfeBOs/3Hhxv
 HGAA==
X-Gm-Message-State: AOAM530e96croG54rg6bPMeZuBG58LT6ceDC3UfsWr+JK87WMQyjZpx6
 b/apSlIMKwfpMSVoVEWuhxZyOl0qk+bGNgKfskrQxs96YkkPhzf9Py7h/NUhWGZTcJTjS3rHKcE
 I9Kbr9eeOcIexu8ssm/+pw40=
X-Received: by 2002:aa7:d58b:: with SMTP id r11mr5106030edq.241.1613161865652; 
 Fri, 12 Feb 2021 12:31:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/QSOm1ULQL+f+J/SkC4Ws7trAR7spsJSurthrLfXu8ux0V8/134LZmyX9L6MKyZpnye3gyw==
X-Received: by 2002:aa7:d58b:: with SMTP id r11mr5106012edq.241.1613161865408; 
 Fri, 12 Feb 2021 12:31:05 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id s15sm192080edw.23.2021.02.12.12.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 12:31:05 -0800 (PST)
Subject: Re: [PATCH 0/5] ALSA: control - add generic LED trigger code
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210211111400.1131020-1-perex@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <cb04c4b2-4722-233a-05d4-2d3472d14bd9@redhat.com>
Date: Fri, 12 Feb 2021 21:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211111400.1131020-1-perex@perex.cz>
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

On 2/11/21 12:13 PM, Jaroslav Kysela wrote:
> This patchset tries to resolve the diversity in the audio LED
> control among the ALSA drivers.
> 
> A new control layer registration is introduced which allows
> to run additional operations on top of the elementary ALSA
> sound controls.
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
> for the recent hardware (SoundWire ASoC codecs).
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

So I've been running some tests with this,combined with writing
UCM profiles for hw volume control, for some Intel Bay- and
CherryTrail devices using Intel's Low Power Engine (LPE) for audio,
which uses the ASoC framework.

My work / experiments for this are progressing a bit slower then I
would like, but that is not the fault of this patch-set, but rather
an issue with hw-volume control mapping, see below for details.

Leaving the ASoC implementation details aside, this patch-set
works quite nicely to get the speaker mute-LED to work.

There is one issue, I'm running my kernels with lockdep and
this patchset triggers a lockdep warning:

[   24.487200] input: sof-bytcht rt5672 Headset as /devices/platform/80860F28:00/cht-bsw-rt5672/sound/card1/input19

[   24.532006] ======================================================
[   24.532010] WARNING: possible circular locking dependency detected
[   24.532015] 5.11.0-rc7+ #248 Tainted: G            E    
[   24.532019] ------------------------------------------------------
[   24.532022] systemd-udevd/394 is trying to acquire lock:
[   24.532027] ffff922888ead720 (&card->controls_rwsem){++++}-{3:3}, at: snd_ctl_led_hello+0x65a/0x9f0 [snd_ctl_led]
[   24.532048] 
               but task is already holding lock:
[   24.532051] ffffffffc0b0eb88 (snd_ctl_led_mutex){+.+.}-{3:3}, at: snd_ctl_led_hello+0x453/0x9f0 [snd_ctl_led]
[   24.532066] 
               which lock already depends on the new lock.

[   24.532069] 
               the existing dependency chain (in reverse order) is:
[   24.532072] 
               -> #2 (snd_ctl_led_mutex){+.+.}-{3:3}:
[   24.532083]        __mutex_lock+0xb8/0x7f0
[   24.532094]        snd_ctl_led_hello+0x8fd/0x9f0 [snd_ctl_led]
[   24.532100]        snd_ctl_register_layer+0x48/0x360 [snd]
[   24.532112]        0xffffffffc078f149
[   24.532119]        do_one_initcall+0x6e/0x2e0
[   24.532127]        do_init_module+0x5c/0x260
[   24.532135]        load_module+0x2570/0x27e0
[   24.532142]        __do_sys_init_module+0x130/0x190
[   24.532148]        do_syscall_64+0x33/0x40
[   24.532154]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   24.532161] 
               -> #1 (snd_ctl_layer_rwsem){++++}-{3:3}:
[   24.532172]        down_read+0x40/0x50
[   24.532177]        snd_ctl_notify_one+0x8d/0x150 [snd]
[   24.532188]        snd_ctl_find_id+0x24e/0x350 [snd]
[   24.532197]        snd_ctl_find_id+0x2f3/0x350 [snd]
[   24.532207]        0xffffffffc0786bab
[   24.532212]        platform_probe+0x3f/0x90
[   24.532219]        really_probe+0xf2/0x440
[   24.532225]        driver_probe_device+0xe1/0x150
[   24.532231]        device_driver_attach+0xa8/0xb0
[   24.532237]        __driver_attach+0x8c/0x150
[   24.532243]        bus_for_each_dev+0x78/0xa0
[   24.532249]        bus_add_driver+0x12e/0x1f0
[   24.532254]        driver_register+0x8f/0xe0
[   24.532260]        do_one_initcall+0x6e/0x2e0
[   24.532266]        do_init_module+0x5c/0x260
[   24.532272]        load_module+0x2570/0x27e0
[   24.532278]        __do_sys_init_module+0x130/0x190
[   24.532285]        do_syscall_64+0x33/0x40
[   24.532290]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   24.532296] 
               -> #0 (&card->controls_rwsem){++++}-{3:3}:
[   24.532307]        __lock_acquire+0x113d/0x1e10
[   24.532314]        lock_acquire+0xe4/0x390
[   24.532320]        down_read+0x40/0x50
[   24.532325]        snd_ctl_led_hello+0x65a/0x9f0 [snd_ctl_led]
[   24.532331]        snd_ctl_led_hello+0x959/0x9f0 [snd_ctl_led]
[   24.532337]        snd_ctl_register_layer+0x183/0x360 [snd]
[   24.532347]        snd_device_register_all+0x4c/0x60 [snd]
[   24.532357]        snd_card_register+0x74/0x1d0 [snd]
[   24.532366]        snd_soc_set_dmi_name+0xb2a/0xc30 [snd_soc_core]
[   24.532393]        devm_snd_soc_register_card+0x43/0x90 [snd_soc_core]
[   24.532412]        0xffffffffc0cf3579
[   24.532419]        platform_probe+0x3f/0x90
[   24.532424]        really_probe+0xf2/0x440
[   24.532430]        driver_probe_device+0xe1/0x150
[   24.532436]        device_driver_attach+0xa8/0xb0
[   24.532442]        __driver_attach+0x8c/0x150
[   24.532447]        bus_for_each_dev+0x78/0xa0
[   24.532453]        bus_add_driver+0x12e/0x1f0
[   24.532459]        driver_register+0x8f/0xe0
[   24.532465]        do_one_initcall+0x6e/0x2e0
[   24.532471]        do_init_module+0x5c/0x260
[   24.532477]        load_module+0x2570/0x27e0
[   24.532483]        __do_sys_init_module+0x130/0x190
[   24.532489]        do_syscall_64+0x33/0x40
[   24.532494]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   24.532501] 
               other info that might help us debug this:

[   24.532504] Chain exists of:
                 &card->controls_rwsem --> snd_ctl_layer_rwsem --> snd_ctl_led_mutex

[   24.532517]  Possible unsafe locking scenario:

[   24.532520]        CPU0                    CPU1
[   24.532523]        ----                    ----
[   24.532526]   lock(snd_ctl_led_mutex);
[   24.532532]                                lock(snd_ctl_layer_rwsem);
[   24.532538]                                lock(snd_ctl_led_mutex);
[   24.532544]   lock(&card->controls_rwsem);
[   24.532550] 
                *** DEADLOCK ***

[   24.532553] 5 locks held by systemd-udevd/394:
[   24.532558]  #0: ffff922883ec2988 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x3b/0xb0
[   24.532574]  #1: ffffffffc088e1c8 (client_mutex){+.+.}-{3:3}, at: snd_soc_set_dmi_name+0x2f8/0xc30 [snd_soc_core]
[   24.532604]  #2: ffffffffc0cf71f0 (&card->mutex){+.+.}-{3:3}, at: snd_soc_set_dmi_name+0x30e/0xc30 [snd_soc_core]
[   24.532632]  #3: ffffffffc07562b0 (snd_ctl_layer_rwsem){++++}-{3:3}, at: snd_ctl_register_layer+0x16b/0x360 [snd]
[   24.532652]  #4: ffffffffc0b0eb88 (snd_ctl_led_mutex){+.+.}-{3:3}, at: snd_ctl_led_hello+0x453/0x9f0 [snd_ctl_led]
[   24.532668] 
               stack backtrace:
[   24.532672] CPU: 2 PID: 394 Comm: systemd-udevd Tainted: G            E     5.11.0-rc7+ #248
[   24.532679] Hardware name: LENOVO 20C1000VMH/20C1000VMH, BIOS GUET86WW (1.86) 10/21/2019
[   24.532683] Call Trace:
[   24.532691]  dump_stack+0x8b/0xb0
[   24.532702]  check_noncircular+0xfb/0x110
[   24.532713]  __lock_acquire+0x113d/0x1e10
[   24.532722]  ? lock_acquire+0xe4/0x390
[   24.532730]  lock_acquire+0xe4/0x390
[   24.532737]  ? snd_ctl_led_hello+0x65a/0x9f0 [snd_ctl_led]
[   24.532747]  down_read+0x40/0x50
[   24.532754]  ? snd_ctl_led_hello+0x65a/0x9f0 [snd_ctl_led]
[   24.532761]  snd_ctl_led_hello+0x65a/0x9f0 [snd_ctl_led]
[   24.532771]  snd_ctl_led_hello+0x959/0x9f0 [snd_ctl_led]
[   24.532779]  snd_ctl_register_layer+0x183/0x360 [snd]
[   24.532791]  snd_device_register_all+0x4c/0x60 [snd]
[   24.532803]  snd_card_register+0x74/0x1d0 [snd]
[   24.532816]  snd_soc_set_dmi_name+0xb2a/0xc30 [snd_soc_core]
[   24.532838]  devm_snd_soc_register_card+0x43/0x90 [snd_soc_core]
[   24.532860]  0xffffffffc0cf3579
[   24.532869]  platform_probe+0x3f/0x90
[   24.532876]  really_probe+0xf2/0x440
[   24.532885]  driver_probe_device+0xe1/0x150
[   24.532893]  device_driver_attach+0xa8/0xb0
[   24.532901]  __driver_attach+0x8c/0x150
[   24.532908]  ? device_driver_attach+0xb0/0xb0
[   24.532914]  ? device_driver_attach+0xb0/0xb0
[   24.532922]  bus_for_each_dev+0x78/0xa0
[   24.532930]  bus_add_driver+0x12e/0x1f0
[   24.532937]  driver_register+0x8f/0xe0
[   24.532944]  ? 0xffffffffc0cfa000
[   24.532950]  do_one_initcall+0x6e/0x2e0
[   24.532961]  do_init_module+0x5c/0x260
[   24.532970]  load_module+0x2570/0x27e0
[   24.532988]  ? __do_sys_init_module+0x130/0x190
[   24.532995]  __do_sys_init_module+0x130/0x190
[   24.533007]  do_syscall_64+0x33/0x40
[   24.533014]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   24.533022] RIP: 0033:0x7f5d8ed4640e
[   24.533030] Code: 48 8b 0d 65 1a 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 32 1a 0c 00 f7 d8 64 89 01 48
[   24.533037] RSP: 002b:00007ffc37771de8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
[   24.533044] RAX: ffffffffffffffda RBX: 000056459db8f3f0 RCX: 00007f5d8ed4640e
[   24.533049] RDX: 00007f5d8eea632c RSI: 00000000000064d0 RDI: 000056459dd220b0
[   24.533054] RBP: 000056459dd220b0 R08: 000056459dced5f0 R09: 00007ffc3776e160
[   24.533058] R10: 00005640f99694ad R11: 0000000000000246 R12: 00007f5d8eea632c
[   24.533062] R13: 000056459dbe48c0 R14: 0000000000000007 R15: 000056459dd16a30

Regards,

Hans


p.s.

The promised details of the issues which I'm hitting in implementing
this on Intel devs using the ASoC framework:

E.g. on the rt5672 the speaker amplifier has no volume control.
So I need to use the DAC1 digital volume control, which has no mute bits.
I have this working now, but due to there not being enough steps in the
hw-vol-control, it reaches 0 when the GNOME UI is displaying that the
sound is soft, but not off/muted. Yes the mute-led goes on because
the control reaches it lowest value. So I need to fake a mute control
in the codec driver for the LED to work reliable it seems...

