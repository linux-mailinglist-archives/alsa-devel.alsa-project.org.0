Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA95FB6D8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 17:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16343EBE;
	Tue, 11 Oct 2022 17:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16343EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665501652;
	bh=hq8H9GCveZZvFxxgF//YL8HEPEJFc1DXWo1WrcAUuRw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzPzYvZZo6cXckt/Sp/oD6W9lx08/FIgVIGuKaLAz410xtKTOatfm18/Ew5fPdH4R
	 FuREcGd+6ftihEyLxprg2blk+g/s8OZO4mnSEnRaTqU81oOMzQfdQvWfaOFEimZ62/
	 NnCyhvzhM/gxnO6cZhOtOj90jYBgYMPZqZN3KWQg=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D23F8021D;
	Tue, 11 Oct 2022 17:19:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE88F801D5; Tue, 11 Oct 2022 17:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B22D9F80130
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 17:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B22D9F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GQGK0ViZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665501588; x=1697037588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hq8H9GCveZZvFxxgF//YL8HEPEJFc1DXWo1WrcAUuRw=;
 b=GQGK0ViZaumI5CmDawImmwJAxeonEMNcxj1QSp8MbwIXwuLG9Lu80fyD
 kyD4fJZOXMTllaJUKrwUzw10uAZJhoByivd+PtXR8/c8ztgxd2CppLMGN
 auWR0heN3i41oZgqvYh/X+04RYSIcMZdicm4hrHp+J8mm0mOBmZtXfDOS
 Y14NJp9jM20azvbtvZm/651NfwszO12m7LnktxOe/8JEbAz8F/n+V7gUO
 Mz6YayLgyEq2b7Xiph57nOhoLnbRPMslKXgdptbZrZxE1rtwu/1Hbk8eJ
 U5mGZ57K2T4rLNvlHnKY0bi7lVQBKo2N8EllZQSy1e/V3cZFC2g2h8cDs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="305585983"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="305585983"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 08:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="955372479"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="955372479"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2022 08:19:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oiH2H-005NYA-25; Tue, 11 Oct 2022 18:19:13 +0300
Date: Tue, 11 Oct 2022 18:19:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol>
 <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
 <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

On Tue, Oct 11, 2022 at 04:39:46PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 11, 2022 at 4:31 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> > > On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > > > > > > -#include <linux/gpio.h>
> > > > > > >  #include <linux/gpio/driver.h>
> > > > > > > +#include <linux/gpio.h>
> > > > > > > +#include <linux/hte.h>
> > > > > >
> > > > > > Ok with the hte re-order.
> > > > > >
> > > > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > > > to me the way it was.
> > > > >
> > > > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > > > follow the locale settings...
> > > >
> > > > I have checked, the shell and vim sort gave the same result as in this patch.
> > > >
> > >
> > > The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> > > and that still returns the same result.  That matches what I would
> > > expect to see given the content of the text.
> > >
> > > And for me vim also gives the original order.
> > >
> > > Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?
> >
> > $ LC_COLLATE=C sort test1.txt
> > #include <linux/gpio.h>
> > #include <linux/gpio/driver.h>
> >
> > $ LC_COLLATE= sort test1.txt
> > #include <linux/gpio/driver.h>
> > #include <linux/gpio.h>
> >
> > I guess this explains the difference. Currently I have en_US.UTF-8.
> 
> Throwing my can of paint into the mix...
> 
> I think it is more logical to first include the general <linux/gpio.h>,
> followed by whatever <linux/gpio-foo.h> and <linux/gpio/bar.h>,
> irrespective of (language-specific or phonebook) sort order.
> 
> Yeah, it sucks that this requires some manual work after running sort...

It seems that kind of issue is in this patch only.

-- 
With Best Regards,
Andy Shevchenko


