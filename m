Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B84DCC14
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751A516F8;
	Thu, 17 Mar 2022 18:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751A516F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647536943;
	bh=VZ58v0WTL2meOOEup/oWXrFITYD+4zaBx8N2UFysGuM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJ1m9qEhnO8hJXhfiIj4Mcin2Lc3dnlR6uWQJvvXTOs6tQykDj8g4P/9sK4lu/KY6
	 s/1ZBx4T1AuW6QWq6E9Tu4FjaNaFxic3ODri9lQDIpZhAn7XFJVNGxTKcDOChuRuSE
	 ytz7ooAgJwHYcJUwttOygQjRj1QN24txbcXCzFAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FCFBF8014C;
	Thu, 17 Mar 2022 18:07:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484F9F8013F; Thu, 17 Mar 2022 18:07:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 504B1F80125
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504B1F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n7uhO2Xc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647536868; x=1679072868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VZ58v0WTL2meOOEup/oWXrFITYD+4zaBx8N2UFysGuM=;
 b=n7uhO2XcQUGJLqGBjr5yTu0n6Wj7S/2nPzJhZZ1Eib8LXNTP29GphyOu
 f2qIO5rTgUr1oJAeX3moPqOhFrJX3K9c9X1D6V3RQWYIXTIt6gWjoTSHp
 qAxWXXFMh6eHFlOsBsS+bBYeBlugQ9wMe6IpzCxd9NLGlo5Gt1vJAdYoA
 w5UVBqdGaCVtjrlj3tKeomA5bTg1zkbhILydskW8WW0ou/JeIdXmOPA3W
 JrbSOiFnCz9BXD9EECCusJCzr9GUYEZPLmrCisPav+5KEMHK2/CGCu9vU
 QYMTCCTz5+kR6Ec97l4Z7+jexcWa7wST8cE2w2t1sB58bDxSPdXCXxuik Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="255747492"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="255747492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="715111924"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2022 10:06:23 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUtZu-000DrJ-Dw; Thu, 17 Mar 2022 17:06:22 +0000
Date: Fri, 18 Mar 2022 01:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 05/19] ASoC: fsl_micfil: use GENMASK to define register
 bit fields
Message-ID: <202203180058.UK8cEQvk-lkp@intel.com>
References: <20220317082818.503143-6-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317082818.503143-6-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

Hi Sascha,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on shawnguo/for-next vkoul-dmaengine/next v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/ASoC-fsl_micfil-Driver-updates/20220317-163034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: nds32-randconfig-r026-20220317 (https://download.01.org/0day-ci/archive/20220318/202203180058.UK8cEQvk-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/efbc0b5535c7612d0e3ac5473c86e66c7d0bd7a6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/ASoC-fsl_micfil-Driver-updates/20220317-163034
        git checkout efbc0b5535c7612d0e3ac5473c86e66c7d0bd7a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nds32 SHELL=/bin/bash sound/soc/fsl/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/fsl/fsl_micfil.c: In function 'get_pdm_clk':
>> sound/soc/fsl/fsl_micfil.c:119:20: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     119 |         osr = 16 - FIELD_GET(MICFIL_CTRL2_CICOSR, ctrl2_reg);
         |                    ^~~~~~~~~
         |                    FOLL_GET
   sound/soc/fsl/fsl_micfil.c: In function 'fsl_micfil_trigger':
>> sound/soc/fsl/fsl_micfil.c:247:33: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     247 |                                 FIELD_PREP(MICFIL_CTRL1_DISEL, MICFIL_CTRL1_DISEL_DMA));
         |                                 ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +119 sound/soc/fsl/fsl_micfil.c

   110	
   111	static inline int get_pdm_clk(struct fsl_micfil *micfil,
   112				      unsigned int rate)
   113	{
   114		u32 ctrl2_reg;
   115		int qsel, osr;
   116		int bclk;
   117	
   118		regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
 > 119		osr = 16 - FIELD_GET(MICFIL_CTRL2_CICOSR, ctrl2_reg);
   120		qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
   121	
   122		switch (qsel) {
   123		case MICFIL_QSEL_HIGH_QUALITY:
   124			bclk = rate * 8 * osr / 2; /* kfactor = 0.5 */
   125			break;
   126		case MICFIL_QSEL_MEDIUM_QUALITY:
   127		case MICFIL_QSEL_VLOW0_QUALITY:
   128			bclk = rate * 4 * osr * 1; /* kfactor = 1 */
   129			break;
   130		case MICFIL_QSEL_LOW_QUALITY:
   131		case MICFIL_QSEL_VLOW1_QUALITY:
   132			bclk = rate * 2 * osr * 2; /* kfactor = 2 */
   133			break;
   134		case MICFIL_QSEL_VLOW2_QUALITY:
   135			bclk = rate * osr * 4; /* kfactor = 4 */
   136			break;
   137		default:
   138			dev_err(&micfil->pdev->dev,
   139				"Please make sure you select a valid quality.\n");
   140			bclk = -1;
   141			break;
   142		}
   143	
   144		return bclk;
   145	}
   146	
   147	static inline int get_clk_div(struct fsl_micfil *micfil,
   148				      unsigned int rate)
   149	{
   150		long mclk_rate;
   151		int clk_div;
   152	
   153		mclk_rate = clk_get_rate(micfil->mclk);
   154	
   155		clk_div = mclk_rate / (get_pdm_clk(micfil, rate) * 2);
   156	
   157		return clk_div;
   158	}
   159	
   160	/* The SRES is a self-negated bit which provides the CPU with the
   161	 * capability to initialize the PDM Interface module through the
   162	 * slave-bus interface. This bit always reads as zero, and this
   163	 * bit is only effective when MDIS is cleared
   164	 */
   165	static int fsl_micfil_reset(struct device *dev)
   166	{
   167		struct fsl_micfil *micfil = dev_get_drvdata(dev);
   168		int ret;
   169	
   170		ret = regmap_update_bits(micfil->regmap,
   171					 REG_MICFIL_CTRL1,
   172					 MICFIL_CTRL1_MDIS,
   173					 0);
   174		if (ret) {
   175			dev_err(dev, "failed to clear MDIS bit %d\n", ret);
   176			return ret;
   177		}
   178	
   179		ret = regmap_update_bits(micfil->regmap,
   180					 REG_MICFIL_CTRL1,
   181					 MICFIL_CTRL1_SRES,
   182					 MICFIL_CTRL1_SRES);
   183		if (ret) {
   184			dev_err(dev, "failed to reset MICFIL: %d\n", ret);
   185			return ret;
   186		}
   187	
   188		return 0;
   189	}
   190	
   191	static int fsl_micfil_set_mclk_rate(struct fsl_micfil *micfil,
   192					    unsigned int freq)
   193	{
   194		struct device *dev = &micfil->pdev->dev;
   195		int ret;
   196	
   197		clk_disable_unprepare(micfil->mclk);
   198	
   199		ret = clk_set_rate(micfil->mclk, freq * 1024);
   200		if (ret)
   201			dev_warn(dev, "failed to set rate (%u): %d\n",
   202				 freq * 1024, ret);
   203	
   204		clk_prepare_enable(micfil->mclk);
   205	
   206		return ret;
   207	}
   208	
   209	static int fsl_micfil_startup(struct snd_pcm_substream *substream,
   210				      struct snd_soc_dai *dai)
   211	{
   212		struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
   213	
   214		if (!micfil) {
   215			dev_err(dai->dev, "micfil dai priv_data not set\n");
   216			return -EINVAL;
   217		}
   218	
   219		return 0;
   220	}
   221	
   222	static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
   223				      struct snd_soc_dai *dai)
   224	{
   225		struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
   226		struct device *dev = &micfil->pdev->dev;
   227		int ret;
   228	
   229		switch (cmd) {
   230		case SNDRV_PCM_TRIGGER_START:
   231		case SNDRV_PCM_TRIGGER_RESUME:
   232		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
   233			ret = fsl_micfil_reset(dev);
   234			if (ret) {
   235				dev_err(dev, "failed to soft reset\n");
   236				return ret;
   237			}
   238	
   239			/* DMA Interrupt Selection - DISEL bits
   240			 * 00 - DMA and IRQ disabled
   241			 * 01 - DMA req enabled
   242			 * 10 - IRQ enabled
   243			 * 11 - reserved
   244			 */
   245			ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
   246					MICFIL_CTRL1_DISEL,
 > 247					FIELD_PREP(MICFIL_CTRL1_DISEL, MICFIL_CTRL1_DISEL_DMA));
   248			if (ret) {
   249				dev_err(dev, "failed to update DISEL bits\n");
   250				return ret;
   251			}
   252	
   253			/* Enable the module */
   254			ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
   255						 MICFIL_CTRL1_PDMIEN,
   256						 MICFIL_CTRL1_PDMIEN);
   257			if (ret) {
   258				dev_err(dev, "failed to enable the module\n");
   259				return ret;
   260			}
   261	
   262			break;
   263		case SNDRV_PCM_TRIGGER_STOP:
   264		case SNDRV_PCM_TRIGGER_SUSPEND:
   265		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
   266			/* Disable the module */
   267			ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
   268						 MICFIL_CTRL1_PDMIEN,
   269						 0);
   270			if (ret) {
   271				dev_err(dev, "failed to enable the module\n");
   272				return ret;
   273			}
   274	
   275			ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
   276					MICFIL_CTRL1_DISEL,
   277					FIELD_PREP(MICFIL_CTRL1_DISEL, MICFIL_CTRL1_DISEL_DISABLE));
   278			if (ret) {
   279				dev_err(dev, "failed to update DISEL bits\n");
   280				return ret;
   281			}
   282			break;
   283		default:
   284			return -EINVAL;
   285		}
   286		return 0;
   287	}
   288	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
