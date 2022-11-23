Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97D639482
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:13:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A223718BC;
	Sat, 26 Nov 2022 09:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A223718BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450400;
	bh=o3haMfaeHZfYTyEePRwp9h5E4unKgpaM0OuqyhoXnp0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHgmT4Jeew/JUy+cD1vHSwW9werj2TQYFoWWkaK0+uBH77+BfD2UcC+BXClbqbAfB
	 iO5kc6HylqKkxG1DkhTPEb0tMnL55S/wTO+NtJ+2c2lIqKwPZLyO0qTzoagmPgttIh
	 7FmuCMi5y1oE8q5FLKt2yBbtb8KCX+DXAO/hpHD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E39BF806EF;
	Sat, 26 Nov 2022 08:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DC67F8025D; Wed, 23 Nov 2022 18:01:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0175AF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 18:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0175AF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="qo8vJIEr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E04E061DFC;
 Wed, 23 Nov 2022 17:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777BCC433D6;
 Wed, 23 Nov 2022 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669222911;
 bh=o3haMfaeHZfYTyEePRwp9h5E4unKgpaM0OuqyhoXnp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qo8vJIErhb/ipCwuy4gwV/i9YmIAaJMojUiZPS4IOOd8yQY7LyT3VrOZMJTKRDS9x
 i8L49I9CCW+G4gWPmwXnGTUcpWsWu7OwHPDHLjbFVstIHlX3U3iCwopRHJdZmvOcLy
 DUuQU3VjRGKHYyj8ctniAuEtEhb8ztF3vFHL+6eY=
Date: Wed, 23 Nov 2022 18:01:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35R+/eQJYI7VaDS@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35JfNJDppRp5bLX@ziepe.ca>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Frank Rowand <frowand.list@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, linux-acpi@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Won Chung <wonchung@google.com>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 Michael Jamet <michael.jamet@intel.com>, Ming Lei <ming.lei@redhat.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 linux-media@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>,
 linux-usb@vger.kernel.org
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

On Wed, Nov 23, 2022 at 12:25:32PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> > static inline struct device *__kobj_to_dev(struct kobject *kobj)
> > {
> >         return container_of(kobj, struct device, kobj);
> > }
> > 
> > static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> > {
> >         return container_of(kobj, const struct device, kobj);
> > }
> > 
> > /*
> >  * container_of() will happily take a const * and spit back a non-const * as it
> >  * is just doing pointer math.  But we want to be a bit more careful in the
> >  * driver code, so manually force any const * of a kobject to also be a const *
> >  * to a device.
> >  */
> > #define kobj_to_dev(kobj)                                       \
> >         _Generic((kobj),                                        \
> >                  const struct kobject *: __kobj_to_dev_const,   \
> >                  struct kobject *: __kobj_to_dev)(kobj)
> > 
> > 
> > Want me to do the same thing here as well?
> 
> It would be nice to have a shared macro code gen all of the above
> instead of copy and pasting it. Then maybe other cases beyond struct
> device could adopt const too..

I think I tried to create such a beast, but failed, so ended up
open-coding it in a few places in the USB headers already.  I can try it
again, but the redirection gets tricky (defines creating defines...)

thanks,

greg k-h
