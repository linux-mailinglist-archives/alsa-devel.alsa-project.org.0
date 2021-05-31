Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2C395758
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 10:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3574A850;
	Mon, 31 May 2021 10:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3574A850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622450888;
	bh=CHk8fnX7XAv2FQzxRQeiMg50/MO5nwHlM/lGnjzkdDc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OaoB0yWZxpOXh+nhJ2Ul5Q0ffqaJqs8sO7A0szqGAAPquJP8GpYC5rnEMYE7bDuzX
	 YT8E+vwIzk79ESglQ02mPHZ1sMlP1Ur5VOhSh3V8SBUXmqTZMEnr0T97Xeqf2mkFo6
	 0XxFcAhjDIkp81MAsRl5mvJVPXgY1AgkjAK2D2tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83938F80161;
	Mon, 31 May 2021 10:46:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54344F802E2; Mon, 31 May 2021 10:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5428BF80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 10:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5428BF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="HIQT+Tqi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14V8kF3V021721; Mon, 31 May 2021 08:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=/CgPOMIARDftfB0Qw7cHpwmQbywZ4gj/NtDgnpDTwrI=;
 b=HIQT+Tqic31oRnVeJyUFnSqQIMMPkXWc+STrnWBp7NrbQakOfRYYzYZRpU0GwE5OG7qZ
 iXZx3BB1gNkCsmR2gG6LIimt4IQuKG/Cpaoo7WhX5ODxBFW6QBNyLF8qOp280NfWo6DO
 AR1mKEeWWLTJFqyQt9uDkOpU1XH4lDtAB3lkhuhr9yY7OTrK4yNrgi8A0az4yzgi/iTc
 W86qccMoSenQQ/RcD8Ovf3+Fc4xLpITZN71Lw1SQOtiAYtkyfeL0Eq7yiPFo15AJkx4J
 9oqLI+AkBO5xn8grGyiTZH+V4hK3bZwxHseciiYKb7Mkci818IXj9ZfqzK16k6rn9cXD OQ== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38vj1kr5dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 08:46:29 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14V8kSHg066622;
 Mon, 31 May 2021 08:46:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38ubnc9k53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 08:46:28 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14V8kRXa066608;
 Mon, 31 May 2021 08:46:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38ubnc9k50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 08:46:27 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14V8kL9I007691;
 Mon, 31 May 2021 08:46:25 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 31 May 2021 01:46:20 -0700
Date: Mon, 31 May 2021 11:46:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Message-ID: <20210531084613.GX24442@kadam>
References: <20210528133309.GR24442@kadam>
 <CAD-N9QVWcEJjoziA6HVoQiUueVaKqAJS5Et60zvCvuUE7e6=gg@mail.gmail.com>
 <20210528140500.GS24442@kadam>
 <A622EB84-DC4A-47A4-A828-CE6D25DC92EB@gmail.com>
 <CAD-N9QVjhDDJxRnNrDzwt05BNijr1o11nE8xjvq8GrakEJ8EuQ@mail.gmail.com>
 <20210531044022.GU24442@kadam>
 <CAD-N9QWBBP6_Wwi4z3e4yJM-tS54=1=CcvAA+2__Qj8NsTLq9g@mail.gmail.com>
 <20210531070337.GV24442@kadam>
 <CAD-N9QU-uqFr=b1hMi1h1ytq2Uf2XKL44f9OHBRhM70zhkiO7w@mail.gmail.com>
 <CAD-N9QW5C2ssA7H_U+eiM=SbsPj29Ooo6Sk=r4d1qELbZQjuPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QW5C2ssA7H_U+eiM=SbsPj29Ooo6Sk=r4d1qELbZQjuPA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: dInrzyx32Gg2jDn5X5AZ_IbBnTK1aOml
X-Proofpoint-GUID: dInrzyx32Gg2jDn5X5AZ_IbBnTK1aOml
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

On Mon, May 31, 2021 at 04:08:04PM +0800, Dongliang Mu wrote:
> On Mon, May 31, 2021 at 3:34 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >
> > On Mon, May 31, 2021 at 3:03 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Mon, May 31, 2021 at 02:20:37PM +0800, Dongliang Mu wrote:
> > > > On Mon, May 31, 2021 at 12:40 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > On Mon, May 31, 2021 at 11:03:36AM +0800, Dongliang Mu wrote:
> > > > > > On Sat, May 29, 2021 at 5:35 AM 慕冬亮 <mudongliangabcd@gmail.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > On May 28, 2021, at 10:05 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, May 28, 2021 at 09:50:49PM +0800, Dongliang Mu wrote:
> > > > > > > >>
> > > > > > > >> Can you please give some advise on how to fix this WARN issue?
> > > > > > > >
> > > > > > > > But it feels like it spoils the fun if I write the commit...  Anyway:
> > > > > > >
> > > > > > > It’s fine. I am still in the learning process. It’s also good to learn experience by comparing your patch and my patch.
> > > > > > >
> > > > > > > >
> > > > > > > > regards,
> > > > > > > > dan carpenter
> > > > > > > >
> > > > > > > > diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> > > > > > > > index 25f57c14f294..dd357abc1b58 100644
> > > > > > > > --- a/sound/core/control_led.c
> > > > > > > > +++ b/sound/core/control_led.c
> > > > > > > > @@ -740,6 +740,7 @@ static int __init snd_ctl_led_init(void)
> > > > > > > >                       for (; group > 0; group--) {
> > > > > > > >                               led = &snd_ctl_leds[group - 1];
> > > > > > > >                               device_del(&led->dev);
> > > > > > > > +                             device_put(&led->dev);
> > > > > > > >                       }
> > > > > > > >                       device_del(&snd_ctl_led_dev);
> > > > > > > >                       return -ENOMEM;
> > > > > > > > @@ -768,6 +769,7 @@ static void __exit snd_ctl_led_exit(void)
> > > > > > > >       for (group = 0; group < MAX_LED; group++) {
> > > > > > > >               led = &snd_ctl_leds[group];
> > > > > > > >               device_del(&led->dev);
> > > > > > > > +             device_put(&led->dev);
> > > > > > > >       }
> > > > > > > >       device_del(&snd_ctl_led_dev);
> > > > > > > >       snd_ctl_led_clean(NULL);
> > > > > >
> > > > > > Hi Dan,
> > > > > >
> > > > > > I tried this patch, and it still triggers the memleak.
> > > > >
> > > > > Did your patch fix the leak?  Because my patch should have been
> > > > > equivalent except for it fixes an additional leak in the snd_ctl_led_init()
> > > > > error path.
> > > >
> > > > The syzbot link is [1]. I have tested my patch in the syzbot dashboard
> > > > and my local workspace.
> > > >
> > > > I think the reason why your patch did not work should be
> > > > led_card(struct snd_ctl_led_card) is already freed before returning in
> > > > snd_ctl_led_sysfs_remove, rather than led(struct snd_ctl_led). See the
> > > > implementation of snd_ctl_led_sysfs_remove for some details. Please
> > > > correct me if I make any mistakes.
> > > >
> > > > static void snd_ctl_led_sysfs_remove(struct snd_card *card)
> > > > {
> > > >         unsigned int group;
> > > >         struct snd_ctl_led_card *led_card;
> > > >         struct snd_ctl_led *led;
> > > >         char link_name[32];
> > > >
> > > >         for (group = 0; group < MAX_LED; group++) {
> > > >                 led = &snd_ctl_leds[group];
> > > >                 led_card = led->cards[card->number];
> > > >                 if (!led_card)
> > > >                         continue;
> > > >                 snprintf(link_name, sizeof(link_name), "led-%s", led->name);
> > > >                 sysfs_remove_link(&card->ctl_dev.kobj, link_name);
> > > >                 sysfs_remove_link(&led_card->dev.kobj, "card");
> > > >                 device_del(&led_card->dev);
> > > >                 put_device(&led_card->dev);
> > > >                 kfree(led_card);
> > > >                 led->cards[card->number] = NULL;
> > > >         }
> > > > }
> > >
> > > This is frustrating to look at because it's not a diff so it doesn't
> > > show what you changed.  I think you are saying that you added the
> > > put_device(&led_card->dev);.  That's true.  There are some other leaks
> > > as well.  We should just fix them all.  Use device_unregister() because
> > > it's cleaner.
> >
> > Oh, I see your point. Yeah, we should fix these memory leaks all. I
> > agree with device_unregister.
> >
> > >
> > > If both device_initialize() and device_add() succeed then call
> > > device_unregister() to unwind.
> >
> > BTW, have you tested this new patch on two memory leaks?
> >
> 
> Please keep in mind that if we don't have any release method for
> struct snd_ctl_led_card, it will trigger a WARN[1] in the
> device_release function. That's why I have to add one dummy release
> function.
> 
> if (dev->release)
>         dev->release(dev);
> else if (dev->type && dev->type->release)
>         dev->type->release(dev);
> else if (dev->class && dev->class->dev_release)
>         dev->class->dev_release(dev);
> else
>         WARN(1, KERN_ERR "Device '%s' does not have a release()
> function, it is broken and must be fixed. See
> Documentation/core-api/kobject.rst.\n",
> dev_name(dev));
> 

Oh yeah.  You're right.  The "kfree(led_card);" needs to be moved to a
release function or it can lead to a use after free.  For the others,
I think a dummy release function is ok (because it is static data).

It feels like there should be a standard way to say that there is no
need to release any data.  That way it could be verified by static
analysis tools.

regards,
dan carpenter

> [1] https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2110 
> 
> > >
> > > diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> > > index 25f57c14f294..561fe45e4449 100644
> > > --- a/sound/core/control_led.c
> > > +++ b/sound/core/control_led.c
> > > @@ -700,7 +700,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
> > >                 snprintf(link_name, sizeof(link_name), "led-%s", led->name);
> > >                 sysfs_remove_link(&card->ctl_dev.kobj, link_name);
> > >                 sysfs_remove_link(&led_card->dev.kobj, "card");
> > > -               device_del(&led_card->dev);
> > > +               device_unregister(&led_card->dev);
> > >                 kfree(led_card);
> > >                 led->cards[card->number] = NULL;
> > >         }
> > > @@ -739,9 +739,9 @@ static int __init snd_ctl_led_init(void)
> > >                         put_device(&led->dev);
> > >                         for (; group > 0; group--) {
> > >                                 led = &snd_ctl_leds[group - 1];
> > > -                               device_del(&led->dev);
> > > +                               device_unregister(&led->dev);
> > >                         }
> > > -                       device_del(&snd_ctl_led_dev);
> > > +                       device_unregister(&snd_ctl_led_dev);
> > >                         return -ENOMEM;
> > >                 }
> > >         }
> > > @@ -767,9 +767,9 @@ static void __exit snd_ctl_led_exit(void)
> > >         }
> > >         for (group = 0; group < MAX_LED; group++) {
> > >                 led = &snd_ctl_leds[group];
> > > -               device_del(&led->dev);
> > > +               device_unregister(&led->dev);
> > >         }
> > > -       device_del(&snd_ctl_led_dev);
> > > +       device_unregister(&snd_ctl_led_dev);
> > >         snd_ctl_led_clean(NULL);
> > >  }
> > >
