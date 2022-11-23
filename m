Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C473639487
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:14:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A2118CF;
	Sat, 26 Nov 2022 09:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A2118CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450477;
	bh=CjhGw4nh9GoOoZ04Ov8WJW3MDmP00LzPqIoi+akjv3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgQGYsKPRSyuFBFUsjXiVnOo3YA09NIN4FdRnlYxvli6iWpLB5yaQhzrFBMKT/8W2
	 rk1kdL3qPrzhcQ5O2rYBxUJgojNhYsV92RbIqQRaqUKTxdrHDMb1/S8iefcnUqou0S
	 G6ATwXULpUsI53aCw0EG81UOp4HVU85NJStTKWWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8BEF80716;
	Sat, 26 Nov 2022 08:59:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E847F8025D; Wed, 23 Nov 2022 19:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0037FF80249
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 19:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0037FF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="cedo7ZWS"
Received: by mail-qt1-x835.google.com with SMTP id l15so11783219qtv.4
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 10:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wor3YG1VA6P7o8c/O7L7eJMI/pZ9HPWWwXQft3hmCP0=;
 b=cedo7ZWSmsuH0XJ4ubpV07F12j6QbWjVQ5/8pLuMpcToghtBSuk56S6MXMX6Qm7WjS
 1NChO+moKmrDNMneamIggSvWWzwr/T//kN/Kwcj6tkr42ZlPhD/UrODWK93fqzNGGGwJ
 iaes3XW9eYna/Bw5lL+n4z8tFP5LtgS2cmv98rZ7AlPx3XDSdaiaMvzcA8+djvnqI1Jm
 kByuaQkEy2IUN0jEoJWE9aJxjegXkz/nFnBqeS7bAW8o6PzzHwTSega1vNzAX6eGe++Z
 VrL1e2yxkd6Af/0OPW4nuezYyEJvxr1zGiOqJwebNXGUK6ij0o7CaXNXzEmp7wpIRmex
 6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wor3YG1VA6P7o8c/O7L7eJMI/pZ9HPWWwXQft3hmCP0=;
 b=YJ4EvCouHpmf2bGlR2IrhrNPV/RFEp2eCG+Pdzb02yH79DMJgmK9I1FK9ecG95vNOP
 Qy+PTSshnfkSBV6q/wwej4hjNUZkxgw3N4FDqs0a80v7P6gJNmJSI0YQnkNXHYJXYKiL
 /bTZcJ72wdZVZnQ/weouEHfxzfghhmryyPg0WpHHymTpjwEFE8TbyvCr3FDrbcsVZi27
 s4rB+TdEFoGuxMniGj8Nog+lnIk6NI7fCWcwoIWRxmXBpsJ5huz9dn8UEiX2kYS3ggJy
 8u+xHcJfbE5OygeAxfVVkRPo8T9s8JaLQYKlBGOT07Othz4h/GUNAbg/alSLYTf57lHu
 9tyw==
X-Gm-Message-State: ANoB5pmQBLppYQfz09wIBAc8eu6erzJgAXhDLURIz+1rWXyXSFw9IMvn
 FJqTso1gbMCK2Gw82dXKQZPVRg==
X-Google-Smtp-Source: AA0mqf7b8dECsNl10eMwxdSE/ntYRY0ZHq3jcx6smQ+WjEjXUXHAE2sWPKfXnqS1wuH6GWMgna/H+Q==
X-Received: by 2002:a05:622a:1f97:b0:3a6:39c4:dc6 with SMTP id
 cb23-20020a05622a1f9700b003a639c40dc6mr19492448qtb.515.1669227960618; 
 Wed, 23 Nov 2022 10:26:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 e9-20020ac81309000000b003a56796a764sm10034417qtj.25.2022.11.23.10.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 10:25:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxuRb-00AgEQ-7R;
 Wed, 23 Nov 2022 14:25:59 -0400
Date: Wed, 23 Nov 2022 14:25:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35lt+0jXrOKynL5@ziepe.ca>
References: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com> <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35iKfYf3ThdVvaR@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35iKfYf3ThdVvaR@kroah.com>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
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

On Wed, Nov 23, 2022 at 07:10:49PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > 	_Generic(in,                                        \
> > >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> > >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > 		  )
> > 
> > There's a neat trick I found in seqlock.h:
> > 
> > #define generic_container_of(in_t, in, out_t, m)			\
> > 	_Generic(*(in),							\
> > 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > 		in_t: ((out_t *)container_of(in, out_type, m))	\
> > 	)
> > 
> > and now it fits in 80 columns ;-)
> 
> Nice trick!  Dropping the inline functions is a bit different, let me
> see if that still gives a sane error if we pass an incorrect type or
> mess with the const * the wrong way.  I'll run some tests tomorrow
> afternoon...

The errors in some cases are very verbose, but it is somewhat
understandable - the worst is when _Generic fails to match anything,
but also at least clang partially expanded container_of and it throws
other assertions too.

I also wonder if this could just be rolled into the normal
container_of.

in_type would have to be derived like:

  in_type = typeof((out_type *)NULL)->out_member)

But I don't know if you can use typeof in a generic type matching expression..

Jason
