Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE315545E1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 13:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7D91FB4;
	Wed, 22 Jun 2022 13:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7D91FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655898701;
	bh=wmhIPtN8YsMIg7VzjcY/131gPpps1wauOzhRydPNyG4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZSz7YAAS6ns/EnC3vudbP1+/qexcHdlOjTbSO8tKhTYvnYLsSsdBWJq5xmg1Klb9z
	 Rlxy8eZgit77d0fJz49ZXausc1yERh+G3Zb5xA3yS7hGpxqCoLMsT2Bkh1uTPFn3hB
	 KvyrWT8KdRTqrHza3653zvoa+h4rhig+ER23EiJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B123AF8032D;
	Wed, 22 Jun 2022 13:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 797C3F802D2; Wed, 22 Jun 2022 13:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2950EF80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 13:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2950EF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Gv80Btsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655898635; x=1687434635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wmhIPtN8YsMIg7VzjcY/131gPpps1wauOzhRydPNyG4=;
 b=Gv80BtscLAZvS9MPIWM3MiySqVroIsinltKSsaoDjyyTSJJsbE60QP5c
 o8rQ5KjRlPTMLblTKdJTzNEEGDR+m8I+G2U9nQ3QLlXVqbSl6VwWxChtA
 UU599RtS/sG4CM6IEuFM8esN+uDuMjF8jw5fySTZAAtCBQRWfOkpMPHrU
 Kxgo+oj5DSH3haFkxumhibq8t1sNETEsTXWNm9ot9p0YQczKF15nfX62g
 vWvAl8v+QpV6p+gngt9R8z31gb4OgkYudqSySiIn9tHtitemBgcvBBfU8
 lDt08yQRkU4nq7BXhnXqxw0HNokzKIOnVnTSmDg/H19K/37im2UkmUogo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281125933"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281125933"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="620882698"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 22 Jun 2022 04:50:25 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3yrh-0001Dx-1w;
 Wed, 22 Jun 2022 11:49:45 +0000
Date: Wed, 22 Jun 2022 19:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Make snd_soc_unregister_card() return void
Message-ID: <202206221950.PW6xhJO1-lkp@intel.com>
References: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kbuild-all@lists.01.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Miaoqian Lin <linmq006@gmail.com>,
 kernel@pengutronix.de, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
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

Hi "Uwe,

I love your patch! Yet something to improve:

[auto build test ERROR on f2906aa863381afb0015a9eb7fefad885d4e5a56]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/ASoC-core-Make-snd_soc_unregister_card-return-void/20220621-230233
base:   f2906aa863381afb0015a9eb7fefad885d4e5a56
config: xtensa-randconfig-r003-20220620 (https://download.01.org/0day-ci/archive/20220622/202206221950.PW6xhJO1-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5a135ba83d6b991aae0eed01f26464524116abec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/ASoC-core-Make-snd_soc_unregister_card-return-void/20220621-230233
        git checkout 5a135ba83d6b991aae0eed01f26464524116abec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_with_null_ops':
>> sound/soc/soc-topology-test.c:316:13: error: void value not ignored as it ought to be
     316 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_with_null_fw':
   sound/soc/soc-topology-test.c:380:13: error: void value not ignored as it ought to be
     380 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_empty_tplg':
   sound/soc/soc-topology-test.c:429:13: error: void value not ignored as it ought to be
     429 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_empty_tplg_bad_magic':
   sound/soc/soc-topology-test.c:485:13: error: void value not ignored as it ought to be
     485 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_empty_tplg_bad_abi':
   sound/soc/soc-topology-test.c:541:13: error: void value not ignored as it ought to be
     541 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_empty_tplg_bad_size':
   sound/soc/soc-topology-test.c:597:13: error: void value not ignored as it ought to be
     597 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_empty_tplg_bad_payload_size':
   sound/soc/soc-topology-test.c:656:13: error: void value not ignored as it ought to be
     656 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_pcm_tplg':
   sound/soc/soc-topology-test.c:705:13: error: void value not ignored as it ought to be
     705 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_pcm_tplg_reload_comp':
   sound/soc/soc-topology-test.c:758:13: error: void value not ignored as it ought to be
     758 |         ret = snd_soc_unregister_card(&kunit_comp->card);
         |             ^
   sound/soc/soc-topology-test.c: In function 'snd_soc_tplg_test_load_pcm_tplg_reload_card':
   sound/soc/soc-topology-test.c:807:21: error: void value not ignored as it ought to be
     807 |                 ret = snd_soc_unregister_card(&kunit_comp->card);
         |                     ^


vim +316 sound/soc/soc-topology-test.c

d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  280  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  281  /*
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  282   * NULL ops is default case, we pass empty topology (fw), so we don't have
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  283   * anything to parse and just do nothing, which results in return 0; from
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  284   * calling soc_tplg_dapm_complete in soc_tplg_process_headers
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  285   */
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  286  static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  287  {
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  288  	struct kunit_soc_component *kunit_comp;
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  289  	int ret;
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  290  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  291  	/* prepare */
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  292  	kunit_comp = kunit_kzalloc(test, sizeof(*kunit_comp), GFP_KERNEL);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  293  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, kunit_comp);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  294  	kunit_comp->kunit = test;
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  295  	kunit_comp->expect = 0; /* expect success */
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  296  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  297  	kunit_comp->card.dev = test_dev,
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  298  	kunit_comp->card.name = "kunit-card",
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  299  	kunit_comp->card.owner = THIS_MODULE,
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  300  	kunit_comp->card.dai_link = kunit_dai_links,
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  301  	kunit_comp->card.num_links = ARRAY_SIZE(kunit_dai_links),
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  302  	kunit_comp->card.fully_routed = true,
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  303  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  304  	/* run test */
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  305  	ret = snd_soc_register_card(&kunit_comp->card);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  306  	if (ret != 0 && ret != -EPROBE_DEFER)
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  307  		KUNIT_FAIL(test, "Failed to register card");
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  308  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  309  	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  310  	KUNIT_EXPECT_EQ(test, 0, ret);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  311  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  312  	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  313  	KUNIT_EXPECT_EQ(test, 0, ret);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  314  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  315  	/* cleanup */
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20 @316  	ret = snd_soc_unregister_card(&kunit_comp->card);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  317  	KUNIT_EXPECT_EQ(test, 0, ret);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  318  
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  319  	snd_soc_unregister_component(test_dev);
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  320  }
d52bbf747cfa8a2 Amadeusz Sławiński 2021-01-20  321  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
