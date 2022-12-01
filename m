Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 375CA640784
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 14:12:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD41C17B4;
	Fri,  2 Dec 2022 14:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD41C17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669986751;
	bh=p4GYPrcLemfL1H4zQdK4YSafqKxYl8uzcCcsuNR5Mug=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrnSFEAPIvImykuRkwlN0Cn/dgGSGu+JsndXb9eYbzny0DopBhlqW/Dqnib5zLkym
	 2oAOYgtbR1/enryaFzqHGm+cko9rGj4mi90eT1r5oxHPcilrRTInVoB6Y+7t85yO1o
	 VmVLDNdmkuRvAkLErg/6PaZtV8AjU9Cog4jFUIQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7458BF8026A;
	Fri,  2 Dec 2022 14:11:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BCD8F8028D; Thu,  1 Dec 2022 19:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_30, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FDB2F80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 19:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FDB2F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="a2BoPen0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADE6A620C3;
 Thu,  1 Dec 2022 18:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208F8C433D6;
 Thu,  1 Dec 2022 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669920204;
 bh=p4GYPrcLemfL1H4zQdK4YSafqKxYl8uzcCcsuNR5Mug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2BoPen065qBe8Og5canw6L1zfhJNTp7AhJG9KCJ6kiqz0PbaFOGVhFTqYEHLQC/3
 txrNOo/kDMMWMmzGqvPwfOzgrz6vwm2Q1DicWoYbq+xwADN5A7BOVkCSHc8BU+fkbm
 ahiTJmpUWGq4d9z7eAd6F7xiHvrsPEH9AaFENflI=
Date: Thu, 1 Dec 2022 19:43:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y4j1yPD4Ypze7jx5@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com> <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org> <Y35enjI+dhhqiG3B@ziepe.ca>
 <Y35ftyYlE8FX8xQO@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35ftyYlE8FX8xQO@casper.infradead.org>
X-Mailman-Approved-At: Fri, 02 Dec 2022 14:11:34 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Frank Rowand <frowand.list@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

On Wed, Nov 23, 2022 at 06:00:23PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 01:55:42PM -0400, Jason Gunthorpe wrote:
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
> > Aside from less letters, is their another benifit to using *(in) ?
> 
> I don't think so.  It just looks nicer to me than putting the star in
> each case.  If I'd thought of it, I would have done it to page_folio(),
> but I won't change it now.

Ah, but your trick will not work, that blows up and will not build.  The
original one from Jason here does work.  _Generic is tricky...

thanks,

greg k-h
