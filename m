Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF650B119
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 09:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 492E41614;
	Fri, 22 Apr 2022 09:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 492E41614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650611288;
	bh=K5K/9LP5qRdw+kAG2wypguFk5flX/j+CqMO4RT/vvxA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuDz/vmJuaGmDAJV77qt8rbCDf863RtLT1KbDQAXrhtIRbxG+x+0449YZja4h7T9u
	 ziw+Li09UOjtZ6f07nn5aNr9xpVu6k9lJwUMFY29Tb0NFNKsog0FxpgWGEXwVyWrH/
	 qZon4znlK2IgCZ4qO9o12xROdJTuAOQBn1EkcOuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6EDAF80249;
	Fri, 22 Apr 2022 09:07:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5483F80245; Fri, 22 Apr 2022 09:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A42FCF80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 09:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A42FCF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kEI0DqIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650611222; x=1682147222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K5K/9LP5qRdw+kAG2wypguFk5flX/j+CqMO4RT/vvxA=;
 b=kEI0DqIzqEIzCZbXKUIxq1oW0OB/R/esvaOXq5y8T9bhlWrjlXK7qwhh
 U/42jtxJ/yLdPr0FMl/uCsdBsDvbgTYTs8NhsRgkjuZxNgG25RwRG/Tz4
 AyNCi7jZOHv3x4LBuM4PR2idObxtVjZzY2wvWY6EhFIL+0EJZ98G0cRbB
 2I3tRRPycXw5+vB77mcXb/I8XYrzhFD/WK38YHwNlbDuOXtMRLhJYr2z2
 BcsNptoTBpIDZU0ftaDUoH0OQ2e10JIahqp5uka2d7Aba4aMbXghewaqn
 T9hz0C7rKU9imEo0uwXmW1dS4wUioefreZXV+fuLuf+0oiEM9DbTBgHn6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264071749"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="264071749"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="577715736"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 22 Apr 2022 00:06:53 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhnNU-0009M8-Fo;
 Fri, 22 Apr 2022 07:06:52 +0000
Date: Fri, 22 Apr 2022 15:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Lee <ryan.lee.analog@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 cy_huang@richtek.com, pierre-louis.bossart@linux.intel.com,
 drhodes@opensource.cirrus.com, pbrobinson@gmail.com,
 hdegoede@redhat.com, lukas.bulwahn@gmail.com, stephan@gerhold.net,
 arnd@arndb.de, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryans.lee@analog.com
Subject: Re: [PATCH V2 2/2] ASoC: max98396: add amplifier driver
Message-ID: <202204221550.phNeKLyn-lkp@intel.com>
References: <20220421230253.823798-2-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421230253.823798-2-ryan.lee.analog@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
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

Hi Ryan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.18-rc3 next-20220421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Lee/ASoC-dt-bindings-max98396-add-amplifier-driver/20220422-070610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm-buildonly-randconfig-r003-20220421 (https://download.01.org/0day-ci/archive/20220422/202204221550.phNeKLyn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/1acb9ac9acbd834a2e93c2127be6bdd1716dc6dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ryan-Lee/ASoC-dt-bindings-max98396-add-amplifier-driver/20220422-070610
        git checkout 1acb9ac9acbd834a2e93c2127be6bdd1716dc6dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/max98396.c:408:7: warning: variable 'update' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (format != (reg & MAX98396_PCM_MODE_CFG_FORMAT_MASK))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98396.c:411:7: note: uninitialized use occurs here
                   if (update)
                       ^~~~~~
   sound/soc/codecs/max98396.c:408:3: note: remove the 'if' if its condition is always true
                   if (format != (reg & MAX98396_PCM_MODE_CFG_FORMAT_MASK))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/max98396.c:349:13: note: initialize the variable 'update' to silence this warning
           bool update;
                      ^
                       = 0
   1 warning generated.


vim +408 sound/soc/codecs/max98396.c

   339	
   340	static int max98396_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
   341	{
   342		struct snd_soc_component *component = codec_dai->component;
   343		struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
   344		unsigned int format;
   345		unsigned int bclk_pol = 0;
   346		unsigned int fsync_pol = 0;
   347		int ret, status;
   348		int reg;
   349		bool update;
   350	
   351		dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
   352	
   353		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   354		case SND_SOC_DAIFMT_NB_NF:
   355			break;
   356		case SND_SOC_DAIFMT_NB_IF:
   357			fsync_pol = MAX98396_PCM_MODE_CFG_PCM_LRCLKEDGE;
   358			break;
   359		case SND_SOC_DAIFMT_IB_NF:
   360			bclk_pol = MAX98396_PCM_MODE_CFG_PCM_BCLKEDGE;
   361			break;
   362		case SND_SOC_DAIFMT_IB_IF:
   363			bclk_pol = MAX98396_PCM_MODE_CFG_PCM_BCLKEDGE;
   364			fsync_pol = MAX98396_PCM_MODE_CFG_PCM_LRCLKEDGE;
   365			break;
   366	
   367		default:
   368			dev_err(component->dev, "DAI invert mode unsupported\n");
   369			return -EINVAL;
   370		}
   371	
   372		regmap_update_bits(max98396->regmap,
   373				   MAX98396_R2041_PCM_MODE_CFG,
   374				   MAX98396_PCM_MODE_CFG_PCM_LRCLKEDGE,
   375				   fsync_pol);
   376	
   377		regmap_update_bits(max98396->regmap,
   378				   MAX98396_R2042_PCM_CLK_SETUP,
   379				   MAX98396_PCM_MODE_CFG_PCM_BCLKEDGE,
   380				   bclk_pol);
   381	
   382		/* interface format */
   383		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   384		case SND_SOC_DAIFMT_I2S:
   385			format = MAX98396_PCM_FORMAT_I2S;
   386			break;
   387		case SND_SOC_DAIFMT_LEFT_J:
   388			format = MAX98396_PCM_FORMAT_LJ;
   389			break;
   390		case SND_SOC_DAIFMT_DSP_A:
   391			format = MAX98396_PCM_FORMAT_TDM_MODE1;
   392			break;
   393		case SND_SOC_DAIFMT_DSP_B:
   394			format = MAX98396_PCM_FORMAT_TDM_MODE0;
   395			break;
   396		default:
   397			return -EINVAL;
   398		}
   399	
   400		ret = regmap_read(max98396->regmap, MAX98396_R210F_GLOBAL_EN, &status);
   401		if (ret < 0)
   402			return -EINVAL;
   403	
   404		if (status) {
   405			ret = regmap_read(max98396->regmap, MAX98396_R2041_PCM_MODE_CFG, &reg);
   406			if (ret < 0)
   407				return -EINVAL;
 > 408			if (format != (reg & MAX98396_PCM_MODE_CFG_FORMAT_MASK))
   409				update = true;
   410			/* GLOBAL_EN OFF prior to pcm mode change */
   411			if (update)
   412				max98396_global_enable_onoff(max98396->regmap, false);
   413		}
   414	
   415		regmap_update_bits(max98396->regmap,
   416				   MAX98396_R2041_PCM_MODE_CFG,
   417				   MAX98396_PCM_MODE_CFG_FORMAT_MASK,
   418				   format);
   419	
   420		if (status && update)
   421			max98396_global_enable_onoff(max98396->regmap, true);
   422	
   423		return 0;
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
