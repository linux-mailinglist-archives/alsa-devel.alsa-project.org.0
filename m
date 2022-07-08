Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033C56AF77
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 02:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B825FE12;
	Fri,  8 Jul 2022 02:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B825FE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657241135;
	bh=c+P6YDMV9PRWXetSgJx/P+CHVW6L1Bzzbpwgy+7i05E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXhS4ObywrXKJApIftJN94Q/C+S6NlXNyJ0XPd4nh7iJCcTYpXZFxqyLzHFLzKEYb
	 2/QkjkvFHq04pD+2xo99xy11omCZOmIe9g8A/42757aGgudYPUxVsOX39hstzXXmFZ
	 /lR+s9dmwEDDjyyXIzNsbgZPJvBiB6VC1Z+NkUcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCDFF8028D;
	Fri,  8 Jul 2022 02:44:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59826F80104; Fri,  8 Jul 2022 02:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5EC0F80104
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 02:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EC0F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g8QioIBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657241068; x=1688777068;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c+P6YDMV9PRWXetSgJx/P+CHVW6L1Bzzbpwgy+7i05E=;
 b=g8QioIBPwTTdnwv6o7e+K1xcAydo0fwzGPy6hShU3pSFYw/3Wp5ONmEl
 jd+O5Gyjfx+TgjS0tDPG5kAJ1Z5JaBbOPno7UKRf/ncXNcgMca8iw0OsM
 CBWv8wCGvAkKtOJRofodolIKUqN0bwugQ4WCF20tqvOiTycpjSKAvnAB4
 UQJe4/a6kLw20LQy41e2Z5lCeOSFMUEn3sHnAqdkHkWhsq+OtriVOa/2H
 M9NHQVQpSjWApIuHkJSp6KY6rXCJqnsKNy+f/REWAvCX/wg+OZ1lbm4Lv
 vlWQI0NfTK0LaPI06ZGqObrz+HvgeApTQ0JRIXvo5+MNXWU+aJUiZVBbB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="282906350"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="282906350"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 17:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="626521925"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 07 Jul 2022 17:44:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9c6P-000Mfb-PJ;
 Fri, 08 Jul 2022 00:44:13 +0000
Date: Fri, 8 Jul 2022 08:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, paul@crapouillou.net,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH v2 11/11] ASoC: jz4740-i2s: Refactor DAI probe/remove ops
 as component ops
Message-ID: <202207080814.p8h1it9G-lkp@intel.com>
References: <20220707194655.312892-12-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707194655.312892-12-aidanmacdonald.0x0@gmail.com>
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi Aidan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[cannot apply to linus/master v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aidan-MacDonald/ASoC-cleanups-and-improvements-for-jz4740-i2s/20220708-034953
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: s390-randconfig-m031-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080814.p8h1it9G-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d990302616fcc22f1e2a3b963c25fdec9d787251
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aidan-MacDonald/ASoC-cleanups-and-improvements-for-jz4740-i2s/20220708-034953
        git checkout d990302616fcc22f1e2a3b963c25fdec9d787251
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash sound/soc/jz4740/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/jz4740/jz4740-i2s.c: In function 'jz4740_i2s_probe':
>> sound/soc/jz4740/jz4740-i2s.c:442:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     442 |         ret = clk_prepare_enable(i2s->clk_aic);
         |         ^~~
         |         net
   sound/soc/jz4740/jz4740-i2s.c:442:9: note: each undeclared identifier is reported only once for each function it appears in


vim +442 sound/soc/jz4740/jz4740-i2s.c

   437	
   438	static int jz4740_i2s_probe(struct snd_soc_component *component)
   439	{
   440		struct jz4740_i2s *i2s = snd_soc_component_get_drvdata(component);
   441	
 > 442		ret = clk_prepare_enable(i2s->clk_aic);
   443		if (ret)
   444			return ret;
   445	
   446		regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
   447	
   448		regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
   449			     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
   450			     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
   451	
   452		regmap_field_write(i2s->field_rx_fifo_thresh, 7);
   453		regmap_field_write(i2s->field_tx_fifo_thresh, 8);
   454	
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
