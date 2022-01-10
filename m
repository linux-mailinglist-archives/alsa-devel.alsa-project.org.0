Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F24897E7
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 12:50:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A189188B;
	Mon, 10 Jan 2022 12:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A189188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641815434;
	bh=OSNFRs+K/P64PTbIIaviLnoghALwV4ZCVMFXPnAeEfo=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iTDb5qproJaGl+9IDmuwiKptBHf+5rs/Aarutw2OMcORTaLSYbnwchmjc4u2QPp1H
	 SllUTQ3ErSQ49O5EAfZmTjqeoBO6pHwI20Ip5apk2uAAcxOlAU578fUo655c5b2Ycb
	 08SLJUMuEBxK3ssxVAKiu0BiBKthFclvKgL55Hng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEAFBF800B6;
	Mon, 10 Jan 2022 12:49:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0354F8012E; Mon, 10 Jan 2022 12:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF5D9F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 12:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5D9F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="N6mesSCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641815346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ysVsCPmK/EOAIqyG4iURSPt835Q0cPuvMVQcp1dOqvg=;
 b=N6mesSCjTp07mSgghpBjSASsZYdxQy3MW1+fJzOcpPMthkPJgQRn92RwhIwBCoTFyHhn/9
 HHWGkVO8bNnGQafdbAmlPER2WTasW63yWgpVgt7VB44JavhlADXmmA6/bMjXoEgqatlnsm
 vA3RCJ0yBP8uc7+3d1E0lilV2DP7zYs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-8V5LunAKOaW5JGYNcoHUGA-1; Mon, 10 Jan 2022 06:49:03 -0500
X-MC-Unique: 8V5LunAKOaW5JGYNcoHUGA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so9931171edc.0
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 03:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :content-language:from:cc:subject:content-transfer-encoding;
 bh=ysVsCPmK/EOAIqyG4iURSPt835Q0cPuvMVQcp1dOqvg=;
 b=ppfOawBSv1HwGkRK9Qm5ODKVmWVvntjgm82+p5iWD3ilfDRm2rm80utD/1QRTm85c2
 UHkqtP/IQgSn9KmIghjIuFtPETdk3RcBDG700mnxOS008UwDBwlH13kq68sWX9RHoxkZ
 q+LvRlzOI51kJ4uXQGarwI4/Xb3khqgevH40Qv0En1AW+GfNRoLRKE4WNcYVcH6rqLIl
 xr0TRM7nRa2a0PYoPJn1yn6P3z80vNW6lv2Zk9oHycPMNmDX6xONV3NzGQ+j0F+8D254
 51U5X6CRb7krQmLefDWja7aZu8J7iZAeTEpO+27823H5vXKIRIfJ9lgvLB9CQ+YFIkvT
 uGvw==
X-Gm-Message-State: AOAM5306WRgsAlNJQgH4qFAq3T0Z+P15jCl4/SHb2wGLGxDyZDlttv5I
 NOztl2e5myTfEeh0q61EudN25funcMYwmh+nz8C28fUuPdFejKFFKCvD8RB1BWaHtEc7PeTLgsm
 3bEehgreIRSEZC7oDOMOhQ8M=
X-Received: by 2002:a17:907:90c4:: with SMTP id
 gk4mr10463348ejb.514.1641815341735; 
 Mon, 10 Jan 2022 03:49:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPjhVD9nlssNAOClA0I934Kt057J/f+c0pqMe3YgcKN39Zv8dFUumZ59DFSsDR40JdXGBcIA==
X-Received: by 2002:a17:907:90c4:: with SMTP id
 gk4mr10463336ejb.514.1641815341561; 
 Mon, 10 Jan 2022 03:49:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id i23sm3429246edt.93.2022.01.10.03.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 03:49:01 -0800 (PST)
Message-ID: <73018f3c-9769-72ea-0325-b3f8e2381e30@redhat.com>
Date: Mon, 10 Jan 2022 12:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Hans de Goede <hdegoede@redhat.com>
Subject: New lockdep warning in broonie/sound.git/for-5.17
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi All,

After rebasing my recent Bay Trail rt5640 patch series on top of
broonie/sound.git/for-5.17 I'm seeing the following new lockdep
warning on devices running the rebased branch:

[  131.404755] ============================================
[  131.404762] WARNING: possible recursive locking detected
[  131.404769] 5.16.0-rc8+ #758 Tainted: G         C       
[  131.404777] --------------------------------------------
[  131.404782] pipewire/1372 is trying to acquire lock:
[  131.404789] ffffa090838535a0 (&group->mutex){+.+.}-{3:3}, at: _snd_pcm_stream_lock_irqsave+0x2b/0x30 [snd_pcm]
[  131.404845] 
               but task is already holding lock:
[  131.404851] ffffa09088e981a0 (&group->mutex){+.+.}-{3:3}, at: snd_pcm_action_lock_irq+0x2d/0x90 [snd_pcm]
[  131.404894] 
               other info that might help us debug this:
[  131.404899]  Possible unsafe locking scenario:

[  131.404905]        CPU0
[  131.404909]        ----
[  131.404913]   lock(&group->mutex);
[  131.404923]   lock(&group->mutex);
[  131.404932] 
                *** DEADLOCK ***

[  131.404937]  May be due to missing lock nesting notation

[  131.404942] 1 lock held by pipewire/1372:
[  131.404950]  #0: ffffa09088e981a0 (&group->mutex){+.+.}-{3:3}, at: snd_pcm_action_lock_irq+0x2d/0x90 [snd_pcm]
[  131.404994] 
               stack backtrace:
[  131.405001] CPU: 2 PID: 1372 Comm: pipewire Tainted: G         C        5.16.0-rc8+ #758
[  131.405012] Hardware name: ASUSTeK COMPUTER INC. TF103CE/TF103CE, BIOS 5.6.5 09/03/2015
[  131.405019] Call Trace:
[  131.405022] sd 0:0:0:0: [sda] 31805439 512-byte logical blocks: (16.3 GB/15.2 GiB)
[  131.405027]  <TASK>
[  131.405034]  dump_stack_lvl+0x59/0x73
[  131.405057]  __lock_acquire.cold+0xc5/0x2b8
[  131.405081]  lock_acquire+0xb5/0x2b0
[  131.405095]  ? _snd_pcm_stream_lock_irqsave+0x2b/0x30 [snd_pcm]
[  131.405128]  ? lock_is_held_type+0xa8/0x120
[  131.405148]  __mutex_lock+0x92/0x8a0
[  131.405163]  ? _snd_pcm_stream_lock_irqsave+0x2b/0x30 [snd_pcm]
[  131.405195]  ? mark_held_locks+0x49/0x70
[  131.405208]  ? _snd_pcm_stream_lock_irqsave+0x2b/0x30 [snd_pcm]
[  131.405241]  ? _raw_spin_unlock_irqrestore+0x2d/0x50
[  131.405260]  ? _snd_pcm_stream_lock_irqsave+0x2b/0x30 [snd_pcm]
[  131.405291]  _snd_pcm_stream_lock_irqsave+0x2b/0x30 [snd_pcm]
[  131.405322]  dpcm_be_dai_trigger+0xae/0x410 [snd_soc_core]
[  131.405404] sda: detected capacity change from 0 to 31805439
[  131.405406]  dpcm_fe_dai_do_trigger+0x84/0x1b0 [snd_soc_core]
[  131.405480]  snd_pcm_action+0x79/0xc0 [snd_pcm]
[  131.405515]  snd_pcm_action_lock_irq+0x3b/0x90 [snd_pcm]
[  131.405549]  snd_pcm_ioctl+0x23/0x30 [snd_pcm]
[  131.405581]  __x64_sys_ioctl+0x82/0xb0
[  131.405599]  do_syscall_64+0x3b/0x90
[  131.405612]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  131.405624] RIP: 0033:0x7f70c0b2e37b
[  131.405637] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 7d 2a 0f 00 f7 d8 64 89 01 48
[  131.405647] RSP: 002b:00007ffdfdd46e88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  131.405660] RAX: ffffffffffffffda RBX: 00005584f8f43a40 RCX: 00007f70c0b2e37b
[  131.405669] RDX: 0000000000000000 RSI: 0000000000004142 RDI: 0000000000000048
[  131.405676] RBP: 0000000000000002 R08: 00007f70b16eb000 R09: 0000000000000800
[  131.405684] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[  131.405692] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000003
[  131.405711]  </TASK>

It seems we now have some nested locking going on without proper lockdep
annotations (that or a deadlock, but everything still seems to work fine).

Regards,

Hans

