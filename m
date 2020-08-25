Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A925197E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 15:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18FB1673;
	Tue, 25 Aug 2020 15:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18FB1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598361904;
	bh=jDUjKIVH/MF/KdxD4Y3hwWxfP+2MC5VnNMsP7rjARig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUv2nKS/o4OIQq8t1uKWDfK2pcYAnVoGdeDcdbwpJICjj+dszRcM3bDS2Fgw0vBgA
	 ZIzJCCoxkuoDI4iQmYgpc8KCY/XGbgnlW+Z9u9DCkWBR9+6Xiupu/0Bhkumhm73XOT
	 mi7ymm0WAlsWCKxKOZpMxTHB6k6L/M0gwHepN0sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD4CF800D1;
	Tue, 25 Aug 2020 15:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B2F1F8025A; Tue, 25 Aug 2020 15:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_29,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E831AF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 15:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E831AF800D1
IronPort-SDR: SlHb2TwxgrfFutRfriorg/1sZCSdOZuEYi/i1VGwOpeR82/CF8jlIBC97VnzKqsya+wjQtSpbM
 qZy593eiXJWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="217653500"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="217653500"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 06:23:11 -0700
IronPort-SDR: ows2Ypva5q1dcx7+eZnR0YSMMiHvJj5PDvJZ0d11ROGrq7pUV3DwCELShWjfvOUXDKgWdiv2zK
 BRB6Ba+b5Lkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="328862565"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 06:23:07 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kAYun-00BKcV-3z; Tue, 25 Aug 2020 16:23:05 +0300
Date: Tue, 25 Aug 2020 16:23:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200825132305.GJ1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <237f2343-fd57-8ebf-b8f2-8c2cf5c3c745@intel.com>
 <20200820090055.GT1891694@smile.fi.intel.com>
 <dec6d548-8376-683f-7d07-44f1cfbbf375@intel.com>
 <20200825131615.GG1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825131615.GG1891694@smile.fi.intel.com>
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

On Tue, Aug 25, 2020 at 04:16:15PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 24, 2020 at 06:33:17PM +0200, Cezary Rojewski wrote:
> > On 2020-08-20 11:00 AM, Andy Shevchenko wrote:

...

> > Another question though: PCI_PM_CTRL. In order for me to make use of this,
> > "pm_cap" member would have to be declared for my device. As this is no
> > struct pci_dev, catpt has currently no separate member for that purpose. I
> > don't believe you want me to add that field into struct's declaration.
> > Second option is to define constant for pm_cap offset aka 0x80 within
> > registers.h and then do the operations as follows:
> > 	catpt_updatel_pci(cdev, CATPT_PM_CAP + PCI_PM_CTRL, ...)
> 
> > However, in such case I won't be able to make use of current version of
> > _updatel_pci() as definition of that macro allows me to skip prefix and type
> > implicitly - PMCS (the rest is appended automatically).
> > Maybe let's leave it within registers.h altogether so I can actually keep
> > using said macro?
> 
> Basically what you do with accessing PCI configuration space via these methods
> (catpt_update_pci(), etc) is something repetitive / similar to what xHCI DbC
> support code does. I recommend to spend some time to look for similarities here
> (catpt) and there (PCI core, xHCI DbC, etc) and, if we were lucky, derive
> common helpers for traverse the capability list in more generalized way.

Throwing the idea loud: perhaps we may have something like regmap-pci.c to
access PCI configuration space and make regmap API to take care of which IO
accessors (and locking) will be used.

-- 
With Best Regards,
Andy Shevchenko


