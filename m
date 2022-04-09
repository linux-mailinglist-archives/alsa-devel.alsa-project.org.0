Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 000814FAA1C
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 20:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84BA41757;
	Sat,  9 Apr 2022 20:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84BA41757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649528134;
	bh=nxAwLnx8OXpcTev4SZ0eUGxD8S9S5xznLMKy+KbtP3w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsMGZQMNR7imKhudyGXSz7QtR4jhnz+oB6r/79Q24Kj/amQk4g3rCAjfMU3gbiwkf
	 2gn5O62gb+Yr4XInofjAiqp/JkulUfJkLsbyywksLJSu1X5+46kgk5zDvyh4FIm/Fq
	 kSu6zVgn+S77qVwHny8nMJfN0uVloi8/s8GxJ2a0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED000F80054;
	Sat,  9 Apr 2022 20:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33EF0F80253; Sat,  9 Apr 2022 20:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA422F80128
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 20:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA422F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UZJIPv6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649528066; x=1681064066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nxAwLnx8OXpcTev4SZ0eUGxD8S9S5xznLMKy+KbtP3w=;
 b=UZJIPv6kT1YjjTRn5BgGIoDJQCHFvP2Y1K37e6apzElizJXW18c4HZED
 uTdn6uboKiqJm2R3v8K64o7uUTDFXdlhEz4prhIABEWgXwR1bvtLZ8nx8
 25z/ugiyOx9+QCLKEsoSsBU58wWmYSi3OgG7H0ELqee/NQg4nRmf6S2Ft
 zHjnN+/v6oIcUwX3UmEkp5sCsva29nh/+14lD7N4Gf+QTTnQdrnKt8xhN
 xtvmuHMuJaRo5lx3FY/5L3QvwL1WyHFt/oxEv3tN1ORaVlAWidmgdYCDa
 52cG3RcmWnIvdkfsinYh6Q7AadjZvVaAEcXeB6IBKRRQpQ0dOZg5iVTzP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10312"; a="348286339"
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; d="scan'208";a="348286339"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2022 11:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,248,1643702400"; d="scan'208";a="852655992"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2022 11:14:18 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ndFbF-0000Hv-Gf;
 Sat, 09 Apr 2022 18:14:17 +0000
Date: Sun, 10 Apr 2022 02:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
Subject: Re: [PATCH v7 2/3] rename variables from tas2764 to tas27xx
Message-ID: <202204100206.lA9gnwWM-lkp@intel.com>
References: <20220409122709.15419-2-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409122709.15419-2-13691752556@139.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org, shenghao-ding@ti.com,
 navada@ti.com, raphael-xu@ti.com, Raphael-Xu <13691752556@139.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.18-rc1 next-20220408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Xu/rename-tas2764-to-tas27xx/20220409-203153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: sparc64-randconfig-s031-20220409 (https://download.01.org/0day-ci/archive/20220410/202204100206.lA9gnwWM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/a593d3d588870acd87dad48119f08dc685c4e65e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Raphael-Xu/rename-tas2764-to-tas27xx/20220409-203153
        git checkout a593d3d588870acd87dad48119f08dc685c4e65e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/tas27xx.c:234:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/tas27xx.c:240:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/soc/codecs/tas27xx.c:246:14: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/soc/codecs/tas27xx.c:334:58: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int bitwidth @@     got restricted snd_pcm_format_t @@
   sound/soc/codecs/tas27xx.c:334:58: sparse:     expected int bitwidth
   sound/soc/codecs/tas27xx.c:334:58: sparse:     got restricted snd_pcm_format_t

vim +234 sound/soc/codecs/tas27xx.c

827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  225  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  226  static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx, int bitwidth)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  227  {
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  228  	struct snd_soc_component *component = tas27xx->component;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  229  	int sense_en;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  230  	int val;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  231  	int ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  232  
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  233  	switch (bitwidth) {
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07 @234  	case SNDRV_PCM_FORMAT_S16_LE:
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  235  		ret = snd_soc_component_update_bits(component,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  236  					TAS27XX_TDM_CFG2,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  237  					TAS27XX_TDM_CFG2_RXW_MASK,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  238  					TAS27XX_TDM_CFG2_RXW_16BITS);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  239  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  240  	case SNDRV_PCM_FORMAT_S24_LE:
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  241  		ret = snd_soc_component_update_bits(component,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  242  					TAS27XX_TDM_CFG2,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  243  					TAS27XX_TDM_CFG2_RXW_MASK,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  244  					TAS27XX_TDM_CFG2_RXW_24BITS);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  245  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  246  	case SNDRV_PCM_FORMAT_S32_LE:
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  247  		ret = snd_soc_component_update_bits(component,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  248  					TAS27XX_TDM_CFG2,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  249  					TAS27XX_TDM_CFG2_RXW_MASK,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  250  					TAS27XX_TDM_CFG2_RXW_32BITS);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  251  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  252  
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  253  	default:
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  254  		return -EINVAL;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  255  	}
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  256  
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  257  	if (ret < 0)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  258  		return ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  259  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  260  	val = snd_soc_component_read(tas27xx->component, TAS27XX_PWR_CTRL);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  261  	if (val < 0)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  262  		return val;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  263  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  264  	if (val & (1 << TAS27XX_VSENSE_POWER_EN))
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  265  		sense_en = 0;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  266  	else
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  267  		sense_en = TAS27XX_TDM_CFG5_VSNS_ENABLE;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  268  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  269  	ret = snd_soc_component_update_bits(tas27xx->component,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  270  		TAS27XX_TDM_CFG5, TAS27XX_TDM_CFG5_VSNS_ENABLE, sense_en);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  271  	if (ret < 0)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  272  		return ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  273  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  274  	if (val & (1 << TAS27XX_ISENSE_POWER_EN))
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  275  		sense_en = 0;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  276  	else
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  277  		sense_en = TAS27XX_TDM_CFG6_ISNS_ENABLE;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  278  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  279  	ret = snd_soc_component_update_bits(tas27xx->component,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  280  		TAS27XX_TDM_CFG6, TAS27XX_TDM_CFG6_ISNS_ENABLE, sense_en);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  281  	if (ret < 0)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  282  		return ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  283  
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  284  	return 0;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  285  }
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  286  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  287  static int tas27xx_set_samplerate(
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  288  	struct tas27xx_priv *tas27xx, int samplerate)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  289  {
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  290  	struct snd_soc_component *component = tas27xx->component;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  291  	int ramp_rate_val;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  292  	int ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  293  
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  294  	switch (samplerate) {
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  295  	case 48000:
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  296  		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_48KHZ |
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  297  				TAS27XX_TDM_CFG0_44_1_48KHZ;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  298  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  299  	case 44100:
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  300  		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_44_1KHZ |
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  301  				TAS27XX_TDM_CFG0_44_1_48KHZ;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  302  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  303  	case 96000:
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  304  		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_48KHZ |
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  305  				TAS27XX_TDM_CFG0_88_2_96KHZ;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  306  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  307  	case 88200:
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  308  		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_44_1KHZ |
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  309  				TAS27XX_TDM_CFG0_88_2_96KHZ;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  310  		break;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  311  	default:
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  312  		return -EINVAL;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  313  	}
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  314  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  315  	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG0,
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  316  					    TAS27XX_TDM_CFG0_SMP_MASK |
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  317  					    TAS27XX_TDM_CFG0_MASK,
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  318  					    ramp_rate_val);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  319  	if (ret < 0)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  320  		return ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  321  
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  322  	return 0;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  323  }
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  324  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  325  static int tas27xx_hw_params(struct snd_pcm_substream *substream,
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  326  			     struct snd_pcm_hw_params *params,
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  327  			     struct snd_soc_dai *dai)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  328  {
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  329  	struct snd_soc_component *component = dai->component;
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  330  	struct tas27xx_priv *tas27xx =
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  331  		snd_soc_component_get_drvdata(component);
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  332  	int ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  333  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09 @334  	ret = tas27xx_set_bitwidth(tas27xx, params_format(params));
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  335  	if (ret < 0)
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  336  		return ret;
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  337  
a593d3d588870a sound/soc/codecs/tas27xx.c Raphael-Xu 2022-04-09  338  	return tas27xx_set_samplerate(tas27xx, params_rate(params));
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  339  }
827ed8a0fa50bd sound/soc/codecs/tas2764.c Dan Murphy 2020-10-07  340  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
