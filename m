Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDD76C269A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 01:56:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B871DF;
	Tue, 21 Mar 2023 01:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B871DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679360203;
	bh=ZHer9Ncbg/NVTXk2nlism8j1Sf+fLmesX1WdkPxr0pA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YZviuEW6BWfiw/VLd4I4tSJhWzNozucRl74JONYDq0Vy7d9/bJhhX5iq//FndkdHS
	 jJ0X9qKmTzxGUak8uWVqoQSs3/Ij8INEnpsBKkCmmz/d6qulzn0Gl9tw234XCpLd3+
	 qYFayJJVPrVhzyxWLjh9LqUeYJYlTjOoIXjLK0Fw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF5E5F80254;
	Tue, 21 Mar 2023 01:55:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88326F8027B; Tue, 21 Mar 2023 01:55:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E10CF80105
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 01:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E10CF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tz4fdXLu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679360113; x=1710896113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZHer9Ncbg/NVTXk2nlism8j1Sf+fLmesX1WdkPxr0pA=;
  b=Tz4fdXLumBiqxd9moV0iWe80n50wmt/yiA7xFhcULM5FZ5UAkiF3in8h
   ExUZTkjtND1XjEBLYWEiVaHgY/6SjxeOlnAANXQiunG5WvQOmOPLlobPr
   T8e9W/g+oFyvnxesDNsUteQmZN4XTbcWjdJGBK8vepclbLCDRVeWys+0e
   Z1Cg+BbS8A4vQQEL0GroixbF1ouzDuex22SLktKLLonyC8JSey941uVgi
   lXcyaSembziBvTKTM3hw5QO5g7LvbZvP5qtZs0G+/9fdAE7cVXmzSbaqQ
   AekEmtXqnWzFVFas2d4Dgxqw4r9wWFgW+GXFdY5fYUkkveN553SXdh9SB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322655860"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400";
   d="scan'208";a="322655860"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 17:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683641879"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400";
   d="scan'208";a="683641879"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 17:55:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peQHI-000BRq-1U;
	Tue, 21 Mar 2023 00:55:04 +0000
Date: Tue, 21 Mar 2023 08:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marian Postevca <posteuca@mutex.one>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <202303210820.JYm7LOnS-lkp@intel.com>
References: <20230320203519.20137-4-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320203519.20137-4-posteuca@mutex.one>
Message-ID-Hash: 72JYZKN6HI5XD5UFEJ3Z5IM6FFZDZVNU
X-Message-ID-Hash: 72JYZKN6HI5XD5UFEJ3Z5IM6FFZDZVNU
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Marian Postevca <posteuca@mutex.one>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72JYZKN6HI5XD5UFEJ3Z5IM6FFZDZVNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Marian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marian-Postevca/ASoC-es8316-Enable-support-for-S32-LE-format-and-MCLK-div-by-2/20230321-043847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230320203519.20137-4-posteuca%40mutex.one
patch subject: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303210820.JYm7LOnS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0562079546d40f50d025ea1c4dacd31120b8b0bc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marian-Postevca/ASoC-es8316-Enable-support-for-S32-LE-format-and-MCLK-div-by-2/20230321-043847
        git checkout 0562079546d40f50d025ea1c4dacd31120b8b0bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/amd/acp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210820.JYm7LOnS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:464:6: warning: no previous prototype for 'acp3x_es83xx_init_ops' [-Wmissing-prototypes]
     464 | void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/acp3x_es83xx_init_ops +464 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c

   462	
   463	
 > 464	void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
