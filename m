Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9299C461FD5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 20:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3519518F3;
	Mon, 29 Nov 2021 20:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3519518F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638212635;
	bh=8jKsksVd0d4nfIvtTOvPPSuHcBwHJn48f4XlriyKYLw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HY7EREhfv9xLsShwwGp/XQkf/cBLNA1JicUq6UtFIiJ5fRZRLi8VlnC9XlNOHtT0E
	 L4LwqMoA7/c4mKXAolXq7/q5wqWC27C7zuPiWvYKTwXAw5nA92Dz2Pzgnjl+2qZlZa
	 18qzjRRsQ75o8OuF6BnHT56UP0r8NOyb2lgY5ovM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E7DEF8020D;
	Mon, 29 Nov 2021 20:02:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B28F80240; Mon, 29 Nov 2021 20:02:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 530F7F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 20:02:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 530F7F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="299449755"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="299449755"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 11:02:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="540104285"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 11:02:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mrlts-0007uP-K5; Mon, 29 Nov 2021 21:01:16 +0200
Date: Mon, 29 Nov 2021 21:01:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify
 the code
Message-ID: <YaUjfFNA6IScPCY9@smile.fi.intel.com>
References: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
 <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
 <YaUJ2EfU6kYFfjWn@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaUJ2EfU6kYFfjWn@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com
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

On Mon, Nov 29, 2021 at 05:11:52PM +0000, Mark Brown wrote:
> On Mon, Nov 29, 2021 at 10:22:41AM -0600, Pierre-Louis Bossart wrote:
> > On 11/25/21 1:50 AM, Tang Bin wrote:
> 
> > > In the function sst_platform_get_resources(), if platform_get_irq()
> > > failed, the return should not be zero, as the example in
> > > platform.c is
> > >   * int irq = platform_get_irq(pdev, 0)
> > >   * if (irq < 0)
> > >   * return irq;
> > > So remove the redundant check to simplify the code.
> 
> > Humm, it's a bit of a gray area.
> 
> > the comments for platform_get_irq and platform_get_irq_optional say:
> 
> > * Return: non-zero IRQ number on success, negative error number on failure.
> 
> > but if you look at platform_get_irq_optional, there are two references
> > to zero being a possible return value:
> 
> Zero is (or was, people were working on changing it partly due to
> confusion and partly due to moving to newer infrastructure which
> doesn't use it) a valid IRQ on some architectures.  x86 wasn't one of
> those though, at least AFAIR.

I guess it's about x86, but the API returns Linux virtual IRQ and 0 shouldn't
be among them (hardware IRQ != Linux virtual IRQ). Legacy x86 used 1:1 mapping
for ISA IRQs (lower 16) among which the Timer IRQ is 0. I believe that timer
code does not use any of those APIs (it most likely and IIRC has it hardcoded).

Nevertheless, I have planned to make platform_irq_get_optional() to be optional
indeed, where we return 0 when there is no IRQ provided and error when it's a
real error happens. This needs to clean up the current (mis-)use of the API.

-- 
With Best Regards,
Andy Shevchenko


