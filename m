Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0938B1AF433
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 21:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22BB1676;
	Sat, 18 Apr 2020 21:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22BB1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587237534;
	bh=+gZLXPR3Vu+s0K6l61CvAdCfhFTJ5PkXujwJrPz78iQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVkuf0/AV6QcISH+ZyXoLch8wLOgxFgOHJ902Rozs9oRG74nB2JkEeGxr6S9tuFMg
	 sQCE2e33OgUyO0bK1VqCvHtFZvtTADjveRLV8lZ+BLNrLxjA+Ct0wu4fHMGLy+bkUq
	 tN7Tpu630HA5sNmMLQ6v4iy3vFPHNUKAECfjSEEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7228F80122;
	Sat, 18 Apr 2020 21:16:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC63F8028A; Sat, 18 Apr 2020 21:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B70CF8028A
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 21:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B70CF8028A
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1jPswv-00APdE-Hr; Sat, 18 Apr 2020 21:16:21 +0200
Message-ID: <ae170e7c4988399e63a00ad8505e397665563d22.camel@sipsolutions.net>
Subject: Re: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
From: Johannes Berg <johannes@sipsolutions.net>
To: Matthew Wilcox <willy@infradead.org>, Joe Perches <joe@perches.com>
Date: Sat, 18 Apr 2020 21:16:19 +0200
In-Reply-To: <20200418191338.GR5820@bombadil.infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-8-rdunlap@infradead.org>
 <20200418185033.GQ5820@bombadil.infradead.org>
 <b88d6f8b-e6af-7071-cefa-dc12e79116b6@infradead.org>
 <d018321b0f281ff29efb04dd1496c8e6499812fb.camel@perches.com>
 <20200418191338.GR5820@bombadil.infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Sat, 2020-04-18 at 12:13 -0700, Matthew Wilcox wrote:
> 
> > > > >  	if (sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> > > > >  			      "failing_device"))
> > > > > -		/* nothing - symlink will be missing */;
> > > > > +		do_empty(); /* nothing - symlink will be missing */
> > > > >  
> > > > >  	if (sysfs_create_link(&dev->kobj, &devcd->devcd_dev.kobj,
> > > > >  			      "devcoredump"))
> > > > > -		/* nothing - symlink will be missing */;
> > > > > +		do_empty(); /* nothing - symlink will be missing */
> > > > >  
> > > > >  	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
> > > > >  	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
> > > > 
> > > > Could just remove the 'if's?
> > > > 
> > > > +	sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> > > > +			"failing_device");
> > > > 
> > > 
> > > OK.
> > 
> > sysfs_create_link is __must_check
> 
> Oh, I missed the declaration -- I just saw the definition.  This is a
> situation where __must_check hurts us and it should be removed.
> 
> Or this code is wrong and it should be
> 
> 	WARN(sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
> 			"failing_device");

Perhaps it should be. I didn't think it really mattered _that_ much if
the symlink suddenly went missing, but OTOH I don't even know how it
could possibly fail.

johannes

