Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D6658CC68
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 18:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577F383B;
	Mon,  8 Aug 2022 18:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577F383B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659977682;
	bh=yWQmIbgIyjrVKCgUf6iGtr6BjIz6gdZpAD6263UHGLM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIwxGB0kRX3beYG0qmhS1LwbS4f2t3IYT5P5oEdm8VqjhCT9O14znN1nc0qSVM/H8
	 Gdi3086blRwBYu1X4ClCVfzC7iHNRx5aMTzTHoEFAjWkAp+3d/PESLTt6Ta3ct7bGb
	 xWiTImADufJG0mFmjkABgMhITRRZCm4qoF5KqlsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA84AF804B1;
	Mon,  8 Aug 2022 18:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F0F1F8049C; Mon,  8 Aug 2022 18:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D10F800E8
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 18:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D10F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="boa2Tm2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659977616; x=1691513616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yWQmIbgIyjrVKCgUf6iGtr6BjIz6gdZpAD6263UHGLM=;
 b=boa2Tm2q9fuAsH4dqrcI0AqH/lY7L4zln/VG5K16kqRXzrJbnCKm4KNm
 z7hbV3OkGbAJqoAHXbNMOf3E+zoBhQKh2YxKRAsrHdOu3Z4Go5ZPVQTfW
 PoQC2oyiYu6aMQzI5ZdioQF5Drew1e1wy942WNVPvo5KRKpMz10IhjAMn
 gIY1hh7wjmTIQMMTiHayE6SSyQRhpEydsB0Z9HVVcKnjBtX0W1H7vrsaU
 FItA5F2yhQzAcmKKZPdB4LlIDNu9nHms5e3wM5em+1Jht0radr2sCbh7K
 cOteF8Ak3y/tzOyiZBICWq5cOiv0bI6SfoVqkKZcRMyMCvAv2zGnDvyRr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="289399406"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="289399406"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 09:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="554999022"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2022 09:53:30 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oL60P-000MR3-2S;
 Mon, 08 Aug 2022 16:53:29 +0000
Date: Tue, 9 Aug 2022 00:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Flax <flatmax@flatmax.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: add support for the TI SRC4392 codec
Message-ID: <202208090035.KZkaKxvw-lkp@intel.com>
References: <20220808071952.2432253-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808071952.2432253-1-flatmax@flatmax.com>
Cc: broonie@kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Matt Flax <flatmax@flatmax.com>
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

Hi Matt,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v5.19 next-20220808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Flax/ASoC-codecs-add-support-for-the-TI-SRC4392-codec/20220808-152201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: riscv-randconfig-r042-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090035.KZkaKxvw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/34effe739961486f8c9451714111ee6ad4df8dbd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matt-Flax/ASoC-codecs-add-support-for-the-TI-SRC4392-codec/20220808-152201
        git checkout 34effe739961486f8c9451714111ee6ad4df8dbd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/src4xxx.c:292:3: warning: variable 'd' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                   default:
                   ^~~~~~~
   sound/soc/codecs/src4xxx.c:309:59: note: uninitialized use occurs here
                   ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
                                                                           ^
   sound/soc/codecs/src4xxx.c:235:20: note: initialize the variable 'd' to silence this warning
           int val, pj, jd, d;
                             ^
                              = 0
>> sound/soc/codecs/src4xxx.c:292:3: warning: variable 'jd' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                   default:
                   ^~~~~~~
   sound/soc/codecs/src4xxx.c:304:59: note: uninitialized use occurs here
                   ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
                                                                           ^~
   sound/soc/codecs/src4xxx.c:235:17: note: initialize the variable 'jd' to silence this warning
           int val, pj, jd, d;
                          ^
                           = 0
>> sound/soc/codecs/src4xxx.c:292:3: warning: variable 'pj' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                   default:
                   ^~~~~~~
   sound/soc/codecs/src4xxx.c:299:59: note: uninitialized use occurs here
                   ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
                                                                           ^~
   sound/soc/codecs/src4xxx.c:235:13: note: initialize the variable 'pj' to silence this warning
           int val, pj, jd, d;
                      ^
                       = 0
   3 warnings generated.


vim +/d +292 sound/soc/codecs/src4xxx.c

   227	
   228	static int src4xxx_hw_params(struct snd_pcm_substream *substream,
   229				struct snd_pcm_hw_params *params,
   230				struct snd_soc_dai *dai)
   231	{
   232		struct snd_soc_component *component = dai->component;
   233		struct src4xxx *src4xxx = snd_soc_component_get_drvdata(component);
   234		unsigned int mclk_div;
   235		int val, pj, jd, d;
   236		int reg = SRC4XXX_PORTA_CTL_04;
   237		int ret;
   238	
   239		if (dai->id == SRC4XXX_PORTB)
   240			reg = SRC4XXX_PORTB_CTL_06;
   241	
   242		dev_info(dai->dev, "__func__ enter for dai %d\n", dai->id);
   243	
   244		if (src4xxx->master[dai->id]) {
   245			mclk_div = src4xxx->mclk_hz/params_rate(params);
   246			if (src4xxx->mclk_hz != mclk_div*params_rate(params)) {
   247				dev_err(component->dev,
   248					"mclk %d / rate %d has a remainder.\n",
   249					src4xxx->mclk_hz, params_rate(params));
   250				return -EINVAL;
   251			}
   252	
   253			dev_info(dai->dev, "__func__ mclk %d rate %d div %d\n",
   254				src4xxx->mclk_hz, params_rate(params), mclk_div);
   255			val = ((int)mclk_div - 128) / 128;
   256			dev_info(dai->dev,
   257				"__func__ register value = %d\n", val);
   258			if ((val < 0) | (val > 3)) {
   259				dev_err(component->dev,
   260					"div register setting %d is out of range\n",
   261					val);
   262				dev_err(component->dev,
   263			"unsupported sample rate %d Hz for the master clock of %d Hz\n",
   264					params_rate(params), src4xxx->mclk_hz);
   265				return -EINVAL;
   266			}
   267	
   268			/* set the TX DIV */
   269			ret = regmap_update_bits(src4xxx->regmap,
   270				SRC4XXX_TX_CTL_07, SRC4XXX_TX_MCLK_DIV_MASK,
   271				val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
   272			if (ret) {
   273				dev_err(component->dev,
   274			"Couldn't set the TX's div register to %d << %d = 0x%x\n",
   275					val, SRC4XXX_TX_MCLK_DIV_SHIFT,
   276					val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
   277				return ret;
   278			}
   279	
   280			/* set the PLL for the digital receiver */
   281			switch (src4xxx->mclk_hz) {
   282			case 24576000:
   283				pj = 0x22;
   284				jd = 0x00;
   285				d = 0x00;
   286				break;
   287			case 22579200:
   288				pj = 0x22;
   289				jd = 0x1b;
   290				d = 0xa3;
   291				break;
 > 292			default:
   293				/* don't error out here,
   294				 * other parts of the chip are still functional
   295				 */
   296				dev_info(component->dev,
   297		"Couldn't set the RCV PLL as this master clock rate is unknown\n");
   298			}
   299			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
   300			if (ret < 0)
   301				dev_err(component->dev,
   302					"Failed to update PLL register 0x%x\n",
   303					SRC4XXX_RCV_PLL_0F);
   304			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
   305			if (ret < 0)
   306				dev_err(component->dev,
   307					"Failed to update PLL register 0x%x\n",
   308					SRC4XXX_RCV_PLL_10);
   309			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
   310			if (ret < 0)
   311				dev_err(component->dev,
   312					"Failed to update PLL register 0x%x\n",
   313					SRC4XXX_RCV_PLL_11);
   314	
   315			ret = regmap_update_bits(src4xxx->regmap,
   316				SRC4XXX_TX_CTL_07, SRC4XXX_TX_MCLK_DIV_MASK,
   317				val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
   318			if (ret < 0) {
   319				dev_err(component->dev,
   320			"Couldn't set the TX's div register to %d << %d = 0x%x\n",
   321					val, SRC4XXX_TX_MCLK_DIV_SHIFT,
   322					val<<SRC4XXX_TX_MCLK_DIV_SHIFT);
   323				return ret;
   324			}
   325	
   326			return regmap_update_bits(src4xxx->regmap, reg,
   327						SRC4XXX_MCLK_DIV_MASK, val);
   328		} else
   329			dev_info(dai->dev, "not setting up MCLK as not master\n");
   330	
   331		return 0;
   332	};
   333	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
