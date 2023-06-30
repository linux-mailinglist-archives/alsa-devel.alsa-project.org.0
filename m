Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44083743925
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 12:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A487F8;
	Fri, 30 Jun 2023 12:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A487F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688120079;
	bh=npezH3eWQxtALd3tu93ouauJKwfD2XJCZ+LGhedEPAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sC0yTviOqT4X3h8QSb9r9oXZXRrr/yUtL8VNHk/nAwRP2NxCINWwP0j+uZT483YH2
	 cHYpP6YTqYI3AlsTtlsw/AwWOonLpj/VE6qnddVkiZgXEJeqdGwxHFFuQzZPooKoKh
	 Fc/mUiAYjdpoJglKqvhzKC9p+cYfmrV2tX2quExg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5FEAF80534; Fri, 30 Jun 2023 12:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AA0F80212;
	Fri, 30 Jun 2023 12:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CF29F8027B; Fri, 30 Jun 2023 12:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7A8BF80212
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 12:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7A8BF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LxZmScLH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688120007; x=1719656007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npezH3eWQxtALd3tu93ouauJKwfD2XJCZ+LGhedEPAc=;
  b=LxZmScLHutG/atH3JinrAXg90+24SvWKqbbt280jG02xo+gc4mLHQRn2
   wqSa+6LMSZ/Y+qsgIckK5pDl50Tdz/qAwnqZqDvyWop0iHf0YYjH7ErkF
   UvwqEATpyvo6an136aru7kAP1ZlGMhBiKke60coF7TFYRH4XCC+ISdgNg
   HwPdy3NwHD6AsJkjIKfSPlMr89HJwqfXwQ84cgGk6pxeKscKcB0tA6n2B
   XTUf1KQk5Og7dDT7+BQiix3SNkAt3MzHyp2/ZyXJz9lufmukgOUsFyvJB
   2+6lAPZCP9mkPKX/856OLtW9B+XwPKhy3UgHbusx7j+4H1InW7ZBv5hrc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359841747"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200";
   d="scan'208";a="359841747"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 03:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048174864"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200";
   d="scan'208";a="1048174864"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2023 03:13:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFB7x-000EsG-11;
	Fri, 30 Jun 2023 10:13:21 +0000
Date: Fri, 30 Jun 2023 18:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: es8326: Fix power-up sequence
Message-ID: <202306301757.wbLjgJDY-lkp@intel.com>
References: <20230630072515.49382-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630072515.49382-1-zhuning0077@gmail.com>
Message-ID-Hash: 7VOQXAGYJOYGE57REZ2ACG7BFQ7PAQHS
X-Message-ID-Hash: 7VOQXAGYJOYGE57REZ2ACG7BFQ7PAQHS
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VOQXAGYJOYGE57REZ2ACG7BFQ7PAQHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Zhu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.4 next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-es8326-Fix-power-up-sequence/20230630-152707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230630072515.49382-1-zhuning0077%40gmail.com
patch subject: [PATCH] ASoC: codecs: es8326: Fix power-up sequence
config: powerpc-randconfig-r011-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301757.wbLjgJDY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301757.wbLjgJDY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301757.wbLjgJDY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:713:54: error: use of undeclared identifier 'ES8326_MUTE_MASK'
     713 |         regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE, ES8326_MUTE_MASK,
         |                                                             ^
>> sound/soc/codecs/es8326.c:714:7: error: use of undeclared identifier 'ES8326_MUTE'
     714 |                            ES8326_MUTE);
         |                            ^
>> sound/soc/codecs/es8326.c:719:10: error: no member named 'version' in 'struct es8326_priv'
     719 |         es8326->version = reg;
         |         ~~~~~~  ^
   3 errors generated.


vim +/ES8326_MUTE_MASK +713 sound/soc/codecs/es8326.c

   644	
   645	static int es8326_resume(struct snd_soc_component *component)
   646	{
   647		struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
   648		unsigned int reg;
   649	
   650		regcache_cache_only(es8326->regmap, false);
   651		regcache_sync(es8326->regmap);
   652	
   653		/* reset register value to default */
   654		regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
   655		usleep_range(1000, 3000);
   656		regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
   657		/* reset internal state */
   658		regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
   659		regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
   660		regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0x88);
   661		/* set headphone default type and detect pin */
   662		regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x81 |
   663			     ES8326_HP_DET_SRC_PIN9);
   664		regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
   665	
   666		/* set internal oscillator as clock source of headpone cp */
   667		regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x84);
   668		regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_ON);
   669		/* clock manager reset release */
   670		regmap_write(es8326->regmap, ES8326_RESET, 0x17);
   671		/* set headphone detection as half scan mode */
   672		regmap_write(es8326->regmap, ES8326_HP_MISC, 0x08);
   673		regmap_write(es8326->regmap, ES8326_PULLUP_CTL, 0x02);
   674	
   675		/* enable headphone driver */
   676		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa7);
   677		regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xa3);
   678		regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xb3);
   679		regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
   680	
   681		regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
   682		regmap_write(es8326->regmap, ES8326_CLK_VMIDS1, 0xc4);
   683		regmap_write(es8326->regmap, ES8326_CLK_VMIDS2, 0x81);
   684		regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME, 0x00);
   685	
   686		/* turn off headphone out */
   687		regmap_write(es8326->regmap, ES8326_HP_CAL, 0x00);
   688		/* set ADC and DAC in low power mode */
   689		regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
   690	
   691		/* force micbias on */
   692		regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4f);
   693		regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x08);
   694		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7F);
   695		/* select vdda as micbias source */
   696		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
   697		/* set dac dsmclip = 1 */
   698		regmap_write(es8326->regmap, ES8326_DAC_DSM, 0x08);
   699		regmap_write(es8326->regmap, ES8326_DAC_VPPSCALE, 0x15);
   700	
   701		regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x0c);
   702		regmap_write(es8326->regmap, ES8326_INTOUT_IO,
   703			     es8326->interrupt_clk);
   704		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO,
   705			    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
   706		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
   707	
   708		regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
   709		regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
   710		regmap_update_bits(es8326->regmap, ES8326_PGAGAIN, ES8326_MIC_SEL_MASK,
   711				   ES8326_MIC1_SEL);
   712	
 > 713		regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE, ES8326_MUTE_MASK,
 > 714				   ES8326_MUTE);
   715	
   716		regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x80 |
   717			     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
   718		regmap_read(es8326->regmap, ES8326_CHIP_VERSION, &reg);
 > 719		es8326->version = reg;
   720		es8326_irq(es8326->irq, es8326);
   721		return 0;
   722	}
   723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
