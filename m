Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75F5228FC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 03:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06ED118C4;
	Wed, 11 May 2022 03:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06ED118C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652232704;
	bh=UW71ROxh/GRIENA4xUhIZy4ExcjISc8wvAjEj5jPNTE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmpDpDYCMEsMConWcZ2qB52C1FpmLkxnmsM4RkPm6w7B201VqSgX+DJlGzZZzoeu1
	 Lh0pPd3abSLva73M9OHYRVdAOESQqB+ZbFkpUMshWtsvyrp17E0woR7AZNy825Vvxk
	 7VJTTPPrDYNajknN+3nDoEcigiky41qxqN/0yJpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B1E0F800BB;
	Wed, 11 May 2022 03:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9DFEF8015B; Wed, 11 May 2022 03:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1DF0F80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 03:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1DF0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SQO6Unh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652232638; x=1683768638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UW71ROxh/GRIENA4xUhIZy4ExcjISc8wvAjEj5jPNTE=;
 b=SQO6Unh39z1zSJU/jHW1rz6/Pg/qHWUNoGcabeu37ofuIw4uOKuv/oxv
 FkXJ3SUPCsITY2A7t1zoJj1zaqwddBeFZai4rli8s+YNZoo0oad9Rrje2
 IXWFlqhbvWpLClQ6lLFg3mLDU4StvfMGbEwwy073CnGCMxqEX49uw4uDD
 LiP1zy5W9catpeAGfKXHzhfn96+VGClLA3wLqoEg39TCay0RcBZtseNJF
 OhbSasiz7YT4ctCW7mSgQmSRKGnoRcF9A8BrFrRL5V56v2VZHsvxC0mHM
 sbMxFNcXtvEFdKVuS6soNK6VCat4JeqMk6WQL94BYyEOB9QI2Xk3v1KT9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="330148021"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="330148021"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 18:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="738988213"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 10 May 2022 18:30:30 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nobBN-000IZB-CU;
 Wed, 11 May 2022 01:30:29 +0000
Date: Wed, 11 May 2022 09:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/3] ALSA: hda/cs8409: Support new Odin Variants
Message-ID: <202205110948.6wfXVVvs-lkp@intel.com>
References: <20220510161701.851260-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510161701.851260-2-sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 patches@opensource.cirrus.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.18-rc6 next-20220510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/ALSA-hda-cs8409-Add-support-for-Odin-Laptop-Variants/20220511-001936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-c001-20220509 (https://download.01.org/0day-ci/archive/20220511/202205110948.6wfXVVvs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e834cdf9c71c45212904ba82b5b7e49d45810deb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Binding/ALSA-hda-cs8409-Add-support-for-Odin-Laptop-Variants/20220511-001936
        git checkout e834cdf9c71c45212904ba82b5b7e49d45810deb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/pci/hda/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/pci/hda/patch_cs8409.c:1033:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   sound/pci/hda/patch_cs8409.c:1033:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +1033 sound/pci/hda/patch_cs8409.c

8c70461bbb83cf Lucas Tanure   2021-08-11   996  
8c70461bbb83cf Lucas Tanure   2021-08-11   997  /* Vendor specific HW configuration
8c70461bbb83cf Lucas Tanure   2021-08-11   998   * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
8c70461bbb83cf Lucas Tanure   2021-08-11   999   */
8c70461bbb83cf Lucas Tanure   2021-08-11  1000  static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
8c70461bbb83cf Lucas Tanure   2021-08-11  1001  {
8c70461bbb83cf Lucas Tanure   2021-08-11  1002  	const struct cs8409_cir_param *seq = cs8409_cs42l42_hw_cfg;
8c70461bbb83cf Lucas Tanure   2021-08-11  1003  	const struct cs8409_cir_param *seq_bullseye = cs8409_cs42l42_bullseye_atn;
8c70461bbb83cf Lucas Tanure   2021-08-11  1004  	struct cs8409_spec *spec = codec->spec;
24f7ac3d3b6b70 Lucas Tanure   2021-08-11  1005  	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
8c70461bbb83cf Lucas Tanure   2021-08-11  1006  
8c70461bbb83cf Lucas Tanure   2021-08-11  1007  	if (spec->gpio_mask) {
ccff0064a7ce8e Stefan Binding 2021-08-11  1008  		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_MASK,
ccff0064a7ce8e Stefan Binding 2021-08-11  1009  			spec->gpio_mask);
ccff0064a7ce8e Stefan Binding 2021-08-11  1010  		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DIRECTION,
ccff0064a7ce8e Stefan Binding 2021-08-11  1011  			spec->gpio_dir);
ccff0064a7ce8e Stefan Binding 2021-08-11  1012  		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA,
ccff0064a7ce8e Stefan Binding 2021-08-11  1013  			spec->gpio_data);
8c70461bbb83cf Lucas Tanure   2021-08-11  1014  	}
8c70461bbb83cf Lucas Tanure   2021-08-11  1015  
8c70461bbb83cf Lucas Tanure   2021-08-11  1016  	for (; seq->nid; seq++)
8c70461bbb83cf Lucas Tanure   2021-08-11  1017  		cs8409_vendor_coef_set(codec, seq->cir, seq->coeff);
8c70461bbb83cf Lucas Tanure   2021-08-11  1018  
24f7ac3d3b6b70 Lucas Tanure   2021-08-11  1019  	if (codec->fixup_id == CS8409_BULLSEYE) {
8c70461bbb83cf Lucas Tanure   2021-08-11  1020  		for (; seq_bullseye->nid; seq_bullseye++)
8c70461bbb83cf Lucas Tanure   2021-08-11  1021  			cs8409_vendor_coef_set(codec, seq_bullseye->cir, seq_bullseye->coeff);
24f7ac3d3b6b70 Lucas Tanure   2021-08-11  1022  	}
8c70461bbb83cf Lucas Tanure   2021-08-11  1023  
6581a045d54c6a Stefan Binding 2022-03-28  1024  	switch (codec->fixup_id) {
6581a045d54c6a Stefan Binding 2022-03-28  1025  	case CS8409_CYBORG:
6581a045d54c6a Stefan Binding 2022-03-28  1026  	case CS8409_WARLOCK_MLK_DUAL_MIC:
8c70461bbb83cf Lucas Tanure   2021-08-11  1027  		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
8a7724535bacbb Stefan Binding 2022-03-28  1028  		cs8409_vendor_coef_set(codec, CS8409_DMIC_CFG, 0x0003);
6581a045d54c6a Stefan Binding 2022-03-28  1029  		break;
e834cdf9c71c45 Stefan Binding 2022-05-10  1030  	case CS8409_ODIN:
e834cdf9c71c45 Stefan Binding 2022-05-10  1031  		/* ASP1/2_xxx_EN=1, ASP1/2_MCLK_EN=0, DMIC1_SCL_EN=0 */
e834cdf9c71c45 Stefan Binding 2022-05-10  1032  		cs8409_vendor_coef_set(codec, CS8409_PAD_CFG_SLW_RATE_CTRL, 0xfc00);
6581a045d54c6a Stefan Binding 2022-03-28 @1033  	default:
6581a045d54c6a Stefan Binding 2022-03-28  1034  		break;
6581a045d54c6a Stefan Binding 2022-03-28  1035  	}
8c70461bbb83cf Lucas Tanure   2021-08-11  1036  
24f7ac3d3b6b70 Lucas Tanure   2021-08-11  1037  	cs42l42_resume(cs42l42);
8c70461bbb83cf Lucas Tanure   2021-08-11  1038  
8c70461bbb83cf Lucas Tanure   2021-08-11  1039  	/* Enable Unsolicited Response */
8c70461bbb83cf Lucas Tanure   2021-08-11  1040  	cs8409_enable_ur(codec, 1);
8c70461bbb83cf Lucas Tanure   2021-08-11  1041  }
8c70461bbb83cf Lucas Tanure   2021-08-11  1042  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
