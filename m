Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F686BBE82
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 22:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A9911D9;
	Wed, 15 Mar 2023 22:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A9911D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678914397;
	bh=zgcxU04kk7R74eIwM5VvQS7PnF5BOcPygMlUIObyV7o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HlGwUkZRIzCwaKIeVtNNPGOdKj+ps2jU4I2TZVqbJW00epoxi4EOUHlOY1D0bkTeC
	 gF2c/9UgpKHTvT1m5eedup1Pvo5vEzyNTl+bZHcqaP3nEHBy/uTJBA/OtRSzb3TUyk
	 T3jD8EewTSIjrgpiAaRxBABe2mFqGJ8jOE277Ze8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD150F8032D;
	Wed, 15 Mar 2023 22:05:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2771F80423; Wed, 15 Mar 2023 22:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B01DF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 22:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B01DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QMAC5Rrm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678914333; x=1710450333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zgcxU04kk7R74eIwM5VvQS7PnF5BOcPygMlUIObyV7o=;
  b=QMAC5RrmPorxmMhZrzQGgtLRZfNr4zd9335JwQTCkAC7R664dwnWZO06
   a9lzDgPJ3rZ0BKkWmEBFJ3S6suTrPGrufUexQXTTCbk3yN8tnEimNqEo+
   zCbbwS3tQtYF+C2L8OBfXIK1iexpSkMA9CxP36o5PCoziMNOg2Lp7WoyV
   20zXbo3iCtALl1T0cRzsi7C58mh2nr0uEBqSHLhZU3NOST2uLr1uiPVmq
   QmYM7YYLV2CqYLJam948wUtNGwof8nY5Jc9ShHGGS3NBjHNQ0RYKbjf3B
   /aagMQ1K2rYy+qOst37411svM19bh8Rn4XswZkwYvUD1yDTg3i6hAWIGT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337835822"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400";
   d="scan'208";a="337835822"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 14:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="822941919"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400";
   d="scan'208";a="822941919"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2023 14:05:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcYJ1-00082F-15;
	Wed, 15 Mar 2023 21:05:07 +0000
Date: Thu, 16 Mar 2023 05:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 2/7] drivers: misc: Add support for the Lantiq PEF2256
 framer
Message-ID: <202303160430.HUK3FkVq-lkp@intel.com>
References: 
 <167888778959.26.12757990479414568225@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <167888778959.26.12757990479414568225@mailman-core.alsa-project.org>
Message-ID-Hash: PGFC6I3GBNSCDYR46T3HNFYCW3DGW6E6
X-Message-ID-Hash: PGFC6I3GBNSCDYR46T3HNFYCW3DGW6E6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGFC6I3GBNSCDYR46T3HNFYCW3DGW6E6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Herve,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina-via-Alsa-devel/drivers-misc-Add-support-for-the-Lantiq-PEF2256-framer/20230315-214833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/167888778959.26.12757990479414568225%40mailman-core.alsa-project.org
patch subject: [PATCH 2/7] drivers: misc: Add support for the Lantiq PEF2256 framer
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230316/202303160430.HUK3FkVq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93791052da597151cddbe64bc3013d9fec19550f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina-via-Alsa-devel/drivers-misc-Add-support-for-the-Lantiq-PEF2256-framer/20230315-214833
        git checkout 93791052da597151cddbe64bc3013d9fec19550f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/misc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160430.HUK3FkVq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pef2256.c:1054:38: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
    1054 | static const struct pinctrl_pin_desc const pef2256_v12_pins[] = {
         |                                      ^~~~~
   drivers/misc/pef2256.c:1065:38: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
    1065 | static const struct pinctrl_pin_desc const pef2256_v2x_pins[] = {
         |                                      ^~~~~


vim +/const +1054 drivers/misc/pef2256.c

  1053	
> 1054	static const struct pinctrl_pin_desc const pef2256_v12_pins[] = {
  1055		PEF2256_PINCTRL_PIN(0, "RPA", PEF2256_PC1, PEF2256_12_PC_RPC_MASK),
  1056		PEF2256_PINCTRL_PIN(1, "RPB", PEF2256_PC2, PEF2256_12_PC_RPC_MASK),
  1057		PEF2256_PINCTRL_PIN(2, "RPC", PEF2256_PC3, PEF2256_12_PC_RPC_MASK),
  1058		PEF2256_PINCTRL_PIN(3, "RPD", PEF2256_PC4, PEF2256_12_PC_RPC_MASK),
  1059		PEF2256_PINCTRL_PIN(4, "XPA", PEF2256_PC1, PEF2256_12_PC_XPC_MASK),
  1060		PEF2256_PINCTRL_PIN(5, "XPB", PEF2256_PC2, PEF2256_12_PC_XPC_MASK),
  1061		PEF2256_PINCTRL_PIN(6, "XPC", PEF2256_PC3, PEF2256_12_PC_XPC_MASK),
  1062		PEF2256_PINCTRL_PIN(7, "XPD", PEF2256_PC4, PEF2256_12_PC_XPC_MASK),
  1063	};
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
