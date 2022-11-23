Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D434639488
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:14:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35CCD18C1;
	Sat, 26 Nov 2022 09:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35CCD18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450491;
	bh=imibZHjJL9cpBpAGiGFcUllw5xFRNIsDuHu6Y+fwag4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgV+XaYMVn3rWxxA/fIyq9fNszJkR64jXrc/laOMTVXN0HlrPys8q6H/HRB0MlUmn
	 qzy+k+nbSAnKxAszv7YERPM/3NpOSdmVjcWahTa0g4JT7Q7JqI2V95cf0jjNIGUuR7
	 vb4JRyJrKnC2Bb98XXrJOvNdMuArN9pL2tRedl9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F810F8071D;
	Sat, 26 Nov 2022 08:59:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D6AFF8025D; Wed, 23 Nov 2022 20:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4042EF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 20:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4042EF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="V2GZdWHP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16BBFB82405;
 Wed, 23 Nov 2022 19:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7968C433D6;
 Wed, 23 Nov 2022 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669230382;
 bh=imibZHjJL9cpBpAGiGFcUllw5xFRNIsDuHu6Y+fwag4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2GZdWHPvr+u9NV42kW3apisS1jk4Cp6h19MZ6qfaWIUGIVJV5gV2ha39zpYgwqP7
 WIt60wd9b8FvKniDUGYZZUiLCvZQFxPf+YdmrcSFnI46/b/EWX33zlFDz2TQxA125f
 2aOS9p5Y/Iiz28acyMaujccSu8U/Ol2yQw6Symkw=
Date: Wed, 23 Nov 2022 20:06:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35vLAWWfezPvGSm@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com> <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35iKfYf3ThdVvaR@kroah.com> <Y35lt+0jXrOKynL5@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35lt+0jXrOKynL5@ziepe.ca>
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

On Wed, Nov 23, 2022 at 02:25:59PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 23, 2022 at 07:10:49PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > > 	_Generic(in,                                        \
> > > >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> > > >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > > 		  )
> > > 
> > > There's a neat trick I found in seqlock.h:
> > > 
> > > #define generic_container_of(in_t, in, out_t, m)			\
> > > 	_Generic(*(in),							\
> > > 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > > 		in_t: ((out_t *)container_of(in, out_type, m))	\
> > > 	)
> > > 
> > > and now it fits in 80 columns ;-)
> > 
> > Nice trick!  Dropping the inline functions is a bit different, let me
> > see if that still gives a sane error if we pass an incorrect type or
> > mess with the const * the wrong way.  I'll run some tests tomorrow
> > afternoon...
> 
> The errors in some cases are very verbose, but it is somewhat
> understandable - the worst is when _Generic fails to match anything,
> but also at least clang partially expanded container_of and it throws
> other assertions too.
> 
> I also wonder if this could just be rolled into the normal
> container_of.

I think we might be able to now, my previous attempts with inline
functions prevented that.  I'll beat on that tomorrow...

> in_type would have to be derived like:
> 
>   in_type = typeof((out_type *)NULL)->out_member)
> 
> But I don't know if you can use typeof in a generic type matching expression..

Maybe that is what threw me before, I can't remember.  I do know we
tried a number of different attempts, can't recall the failed ones...

thanks,

greg k-h
