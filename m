Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3234FB9D0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 12:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49B816D9;
	Mon, 11 Apr 2022 12:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49B816D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649673382;
	bh=WJmHIh3VjK4N3DfBYhe2Q76B/v6fEprhCir6KjGE8lk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQqvkw8JahyoqVINP4vNPfU1RmPRY6x1gZYWlEXmqBJNkWLsEmY1RWL1K/4LFiHQq
	 JVgs/L4gG0VC08N64v/S4iBC1tscVMtwDcO/hgoyj9YJiHF09UAThLzQSfs/eauGap
	 6keVIpaz25uaI5/PviJbqE+EhsrFrvMYVBCcbxW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C45F8032D;
	Mon, 11 Apr 2022 12:35:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF6D6F8011C; Mon, 11 Apr 2022 12:35:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C651F8011C
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 12:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C651F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nsP9/lNa"
Received: by mail-pf1-x431.google.com with SMTP id z16so14245443pfh.3
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+2f7Abc00wPGCUaOzHgs4cliFCaq+b85+1pgNfFOUw=;
 b=nsP9/lNa1p6mkmttdJL8bAdKCkQhON94LcD76TtZTldX0FYDD2BRfgS2MCjrN40/G2
 WOtJVsWLjqyT3hKJ4i7qVq4/Y8MHqZAKVLerLdIxJaM1xXX82rNtvrN9qmelsHjDTYrc
 dDxt4EC+mHtiGGwQ8aKjybT9yZkzYLHexCc8s6zGZEJjxDDy/LxugtFytkWQ4eEggPWh
 nboQjVoHg9RycawUFKLDoIZ27P1J+GKVxtQyj1XslNclAAzPAj0Afka/cKSxGWiPkBib
 PEnhor6KZpHhYMhQAmiAY8aZqEXGthRnSA7qCdgD1DNjt4vfnGF71JECCV8DzQ0jcAMH
 318g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+2f7Abc00wPGCUaOzHgs4cliFCaq+b85+1pgNfFOUw=;
 b=TRK2GxFJ9fZbkGBD+O5NYnqCWCTDOQGJDQTaHW/qpwK+cmsH8UFm+F419aDaFCEwG7
 BNzyHrC0pEahPQ5164fxb500nXsY0qZpqpbiKTA7OBfZCllBmwaA/T3QL++RX/mJngFJ
 zJng3dGFayQqHFLJUs4Pn44pPXuuoCDJo9M/Qy0tDsnUGr/+RzniPokXRcwZcEetO5uh
 tlkTcLXAxch6oyYbuL9PDtFb7/h1EuIicL8AYqwboVNN1nwIN9TkJ4zbKVGRg5Kvdbv2
 QjhbBHcjsXlgEk84OdLxpMcgsBJXAv/H0yNtTrB8XYpZ8SL0fVz6VTwfh94PlRG43tvC
 AR6g==
X-Gm-Message-State: AOAM531JNghZ9AhV5Eq0bRJ22cIcJGfGwWQvzuS6OGQft00+1bqBeARE
 MCKF55vf/SVi9a2UyEun7jjgkti4Hijt0dx79g==
X-Google-Smtp-Source: ABdhPJxG+CRHg/FH/WEFO7yrrptD7wJGkDoNJFoGqpXLMitue3imgpkMlqtC5Zwwf2F7U7XRqd0UBfwLEOXwUaq7O+M=
X-Received: by 2002:a63:ce45:0:b0:399:1124:fbfe with SMTP id
 r5-20020a63ce45000000b003991124fbfemr26375616pgi.542.1649673307723; Mon, 11
 Apr 2022 03:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjm2AdyEZ_-EgexdNDN7SvY4f89=4=FwAL+c0Mg0O+X50A@mail.gmail.com>
 <s5hk0bwcbjh.wl-tiwai@suse.de>
 <CAMhUBjmr_mHcz2G0tQ2qktGFw6XDLJiDTAHvM1yoRWzvtA6MYg@mail.gmail.com>
 <s5ha6csc7lq.wl-tiwai@suse.de> <s5h7d7wc75u.wl-tiwai@suse.de>
 <s5h35ijdiab.wl-tiwai@suse.de>
In-Reply-To: <s5h35ijdiab.wl-tiwai@suse.de>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Mon, 11 Apr 2022 18:34:56 +0800
Message-ID: <CAMhUBj=yiAtbYmGDuaBrSxNMrxz6S8DJotwTLihcs64JSOQuVg@mail.gmail.com>
Subject: Re: [BUG] ALSA: echoaudio: warning when the driver fails to probe
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, Apr 11, 2022 at 6:30 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 11 Apr 2022 11:15:41 +0200,
> Takashi Iwai wrote:
> >
> > On Mon, 11 Apr 2022 11:06:09 +0200,
> > Takashi Iwai wrote:
> > >
> > > On Mon, 11 Apr 2022 10:49:53 +0200,
> > > Zheyu Ma wrote:
> > > >
> > > > On Mon, Apr 11, 2022 at 3:41 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > > >
> > > > > On Sun, 10 Apr 2022 11:13:55 +0200,
> > > > > Zheyu Ma wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > I found a bug in echoaudio.c.
> > > > > > When the driver fails at the function snd_echo_create(), it should
> > > > > > release resources requested before, otherwise we will get the
> > > > > > following warning:
> > > > > >
> > > > > > [    3.262866] remove_proc_entry: removing non-empty directory
> > > > > > 'irq/21', leaking at least 'snd_indigodj'
> > > > > > [    3.263577] WARNING: CPU: 3 PID: 261 at fs/proc/generic.c:717
> > > > > > remove_proc_entry+0x389/0x3f0
> > > > > > [    3.267098] RIP: 0010:remove_proc_entry+0x389/0x3f0
> > > > > > [    3.269976] Call Trace:
> > > > > > [    3.269979]  <TASK>
> > > > > > [    3.269988]  unregister_irq_proc+0x14c/0x170
> > > > > > [    3.269997]  irq_free_descs+0x94/0xe0
> > > > > > [    3.270004]  mp_unmap_irq+0xb6/0x100
> > > > > > [    3.270011]  acpi_unregister_gsi_ioapic+0x27/0x40
> > > > > > [    3.270017]  acpi_pci_irq_disable+0x1d3/0x320
> > > > > > [    3.270025]  pci_disable_device+0x1ad/0x380
> > > > > > [    3.270034]  pcim_release+0x566/0x6d0
> > > > > > [    3.270046]  devres_release_all+0x1f1/0x2c0
> > > > > > [    3.270057]  really_probe+0xe0/0x920
> > > > >
> > > > > Could you try the patch below?
> > > >
> > > > The following patch works for me, the previous warning disappears, thank you.
> > > > But I got another error, I have no idea about it.
> > >
> > > OK, that's bad, it's basically the destructor order problem.
> > > Could you try the patch below instead of the previous one?
> >
> > Sorry, the below one instead.
>
> Err, scratch this one, too.  It's a deeper problem than I thought.
> Will post a revised patch later.

Yeah, you are right, these two patches do not work, I got the same
error message.
Thanks for your effort.

Zheyu Ma
