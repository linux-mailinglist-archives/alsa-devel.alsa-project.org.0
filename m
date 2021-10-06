Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB0424294
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF04915F2;
	Wed,  6 Oct 2021 18:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF04915F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537561;
	bh=n60Wzv1t8EOq1ed5DS9y50Ht6vJQjDXH6BuErsXsDmM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlndaKj+Yy2AN4PbVICEE3YF14agdOpODHd/Vs9mm7hDWfFI6jHZgJx9h2ozNZf16
	 o2fYU66QQbI3HhBjvEzjLiUuV48wbZCI6Lgu43GOpURGx7bUwaD5uUfBX16pl3yws/
	 5HcSz9q5T5ui2/GmGFp8mZub3Mg5j/jY2GWe+yZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 289D2F80302;
	Wed,  6 Oct 2021 18:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48BE0F80249; Wed,  6 Oct 2021 18:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9145AF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9145AF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="224808559"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="224808559"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:24:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="713002556"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:24:41 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mY9ie-009Fpl-Qk; Wed, 06 Oct 2021 19:24:36 +0300
Date: Wed, 6 Oct 2021 19:24:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5640: use
 devm_clk_get_optional() for mclk
Message-ID: <YV3NxPehVt3Ju+5p@smile.fi.intel.com>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
 <20211006150442.16503-3-andriy.shevchenko@linux.intel.com>
 <31338a32-a870-4bf8-52ba-5204109cf974@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31338a32-a870-4bf8-52ba-5204109cf974@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
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

On Wed, Oct 06, 2021 at 10:54:12AM -0500, Pierre-Louis Bossart wrote:
> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
> > The devm_clk_get_optional() helper returns NULL when devm_clk_get()
> > returns -ENOENT. This makes things slightly cleaner. The added benefit
> > is mostly cosmetic.

...

> >  	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > -		if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
> 
> same comment as for rt5651, I don't see the point of removing the test
> on this quirk?

Same answers.

-- 
With Best Regards,
Andy Shevchenko


