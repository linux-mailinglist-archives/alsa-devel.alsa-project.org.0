Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7EA6BDFB2
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 04:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC3EFCA;
	Fri, 17 Mar 2023 04:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC3EFCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679024239;
	bh=IHt4G0WAu2gSTDXf0Ktg9cVBi8lPEQATGOe4AJGToN8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9V25msWlDkE+oEfros5aIfzWam1ilKgrMP7qIwt6s/MhVtp3ypy4DqyoLdlZuZOH
	 4vKO36K8b87GVl5r/1q326WMQ/ZdKe6NxoHdCXXiB1NFM1FvH59y+AqR9SUPhWEL3b
	 yWlxCGwpCzfJq2C2E0V4yCySNyPTMKVXOMUn3pSU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C87D9F8032D;
	Fri, 17 Mar 2023 04:36:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8530F80423; Fri, 17 Mar 2023 04:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E45ECF80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 04:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45ECF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GUhXJVut
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679024171; x=1710560171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IHt4G0WAu2gSTDXf0Ktg9cVBi8lPEQATGOe4AJGToN8=;
  b=GUhXJVut8B0eD22euO+2tKZSfjvAjlvtzvpoJI/WLpS9X5jMLUaPbH89
   RA633n8HCL01jKWShKNY8nJPyzbJp17X87d/dZWp0I8kPqbpapMn9fadz
   wWfKxq16wAea5KWG7/cKZvqAntf6MKBgoXrfx4wL2cmhIiO1jQZCagbp3
   5Nd9Y9MCuplqO2MFEdYcMiltrsxjU/TlmVULoSNd2+cElOaXpuKLiXsCJ
   4/F6qxIhyw71JoYR6Si30gY/uub1xLq2xL/Qsioi7d916KGErn1nvSAjX
   0wwv84fA1gBBQJU06D+HCg+qKamgNVmguDiWHhv6excHhP0bLVZ9hmUg7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318567510"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400";
   d="scan'208";a="318567510"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 20:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="926001442"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400";
   d="scan'208";a="926001442"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 20:35:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd0sj-00092s-2I;
	Fri, 17 Mar 2023 03:35:53 +0000
Date: Fri, 17 Mar 2023 11:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>,
	broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v2 8/8] ASoC: cs35l56: Add driver for Cirrus Logic CS35L56
Message-ID: <202303171105.3mGHjK8s-lkp@intel.com>
References: <167872265923.26.336497278776737619@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <167872265923.26.336497278776737619@mailman-core.alsa-project.org>
Message-ID-Hash: JFAPCQIMBSZQ7LZGGU75H4GA5VPMN4O3
X-Message-ID-Hash: JFAPCQIMBSZQ7LZGGU75H4GA5VPMN4O3
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFAPCQIMBSZQ7LZGGU75H4GA5VPMN4O3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Richard,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.3-rc2 next-20230316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald-via-Alsa-devel/ASoC-wm_adsp-Use-no_core_startstop-to-prevent-creating-preload-control/20230313-235605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/167872265923.26.336497278776737619%40mailman-core.alsa-project.org
patch subject: [PATCH v2 8/8] ASoC: cs35l56: Add driver for Cirrus Logic CS35L56
config: x86_64-buildonly-randconfig-r004-20230313 (https://download.01.org/0day-ci/archive/20230317/202303171105.3mGHjK8s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5856c94d659f9c9963f5c37762cf201e1f1765e9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Richard-Fitzgerald-via-Alsa-devel/ASoC-wm_adsp-Use-no_core_startstop-to-prevent-creating-preload-control/20230313-235605
        git checkout 5856c94d659f9c9963f5c37762cf201e1f1765e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171105.3mGHjK8s-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/x86/serial-multi-instantiate.c: In function 'smi_spi_probe':
>> drivers/platform/x86/serial-multi-instantiate.c:98:15: error: implicit declaration of function 'acpi_spi_count_resources'; did you mean 'acpi_set_current_resources'? [-Werror=implicit-function-declaration]
      98 |         ret = acpi_spi_count_resources(adev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               acpi_set_current_resources
>> drivers/platform/x86/serial-multi-instantiate.c:112:27: error: implicit declaration of function 'acpi_spi_device_alloc' [-Werror=implicit-function-declaration]
     112 |                 spi_dev = acpi_spi_device_alloc(NULL, adev, i);
         |                           ^~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/serial-multi-instantiate.c:112:25: warning: assignment to 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     112 |                 spi_dev = acpi_spi_device_alloc(NULL, adev, i);
         |                         ^
>> drivers/platform/x86/serial-multi-instantiate.c:115:59: error: invalid use of undefined type 'struct acpi_device'
     115 |                                             dev_name(&adev->dev));
         |                                                           ^~
   drivers/platform/x86/serial-multi-instantiate.c:137:53: error: invalid use of undefined type 'struct acpi_device'
     137 |                                       dev_name(&adev->dev));
         |                                                     ^~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_MULTI_INSTANTIATE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && I2C [=y] && SPI [=y] && ACPI [=n]
   Selected by [y]:
   - SND_SOC_CS35L56_I2C [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y]
   - SND_SOC_CS35L56_SPI [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SPI_MASTER [=y]


vim +112 drivers/platform/x86/serial-multi-instantiate.c

68f201f9061c000 Stefan Binding  2022-01-21   79  
68f201f9061c000 Stefan Binding  2022-01-21   80  /**
68f201f9061c000 Stefan Binding  2022-01-21   81   * smi_spi_probe - Instantiate multiple SPI devices from inst array
68f201f9061c000 Stefan Binding  2022-01-21   82   * @pdev:	Platform device
68f201f9061c000 Stefan Binding  2022-01-21   83   * @smi:	Internal struct for Serial multi instantiate driver
68f201f9061c000 Stefan Binding  2022-01-21   84   * @inst_array:	Array of instances to probe
68f201f9061c000 Stefan Binding  2022-01-21   85   *
68f201f9061c000 Stefan Binding  2022-01-21   86   * Returns the number of SPI devices instantiate, Zero if none is found or a negative error code.
68f201f9061c000 Stefan Binding  2022-01-21   87   */
8b50c48d59a9cd0 Andy Shevchenko 2022-07-10   88  static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
68f201f9061c000 Stefan Binding  2022-01-21   89  			 const struct smi_instance *inst_array)
68f201f9061c000 Stefan Binding  2022-01-21   90  {
68f201f9061c000 Stefan Binding  2022-01-21   91  	struct device *dev = &pdev->dev;
8b50c48d59a9cd0 Andy Shevchenko 2022-07-10   92  	struct acpi_device *adev = ACPI_COMPANION(dev);
68f201f9061c000 Stefan Binding  2022-01-21   93  	struct spi_controller *ctlr;
68f201f9061c000 Stefan Binding  2022-01-21   94  	struct spi_device *spi_dev;
68f201f9061c000 Stefan Binding  2022-01-21   95  	char name[50];
68f201f9061c000 Stefan Binding  2022-01-21   96  	int i, ret, count;
68f201f9061c000 Stefan Binding  2022-01-21   97  
68f201f9061c000 Stefan Binding  2022-01-21  @98  	ret = acpi_spi_count_resources(adev);
68f201f9061c000 Stefan Binding  2022-01-21   99  	if (ret < 0)
68f201f9061c000 Stefan Binding  2022-01-21  100  		return ret;
f3e13bbc6f5a84f Andy Shevchenko 2022-07-10  101  	if (!ret)
2b5b27826a48eea Andy Shevchenko 2022-07-10  102  		return -ENOENT;
68f201f9061c000 Stefan Binding  2022-01-21  103  
68f201f9061c000 Stefan Binding  2022-01-21  104  	count = ret;
68f201f9061c000 Stefan Binding  2022-01-21  105  
68f201f9061c000 Stefan Binding  2022-01-21  106  	smi->spi_devs = devm_kcalloc(dev, count, sizeof(*smi->spi_devs), GFP_KERNEL);
68f201f9061c000 Stefan Binding  2022-01-21  107  	if (!smi->spi_devs)
68f201f9061c000 Stefan Binding  2022-01-21  108  		return -ENOMEM;
68f201f9061c000 Stefan Binding  2022-01-21  109  
68f201f9061c000 Stefan Binding  2022-01-21  110  	for (i = 0; i < count && inst_array[i].type; i++) {
68f201f9061c000 Stefan Binding  2022-01-21  111  
68f201f9061c000 Stefan Binding  2022-01-21 @112  		spi_dev = acpi_spi_device_alloc(NULL, adev, i);
68f201f9061c000 Stefan Binding  2022-01-21  113  		if (IS_ERR(spi_dev)) {
14a9aa99aca6c28 Andy Shevchenko 2022-07-10  114  			ret = dev_err_probe(dev, PTR_ERR(spi_dev), "failed to allocate SPI device %s from ACPI\n",
14a9aa99aca6c28 Andy Shevchenko 2022-07-10 @115  					    dev_name(&adev->dev));
68f201f9061c000 Stefan Binding  2022-01-21  116  			goto error;
68f201f9061c000 Stefan Binding  2022-01-21  117  		}
68f201f9061c000 Stefan Binding  2022-01-21  118  
68f201f9061c000 Stefan Binding  2022-01-21  119  		ctlr = spi_dev->controller;
68f201f9061c000 Stefan Binding  2022-01-21  120  
68f201f9061c000 Stefan Binding  2022-01-21  121  		strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
68f201f9061c000 Stefan Binding  2022-01-21  122  
68f201f9061c000 Stefan Binding  2022-01-21  123  		ret = smi_get_irq(pdev, adev, &inst_array[i]);
68f201f9061c000 Stefan Binding  2022-01-21  124  		if (ret < 0) {
68f201f9061c000 Stefan Binding  2022-01-21  125  			spi_dev_put(spi_dev);
68f201f9061c000 Stefan Binding  2022-01-21  126  			goto error;
68f201f9061c000 Stefan Binding  2022-01-21  127  		}
68f201f9061c000 Stefan Binding  2022-01-21  128  		spi_dev->irq = ret;
68f201f9061c000 Stefan Binding  2022-01-21  129  
68f201f9061c000 Stefan Binding  2022-01-21  130  		snprintf(name, sizeof(name), "%s-%s-%s.%d", dev_name(&ctlr->dev), dev_name(dev),
68f201f9061c000 Stefan Binding  2022-01-21  131  			 inst_array[i].type, i);
68f201f9061c000 Stefan Binding  2022-01-21  132  		spi_dev->dev.init_name = name;
68f201f9061c000 Stefan Binding  2022-01-21  133  
68f201f9061c000 Stefan Binding  2022-01-21  134  		ret = spi_add_device(spi_dev);
68f201f9061c000 Stefan Binding  2022-01-21  135  		if (ret) {
14a9aa99aca6c28 Andy Shevchenko 2022-07-10  136  			dev_err_probe(&ctlr->dev, ret, "failed to add SPI device %s from ACPI\n",
14a9aa99aca6c28 Andy Shevchenko 2022-07-10  137  				      dev_name(&adev->dev));
68f201f9061c000 Stefan Binding  2022-01-21  138  			spi_dev_put(spi_dev);
68f201f9061c000 Stefan Binding  2022-01-21  139  			goto error;
68f201f9061c000 Stefan Binding  2022-01-21  140  		}
68f201f9061c000 Stefan Binding  2022-01-21  141  
68f201f9061c000 Stefan Binding  2022-01-21  142  		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
68f201f9061c000 Stefan Binding  2022-01-21  143  
68f201f9061c000 Stefan Binding  2022-01-21  144  		smi->spi_devs[i] = spi_dev;
68f201f9061c000 Stefan Binding  2022-01-21  145  		smi->spi_num++;
68f201f9061c000 Stefan Binding  2022-01-21  146  	}
68f201f9061c000 Stefan Binding  2022-01-21  147  
68f201f9061c000 Stefan Binding  2022-01-21  148  	if (smi->spi_num < count) {
68f201f9061c000 Stefan Binding  2022-01-21  149  		dev_dbg(dev, "Error finding driver, idx %d\n", i);
68f201f9061c000 Stefan Binding  2022-01-21  150  		ret = -ENODEV;
68f201f9061c000 Stefan Binding  2022-01-21  151  		goto error;
68f201f9061c000 Stefan Binding  2022-01-21  152  	}
68f201f9061c000 Stefan Binding  2022-01-21  153  
68f201f9061c000 Stefan Binding  2022-01-21  154  	dev_info(dev, "Instantiated %d SPI devices.\n", smi->spi_num);
68f201f9061c000 Stefan Binding  2022-01-21  155  
68f201f9061c000 Stefan Binding  2022-01-21  156  	return 0;
68f201f9061c000 Stefan Binding  2022-01-21  157  error:
68f201f9061c000 Stefan Binding  2022-01-21  158  	smi_devs_unregister(smi);
68f201f9061c000 Stefan Binding  2022-01-21  159  
68f201f9061c000 Stefan Binding  2022-01-21  160  	return ret;
35a36cbb7b1ce75 Lucas Tanure    2022-01-21  161  }
35a36cbb7b1ce75 Lucas Tanure    2022-01-21  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
