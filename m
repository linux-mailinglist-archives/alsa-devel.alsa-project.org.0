Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B9564871
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jul 2022 17:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB7F916F7;
	Sun,  3 Jul 2022 17:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB7F916F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656862686;
	bh=9KtnUXijkw+SsbUzhzgcSO+B35FVl4swxgVzrpAHbjQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCm/eTBghkcIuDpO+acJyx1OHqB2s3rdXUJG1wH8NZyf0syzGS5ZPNUIvEzVVm8YT
	 lBpnxNDoRqQoRzplpjs2G531GqI1NbrVEOJ+RyUfQhaeIZRiS03HRYtBxP4rVh4oYi
	 1C+co/guyM/DgVeDR6Q0ds7Y4bGkNfutV5kqzhpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30496F80254;
	Sun,  3 Jul 2022 17:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1513F8014E; Sun,  3 Jul 2022 17:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D91E9F8014E
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 17:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91E9F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bqI7IFLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656862620; x=1688398620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9KtnUXijkw+SsbUzhzgcSO+B35FVl4swxgVzrpAHbjQ=;
 b=bqI7IFLWhK3SzRrPbvvUaH2lJTUeETD4ds1LRlOfM8G4iB0jyJYgyv4D
 xmEKvV4VSsBcLRsD7Wf7ltTJub7HnA5DumJoiXEh6kcucpzmW3taZyYmU
 xWUllnTwMlaYhvmL1lflSvDoaUnodqMF7dzxqB/LE+3LVeTZXRVj0wC8T
 z0APX8Tp0GAN2a2O5U3seftLdnWCfSJwYguEJxLCbm74icx0/G6wmqT0c
 ZrSY/VuZNoATw3ne0bs9XVwQ0TJA9LIJHR6FPW9S8iW+yLiNpeMTlQPEz
 khPb0afr+HIHqlK3Mk9PvoV8xn0/GtvA44RFmvi622Hwh/u1BdBRK7Twl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="263361615"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="263361615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2022 08:36:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="624793392"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2022 08:36:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1o81eS-0014QN-36; Sun, 03 Jul 2022 18:36:48 +0300
Date: Sun, 3 Jul 2022 18:36:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-ID: <YsG3kKwmoqF2MxU2@smile.fi.intel.com>
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
 <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

On Mon, Jun 06, 2022 at 10:29:59AM +0100, Richard Fitzgerald wrote:
> On 03/06/2022 18:07, Andy Shevchenko wrote:
> > When kernel.h is used in the headers it adds a lot into dependency hell,
> > especially when there are circular dependencies are involved.
> > 
> > Replace kernel.h inclusion with the list of what is really being used.
> 
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks!

It's a month passed without any other news about this patch.
Is this a problem in the MAINTAINERS database?

Who should take this?

+Cc: Liam, Mark

-- 
With Best Regards,
Andy Shevchenko


