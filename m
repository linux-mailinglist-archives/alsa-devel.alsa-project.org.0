Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3798C1AF473
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 21:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B03B91670;
	Sat, 18 Apr 2020 21:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B03B91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587239761;
	bh=EbTltHLbmJDcfv+QgJ53Zs6Dh3n7WQQmDn6cdc3ouHg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=l4QnanKDOLq8aMB/nuv4bZxQobnAeLJCuL2GMq4wGKuGe7KrgOsEebCa1Xi/+ElsR
	 DZqK/C0b36g0RXYsocopXKhNtu/YFPeh7f9hWBNA4dcEbKJYokRZlk4f6X2CzMBpf8
	 Q23PYphzyU7XmeYq2xGqcpo71+ZupvVmjF4J1i0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1C2BF800E7;
	Sat, 18 Apr 2020 21:54:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D56DF8014E; Sat, 18 Apr 2020 21:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 9CD8CF800E7
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 21:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CD8CF800E7
Received: (qmail 9694 invoked by uid 500); 18 Apr 2020 15:54:12 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 18 Apr 2020 15:54:12 -0400
Date: Sat, 18 Apr 2020 15:54:12 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 5/9] usb: fix empty-body warning in sysfs.c
In-Reply-To: <20200418184409.GP5820@bombadil.infradead.org>
Message-ID: <Pine.LNX.4.44L0.2004181549020.8036-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 18 Apr 2020, Matthew Wilcox wrote:

> On Sat, Apr 18, 2020 at 11:41:07AM -0700, Randy Dunlap wrote:
> > +++ linux-next-20200327/drivers/usb/core/sysfs.c
> > @@ -1263,7 +1263,7 @@ void usb_create_sysfs_intf_files(struct
> >  	if (!alt->string && !(udev->quirks & USB_QUIRK_CONFIG_INTF_STRINGS))
> >  		alt->string = usb_cache_string(udev, alt->desc.iInterface);
> >  	if (alt->string && device_create_file(&intf->dev, &dev_attr_interface))
> > -		;	/* We don't actually care if the function fails. */
> > +		do_empty(); /* We don't actually care if the function fails. */
> >  	intf->sysfs_files_created = 1;
> >  }
> 
> Why not just?
> 
> +	if (alt->string)
> +		device_create_file(&intf->dev, &dev_attr_interface);

This is another __must_check function call.

The reason we don't care if the call fails is because the file
being created holds the USB interface string descriptor, something
which is purely informational and hardly ever gets set (and no doubt
gets used even less often).

Is this another situation where the comment should be expanded and the 
code modified to include a useless test and cast-to-void?

Or should device_create_file() not be __must_check after all?

Greg?

Alan Stern

