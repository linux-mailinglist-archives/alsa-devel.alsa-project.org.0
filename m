Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C182A4F43
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:45:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF00916A5;
	Tue,  3 Nov 2020 19:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF00916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604429151;
	bh=nqJcK7z6fW2gaGhBcJaK7L9r5GVXzUYt4lWsOm7m6d8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtKfRpBPzKqp+Npnr9cwJTZYyh1INKTOnDjWxaDu3FsJm2meQrhSv9+aKW1AItJzo
	 Nl21iChfdBG5cbDGnLjjfEqYsOB5pS0u/S8p1nMSiG4sUkGqItP0U8nad6TnOJ6TYw
	 aFDdR8HITjwJHTKYL7J+OPkhOsHKYrJ63jsI1K1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB24F80272;
	Tue,  3 Nov 2020 19:44:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06FCF80171; Tue,  3 Nov 2020 19:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1B9FF8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1B9FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ROcZhdHH"
Received: by mail-oi1-x242.google.com with SMTP id m143so10073483oig.7
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 10:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mfAz1Vy4O/8YuJ+ZZubYSwh7lrJ05uaNXt9Z224izVc=;
 b=ROcZhdHHSIby5OmuTu5VDU49ZCXInxCMdllsvJUMIY/CzCeH/1ole2YXkPnQ1KBWrq
 2PVzWZem0WOhuqdNcW2biZLxcb8oKLXTePK/Yzv1KF6W99Fc7/phM3vuqRL6XKuMbBkA
 wlOA/gy0T+sW3FmV7c59Y41KD1JhFVva8o93egE3z6Z5i2xtzggF8Q6mI/SrPLtXYtLa
 O+UNax2qdnPuqnDwAgaATZApF1ddwHobf7zHMNB0Idm1STVHlomJ0WTmZkee2DJ3BYo2
 jcETc50ifbO28LZIrqsn8M0O+La9NixksBElGCLTQTysbBrjQDd+Pl/qDJevZN9ZIAM1
 f01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mfAz1Vy4O/8YuJ+ZZubYSwh7lrJ05uaNXt9Z224izVc=;
 b=owBZP3oW09IuG00xAB0LtjpJ6sw4cNh/rUlm+BaEIdrS0FQExNY+337Z6VQke7/2GG
 P3VOzn1l0dsOwOPz7meEeMi9P/LK1vhSzvYgKBkNfzme7M9hVYSmtwHZlXYKdePtFWpJ
 PbsxBZTQ6u1lqc+DuAV13cWNNmpOscTYF9AwIFKRMNEQplYci/bsGTEBUaF9ZzYDX//y
 v79R2bRdz/JStHD2CT3RQOvR5H1ueueVNtGGmfBCFRDgbUOFS+Ba3K7ZF8PLm8HM0FWl
 8J5lKQi7Cz+mm2fmf2ryf3Xy04uypzLgdSWuzAeT5SyiGg1HbRnY0XaMioXzsjVGYAvN
 GX6Q==
X-Gm-Message-State: AOAM5300NoD5eNUxxLuSTUVyJb2x3kgbvdhiYpnWYVsUiwLDv5OhaCiN
 Tbn6XBrNBqmM7XjV9S3zR4s39IyCstAuy2DsKrs=
X-Google-Smtp-Source: ABdhPJxtAfVT/bdUXtQ1P30c0HC0PeqSlfDpWN8zVjrsmSchO8IjvMOmy0eSZKBG8LOT4RgHBIOHlF1LpLXOinsN5LM=
X-Received: by 2002:aca:b141:: with SMTP id a62mr296610oif.101.1604429046564; 
 Tue, 03 Nov 2020 10:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20201102071154.23563-1-yuhaobehappy@gmail.com>
 <s5himamoacp.wl-tiwai@suse.de>
In-Reply-To: <s5himamoacp.wl-tiwai@suse.de>
From: Yu Hao <yuhaobehappy@gmail.com>
Date: Tue, 3 Nov 2020 10:43:55 -0800
Message-ID: <CAM0=KirN+ALL=kzQsV2CenBcUNAgP6pQTZaSTEC+oimWmrkjSg@mail.gmail.com>
Subject: Re: [PATCH] sound/core/seq: remove dead code
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

Yes, I can do that.

And a quick question, to resubmit with that change means that I should
create a new submission and this one ends, right?

Thanks.

On Tue, Nov 3, 2020 at 5:09 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 02 Nov 2020 08:11:54 +0100,
> Yu Hao wrote:
> >
> > The function snd_seq_queue_client_termination() is only called from
> > function seq_free_client1(). The seq_free_client1() calls function
> > snd_seq_queue_client_leave(), which deletes all objects whose owner
> > equals to client->number in global array queue_list, before the function
> > snd_seq_queue_client_termination(), which checks whether there are
> > any objects in global array queue_list whose owner equals to
> > client->number, with the same argument client->number. So
> > the checking code in function snd_seq_queue_client_termination() is
> > dead code. Remove those dead code.
> >
> > Signed-off-by: Yu Hao <yuhaobehappy@gmail.com>
>
> Actually the whole function snd_seq_queue_client_termination() can be
> removed.  It's a quite old code and I don't remember clearly, but I
> guess the intention was to call this before the actual queue
> deletion.  OTOH, it doesn't make any sense to change that order any
> longer, as the snd_seq_queue_client_leave() already takes similar
> procedure anyway, so let's rather wipe off the useless function.
>
> Could you resubmit with that change?
>
>
> thanks,
>
> Takashi
>
> > ---
> >  sound/core/seq/seq_queue.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> >
> > diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
> > index 71a6ea62c3be..91b3f3295d0b 100644
> > --- a/sound/core/seq/seq_queue.c
> > +++ b/sound/core/seq/seq_queue.c
> > @@ -545,21 +545,10 @@ void snd_seq_queue_client_termination(int client)
> >       unsigned long flags;
> >       int i;
> >       struct snd_seq_queue *q;
> > -     bool matched;
> >
> >       for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
> >               if ((q = queueptr(i)) == NULL)
> >                       continue;
> > -             spin_lock_irqsave(&q->owner_lock, flags);
> > -             matched = (q->owner == client);
> > -             if (matched)
> > -                     q->klocked = 1;
> > -             spin_unlock_irqrestore(&q->owner_lock, flags);
> > -             if (matched) {
> > -                     if (q->timer->running)
> > -                             snd_seq_timer_stop(q->timer);
> > -                     snd_seq_timer_reset(q->timer);
> > -             }
> >               queuefree(q);
> >       }
> >  }
> > --
> > 2.17.1
> >
>
