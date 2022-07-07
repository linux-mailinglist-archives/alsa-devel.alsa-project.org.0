Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856256ADDA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 23:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8271AE9;
	Thu,  7 Jul 2022 23:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8271AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657230081;
	bh=ocBncahtaSg7S42lZSGoqH6BP+AOxjjrjkVB4JpO39s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIBRzO0bOPeaxVuKnfrx2YDmMddYGa4S17n12nDkeWzP5OHLnqWIRq1pP4jPo82dl
	 rIUCCHK2JIb9QESja3Gha95N9xepBu5jn38XAvRcvCEqe4xRejqhfV/dr8NR/NTGvF
	 NzQjzG2OPQveQkDh2an14vN2SzPe5YDIQHNf8Z4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 135D9F8028D;
	Thu,  7 Jul 2022 23:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6BEDF8016A; Thu,  7 Jul 2022 23:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29090F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 23:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29090F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bC4Wv25n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657230014; x=1688766014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ocBncahtaSg7S42lZSGoqH6BP+AOxjjrjkVB4JpO39s=;
 b=bC4Wv25nxKpDP6nwErNj55/FivqKD2XR5ekn/AxZdUjPiKp2hipaoSw3
 z0YzV1CkUCG6Vmn8kdESmDz2l8jjMUGy93FyD4/1D7WioAAEq/DNkAQbo
 TqpUq56JX+lZRSweN7fe3lgu33H6Cot9vyESZxfucS5IQFUuYiUq2fX2u
 IHBWXCCmv0oIKEDWjHsirvGwfkHCoLtqvhJP5mGhug9fzfKEuq8kUaWDI
 ldI0/vlygs6JCPLfW33cfUPLdavsQPDNw81HslAbp3Hzj3Iogq4P2Cld7
 TZsDsyrnARZhk1f4INDZWOLwZ1XjqmMeOdak9ePapowDWuOs6LfgJBNDF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309688909"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="309688909"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="661541874"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2022 14:40:06 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9ZED-000MVW-CY;
 Thu, 07 Jul 2022 21:40:05 +0000
Date: Fri, 8 Jul 2022 05:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <202207080557.twGXw3yY-lkp@intel.com>
References: <20220707011856.10841-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707011856.10841-1-zhuning0077@gmail.com>
Cc: kbuild-all@lists.01.org, Zhu Ning <zhuning0077@gmail.com>,
 llvm@lists.linux.dev, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, David Yang <yangxiaohua@everest-semi.com>
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

Hi Zhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm64-buildonly-randconfig-r006-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080557.twGXw3yY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/fda793f4ec55b33955344b93a8c290fe207d54d4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
        git checkout fda793f4ec55b33955344b93a8c290fe207d54d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/es8326.c:612:13: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
           if((reg && ES8326_VERSION_B) == 1)
                      ^
   sound/soc/codecs/es8326.h:185:29: note: expanded from macro 'ES8326_VERSION_B'
   #define ES8326_VERSION_B (1 << 0)
                               ^
>> sound/soc/codecs/es8326.c:742:35: warning: unused variable 'es8326_i2c_id' [-Wunused-const-variable]
   static const struct i2c_device_id es8326_i2c_id[] = {
                                     ^
   2 warnings generated.


vim +/es8326_i2c_id +742 sound/soc/codecs/es8326.c

   741	
 > 742	static const struct i2c_device_id es8326_i2c_id[] = {
   743		{"es8326", 0 },
   744		{}
   745	};
   746	MODULE_DEVICE_TABLE(i2c, es8326_i2c_id);
   747	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
