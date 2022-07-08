Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6456B1DD
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 06:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3307D83B;
	Fri,  8 Jul 2022 06:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3307D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657255781;
	bh=EGhN4/wgpGUwd8gfvBwBgb7INh+JPLI5yLBYfzH2X2s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nnte70BakJ8qYGRO0mJ1G68Uf4dQRB52TvAgG+yLGotbcYKScZr2c+fwjgYFHT/eX
	 13NPX8lCoSoCiHfrRhC3+WBkrjSKkiaRX3QjB+3NCDJ+w/Lfa4b6UCbxV+72JsqYcn
	 QC/2eG/iZcd6aBoHepM9NaWhv/Bc7g+wvtLnTdgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9256F800C5;
	Fri,  8 Jul 2022 06:48:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0A12F80167; Fri,  8 Jul 2022 06:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E50DF800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 06:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E50DF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PZHvhAex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657255712; x=1688791712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EGhN4/wgpGUwd8gfvBwBgb7INh+JPLI5yLBYfzH2X2s=;
 b=PZHvhAexOOLh37DhRzWNffGrzccCtTc3snIQ5I19Q3sn+WtK8t50cApB
 Dg5O4mMqQMWHe7p/fVZdz+Qabc4JZ1bmdEdaSv6fD1nAaaW5YpBRrG7B2
 QMLqdi/IxAbtRAnlDgZP5a+tkfAUZgPlH7vQoq3bBTxSaJrDn1yEXol+t
 nXfln44ghwSdzHnKNkJKnlLnuTV3jfUL5/52HOpCEIE31P7cPSUUkAwOU
 2I2Q0ONXrT/eeZHhdEdN+31ijG01BfF+CACw26E2SXaS9Yrep+i6Sgvbk
 fqPrgAs+2oYH6xbs71/fRnRvKEVUx8lufALYmoqKwDKfddR8jpBrq9lEl A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="370502830"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="370502830"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 21:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="736210955"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2022 21:48:25 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9fui-000Mvw-BZ;
 Fri, 08 Jul 2022 04:48:24 +0000
Date: Fri, 8 Jul 2022 12:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, paul@crapouillou.net,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH v2 11/11] ASoC: jz4740-i2s: Refactor DAI probe/remove ops
 as component ops
Message-ID: <202207081227.ibiEiprJ-lkp@intel.com>
References: <20220707194655.312892-12-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707194655.312892-12-aidanmacdonald.0x0@gmail.com>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
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
config: arm64-buildonly-randconfig-r006-20220707 (https://download.01.org/0day-ci/archive/20220708/202207081227.ibiEiprJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d990302616fcc22f1e2a3b963c25fdec9d787251
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aidan-MacDonald/ASoC-cleanups-and-improvements-for-jz4740-i2s/20220708-034953
        git checkout d990302616fcc22f1e2a3b963c25fdec9d787251
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash sound/soc/jz4740/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/jz4740/jz4740-i2s.c:442:2: error: use of undeclared identifier 'ret'
           ret = clk_prepare_enable(i2s->clk_aic);
           ^
   sound/soc/jz4740/jz4740-i2s.c:443:6: error: use of undeclared identifier 'ret'
           if (ret)
               ^
   sound/soc/jz4740/jz4740-i2s.c:444:10: error: use of undeclared identifier 'ret'
                   return ret;
                          ^
   3 errors generated.


vim +/ret +442 sound/soc/jz4740/jz4740-i2s.c

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
