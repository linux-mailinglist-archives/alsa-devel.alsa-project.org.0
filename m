Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF95557860
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235961EF8;
	Thu, 23 Jun 2022 13:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235961EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982358;
	bh=KbeXCVtz+edFvopo5p5QoDn9huAgw0qHkMWWoFBLhXA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEWrrO0i5NcjRx2EoGulopIbHzOEPO6l/l/s5aSpVKTrOBHipgrvegULvW8bw82TZ
	 QRbBs1IYUUWW1hnihCjYl0JRuv1ExxZxtiWuwbAhUV0ANuAnlV+VXvzzLQPSIYMr3n
	 az2pqmg+EpjNdjlG3Bfsik6xtDdakmF4aqJqVDVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50535F80536;
	Thu, 23 Jun 2022 13:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8E3DF804C1; Thu, 23 Jun 2022 04:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03C7FF800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 04:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C7FF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IGxks2xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655949616; x=1687485616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KbeXCVtz+edFvopo5p5QoDn9huAgw0qHkMWWoFBLhXA=;
 b=IGxks2xrfJycy99WSUPhNI1oUfA4afrAg/YQ+/L0aFBcTi8cHyESU9Hn
 xfEZztjnQvl+IBuB8vlHBaZHfVFc/PY2ZnAx4M1SOlTrnOT8bI2yksQvo
 XppE2mZKw9c9HU8eTNhzoMQC7L7TztEm5Z6qcBAocZAqyZTi+lT44WVqT
 NMS/289RNe5uAuqoL86M1TkMcJyHbE623ocjoS3a1FtV0uqV2e4xYIIgd
 /xvqYmL78uTp2tITIXKzQ34OTz+j/iu6ECc7gCN+pt1I01KSgtsU4GZKW
 XjoNGwEalzP5FMRyR3/Md3A3D//y187WjI3/qoquLxeb/oto7wHY8i6Yo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="261030461"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="261030461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 19:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="615398908"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 22 Jun 2022 19:00:02 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o4C8X-0000LT-BJ;
 Thu, 23 Jun 2022 02:00:01 +0000
Date: Thu, 23 Jun 2022 09:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <202206230910.wUXKFP3z-lkp@intel.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:19 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, nicolas.ferre@microchip.com,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 kbuild-all@lists.01.org, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, daniel@ffwll.ch, shawnguo@kernel.org,
 daniel@zonque.org
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

Hi Charles,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tegra/for-next sunxi/sunxi/for-next linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230910.wUXKFP3z-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794205d61285d0921e564e722daf9b20df82ed57
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
        git checkout 794205d61285d0921e564e722daf9b20df82ed57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/au1x/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
     227 |         .legacy_dai_name        = 1,
         |          ^~~~~~~~~~~~~~~
         |          legacy_dai_naming
>> sound/soc/au1x/ac97c.c:227:35: warning: initialization of 'const struct snd_kcontrol_new *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     227 |         .legacy_dai_name        = 1,
         |                                   ^
   sound/soc/au1x/ac97c.c:227:35: note: (near initialization for 'au1xac97c_component.controls')


vim +227 sound/soc/au1x/ac97c.c

   224	
   225	static const struct snd_soc_component_driver au1xac97c_component = {
   226		.name			= "au1xac97c",
 > 227		.legacy_dai_name	= 1,
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
