Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49C509A08
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 10:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B822D1679;
	Thu, 21 Apr 2022 10:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B822D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650528335;
	bh=xBLVtKBkxhA7vUTGkLo2Qk7NED6rChp778MQVSEaTUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QA7MI90GuLi2prHfhlvQoABrLQr3MPvSmKQPc3yd1gF7qAFb5bOAUho4h79s3H3Vy
	 1/bKhxIsgb8n+NJvbFtuU26C/7tQuhVAxQJaybA9Ir37oXsfpP5AaV096VhbTC8SNu
	 ZBd0bRxWdRZ89FQ0wmeeyrrraL/BgGnWCACKpxZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C702F8047D;
	Thu, 21 Apr 2022 10:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE76F8032D; Thu, 21 Apr 2022 10:04:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02545F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02545F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DW5A8Nyr"
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e2442907a1so4631529fac.8
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BVjlGwH06cTyu6muXsNBsyVK6oxj3UYMa0frNggqds=;
 b=DW5A8NyrPu5kmtG6ZlwJsLfXNpG7VuBOeXgRhetvMBOfIpBJZ74ru8E03tjXxmvd+X
 aTPl5MB8ba9gBc2hX7NQogMvyWug9swFGeE6el5EXsMuiVASFXiATSgRsneQ7tant1Ny
 VsMSqP+yIbaMr8wWKqnDkjIRglGy/D6RQRzmmF08jDIB2uxobioRu0OouR6mGKOfmxAx
 3T7JXsBZoaBjSw70q6iUm5umC9UUyMIY+Rbo5405g77+oTYcx1d62W7AtAWgp2as7pnp
 htTdHxQt54wmw5KjhS2D6TVan8zS24RfO1Bf5JTZAqX3LhusLoz4k/SaUvktAw7xycvG
 p0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BVjlGwH06cTyu6muXsNBsyVK6oxj3UYMa0frNggqds=;
 b=FEz/q4qYulE4BrNHw0d4jaTgdt75ehsYxl1hi3vbNAOEzn3L0T5reCp9ijwwwYFesM
 jRlqrlI+HVZB/M049jeDkjOOQwz26pFmMd79a3EewGeoyZ2wzKr0cUzhq419cX6SrSZU
 C+td3wlIaNVLCjUYFMBs+TrQyQSWDyzAF0scNdezZrqAh06YRL5NK81TeUFe6rkS05bB
 W4TrYXXPPzrWK74bqO/y/lOn1PszBgWLsQuUZGnrykM5R8AUpwPEw+Ey29gbRIOTl0tZ
 nfBMo/kxk6aZfCJgu63JMwAK9fwQYOW1MBQaRCOnJxQv1IGHapMyElTftz3yvPiN1VFB
 RGNg==
X-Gm-Message-State: AOAM530Mazxz09ReY6KHg6qe9iUPgT+dZgGj7SK0jF20EjuarrqeuE/t
 FxUlp+6ZW8QoOwdXQCtzO7QLxoAMx1pL4bxIUuH2vw==
X-Google-Smtp-Source: ABdhPJxWY3/xQrMA/LGLDcUbYJsNHYAuaDCQ0ZZwkR5qeQGTshY+L+HBii+8hjXoK0Sn1TiQp41iyOWJUdQus1maen8=
X-Received: by 2002:a05:6870:d254:b0:db:12b5:da3 with SMTP id
 h20-20020a056870d25400b000db12b50da3mr3327530oac.211.1650528266235; Thu, 21
 Apr 2022 01:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004ecea505c28504b9@google.com>
 <0000000000007b1cbd05dd1cab5a@google.com>
In-Reply-To: <0000000000007b1cbd05dd1cab5a@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 21 Apr 2022 10:04:15 +0200
Message-ID: <CACT4Y+ZWAFKBCnj18n8g8KsrQL9bxO7uCMmcQjk8-24G_caZHw@mail.gmail.com>
Subject: Re: [syzbot] general protection fault in pm_qos_update_target
To: syzbot <syzbot+f7d9295d2565ee819d21@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: len.brown@intel.com, alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 tiwai@suse.de, syzkaller-bugs@googlegroups.com, tiwai@suse.com,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, pavel@ucw.cz
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

On Wed, 20 Apr 2022 at 23:28, syzbot
<syzbot+f7d9295d2565ee819d21@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 3c3201f8c7bb77eb53b08a3ca8d9a4ddc500b4c0
> Author: Takashi Iwai <tiwai@suse.de>
> Date:   Tue Mar 22 17:07:19 2022 +0000
>
>     ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=104e3034f00000
> start commit:   dbb5afad100a ptrace: make ptrace() fail if the tracee chan..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=91ff0467ce169bc
> dashboard link: https://syzkaller.appspot.com/bug?extid=f7d9295d2565ee819d21
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c75e73d00000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection


Looks legit, that code is in the stack trace:

#syz fix:
ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls
