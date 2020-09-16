Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E726C55B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 18:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99EE1658;
	Wed, 16 Sep 2020 18:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99EE1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600275160;
	bh=o1Fe39PivRQbSkjQgw2kFcD3KTOm5+zAQUl4QB68808=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbAFKjFQPMeTI3tqOhVh/zAv7kvX2/VVChSw+QpdS9bBObs8YYtJm9Rs682uKS67y
	 bVPQQ25RWFA//sFzB/EiBpvUvyGf5c6pQenerIG9UfaWyd5m+QZu6BGxs+3mU2yQRw
	 /Er87MEstxkhiX4k1bCBnsks6DW0sNixndZdLryY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0043FF80150;
	Wed, 16 Sep 2020 18:50:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB4AF8015A; Wed, 16 Sep 2020 18:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25678F800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 18:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25678F800BB
IronPort-SDR: ykDCHTJioEpZSzBZlhyjNthHkKXJz5uP7aNgklxKfHoeLe6rQKW1RitKXmza3R6MGYleVKmF0y
 lymwaMoqgzNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="158810028"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="158810028"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 09:50:41 -0700
IronPort-SDR: qkCmNuZv25v77th/Q7izH5l8co55odlUx4agiKibnO3OqiWqHS52GtRlxOZYGCBd3q9WU/hdga
 Y1zlGB8G+oyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="336085955"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 09:50:37 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kIadd-00H7wy-I1; Wed, 16 Sep 2020 19:50:33 +0300
Date: Wed, 16 Sep 2020 19:50:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 08/13] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200916165033.GB3956970@smile.fi.intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-9-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915162944.16241-9-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On Tue, Sep 15, 2020 at 06:29:39PM +0200, Cezary Rojewski wrote:
> Add sysfs entries for displaying version of FW currently in use as well
> as binary dump of entire version info, including build and log providers
> hashes.

Something tells me that this might go a bit different direction. Can you
achieve Greg KH's review on this?

-- 
With Best Regards,
Andy Shevchenko


