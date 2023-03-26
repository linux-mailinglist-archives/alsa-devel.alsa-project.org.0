Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185226C9641
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 17:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18DCAA4E;
	Sun, 26 Mar 2023 17:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18DCAA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679845860;
	bh=OaKvVJRvcWuHtVOvJttpA3gJz8/VcByd+7+i/AbP3iw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W7O3gr1PstoIiOe5pmQGzJlEO/av3vYy+/i+yY+lQGQONSpwJ1/HY9lfgW+Y1Lj8p
	 /vlkxdsBsP2SX5ivzcNqFDELSaKVAMeWtI7erAlsVFmooACWoef8AG+pWrkn21p7xb
	 Ohhkgt52pCJRZSQFxaLfZUZumtubVCFtDXtqK7XM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E78F8024E;
	Sun, 26 Mar 2023 17:50:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89574F80272; Sun, 26 Mar 2023 17:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25DC4F800C9
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 17:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DC4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RDYOUDpG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679845796; x=1711381796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OaKvVJRvcWuHtVOvJttpA3gJz8/VcByd+7+i/AbP3iw=;
  b=RDYOUDpG1YmpwTOna2FwZy8KpEESiJN2beUe4TqMitV2b1pwJ+9KHXV8
   uuxIzrNCTzf3+RhFxzeeZyhamZt/s1V9n2cmXSG4pmUh4MeIMgtblL0P5
   bF/Hkv2VQ0Dwmst2mcQekdFnv5g/nJyxoXQXrGvixu+hx68OW9Uq3qj9Y
   maJmLkxCXyNFduUvtfQPsrbYqx5927I7WdDl5yBbKTI8aiNR2WJ4DMJeI
   KGle3qzfYxtc9Anl3K2P7ELomYo/IR79xfyt+K17mKTmANqys2iorm4m/
   Cn+h9RDMpS8DCcNfPJkKKEcJAQbuHmMmjOmd/+AVH/S/e3XpyurFldhGz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="319755946"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400";
   d="scan'208";a="319755946"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2023 08:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="807231038"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400";
   d="scan'208";a="807231038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Mar 2023 08:49:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgScq-000HDn-1x;
	Sun, 26 Mar 2023 15:49:44 +0000
Date: Sun, 26 Mar 2023 23:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <202303262358.vWU2dypT-lkp@intel.com>
References: <20230322134654.219957-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322134654.219957-3-herve.codina@bootlin.com>
Message-ID-Hash: WP7YS7Y66PVYGC4FTXT65ZZLEH5N2DWM
X-Message-ID-Hash: WP7YS7Y66PVYGC4FTXT65ZZLEH5N2DWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WP7YS7Y66PVYGC4FTXT65ZZLEH5N2DWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

I love your patch! Yet something to improve:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on broonie-sound/for-next lee-leds/for-leds-next robh/for-next linus/master v6.3-rc3 next-20230324]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-mfd-Add-the-Lantiq-PEF2256-E1-T1-J1-framer/20230322-214827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230322134654.219957-3-herve.codina%40bootlin.com
patch subject: [PATCH v3 2/6] mfd: Add support for the Lantiq PEF2256 framer
config: parisc-randconfig-p001-20230326 (https://download.01.org/0day-ci/archive/20230326/202303262358.vWU2dypT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/53e683ee1cad96a898f7fed03f88a3898e8dcd15
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina/dt-bindings-mfd-Add-the-Lantiq-PEF2256-E1-T1-J1-framer/20230322-214827
        git checkout 53e683ee1cad96a898f7fed03f88a3898e8dcd15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303262358.vWU2dypT-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mfd/pef2256.o: in function `.LC58':
>> pef2256.c:(.rodata.cst4+0x54): undefined reference to `pinconf_generic_dt_node_to_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
