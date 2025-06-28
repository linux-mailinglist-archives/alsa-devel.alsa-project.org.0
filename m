Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF6AECA4E
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jun 2025 22:43:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8858C601B4;
	Sat, 28 Jun 2025 22:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8858C601B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751143431;
	bh=Mc1uivMj6FIm2vMX5xs2uyKIhFKhB3l+qd+gQT+kvGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XH69si3I8SUKAkLygqq4HYioJf4hKHW/a19FSIfs++IsGovFziSri/U0A0mR6pJ0k
	 XCSgKpSqrzV27xmVTT6tCaEmfYR2nb90L0O1vs2656rI9OxKmd/f/+UL2EjGOwJFb9
	 ZMJ5AUP0hQEznTwhaw93MJez02CJWlhOe2sllcwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56486F805BF; Sat, 28 Jun 2025 22:43:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 481F5F805C5;
	Sat, 28 Jun 2025 22:43:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FB75F80494; Sat, 28 Jun 2025 22:43:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2FDFF8003A
	for <alsa-devel@alsa-project.org>; Sat, 28 Jun 2025 22:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FDFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TaGysgz4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751143393; x=1782679393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mc1uivMj6FIm2vMX5xs2uyKIhFKhB3l+qd+gQT+kvGk=;
  b=TaGysgz4EWKa8K+9Ue0BXFVcFUKEI89uLqh3tP2l40mzfgI9mNvB5siq
   GIpuIk9b6JV8qsJMaA2QK+K5cdCkSdHgRd1MqPDCQDZVZ6cr1xRqboQg5
   Q2lDRGqToRqdtEECTdFl82/HUlL6epL0Jea58+Qp3S+e8VPXcYb5VJPBd
   bQHfan43+Z93dAR9TQv7r1RpWjx+tod2st6yelv5i5p+PI8mHAEjogZ4W
   JdOLkc+V8p8W/DPggSXTsOII6t38/GKL33iehD9OFcseghWZtDmnfxMew
   95dC4lpY455o3MXz8rurwUvmbCnAFVwVaZhpnn/Bmo0hO4v9bSVg3Lvae
   w==;
X-CSE-ConnectionGUID: LX9i5h6qRh+d4bKAHWEw/w==
X-CSE-MsgGUID: z9xSipeFRd2GqvPfcwRPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53518362"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600";
   d="scan'208";a="53518362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2025 13:43:07 -0700
X-CSE-ConnectionGUID: KB/m4uWmRNSrAUcjtmtp3g==
X-CSE-MsgGUID: Jpx4FdONQLq+rM4lVkAtEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600";
   d="scan'208";a="158808677"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2025 13:43:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVcO6-000XN8-1m;
	Sat, 28 Jun 2025 20:43:02 +0000
Date: Sun, 29 Jun 2025 04:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	tiwai@suse.de, alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, navada@ti.com,
	v-hampiholi@ti.com, niranjan.hy@ti.com
Subject: Re: [PATCH v2 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <202506290455.cgLfcmh1-lkp@intel.com>
References: <20250624153742.1507-2-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624153742.1507-2-niranjan.hy@ti.com>
Message-ID-Hash: X4JAVG3CUM3AHBQHGZCNMDCTGDXMHFEG
X-Message-ID-Hash: X4JAVG3CUM3AHBQHGZCNMDCTGDXMHFEG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4JAVG3CUM3AHBQHGZCNMDCTGDXMHFEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Niranjan,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjan-H-Y/ASoc-tac5x1x-add-codec-driver-tac5x1x-family/20250628-012714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250624153742.1507-2-niranjan.hy%40ti.com
patch subject: [PATCH v2 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
config: x86_64-rhel-9.4 (attached as .config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290455.cgLfcmh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290455.cgLfcmh1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol REGMAP_I2C is selected by SND_SOC_TAC5X1X_I2C
   symbol SND_SOC_TAC5X1X_I2C depends on REGMAP_I2C
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
