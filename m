Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0BA397555
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 16:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4644E16D2;
	Tue,  1 Jun 2021 16:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4644E16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622557289;
	bh=o1VRjo2OMICohjq3Z0S+CD003ZBxDY7MAKl/UpXkx1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+9b2K17FjltujL7bd9TlMmamZTWv8kYqQVZ6P2FFw5a4EgEwUIsymTiFYqTfM7xB
	 sq1xDD36nwQGKnBE6AfAdZTSzyycQgV29T367W5IZEsvgPEw0BLxuA88xyoxLWDhXQ
	 WhmLqHT+pG3MgMdMGONyW7nr7OOZ7NLJoCVIL1HQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96209F80141;
	Tue,  1 Jun 2021 16:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32AC4F80254; Tue,  1 Jun 2021 16:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3281F801DB
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3281F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pEb7xNqI"
Received: by mail-ej1-x629.google.com with SMTP id ce15so2734437ejb.4
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4R+Zuxr256pMzP6uuNQj9mn4mK3gzDQHPsf5ko34lBU=;
 b=pEb7xNqIqVyKHgnc9YHzoY6quuUXNbRVGKJ4t8vJFFQKXXRTA4Tsm44oOf3a8AtdW3
 2oqTQFF6LRGyRgfE8fjYA/DbCckBggAHZoPJZO9Y7bESunFPBWGGRMoA9N0AIUfXnK+u
 UUJ9oxhg1jwtW5gQoVdAHmBIyerE7kldcZTaaw3fPEuUZyAl8A3ZQYgAixVuUCiYuY4W
 Zqj1VBD3hZJ4o1lrOTpFNKAdQD5EjyNJMCPEAK2LlZNTuUHvDsUEXXG5CGxsLInZYyOY
 eQodgZKE/uxgEg7e8Wcivsh2PuJuK5j+xu36LATXGbVC/rvbiAhOtshvFe07phBdZmIv
 87yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4R+Zuxr256pMzP6uuNQj9mn4mK3gzDQHPsf5ko34lBU=;
 b=EtgM+TPsraqwLFTlhYjQvtpwL7oZGKzgnKJkq3/Tu2iq+wc52YBokgDdNmdZXsZ6bB
 Ge8jybDHM5nESI2jAPbgki2uUqmtW9nPOcY+w1yjRSuOG9R/NpBXhRMOelVrtu+AN4Od
 mKm17WQGFXccVGI5J9Sm0gIArj3tqiCP8aBh5Xk98p8sugsufxKLV1jqEG069WGjoPKu
 Q68InVIE5HGkufvqKrS5fJJtj5BkgbrCM2pKCb/IY96e/cJBQY3KJMBudlGCCOVCCCKy
 yBSUcms9efVBTvjEAcbHK0hqiATKc7/uG+hhgYw5ifQDnPHBUYN31TUUCTUHsgXBuwS2
 7YOg==
X-Gm-Message-State: AOAM531GDFy9IZ4PcNwTnSXIq+POECNG8m+rRt5b37VPw3ztJBW+csQS
 TPtS9+G2+1jc4j2xTS68MIMDXrne/q0PX9t2Z6I=
X-Google-Smtp-Source: ABdhPJzjy+0Fycq+umzTmK3DHLEu25qOWqBdZuI2KiRr91fabzJlDA1IGCeaN9o27QTzkqJ9+rXGxqE69MCiS8DpUSs=
X-Received: by 2002:a17:906:6d17:: with SMTP id
 m23mr30267653ejr.73.1622557189075; 
 Tue, 01 Jun 2021 07:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210531110144.GA24442@kadam>
 <CAD-N9QW17fVZhaLY=CLPj9EbTLpG9qFNcGYZ0MhGxg_E0df1Uw@mail.gmail.com>
 <20210601134606.GD24442@kadam>
In-Reply-To: <20210601134606.GD24442@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 1 Jun 2021 22:19:22 +0800
Message-ID: <CAD-N9QWspFya5YmFsR=9tskS_JK+8V1suuPiC=h2XpPt3=KymQ@mail.gmail.com>
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

On Tue, Jun 1, 2021 at 9:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jun 01, 2021 at 09:17:04PM +0800, Dongliang Mu wrote:
> > On Mon, May 31, 2021 at 7:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > @@ -701,6 +706,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
> > > >               sysfs_remove_link(&card->ctl_dev.kobj, link_name);
> > > >               sysfs_remove_link(&led_card->dev.kobj, "card");
> > > >               device_del(&led_card->dev);
> > > > +             put_device(&led_card->dev);
> > > >               kfree(led_card);
> > > >               led->cards[card->number] = NULL;
> > > >       }
> > >
> > > Btw, I have created a Smatch warning for this type of code where we
> > > have:
> > >
> > >         put_device(&foo->dev);
> > >         kfree(foo);
> >
> > I don't think this should be a bug pattern. put_device will drop the
> > final reference of one object with struct device and invoke
> > device_release to release some resources.
> >
> > The release function should only clean up the internal resources in
> > the device object. It should not touch the led_card which contains the
> > device object.
> >
>
> It's only a use after free if you turn CONFIG_DEBUG_KOBJECT_RELEASE
> debugging on, which you would never do in a production environment.  The
> put_device() function calls kobject_release():

This is interesting. Let's dig a little deeper.

>
> lib/kobject.c
>    725  static void kobject_release(struct kref *kref)
>    726  {
>    727          struct kobject *kobj = container_of(kref, struct kobject, kref);
>    728  #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
>    729          unsigned long delay = HZ + HZ * (get_random_int() & 0x3);
>    730          pr_info("kobject: '%s' (%p): %s, parent %p (delayed %ld)\n",
>    731                   kobject_name(kobj), kobj, __func__, kobj->parent, delay);
>    732          INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
>                                                   ^^^^^^^^^^^^^^^^^^^^^^^
>
>    733
>    734          schedule_delayed_work(&kobj->release, delay);
>    735  #else
>    736          kobject_cleanup(kobj);
>    737  #endif
>    738  }
>
> This release will be done later and it references led_card->dev which is
> now freed.

The call chain of kobject_delayed_cleanup is kobject_delayed_cleanup
-> kobject_cleanup. From the comment, kobject_cleanup should only
clean the resources in the kobject, without touching the dev object.
To further confirm, I checked the implementation and found out there
seem no references to the dev object. Would you mind pointing out the
reference to dev object? Moreover, if kobject_cleanup touches the
resources out of kobject, shall we directly change this function other
than its callees?

#ifdef CONFIG_DEBUG_KOBJECT_RELEASE
static void kobject_delayed_cleanup(struct work_struct *work)
{
kobject_cleanup(container_of(to_delayed_work(work),
    struct kobject, release));
}
#endif

/*
 * kobject_cleanup - free kobject resources.
 * @kobj: object to cleanup
 */
static void kobject_cleanup(struct kobject *kobj)
{
struct kobject *parent = kobj->parent;
struct kobj_type *t = get_ktype(kobj);
const char *name = kobj->name;

pr_debug("kobject: '%s' (%p): %s, parent %p\n",
kobject_name(kobj), kobj, __func__, kobj->parent);

if (t && !t->release)
pr_debug("kobject: '%s' (%p): does not have a release() function, it
is broken and must be fixed. See
Documentation/core-api/kobject.rst.\n",
kobject_name(kobj), kobj);

/* remove from sysfs if the caller did not do it */
if (kobj->state_in_sysfs) {
pr_debug("kobject: '%s' (%p): auto cleanup kobject_del\n",
kobject_name(kobj), kobj);
__kobject_del(kobj);
} else {
/* avoid dropping the parent reference unnecessarily */
parent = NULL;
}

if (t && t->release) {
pr_debug("kobject: '%s' (%p): calling ktype release\n",
kobject_name(kobj), kobj);
t->release(kobj);
}

/* free name if we allocated it */
if (name) {
pr_debug("kobject: '%s': free name\n", name);
kfree_const(name);
}

kobject_put(parent);
}

>
> The Smatch check did work pretty decently.  These are all use after free
> bugs if you have CONFIG_DEBUG_KOBJECT_RELEASE enabled.  (Line numbers
> from Friday's linux-next).  I'm not going to bother fixing them because
> they're only an issue for CONFIG_DEBUG_KOBJECT_RELEASE and not for
> production but I will email people when more of these bugs are
> introduced.
>
> sound/core/control_led.c:688 snd_ctl_led_sysfs_add() warn: freeing device managed memory (UAF): 'led_card'
> drivers/usb/gadget/function/f_mass_storage.c:2649 fsg_common_remove_lun() warn: freeing device managed memory (UAF): 'lun'
> drivers/usb/gadget/function/f_mass_storage.c:2818 fsg_common_create_lun() warn: freeing device managed memory (UAF): 'lun'
> drivers/usb/gadget/function/f_mass_storage.c:2881 fsg_common_release() warn: freeing device managed memory (UAF): 'lun'
> drivers/w1/w1.c:810 w1_unref_slave() warn: freeing device managed memory (UAF): 'sl'
> drivers/pci/endpoint/pci-epc-core.c:671 pci_epc_destroy() warn: freeing device managed memory (UAF): 'epc'
> drivers/pci/endpoint/pci-epc-core.c:742 __pci_epc_create() warn: freeing device managed memory (UAF): 'epc'
> drivers/infiniband/ulp/srp/ib_srp.c:3930 srp_add_port() warn: freeing device managed memory (UAF): 'host'
> drivers/infiniband/ulp/srp/ib_srp.c:4058 srp_remove_one() warn: freeing device managed memory (UAF): 'host'
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:2695 alloc_clt() warn: freeing device managed memory (UAF): 'clt'
> drivers/media/pci/solo6x10/solo6x10-core.c:156 free_solo_dev() warn: freeing device managed memory (UAF): 'solo_dev'
> drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c:203 nfp_cpp_free() warn: freeing device managed memory (UAF): 'cpp'
> drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c:1258 nfp_cpp_from_operations() warn: freeing device managed memory (UAF): 'cpp'
> drivers/net/netdevsim/bus.c:354 nsim_bus_dev_del() warn: freeing device managed memory (UAF): 'nsim_bus_dev'
> drivers/thermal/thermal_core.c:1002 __thermal_cooling_device_register() warn: freeing device managed memory (UAF): 'cdev'
>
> regards,
> dan carpenter
>
