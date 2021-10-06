Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C840424237
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55250843;
	Wed,  6 Oct 2021 18:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55250843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633536526;
	bh=21rO1Ta+V+Y0VJIs4/EBNiK1Q8BTUVwSJqeKW0hOtcA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sD1/ljihSLE8ncp0lpyvUmaveD6znNHGZqv0mobVvVaEZHsV9xHXa0ohXOtmQ9KHK
	 9q3Eop2OV0ly3XLkam0SrB6DrK7qwH7Q/NOLssn8BgwN8quIrjRzN+aZ3vPBuhx6hQ
	 tHFDptSr/qOp3MgNGhv4yXExNWMri7/EwozEA/ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B736F800FE;
	Wed,  6 Oct 2021 18:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0BBF80240; Wed,  6 Oct 2021 18:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0327F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0327F8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="213153340"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="213153340"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:05:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="568222307"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:05:50 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mY9QR-009FXV-97; Wed, 06 Oct 2021 19:05:47 +0300
Date: Wed, 6 Oct 2021 19:05:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/4] ASoC: Intel: bytcr_rt5640: Use temporary variable
 for struct device
Message-ID: <YV3JWzNgGInZ1Bt5@smile.fi.intel.com>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
 <20211006150442.16503-2-andriy.shevchenko@linux.intel.com>
 <4b81a10dca78e286a9f806464b97111b5a15a91e.camel@perches.com>
 <YV3ER4uIL4aRWBjz@smile.fi.intel.com>
 <YV3FaZ+afuZZSIth@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV3FaZ+afuZZSIth@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Joe Perches <joe@perches.com>
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

On Wed, Oct 06, 2021 at 04:48:57PM +0100, Mark Brown wrote:
> On Wed, Oct 06, 2021 at 06:44:07PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 06, 2021 at 08:21:01AM -0700, Joe Perches wrote:
> 
> > > Some will complain about a lack of commit message.
> 
> > Yeah, sorry for that, it wasn't deliberate. I forgot to run `git msg-filter`
> > on these three patches to add it.
> 
> > Mark, do you want me resend entire bunch(es) or just starting from these
> > patches? Or...?
> 
> If you're adding a commit message with automation it's probably not
> adding any value.

What do you mean? I add it exceptionally for the same (by nature) patches.
What do you expect to be altered in these three, if the idea behind the change
is very well the same?

-- 
With Best Regards,
Andy Shevchenko


