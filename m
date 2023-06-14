Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8E72FE67
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 14:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D23825;
	Wed, 14 Jun 2023 14:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D23825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686745412;
	bh=2wurr3a70A1th1nzJb1CFm7v+4FT74d7krbArrguyJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EVfy/rMiV70z68J1EyqUmlIYzJaR2rbygfmi0oysCay7+MnD7scetIlyToG41rir1
	 K26JiZZ3+R3waNzsVw4r8pcCBTNPZ3bAt7/qHWVKYwM+J9opA4bYBiGRgWG177FodZ
	 sAxH4axd3IkSLwH4n1pqWYO7gwirlzQ/iIg+z4ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E9BCF80301; Wed, 14 Jun 2023 14:22:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF9CF80132;
	Wed, 14 Jun 2023 14:22:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E966F80149; Wed, 14 Jun 2023 14:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F38A7F80130
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 14:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F38A7F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NgOmYIDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686745332; x=1718281332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wurr3a70A1th1nzJb1CFm7v+4FT74d7krbArrguyJE=;
  b=NgOmYIDLxXX0MFM8cbbkqSgwyG6SQBcMBMJuUHGcmQyAHxQXXJr3L/pJ
   vwI8CgVmsuhZtjzsPvfwfHIMKwH9cDdpPAtof7dRGo4a0hwD4kaA3/mHF
   xj26OI4IYUBRR/yDuL6z8H9AF72K8KYkMAdZwu7zVpHHskKDVHRY4Fe+8
   +JCS5euHNF06oinNBOGS5Jz2oC3/d2aD3Yg/rU2dhNH30knvoAvXqzGUm
   //e8Z0iix8a5b+mUbmgrIB5kRIcw1NcBqSa1ZGzDtm8qZctKbCBsXQfnH
   A/lQpGXRDdriqIvBLtNY/QMR3T3Gnqpku5TCNUarWIve8rf9/eciFTCSi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343294397"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400";
   d="scan'208";a="343294397"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 05:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="801888082"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400";
   d="scan'208";a="801888082"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2023 05:22:04 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9PVg-0000cf-12;
	Wed, 14 Jun 2023 12:22:01 +0000
Date: Wed, 14 Jun 2023 20:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Maso Hunag <maso.huang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Ren Zhijie <renzhijie2@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Maso Huang <maso.huang@mediatek.com>
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt79xx: add platform driver
Message-ID: <202306142005.uUyPtOQT-lkp@intel.com>
References: <20230612105250.15441-4-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612105250.15441-4-maso.huang@mediatek.com>
Message-ID-Hash: W52MCAXOOXLRLUZBC7W4RSAACGZ4BMQH
X-Message-ID-Hash: W52MCAXOOXLRLUZBC7W4RSAACGZ4BMQH
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W52MCAXOOXLRLUZBC7W4RSAACGZ4BMQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Maso,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.4-rc6 next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maso-Hunag/ASoC-mediatek-mt79xx-add-common-header/20230612-211033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230612105250.15441-4-maso.huang%40mediatek.com
patch subject: [PATCH 3/7] ASoC: mediatek: mt79xx: add platform driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230614/202306142005.uUyPtOQT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add broonie-sound https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
        git fetch broonie-sound for-next
        git checkout broonie-sound/for-next
        b4 shazam https://lore.kernel.org/r/20230612105250.15441-4-maso.huang@mediatek.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/mediatek/mt79xx/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142005.uUyPtOQT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c: In function 'mt79xx_afe_irq_handler':
>> sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:35: warning: missing terminating " character
     322 |                 dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x,
         |                                   ^
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:323:38: warning: missing terminating " character
     323 |                         mcu_en 0x%x\n", __func__, ret, status, mcu_en);
         |                                      ^
>> sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:608:23: error: unterminated argument list invoking macro "dev_err"
     608 | MODULE_LICENSE("GPL");
         |                       ^
>> sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:17: error: 'dev_err' undeclared (first use in this function); did you mean '_dev_err'?
     322 |                 dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x,
         |                 ^~~~~~~
         |                 _dev_err
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:17: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:24: error: expected ';' at end of input
     322 |                 dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x,
         |                        ^
         |                        ;
   ......
>> sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:17: error: expected declaration or statement at end of input
     322 |                 dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x,
         |                 ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:17: error: expected declaration or statement at end of input
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:312:21: warning: unused variable 'irq_ret' [-Wunused-variable]
     312 |         irqreturn_t irq_ret = IRQ_HANDLED;
         |                     ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:311:13: warning: unused variable 'i' [-Wunused-variable]
     311 |         int i;
         |             ^
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:306:34: warning: unused variable 'irq' [-Wunused-variable]
     306 |         struct mtk_base_afe_irq *irq;
         |                                  ^~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:322:17: error: no return statement in function returning non-void [-Werror=return-type]
     322 |                 dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x,
         |                 ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c: At top level:
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:303:20: warning: 'mt79xx_afe_irq_handler' defined but not used [-Wunused-function]
     303 | static irqreturn_t mt79xx_afe_irq_handler(int irq_id, void *dev)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:294:35: warning: 'mt79xx_afe_regmap_config' defined but not used [-Wunused-const-variable=]
     294 | static const struct regmap_config mt79xx_afe_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:232:39: warning: 'irq_data' defined but not used [-Wunused-const-variable=]
     232 | static const struct mtk_base_irq_data irq_data[MT79XX_IRQ_NUM] = {
         |                                       ^~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:183:41: warning: 'memif_data' defined but not used [-Wunused-const-variable=]
     183 | static const struct mtk_base_memif_data memif_data[MT79XX_MEMIF_NUM] = {
         |                                         ^~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:179:46: warning: 'mt79xx_afe_pcm_dai_component' defined but not used [-Wunused-const-variable=]
     179 | static const struct snd_soc_component_driver mt79xx_afe_pcm_dai_component = {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:170:40: warning: 'mt79xx_memif_routes' defined but not used [-Wunused-const-variable=]
     170 | static const struct snd_soc_dapm_route mt79xx_memif_routes[] = {
         |                                        ^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:158:41: warning: 'mt79xx_memif_widgets' defined but not used [-Wunused-const-variable=]
     158 | static const struct snd_soc_dapm_widget mt79xx_memif_widgets[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:122:34: warning: 'mt79xx_memif_dai_driver' defined but not used [-Wunused-variable]
     122 | static struct snd_soc_dai_driver mt79xx_memif_dai_driver[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:101:12: warning: 'mt79xx_irq_fs' defined but not used [-Wunused-function]
     101 | static int mt79xx_irq_fs(struct snd_pcm_substream *substream,
         |            ^~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:90:12: warning: 'mt79xx_memif_fs' defined but not used [-Wunused-function]
      90 | static int mt79xx_memif_fs(struct snd_pcm_substream *substream,
         |            ^~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c:75:38: warning: 'mt79xx_afe_hardware' defined but not used [-Wunused-const-variable=]
      75 | static const struct snd_pcm_hardware mt79xx_afe_hardware = {
         |                                      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c: In function 'mt79xx_init_clock':
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:43: warning: missing terminating " character
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                                           ^
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:42: warning: missing terminating " character
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                          ^
   In file included from include/linux/kernel.h:30,
                    from include/linux/clk.h:13,
                    from sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:10:
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:43: error: missing terminating " character
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:33: error: 'ret' undeclared (first use in this function); did you mean 'net'?
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                 ^~~
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:33: note: each undeclared identifier is reported only once for each function it appears in
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                 ^~~
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:40: error: stray '\' in program
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                        ^
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:38: error: 'ld' undeclared (first use in this function)
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                      ^~
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:41: error: expected ')' before 'n'
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                         ^
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   include/linux/printk.h:379:41: note: to match this '('
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
   include/linux/printk.h:422:9: note: in expansion of macro '__printk_index_emit'
     422 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:42: error: missing terminating " character
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:379:42: note: in definition of macro '__printk_index_emit'
     379 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:43: error: missing terminating " character
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:388:61: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                             ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:40: error: stray '\' in program
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                        ^
   include/linux/printk.h:388:61: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                             ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:41: error: expected ')' before 'n'
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                         ^
   include/linux/printk.h:388:61: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                             ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   include/linux/printk.h:388:60: note: to match this '('
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
   include/linux/printk.h:422:9: note: in expansion of macro '__printk_index_emit'
     422 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:42: error: missing terminating " character
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:388:61: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                             ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:43: error: missing terminating " character
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:388:70: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                      ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:40: error: stray '\' in program
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                        ^
   include/linux/printk.h:388:70: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                      ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:41: error: expected ')' before 'n'
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                         ^
   include/linux/printk.h:388:70: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                      ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   include/linux/printk.h:388:69: note: to match this '('
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
   include/linux/printk.h:422:9: note: in expansion of macro '__printk_index_emit'
     422 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:42: error: missing terminating " character
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:388:70: note: in definition of macro '__printk_index_emit'
     388 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                      ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from include/sound/soc.h:14,
                    from sound/soc/mediatek/mt79xx/mt79xx-afe-common.h:13,
                    from sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:12:
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:43: error: missing terminating " character
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:40: error: stray '\' in program
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                        ^
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
>> sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:41: error: expected ')' before 'n'
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                         ^
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   include/linux/dev_printk.h:110:24: note: to match this '('
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                        ^
   include/linux/dev_printk.h:144:9: note: in expansion of macro 'dev_printk_index_wrap'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:47:42: error: missing terminating " character
      47 |                                 ret %ld\n", __func__, aud_clks[i],
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/soc/mediatek/mt79xx/mt79xx-afe-clk.c:46:25: note: in expansion of macro 'dev_err'
      46 |                         dev_err(afe->dev, "%s(), devm_clk_get %s fail,
         |                         ^~~~~~~


vim +/dev_err +608 sound/soc/mediatek/mt79xx/mt79xx-afe-pcm.c

   605	
   606	MODULE_DESCRIPTION("Mediatek SoC AFE platform driver for ALSA MT79xx");
   607	MODULE_AUTHOR("Vic Wu <vic.wu@mediatek.com>");
 > 608	MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
