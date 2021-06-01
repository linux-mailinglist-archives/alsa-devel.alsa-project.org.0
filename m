Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE639748B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 15:48:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54DFA16D1;
	Tue,  1 Jun 2021 15:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54DFA16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622555281;
	bh=V4FLM6n8LZwuenbNHqdbARfTdXq9rTDjKx8sdU94nwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHnz6eKKMExuzc9FIZBvxGjr6qyYXmVhEAhqdk3I7A8whQAYnlNf5eGpr+MK6a1YS
	 GFf8ILYAusfDAUs2Ij/gQTxagJL2hoIiY/vl9+5iDQpcwloqlJo6leUEEA7tAYwVjO
	 jjJRX9BvrrUTftQYEFVe2Z/YFix9/lNgBFAb7pz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E17A1F801DB;
	Tue,  1 Jun 2021 15:46:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98950F80254; Tue,  1 Jun 2021 15:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28F92F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 15:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28F92F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="cLhy7hhw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151DkM4i013732; Tue, 1 Jun 2021 13:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=44w8HnzJCVFzBaUr40h+1Z99o7CPw9koJPJwXdJfORo=;
 b=cLhy7hhwp04C6uyqBgz3J2o/HRFdP5A5i6I8uz3SbiS63iJgTTojtHX3Zdq0IA+ci8+q
 xejUJlFyTgjiwQhtu6huswGpzc7gy4NlgaVEG5RH1lGvOS7vww1K/SpabPW+0kFaPStV
 pfGR5C816AKunQ2cOEyeErl/RNegore18OenYgapnd4ptDSbjLbrOlXV3tqKhoNBNxi/
 xNM6nbpvyOpkWKYfeCx7l1uGmcjeYOsrw1QYlC1e6GhmZyb98lkTihHuwGxefvgZjmCb
 vAoFvQXpCFMlCHjvg/FfqDUi1Pic8lQQG7IFw2CLHLlMFkr3WZTSxdcBQFn4/GBk8tWB EA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38vjar0mn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 13:46:22 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 151DhNKs068253;
 Tue, 1 Jun 2021 13:46:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38uycra5vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 13:46:21 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151DkK42074986;
 Tue, 1 Jun 2021 13:46:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 38uycra5v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Jun 2021 13:46:20 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 151DkGfX011164;
 Tue, 1 Jun 2021 13:46:17 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Jun 2021 13:46:15 +0000
Date: Tue, 1 Jun 2021 16:46:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Message-ID: <20210601134606.GD24442@kadam>
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210531110144.GA24442@kadam>
 <CAD-N9QW17fVZhaLY=CLPj9EbTLpG9qFNcGYZ0MhGxg_E0df1Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QW17fVZhaLY=CLPj9EbTLpG9qFNcGYZ0MhGxg_E0df1Uw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: hPuK-GX05TvdHVxpZNtQQ58X0GqwDWkt
X-Proofpoint-GUID: hPuK-GX05TvdHVxpZNtQQ58X0GqwDWkt
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

On Tue, Jun 01, 2021 at 09:17:04PM +0800, Dongliang Mu wrote:
> On Mon, May 31, 2021 at 7:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > @@ -701,6 +706,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
> > >               sysfs_remove_link(&card->ctl_dev.kobj, link_name);
> > >               sysfs_remove_link(&led_card->dev.kobj, "card");
> > >               device_del(&led_card->dev);
> > > +             put_device(&led_card->dev);
> > >               kfree(led_card);
> > >               led->cards[card->number] = NULL;
> > >       }
> >
> > Btw, I have created a Smatch warning for this type of code where we
> > have:
> >
> >         put_device(&foo->dev);
> >         kfree(foo);
> 
> I don't think this should be a bug pattern. put_device will drop the
> final reference of one object with struct device and invoke
> device_release to release some resources.
> 
> The release function should only clean up the internal resources in
> the device object. It should not touch the led_card which contains the
> device object.
> 

It's only a use after free if you turn CONFIG_DEBUG_KOBJECT_RELEASE
debugging on, which you would never do in a production environment.  The
put_device() function calls kobject_release():

lib/kobject.c
   725  static void kobject_release(struct kref *kref)
   726  {
   727          struct kobject *kobj = container_of(kref, struct kobject, kref);
   728  #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
   729          unsigned long delay = HZ + HZ * (get_random_int() & 0x3);
   730          pr_info("kobject: '%s' (%p): %s, parent %p (delayed %ld)\n",
   731                   kobject_name(kobj), kobj, __func__, kobj->parent, delay);
   732          INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
                                                  ^^^^^^^^^^^^^^^^^^^^^^^

   733  
   734          schedule_delayed_work(&kobj->release, delay);
   735  #else
   736          kobject_cleanup(kobj);
   737  #endif
   738  }

This release will be done later and it references led_card->dev which is
now freed.

The Smatch check did work pretty decently.  These are all use after free
bugs if you have CONFIG_DEBUG_KOBJECT_RELEASE enabled.  (Line numbers
from Friday's linux-next).  I'm not going to bother fixing them because
they're only an issue for CONFIG_DEBUG_KOBJECT_RELEASE and not for
production but I will email people when more of these bugs are
introduced.

sound/core/control_led.c:688 snd_ctl_led_sysfs_add() warn: freeing device managed memory (UAF): 'led_card'
drivers/usb/gadget/function/f_mass_storage.c:2649 fsg_common_remove_lun() warn: freeing device managed memory (UAF): 'lun'
drivers/usb/gadget/function/f_mass_storage.c:2818 fsg_common_create_lun() warn: freeing device managed memory (UAF): 'lun'
drivers/usb/gadget/function/f_mass_storage.c:2881 fsg_common_release() warn: freeing device managed memory (UAF): 'lun'
drivers/w1/w1.c:810 w1_unref_slave() warn: freeing device managed memory (UAF): 'sl'
drivers/pci/endpoint/pci-epc-core.c:671 pci_epc_destroy() warn: freeing device managed memory (UAF): 'epc'
drivers/pci/endpoint/pci-epc-core.c:742 __pci_epc_create() warn: freeing device managed memory (UAF): 'epc'
drivers/infiniband/ulp/srp/ib_srp.c:3930 srp_add_port() warn: freeing device managed memory (UAF): 'host'
drivers/infiniband/ulp/srp/ib_srp.c:4058 srp_remove_one() warn: freeing device managed memory (UAF): 'host'
drivers/infiniband/ulp/rtrs/rtrs-clt.c:2695 alloc_clt() warn: freeing device managed memory (UAF): 'clt'
drivers/media/pci/solo6x10/solo6x10-core.c:156 free_solo_dev() warn: freeing device managed memory (UAF): 'solo_dev'
drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c:203 nfp_cpp_free() warn: freeing device managed memory (UAF): 'cpp'
drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.c:1258 nfp_cpp_from_operations() warn: freeing device managed memory (UAF): 'cpp'
drivers/net/netdevsim/bus.c:354 nsim_bus_dev_del() warn: freeing device managed memory (UAF): 'nsim_bus_dev'
drivers/thermal/thermal_core.c:1002 __thermal_cooling_device_register() warn: freeing device managed memory (UAF): 'cdev'

regards,
dan carpenter

