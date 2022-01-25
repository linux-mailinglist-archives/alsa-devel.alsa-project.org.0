Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B555449BB05
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 19:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8381FE6;
	Tue, 25 Jan 2022 19:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8381FE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643134343;
	bh=jdLQfxgAH6W2Y1TTjkAJ74N2Bxd2GuUgCsHwgxo/Rzc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKNTsfyBcmioXyuLBV9DI40fEzE/ar4KAppvXdLQMLqArvEyksojmIKV455RzqYqb
	 HKVAP7KeObHxabLQrAJ1tY411ssymqnA8a1LGbndERllICUjNo3X2HGFyzLtBg2ah3
	 Tu5js3Wy5rEtPKvCiMMlmrau0O1nEOxcEp2ZycE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1BCAF80118;
	Tue, 25 Jan 2022 19:11:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C323F804C3; Tue, 25 Jan 2022 19:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F7C4F80118
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 19:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F7C4F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W9zrapMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643134266; x=1674670266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jdLQfxgAH6W2Y1TTjkAJ74N2Bxd2GuUgCsHwgxo/Rzc=;
 b=W9zrapMsADPPj9cGTmYjZ3Agq/NY8uGT5DoHxnFDOvPAApFs4dmwHdZJ
 8xoQRVeFwH+mULPiZW4FMk+KuMzozExoTeSYY+qciBCBJBC7pG1w1HMqD
 MjG2b6sbsF/n1UB08T+jK7yL/PABEWFuPmGZaR8qhjs7wKf+N/qyVlqFw
 bDm9MyOcTJUxfFolL8qk6AVpXA+ZEBNow9LxOZkXVCE1WrYTvsN5zHyLI
 0eWJPNwUrrhphm6thH9CXf8lobjNt/nX3pvUXQhcjqJCl6S2zDJnRfKFy
 8pgPAAhgUevXaMWLA9XeF85cmwTHl9hXV69r4PLNVio5BFRxvp7TPiB7q g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227042461"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="227042461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 10:10:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="580837202"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 10:10:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCQGM-00ELO6-FX; Tue, 25 Jan 2022 20:09:50 +0200
Date: Tue, 25 Jan 2022 20:09:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify
 the code
Message-ID: <YfA87pkRPA95aG2f@smile.fi.intel.com>
References: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
 <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca07ce3-6d5c-20cc-8992-4700490ea472@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, tiwai@suse.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On Mon, Nov 29, 2021 at 10:22:41AM -0600, Pierre-Louis Bossart wrote:
> On 11/25/21 1:50 AM, Tang Bin wrote:

> > In the function sst_platform_get_resources(), if platform_get_irq()
> > failed, the return should not be zero, as the example in
> > platform.c is
> >   * int irq = platform_get_irq(pdev, 0)
> >   * if (irq < 0)
> >   * return irq;
> > So remove the redundant check to simplify the code.
> 
> Humm, it's a bit of a gray area.
> 
> the comments for platform_get_irq and platform_get_irq_optional say:
> 
> * Return: non-zero IRQ number on success, negative error number on failure.
> 
> but if you look at platform_get_irq_optional, there are two references
> to zero being a possible return value:
> 
> 	if (num == 0 && has_acpi_companion(&dev->dev)) {
> 		ret = acpi_dev_gpio_irq_get(ACPI_COMPANION(&dev->dev), num);
> 		/* Our callers expect -ENXIO for missing IRQs. */
> 		if (ret >= 0 || ret == -EPROBE_DEFER)

This is bogus == 0 check.

> 			goto out;
> 
> out_not_found:
> 	ret = -ENXIO;
> out:
> 	WARN(ret == 0, "0 is an invalid IRQ number\n");
> 	return ret;
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L234
> 
> I am not sure if there's any merit in removing the test for the zero
> return value. It may be on the paranoid side but it's aligned with a
> possible code path in the platform code.
> 
> Or it could be that the platform code is wrong, and the label used
> should have been
> 
> /* Our callers expect -ENXIO for missing IRQs. */
> if (ret >= 0 || ret == -EPROBE_DEFER)
> 	goto out_not_found;

In case one wants to dive into new discussion on the topic:

https://lore.kernel.org/linux-serial/20220110195449.12448-2-s.shtylyov@omp.ru/T/#u

-- 
With Best Regards,
Andy Shevchenko


