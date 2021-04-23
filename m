Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3C36987C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 19:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4A616DF;
	Fri, 23 Apr 2021 19:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4A616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619199118;
	bh=3fd45qhH8TWDfff3jsutJa8Z49TGH32B7ScJaq9tyaE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uVgZ3eFbI/SNjk1lH0dUggzE3L8XqsIkxN+t/7PKO9ZWwOFgOHnreGc7x9FdkZPar
	 e00vw2xZ2JfKI8c1Fjy1JQKUa6I+vAIEpR5I4QxpE10W6OgO0Zng39Dj0Lw42aPZ7P
	 RkKN/OlpkBB3/AO0OHFsm2LiN6a7bo33p/YZAMKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B186F80256;
	Fri, 23 Apr 2021 19:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04289F80227; Fri, 23 Apr 2021 19:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D101FF800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 19:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D101FF800AE
IronPort-SDR: BenAotB9N3KbdMSIpXesOGlMLorPcYaGMLnJjVfBaJ1ROjm8QjTZ21ZS+XyfxgydWCsyDiu/3d
 oEjqDhoOtkHA==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="176227014"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="176227014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 10:30:16 -0700
IronPort-SDR: H9+pJ0RnWOxq95zAbxojlapA9H16lEreXz5ioaDa6GiMX0Jc7ksJcaW+a51sLjX3NXrGLdTt9x
 Yd6R36OQH8PA==
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="386443849"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 10:30:11 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lZzd2-006cKS-BS; Fri, 23 Apr 2021 20:30:08 +0300
Date: Fri, 23 Apr 2021 20:30:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 05/14] spi: pxa2xx: Consolidate related headers under
 include/linux/spi
Message-ID: <YIMEIEnt4meMP6Hx@smile.fi.intel.com>
References: <20210423163437.89306-1-andriy.shevchenko@linux.intel.com>
 <20210423163437.89306-5-andriy.shevchenko@linux.intel.com>
 <20210423165630.GH5507@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423165630.GH5507@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Daniel Mack <daniel@zonque.org>, linux-input@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
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

On Fri, Apr 23, 2021 at 05:56:30PM +0100, Mark Brown wrote:
> On Fri, Apr 23, 2021 at 07:34:28PM +0300, Andy Shevchenko wrote:
> 
> > We have two headers split between include/linux and include/linux/spi.
> > Consolidated them under SPI realm, i.e. in the latter folder.
> 
> Why?  Isn't the point to maintain an abstraction between the general
> purpose use of the SSP IP and its application as a SPI controller?

Aren't the General Purpose of the SSP IP is an SPI controller either way?
What you are talking about is probably GP SPI vs. private (dedicated) SPI.

But okay, I got the idea, I can drop this patch.

> I'd
> check the cover letter for the series but there doesn't seem to be one.

Set of cleanups here and there related to the SPI PXA2xx driver.
It's hard to add something else here.

-- 
With Best Regards,
Andy Shevchenko


