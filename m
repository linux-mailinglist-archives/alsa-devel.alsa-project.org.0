Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E9600F08
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 14:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C58D6C86;
	Mon, 17 Oct 2022 14:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C58D6C86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666009171;
	bh=RmYFEN28phqSp8mG6aCLWFWEADNDyPYb/TiMHr0QPNc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnLkDo+cGR4IuXmSlm3tIXHqW/Cs5saIvWvgtFl9VzSev3+thYOx5S0AbJcDPzISZ
	 6CazolGsoHQq5aDJfqXDLYTGSOVCo404emSLPK4uOteqVmza1h/us2yqr97qLZtrTW
	 1G5w74Nu0hwfNmhUKQatQKV+BA17iEkndF4m4Mwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D41C0F800E5;
	Mon, 17 Oct 2022 14:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9444F8025E; Mon, 17 Oct 2022 14:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A3E4F800E5
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 14:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A3E4F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MmUYf+hJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666009109; x=1697545109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RmYFEN28phqSp8mG6aCLWFWEADNDyPYb/TiMHr0QPNc=;
 b=MmUYf+hJk9h3PVURw/QobnSQjibOC0oL5Tqo007jreRh8+mOpXuwD7jv
 ow+MrMJrBDYanQt1JFYMg+sxnkPJbu6859RlZnbIHaZtv0mj3AelYxjQ+
 QXskL/eE5RRkJMEdssJd3rqGaDKm+23XjBRNaqeUE3FPQEU1w/pcVV1O4
 V6x/DJUZLvSaeU7ZG3/BaAT0m6ZL3FDYZaYXl129STQ8423r/yy0fPcf7
 Hrx2QPgODG3cMXcsZWkEBHqrSNXTD1i18RKXl8VCpJzWMY6lxg+9tp4FF
 /fggQEKIAxPiAp7JDgZa5kmbb234+0fqgYmgc65t7b4Sdl4c9Z4anli0P g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="392086210"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="392086210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 05:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="623207818"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="623207818"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 17 Oct 2022 05:18:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1okP4U-008mkH-2E; Mon, 17 Oct 2022 15:18:18 +0300
Date: Mon, 17 Oct 2022 15:18:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
Message-ID: <Y01ICtqd8uy/4/Mb@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
 <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
 <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 11:58:03AM +0200, Linus Walleij wrote:
> On Mon, Oct 17, 2022 at 11:27 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> > > On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > > than logical. This series is basically out of two parts:
> > > > - add missed headers to the pin control drivers / users
> > > > - clean up the headers of pin control subsystem
> > > >
> > > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > > of the pin control.
> > >
> > > Aha I see you want to send a pull request so I backed out the applied patches
> > > from the series for now.
> >
> > Can I consider all that you answered to as Rb tag?
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

> I haven't reviewed in detail but I fully trust you to do the right thing
> and fix any fallout so will happily pull this.

The plan is to push this to Linux Next for a couple of days and then I'll send
PR to you and Bart.

-- 
With Best Regards,
Andy Shevchenko


