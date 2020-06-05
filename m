Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C861EF8A8
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 15:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CFF1166C;
	Fri,  5 Jun 2020 15:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CFF1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591362559;
	bh=Zvi1VITg0zTrnMSUkB94IxJNCCxZoNnm5mXka2JSVAU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QxFwcXxyr7lcEMsnAvNUDDZ8vouhRmrGjXfjMdpawXTFYpeTl1Ghej/1C/oHsfK+n
	 VbFxmi2AJRfSr8pMtF9w1J2pOQB/wgqm8ZkHQ/vTdetGqaaqmx6gHqdvllDHMjbowS
	 ULzavyyiiZhP0qzVr3LZJGxdq/bRiZJEw0epLukc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D009CF801EC;
	Fri,  5 Jun 2020 15:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94019F801ED; Fri,  5 Jun 2020 15:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCB80F80140
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 15:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCB80F80140
IronPort-SDR: OqNSB8PEobaC/xtJKtuG3qISZz2jGFtb4TYy1XbzImvaO7YneM6LxWMjhr2pY1FyPacdOQK8yw
 oVGQhXSPpKPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 06:07:25 -0700
IronPort-SDR: B9Urxri045zINYcRS/tuAAVd/PC1vEtnxjc/iRjOJRIEGo209A67NSqcVv2HTV4ZEpfp4XgpDz
 N7BvDQa6pZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; d="scan'208";a="313194971"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2020 06:07:23 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1jhC4E-00B26k-3c; Fri, 05 Jun 2020 16:07:26 +0300
Date: Fri, 5 Jun 2020 16:07:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sia Jee Heng <jee.heng.sia@intel.com>
Subject: Re: [PATCH v4 2/3] ASoC: Intel: Add makefiles and kconfig changes
 for KeemBay
Message-ID: <20200605130726.GJ2428291@smile.fi.intel.com>
References: <1591333737-3231-1-git-send-email-jee.heng.sia@intel.com>
 <1591333737-3231-3-git-send-email-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591333737-3231-3-git-send-email-jee.heng.sia@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On Fri, Jun 05, 2020 at 01:08:56PM +0800, Sia Jee Heng wrote:
> Add makefile and kconfig changes for Intel KeemBay platform driver.

> +config SND_SOC_INTEL_KEEMBAY
> +	tristate "Keembay Platforms"

> +	depends on OF && (ARM64 || COMPILE_TEST)

You can't compile test w/o OF?

> +	depends on COMMON_CLK
> +	help
> +	  If you have a Intel Keembay platform then enable this option
> +	  by saying Y or m.

-- 
With Best Regards,
Andy Shevchenko


