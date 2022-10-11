Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4385FB492
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660FC3DB1;
	Tue, 11 Oct 2022 16:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660FC3DB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665498577;
	bh=tDN8pO8vkYfi7aIzDYMNy5iW/C9igDir6WIyp4TE2LA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cX+y7S3FOlocweqwYBCfo1S4KxXFGAeCXaeP/+YOXK3IQzvhDy51ssFp+h9HRJ94/
	 KOyyV8mWLuK+UkW7drgv5PL/+LFn9qE6xbX37XHtFWvIypvTI0NemaO4aZtq0sJBcH
	 9usZ4Zh6oRmKrEbxGzhA1yo5va+r2/bj4jSonFDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E41F8021D;
	Tue, 11 Oct 2022 16:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1214EF801D5; Tue, 11 Oct 2022 16:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BCD2F80132
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BCD2F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MV8l2USb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665498513; x=1697034513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tDN8pO8vkYfi7aIzDYMNy5iW/C9igDir6WIyp4TE2LA=;
 b=MV8l2USb1oLlzz9v0MBhbVhCHMPWlOFm2klNfcbX/bdhqCaKuirh6lKR
 guU6UhVabKTedi6QfO1KCuV6acHH45DvCr1lvEbNaABBQunbaTjhog/y8
 rB4O+QCXTx8Cfi8SF0zoMvUMYe/lw994yahtRJo6EQwvCjJoZy4eTq62d
 qBvQGaBQygIdTUK9b+f8f1trqmvWSD0dr8GjWZOHOR1YmjZR53qnGSxpu
 acqUVBj4XAyXX/HmeDcol3kkct7RaKxv8LNtX1U5ZOYXTn5JpT8/oSX9B
 kiMWIFsqL/tefTptBOg/zj5n22hdkedgRq+/VU7F+tvAbXdXt7CW6zrJQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="303254930"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="303254930"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="628713444"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="628713444"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 11 Oct 2022 07:28:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oiGEq-005LfS-1Y; Tue, 11 Oct 2022 17:28:08 +0300
Date: Tue, 11 Oct 2022 17:28:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V57gI75ik4ki3A@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > > > > -#include <linux/gpio.h>
> > > > >  #include <linux/gpio/driver.h>
> > > > > +#include <linux/gpio.h>
> > > > > +#include <linux/hte.h>
> > > >
> > > > Ok with the hte re-order.
> > > >
> > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > to me the way it was.
> > > 
> > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > follow the locale settings...
> > 
> > I have checked, the shell and vim sort gave the same result as in this patch.
> > 
> 
> The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> and that still returns the same result.  That matches what I would
> expect to see given the content of the text.
> 
> And for me vim also gives the original order.
> 
> Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

$ LC_COLLATE=C sort test1.txt
#include <linux/gpio.h>
#include <linux/gpio/driver.h>

$ LC_COLLATE= sort test1.txt
#include <linux/gpio/driver.h>
#include <linux/gpio.h>

I guess this explains the difference. Currently I have en_US.UTF-8.

-- 
With Best Regards,
Andy Shevchenko


