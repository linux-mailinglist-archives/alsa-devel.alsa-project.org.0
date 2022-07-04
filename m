Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFE5564F0F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 09:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B9016DC;
	Mon,  4 Jul 2022 09:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B9016DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656921149;
	bh=raPJ0HltWJiQR1XJH+KNJh6e17udYDMeFXu00szNN+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wr4JNvQbDZjeeDtgPAUPhR7nxe2k23o2LpIj+71suVxTSvKvROO4C9I5+xIYEcKTZ
	 YVa32oY5ITKeJZvNDyO1wZVAm5YLzag1AkXvJLzGk+cdef85W69B/GxAQbGSU6Ee80
	 O/1q0Eepxz0eevhRs4/OHKEGhxNU3Z3yQfv6qF5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 759E4F8016E;
	Mon,  4 Jul 2022 09:51:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A96F8014E; Mon,  4 Jul 2022 09:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 198E3F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 09:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 198E3F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HuoSzlhW"
Received: by mail-lj1-x233.google.com with SMTP id o23so10010019ljg.13
 for <alsa-devel@alsa-project.org>; Mon, 04 Jul 2022 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ULobm+VCN9QC0SiaWvcA/Mc/bgYryB1cayxPAIAM4E=;
 b=HuoSzlhWy/Sd+i86BsF1pudkVOgoNR4N+zJTiPoUiG1MqSW6eFjBf0mGa/8WcxBqZm
 2nGkpI4+j3aFejxTDspWTvVnGgl9OeZ/lRpLHYoyjlb4luahZ0J+VnwRDld7aVXs5j8F
 CAWCxtKlbdUASc3awyVKx7Wop4TNXb68axwZ+HAN6+fm5ZVUadBP8eQDrjLZSICkAxWt
 ZzzMn5ivdnEZC/wzUVdhbhnpi1BNB6qrdkyKjoJO7LFor45ACKW6R1UHk4cqDgOos6Ht
 CbSmUsO6yI2JoqLH5OBLWRyYQjjTwDb7f1IM+++HdXoZz5z4/1WdGylE6tHewGfPAour
 9cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ULobm+VCN9QC0SiaWvcA/Mc/bgYryB1cayxPAIAM4E=;
 b=KxgnJl1SiB75MODDcMr/6X6Xl6dcJdxkK1s8MC0nNYoup8kkxjk6PY9P9SOBbmetzE
 byRN+Hw8S/+B+PUmGGN2fi+vVsBRu2RVWsT0u8ovk8Q1RW2m3rGYqQG3f40YRsZuImAJ
 /PMmds4lDa+8QyWijrvfUq89vpsl+RqBIKEfULQm62fuvQAuwlXpFfRUxC0BevXo5t1+
 RZ7TzeD1QbDrPRYpvlZH7rahltBIVsurmaCy0aJGNEs5SrVTYipIcpEVfyvbMzf8Xlkn
 uPnzzM8T7Lcei8Dgx44vpJL34yrQrzDCdz7l07+xeK9roEyM9IAYVY+h0+fgjN2KzW5l
 BU1Q==
X-Gm-Message-State: AJIora9zUghkUMMbXstO3UhJsA5+MPoArbX9ybp1TQEDgk+jMYaw+CSp
 8/tlUOR1JakBPCosUXAX8TSeRgDNp+qBV7cHEYv1eA==
X-Google-Smtp-Source: AGRyM1sOWXkKniRiwLYzPvdXTy9IWV92rClhT6o0h8bt5CdVK8rEkWmvzY6hbqakopbii3/XQhmGjz/CFprgefSP43U=
X-Received: by 2002:a2e:924b:0:b0:25d:1e72:acf1 with SMTP id
 v11-20020a2e924b000000b0025d1e72acf1mr2669714ljg.92.1656921086661; Mon, 04
 Jul 2022 00:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000915bd505ddaff576@google.com>
 <00000000000049a18105e2c34a0c@google.com>
In-Reply-To: <00000000000049a18105e2c34a0c@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 4 Jul 2022 09:51:15 +0200
Message-ID: <CACT4Y+bZPUDMR50mYSG5s=ABw54_JpHEWSgNDm8TSAQkpyJryg@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in snd_rawmidi_transmit
To: syzbot <syzbot+39e3268af9968f153591@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, coding@diwic.se, naamax.meir@linux.intel.com,
 tiwai@suse.de, syzkaller-bugs@googlegroups.com, tiwai@suse.com,
 clemens@ladisch.de, hdanton@sina.com, alsa-devel-owner@alsa-project.org,
 linux-kernel@vger.kernel.org, sasha.neftin@intel.com,
 anthony.l.nguyen@intel.com, colin.king@intel.com
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

On Fri, 1 Jul 2022 at 21:21, syzbot
<syzbot+39e3268af9968f153591@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0125de38122f0f66bf61336158d12a1aabfe6425
> Author: Takashi Iwai <tiwai@suse.de>
> Date:   Wed May 25 13:12:03 2022 +0000
>
>     ALSA: usb-audio: Cancel pending work at closing a MIDI substream
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1180b25c080000
> start commit:   2a5699b0de4e Merge tag 'leds-5.19-rc1' of git://git.kernel..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f915857c44e13980
> dashboard link: https://syzkaller.appspot.com/bug?extid=39e3268af9968f153591
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119d1fcbf00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17716bedf00000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: ALSA: usb-audio: Cancel pending work at closing a MIDI substream
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable:

#syz fix: ALSA: usb-audio: Cancel pending work at closing a MIDI substream
