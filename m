Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46C2CAACE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 19:34:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3080C1771;
	Tue,  1 Dec 2020 19:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3080C1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606847660;
	bh=5YRLYXCpVOy5s6pQQL61fceAuXD1dUm1/f9CFvpMqMc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iaWeQNoR46qXUiQfE6VtZUSITM91fI62s1oS7gg7ZhJwPGYFartU7Ke90A3HB4ev6
	 oAfM3eD0kjL51zl1wTdgmb99j581x/Vo0gjZshbRpORuw9XF+AganFw5hSZ4eMNrdj
	 IiQ6Uijl5nP522exMk2zOnEaVLbLj/FCBNVBd6As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCBCF80254;
	Tue,  1 Dec 2020 19:32:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F3DF8016D; Tue,  1 Dec 2020 19:32:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04A1BF80168
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 19:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A1BF80168
IronPort-SDR: JupdVJLKVZkbMAAjw65COc/NyFSOrrkf2c9BlD1eEgOjphvbtBovZzg9wDCcAcXRQU5+Y23l+F
 c4MNFEtYQrfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="172098528"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="172098528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 10:32:31 -0800
IronPort-SDR: xgXj4cpJdSo4W9Ovflu9Pb3/504DGnz/AlexKg1c3B9uXNptUBbwf1TQuwsRV4ZUOFLJ0uz3SR
 zrRK+oOFZaYQ==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="364878965"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 10:32:28 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kkASv-00BKyP-KY; Tue, 01 Dec 2020 20:33:29 +0200
Date: Tue, 1 Dec 2020 20:33:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
Message-ID: <20201201183329.GI4077@smile.fi.intel.com>
References: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
 <160683107676.35139.9521964646147921378.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160683107676.35139.9521964646147921378.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, linux-acpi@vger.kernel.org
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

On Tue, Dec 01, 2020 at 01:57:56PM +0000, Mark Brown wrote:
> On Tue, 24 Nov 2020 11:56:28 +0200, Andy Shevchenko wrote:
> > Since we have resource_intersection() helper, let's utilize it here.
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: Intel: catpt: Replace open coded variant of resource_intersection()
>       (no commit info)

As I mentioned in the comment (after --- line) the patch relies on the stuff in
linux-pm tree. Do you have any immutable branch pulled? Otherwise Rafael
already took it where it won't break compilation.

-- 
With Best Regards,
Andy Shevchenko


