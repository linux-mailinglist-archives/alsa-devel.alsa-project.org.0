Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D05AEB54F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 12:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B949601F8;
	Fri, 27 Jun 2025 12:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B949601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751021364;
	bh=t5zc6fIQTCmGoE8p4c4MC9Y05swYQ+weDqBUHa/JISA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=huLIm4otrxHDNLBD8qV1IqS4m5zuuuA/9ngx3RsiQCs2XyH1JqfTSEMWcS37RecBT
	 I+8rhQUFpqN4zkvJA2Du9pRGW5/YN/NQRBa9Z5I8yt6nUuxl1oa9nb4mH2wiFzxCIJ
	 HYev8JFBoflO0yti8Pam6yIFy1CEf/egLNzVBCGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A92E2F805CA; Fri, 27 Jun 2025 12:49:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99CC2F805B6;
	Fri, 27 Jun 2025 12:49:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8122F80217; Fri, 27 Jun 2025 12:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FB80F800FA
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 12:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB80F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J+lkdOR5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751021336; x=1782557336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t5zc6fIQTCmGoE8p4c4MC9Y05swYQ+weDqBUHa/JISA=;
  b=J+lkdOR5v4aP/+s2O1uRvsx/9a0QH4vES/WiDvkjjOZh6aq/KAqzaCTF
   5yhyQFeXbp4H3Es2rJlV9eyj8cPqLzwToRgVZvXM+bMxFNPqrVPZcdAVA
   zvGwkNwRAcRY6xtsm22cfSc6bYk+Tc73iZM6QdQnSjzmQdxqkaHBP+WPu
   y6IWHVUSIRYpMGOZ0k2Snhwvn/mERw4rPRXe7JKgqscUYMcUmpLRzLNSq
   /DgFQwMwhlygEC/mx4IE8k3435euUdCiZMaHUBeBJnPn8CBhWDVwnM+b6
   5Bs48VarbwLq+rjdHzVaEsrVtzbxG0Yl1RujlDySx5BjLe5XW3iSJbCWR
   g==;
X-CSE-ConnectionGUID: dRBQcS7ISmi6I9M4qKsUow==
X-CSE-MsgGUID: gXaklKQFQum24cYP/UurGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53274504"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600";
   d="scan'208";a="53274504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:48:51 -0700
X-CSE-ConnectionGUID: AW3mqA78TgWq4HU9M2HqiQ==
X-CSE-MsgGUID: rnkN1+BOSDapci4mJ7S4XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600";
   d="scan'208";a="156819302"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2025 03:48:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV6dR-000W5i-25;
	Fri, 27 Jun 2025 10:48:45 +0000
Date: Fri, 27 Jun 2025 18:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjan H Y <niranjan.hy@ti.com>, broonie@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andriy.shevchenko@linux.intel.com, tiwai@suse.de,
	alsa-devel@alsa-project.org, baojun.xu@ti.com, shenghao-ding@ti.com,
	liam.r.girdwood@intel.com, lgirdwood@gmail.com, robh@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	navada@ti.com, v-hampiholi@ti.com, niranjan.hy@ti.com
Subject: Re: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <202506271807.cuEjxbbx-lkp@intel.com>
References: <20250626181334.1200-2-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626181334.1200-2-niranjan.hy@ti.com>
Message-ID-Hash: Z3OIZWRTAUWSHCFBYMFW6XLGK7WOE3XE
X-Message-ID-Hash: Z3OIZWRTAUWSHCFBYMFW6XLGK7WOE3XE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3OIZWRTAUWSHCFBYMFW6XLGK7WOE3XE/>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjan-H-Y/ASoc-tac5x1x-add-codec-driver-tac5x1x-family/20250627-021555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250626181334.1200-2-niranjan.hy%40ti.com
patch subject: [PATCH v3 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271807.cuEjxbbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271807.cuEjxbbx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol REGMAP_I2C is selected by SND_SOC_TAC5X1X_I2C
   symbol SND_SOC_TAC5X1X_I2C depends on REGMAP_I2C
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
