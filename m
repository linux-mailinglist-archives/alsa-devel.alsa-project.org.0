Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7285438976
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 16:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E5FC166B;
	Sun, 24 Oct 2021 16:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E5FC166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635084553;
	bh=Op8ILNWgUIwbTCygwxpqgU5xKKSeAoZ9DwYqjg409UA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=te5AIrxp89oOe6b06gd2flxWAofgRLOoAaiDkQK/2pTooh7HjektZOCR/oFvJcUWK
	 vB4S+eWHJUOGTy+98MUIJ1XxXyLB12A4aidtC+Rm7f3Z7qKJbKs6lyGEbEMfPLrNRo
	 jLmkYeePUbZrY/Mjt+hepz/rIDIXRCAB+jVZVtFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D704DF80086;
	Sun, 24 Oct 2021 16:07:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98BE2F802C8; Sun, 24 Oct 2021 16:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SORTED_RECIPS, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6787F80086
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 16:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6787F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FExO0P6X"
Received: by mail-lj1-x22c.google.com with SMTP id r6so3972026ljg.6
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2xg8b0PhImUgFD1vlcegBC3Dkb/ADebVx1OoidLwJVg=;
 b=FExO0P6XGeA99jiK3jYyzGzYwfir+9cK3AbnVKHG0jw8cklwsMepg+lvdP/ng/WkJw
 Z0Brf2IZGrAmoWOnZCJabD0mAkYYPL7q4pSOmlQfvJBIPRGdcwKHIFAcZEW2IOQ+VBuX
 4H8rwZ4R/hKgIrHTOx5eXUWV9kr/a0PrlxGWMR/iovA/DX+CB5Ri6CBN7wpLYMzPh19i
 n15PCbbMYzY42y1vxxOJgZ1QPz8azrgWKoKuOPImlBIzXh8n9LzbaCVRLPt2RSt1mhC4
 KpsYSbvh/IQhUCTutjn5jLe/dNBW3b9q9bKTL1fKngILL04w/d57mLGvuQ2TNeGqIB5p
 AhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2xg8b0PhImUgFD1vlcegBC3Dkb/ADebVx1OoidLwJVg=;
 b=th0t4OuSwts7vBjjkCprJsMgoMNRFb1/QaeSpfKUgvZNvXOI7uuEkyVHShu+HNjjf/
 6A7DSNClE8EKKTs9KynodFj8VKnBrJ5a6yGM3zm/IVqobYg/lA3+M/ef7vJ0oUmYCdQa
 7y+nuq0I5wq2bz7MKP2o84S0PBwxRnnjgqIVmQvuz9axGxhdtJguxLka+4DQCZYXTub+
 bJl+v/7MAdsh+8fhu8HaxCMp/VmvYCnyJEHt41NnAeOpn9QoSYE5Zp47rPYe8mRI9rvm
 nSPvavMhGKEwLWUJdTHbNtfjob/VlTUHiivXImrCrg3mt+Zm1jrU9lSQ5zh8OGiAwrln
 eZag==
X-Gm-Message-State: AOAM5308iwDHIVhhdUJCHMRt0H+C1LQjCW/xIsQB5AgXfBfM19ZFJqHR
 3AxXwMhzMVktSrJJm24zKfw=
X-Google-Smtp-Source: ABdhPJxmkRTwgt82Aprhr0dbm9VZy5cvpqlWfDoGR/+Iaj57ZsQhuowrE5c6LYnNo9oAKm8YXTZ55Q==
X-Received: by 2002:a2e:2e03:: with SMTP id u3mr12779117lju.269.1635084464059; 
 Sun, 24 Oct 2021 07:07:44 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
 by smtp.gmail.com with ESMTPSA id g18sm813835lfv.25.2021.10.24.07.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 07:07:43 -0700 (PDT)
Message-ID: <b6ec6d46-1eb8-42c1-33ab-0142dd142c84@gmail.com>
Date: Sun, 24 Oct 2021 17:07:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [syzbot] possible deadlock in snd_mixer_oss_ioctl1
Content-Language: en-US
To: syzbot <syzbot+ace149a75a9a0a399ac7@syzkaller.appspotmail.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org, joe@perches.com,
 lars@metafoo.de, linux-kernel@vger.kernel.org, perex@perex.cz,
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, tiwai@suse.de
References: <00000000000067a98805cf0a3a98@google.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <00000000000067a98805cf0a3a98@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/23/21 22:35, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    cf6c9d12750c Add linux-next specific files for 20211022
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=15d3d4c4b00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e694204255ade3a3
> dashboard link: https://syzkaller.appspot.com/bug?extid=ace149a75a9a0a399ac7
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c0530cb00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1129c952b00000
> 
> The issue was bisected to:
> 
> commit 411cef6adfb38a5bb6bd9af3941b28198e7fb680
> Author: Takashi Iwai <tiwai@suse.de>
> Date:   Wed Oct 20 16:48:46 2021 +0000
> 
>      ALSA: mixer: oss: Fix racy access to slots
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=167f6454b00000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=157f6454b00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=117f6454b00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ace149a75a9a0a399ac7@syzkaller.appspotmail.com
> Fixes: 411cef6adfb3 ("ALSA: mixer: oss: Fix racy access to slots")
> 
> ============================================
> WARNING: possible recursive locking detected
> 5.15.0-rc6-next-20211022-syzkaller #0 Not tainted
> --------------------------------------------
> syz-executor206/6529 is trying to acquire lock:
> ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_set_volume sound/core/oss/mixer_oss.c:316 [inline]
> ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_ioctl1+0x630/0x19a0 sound/core/oss/mixer_oss.c:375
> 
> but task is already holding lock:
> ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_set_volume sound/core/oss/mixer_oss.c:300 [inline]
> ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_ioctl1+0x4b1/0x19a0 sound/core/oss/mixer_oss.c:375
> 
> other info that might help us debug this:
>   Possible unsafe locking scenario:
> 
>         CPU0
>         ----
>    lock(&mixer->reg_mutex);
>    lock(&mixer->reg_mutex);
> 
>   *** DEADLOCK ***
> 
>   May be due to missing lock nesting notation
> 

Looks like typo in previous ALSA patch. [1] should fix it


[1] 
https://lore.kernel.org/alsa-devel/20211024140315.16704-1-paskripkin@gmail.com/T/#u




With regards,
Pavel Skripkin
