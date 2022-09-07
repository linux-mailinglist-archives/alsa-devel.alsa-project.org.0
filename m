Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C65B0D88
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 21:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43801169A;
	Wed,  7 Sep 2022 21:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43801169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662580501;
	bh=/MI/RJuZ0sD3riUI6YGQ3T4oFUBUNCRNrhNMnbIuoG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ID3qioadLJOLdWGfvYABFrCpQXX8k24U9JFKGSewozFqgJTp97x3TO0L/FMwuB76j
	 Z55fH8EO9aBKvdaeE7rO240oRSG+EdJXPELxw/dpi9QnqughGxb6wSf3RTfK37j8en
	 EHsnkbszBy1NXBOrSr41gT1QXTeZPNtd6urhI5Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E85F80118;
	Wed,  7 Sep 2022 21:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 653BCF8028D; Wed,  7 Sep 2022 21:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476B1F8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 21:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476B1F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eBcd/2Pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662580434; x=1694116434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/MI/RJuZ0sD3riUI6YGQ3T4oFUBUNCRNrhNMnbIuoG0=;
 b=eBcd/2Pziz+BIvuORmjYYVtTRcm272ezEmSSS+oEZafI2cM8EMje/zl7
 OUU7RjZqi9gepgvAdTdIeFQF4BsQaM6olEgGy1w+jkxlLY4dg0uGQrDGS
 kUAX1DS8RxS6gReBe47hcMJWkzLe99UAq0cfy2IFiaTR9LM8Szy3JsXOQ
 8wWrAiQQ0/7txZ+xP1ZEjRoNU1jKTrrzYUvXzrYIFFFggMFyxlk/0pDPR
 5jtMxu0iYln8O6UieRsamg6raoMnkU24xYub4IlpOnqhpTd8mTDMasAbF
 i+cXEVTlzPgmVYa+1L4992GoS6+wtapH7XifoSx7Pu85QTC/+bu9uMkJt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276718076"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="276718076"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 12:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="614618487"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 07 Sep 2022 12:53:27 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oW171-0006uL-06;
 Wed, 07 Sep 2022 19:53:27 +0000
Date: Thu, 8 Sep 2022 03:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: luca.ceresoli@bootlin.com, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 7/8] ASoC: codecs: Add RK3308 internal audio codec driver
Message-ID: <202209080340.RFBeIVm2-lkp@intel.com>
References: <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907142124.2532620-8-luca.ceresoli@bootlin.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Heiko Stuebner <heiko@sntech.de>, llvm@lists.linux.dev,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on rockchip/for-next tiwai-sound/for-next linus/master v6.0-rc4 next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/luca-ceresoli-bootlin-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: riscv-randconfig-r042-20220907 (https://download.01.org/0day-ci/archive/20220908/202209080340.RFBeIVm2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/786c160ad64ae5a6c5266184b12ecf2674db2fbe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review luca-ceresoli-bootlin-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
        git checkout 786c160ad64ae5a6c5266184b12ecf2674db2fbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rk3308_codec.c:2007:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err;
               ^
   1 warning generated.


vim +/err +2007 sound/soc/codecs/rk3308_codec.c

  2003	
  2004	static int rk3308_codec_parse_dt(struct rk3308_codec_priv *rk3308)
  2005	{
  2006		struct device_node *np = rk3308->dev->of_node;
> 2007		int err;
  2008	
  2009		/* Default value is 0 */
  2010		err = of_property_read_u32(np, "rockchip,micbias-avdd-multiplier",
  2011					   &rk3308->micbias_avdd_mult);
  2012		if (rk3308->micbias_avdd_mult >= RK3308_CODEC_MICBIAS_NUM)
  2013			return dev_err_probe(rk3308->dev, -EINVAL,
  2014					     "Invalid value for 'rockchip,micbias-avdd-multiplier'\n");
  2015	
  2016		return 0;
  2017	}
  2018	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
