Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14116697C24
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 13:46:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E80382E;
	Wed, 15 Feb 2023 13:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E80382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676465216;
	bh=ArTeTBl6HoOFZclYi5EBGCWmiDoltI/AT5lZ8Q0N0Tc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VcIsWydYdo9lVWtwfTY8b8VKoSYLIzxifz4IKMM1FNQWDYON2g2wmP2CU1SJ6bPW4
	 W49umeA11EsbDSkzNaUI161Dm1W3Se0f1v4DreTqB4bbRiNrLruypTdHSvnmA2cVV4
	 xJvk/q+xiR+koqexjJokkgr6MPSz63t/KYzxHzXg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E7BF801C0;
	Wed, 15 Feb 2023 13:46:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E979BF8047C; Wed, 15 Feb 2023 13:46:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 666C0F800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 13:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666C0F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PPc3jdM+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676465156; x=1708001156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ArTeTBl6HoOFZclYi5EBGCWmiDoltI/AT5lZ8Q0N0Tc=;
  b=PPc3jdM+X2j5xqrJpp/NbeOO6+1Q0P+GOXblkuS5qFNRkqbIgyPPZ5QK
   1HqQ2IwcH3uDV7GjtYDeD52ejvoxDdb2QeNmzejXQKUbnx37R2tHf7D0a
   GW73LMe4awkzTZJuvtuDtGfDIdYS7dd6X1n/YAoyEu9UbCF86TRRgHuzd
   B9fGpuAdRwFgIFdo+a6epHKp0aX+x2H3m2XpXPM4b8bStyDzQIpsbLMN7
   D0PEZ4IzH/vvOEZHIf6Tqalt6+2/SWZwGZ1e/andiirweCW1tk/MfJkzE
   TWpqgJuzPGGDo0crYe0NO+6jiET5oIyUy6ZomFP/vZ2unyM4EHTvHMbbr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="417638102"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000";
   d="scan'208";a="417638102"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 04:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="669600690"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000";
   d="scan'208";a="669600690"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Feb 2023 04:45:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSHAP-0009MX-35;
	Wed, 15 Feb 2023 12:45:45 +0000
Date: Wed, 15 Feb 2023 20:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 06/10] soc: fsl: cmp1: Add support for QMC
Message-ID: <202302152037.NXHi2aFY-lkp@intel.com>
References: <20230126083222.374243-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126083222.374243-7-herve.codina@bootlin.com>
Message-ID-Hash: 6LOBNCDEB3JSAGCCSM2PK7QJNIMNO5CV
X-Message-ID-Hash: 6LOBNCDEB3JSAGCCSM2PK7QJNIMNO5CV
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LOBNCDEB3JSAGCCSM2PK7QJNIMNO5CV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on robh/for-next powerpc/next powerpc/fixes linus/master v6.2-rc8 next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-soc-fsl-cpm_qe-Add-TSA-controller/20230128-152424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230126083222.374243-7-herve.codina%40bootlin.com
patch subject: [PATCH v4 06/10] soc: fsl: cmp1: Add support for QMC
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230215/202302152037.NXHi2aFY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/20ec2eacb76ca7252aa2934f53357663652edd0f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina/dt-bindings-soc-fsl-cpm_qe-Add-TSA-controller/20230128-152424
        git checkout 20ec2eacb76ca7252aa2934f53357663652edd0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152037.NXHi2aFY-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/soc/fsl/qe/qmc.o: in function `qmc_probe':
>> qmc.c:(.text.qmc_probe+0xd8): undefined reference to `get_immrbase'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
