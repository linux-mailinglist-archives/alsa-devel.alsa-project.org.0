Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D92EC53B350
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 08:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708C3173A;
	Thu,  2 Jun 2022 08:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708C3173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654149920;
	bh=Y7w3d92XGeFFvDmE+HLtU40ycl0DRGFCTYc4jauPBJ4=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GwueXZPacPQXmxgqYN0gBXATexDB9s5jLzBm4gKMzGOJB7dI2GDDhYozb2S3752Zi
	 TsESmjVsf8Kmn6YQlAypGaIMvpXda3l1PlC7t7XZDOPtOQXbscfKppbbY2M6W1txYE
	 2xD30l1ru+la16iRIMefAFvi9TAOVInRxnddP8ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E6B2F80425;
	Thu,  2 Jun 2022 08:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48AF4F80089; Wed,  1 Jun 2022 17:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FAEEF80089
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 17:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAEEF80089
Received: by mail-io1-f71.google.com with SMTP id
 l9-20020a5e8809000000b0065e534ca51dso1064565ioj.17
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 08:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=9C0QKRdIGPxqD8mQkX79ef3/DgDP49Pnes0coHe5ULQ=;
 b=O/XKgm8joGKhIwVakFso2PClU4XZjgkeM3dGYGyZcinoDN+4xfmKohqVc8kCbtaBAb
 IpWVqSTIMD55yjtavCD0oHML+5W6wl3OZvZ4h7KR/jdvQn1sbrGi6cl3kJwFy40WEhmw
 YpF74c5JDQlKJiXEWAUtbFHtB4uMJM+5yuqH7bgps8GFXAiSF6WHIp7t4mz01mOA95Jc
 dJJAxozzcRiHBNgTrFROWXmsVk5jbG779L37MM7RATcl3VrDotpMckZ9Y2Kf+xzc8vCq
 if0RDrtHN5lYgOF+kMzQLC3X0V8SHoX820TIYrFCcx3SbojIoSz0EfukD0ofsKrs09wX
 BVEQ==
X-Gm-Message-State: AOAM531+EtrP+SbtqtiP4mg7c9eJXM+xWwEkyP9QRX7i9uV0nH1hzUMe
 nKqoLcmHjxEp2FkLCJXnfWbCxplr+lgxvHYqqOyTdo7KteYk
X-Google-Smtp-Source: ABdhPJydphbmRxiHh6D6NWeiIDvir3a/DSN7vD5vVzYJCqeN6VMWeE+V2eQdNwlR3fM5UvfRemMkbxoJrDxwzUY0B6olKGfuCsX5
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2388:b0:330:135c:5568 with SMTP id
 q8-20020a056638238800b00330135c5568mr242450jat.126.1654097708550; Wed, 01 Jun
 2022 08:35:08 -0700 (PDT)
Date: Wed, 01 Jun 2022 08:35:08 -0700
In-Reply-To: <000000000000915bd505ddaff576@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000578e0105e064a230@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in snd_rawmidi_transmit
From: syzbot <syzbot+39e3268af9968f153591@syzkaller.appspotmail.com>
To: alsa-devel-owner@alsa-project.org, alsa-devel@alsa-project.org, 
 anthony.l.nguyen@intel.com, coding@diwic.se, colin.king@intel.com, 
 hdanton@sina.com, linux-kernel@vger.kernel.org, naamax.meir@linux.intel.com, 
 perex@perex.cz, sasha.neftin@intel.com, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 02 Jun 2022 08:03:49 +0200
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

syzbot has bisected this issue to:

commit d098538ed4e8a6c09f86cf243f406c1451066040
Author: Sasha Neftin <sasha.neftin@intel.com>
Date:   Mon Mar 21 06:05:10 2022 +0000

    igc: Remove igc_set_spd_dplx method

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16458313f00000
start commit:   2a5699b0de4e Merge tag 'leds-5.19-rc1' of git://git.kernel..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=15458313f00000
console output: https://syzkaller.appspot.com/x/log.txt?x=11458313f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f915857c44e13980
dashboard link: https://syzkaller.appspot.com/bug?extid=39e3268af9968f153591
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119d1fcbf00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17716bedf00000

Reported-by: syzbot+39e3268af9968f153591@syzkaller.appspotmail.com
Fixes: d098538ed4e8 ("igc: Remove igc_set_spd_dplx method")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
