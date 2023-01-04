Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF765DA9C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 17:46:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4FFBD16;
	Wed,  4 Jan 2023 17:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4FFBD16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672850777;
	bh=n827LXFF0m/V8FFdJYZ6rHgfWaPvWoE7fWU+oAtQlfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tSloVU0fywK24C4jzc9OijWY+BpwjMltql2Z2WIZQPn9BwLflgig0CGfDx+BoA37i
	 wnGXh3iw735Y3Yg8tUs4MMKc+tpOWWOAloP768NjfGKn0mPSs1YcjmTmAiP4+Cfwr7
	 zRXKMH2wZHMCGRJuJy2opppD9kLN1qq8p4lzrRWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C955BF8023A;
	Wed,  4 Jan 2023 17:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D54BF8024D; Wed,  4 Jan 2023 17:45:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E05F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 17:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E05F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QbZ7oM7y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672850722; x=1704386722;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n827LXFF0m/V8FFdJYZ6rHgfWaPvWoE7fWU+oAtQlfQ=;
 b=QbZ7oM7y8Ih6a5XPWQFiFLa7wQiu4OLxwb5mh0/w5dXrZqvfyiW8XmoI
 KZ9mqkuzbpk72ukwRxPuihrxaJDssvbr8AvPHWt/JTSmg7awKpNpLXpXA
 60iwouZTEksJkCE9bXRh7N5XT/+qmzjYccd3R1DQxmCcyBbvEFJ8FP+Rm
 D5Vq7Xvzvzh0ubG4o9fFC4YXGThxVfFVOgBWF53jAj9efdFCQF+csR9YU
 IXrNZ3ed6SjxFbfM+vah9ds7qV5FCNMQynXvdWJd1gp4jDBl5xIWrtQeG
 hgbmeo6k5l/sJTsfgNJG/8t30PT0npmLrk1L0DcY5+4ErtWhMGO7qPXyd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="408233896"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="408233896"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 08:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="648635619"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="648635619"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 04 Jan 2023 08:45:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pD6t6-004Noc-1d; Wed, 04 Jan 2023 18:45:12 +0200
Date: Wed, 4 Jan 2023 18:45:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
Message-ID: <Y7WtGBenfisLjwbu@smile.fi.intel.com>
References: <20230102203037.16120-1-andriy.shevchenko@linux.intel.com>
 <731b2d59-22f1-a456-bcfc-040a1adccce0@linux.intel.com>
 <Y7VVCc7TjY3YsJoV@smile.fi.intel.com>
 <151a05a5-fc56-e005-e572-d031e6de0bb1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <151a05a5-fc56-e005-e572-d031e6de0bb1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 04, 2023 at 08:15:27AM -0600, Pierre-Louis Bossart wrote:
> On 1/4/23 04:29, Andy Shevchenko wrote:
> > On Tue, Jan 03, 2023 at 09:08:20AM -0600, Pierre-Louis Bossart wrote:
> >> On 1/2/23 14:30, Andy Shevchenko wrote:
> >>> Instead of calling put_device(&adev->dev) where adev is a pointer
> >>> to an ACPI device, use specific call, i.e. acpi_dev_put().
> >>>
> >>> Also move it out of the conditional to make it more visible in case
> >>> some other code will be added which may use that pointer. We need
> >>> to keep a reference as long as we use the pointer.
> >>>
> >>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >>
> >> Answering for the series: we should make the change across all Intel
> >> machine drivers. I see at least four cases that were missed
> >>
> >> bytcr_rt5640.c:         put_device(&adev->dev);
> >> bytcr_rt5651.c:         put_device(&adev->dev);
> >> bytcr_wm5102.c: put_device(&adev->dev);
> >> sof_es8336.c:           put_device(&adev->dev);
> > 
> > Aren't they (they all problematic, btw) covered by the fixes series
> > https://lore.kernel.org/r/20230102203014.16041-1-andriy.shevchenko@linux.intel.com?
> 
> They are indeed, but if you group AMD-related patches with Intel ones,
> it's only human for reviewers to skip the thread entirely, even more so
> when catching up with email on January 3 :-)

Ah, I will try to remember to split also by platform (there are not many that's
why I decided to group them by the problem type only).

> For this series
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thank you and HNY!

-- 
With Best Regards,
Andy Shevchenko


