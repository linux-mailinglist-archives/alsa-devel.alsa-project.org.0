Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CD333A0D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 11:32:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31868177F;
	Wed, 10 Mar 2021 11:31:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31868177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615372324;
	bh=WSsjl1gJhoVxvY051YguqBJ81pVpR0m8sjoZ1gEVo+c=;
	h=Date:In-Reply-To:Subject:From:To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sfaJwHICv3OdQL6FBE9kVRG8qxQ8UGx9ZpOtQDH8cg3MF54EQYnRYNle8WCNiAEUi
	 LglBBSX2r4j/n7mmZHnq5sn4VuAFhQgfAtOxSuY6JUiO64Fhko5jRIPzneRCSPjBYO
	 agG7HlmthqTvkWOGD9GFA/B0Qd/4u8hqhO/kc+pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD10F80279;
	Wed, 10 Mar 2021 11:30:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A08F80256; Tue,  9 Mar 2021 13:23:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAEF8F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 13:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAEF8F8014E
Received: by mail-il1-f199.google.com with SMTP id s4so9952230ilv.23
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 04:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=M/RPd9O6HlovCufiu46RnKolcjArBQRjys4GfdnCY9Y=;
 b=Fh0Bzv8IK4wpfnl1MV+VWkVo/SSdA/7TH3cGsg+Y0ISKTgM1LuBC0Rodc7rUqHi9CA
 KkrqqNEWayJ5PQmk+60nyPPpHkF8Pl0c1LQIpz0aH/bKHpBgOTcW2zsCRX+9R5qt61Se
 PZDslixHcTOe72lM/aNvJXc3L2Ln7sF8HV5me6g7CI9/qQDqz5ji+7QXiBenhglr0SCh
 tAvipJyancBZwzeY7BJzVdSycQSQQsHBqlLUA75k9nBxjO0X7Sq/f7CMtzR7MFwhMecp
 RLMc5AunTPeRbwa040ri+W5Lr0f0s7a15vbQpjS0eE8amYf5sKZxd7DDJcFtx9SUSsnd
 W5RQ==
X-Gm-Message-State: AOAM53217652upPWWmiCvy8oPlY0xtsOwFUuTvDrYdThk013BK/dyo0U
 +9blIvP+ngu+T1CWgT84rpv4B601v/6AGX+FqHCCBrbgva3t
X-Google-Smtp-Source: ABdhPJyNbAfn3ELXKhDpYktoUJpXSgAh/3+Hi1LL95lbpxXNaGiAcRPJLwUHSCy+GbRzgi1MwgNPil0m+dAgNsZgI9LiYHTK9OvG
MIME-Version: 1.0
X-Received: by 2002:a02:a90f:: with SMTP id n15mr28656031jam.110.1615292583929; 
 Tue, 09 Mar 2021 04:23:03 -0800 (PST)
Date: Tue, 09 Mar 2021 04:23:03 -0800
In-Reply-To: <CACT4Y+bWYQu3h8pJaX4GS1JdJpPheE416TJH4=K5zOaseAH4Fg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac694305bd199c9c@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in usb_audio_disconnect
From: syzbot <syzbot+@syzkaller.appspotmail.com>
To: "'Dmitry Vyukov' via syzkaller-bugs" <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 10 Mar 2021 11:30:10 +0100
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, syzkaller-bugs@googlegroups.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, kai.heng.feng@canonical.com
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

> On Tue, Mar 9, 2021 at 12:38 PM Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Tue, 09 Mar 2021 12:32:18 +0100,
>> syzbot wrote:
>> >
>> > Hello,
>> >
>> > syzbot found the following issue on:
>> >
>> > HEAD commit:    4641b323 Add linux-next specific files for 20210305
>> > git tree:       linux-next
>> > console output: https://syzkaller.appspot.com/x/log.txt?x=103252ead00000
>> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b87b6a083d302a90
>> > dashboard link: https://syzkaller.appspot.com/bug?extid=ffad4c74b3b3ea3aa9c3
>> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1122d35cd00000
>> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f6476cd00000
>> >
>> > The issue was bisected to:
>> >
>> > commit 9799110825dba087c2bdce886977cf84dada2005
>> > Author: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> > Date:   Thu Mar 4 04:34:16 2021 +0000
>> >
>> >     ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()
>> >
>> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166d91ead00000
>> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=156d91ead00000
>> > console output: https://syzkaller.appspot.com/x/log.txt?x=116d91ead00000
>> >
>> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> > Reported-by: syzbot+ffad4c74b3b3ea3aa9c3@syzkaller.appspotmail.com
>> > Fixes: 9799110825db ("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()")
>> >
>> > usb 1-1: USB disconnect, device number 2
>> > ==================================================================
>> > BUG: KASAN: use-after-free in usb_audio_disconnect+0x750/0x800 sound/usb/card.c:918
>>
>> This must be fixed by the commit that was already merged to sound.git
>> tree today:
>> c5aa956eaeb0 ("ALSA: usb-audio: fix use after free in usb_audio_disconnect")
>
>
> #syz fix: ALSA: usb-audio: fix use after free in usb_audio_disconnect

I see the command but can't find the corresponding bug.
Please resend the email to syzbot+HASH@syzkaller.appspotmail.com address
that is the sender of the bug report (also present in the Reported-by tag).

>
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/CACT4Y%2BbWYQu3h8pJaX4GS1JdJpPheE416TJH4%3DK5zOaseAH4Fg%40mail.gmail.com.
