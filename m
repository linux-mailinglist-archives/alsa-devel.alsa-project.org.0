Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408F424299
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:27:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4FB166E;
	Wed,  6 Oct 2021 18:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4FB166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537624;
	bh=AhoRHcbkSS3DwgxgtGBJ7igEoFOyK87iao3hdcNjR4Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jeXeixHgXX6yyZSNBDfpn3bLsZy/v6CGTX6f2IMM174BBPzfNztK6zrcc5eo3OXrt
	 9+5GUXDdnBZHpae42Tlwz5P2Ji5qjTKcRLTZHKlkIUK/VZ7TgGe1VQi6gRulyYTE0m
	 50D+zl4Y+kr9uHr4fkPzDjv3NLqGQjZyavWaTzmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4151FF80302;
	Wed,  6 Oct 2021 18:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 082F0F802D2; Wed,  6 Oct 2021 18:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5BD5F80240
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5BD5F80240
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="249318350"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="249318350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:25:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="484178307"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:25:04 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mY9j2-009Fq7-Q6; Wed, 06 Oct 2021 19:25:00 +0300
Date: Wed, 6 Oct 2021 19:25:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
Message-ID: <YV3N3KqGJN7Dztwa@smile.fi.intel.com>
References: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
 <c8b85524-6b9f-8fd3-3978-1d26b92660fd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b85524-6b9f-8fd3-3978-1d26b92660fd@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Oct 06, 2021 at 10:52:54AM -0500, Pierre-Louis Bossart wrote:
> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
> > Access to platform data via dev_get_platdata() getter to make code cleaner.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> For the series
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.com>

Thanks!

> FWIW Marc likes a cover letter that's kept in the merge logs.

Noted!

-- 
With Best Regards,
Andy Shevchenko


