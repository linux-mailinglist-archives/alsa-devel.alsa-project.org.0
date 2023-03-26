Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C70B76C9775
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 20:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 049A2AEA;
	Sun, 26 Mar 2023 20:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 049A2AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679855043;
	bh=NoAMrGG8BO82WF0/W/nj7Qdz5t8YcEaBhEumn5bnTws=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MM10ZpqYYaPmxYbkl9ZycOwv38DhD1jjyX84Ib2RKiZXBVAkUJKGJT4JOssmBxGPO
	 maqgioR/ZKYXQFTvmlnDb93gKRmtWKOhzgJ7l2XA0/ScerNxtGYnfAJ+pw1fLlUEGQ
	 q8z8jdYUe4sa1qSjphkYZF3+w69Ecf9P5XFIxrs0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65232F8024E;
	Sun, 26 Mar 2023 20:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7032F80272; Sun, 26 Mar 2023 20:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAC2DF80249
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 20:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC2DF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZV4ElzKi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679854978; x=1711390978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NoAMrGG8BO82WF0/W/nj7Qdz5t8YcEaBhEumn5bnTws=;
  b=ZV4ElzKiwFcwD7iLWTI2gW090vcWVzTM4Lns62KuyeBfMGaFccchbxUs
   9ovTZ7AWKHMR9bUHJTc8Ox7LXQfT42CYkP+o4xzQ3enOUpZ3KrkRnq/lk
   bbYR3v9nFEteAIT55cCkAL2vDHDNIAwKjtpgDsU1T40R3LI2R0BMF864q
   SRQLdSibiQ5j0mgfmM4rgDqvADNbXQsR7U/xW9MskRNQCg0z6FpDT3pxW
   a7Sgtp4L40hWjWR9AVUad6x+PLLBR9Q34FnMTNaRFwprGEX28jtJtpJdL
   9dpR4rLJ2AaKsrNZkpw1soZGYVyVCj2DWdm6bc9Ibd3y/7C5wlqmOG2Do
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402714551"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400";
   d="scan'208";a="402714551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2023 11:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660631212"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400";
   d="scan'208";a="660631212"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Mar 2023 11:22:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgV0y-000HIT-0m;
	Sun, 26 Mar 2023 18:22:48 +0000
Date: Mon, 27 Mar 2023 02:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>,
	Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <202303270203.QeRuuc9d-lkp@intel.com>
References: 
 <167949286900.26.3992817728812049195@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <167949286900.26.3992817728812049195@mailman-core.alsa-project.org>
Message-ID-Hash: CYVCECDWTL2MNFDW72MO76ZIIJ7T7BMN
X-Message-ID-Hash: CYVCECDWTL2MNFDW72MO76ZIIJ7T7BMN
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYVCECDWTL2MNFDW72MO76ZIIJ7T7BMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on broonie-sound/for-next lee-leds/for-leds-next robh/for-next linus/master v6.3-rc3 next-20230324]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-via-Alsa-devel/mfd-Add-support-for-the-Lantiq-PEF2256-framer/20230322-215208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/167949286900.26.3992817728812049195%40mailman-core.alsa-project.org
patch subject: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
config: m68k-randconfig-c024-20230326 (https://download.01.org/0day-ci/archive/20230327/202303270203.QeRuuc9d-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d60948895815b59306d870e7c189741b7d14d5e2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina-via-Alsa-devel/mfd-Add-support-for-the-Lantiq-PEF2256-framer/20230322-215208
        git checkout d60948895815b59306d870e7c189741b7d14d5e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303270203.QeRuuc9d-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/mfd/pef2256.o: in function `pinconf_generic_dt_node_to_map_pin':
>> pef2256.c:(.text+0x280): undefined reference to `pinconf_generic_dt_node_to_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
