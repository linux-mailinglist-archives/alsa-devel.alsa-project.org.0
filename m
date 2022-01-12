Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAF48CB44
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 19:50:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F0F1E7E;
	Wed, 12 Jan 2022 19:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F0F1E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642013424;
	bh=S+9Hkct5+tm9keRKK0+VszBhrtwGun6tkkUL5o0d65E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MC0CaLR6SlGeP3z6ooIqF1jQzRwZONA0IFusAPGEUIYEpTBaXuwsk/l7JY4z14ixm
	 DbRq4V6WdzuXjN+KAUzvf5MSvCIbL3Q8QaHuvVnc3o59exrCFhJ8am6ouFu+v/Lw+G
	 So6qfBoGjfTcbYG/3naDv8a7/em9mDsaZ/bD+14A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2817F8026D;
	Wed, 12 Jan 2022 19:49:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17792F8026A; Wed, 12 Jan 2022 19:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E40FF800B9
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 19:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E40FF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hr4h9GW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642013348; x=1673549348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S+9Hkct5+tm9keRKK0+VszBhrtwGun6tkkUL5o0d65E=;
 b=Hr4h9GW3wiOiu7DipEdAvzMKVcZiY/b8t0FV0+iHRAEzGKp3KQ/XoS9+
 G6oP4llx9PHwqm38YBv78zh6JEaCW956buaI7cnjQSRy9LI3LVMpgTYZR
 1lHgwFgKUZmDKIeT0jo2rKtixE6etsk6/op6VTpjyE6VfJ6InD/wRoM7m
 CEiqwoG7Fx3T6+nuxfeQ8BaowAZTVrKJXzYm4zEnq4dH8whqp9n5/Hyva
 W/O2DZL3Lqh5V7k3jmWu2dBQsDnC/Jl2AsZsaIf7IfDDW6p+2kOXU6SJW
 SoWij9tZy1u/OuiniPskSopWyHSa+L+H6oD7m5BWni23xDidDqi9AZg/0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="241375348"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="241375348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 10:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="472932173"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 12 Jan 2022 10:43:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7iaR-0006Ev-Di; Wed, 12 Jan 2022 18:43:07 +0000
Date: Thu, 13 Jan 2022 02:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Schambacher <joerg@hifiberry.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3] ASoC: adds component driver for TAS575xM digital
 amplifiers
Message-ID: <202201130224.PtfT1pHZ-lkp@intel.com>
References: <20220110084554.2228-1-joerg@hifiberry.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110084554.2228-1-joerg@hifiberry.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: joerg@hifiberry.com, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 broonie@kernel.org
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

Hi Joerg,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.16 next-20220112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Joerg-Schambacher/ASoC-adds-component-driver-for-TAS575xM-digital-amplifiers/20220110-164852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm-randconfig-r034-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130224.PtfT1pHZ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/194435492a87ace959d74aae1cecb27f16ad8966
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Joerg-Schambacher/ASoC-adds-component-driver-for-TAS575xM-digital-amplifiers/20220110-164852
        git checkout 194435492a87ace959d74aae1cecb27f16ad8966
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas5754m.c:273:5: warning: no previous prototype for function 'tas5754m_set_clock_tree_master' [-Wmissing-prototypes]
   int tas5754m_set_clock_tree_master(struct snd_soc_dai *dai,
       ^
   sound/soc/codecs/tas5754m.c:273:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tas5754m_set_clock_tree_master(struct snd_soc_dai *dai,
   ^
   static 
>> sound/soc/codecs/tas5754m.c:346:5: warning: no previous prototype for function 'tas5754m_set_dai_mode' [-Wmissing-prototypes]
   int tas5754m_set_dai_mode(struct snd_soc_dai *dai)
       ^
   sound/soc/codecs/tas5754m.c:346:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tas5754m_set_dai_mode(struct snd_soc_dai *dai)
   ^
   static 
>> sound/soc/codecs/tas5754m.c:417:23: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                                   !TAS5754M_RLRK | !TAS5754M_RBCK,
                                                     ^
   sound/soc/codecs/tas5754m.h:145:32: note: expanded from macro 'TAS5754M_RBCK'
   #define TAS5754M_RBCK       (1 << 1)
                                  ^
   sound/soc/codecs/tas5754m.c:417:6: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
                                   !TAS5754M_RLRK | !TAS5754M_RBCK,
                                    ^
   sound/soc/codecs/tas5754m.h:143:32: note: expanded from macro 'TAS5754M_RLRK'
   #define TAS5754M_RLRK       (1 << 0)
                                  ^
>> sound/soc/codecs/tas5754m.c:395:5: warning: no previous prototype for function 'tas5754m_set_dividers_master' [-Wmissing-prototypes]
   int tas5754m_set_dividers_master(struct snd_soc_dai *dai,
       ^
   sound/soc/codecs/tas5754m.c:395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tas5754m_set_dividers_master(struct snd_soc_dai *dai,
   ^
   static 
>> sound/soc/codecs/tas5754m.c:608:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret != 0) {
               ^~~
   sound/soc/codecs/tas5754m.c:597:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   6 warnings generated.


vim +/tas5754m_set_clock_tree_master +273 sound/soc/codecs/tas5754m.c

   272	
 > 273	int tas5754m_set_clock_tree_master(struct snd_soc_dai *dai,
   274						struct snd_pcm_hw_params *params)
   275	{
   276		struct snd_soc_component *component = dai->component;
   277		struct tas5754m_priv *tas5754m =
   278				snd_soc_component_get_drvdata(component);
   279		static const struct reg_sequence pll_settings[] = {
   280			{ TAS5754M_PLL_COEFF_P,		0x01 },	// P=2
   281			{ TAS5754M_PLL_COEFF_J,		0x08 },	// J=8
   282			{ TAS5754M_PLL_COEFF_DL,	0x00 },	// D12-8 = 0
   283			{ TAS5754M_PLL_COEFF_DH,	0x00 },	// D7-0 = 0
   284			{ TAS5754M_PLL_COEFF_R,		0x00 },	// R=1
   285		};
   286		int ret;
   287	
   288		/* disable PLL before any clock tree change */
   289		ret = regmap_update_bits(tas5754m->regmap, TAS5754M_PLL_EN,
   290					 TAS5754M_PLLE, 0);
   291		if (ret != 0) {
   292			dev_err(component->dev, "Failed to disable PLL: %d\n", ret);
   293			return ret;
   294		}
   295	
   296		/* set DAC clock source to MCLK */
   297		ret = regmap_write(tas5754m->regmap, TAS5754M_DAC_REF, 0x30);
   298		if (ret != 0) {
   299			dev_err(component->dev, "Failed to set DAC ref\n");
   300			return ret;
   301		}
   302	
   303		/* run PLL at fixed ratio to MCLK */
   304		ret = regmap_multi_reg_write(tas5754m->regmap, pll_settings,
   305						ARRAY_SIZE(pll_settings));
   306		if (ret != 0) {
   307			dev_err(component->dev, "Failed to set PLL ratio\n");
   308			return ret;
   309		}
   310	
   311		/* set DSP divider to 2 => reg 0x01 */
   312		ret = regmap_write(tas5754m->regmap, TAS5754M_DSP_CLKDIV, 1);
   313		if (ret != 0) {
   314			dev_err(component->dev, "Failed to set DSP divider\n");
   315			return ret;
   316		}
   317		/* set DAC divider to 4 => reg 0x03*/
   318		ret = regmap_write(tas5754m->regmap, TAS5754M_DAC_CLKDIV, 3);
   319		if (ret != 0) {
   320			dev_err(component->dev, "Failed to set OSDACR divider\n");
   321			return ret;
   322		}
   323		/* set OSR divider to 1 */
   324		ret = regmap_write(tas5754m->regmap, TAS5754M_OSR_CLKDIV, 0);
   325		if (ret != 0) {
   326			dev_err(component->dev, "Failed to set OSR divider\n");
   327			return ret;
   328		}
   329		/* set CP divider to 4 => reg 0x03*/
   330		ret = regmap_write(tas5754m->regmap, TAS5754M_NCP_CLKDIV, 3);
   331		if (ret != 0) {
   332			dev_err(component->dev, "Failed to set CP divider\n");
   333			return ret;
   334		}
   335		/* finally enable PLL */
   336		ret = regmap_update_bits(tas5754m->regmap, TAS5754M_PLL_EN,
   337					 TAS5754M_PLLE, 1);
   338		if (ret != 0) {
   339			dev_err(component->dev, "Failed to enable PLL: %d\n", ret);
   340			return ret;
   341		}
   342	
   343		return 0;
   344	}
   345	
 > 346	int tas5754m_set_dai_mode(struct snd_soc_dai *dai)
   347	{
   348		struct snd_soc_component *component = dai->component;
   349		struct tas5754m_priv *tas5754m =
   350				snd_soc_component_get_drvdata(component);
   351		int fmt = tas5754m->fmt;
   352	
   353		/* only I2S MASTER mode implemented */
   354		if (((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S)) {
   355			dev_err(component->dev,
   356				"DAI format not supported (I2S master only)\n");
   357			return -EINVAL;
   358		}
   359		/* TAS5754/6m do not support inverted clocks in MASTER mode */
   360		if (((fmt & SND_SOC_DAIFMT_CLOCK_MASK) != SND_SOC_DAIFMT_NB_NF)) {
   361			dev_err(component->dev,	"Inverted clocks not supported\n");
   362			return -EINVAL;
   363		}
   364	
   365		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
   366		case SND_SOC_DAIFMT_CBM_CFM:
   367			regmap_update_bits(tas5754m->regmap,
   368					TAS5754M_BCLK_LRCLK_CFG,
   369					TAS5754M_LRKO | TAS5754M_BCKO,
   370					TAS5754M_LRKO | TAS5754M_BCKO);
   371			/* reset CLK dividers */
   372			regmap_update_bits(tas5754m->regmap,
   373					TAS5754M_MASTER_MODE,
   374					0x00,
   375					TAS5754M_RLRK | TAS5754M_RBCK);
   376			/* ignore all clock error detection but MCLK */
   377			regmap_update_bits(tas5754m->regmap,
   378					TAS5754M_ERROR_DETECT,
   379					TAS5754M_IPLK | TAS5754M_DCAS |
   380					TAS5754M_IDCM | TAS5754M_IDSK |
   381					TAS5754M_IDBK | TAS5754M_IDFS,
   382					TAS5754M_IPLK | TAS5754M_DCAS |
   383					TAS5754M_IDCM | TAS5754M_IDSK |
   384					TAS5754M_IDBK | TAS5754M_IDFS);
   385			break;
   386		case SND_SOC_DAIFMT_CBS_CFS:
   387		case SND_SOC_DAIFMT_CBM_CFS:
   388		default:
   389			return -EINVAL;
   390		}
   391	
   392		return 0;
   393	}
   394	
 > 395	int tas5754m_set_dividers_master(struct snd_soc_dai *dai,
   396					struct snd_pcm_hw_params *params)
   397	{
   398		struct snd_soc_component *component = dai->component;
   399		struct tas5754m_priv *tas5754m =
   400				snd_soc_component_get_drvdata(component);
   401		unsigned long bclk;
   402		unsigned long mclk;
   403		int bclk_div;
   404		int lrclk_div;
   405		int osr;
   406		int ret;
   407	
   408		mclk = clk_get_rate(tas5754m->sclk);
   409		bclk = tas5754m->sample_len * 2 * params_rate(params);
   410		bclk_div = mclk / bclk;
   411		lrclk_div = tas5754m->sample_len * 2;
   412		osr = mclk / 4 / params_rate(params) / 16;
   413	
   414		// stop LR / SCLK clocks
   415		ret = regmap_update_bits(tas5754m->regmap,
   416					TAS5754M_MASTER_MODE,
 > 417					!TAS5754M_RLRK | !TAS5754M_RBCK,
   418					TAS5754M_RLRK | TAS5754M_RBCK);
   419		if (ret != 0) {
   420			dev_err(component->dev, "Failed to stop PLL\n");
   421			return ret;
   422		}
   423	
   424		// set SCLK divider
   425		ret = regmap_write(tas5754m->regmap, TAS5754M_MASTER_SCLKDIV,
   426									bclk_div - 1);
   427		if (ret != 0) {
   428			dev_err(component->dev, "Failed to set SCLK divider\n");
   429			return ret;
   430		}
   431	
   432		// set LRCLK divider
   433		ret = regmap_write(tas5754m->regmap, TAS5754M_MASTER_LRCLKDIV,
   434									lrclk_div - 1);
   435		if (ret != 0) {
   436			dev_err(component->dev, "Failed to set LRCLK divider\n");
   437			return ret;
   438		}
   439	
   440		ret = regmap_write(tas5754m->regmap,
   441			TAS5754M_OSR_CLKDIV, osr - 1);
   442		if (ret != 0) {
   443			dev_err(component->dev, "Failed to set OSR divider\n");
   444			return ret;
   445		}
   446	
   447		// restart LR / SCLK clocks
   448		ret = regmap_update_bits(tas5754m->regmap,
   449					TAS5754M_MASTER_MODE,
   450					TAS5754M_RLRK | TAS5754M_RBCK,
   451					TAS5754M_RLRK | TAS5754M_RBCK);
   452		if (ret != 0) {
   453			dev_err(component->dev, "Failed to restart PLL\n");
   454			return ret;
   455		}
   456	
   457		return 0;
   458	}
   459	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
