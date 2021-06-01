Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39313975B7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 16:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF8616D2;
	Tue,  1 Jun 2021 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF8616D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622558709;
	bh=TgYhF1rI5yPzXN8j6vVugXI0kjXrBKUYk1TVJB3tCXw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgQafl2EheyIkZQOgTubLgBccbGEWu66zPJxcA1NK2PUt8ye0VA8LN9WaAHqn0J9W
	 JQeelDPcYwxPMj2Zgf7SLWYkx39/AtkJmlH0p1S9xG6xz/fw/fAgVgtF84BYaEeek5
	 8TJjnRqx9afeutcQNB89bNEWSbkHGa+MNakQwi7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F488F800B2;
	Tue,  1 Jun 2021 16:43:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D9E0F80254; Tue,  1 Jun 2021 16:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44D2BF800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44D2BF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="zuPuLRLP"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151EZSQd021825; Tue, 1 Jun 2021 14:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=nLx792/+7c1XYpm4TV1d60g4q4r/D2RJCZhniOjSbds=;
 b=zuPuLRLPclEBokirkhyjlW5b4U1/ElgXQrFOEvkc4R8Ksk1YLvg9dretptBOOR1SLZbB
 KBpzhMtHoDJUTuQ413kaxF1KUXXyhrYhkWxLnQenFkz7v3/y0lKt7flQ92ef78alyHCL
 PxOttN9W0+18e6+H6eqnrGO6WPd5FrI+PPzHQjj8gF0oDeoJrZEZlUV0E2l+pf0XKJkD
 tw90B7sss24HY9VIWEUyHNlyKDY4eBjf5BPOezTVYQDphgl8lsxa0ThbcqSDd9jzN+1i
 ODuZqPg+pe+aWfQ+7PnG8BkJlj0xqno0zTnntoACQZNEnKyd3PBwJH2grtjlsJgGsKvz GA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38vtymghch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 14:43:23 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 151Eae9x155201;
 Tue, 1 Jun 2021 14:43:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38uaqwcnyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 14:43:22 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151EdjRA161472;
 Tue, 1 Jun 2021 14:43:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 38uaqwcnxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 14:43:21 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 151EhCYG025574;
 Tue, 1 Jun 2021 14:43:17 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Jun 2021 07:43:12 -0700
Date: Tue, 1 Jun 2021 17:43:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Message-ID: <20210601143711.GE24442@kadam>
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210531110144.GA24442@kadam>
 <CAD-N9QW17fVZhaLY=CLPj9EbTLpG9qFNcGYZ0MhGxg_E0df1Uw@mail.gmail.com>
 <20210601134606.GD24442@kadam>
 <CAD-N9QWspFya5YmFsR=9tskS_JK+8V1suuPiC=h2XpPt3=KymQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QWspFya5YmFsR=9tskS_JK+8V1suuPiC=h2XpPt3=KymQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: hlMpnFouAp5nJEtVXgPguqYnscqCDjtJ
X-Proofpoint-ORIG-GUID: hlMpnFouAp5nJEtVXgPguqYnscqCDjtJ
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

On Tue, Jun 01, 2021 at 10:19:22PM +0800, Dongliang Mu wrote:
> On Tue, Jun 1, 2021 at 9:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Tue, Jun 01, 2021 at 09:17:04PM +0800, Dongliang Mu wrote:
> > > On Mon, May 31, 2021 at 7:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > @@ -701,6 +706,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
> > > > >               sysfs_remove_link(&card->ctl_dev.kobj, link_name);
> > > > >               sysfs_remove_link(&led_card->dev.kobj, "card");
> > > > >               device_del(&led_card->dev);
> > > > > +             put_device(&led_card->dev);
> > > > >               kfree(led_card);
> > > > >               led->cards[card->number] = NULL;
> > > > >       }
> > > >
> > > > Btw, I have created a Smatch warning for this type of code where we
> > > > have:
> > > >
> > > >         put_device(&foo->dev);
> > > >         kfree(foo);
> > >
> > > I don't think this should be a bug pattern. put_device will drop the
> > > final reference of one object with struct device and invoke
> > > device_release to release some resources.
> > >
> > > The release function should only clean up the internal resources in
> > > the device object. It should not touch the led_card which contains the
> > > device object.
> > >
> >
> > It's only a use after free if you turn CONFIG_DEBUG_KOBJECT_RELEASE
> > debugging on, which you would never do in a production environment.  The
> > put_device() function calls kobject_release():
> 
> This is interesting. Let's dig a little deeper.
> 
> >
> > lib/kobject.c
> >    725  static void kobject_release(struct kref *kref)
> >    726  {
> >    727          struct kobject *kobj = container_of(kref, struct kobject, kref);
> >    728  #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
> >    729          unsigned long delay = HZ + HZ * (get_random_int() & 0x3);
> >    730          pr_info("kobject: '%s' (%p): %s, parent %p (delayed %ld)\n",
> >    731                   kobject_name(kobj), kobj, __func__, kobj->parent, delay);
> >    732          INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
> >                                                   ^^^^^^^^^^^^^^^^^^^^^^^
> >
> >    733
> >    734          schedule_delayed_work(&kobj->release, delay);
> >    735  #else
> >    736          kobject_cleanup(kobj);
> >    737  #endif
> >    738  }
> >
> > This release will be done later and it references led_card->dev which is
> > now freed.
> 
> The call chain of kobject_delayed_cleanup is kobject_delayed_cleanup
> -> kobject_cleanup. From the comment, kobject_cleanup should only
> clean the resources in the kobject, without touching the dev object.
> To further confirm, I checked the implementation and found out there
> seem no references to the dev object. Would you mind pointing out the
> reference to dev object?

The kobj struct is included in the dev struct, it's not a pointer.

	led_card->dev.kobj.name

See all the '.' characters and only one "->"?  If you kfree(led_card)
then you can't use led_card->dev.kobj any more.

> Moreover, if kobject_cleanup touches the
> resources out of kobject, shall we directly change this function other
> than its callees?
> 

I don't understand your question here.  The rest of the email looks like
some copy and pasted code but I don't know what I'm supposed to be
looking for.

I really feel like I have explained things very as well as I can and I'm
not sure what more I can do to help... :/

regards,
dan carpenter

