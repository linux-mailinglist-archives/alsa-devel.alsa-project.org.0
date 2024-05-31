Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A1F8D648F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 16:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53187836;
	Fri, 31 May 2024 16:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53187836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717165912;
	bh=JvE95VldL4Wm6uxSEGwGimYI1FBYwpi2JYmljsv3ZAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UhIWIsdwp6sTnl72dha5trnd5YD0Y+nye4DbYfGVNnpgTCos33uCtYDEyFmnvcv0u
	 YOVp3ZXEWvarAEGxg69Vtf4kMPYxLRr+7Z42THAb6F7VPZFrhXLrjg+eOAKOImfuOs
	 S3gHH1cbGwkNRnHjqgDsgLngXXGJDgljXXqs2oxU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16DE5F8057A; Fri, 31 May 2024 16:31:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8469F8059F;
	Fri, 31 May 2024 16:31:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 646FCF8026D; Fri, 31 May 2024 16:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77542F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 16:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77542F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XVZRdqcp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717165873; x=1748701873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JvE95VldL4Wm6uxSEGwGimYI1FBYwpi2JYmljsv3ZAA=;
  b=XVZRdqcpzboGuIRERL91XcdweWvn6KJJry42FCib6loBXsMTuSPFBHsj
   NjPTzEKoCiXx3f3dIw/LdVDC8ERYcchpZW5Tzg7PDffdMHFAvySPJXFsK
   ijYIW4P6OmBp7iVteXtGVg9ki0Mt7ZZoj64e8i07RiSJNRkRIzfTDC1zk
   cs3uKrtMbwI7XQx+rFc8WTIzfV9OyPrNQZfHI3RGEaKB7srK/xX5iWzp2
   SAUM3HgX/OX8pGUzC0jIndvMM9sse/Aun5bJKWS0kD2bT2yAAbVAQ5n9n
   H9ZVW38KOOvJzsUR1VMaPv+k7Igr35LiJog8AMefSxLhx/fD4yVfZiMWd
   g==;
X-CSE-ConnectionGUID: eEfe4aCqQHqt9D/zXlqTvg==
X-CSE-MsgGUID: gc9wZ4TNSpuJWf+Olnsw2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="36242695"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="36242695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:31:06 -0700
X-CSE-ConnectionGUID: 0FTBQ/SASnC/QvwnryK7fA==
X-CSE-MsgGUID: KgUFmX8zTD2bMRaXcoAYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="73666970"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:30:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD3HS-0000000CUNA-19F6;
	Fri, 31 May 2024 17:30:54 +0300
Date: Fri, 31 May 2024 17:30:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <ZlnfHWx3uPzCoJwX@smile.fi.intel.com>
References: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
 <202405311428.tzsBMIPs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405311428.tzsBMIPs-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: NDY2IO3P5PET7X24THQNR3SZULVM5O4K
X-Message-ID-Hash: NDY2IO3P5PET7X24THQNR3SZULVM5O4K
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDY2IO3P5PET7X24THQNR3SZULVM5O4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 31, 2024 at 02:42:33PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on shawnguo/for-next rockchip/for-next linus/master v6.10-rc1 next-20240529]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-codecs-Remove-unused-of_gpio-h/20240531-070350
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20240530230037.1156253-2-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
> config: i386-buildonly-randconfig-006-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405311428.tzsBMIPs-lkp@intel.com/

My gosh, the whoever wrote the GPIO code in that driver has no clue what they
are doing. It's a pure mess.

-- 
With Best Regards,
Andy Shevchenko


