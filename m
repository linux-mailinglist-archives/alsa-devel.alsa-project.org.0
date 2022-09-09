Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E295B42FA
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 01:17:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271B41652;
	Sat, 10 Sep 2022 01:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271B41652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662765452;
	bh=0uN71c00HFkAIz5Dwqa2+eWE5a4KA5z0eUIK9Imqs3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q71jqsUdTfFzXseKUJQMi/j7zIiEsUMXRvmfoPx+pfUhRoMVAPmgS0X5DMtc57cOh
	 qgzysPnglIJsM8Dj+ZquUYh+ehWxvM8LEOtPHhl+JOq00wgj1j65HEJEQpww36hSS8
	 UEGU5zqy2f1WUKfvAWM3HRkTSJuZbstvYjDONJZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 719DAF8011C;
	Sat, 10 Sep 2022 01:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAB58F8023A; Sat, 10 Sep 2022 01:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0463F8011C
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 01:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0463F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f5xCI8oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662765385; x=1694301385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0uN71c00HFkAIz5Dwqa2+eWE5a4KA5z0eUIK9Imqs3Q=;
 b=f5xCI8oL2macOsFk3JdUNJYMxmgzCG+gK923HFVQjW5Ag+Z+t7CoBFzi
 rVA7RCABaSmyxW2io0RW8UH+gC1skuedMjjJnDGfWcmU41LXU+vWJm2pz
 DySIZYOWsyVRP5IJz6Lon5fM4OtzSWLfjU5HsEIeN7Isg5iY33pAwEgFC
 qZxgDrdx4te4crpMwoA0VI5MsRp3gQ5ln22LUVmvFkrUY3hqDqECanS8p
 ocGXnRISCJM+6nlnQ2qt4N+v1xhFnQmheaTcszB69iYK8dADnWC0ydF6L
 M3EWG2HJcAUq8Xu0nt0+u7uvxKXgZVTQczcqJOmVqXVE4uGQv03rW7FEp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="280608873"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="280608873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 16:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="648613954"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 09 Sep 2022 16:16:13 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oWnEL-0001qf-0Y;
 Fri, 09 Sep 2022 23:16:13 +0000
Date: Sat, 10 Sep 2022 07:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: luca.ceresoli@bootlin.com, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 7/8] ASoC: codecs: Add RK3308 internal audio codec driver
Message-ID: <202209100733.bM1xaUdC-lkp@intel.com>
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
[also build test WARNING on rockchip/for-next tiwai-sound/for-next linus/master v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/luca-ceresoli-bootlin-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: hexagon-randconfig-r033-20220907 (https://download.01.org/0day-ci/archive/20220910/202209100733.bM1xaUdC-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/786c160ad64ae5a6c5266184b12ecf2674db2fbe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review luca-ceresoli-bootlin-com/Add-support-for-the-internal-RK3308-audio-codec/20220907-222555
        git checkout 786c160ad64ae5a6c5266184b12ecf2674db2fbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rk3308_codec.c:2007:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err;
               ^
>> sound/soc/codecs/rk3308_codec.c:2104:34: warning: unused variable 'rk3308codec_of_match' [-Wunused-const-variable]
   static const struct of_device_id rk3308codec_of_match[] = {
                                    ^
   2 warnings generated.


vim +/rk3308codec_of_match +2104 sound/soc/codecs/rk3308_codec.c

  2103	
> 2104	static const struct of_device_id rk3308codec_of_match[] = {
  2105		{ .compatible = "rockchip,rk3308-codec", },
  2106		{},
  2107	};
  2108	MODULE_DEVICE_TABLE(of, rk3308codec_of_match);
  2109	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
