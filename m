Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3939440D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790051704;
	Fri, 28 May 2021 16:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790051704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211550;
	bh=5wJxJ20DzjrxOkpj9EA0m6OLbJ+XKT2bP3jGCHouofI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n09fzn5giabsKvgSxZ4Iq6KosqLbmEZ2sBax8/qkB+RzNl8e9u8WUK7lKFO7j78+X
	 /yQEOBsQiCWIKbsJjDneTSFuW7FpQ3oK2ACx7VTAIDukc7Gdj7mAPI6q2mrgqoV7rz
	 g2+F/zwBSBX61lroy+d+iUK2SepEow6p2SkEtbqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6815DF804EC;
	Fri, 28 May 2021 16:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFA32F804AC; Fri, 28 May 2021 15:51:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 924F3F802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 15:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924F3F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jxBfkIfG"
Received: by mail-ej1-x631.google.com with SMTP id lz27so5409212ejb.11
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=onRUdRcxNeN6AVsu4VKeJQ+UQbP3xs8LpXPjnAqcXc8=;
 b=jxBfkIfGhWECkl53LRrTXxtiCB6D8bkzCWImvbRkFYfAghiIx4agRpAznuIh6jPqlv
 8RxoYH+DubIkSnQirszDFwAyvMrVKdPI47ISuK8ZbBNhjdrG+Rdttcrtr7Y+OT7JFHyo
 OIiQ+whsojq7bx6y8gyg8IsJ48oGCo8A2X9R3VdlNB7YLB8st5WmyjNVfy5HZmkcuLVo
 GSrBHB7jstTybPJpkKgupXf9UH5vvSssOrTouMH082SKp1qbIFYI7wS+hRj1kzd2uRei
 aZNI6+Bq4zOkMXAUfC8fPcjF+nxVBcWVYHwL91pSfQWkGMu6QNtueWJVLY/LYjfmBfh8
 hqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=onRUdRcxNeN6AVsu4VKeJQ+UQbP3xs8LpXPjnAqcXc8=;
 b=m9TLHL97vcfUDNL2K5DLALpHMhOUvxt/H781JfirWjTRe5MJo6Lpd9O7Xif+FQHiD7
 KmujeIvXY8xRArDdY7S0fVy8uditwaMkheYpV71PGKappkUDJuS1+IRhr+AAUIs+dkv1
 i/TBG2+H2DAMIimIU6Kb3iSDFIjz3UBk2eZ8Gat7eJQT4CPe0KM6Bljp9nXC3u2MW3Ot
 0q/oJYk6EXSrc6dxzMZC2nqHK7zKrsYDUsiS+wItdYIoHuF0HTLZbN1Eu/FOSwusxzhO
 hR+8nOiXeJ3HoF2bZ93Tn1wQE/AE7pMAuKulz1jHM/tYwFpCzbXPuIZTSfPJvjWTybEd
 5eng==
X-Gm-Message-State: AOAM533KrmpM7KubHxraj7c8HJv58ii90xMwZY8bhOS9jyBvb8Yu89o0
 oD0u4nUOMB/nlRB5r8KoO9iQ7iUhyo3zZnu9HeR5es8HvmrvRplyXiQ=
X-Google-Smtp-Source: ABdhPJx9YVBhKVLFitWH3X96et2+PSjDzS8OddAowo9TocvFnd2QFOGJAmAI6qRLyxiXY4Gyg8S3I6hZEhluCPaAdpI=
X-Received: by 2002:a17:906:73d7:: with SMTP id
 n23mr9154549ejl.135.1622209878522; 
 Fri, 28 May 2021 06:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210528133309.GR24442@kadam>
In-Reply-To: <20210528133309.GR24442@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Fri, 28 May 2021 21:50:49 +0800
Message-ID: <CAD-N9QVWcEJjoziA6HVoQiUueVaKqAJS5Et60zvCvuUE7e6=gg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:26 +0200
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

-

On Fri, May 28, 2021 at 9:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, May 28, 2021 at 09:17:57PM +0800, Dongliang Mu wrote:
> > The snd_ctl_led_sysfs_add and snd_ctl_led_sysfs_remove should contain
> > the refcount operations in pair. However, snd_ctl_led_sysfs_remove fails
> > to decrease the refcount to zero, which causes device_release never to
> > be invoked. This leads to memory leak to some resources, like struct
> > device_private.
> >
> > Fix this by calling put_device at the end of snd_ctl_led_sysfs_remove
> >
> > Reported-by: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
> > Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  sound/core/control_led.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> > index 25f57c14f294..fff2688b5019 100644
> > --- a/sound/core/control_led.c
> > +++ b/sound/core/control_led.c
> > @@ -371,6 +371,10 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
> >       snd_ctl_led_refresh();
> >  }
> >
> > +static void snd_ctl_led_release(struct device *dev)
> > +{
> > +}
>
> Whatever you're trying to do, adding a dummy function is never the
> answer.

I see your point. This function I added is not to fix the root cause,
but to fix an issue caused by the release function when the device is
released.

The put_device is to fix the root cause(i.e., decrease the refcount to
zero), however, the result is dev->p and kobject can be freed, but it
will trigger a WARN [1] as it has no release method.

I don't know how to craft a release method for such a device. So this
dummy function is generated following the default_release, also a
dummy function.

Can you please give some advise on how to fix this WARN issue?

[1] https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2110

>
> regards,
> dan carpenter
>
