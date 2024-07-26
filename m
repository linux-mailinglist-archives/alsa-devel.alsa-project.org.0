Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1493D08D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 11:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B05850;
	Fri, 26 Jul 2024 11:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B05850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721986914;
	bh=2dQ8DR3KbSOkGw+geV1ypt1Fj8MaAKSU/FQQ1jq2leE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G7u3v46uTuxNdkmu1YcjmPS2dfxtd75ztVG8K0pnHk1FnJQL0/7Fq7eqOUFYsg9jx
	 Wof/WjpdBvAdBMSTVrF3DWJEKjireAzXNSfBBlYqjZsEXUiPgYcn7hUIGg4B4gip5w
	 T5Q4P2DeiF4QG+A1hFOT7/ZRQyD9i2Pt8Ozoq+AI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAEFEF805B5; Fri, 26 Jul 2024 11:41:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A21F805B2;
	Fri, 26 Jul 2024 11:41:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1423EF8026D; Fri, 26 Jul 2024 11:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A16D6F8007E
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 11:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A16D6F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BpERqc+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721986797; x=1753522797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2dQ8DR3KbSOkGw+geV1ypt1Fj8MaAKSU/FQQ1jq2leE=;
  b=BpERqc+vKI65qUS+wcs1ztyCP8+Ze5UEpVY+CObu6anIcTS+X7ZfPwau
   WucOqG+hR1Ce+0E0R25PtuJe21ba1TpAcYCUgbdoCBaBw7rgHhdW2qeHc
   bMnsOyrQEy1dUC+uto3FQJUZAhhzVaipo73/VTrHVzuUnZKQARXwtU2UE
   a1wGiwQ2tnfiB1Cy7rPBwtD11y9BBluLzjPLCjeDkW6YEfrl92FS1IRi+
   68exqMyW/j1AtGYRJTh+luNLBrE7XKXBGdRgwlBY80se4+HejxD2tiVre
   aPajzWQYkv4U9RE5dc7iqnZP9lIOF/bUvpK6cBFKK/FJu0qZIlykSAyQa
   g==;
X-CSE-ConnectionGUID: /Ko/+TrFQd2udSjKP9aCJQ==
X-CSE-MsgGUID: 3BU/ilxDRBGQgEzGgC7XRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23531128"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800";
   d="scan'208";a="23531128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 02:39:52 -0700
X-CSE-ConnectionGUID: Y3M+epYRQYyXO/bP0le+KA==
X-CSE-MsgGUID: S7a0bWklSHeFWyP/shpKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800";
   d="scan'208";a="53126778"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2024 02:39:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXHQM-000owa-39;
	Fri, 26 Jul 2024 09:39:42 +0000
Date: Fri, 26 Jul 2024 17:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-stm32@st-md-mailman.stormreply.com,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
Message-ID: <202407261707.8O24kg8R-lkp@intel.com>
References: 
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
Message-ID-Hash: 3FP7WY3EPE4RLRDY7FEE5C7XBM6ICUID
X-Message-ID-Hash: 3FP7WY3EPE4RLRDY7FEE5C7XBM6ICUID
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FP7WY3EPE4RLRDY7FEE5C7XBM6ICUID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Javier,

kernel test robot noticed the following build errors:

[auto build test ERROR on 864b1099d16fc7e332c3ad7823058c65f890486c]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/media-i2c-tda1997x-constify-snd_soc_component_driver-struct/20240725-183542
base:   864b1099d16fc7e332c3ad7823058c65f890486c
patch link:    https://lore.kernel.org/r/20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b%40gmail.com
patch subject: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
config: i386-buildonly-randconfig-003-20240726 (https://download.01.org/0day-ci/archive/20240726/202407261707.8O24kg8R-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261707.8O24kg8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261707.8O24kg8R-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sti-sas.c: In function 'sti_sas_driver_probe':
>> sound/soc/codecs/sti-sas.c:450:37: error: assignment of member 'dapm_widgets' in read-only object
     450 |         sti_sas_driver.dapm_widgets = drvdata->dev_data->dapm_widgets;
         |                                     ^
>> sound/soc/codecs/sti-sas.c:451:41: error: assignment of member 'num_dapm_widgets' in read-only object
     451 |         sti_sas_driver.num_dapm_widgets = drvdata->dev_data->num_dapm_widgets;
         |                                         ^
>> sound/soc/codecs/sti-sas.c:453:36: error: assignment of member 'dapm_routes' in read-only object
     453 |         sti_sas_driver.dapm_routes = drvdata->dev_data->dapm_routes;
         |                                    ^
>> sound/soc/codecs/sti-sas.c:454:40: error: assignment of member 'num_dapm_routes' in read-only object
     454 |         sti_sas_driver.num_dapm_routes = drvdata->dev_data->num_dapm_routes;
         |                                        ^


vim +/dapm_widgets +450 sound/soc/codecs/sti-sas.c

32a726b2e089ec Arnaud Pouliquen  2015-06-22  405  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  406  static int sti_sas_driver_probe(struct platform_device *pdev)
32a726b2e089ec Arnaud Pouliquen  2015-06-22  407  {
32a726b2e089ec Arnaud Pouliquen  2015-06-22  408  	struct device_node *pnode = pdev->dev.of_node;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  409  	struct sti_sas_data *drvdata;
601b9d9c7bd04f Arnaud Pouliquen  2015-07-16  410  	const struct of_device_id *of_id;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  411  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  412  	/* Allocate device structure */
32a726b2e089ec Arnaud Pouliquen  2015-06-22  413  	drvdata = devm_kzalloc(&pdev->dev, sizeof(struct sti_sas_data),
32a726b2e089ec Arnaud Pouliquen  2015-06-22  414  			       GFP_KERNEL);
32a726b2e089ec Arnaud Pouliquen  2015-06-22  415  	if (!drvdata)
32a726b2e089ec Arnaud Pouliquen  2015-06-22  416  		return -ENOMEM;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  417  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  418  	/* Populate data structure depending on compatibility */
601b9d9c7bd04f Arnaud Pouliquen  2015-07-16  419  	of_id = of_match_node(sti_sas_dev_match, pnode);
601b9d9c7bd04f Arnaud Pouliquen  2015-07-16  420  	if (!of_id->data) {
92591efabc013f Arnaud Pouliquen  2016-10-24  421  		dev_err(&pdev->dev, "data associated to device is missing\n");
32a726b2e089ec Arnaud Pouliquen  2015-06-22  422  		return -EINVAL;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  423  	}
32a726b2e089ec Arnaud Pouliquen  2015-06-22  424  
601b9d9c7bd04f Arnaud Pouliquen  2015-07-16  425  	drvdata->dev_data = (struct sti_sas_dev_data *)of_id->data;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  426  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  427  	/* Initialise device structure */
32a726b2e089ec Arnaud Pouliquen  2015-06-22  428  	drvdata->dev = &pdev->dev;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  429  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  430  	/* Request the DAC & SPDIF registers memory region */
32a726b2e089ec Arnaud Pouliquen  2015-06-22  431  	drvdata->dac.virt_regmap = devm_regmap_init(&pdev->dev, NULL, drvdata,
32a726b2e089ec Arnaud Pouliquen  2015-06-22  432  						    drvdata->dev_data->regmap);
e27d9ee6e709db Axel Lin          2015-07-13  433  	if (IS_ERR(drvdata->dac.virt_regmap)) {
32a726b2e089ec Arnaud Pouliquen  2015-06-22  434  		dev_err(&pdev->dev, "audio registers not enabled\n");
e27d9ee6e709db Axel Lin          2015-07-13  435  		return PTR_ERR(drvdata->dac.virt_regmap);
32a726b2e089ec Arnaud Pouliquen  2015-06-22  436  	}
32a726b2e089ec Arnaud Pouliquen  2015-06-22  437  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  438  	/* Request the syscon region */
32a726b2e089ec Arnaud Pouliquen  2015-06-22  439  	drvdata->dac.regmap =
32a726b2e089ec Arnaud Pouliquen  2015-06-22  440  		syscon_regmap_lookup_by_phandle(pnode, "st,syscfg");
e27d9ee6e709db Axel Lin          2015-07-13  441  	if (IS_ERR(drvdata->dac.regmap)) {
32a726b2e089ec Arnaud Pouliquen  2015-06-22  442  		dev_err(&pdev->dev, "syscon registers not available\n");
e27d9ee6e709db Axel Lin          2015-07-13  443  		return PTR_ERR(drvdata->dac.regmap);
32a726b2e089ec Arnaud Pouliquen  2015-06-22  444  	}
32a726b2e089ec Arnaud Pouliquen  2015-06-22  445  	drvdata->spdif.regmap = drvdata->dac.regmap;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  446  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  447  	sti_sas_dai[STI_SAS_DAI_ANALOG_OUT].ops = drvdata->dev_data->dac_ops;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  448  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  449  	/* Set dapms*/
049c1bfc30f3a5 Kuninori Morimoto 2018-01-29 @450  	sti_sas_driver.dapm_widgets = drvdata->dev_data->dapm_widgets;
049c1bfc30f3a5 Kuninori Morimoto 2018-01-29 @451  	sti_sas_driver.num_dapm_widgets = drvdata->dev_data->num_dapm_widgets;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  452  
049c1bfc30f3a5 Kuninori Morimoto 2018-01-29 @453  	sti_sas_driver.dapm_routes = drvdata->dev_data->dapm_routes;
049c1bfc30f3a5 Kuninori Morimoto 2018-01-29 @454  	sti_sas_driver.num_dapm_routes = drvdata->dev_data->num_dapm_routes;
32a726b2e089ec Arnaud Pouliquen  2015-06-22  455  
32a726b2e089ec Arnaud Pouliquen  2015-06-22  456  	/* Store context */
32a726b2e089ec Arnaud Pouliquen  2015-06-22  457  	dev_set_drvdata(&pdev->dev, drvdata);
32a726b2e089ec Arnaud Pouliquen  2015-06-22  458  
049c1bfc30f3a5 Kuninori Morimoto 2018-01-29  459  	return devm_snd_soc_register_component(&pdev->dev, &sti_sas_driver,
32a726b2e089ec Arnaud Pouliquen  2015-06-22  460  					sti_sas_dai,
32a726b2e089ec Arnaud Pouliquen  2015-06-22  461  					ARRAY_SIZE(sti_sas_dai));
32a726b2e089ec Arnaud Pouliquen  2015-06-22  462  }
32a726b2e089ec Arnaud Pouliquen  2015-06-22  463  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
