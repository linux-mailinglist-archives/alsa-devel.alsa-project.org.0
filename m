Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBA204CB2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 10:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2AE5174C;
	Tue, 23 Jun 2020 10:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2AE5174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592901700;
	bh=jZ2lN+CSqX9Zh0UBog3v+oGDCSRbwhth64qQXgZZLso=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUEPtiqdmDg8UDOxH6hSOK+Xv2PWJHUzd9WV7KI+WUhIrShH1QtAcLuNw9Zm9UUPD
	 LcEuRrj18pH8+XrKqLHDhssXwCcJoW+0wy8QIMgaIYrOPGzW3ipFYK7GAopzY+rVSl
	 JdmiuCtvzE1Scd0AAiKqpj+YO64wxtLpxvdXS/VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED30F80259;
	Tue, 23 Jun 2020 10:40:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B2B0F80249; Tue, 23 Jun 2020 10:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B5F5F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 10:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B5F5F8012F
IronPort-SDR: WFgn+IUPb5JEZot1gwEd4G0HClQjsrqePwmRkz5ZT4zGNOX6YPY5sLRjU7mzGaJ+ljMtIqg3on
 tZ6kedRfoikQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="132412505"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="132412505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 01:40:12 -0700
IronPort-SDR: FXSIu2fHdxpM28e8Iv5z8RY4UVDqH4QHcGibD0I7V0d8u+BKI6XTa5QXk3e3MqkSLeOMx4dz6W
 3NQ5feTq047w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="275275805"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 23 Jun 2020 01:40:10 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jneTT-00FKL4-VG; Tue, 23 Jun 2020 11:40:11 +0300
Date: Tue, 23 Jun 2020 11:40:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
Message-ID: <20200623084011.GM2428291@smile.fi.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
 <20200622181824.GG2428291@smile.fi.intel.com>
 <04af7e48-e694-7657-5477-81b6e2e8d1c1@linux.intel.com>
 <20200622182651.GR4560@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622182651.GR4560@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>
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

On Mon, Jun 22, 2020 at 07:26:51PM +0100, Mark Brown wrote:
> On Mon, Jun 22, 2020 at 01:23:04PM -0500, Pierre-Louis Bossart wrote:
> 
> > So I explicitly added a test for all possible cases. I don't mind removing
> > the _OR_NULL if indeed it's safe, but showing this redundancy also shows an
> > intent to deal with such cases.
> 
> Yeah, I think that's fine - it's perhaps redundant but we're not in a
> hot path and as well as the intentionality it saves the reader from
> having to know if gpiod_put() copes with NULL or not.

What the point?
We can document this instead of being a dead code, right?

IS_ERR() may happen there only if we assign such pointer to be error. Is it possible case here?


-- 
With Best Regards,
Andy Shevchenko


