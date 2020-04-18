Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B11AF840
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6234E1672;
	Sun, 19 Apr 2020 09:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6234E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282070;
	bh=MuglAtA0oQ797Z2soSrZe+rihqMksDe9WI21lAY9O9o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCNsrR/6/dHxoNkaDqD4SF+BOPrreim0KqDNA+G6t9Kr2XR8U/5t7apzLYtPtj+GC
	 Srmxhsy5uNOwI1l4XSbJWCtR6tC6xwqQtHr1IBFjva/Fkm4qUNeQaDyEHddJd6m639
	 SszsWYC+t8cLMD/NIS5FSNneN8nZ5wJEWWnrObuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2193DF80278;
	Sun, 19 Apr 2020 09:38:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62109F8014E; Sat, 18 Apr 2020 21:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEBD5F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 21:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEBD5F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Pbh2gwHB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1Xuy0hbaik5jnBw+JX74GiEbxwfdlzrwJ6CXAcCNKJ0=; b=Pbh2gwHBC+0n9j0XheYbIXwFQj
 DLH/6PgobmCWmxlogha43zhUGSOtU89tXwjVH0o1Rho/S2T2EjJTPG70nmSsvSMvvLuonOlXdkiEF
 yGJpGvfRz2PkLCG7L7Uy3m9lgzRa8kBf6U42WpkqqxMc3bt3hK4TRhmhD0zC1q2wsbCa9130nX/Tr
 BTyG4Wi0/MtCFbctxHGNP3IoIr9AwF92URUTCaCCqCq81Wkivc6Os9SxUDznfhAgxmUgbP9sTqTjg
 OQaGKDbNC89jhx9AoLbm18DH/xji73LaoYjLqiNC454x2nCt2c/0XKhdkme0M37SQxFbl37OzjXm7
 wpboRveg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jPsuI-0002hx-99; Sat, 18 Apr 2020 19:13:38 +0000
Date: Sat, 18 Apr 2020 12:13:38 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
Message-ID: <20200418191338.GR5820@bombadil.infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-8-rdunlap@infradead.org>
 <20200418185033.GQ5820@bombadil.infradead.org>
 <b88d6f8b-e6af-7071-cefa-dc12e79116b6@infradead.org>
 <d018321b0f281ff29efb04dd1496c8e6499812fb.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d018321b0f281ff29efb04dd1496c8e6499812fb.camel@perches.com>
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Sat, Apr 18, 2020 at 11:55:05AM -0700, Joe Perches wrote:
> On Sat, 2020-04-18 at 11:53 -0700, Randy Dunlap wrote:
> > On 4/18/20 11:50 AM, Matthew Wilcox wrote:
> > > On Sat, Apr 18, 2020 at 11:41:09AM -0700, Randy Dunlap wrote:
> > > > @@ -294,11 +295,11 @@ void dev_coredumpm(struct device *dev, s
> > > >  
> > > >  	if (sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> > > >  			      "failing_device"))
> > > > -		/* nothing - symlink will be missing */;
> > > > +		do_empty(); /* nothing - symlink will be missing */
> > > >  
> > > >  	if (sysfs_create_link(&dev->kobj, &devcd->devcd_dev.kobj,
> > > >  			      "devcoredump"))
> > > > -		/* nothing - symlink will be missing */;
> > > > +		do_empty(); /* nothing - symlink will be missing */
> > > >  
> > > >  	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
> > > >  	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
> > > 
> > > Could just remove the 'if's?
> > > 
> > > +	sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> > > +			"failing_device");
> > > 
> > 
> > OK.
> 
> sysfs_create_link is __must_check

Oh, I missed the declaration -- I just saw the definition.  This is a
situation where __must_check hurts us and it should be removed.

Or this code is wrong and it should be

	WARN(sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
			"failing_device");

like drivers/pci/controller/vmd.c and drivers/i2c/i2c-mux.c

Either way, the do_empty() construct feels like the wrong way of covering
up the warning.
