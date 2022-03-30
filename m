Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581524ECAD0
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 19:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA53A1AA5;
	Wed, 30 Mar 2022 19:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA53A1AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648661868;
	bh=hpe2DD3RPkU2wxxcJVoz0AL/MD2OZpfZmxWrZHJHVGI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHLF0UThQRdXfPVFb4+zB43AAz/6MsT6+D9lOo7d2JzZDKLMAn7rK3Wddvk7Y4I8p
	 9FDR7anJZblmafSq1Saoh8mH/K+jEunKBJpb3FiJ5F4weTfKc3LeaOPB+rgV87KtzF
	 uELT4hkEE69zwtoH+Opos8ZrU47ZRcrcCmNaCAMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4674BF800B8;
	Wed, 30 Mar 2022 19:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD7D6F80254; Wed, 30 Mar 2022 19:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2801FF800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 19:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2801FF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UW7Yi4P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648661793; x=1680197793;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hpe2DD3RPkU2wxxcJVoz0AL/MD2OZpfZmxWrZHJHVGI=;
 b=UW7Yi4P49aUVcwnEhcy8dApmQ71PmNguaH7lhkI9ppbLkY1VYh6q3h5u
 m40kr1NUNrDUj1tStGK2UhMRElS+6fVPP9wu4Mc0DJ2z1YKnOREFvzaMZ
 0QJDLfnCFBJWFqWQPAMficECqDIY5zGej8t12A+HY23Bbz+kxf0FMshzt
 mZoBrj7NkLwpGfIbRrphqTlTRT9r0kH8n9/AhEt69y0HTk3e7pIN868hJ
 ZUtyi/dhe6U3njDCTTMoxytDwwG3AUicabtS/Pdl/Hb0cyS2x0wS82HAt
 2Reme6b6ExQFKAjuYXgEeRcgSmeI1tnSfdOfyTIcyG50RCJs+T4p51Eyi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259787818"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="259787818"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="586083751"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 30 Mar 2022 10:36:24 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZcF5-0000FA-SN;
 Wed, 30 Mar 2022 17:36:23 +0000
Date: Thu, 31 Mar 2022 01:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
Subject: Re: [PATCH v5 4/4] update tas27xx.c to support either TAS2764 or
 TAS2780
Message-ID: <202203310140.Sc6ERGdm-lkp@intel.com>
References: <20220330144526.498-4-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330144526.498-4-13691752556@139.com>
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
[also build test WARNING on v5.17 next-20220330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Xu/rename-tas2764-to-tas27xx/20220330-224947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220331/202203310140.Sc6ERGdm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5e87128eec39d187eaf11069178b39d935600c2e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Raphael-Xu/rename-tas2764-to-tas27xx/20220330-224947
        git checkout 5e87128eec39d187eaf11069178b39d935600c2e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas27xx.c:624:18: error: 'struct snd_soc_dai_driver' has no member named 'symmetric_rates'; did you mean 'symmetric_rate'?
     624 |                 .symmetric_rates = 1,
         |                  ^~~~~~~~~~~~~~~
         |                  symmetric_rate
>> sound/soc/codecs/tas27xx.c:624:36: warning: initialization of 'const struct snd_soc_cdai_ops *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     624 |                 .symmetric_rates = 1,
         |                                    ^
   sound/soc/codecs/tas27xx.c:624:36: note: (near initialization for 'tas27xx_dai_driver[0].cops')


vim +624 sound/soc/codecs/tas27xx.c

   598	
   599	#define TAS27XX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
   600				 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
   601	
   602	#define TAS27XX_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
   603			       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
   604	
   605	static struct snd_soc_dai_driver tas27xx_dai_driver[] = {
   606		{
   607			.name = "tas27xx ASI1",
   608			.id = 0,
   609			.playback = {
   610				.stream_name    = "ASI1 Playback",
   611				.channels_min   = 2,
   612				.channels_max   = 2,
   613				.rates      = TAS27XX_RATES,
   614				.formats    = TAS27XX_FORMATS,
   615			},
   616			.capture = {
   617				.stream_name    = "ASI1 Capture",
   618				.channels_min   = 1,
   619				.channels_max   = 2,
   620				.rates = TAS27XX_RATES,
   621				.formats = TAS27XX_FORMATS,
   622			},
   623			.ops = &tas27xx_dai_ops,
 > 624			.symmetric_rates = 1,
   625		},
   626	};
   627	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
