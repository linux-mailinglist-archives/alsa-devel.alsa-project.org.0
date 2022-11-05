Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B562314C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75351690;
	Wed,  9 Nov 2022 18:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75351690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014451;
	bh=bMPiVjPgOgR+4IhsNCmluJ7RYQv3L+5OzdXjXtXDO+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9KG6jDzHcJavDtOjjZL10Phg3eDWq58/3EwvGMBa5w/QfjBfScWflNZKp2B1mkxo
	 vUbThVvobnnNm8ZjUDv9nKybutfV63luXsL6YQgeW5TEQERILXTbuC7SaFHLdalRzz
	 yl8WBBJ3Ww78sgqIL/6eZs7BNsswLZRKXR4G1wbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD580F805C5;
	Wed,  9 Nov 2022 18:16:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9166CF8042F; Sat,  5 Nov 2022 19:29:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1B94F8012F
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 19:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B94F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="DONWs6/F"
Received: by mail-qt1-x832.google.com with SMTP id h21so5022931qtu.2
 for <alsa-devel@alsa-project.org>; Sat, 05 Nov 2022 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+1YQb6nXk/q0EHljp4F8v1bXvbOovOAnj80btawKRAY=;
 b=DONWs6/FiwPtVJ4h9P9G1D+xI2OZ4sOZ++B4h9lOUr90grPUMADKKtOkyMNK85AsEf
 yHs4XotTZQfbZFXiKO1vIPQf4cjf9p2EEuLbIK2DwoG1VitJXDxI/Fg0k/P20CNhLtpT
 5yTAOviUwyDAlllMzqQFpJUoXjW0aoAYitY3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1YQb6nXk/q0EHljp4F8v1bXvbOovOAnj80btawKRAY=;
 b=XUeeDLnZBLrxX/HcbiRoRKyXHaJ9+yBLi6Hbr4htqcwQOa8E+tZqwiJ9TtMFTAByAV
 fm22x3jGF6C8orBAsu+7vcWbHnj5evqc4C280LNCTeUrN918ed7iH+/xlQQ0vuB3p4PC
 XYK0Fe8Hho+8lEo6XWOhKvVaqa5uYNyA0wcp1FYY3l6hSTv4Za7XV2zYzZff2U9RoRR9
 PPu0dMqupWqFGuhCv7NfI1hK1cbBau/kX3zA8WCVqO9P/Br8SaJZ8KgpTgyF5QKTjKK1
 yoe/i7vW5Mo3sJ3IpiTmEfwArLXghc+vGIO5hp010rDvm40/bgTkL/CgzSKiPo6oHIfz
 moFA==
X-Gm-Message-State: ACrzQf3YTqeZ2sqhL+Q8CvSs9bYWY0NhKy2iheV3T/6BTxpYAhHZrZlb
 aqswcWHMbWtt8ja6kHhOZm3PSPZ9pGieFw==
X-Google-Smtp-Source: AMsMyM4ootbOAOX9J+5OqSfWya+naMWqnrnVLGolcg7kwsOYIUjhK4pSqoJlzQ/It/6ASi38liGEZg==
X-Received: by 2002:ac8:7fc8:0:b0:3a5:7421:2222 with SMTP id
 b8-20020ac87fc8000000b003a574212222mr5076760qtk.444.1667672940524; 
 Sat, 05 Nov 2022 11:29:00 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 h18-20020ac85852000000b003a57eb7f212sm1150658qth.10.2022.11.05.11.28.59
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 11:28:59 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-3701a0681daso70960007b3.4
 for <alsa-devel@alsa-project.org>; Sat, 05 Nov 2022 11:28:59 -0700 (PDT)
X-Received: by 2002:a25:bb02:0:b0:6ca:9345:b2ee with SMTP id
 z2-20020a25bb02000000b006ca9345b2eemr26793220ybg.362.1667672929161; Sat, 05
 Nov 2022 11:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221105060024.598488967@goodmis.org>
 <CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
 <20221105123642.596371c7@rorschach.local.home>
 <20221105140356.6a3da628@rorschach.local.home>
In-Reply-To: <20221105140356.6a3da628@rorschach.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Nov 2022 11:28:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjnASLkTdPd+wxto2RBQH+S9MUm4FrNPWvU87opFG5SKQ@mail.gmail.com>
Message-ID: <CAHk-=wjnASLkTdPd+wxto2RBQH+S9MUm4FrNPWvU87opFG5SKQ@mail.gmail.com>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
To: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-afs@lists.infradead.org, lvs-devel@vger.kernel.org,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 bridge@lists.linux-foundation.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org, cgroups@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-bluetooth@vger.kernel.org,
 netfilter-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linaro-mm-sig@lists.linaro.org
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

On Sat, Nov 5, 2022 at 11:04 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Here's the changes I made after running the script

Please. No.

What part of "I don't want extra crud" was I unclear on?

I'm not interested in converting everything. That's clearly a 6.,2
issue, possibly even longer considering how complicated the networking
side has been.

I'm not AT ALL interested in "oh, I then added my own small cleanups
on top to random files because I happened to notice them".

Repeat after me: "If the script didn't catch them, they weren't
trivially obvious".

And it does seem that right now the script itself is a bit too
generous, which is why it didn't notice that sometimes there wasn't a
kfree after all because of a goto around it. So clearly that "..."
doesn't really work, I think it accepts "_any_ path leads to the
second situation" rather than "_all_ paths lead to the second
situation".

But yeah, my coccinelle-foo is very weak too, and maybe there's no
pattern for "no flow control".

I would also like the coccinelle script to notice the "timer is used
afterwards", so that it does *not* modify that case that does

                del_timer(&dch->timer);
                dch->timer.function = NULL;

since now the timer is modified in between the del_timer() and the kfree.

Again, that timer modification is then made pointless by changing the
del_timer() to a "timer_shutdown()", but at that point it is no longer
a "so obvious non-semantic change that it should be scripted". At that
point it's a manual thing.

So I think the "..." in your script should be "no flow control, and no
access to the timer", but do not know how to do that in coccinelle.

Julia?

And this thread has way too many participants, I suspect some email
systems will just mark it as spam as a result. Which is partly *why* I
would like to get rid of noisy changes that really don't matter - but
I would like it to be truly mindlessly obvious that there are *zero*
questions about it, and absolutely no manual intervention because the
patch is so strict that it's just unquestionably correct.

              Linus
