Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992F37477BF
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 19:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C3920C;
	Tue,  4 Jul 2023 19:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C3920C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688491696;
	bh=2QGBOJZ19LcMZYyhoCW8k1flmQrDjPi3FZ7EiP3iiII=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WyUih/ggKYqcVAuJ+b71h7z0UqPH/cUdyU63TsM2cAhWQO3aB74nPxrxvKfqA9+ll
	 S5NT35RZ+xyt76eK675XoMdaUOZ4AWGoj77zLda3SXsyBn5pb8rzAKUpGFg2bO48xj
	 qf090f1nUemlpY/1LGPk1UbylqgYsCSqR7In7VEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19E2F80104; Tue,  4 Jul 2023 19:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BBC7F80124;
	Tue,  4 Jul 2023 19:27:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80CCFF80125; Tue,  4 Jul 2023 19:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71090F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 19:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71090F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hi5HYUj3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688491628; x=1720027628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2QGBOJZ19LcMZYyhoCW8k1flmQrDjPi3FZ7EiP3iiII=;
  b=Hi5HYUj3tI+XSQBgl7D0O6r2M7GgdO6MzKUjc8Jw7m6OZ8S1jTVAzA/w
   8IvHSabsb+sUqJtGCDizVDnd54AAbMRObewJYWn/C+TA48lmSq4hcK1rl
   g2e41d3/kUNYDvS1oCn6c/lVDMJFHJ9wAQIlrom1ET/CG/XbbBw3/9dr7
   rb3zKuKPFK0Gvyhdgo4Ldg4Y3wXNbuss2S0WRzOcassNjyFkRitFj+Fit
   uhurzD89b9/yuDHfLL7wpxf/koIWIwrgUzj8lnyDNXuffEvQopDX0DkmP
   1jHC3GckyKSajqmadvw/n+TWbNQAL1T1/wQDg7vbNQ88u9Fq7+ti1NKLF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366648653"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200";
   d="scan'208";a="366648653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 10:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="808993742"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200";
   d="scan'208";a="808993742"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2023 10:27:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGjnp-000IPT-0P;
	Tue, 04 Jul 2023 17:27:01 +0000
Date: Wed, 5 Jul 2023 01:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 34/38]
 drivers/staging/greybus/audio_codec.c:810:26: warning: variable 'card' set
 but not used
Message-ID: <202307050117.pUc9sZub-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: BQJBSBVQ23HSPALWOBLO26L35BSP2D5S
X-Message-ID-Hash: BQJBSBVQ23HSPALWOBLO26L35BSP2D5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQJBSBVQ23HSPALWOBLO26L35BSP2D5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   6dd4ae925ae5b90ccfbcb11dce06fd505cc18bc8
commit: 812cf704dac9f2f275d7bc53818fcccde62dcef8 [34/38] staging: greybus: Avoid abusing controls_rwsem
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230705/202307050117.pUc9sZub-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050117.pUc9sZub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050117.pUc9sZub-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_codec.c: In function 'gbaudio_register_module':
>> drivers/staging/greybus/audio_codec.c:810:26: warning: variable 'card' set but not used [-Wunused-but-set-variable]
     810 |         struct snd_card *card;
         |                          ^~~~
   drivers/staging/greybus/audio_codec.c: In function 'gbaudio_unregister_module':
   drivers/staging/greybus/audio_codec.c:938:26: warning: unused variable 'card' [-Wunused-variable]
     938 |         struct snd_card *card = comp->card->snd_card;
         |                          ^~~~


vim +/card +810 drivers/staging/greybus/audio_codec.c

64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  805  
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  806  int gbaudio_register_module(struct gbaudio_module_info *module)
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  807  {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  808  	int ret;
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  809  	struct snd_soc_component *comp;
2b8c2b51000e3d drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-04-21 @810  	struct snd_card *card;
ac40b4d1e40997 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  811  	struct gbaudio_jack *jack = NULL;
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  812  
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  813  	if (!gbcodec) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  814  		dev_err(module->dev, "GB Codec not yet probed\n");
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  815  		return -EAGAIN;
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  816  	}
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  817  
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  818  	comp = gbcodec->component;
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  819  	card = comp->card->snd_card;
2b8c2b51000e3d drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-04-21  820  
812cf704dac9f2 drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  821  	mutex_lock(&gbcodec->register_mutex);
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  822  
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  823  	if (module->num_dais) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  824  		dev_err(gbcodec->dev,
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  825  			"%d:DAIs not supported via gbcodec driver\n",
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  826  			module->num_dais);
812cf704dac9f2 drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  827  		mutex_unlock(&gbcodec->register_mutex);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  828  		return -EINVAL;
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  829  	}
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  830  
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  831  	ret = gbaudio_init_jack(module, comp->card);
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  832  	if (ret) {
812cf704dac9f2 drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  833  		mutex_unlock(&gbcodec->register_mutex);
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  834  		return ret;
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  835  	}
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  836  
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  837  	if (module->dapm_widgets)
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  838  		snd_soc_dapm_new_controls(&comp->dapm, module->dapm_widgets,
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  839  					  module->num_dapm_widgets);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  840  	if (module->controls)
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  841  		snd_soc_add_component_controls(comp, module->controls,
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  842  					       module->num_controls);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  843  	if (module->dapm_routes)
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  844  		snd_soc_dapm_add_routes(&comp->dapm, module->dapm_routes,
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  845  					module->num_dapm_routes);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  846  
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  847  	/* card already instantiated, create widgets here only */
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  848  	if (comp->card->instantiated) {
620d28440c10b8 drivers/staging/greybus/audio_codec.c Deepak R Varma  2020-10-22  849  		gbaudio_dapm_link_component_dai_widgets(comp->card, &comp->dapm);
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  850  #ifdef CONFIG_SND_JACK
461ab8077d573d drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  851  		/*
461ab8077d573d drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  852  		 * register jack devices for this module
461ab8077d573d drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  853  		 * from codec->jack_list
461ab8077d573d drivers/staging/greybus/audio_codec.c Gioh Kim        2017-02-09  854  		 */
ac40b4d1e40997 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  855  		list_for_each_entry(jack, &module->jack_list, list) {
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  856  			snd_device_register(comp->card->snd_card,
ac40b4d1e40997 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  857  					    jack->jack.jack);
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  858  		}
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  859  #endif
bb9986ef6b311f drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  860  	}
64a7e2cceb75cc drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  861  
c188fdc8176a8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  862  	mutex_lock(&gbcodec->lock);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  863  	list_add(&module->list, &gbcodec->module_list);
c188fdc8176a8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  864  	mutex_unlock(&gbcodec->lock);
c188fdc8176a8c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  865  
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  866  	if (comp->card->instantiated)
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  867  		ret = snd_soc_dapm_new_widgets(comp->card);
ce7bd8325dc75c drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2020-07-09  868  	dev_dbg(comp->dev, "Registered %s module\n", module->name);
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  869  
812cf704dac9f2 drivers/staging/greybus/audio_codec.c Takashi Iwai    2023-07-04  870  	mutex_unlock(&gbcodec->register_mutex);
bb9986ef6b311f drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-05-04  871  	return ret;
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  872  }
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-03-29  873  EXPORT_SYMBOL(gbaudio_register_module);
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-11-23  874  

:::::: The code at line 810 was first introduced by commit
:::::: 2b8c2b51000e3d056f9aa27a64b93feabddf77a4 greybus: audio: Changes in response to ASoC cleanup

:::::: TO: Vaibhav Agarwal <vaibhav.agarwal@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
