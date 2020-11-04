Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C72A6944
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 17:17:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1751685;
	Wed,  4 Nov 2020 17:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1751685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604506647;
	bh=3YmC8F8+NSacM5C+oqpGkGnY5wFyFKWEoeDbknESY+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3uN/IsjzMrcj6dAf5g8M6oJYIaqhMOJw4EcCJi+qvg6CtRaWaZaOS16FkFBCogJN
	 MFRVILVxCsly6FQBRBJKtrIrUOfjzGLrQYtfjNB2NFtZ4seQwqkHLqH0itC2IMpqMv
	 pFyp01mYgej4egSex3eyRsLrClHQoN4XIE5H5IXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E34BF8023E;
	Wed,  4 Nov 2020 17:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B63EF80234; Wed,  4 Nov 2020 17:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8487EF800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 17:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8487EF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bakChsoE"
Received: by mail-wm1-x341.google.com with SMTP id d142so2906708wmd.4
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 08:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2a4M0ec0hAnBu/PVHBPv80b8wAYKFHMKkLCWu0YtHGs=;
 b=bakChsoEHc96DmL1Kn6LOdTPHpv477ZeSxJMxh/hG7zeYCKHwdDjyO9s+y5t/4qCW/
 lPkRGGk+Es+BI5hy9Z+1qkl4GOFbi6aPZ7AVOinm+XQEWd1G6YgvFG9G7NZpwU3HX1T8
 iptpOBieDyPQORtcM900XQJrVmOtaCP4Iz+9DnTjmOROwdy4lNTkIwWpcgjK5zm9s/G8
 RrAQUXeigskrDcoOvG6Db5hGNnGimH05wzONN5IG/K1KZvLlPjjhrmX0WVvx/Vm2FXp6
 gdpvkMbnPA243qbIkF2T1rxRV2UXTuv/N9r0p9cSuTVW3rCM/BOXQXSh69m7wQo7uo0y
 3TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2a4M0ec0hAnBu/PVHBPv80b8wAYKFHMKkLCWu0YtHGs=;
 b=TWo6FWDaIe567c6tL4vOR0VQztNDNmCqqmKltMrnkvP93jQlcgmGNg03JAoLuz34iD
 zw18Vvg/3eEYbzlDRh/0rk6AlUNybXhrzvibKyN+cdG/SLtZdAHWzhh9yzaqMLTZ1dK7
 7jeQwloFhihCZHzhjsk3KgssFJ5OFE5KiqqSS620g4GNNkmuTnieXzidGmvfTAzEvNnE
 HKaLGjn/ZLuRLK0bv/cyLevfoTs1cT0DSpdWi5MFmBEmarS+MHLtg6tShUKmMlyg+M9p
 UWkoqAcJKBnWK7mK6f7waLW1TEyjvsGQufOmLtVjhG/q3zbiA5Q/rQILS4mywM/iwpLR
 TyKA==
X-Gm-Message-State: AOAM533K+9gEmwiQ9Z9YdpLK8zlWzWyLgmbsX0LLNbJu/l/GCAY6rkru
 OHxVSOfgHIZKDd0DNIFuDeqR2qE7e3EChpSFJTw=
X-Google-Smtp-Source: ABdhPJx2qtvufGt04YbFwpIm/qzyLJW9PPz3J+a6PuK2x2xcOkKWpkqVq/T8zjJPNbSPDLiGPMPxB3jIhPBfuGhxbBw=
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr5384089wme.171.1604506546401; 
 Wed, 04 Nov 2020 08:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20201103223335.21831-1-yuhaobehappy@gmail.com>
 <s5hft5plepd.wl-tiwai@suse.de>
In-Reply-To: <s5hft5plepd.wl-tiwai@suse.de>
From: Yu Hao <yuhaobehappy@gmail.com>
Date: Wed, 4 Nov 2020 08:15:37 -0800
Message-ID: <CAM0=KiqiY3_+jHoeMSnYNJuK5=W1zoimbJ+cP2JXj6O2Ne-eYQ@mail.gmail.com>
Subject: Re: [PATCH] sound/core/seq: remove useless function
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

Thanks!

On Wed, Nov 4, 2020 at 12:16 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 03 Nov 2020 23:33:35 +0100,
> Yu Hao wrote:
> >
> > The function snd_seq_queue_client_termination() is only called from
> > the function seq_free_client1(). The function seq_free_client1() calls
> > the function snd_seq_queue_client_leave() and the function
> > snd_seq_queue_client_termination() together. Because the function
> > snd_seq_queue_client_leave() does all things, so the function
> > snd_seq_queue_client_termination() is a useless function.
>
> How poetic, rhymes awfully well :)
>
> > Signed-off-by: Yu Hao <yuhaobehappy@gmail.com>
>
> Applied now.  Thanks!
>
>
> Takashi
>
> >  sound/core/seq/seq_clientmgr.c |  1 -
> >  sound/core/seq/seq_queue.c     | 27 ---------------------------
> >  sound/core/seq/seq_queue.h     |  3 ---
> >  3 files changed, 31 deletions(-)
> >
> > diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
> > index cc93157fa950..f9f2fea58b32 100644
> > --- a/sound/core/seq/seq_clientmgr.c
> > +++ b/sound/core/seq/seq_clientmgr.c
> > @@ -279,7 +279,6 @@ static int seq_free_client1(struct snd_seq_client *client)
> >       snd_seq_delete_all_ports(client);
> >       snd_seq_queue_client_leave(client->number);
> >       snd_use_lock_sync(&client->use_lock);
> > -     snd_seq_queue_client_termination(client->number);
> >       if (client->pool)
> >               snd_seq_pool_delete(&client->pool);
> >       spin_lock_irq(&clients_lock);
> > diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
> > index 71a6ea62c3be..13cfc2d47fa7 100644
> > --- a/sound/core/seq/seq_queue.c
> > +++ b/sound/core/seq/seq_queue.c
> > @@ -537,33 +537,6 @@ int snd_seq_queue_is_used(int queueid, int client)
> >
> >  /*----------------------------------------------------------------*/
> >
> > -/* notification that client has left the system -
> > - * stop the timer on all queues owned by this client
> > - */
> > -void snd_seq_queue_client_termination(int client)
> > -{
> > -     unsigned long flags;
> > -     int i;
> > -     struct snd_seq_queue *q;
> > -     bool matched;
> > -
> > -     for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
> > -             if ((q = queueptr(i)) == NULL)
> > -                     continue;
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
> > -             queuefree(q);
> > -     }
> > -}
> > -
> >  /* final stage notification -
> >   * remove cells for no longer exist client (for non-owned queue)
> >   * or delete this queue (for owned queue)
> > diff --git a/sound/core/seq/seq_queue.h b/sound/core/seq/seq_queue.h
> > index 9254c8dbe5e3..1c3a8d3254d9 100644
> > --- a/sound/core/seq/seq_queue.h
> > +++ b/sound/core/seq/seq_queue.h
> > @@ -59,9 +59,6 @@ struct snd_seq_queue *snd_seq_queue_alloc(int client, int locked, unsigned int f
> >  /* delete queue (destructor) */
> >  int snd_seq_queue_delete(int client, int queueid);
> >
> > -/* notification that client has left the system */
> > -void snd_seq_queue_client_termination(int client);
> > -
> >  /* final stage */
> >  void snd_seq_queue_client_leave(int client);
> >
> > --
> > 2.17.1
> >
