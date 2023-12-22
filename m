Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D081CF82
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 22:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6169FDEE;
	Fri, 22 Dec 2023 22:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6169FDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703280931;
	bh=dpqNdfS4ahJoafXVsQek4DZnUBoFniH8a9Xe1zk0FlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=It3PA+u0DUZB3KMS/mtGAJMbU+JTqIP4X7nSDkr134xs75KCfXpycM9J+rI7vJpIl
	 EEKfE2lpcXUuZqRAcejDhSoH8A32uiHkUiY9ox/41OQ7dA2YRKLnDoowDJmVPxt6yv
	 SdQjJdvrQkpqfwohH0KEXjC/1D4/Sgjc9QmzJaJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08842F8057C; Fri, 22 Dec 2023 22:34:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F02F80571;
	Fri, 22 Dec 2023 22:34:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 399AAF8016E; Fri, 22 Dec 2023 22:34:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6EF2F800F5
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 22:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6EF2F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A2j7/Gmh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703280883; x=1734816883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dpqNdfS4ahJoafXVsQek4DZnUBoFniH8a9Xe1zk0FlM=;
  b=A2j7/GmhGB6BrckwR2LTAt/BIRowaxu5lUyA2clXUgWG200PnTBhSuJJ
   es5ZhLNXdMvgaI9lKfhjW744L+Ozquw9m3hpbs3h7QKoQvdnBZLaKydv2
   ssKOSdXkCIy4LLpWozG1eJYaWy46NRxZ1Qgr6H6xlP0LnOKRDlam+q4SW
   GeN1Scp7LSW0sr6iu/x076lHsM6D7MQBiNU3M1zdUFbfcIY0Es15zsxdI
   RgQ6dXOYR9hsuYC6QIj5+uKRMAluGHadD1WVT32amX8wdJxCVzi4GX4dx
   r7C/vy2qsjhgSmYC4rHbVZ9zWxSvvkV3F9wovK3w8crgGUrX2puEYB5NL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="395052349"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600";
   d="scan'208";a="395052349"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 13:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="895566717"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600";
   d="scan'208";a="895566717"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2023 13:34:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGn9p-0009tc-1J;
	Fri, 22 Dec 2023 21:34:16 +0000
Date: Sat, 23 Dec 2023 05:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: starfive: Add drivers of Cadence
 Multi-Channel I2S Controller
Message-ID: <202312230525.gch9VlZT-lkp@intel.com>
References: <20231221033223.73201-3-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221033223.73201-3-xingyu.wu@starfivetech.com>
Message-ID-Hash: QEJRRJUKNQDZK3MK2FAJLAELRKQR75MJ
X-Message-ID-Hash: QEJRRJUKNQDZK3MK2FAJLAELRKQR75MJ
X-MailFrom: lkp@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEJRRJUKNQDZK3MK2FAJLAELRKQR75MJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Xingyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc6 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xingyu-Wu/dt-bindings-ASoC-Add-Cadence-I2S-controller-for-StarFive-JH8100-SoC/20231222-172628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231221033223.73201-3-xingyu.wu%40starfivetech.com
patch subject: [PATCH v1 2/2] ASoC: starfive: Add drivers of Cadence Multi-Channel I2S Controller
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231223/202312230525.gch9VlZT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230525.gch9VlZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230525.gch9VlZT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/starfive/cdns-jh8100-i2s.c:519:12: warning: 'cdns_jh8100_i2s_runtime_resume' defined but not used [-Wunused-function]
     519 | static int cdns_jh8100_i2s_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cdns_jh8100_i2s_runtime_resume +519 sound/soc/starfive/cdns-jh8100-i2s.c

   518	
 > 519	static int cdns_jh8100_i2s_runtime_resume(struct device *dev)
   520	{
   521		struct cdns_jh8100_i2s_dev *i2s = dev_get_drvdata(dev);
   522	
   523		return clk_prepare_enable(i2s->clks[1].clk); /* ICG clock */
   524	}
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
