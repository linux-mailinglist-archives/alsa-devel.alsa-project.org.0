Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F40ED63BA1B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 08:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9081690;
	Tue, 29 Nov 2022 08:02:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9081690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669705399;
	bh=TYZva1qhZaDDzx7ssD6565IlpCg24ayIFbcaC7tY8Tc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDOvBledgLljrubdEcsEbZjX9bM6xev2mckbRNuXoi2EPrsuEw8jQqv3Sr39T1MmP
	 oowep6PMRl1XHZ/blb8HexuZTL9tD0XFVI0EOZrQLKmh8+zZiSrVVcv8HPb8UuhOoV
	 SqbcLVPlsqCxB/B77YQCqUUQBuy1WzCa+3U0F0og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 633FBF801F5;
	Tue, 29 Nov 2022 08:02:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77CCF800B6; Sat, 26 Nov 2022 16:44:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35777F800B6
 for <alsa-devel@alsa-project.org>; Sat, 26 Nov 2022 16:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35777F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V1SxMmpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669477452; x=1701013452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TYZva1qhZaDDzx7ssD6565IlpCg24ayIFbcaC7tY8Tc=;
 b=V1SxMmpbUl+nWWZ8R41Pd+bRfL9qCWJUUMinYD0rKmcz3vblKHJ9Sn38
 rFsJVplbr8gt8yW5dMjNxIuLMmO05Y6VmEStILLQO0ISJ4ZS/0uMZ72XB
 T3U32Q0MB4zv0n1w1jrExqhpup401jlrVa39kIz9Fx45jg8EoDjhgNwW4
 Ovqdy3rket2RW0vPqcKgbDSBbZJKseap5W6a5UU+bvLDrSulec6eUl7Ng
 LQnNAjfCe8v5TnzXfFPixZwd3vGCWUdh5RGFjgteu8obCo7tkOIOv6eXi
 nuHHqUxD+X3gQLqf2C45ar2rd71AsEvAT15gKkgzLQ8Uu9pPdLbi/2QxS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="294305969"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; d="scan'208";a="294305969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2022 07:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="620587303"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; d="scan'208";a="620587303"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP; 26 Nov 2022 07:43:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@intel.com>) id 1oyxLL-000Bco-1n;
 Sat, 26 Nov 2022 17:43:51 +0200
Date: Sat, 26 Nov 2022 17:43:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <Y4I0N3KpU/LSJYpd@smile.fi.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221122185818.3740200d@jic23-huawei>
 <20221122201654.5rdaisqho33buibj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122201654.5rdaisqho33buibj@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Tue, 29 Nov 2022 08:02:18 +0100
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 linux-pm@vger.kernel.org, linux-actions@lists.infradead.org,
 Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jonathan Cameron <jic23@kernel.org>
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

On Tue, Nov 22, 2022 at 09:16:54PM +0100, Uwe Kleine-König wrote:
> On Tue, Nov 22, 2022 at 06:58:18PM +0000, Jonathan Cameron wrote:

> > Queued all of the below:
> > with one tweaked as per your suggestion and the highlighted one dropped on basis
> > I was already carrying the equivalent - as you pointed out.
> > 
> > I was already carrying the required dependency.
> > 
> > Includes the IIO ones in staging.
> > 

> > p.s. I perhaps foolishly did this in a highly manual way so as to
> > also pick up Andy's RB.  So might have dropped one...
> 
> You could have done:
> 
> 	H=$(git rev-parse @)
> 	b4 am -P 49-190 20221118224540.619276-1-uwe@kleine-koenig.org
> 	git am ...
> 	git filter-branch -f --msg-filter "grep -v 'Signed-off-by: Jonathan'; echo 'Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>'; echo 'Signed-off-by: Jonathan Cameron <jic23@kernel.org>'" $H..
> 
> (untested, but you get the idea).

That's, for example (just last from the history as is), how I usually do it
(tested):

 git filter-branch --msg-filter 'sed -e "/Signed-off-by: Andy Shevchenko/ a Tested-by: Daniel Scally <dan.scally@ideasonboard.com>"' -f HEAD~4..HEAD


-- 
With Best Regards,
Andy Shevchenko


