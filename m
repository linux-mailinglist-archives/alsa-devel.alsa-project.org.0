Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D985F51FBD2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 13:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A65181F;
	Mon,  9 May 2022 13:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A65181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652097563;
	bh=KAiGLAeJ1F2x9+yVZHQWucvlaxVr8070RQ6hTo1dXBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CkFFpzTL8WH0olXC9FCw89JTlqsC0msy7wr6tiJbSF92nHxOvtNxQM5vW11+6ZPap
	 kHShRR9U0To1J/+QT/gfY8u+WFGAyQV05lDCJqM4EUB+2y8CW9lceqxuZauf089D2U
	 U3W6HmOzRWUdnEaXZ8xuQG0HqNWclKyra3QfO3lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFAA8F80269;
	Mon,  9 May 2022 13:58:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DDFDF8014C; Mon,  9 May 2022 13:58:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A578F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 13:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A578F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zz6UYkjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097497; x=1683633497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KAiGLAeJ1F2x9+yVZHQWucvlaxVr8070RQ6hTo1dXBQ=;
 b=Zz6UYkjrJropuBSHkXZkrSwU9YUVwOhbe0RbEwAa8JeV62qOvuy/x/EP
 lwT8zoaTXDhgZONMeLRo+vnBtLo2fBk9WXRauKU6NmXvjT6dMpzTC5JJp
 7wjy2SDF9pLLHuNN/N7GFPn0QDpbkfVPdBKrtmzQRmCiryGxUQ+YLi+jt
 0NJiJgWZ3yrFetkoBqT+6mGN1BSyHnGc99QZrlOrjE8k7tGcvFfBKni/y
 VhDwNCg0dXqWk4ZiR9eYuzna8Kzh2Ade9L3VO/Tc5saUS1gOiROAElh7j
 oKQP3x+Cimyo6baDUSNtdI+IjvHIFr75fKU4GDH/QOlCZr0z/tzKh/fwx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268955775"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="268955775"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 04:58:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="738132053"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 04:58:10 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1no21h-000GUQ-Q8;
 Mon, 09 May 2022 11:58:09 +0000
Date: Mon, 9 May 2022 19:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [PATCH v2 11/15] ASoC: Intel: avs: Machine board registration
Message-ID: <202205091954.7hT2TBhd-lkp@intel.com>
References: <20220509085821.3852259-12-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509085821.3852259-12-cezary.rojewski@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, kbuild-all@lists.01.org,
 cujomalainey@chromium.org, lma@semihalf.com
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

Hi Cezary,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20220506]
[cannot apply to tiwai-sound/for-next v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220509/202205091954.7hT2TBhd-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ef25400a7aee5a8e75c2ccdb5618be31c9f6809
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cezary-Rojewski/ASoC-Intel-avs-Driver-core-and-PCM-operations/20220509-165656
        git checkout 2ef25400a7aee5a8e75c2ccdb5618be31c9f6809
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash sound/soc/intel/avs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from sound/soc/intel/avs/board_selection.c:9:
   sound/soc/intel/avs/board_selection.c: In function 'avs_register_i2s_board':
>> sound/soc/intel/avs/board_selection.c:328:36: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
     328 |                 dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/intel/avs/board_selection.c:328:17: note: in expansion of macro 'dev_err'
     328 |                 dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
         |                 ^~~~~~~
   sound/soc/intel/avs/board_selection.c:328:90: note: format string is defined here
     328 |                 dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
         |                                                                                        ~~^
         |                                                                                          |
         |                                                                                          long int
         |                                                                                        %d


vim +328 sound/soc/intel/avs/board_selection.c

   318	
   319	static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
   320	{
   321		struct platform_device *board;
   322		int num_ssps;
   323		char *name;
   324		int ret;
   325	
   326		num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
   327		if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
 > 328			dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
   329				num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
   330			return -ENODEV;
   331		}
   332	
   333		name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name,
   334				      mach->mach_params.i2s_link_mask);
   335		if (!name)
   336			return -ENOMEM;
   337	
   338		ret = avs_i2s_platform_register(adev, name, mach->mach_params.i2s_link_mask, mach->pdata);
   339		if (ret < 0)
   340			return ret;
   341	
   342		mach->mach_params.platform = name;
   343	
   344		board = platform_device_register_data(NULL, mach->drv_name, mach->mach_params.i2s_link_mask,
   345						      (const void *)mach, sizeof(*mach));
   346		if (IS_ERR(board)) {
   347			dev_err(adev->dev, "ssp board register failed\n");
   348			return PTR_ERR(board);
   349		}
   350	
   351		ret = devm_add_action(adev->dev, board_pdev_unregister, board);
   352		if (ret < 0) {
   353			platform_device_unregister(board);
   354			return ret;
   355		}
   356	
   357		return 0;
   358	}
   359	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
