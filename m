Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE026D67D8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 17:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62DBF1FE;
	Tue,  4 Apr 2023 17:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62DBF1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680623393;
	bh=UptvTG4aFR011GJLVts1oxOoxLMLOROueUPWZC1W3/A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y/MtFBVYLXkOtP8EQTuAiBmJxB1Jsh6mpSYJt5zX05rpmImwKQ99Z+mMpZywQD5O3
	 tZF1u/BQ34AfKq1sihOs4+r9Z8CldOnupv6dpg69iyRrj0n2fHZHflFGnoIqZ1Zf1O
	 28k/JOcq22ld3+p8FHkLQgip20knHs5EmFGHlKQ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FEB0F801C0;
	Tue,  4 Apr 2023 17:49:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0A3BF8024C; Tue,  4 Apr 2023 17:48:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18615F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 17:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18615F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VFT8BR6L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680623323; x=1712159323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UptvTG4aFR011GJLVts1oxOoxLMLOROueUPWZC1W3/A=;
  b=VFT8BR6LYN7yKsVWZQubAMpAUWuKJJUQ8rAVRdpXDqvpr99rewBXt+tS
   a3e9kufqpeKtbVFwX5ordSMQHilo6KqoxJdSiroYgrIgvcO21sRynBIIG
   Gc9NswWqkPrG4G1K+8NWRmpBbN8z+yh/SGpudqWopThk1Rk/v8eTqRqVZ
   YAlAnU5ANp9EEX5hcWPsCvqXoE9c/kjtvSqG/Ep4Fvk8tUgjh2U0mWmoD
   OnKSzJWet8MBaPCrdv/IVl9xJQPr6gkF3C4sxLaQcl4z24QlF/aIx4Scu
   SQvPui38AaSG/a37xyPchi2T3rSIo15AhK0n3aGU4AYuJv2y3a3fjSeqf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428510618"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400";
   d="scan'208";a="428510618"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 08:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775683593"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400";
   d="scan'208";a="775683593"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 08:48:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjitb-000Pqe-2p;
	Tue, 04 Apr 2023 15:48:31 +0000
Date: Tue, 4 Apr 2023 23:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH v3] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic
 topology
Message-ID: <202304042324.kTGAiaCz-lkp@intel.com>
References: <20230329090737.254649-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329090737.254649-1-shumingf@realtek.com>
Message-ID-Hash: 7RROOA3HIGZFMVZ2UDM4FRB57HEHIQXU
X-Message-ID-Hash: 7RROOA3HIGZFMVZ2UDM4FRB57HEHIQXU
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
 jack.yu@realtek.com, derek.fang@realtek.com, pierre-louis.bossart@intel.com,
 bard.liao@intel.com, Yijun.Shen@dell.com, Shuming Fan <shumingf@realtek.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RROOA3HIGZFMVZ2UDM4FRB57HEHIQXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc5 next-20230404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shumingf-realtek-com/ASoC-rt712-sdca-Add-RT712-SDCA-driver-for-Mic-topology/20230329-171313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230329090737.254649-1-shumingf%40realtek.com
patch subject: [PATCH v3] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic topology
config: arc-randconfig-r043-20230404 (https://download.01.org/0day-ci/archive/20230404/202304042324.kTGAiaCz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aeee9e435d2d3b75d6cacb0b19bd6afb06c287ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review shumingf-realtek-com/ASoC-rt712-sdca-Add-RT712-SDCA-driver-for-Mic-topology/20230329-171313
        git checkout aeee9e435d2d3b75d6cacb0b19bd6afb06c287ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/virtio/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042324.kTGAiaCz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt712-sdca-dmic.c:178:5: warning: no previous prototype for 'rt712_sdca_dmic_io_init' [-Wmissing-prototypes]
     178 | int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/rt712-sdca-dmic.c:765:5: warning: no previous prototype for 'rt712_sdca_dmic_init' [-Wmissing-prototypes]
     765 | int rt712_sdca_dmic_init(struct device *dev, struct regmap *regmap,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/rt712_sdca_dmic_io_init +178 sound/soc/codecs/rt712-sdca-dmic.c

   177	
 > 178	int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
   179	{
   180		struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
   181	
   182		if (rt712->hw_init)
   183			return 0;
   184	
   185		if (rt712->first_hw_init) {
   186			regcache_cache_only(rt712->regmap, false);
   187			regcache_cache_bypass(rt712->regmap, true);
   188			regcache_cache_only(rt712->mbq_regmap, false);
   189			regcache_cache_bypass(rt712->mbq_regmap, true);
   190		} else {
   191			/*
   192			 * PM runtime is only enabled when a Slave reports as Attached
   193			 */
   194	
   195			/* set autosuspend parameters */
   196			pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
   197			pm_runtime_use_autosuspend(&slave->dev);
   198	
   199			/* update count of parent 'active' children */
   200			pm_runtime_set_active(&slave->dev);
   201	
   202			/* make sure the device does not suspend immediately */
   203			pm_runtime_mark_last_busy(&slave->dev);
   204	
   205			pm_runtime_enable(&slave->dev);
   206		}
   207	
   208		pm_runtime_get_noresume(&slave->dev);
   209	
   210		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   211			RT712_ADC0A_08_PDE_FLOAT_CTL, 0x1112);
   212		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   213			RT712_ADC0B_11_PDE_FLOAT_CTL, 0x1111);
   214		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   215			RT712_DMIC1_2_PDE_FLOAT_CTL, 0x1111);
   216		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   217			RT712_I2S_IN_OUT_PDE_FLOAT_CTL, 0x1155);
   218		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   219			RT712_DMIC_ENT_FLOAT_CTL, 0x2626);
   220		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   221			RT712_ADC_ENT_FLOAT_CTL, 0x1e19);
   222		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   223			RT712_DMIC_GAIN_ENT_FLOAT_CTL0, 0x1515);
   224		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   225			RT712_ADC_VOL_CH_FLOAT_CTL2, 0x0304);
   226		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   227			RT712_DMIC_GAIN_ENT_FLOAT_CTL2, 0x0304);
   228		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   229			RT712_HDA_LEGACY_CONFIG_CTL0, 0x0050);
   230		regmap_write(rt712->regmap,
   231			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_IT26, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x01);
   232		rt712_sdca_dmic_index_write(rt712, RT712_ULTRA_SOUND_DET,
   233			RT712_ULTRA_SOUND_DETECTOR6, 0x3200);
   234		regmap_write(rt712->regmap, RT712_RC_CAL, 0x23);
   235		regmap_write(rt712->regmap, 0x2f52, 0x00);
   236	
   237		if (rt712->first_hw_init) {
   238			regcache_cache_bypass(rt712->regmap, false);
   239			regcache_mark_dirty(rt712->regmap);
   240			regcache_cache_bypass(rt712->mbq_regmap, false);
   241			regcache_mark_dirty(rt712->mbq_regmap);
   242		} else
   243			rt712->first_hw_init = true;
   244	
   245		/* Mark Slave initialization complete */
   246		rt712->hw_init = true;
   247	
   248		pm_runtime_mark_last_busy(&slave->dev);
   249		pm_runtime_put_autosuspend(&slave->dev);
   250	
   251		dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
