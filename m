Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52863946A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F20186B;
	Sat, 26 Nov 2022 09:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F20186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450156;
	bh=W5pjJZCX51+xzRA1zXxpo0Z4g8I2gr5TYetrOYDBeQg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buCZbaUdo9pmfZqbh/VYTxXCjlGC/fPDA1duioQSK1/UaW39w1Zv+TdriapmgmFLl
	 QHdCI/mmvFxDDPwAps03cbdPd7vJ87uKSi7aOlb3mYZO+K2KigE8b1j3zZn/9G9Jiv
	 ymLI8TQ43JNRz1CjVhnL93wAK8pfO8iPAXXL6Mjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07718F80620;
	Sat, 26 Nov 2022 08:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F3CAF800BB; Wed, 23 Nov 2022 15:53:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_MED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08178F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08178F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="caDYBku0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d34IWNksyN/fUaMdJSyNyFr5/NYJSUamcGjA6pAMtuA=; b=caDYBku0DlKozdr16VvQx2Pf47
 2FemMLhC3IcrPQOUzURzAZnbhstHNQck3oc9tp/PXObEiBO1MfrwTzqTVM4sWneDrW/0ivZt02rfR
 GJ97qbtKp6invRyg7JlLsZYl3ZG3vWExlD7hzk57S+mKdQTrPuVtfzCSbDoVVJ8FxhHKtoRSJ0jtU
 XYB3KakhM7UNmV0lB+Oflj6FYMkeTc2cxN2tMw87mvmQsXCHH2Ve1EXgve0TduL0q7RtvwUTii1c5
 R8WonwObHfVSic7ZLMDFLvXv3RjVaPGgy5xWCwSrWbCPm+c1AWWTPP+4n4zTi5sjodPbwnBYZMh7x
 2Km029GQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oxr7T-007j3f-RC; Wed, 23 Nov 2022 14:53:00 +0000
Date: Wed, 23 Nov 2022 14:52:59 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y34zyzdbRUdyOSkA@casper.infradead.org>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
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
 Jason Gunthorpe <jgg@ziepe.ca>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Won Chung <wonchung@google.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Jamet <michael.jamet@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
> On 11/23/22 14:34, Andy Shevchenko wrote:
> > On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> > > On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > > > The uevent() callback in struct device_type should not be modifying the
> > > > device that is passed into it, so mark it as a const * and propagate the
> > > > function signature changes out into all relevant subsystems that use
> > > > this callback.
> > 
> > [...]
> > 
> > > > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > > > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> > > >    {
> > > >    	return container_of(d, struct ssam_device, dev);
> > > >    }
> > > 
> > > I am slightly conflicted about this change as that now more or less
> > > implicitly drops the const. So I'm wondering if it wouldn't be better to
> > > either create a function specifically for const pointers or to just
> > > open-code it in the instance above.
> > > 
> > > I guess we could also convert this to a macro. Then at least there
> > > wouldn't be an explicit and potentially misleading const-conversion
> > > indicated in the function signature.
> > 
> > This is an intermediate step as far as I know since moving container_of to
> > recognize const is a bit noisy right now. I guess you can find a discussion
> > on the topic between Greg and Sakari.
> 
> Thanks! I assume you are referring to the following?
> 
> 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
> 
> As far as I can tell this is only a warning in documentation, not
> compile time (which would probably be impossible?).
> 
> As I've said I'd be fine with converting the function to a macro (and
> preferably adding a similar warning like the one proposed in that
> thread). The point that irks me up is just that, as proposed, the
> function signature would now advertise a conversion that should never be
> happening.
> 
> Having two separate functions would create a compile-time guarantee, so
> I'd prefer that, but I can understand if that might be considered too
> noisy in code. Or if there is a push to make container_of() emit a
> compile-time warning I'd also be perfectly happy with converting it to a
> macro now as that'd alleviate the need for functions in the future.

Can't we do:

static inline const struct ssam_device *to_ssam_device(const struct device *d)
{
	return container_of(d, const struct ssam_device, dev);
}

