Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617F38C42A1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 15:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5621586F;
	Mon, 13 May 2024 15:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5621586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715608646;
	bh=rt5PATXtgqvidD0vIbThIoVaGgjahZKF8YuAO7DGNVs=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GQoBgTgD+3ZeXFlHPEeNNtWyAVnXDg90qq9tKSnzUbaQ8s++wiwI8n5/XhILqERup
	 mEobMGlLMAOoMuAFsRWBuX40NksCUAZGO+TgI/kO/vFEbRiizPWgEjyj83Lc88dDOc
	 Byio4nANmcmkFLM9o9OmALohb/dV9Dw6Vhsnum6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E90CAF805AC; Mon, 13 May 2024 15:56:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50141F805A0;
	Mon, 13 May 2024 15:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96EB0F8049C; Thu,  9 May 2024 16:36:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 357C7F80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 16:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 357C7F80152
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7deb999eea4so86556339f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 07:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715265363; x=1715870163;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X32bctqqt9YMYnQBW0Lg5lwXOgThd7oCwO6YJh7J808=;
        b=eNYt2qMm4luFCmg+AAUrHxXGYfVc7PSprPJlEYPnJpc89HkpOA3Ds3ufzkciKVEIWz
         hbNYBSAA007yjqDHhnx4JmryYXk7V6/lTyKjPg0abvJ4F6tc+iwqsQn9hTT5ErZDe9uS
         SC5fvJpsDmbBxUKIaVllaI6mVuzGtnajK0fXGG0FvV5tUUK1dVYcEoY3Xqud7PjclpMs
         Ie3jbalLZnd/kgOiE3fHpTpJWvi5r09KDaSqEMsE7tvX1WojIpjkSIqU24Y1FLhV8nhg
         71ZUWpoqWIXLYmFcfogr2KjLk9sqxlpLYilcUuFZ+3Idj9E5jYOxGxBR5q6iHa3cD0bH
         hkSw==
X-Gm-Message-State: AOJu0YxrMW8b46WFM1rhgtGOUQ53B+x0UUO9jfTIRjWN49kPI6o2Oo9A
	yTT4Prh3+Np3eCHKv3wmBUe13z6ITBe3djFT/NnATbkSQemNwVUhly2uizejRi0XF07Uyj9UqEO
	XSz/oV6vlxW5V3ZgY882NoAo7bkc25EcxOjDDvc9O5m4ZGqZ7tRMUhDk=
X-Google-Smtp-Source: 
 AGHT+IFimP6/xLNj6bRq14TVADGedsYjqOqb/Ip4x4SwfekNgdENtprvWAAa39kLDpMwHtQipO9EAyntjoMdl6ej5XC0oqgaAmGw
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3429:b0:7de:e75e:6170 with SMTP id
 ca18e2360f4ac-7e18fd9b171mr5574039f.2.1715265362643; Thu, 09 May 2024
 07:36:02 -0700 (PDT)
Date: Thu, 09 May 2024 07:36:02 -0700
In-Reply-To: <0000000000008ac77c0615d60760@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a2dd340618065661@google.com>
Subject: Re: [syzbot] [kernel?] INFO: rcu detected stall in sys_wait4 (4)
From: syzbot <syzbot+6969434de600a6ba9f07@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, lenb@kernel.org,
	lgirdwood@gmail.com, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	oder_chiou@realtek.com, perex@perex.cz, rafael@kernel.org,
	shumingf@realtek.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3Ut88ZgkbAD0rxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z6GC6CYZVGAQXD5VROLS5LWVVK4OTUFS
X-Message-ID-Hash: Z6GC6CYZVGAQXD5VROLS5LWVVK4OTUFS
X-Mailman-Approved-At: Mon, 13 May 2024 13:56:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6GC6CYZVGAQXD5VROLS5LWVVK4OTUFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

syzbot has bisected this issue to:

commit 51ea51b18904cd1a0fb244ce41dfd903c2ada628
Author: Shuming Fan <shumingf@realtek.com>
Date:   Fri Dec 23 05:58:46 2022 +0000

    ASoC: rt711-sdca: add jack detection mode for JD2 100K

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=123e6f88980000
start commit:   fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=113e6f88980000
console output: https://syzkaller.appspot.com/x/log.txt?x=163e6f88980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe78468a74fdc3b7
dashboard link: https://syzkaller.appspot.com/bug?extid=6969434de600a6ba9f07
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1091a5f6180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a22c13180000

Reported-by: syzbot+6969434de600a6ba9f07@syzkaller.appspotmail.com
Fixes: 51ea51b18904 ("ASoC: rt711-sdca: add jack detection mode for JD2 100K")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
