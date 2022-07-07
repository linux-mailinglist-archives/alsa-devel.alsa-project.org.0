Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820B569EB3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B91F886;
	Thu,  7 Jul 2022 11:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B91F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657186849;
	bh=capKQX+I9Q4Op8Cl5NL4ibsmJcwI1Wj0Ll5A8DClSM0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gE7qSW00OTXwYhTKDbywNWx2oPI80h3RA6CrGn/rlKWA6d9K1+UwlIL3985n4EgEH
	 9EjOpbd0b84WftYW9aqgBH1TbSFLBHf1qC+F88YCV51P/EtywmMIvb+9g7xpFjznqY
	 S1ieYRFyvbvHxo9FIcY6YWA2qba4yEiC3OV8U1y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B20BAF8028D;
	Thu,  7 Jul 2022 11:39:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF13F8016A; Thu,  7 Jul 2022 11:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20592F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20592F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XAfIHimR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657186782; x=1688722782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=capKQX+I9Q4Op8Cl5NL4ibsmJcwI1Wj0Ll5A8DClSM0=;
 b=XAfIHimRJLmNdMl22sDyYT/bnQwj/Uc8/np5zK0YpNRlcwSB89bjD6lm
 CfoIcNEX7RXiofzcV03SQSezftFufg8O4X0wr7GB/aGUpIjVves97Xh7O
 n+fBDpS+rRDJITtV0kETr8xUbftNEroJneDCNcAg8BN0wQnRaCx8o7g3r
 wqldLsZGQqn0yhnoLnRS0riQOHizTemD3YfJwgoKvrtXjwgNqi1Vqmhp6
 P3jcgOS4cubRtLneC4SkBwxIsGQfn8GJDktCLN1tzm6EbtvcEAY+G/mN1
 ox7Y+Ph8XglBx9rPc37LeTV7qlK+OV/ueuCF2Bzdtnhd6aEVka5hlh89+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="309537125"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="309537125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 02:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="735905775"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2022 02:39:36 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9Nyy-000LpE-6P;
 Thu, 07 Jul 2022 09:39:36 +0000
Date: Thu, 7 Jul 2022 17:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <202207071739.NIPiY4NM-lkp@intel.com>
References: <20220707011856.10841-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707011856.10841-1-zhuning0077@gmail.com>
Cc: kbuild-all@lists.01.org, Zhu Ning <zhuning0077@gmail.com>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 David Yang <yangxiaohua@everest-semi.com>
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
[also build test WARNING on tiwai-sound/for-next linus/master v5.19-rc5 next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220707/202207071739.NIPiY4NM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fda793f4ec55b33955344b93a8c290fe207d54d4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Ning/ASoC-codecs-add-support-for-ES8326/20220707-115006
        git checkout fda793f4ec55b33955344b93a8c290fe207d54d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:742:35: warning: 'es8326_i2c_id' defined but not used [-Wunused-const-variable=]
     742 | static const struct i2c_device_id es8326_i2c_id[] = {
         |                                   ^~~~~~~~~~~~~


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
