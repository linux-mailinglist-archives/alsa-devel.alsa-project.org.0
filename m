Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E975C397748
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 17:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60D8716BE;
	Tue,  1 Jun 2021 17:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60D8716BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622562868;
	bh=qw8DisRaCMZsrAtvCy6+eu6ybexAQBgI6W70aFYD1r0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7x+WpdbV62LaF4KU+E7cueI6r4nAvooiuCrhFdyL3Mi/vYNbekCg5lPPSn9IzHlm
	 K6DXd3S4iT87JXa7L7dCKv6gIM5tpKeLhpwRYEACOUwXolj8P2SiKAwlDsLI3w4mZl
	 pWbmsO/2Sp79d/PjChTG2nLW6QYD49sjp7tn7oss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B081DF8025B;
	Tue,  1 Jun 2021 17:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A24F80254; Tue,  1 Jun 2021 17:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75969F800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 17:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75969F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i7ONSsBh"
Received: by mail-ed1-x532.google.com with SMTP id cb9so6092779edb.1
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kZmqa9AQHlhf4LAWbBjUUPJOktIkTk9wm72ZNUa+F8=;
 b=i7ONSsBhG91eTLfG3wxwX0jkRQ3UBebbuNE7QzMPoyRATsY0UP+K35w8D9oAw4wZC/
 3SYUD4tyUk+SXjlXiHR7p1MFa/SuzUO8fgYH3l3ZrdPPpys0p+GZRPSFY5N++gpqhBn9
 nII0hylqLX/yc5+Zc57NRU/C1ob2woMlHiQP4sFPatVfK72fDj6W6R4abVdXBcRlkl15
 PcDyrkxFAowuWOfy6OAYhqYP6R5C80JBlsfX9ymFLHsBaw5w0cw0M4+q/Hj7P9NfwsEA
 ZiYSbl16VF4ORAP3rqI5yT/nkBHK7bIIInq6cqkofbIY1RbXEJ9BklD5AywVYoMaXXbA
 kg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kZmqa9AQHlhf4LAWbBjUUPJOktIkTk9wm72ZNUa+F8=;
 b=sxjlVTypzpsgCddZa1i8tnyGkqV8OlbmnI91I0dSJFEtq5AN905bAGvldt4aF6W7nv
 y5mx+rpI60B0ubpH5yY1l8zQc4vx7U0rlg5vUH66+qwQE3+CZz+s40AAkNa36IupzKNS
 RGhy8Yc3ba9bIFVFvgmDloQBKVrGggcX8BSLDN/mm26IyI77BkJpSnAT0Mt1ARTKBbA2
 nP2nqpWp602+AIlR28TwKac+qCGS87DFyKbX0RTNe7dkBFWBK2Ra5trKwSeh8epC0yLo
 Wg9AVI1S1hey5a1gNORDw1huHWheo9Pc/txilMwrFF1yBl+PzU4EJjLIVFwPp84JvN1Y
 forw==
X-Gm-Message-State: AOAM530NPO4x4RvVhPxWjdEXz0yHxF7VHOvlMs7xRLHVcXiO1j5qLH6G
 aeLNCpFpbi0oKks2wSwZVjQTwYs5GAfVQMtHJXU=
X-Google-Smtp-Source: ABdhPJz2rS/h9c2JQZYpWmeKofkQ0Rc5bewQJc3cVTnwYeI7c+z6CgV+sDPxgqYhkO4V3eB5Ju3lGJQiFlKYh4b+Duo=
X-Received: by 2002:aa7:dd4f:: with SMTP id o15mr27863853edw.174.1622562763405; 
 Tue, 01 Jun 2021 08:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210531110144.GA24442@kadam>
 <CAD-N9QW17fVZhaLY=CLPj9EbTLpG9qFNcGYZ0MhGxg_E0df1Uw@mail.gmail.com>
 <20210601134606.GD24442@kadam>
 <CAD-N9QWspFya5YmFsR=9tskS_JK+8V1suuPiC=h2XpPt3=KymQ@mail.gmail.com>
 <20210601143711.GE24442@kadam>
In-Reply-To: <20210601143711.GE24442@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 1 Jun 2021 23:52:17 +0800
Message-ID: <CAD-N9QX3daWfV8VHJsYSkWKGLx1ySrnscykGHGB0RMTw_g3k0w@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jun 1, 2021 at 10:43 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jun 01, 2021 at 10:19:22PM +0800, Dongliang Mu wrote:
> > On Tue, Jun 1, 2021 at 9:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Tue, Jun 01, 2021 at 09:17:04PM +0800, Dongliang Mu wrote:
> > > > On Mon, May 31, 2021 at 7:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > > @@ -701,6 +706,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
> > > > > >               sysfs_remove_link(&card->ctl_dev.kobj, link_name);
> > > > > >               sysfs_remove_link(&led_card->dev.kobj, "card");
> > > > > >               device_del(&led_card->dev);
> > > > > > +             put_device(&led_card->dev);
> > > > > >               kfree(led_card);
> > > > > >               led->cards[card->number] = NULL;
> > > > > >       }
> > > > >
> > > > > Btw, I have created a Smatch warning for this type of code where we
> > > > > have:
> > > > >
> > > > >         put_device(&foo->dev);
> > > > >         kfree(foo);
> > > >
> > > > I don't think this should be a bug pattern. put_device will drop the
> > > > final reference of one object with struct device and invoke
> > > > device_release to release some resources.
> > > >
> > > > The release function should only clean up the internal resources in
> > > > the device object. It should not touch the led_card which contains the
> > > > device object.
> > > >
> > >
> > > It's only a use after free if you turn CONFIG_DEBUG_KOBJECT_RELEASE
> > > debugging on, which you would never do in a production environment.  The
> > > put_device() function calls kobject_release():
> >
> > This is interesting. Let's dig a little deeper.
> >
> > >
> > > lib/kobject.c
> > >    725  static void kobject_release(struct kref *kref)
> > >    726  {
> > >    727          struct kobject *kobj = container_of(kref, struct kobject, kref);
> > >    728  #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
> > >    729          unsigned long delay = HZ + HZ * (get_random_int() & 0x3);
> > >    730          pr_info("kobject: '%s' (%p): %s, parent %p (delayed %ld)\n",
> > >    731                   kobject_name(kobj), kobj, __func__, kobj->parent, delay);
> > >    732          INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
> > >                                                   ^^^^^^^^^^^^^^^^^^^^^^^
> > >
> > >    733
> > >    734          schedule_delayed_work(&kobj->release, delay);
> > >    735  #else
> > >    736          kobject_cleanup(kobj);
> > >    737  #endif
> > >    738  }
> > >
> > > This release will be done later and it references led_card->dev which is
> > > now freed.
> >
> > The call chain of kobject_delayed_cleanup is kobject_delayed_cleanup
> > -> kobject_cleanup. From the comment, kobject_cleanup should only
> > clean the resources in the kobject, without touching the dev object.
> > To further confirm, I checked the implementation and found out there
> > seem no references to the dev object. Would you mind pointing out the
> > reference to dev object?
>
> The kobj struct is included in the dev struct, it's not a pointer.
>
>         led_card->dev.kobj.name
>
> See all the '.' characters and only one "->"?  If you kfree(led_card)
> then you can't use led_card->dev.kobj any more.

Yeah, you're right. I originally thought the field kobj is a pointer
and there should no problem. Please leave alone the question below. I
thought up this question based on the assumption before.

>
> > Moreover, if kobject_cleanup touches the
> > resources out of kobject, shall we directly change this function other
> > than its callees?
> >
>
> I don't understand your question here.  The rest of the email looks like
> some copy and pasted code but I don't know what I'm supposed to be
> looking for.
>
> I really feel like I have explained things very as well as I can and I'm
> not sure what more I can do to help... :/

You already helped too much, and I learned a lot from the discussion
with you. Don't be bothered by my stupid questions. :)

>
> regards,
> dan carpenter
>
