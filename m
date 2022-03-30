Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A544ECC6A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 20:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612421A95;
	Wed, 30 Mar 2022 20:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612421A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648665468;
	bh=D5mRqopCIFKwZH3JfCjUUuzfGFbnA++umn6Gh/ApMlY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSoytkRbLX6PzibhIDTfhZI3LuL6PwU0LZ/Tg0+Ah4ZSDPfkLDbRTiC9SBy70OpS1
	 Gjy4A91H847HOY49+ZUTpA2V2bPpc8HWCgdW1ZmYeJtXvrk4AhtZZqMLv+inOO+APr
	 9um9v5mBZnll92IgVmUCHHDo3vn/SGwdF5BMwgAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B43D5F8025A;
	Wed, 30 Mar 2022 20:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F9DF80155; Wed, 30 Mar 2022 20:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 369FDF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 20:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 369FDF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KXIZ/CIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648665394; x=1680201394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D5mRqopCIFKwZH3JfCjUUuzfGFbnA++umn6Gh/ApMlY=;
 b=KXIZ/CIV9aDiZkb+WZVEcJgQX7yB3LmBzFkLvw4me2V4PFBQPIfbOhP2
 5YsY1gRymk+15ApfWPTiwd685/vl7MkqmVBONjTp/fwbz1mIHZeSrgrLV
 YrydTKvge5SXd9+NkNLbnooE9toyCxeApbJNtGcgKrlJ1kCPqkrqdmYBi
 sWrKXfmkmLS6f7K6LRtaLh6jsK7Ckk/awX4oySCJzaxe6pleFRSkxYuk8
 LbOLJrF8Wwep4cFNTJJ8M0uqK/LdEI+m4Y9ZqoBs9qJvXyrVsbREWf442
 m8eCJeDRhwjYgnWoUhYls0CabsnN0T+M+dSjGxoiKn8ARH7yzV8B2azoN Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322799170"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322799170"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 11:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522011573"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 30 Mar 2022 11:36:26 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZdBB-0000JI-Ms;
 Wed, 30 Mar 2022 18:36:25 +0000
Date: Thu, 31 Mar 2022 02:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
Subject: Re: [PATCH v5 4/4] update tas27xx.c to support either TAS2764 or
 TAS2780
Message-ID: <202203310255.mwJuw0DH-lkp@intel.com>
References: <20220330144526.498-4-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330144526.498-4-13691752556@139.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org, llvm@lists.linux.dev,
 shenghao-ding@ti.com, navada@ti.com, raphael-xu@ti.com,
 Raphael-Xu <13691752556@139.com>
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

Hi Raphael-Xu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.17 next-20220330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Xu/rename-tas2764-to-tas27xx/20220330-224947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm-randconfig-r012-20220330 (https://download.01.org/0day-ci/archive/20220331/202203310255.mwJuw0DH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5e87128eec39d187eaf11069178b39d935600c2e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Raphael-Xu/rename-tas2764-to-tas27xx/20220330-224947
        git checkout 5e87128eec39d187eaf11069178b39d935600c2e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas27xx.c:624:4: error: field designator 'symmetric_rates' does not refer to any field in type 'struct snd_soc_dai_driver'; did you mean 'symmetric_rate'?
                   .symmetric_rates = 1,
                    ^~~~~~~~~~~~~~~
                    symmetric_rate
   include/sound/soc-dai.h:411:15: note: 'symmetric_rate' declared here
           unsigned int symmetric_rate:1;
                        ^
>> sound/soc/codecs/tas27xx.c:819:3: error: invalid application of 'sizeof' to an incomplete type 'struct snd_soc_dai_driver[]'
                   ARRAY_SIZE(tas27xx_dai_driver));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   2 errors generated.


vim +624 sound/soc/codecs/tas27xx.c

   598	
   599	#define TAS27XX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
   600				 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
   601	
   602	#define TAS27XX_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
   603			       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
   604	
   605	static struct snd_soc_dai_driver tas27xx_dai_driver[] = {
   606		{
   607			.name = "tas27xx ASI1",
   608			.id = 0,
   609			.playback = {
   610				.stream_name    = "ASI1 Playback",
   611				.channels_min   = 2,
   612				.channels_max   = 2,
   613				.rates      = TAS27XX_RATES,
   614				.formats    = TAS27XX_FORMATS,
   615			},
   616			.capture = {
   617				.stream_name    = "ASI1 Capture",
   618				.channels_min   = 1,
   619				.channels_max   = 2,
   620				.rates = TAS27XX_RATES,
   621				.formats = TAS27XX_FORMATS,
   622			},
   623			.ops = &tas27xx_dai_ops,
 > 624			.symmetric_rates = 1,
   625		},
   626	};
   627	
   628	static int tas27xx_codec_probe(struct snd_soc_component *component)
   629	{
   630		struct tas27xx_priv *tas27xx = 
   631			snd_soc_component_get_drvdata(component);
   632		int ret = 0;
   633	
   634		tas27xx->component = component;
   635	
   636		if (tas27xx->sdz_gpio)
   637			gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
   638	
   639		tas27xx_reset(tas27xx);
   640	
   641		ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG5,
   642						    TAS27XX_TDM_CFG5_VSNS_ENABLE, 0);
   643		if (ret < 0) {
   644			dev_err(tas27xx->dev, "%s:%u: Failed to enable vSNS\n",
   645				__func__, __LINE__);
   646			goto EXIT;
   647		}
   648		ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG6,
   649						    TAS27XX_TDM_CFG6_ISNS_ENABLE, 0);
   650		if (ret < 0) {
   651			dev_err(tas27xx->dev, "%s:%u: Failed to enable iSNS\n",
   652				__func__, __LINE__);
   653			goto EXIT;
   654		}
   655		ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
   656						    TAS27XX_PWR_CTRL_MASK,
   657						    TAS27XX_PWR_CTRL_MUTE);
   658		if (ret < 0) {
   659			dev_err(tas27xx->dev, "%s:%u: Failed to PWR_CTRL_MUTE\n",
   660				__func__, __LINE__);
   661			goto EXIT;
   662		}
   663	
   664		ret = snd_soc_component_write(component, TAS27XX_PWR_CTRL, 0x02);
   665	
   666		if (ret < 0) {
   667			dev_err(tas27xx->dev, "%s:%u: Failed to initial active\n",
   668				__func__, __LINE__);
   669			goto EXIT;
   670		}
   671		ret = 0;
   672	EXIT:
   673		return ret;
   674	}
   675	
   676	static DECLARE_TLV_DB_SCALE(tas27xx_digital_tlv, 1100, 50, 0);
   677	static DECLARE_TLV_DB_SCALE(tas27xx_playback_volume, -10000, 50, 0);
   678	
   679	static const struct snd_kcontrol_new tas27xx_snd_controls[] = {
   680		SOC_SINGLE_TLV("Speaker Volume", TAS27XX_DVC, 0,
   681			       TAS27XX_DVC_MAX, 1, tas27xx_playback_volume),
   682		SOC_SINGLE_TLV("Amp Gain Volume", TAS27XX_CHNL_0, 0, 0x14, 0,
   683			       tas27xx_digital_tlv),
   684	};
   685	
   686	static const struct snd_soc_component_driver soc_component_driver_tas27xx = {
   687		.probe			= tas27xx_codec_probe,
   688	#ifdef CONFIG_PM
   689		.suspend		= tas27xx_codec_suspend,
   690		.resume			= tas27xx_codec_resume,
   691	#endif
   692		.set_bias_level		= tas27xx_set_bias_level,
   693		.controls		= tas27xx_snd_controls,
   694		.num_controls		= ARRAY_SIZE(tas27xx_snd_controls),
   695		.dapm_widgets		= tas27xx_dapm_widgets,
   696		.num_dapm_widgets	= ARRAY_SIZE(tas27xx_dapm_widgets),
   697		.dapm_routes		= tas27xx_audio_map,
   698		.num_dapm_routes	= ARRAY_SIZE(tas27xx_audio_map),
   699		.idle_bias_on		= 1,
   700		.endianness		= 1,
   701		.non_legacy_dai_naming	= 1,
   702	};
   703	
   704	static const struct reg_default tas27xx_reg_defaults[] = {
   705		{ TAS27XX_PAGE, 0x00 },
   706		{ TAS27XX_SW_RST, 0x00 },
   707		{ TAS27XX_PWR_CTRL, 0x1a },
   708		{ TAS27XX_DVC, 0x00 },
   709		{ TAS27XX_CHNL_0, 0x00 },
   710		{ TAS27XX_TDM_CFG0, 0x09 },
   711		{ TAS27XX_TDM_CFG1, 0x02 },
   712		{ TAS27XX_TDM_CFG2, 0x0a },
   713		{ TAS27XX_TDM_CFG3, 0x10 },
   714		{ TAS27XX_TDM_CFG5, 0x42 },
   715	};
   716	
   717	static const struct regmap_range_cfg tas27xx_regmap_ranges[] = {
   718		{
   719			.range_min = 0,
   720			.range_max = 1 * 128,
   721			.selector_reg = TAS27XX_PAGE,
   722			.selector_mask = 0xff,
   723			.selector_shift = 0,
   724			.window_start = 0,
   725			.window_len = 128,
   726		},
   727	};
   728	
   729	static bool tas27xx_volatile(struct device *dev,
   730		unsigned int reg)
   731	{
   732			return true;
   733	}
   734	
   735	static const struct regmap_config tas27xx_i2c_regmap = {
   736		.reg_bits = 8,
   737		.val_bits = 8,
   738		.reg_defaults = tas27xx_reg_defaults,
   739		.num_reg_defaults = ARRAY_SIZE(tas27xx_reg_defaults),
   740		.cache_type = REGCACHE_RBTREE,
   741		.ranges = tas27xx_regmap_ranges,
   742		.num_ranges = ARRAY_SIZE(tas27xx_regmap_ranges),
   743		.max_register = 1 * 128,
   744		.volatile_reg = tas27xx_volatile,
   745	};
   746	
   747	static int tas27xx_parse_dt(struct device *dev, struct tas27xx_priv *tas27xx)
   748	{
   749		int ret = 0;
   750	
   751		tas27xx->reset_gpio = devm_gpiod_get_optional(tas27xx->dev, "reset",
   752							      GPIOD_OUT_HIGH);
   753		if (IS_ERR(tas27xx->reset_gpio)) {
   754			if (PTR_ERR(tas27xx->reset_gpio) == -EPROBE_DEFER) {
   755				tas27xx->reset_gpio = NULL;
   756				return -EPROBE_DEFER;
   757			}
   758		}
   759	
   760		tas27xx->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", 
   761			GPIOD_OUT_HIGH);
   762		if (IS_ERR(tas27xx->sdz_gpio)) {
   763			if (PTR_ERR(tas27xx->sdz_gpio) == -EPROBE_DEFER)
   764				return -EPROBE_DEFER;
   765	
   766			tas27xx->sdz_gpio = NULL;
   767		}
   768	
   769		ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
   770					       &tas27xx->i_sense_slot);
   771		if (ret)
   772			tas27xx->i_sense_slot = 0;
   773	
   774		ret = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
   775					       &tas27xx->v_sense_slot);
   776		if (ret)
   777			tas27xx->v_sense_slot = 2;
   778	
   779		return 0;
   780	}
   781	
   782	static int tas27xx_i2c_probe(struct i2c_client *client,
   783				const struct i2c_device_id *id)
   784	{
   785		struct tas27xx_priv *tas27xx;
   786		int result;
   787	
   788		tas27xx = devm_kzalloc(&client->dev, sizeof(struct tas27xx_priv),
   789				       GFP_KERNEL);
   790		if (!tas27xx)
   791			return -ENOMEM;
   792		mutex_init(&tas27xx->codec_lock);
   793		tas27xx->dev = &client->dev;
   794		i2c_set_clientdata(client, tas27xx);
   795		dev_set_drvdata(&client->dev, tas27xx);
   796	
   797		tas27xx->regmap = devm_regmap_init_i2c(client, &tas27xx_i2c_regmap);
   798		if (IS_ERR(tas27xx->regmap)) {
   799			result = PTR_ERR(tas27xx->regmap);
   800			dev_err(&client->dev, "Failed to allocate register map: %d\n",
   801						result);
   802			return result;
   803		}
   804	
   805		if (client->dev.of_node) {
   806			result = tas27xx_parse_dt(&client->dev, tas27xx);
   807			if (result) {
   808				dev_err(tas27xx->dev, 
   809					"%s: Failed to parse devicetree\n", __func__);
   810				return result;
   811			}
   812		}
   813	
   814		tas27xx->device_id = id->driver_data;
   815		dev_info(tas27xx->dev, "chip_id: %u\n", tas27xx->device_id);
   816	
   817		return devm_snd_soc_register_component(tas27xx->dev,
   818			&soc_component_driver_tas27xx, tas27xx_dai_driver,
 > 819			ARRAY_SIZE(tas27xx_dai_driver));
   820	}
   821	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
