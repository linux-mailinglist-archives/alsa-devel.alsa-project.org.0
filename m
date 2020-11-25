Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4612C2C44B0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD616172E;
	Wed, 25 Nov 2020 17:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD616172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606320676;
	bh=rKOv1UlLjaiMqgmiJr931FuK/oM4PgU5H3z/j72Y4+o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FtGBjMZP+P4LcgJmd0bjLDCXFprM1SbW7Y7nigHlrhbwVqk7bPvvKj6kIuJyxtYXM
	 KnsfbzncM910RitYkp1QKsT14L2i2tXy1OzluG+xbk7PLoY34gQxeV1IxKwqnjgVRb
	 EwjK8MHxTDOcljMpg2gyGe2x/mBbMnuAPIQnCwys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B72F80218;
	Wed, 25 Nov 2020 17:09:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50573F8019D; Wed, 25 Nov 2020 17:09:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32E6EF80128
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E6EF80128
IronPort-SDR: f9joRYNQBwyEcdUkxX1/HWTgo0AgtF49cUUocG8jVa5eDmumU6gAyAwGw+Hl+lZ1QHwjyGd1rc
 OBfjwuXCwt1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="256865218"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; d="scan'208";a="256865218"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 08:09:28 -0800
IronPort-SDR: grlmE6dT9V4TCbWNdnH9xXNf0WoSQ5Aku798nFHZd8cjKu1oSkFXqYWzfdYU02uZmqoapwaZjc
 H66VbfzK523Q==
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; d="scan'208";a="535354686"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 08:09:26 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1khxNE-009f8q-IP; Wed, 25 Nov 2020 18:10:28 +0200
Date: Wed, 25 Nov 2020 18:10:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
Message-ID: <20201125161028.GW4077@smile.fi.intel.com>
References: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
 <f33b4381ea3a4cf4b8e7f27676cd90ed@intel.com>
 <CAJZ5v0hxqydcoqTCDzR7O7Y4d71Qutx+k4sOmdvOY24f2-OWgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hxqydcoqTCDzR7O7Y4d71Qutx+k4sOmdvOY24f2-OWgg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
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

On Wed, Nov 25, 2020 at 04:49:39PM +0100, Rafael J. Wysocki wrote:
> On Tue, Nov 24, 2020 at 1:13 PM Rojewski, Cezary
> <cezary.rojewski@intel.com> wrote:

...

> Applied as 5.11 material, thanks!

Thanks!

There is one fix to the series [1]. But now I realized that I forgot to Cc
linux-acpi@. Do you want me resend it?


[1]: https://lore.kernel.org/lkml/20201119105327.89917-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko


