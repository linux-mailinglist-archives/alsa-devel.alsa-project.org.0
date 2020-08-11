Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A0241BA1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 15:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98AA81667;
	Tue, 11 Aug 2020 15:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98AA81667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597153217;
	bh=m0DlxNC8ouk3js/uWTM3x0FqgPEFEFBhBpbgLwrJ2xo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SV+A/WLQNaTSqhs3KN+Uv3BDKMmPaWnA6V7+Ufj6wX64Yj7xCgLbMEOsoysCsiLXJ
	 XqEafWrzQmwq+J4JPZNBy+DjzHpaKR7d5n7N3vE6RTVlGupcZ2dgKxIJgMQ2+vFWeQ
	 qVHr2ZCopNFsQ67sfcedwhTuq+Yxsq876eg/Woqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0560F80161;
	Tue, 11 Aug 2020 15:38:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B65CBF8015B; Tue, 11 Aug 2020 15:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A2CFF800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 15:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2CFF800BC
IronPort-SDR: OmK8nsVTOR0vKNA1qd07NaEjT0yVtlqWvx/h7EprAnXiddj1PsFmRkEZq4hV//QQBha40mwIRr
 tFoIqnRzKQUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="141340778"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="141340778"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 06:38:20 -0700
IronPort-SDR: mLY4dxyUQuI4yO21opqL8wZjzWsoWYWLrpvIvIBGv7MR8db+Z1zecz40SUsSpkfQHmjj4m8IFH
 9v9ngSJTWWzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="324761477"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 11 Aug 2020 06:38:17 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k5UTo-007zbV-A9; Tue, 11 Aug 2020 16:38:16 +0300
Date: Tue, 11 Aug 2020 16:38:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 09/13] ASoC: Intel: Select catpt and deprecate haswell
Message-ID: <20200811133816.GD1891694@smile.fi.intel.com>
References: <20200811100034.6875-10-cezary.rojewski@intel.com>
 <202008112152.WcqIiwSM%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008112152.WcqIiwSM%lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kbuild-all@lists.01.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, lgirdwood@gmail.com,
 marcin.barlik@intel.com, zwisler@google.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On Tue, Aug 11, 2020 at 09:08:43PM +0800, kernel test robot wrote:
> Hi Cezary,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on asoc/for-next]
> [also build test WARNING on sound/for-next v5.8 next-20200811]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Cezary-Rojewski/ASoC-Intel-Catpt-Lynx-and-Wildcat-point/20200811-181319
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=1 build):
>         # save the attached .config to linux build tree
>         make W=1 ARCH=i386 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):

To fix all these, please use %pR or %pr (I believe you want former rather than
latter).

-- 
With Best Regards,
Andy Shevchenko


