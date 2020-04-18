Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C871AF400
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056121679;
	Sat, 18 Apr 2020 20:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056121679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587236343;
	bh=TfEofqp49HbWLNS/YzvAqA8UZmp6mII+JcBIQtSapHo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXUY6koKd1cdrn1mvS7V5Olx6MSGFSmJ13i8j+Zk1IFqfhkhoifrOD4sgJcqM4OKy
	 AfU2rDJObb4JdN3JCchCZQD/HA4e9XOrAE5dk0zg8xqWSyYq9QhIMPO/0Lr8Wo5XK8
	 4jaDT2u5LQwqJYm3VErL2m3PH4kwMSyPZHv1o3+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6774F80291;
	Sat, 18 Apr 2020 20:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B93F80290; Sat, 18 Apr 2020 20:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0130.hostedemail.com
 [216.40.44.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A577F8013D
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A577F8013D
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id AB7DD1801C62B;
 Sat, 18 Apr 2020 18:57:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: oven32_22ec242d00d03
X-Filterd-Recvd-Size: 2832
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sat, 18 Apr 2020 18:57:19 +0000 (UTC)
Message-ID: <d018321b0f281ff29efb04dd1496c8e6499812fb.camel@perches.com>
Subject: Re: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, Matthew Wilcox <willy@infradead.org>
Date: Sat, 18 Apr 2020 11:55:05 -0700
In-Reply-To: <b88d6f8b-e6af-7071-cefa-dc12e79116b6@infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-8-rdunlap@infradead.org>
 <20200418185033.GQ5820@bombadil.infradead.org>
 <b88d6f8b-e6af-7071-cefa-dc12e79116b6@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
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

On Sat, 2020-04-18 at 11:53 -0700, Randy Dunlap wrote:
> On 4/18/20 11:50 AM, Matthew Wilcox wrote:
> > On Sat, Apr 18, 2020 at 11:41:09AM -0700, Randy Dunlap wrote:
> > > @@ -294,11 +295,11 @@ void dev_coredumpm(struct device *dev, s
> > >  
> > >  	if (sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> > >  			      "failing_device"))
> > > -		/* nothing - symlink will be missing */;
> > > +		do_empty(); /* nothing - symlink will be missing */
> > >  
> > >  	if (sysfs_create_link(&dev->kobj, &devcd->devcd_dev.kobj,
> > >  			      "devcoredump"))
> > > -		/* nothing - symlink will be missing */;
> > > +		do_empty(); /* nothing - symlink will be missing */
> > >  
> > >  	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
> > >  	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
> > 
> > Could just remove the 'if's?
> > 
> > +	sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> > +			"failing_device");
> > 
> 
> OK.

sysfs_create_link is __must_check


