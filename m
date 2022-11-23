Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899E639439
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:00:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCBB17E8;
	Sat, 26 Nov 2022 08:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCBB17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449616;
	bh=0dPBcIou1yq73/ShQ5ge15FFqP86cP4E6nEb250ZlWo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itovrGx26QIPK+fRZHl21VH4G7hreAWBatr9G4+CYZY/J0MVYIjkk+OaBbak6FQpw
	 hKrSTMmTX9D3CEcP5RiMC9MUKTS5jOKaHExyYvTNZSL8CEnkKAA2hRw9G2hmvGuyzb
	 hd1grGHIQexSvcz3wVwLPRbe5SiFFpmj2xQa/ZkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A44DBF8032D;
	Sat, 26 Nov 2022 08:58:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC4DF8025D; Wed, 23 Nov 2022 14:35:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31236F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 14:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31236F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MdlsoDD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669210514; x=1700746514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0dPBcIou1yq73/ShQ5ge15FFqP86cP4E6nEb250ZlWo=;
 b=MdlsoDD+g5aYaafCzytjg85ZZZe6YPgBDTPEsAlecCFvKz7rTimiamYd
 3Z+uUA4gmD6xi+GqVXapvajJcF6ZBiiNT1EzweEj1R/24kFt1pAqEoGmL
 X03QYh2L+3TFK5BfcTrAtZzhU7pi00tt+ji6wCoTkUoIBz1eGNDMFoUNl
 yqYcErtLhkbU36QGHyEeGtZspKQRXuazyIwJ+qYRLe9BQ/07IpRQStcvs
 qE7n6tp18P9jUBA4HHJT7BslWWX2gM8JmkaKM4We9EFyqblM7pry3zVIh
 yDn/KGINluiqBhj20MqslPgVghpbs996BOrkN1IIAGADVnIkzdF8rj1L5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="301624491"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="301624491"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 05:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="970863671"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="970863671"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2022 05:35:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oxptw-00GImp-12; Wed, 23 Nov 2022 15:34:56 +0200
Date: Wed, 23 Nov 2022 15:34:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:51 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-acpi@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
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

On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.

[...]

> > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> >   {
> >   	return container_of(d, struct ssam_device, dev);
> >   }
> 
> I am slightly conflicted about this change as that now more or less
> implicitly drops the const. So I'm wondering if it wouldn't be better to
> either create a function specifically for const pointers or to just
> open-code it in the instance above.
> 
> I guess we could also convert this to a macro. Then at least there
> wouldn't be an explicit and potentially misleading const-conversion
> indicated in the function signature.

This is an intermediate step as far as I know since moving container_of to
recognize const is a bit noisy right now. I guess you can find a discussion
on the topic between Greg and Sakari.

-- 
With Best Regards,
Andy Shevchenko


