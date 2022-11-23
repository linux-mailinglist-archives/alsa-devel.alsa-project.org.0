Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78386639480
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F40218B4;
	Sat, 26 Nov 2022 09:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F40218B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450371;
	bh=/DumSgjbm3+bFjW/YII5HB+37hZffmS6RIQzxFus23A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9jwLXhasqL53ft3earCI6RjY2QZKwdaJYhze34o5nG2Po3mGixM/0IStbKASqt1Q
	 zVvZYW/hP1OQAMZuzX33iIFaMTgqioChBxdtVCu8gWOWx3oSCgDZto7mNlv/khynUS
	 bM/gK1NU0UZzZnLRGgoPmM4vSNnUVPnkNAmOGsfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF0FF80689;
	Sat, 26 Nov 2022 08:59:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE4C7F8025D; Wed, 23 Nov 2022 16:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26A29F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 16:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A29F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Axk59HaP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7AFF61D32;
 Wed, 23 Nov 2022 15:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFB3C433D6;
 Wed, 23 Nov 2022 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669218768;
 bh=/DumSgjbm3+bFjW/YII5HB+37hZffmS6RIQzxFus23A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Axk59HaPRU6B2o8/sQ2xV/J3QDnuJbllXINFmP+zTkfGNyl9/NsBA856568zy/Zy0
 ziibqVHor7E2pImZW09H3fsO0rmk5lAkiY8/xImxvEPWF1JugZkU42k7XZp/1gGlxF
 YjrYDdmJl0DMzZ+GHnRpj/dpCWN4eBZtN+hiAE0Q=
Date: Wed, 23 Nov 2022 16:52:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35BzXYg8/WGqf6V@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <b93a9fcd-0d7b-14fd-1018-bba35f961a27@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93a9fcd-0d7b-14fd-1018-bba35f961a27@gmail.com>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org
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

On Wed, Nov 23, 2022 at 04:48:41PM +0100, Maximilian Luz wrote:
> On 11/23/22 16:37, Greg Kroah-Hartman wrote:
> > On Wed, Nov 23, 2022 at 02:52:59PM +0000, Matthew Wilcox wrote:
> > > On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
> > > > On 11/23/22 14:34, Andy Shevchenko wrote:
> > > > > On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> > > > > > On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > > > > > > The uevent() callback in struct device_type should not be modifying the
> > > > > > > device that is passed into it, so mark it as a const * and propagate the
> > > > > > > function signature changes out into all relevant subsystems that use
> > > > > > > this callback.
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > > > > > > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> > > > > > >     {
> > > > > > >     	return container_of(d, struct ssam_device, dev);
> > > > > > >     }
> > > > > > 
> > > > > > I am slightly conflicted about this change as that now more or less
> > > > > > implicitly drops the const. So I'm wondering if it wouldn't be better to
> > > > > > either create a function specifically for const pointers or to just
> > > > > > open-code it in the instance above.
> > > > > > 
> > > > > > I guess we could also convert this to a macro. Then at least there
> > > > > > wouldn't be an explicit and potentially misleading const-conversion
> > > > > > indicated in the function signature.
> > > > > 
> > > > > This is an intermediate step as far as I know since moving container_of to
> > > > > recognize const is a bit noisy right now. I guess you can find a discussion
> > > > > on the topic between Greg and Sakari.
> > > > 
> > > > Thanks! I assume you are referring to the following?
> > > > 
> > > > 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
> > > > 
> > > > As far as I can tell this is only a warning in documentation, not
> > > > compile time (which would probably be impossible?).
> > > > 
> > > > As I've said I'd be fine with converting the function to a macro (and
> > > > preferably adding a similar warning like the one proposed in that
> > > > thread). The point that irks me up is just that, as proposed, the
> > > > function signature would now advertise a conversion that should never be
> > > > happening.
> > > > 
> > > > Having two separate functions would create a compile-time guarantee, so
> > > > I'd prefer that, but I can understand if that might be considered too
> > > > noisy in code. Or if there is a push to make container_of() emit a
> > > > compile-time warning I'd also be perfectly happy with converting it to a
> > > > macro now as that'd alleviate the need for functions in the future.
> > > 
> > > Can't we do:
> > > 
> > > static inline const struct ssam_device *to_ssam_device(const struct device *d)
> > > {
> > > 	return container_of(d, const struct ssam_device, dev);
> > > }
> > > 
> > 
> > You could, if you can always handle a const pointer coming out of this
> > function, but I don't think you can.
> > 
> > What you might want to do instead, and I'll be glad to do it for all of
> > the functions like this I change, is to do what we have for struct
> > device now:
> > 
> > static inline struct device *__kobj_to_dev(struct kobject *kobj)
> > {
> >          return container_of(kobj, struct device, kobj);
> > }
> > 
> > static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> > {
> >          return container_of(kobj, const struct device, kobj);
> > }
> > 
> > /*
> >   * container_of() will happily take a const * and spit back a non-const * as it
> >   * is just doing pointer math.  But we want to be a bit more careful in the
> >   * driver code, so manually force any const * of a kobject to also be a const *
> >   * to a device.
> >   */
> > #define kobj_to_dev(kobj)                                       \
> >          _Generic((kobj),                                        \
> >                   const struct kobject *: __kobj_to_dev_const,   \
> >                   struct kobject *: __kobj_to_dev)(kobj)
> > 
> > 
> > Want me to do the same thing here as well?
> 
> That looks great! Thanks!
> 
> I would very much prefer that.

Ok, will respin this patch as at least 2 individual patches, one that
does the change to to_ssam_device() and the next that does the bus-wide
changes.

I'll review the other container_of() users in this patch as well to see
if they can be converted as well.

thanks,

greg k-h
