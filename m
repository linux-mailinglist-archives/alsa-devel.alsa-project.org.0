Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC9723068
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 21:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7576674C;
	Mon,  5 Jun 2023 21:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7576674C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685994700;
	bh=q94VM5L4sKKZjMgSvGwItqptIOrEoLGcNgaTpRVjwN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iwivsekmejd/ZEYPn7RgrVEecVMVYk+q1KyEKtF9JuZsJcRqsU9TUcKVsSnDN8IyP
	 N1ptL8tEMhSvhYCEtS3z4sBfXG0qZvlm1fQ2JfAUXssmUD4mMI4ipAn28mH5re6uk+
	 7Zc01DDh7YCdcX9zWGbpC8za04ln/4Jk0GetJbC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2F6DF80527; Mon,  5 Jun 2023 21:50:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63505F8016C;
	Mon,  5 Jun 2023 21:50:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B077F80199; Mon,  5 Jun 2023 21:50:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97254F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 21:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97254F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z+bcuia2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685994630; x=1717530630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q94VM5L4sKKZjMgSvGwItqptIOrEoLGcNgaTpRVjwN4=;
  b=Z+bcuia2n1u//slGQD68dqhrE98bOrMoR4O2kCgMI27o0v8XfXPnpq0e
   3S6F2BbOTi8yrJQIV8AzI4lRwU/3MFcmtHvbbW6Vk5IO0mmjtepmAhJEM
   SLtVAD7orp1h/eq7jullpM4V5o5UQNxo7SWebdeABpGaG/XI/G06d45Sl
   hHVNxB5M1FgYUblfPFpj3ciXK/XQhfXBY23KyROQHwypQkGFkqWENGtsm
   wWWxQ3RdFKv6lZDH5NFMA86Z8K4IXSZnHXNd7Pbd2XMJEj1XSn7S5glJe
   eEFFLIsI4PnCUqmdkj6stisjr/2c6mYr8iV21s53iyjEwr0eweAS+a5LN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336087873"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400";
   d="scan'208";a="336087873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 12:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741848462"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400";
   d="scan'208";a="741848462"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 12:50:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6GDd-0004Ox-1S;
	Mon, 05 Jun 2023 19:50:21 +0000
Date: Tue, 6 Jun 2023 03:50:15 +0800
From: kernel test robot <lkp@intel.com>
To: YingKun Meng <mengyingkun@loongson.cn>, lgirdwood@gmail.com,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: Re: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
Message-ID: <202306060320.Sphw0ihy-lkp@intel.com>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605120934.2306548-1-mengyingkun@loongson.cn>
Message-ID-Hash: XBLNU7EKNMYHD42WMLPR64T466AZFXSV
X-Message-ID-Hash: XBLNU7EKNMYHD42WMLPR64T466AZFXSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBLNU7EKNMYHD42WMLPR64T466AZFXSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi YingKun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1fbcc5ab1c7a172ef1159b154c296fe1e9ce209b]

url:    https://github.com/intel-lab-lkp/linux/commits/YingKun-Meng/ASoC-loongson-Add-Loongson-Generic-ASoC-Sound-Card-Support/20230605-215940
base:   1fbcc5ab1c7a172ef1159b154c296fe1e9ce209b
patch link:    https://lore.kernel.org/r/20230605120934.2306548-1-mengyingkun%40loongson.cn
patch subject: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230606/202306060320.Sphw0ihy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cb79a1df70a849f772428740eb3c155da83de25b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review YingKun-Meng/ASoC-loongson-Add-Loongson-Generic-ASoC-Sound-Card-Support/20230605-215940
        git checkout cb79a1df70a849f772428740eb3c155da83de25b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash sound/soc/loongson/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060320.Sphw0ihy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/loongson/loongson_i2s_pci.c: In function 'loongson_pcm_hw_params':
   sound/soc/loongson/loongson_i2s_pci.c:171:45: warning: right shift count >= width of type [-Wshift-count-overflow]
     171 |                 desc->order_hi = order_addr >> 32;
         |                                             ^~
   sound/soc/loongson/loongson_i2s_pci.c:174:43: warning: right shift count >= width of type [-Wshift-count-overflow]
     174 |                 desc->saddr_hi = mem_addr >> 32;
         |                                           ^~
   sound/soc/loongson/loongson_i2s_pci.c:190:57: warning: right shift count >= width of type [-Wshift-count-overflow]
     190 |                 desc->order_hi = prtd->dma_desc_arr_phy >> 32;
         |                                                         ^~
   sound/soc/loongson/loongson_i2s_pci.c: In function 'loongson_i2s_pci_probe':
>> sound/soc/loongson/loongson_i2s_pci.c:364:15: error: implicit declaration of function 'pci_request_region'; did you mean 'pci_request_regions'? [-Werror=implicit-function-declaration]
     364 |         ret = pci_request_region(pdev, BAR_NUM, LS_I2S_DRVNAME);
         |               ^~~~~~~~~~~~~~~~~~
         |               pci_request_regions
>> sound/soc/loongson/loongson_i2s_pci.c:379:25: error: implicit declaration of function 'pci_iomap'; did you mean 'pcim_iomap'? [-Werror=implicit-function-declaration]
     379 |         i2s->reg_base = pci_iomap(pdev, BAR_NUM, 0);
         |                         ^~~~~~~~~
         |                         pcim_iomap
>> sound/soc/loongson/loongson_i2s_pci.c:379:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |         i2s->reg_base = pci_iomap(pdev, BAR_NUM, 0);
         |                       ^
   sound/soc/loongson/loongson_i2s_pci.c:397:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     397 |         tx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_TX_DATA;
         |                             ^
   sound/soc/loongson/loongson_i2s_pci.c:400:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     400 |         rx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_RX_DATA;
         |                             ^
>> sound/soc/loongson/loongson_i2s_pci.c:441:9: error: implicit declaration of function 'pci_iounmap'; did you mean 'pcim_iounmap'? [-Werror=implicit-function-declaration]
     441 |         pci_iounmap(pdev, i2s->reg_base);
         |         ^~~~~~~~~~~
         |         pcim_iounmap
>> sound/soc/loongson/loongson_i2s_pci.c:443:9: error: implicit declaration of function 'pci_release_region'; did you mean 'pci_release_regions'? [-Werror=implicit-function-declaration]
     443 |         pci_release_region(pdev, BAR_NUM);
         |         ^~~~~~~~~~~~~~~~~~
         |         pci_release_regions
   sound/soc/loongson/loongson_i2s_pci.c: At top level:
>> sound/soc/loongson/loongson_i2s_pci.c:474:1: warning: data definition has no type or storage class
     474 | module_pci_driver(loongson_i2s_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/loongson/loongson_i2s_pci.c:474:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
>> sound/soc/loongson/loongson_i2s_pci.c:474:1: warning: parameter names (without types) in function declaration
   sound/soc/loongson/loongson_i2s_pci.c:464:26: warning: 'loongson_i2s_driver' defined but not used [-Wunused-variable]
     464 | static struct pci_driver loongson_i2s_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +364 sound/soc/loongson/loongson_i2s_pci.c

   350	
   351	static int loongson_i2s_pci_probe(struct pci_dev *pdev,
   352					  const struct pci_device_id *pid)
   353	{
   354		const struct fwnode_handle *fwnode = pdev->dev.fwnode;
   355		struct loongson_dma_data *tx_data, *rx_data;
   356		struct loongson_i2s *i2s;
   357		int ret;
   358	
   359		if (pci_enable_device(pdev)) {
   360			dev_err(&pdev->dev, "pci_enable_device failed\n");
   361			return -ENODEV;
   362		}
   363	
 > 364		ret = pci_request_region(pdev, BAR_NUM, LS_I2S_DRVNAME);
   365		if (ret) {
   366			dev_err(&pdev->dev, "request regions failed %d\n", ret);
   367			goto err_disable;
   368		}
   369	
   370		i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
   371		if (!i2s) {
   372			ret = -ENOMEM;
   373			goto err_release;
   374		}
   375		i2s->rev_id = pdev->revision;
   376		i2s->dev = &pdev->dev;
   377		pci_set_drvdata(pdev, i2s);
   378	
 > 379		i2s->reg_base = pci_iomap(pdev, BAR_NUM, 0);
   380		if (!i2s->reg_base) {
   381			dev_err(&pdev->dev, "pci_iomap_error\n");
   382			ret = -EIO;
   383			goto err_release;
   384		}
   385	
   386		i2s->regmap = devm_regmap_init_mmio(&pdev->dev, i2s->reg_base,
   387						    &loongson_i2s_regmap_config);
   388		if (IS_ERR(i2s->regmap)) {
   389			dev_err(&pdev->dev, "Failed to initialize register map");
   390			ret = PTR_ERR(i2s->regmap);
   391			goto err_unmap;
   392		}
   393	
   394		tx_data = &i2s->tx_dma_data;
   395		rx_data = &i2s->rx_dma_data;
   396	
   397		tx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_TX_DATA;
   398		tx_data->order_addr = i2s->reg_base + LS_I2S_TX_ORDER;
   399	
   400		rx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_RX_DATA;
   401		rx_data->order_addr = i2s->reg_base + LS_I2S_RX_ORDER;
   402	
   403		tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
   404		if (tx_data->irq < 0) {
   405			dev_err(&pdev->dev, "dma tx irq invalid\n");
   406			ret = tx_data->irq;
   407			goto err_unmap;
   408		}
   409	
   410		rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
   411		if (rx_data->irq < 0) {
   412			dev_err(&pdev->dev, "dma rx irq invalid\n");
   413			ret = rx_data->irq;
   414			goto err_unmap;
   415		}
   416	
   417		device_property_read_u32(&pdev->dev, "clock-frequency", &i2s->clk_rate);
   418		if (!i2s->clk_rate) {
   419			dev_err(&pdev->dev, "clock-frequency property invalid\n");
   420			ret = -EINVAL;
   421			goto err_unmap;
   422		}
   423	
   424		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
   425	
   426		dev_set_name(&pdev->dev, "%s", loongson_i2s_dai.name);
   427	
   428		loongson_i2s_init(i2s);
   429	
   430		ret = devm_snd_soc_register_component(&pdev->dev,
   431						      &loongson_i2s_component,
   432						      &loongson_i2s_dai, 1);
   433		if (ret) {
   434			dev_err(&pdev->dev, "register DAI failed %d\n", ret);
   435			goto err_unmap;
   436		}
   437	
   438		return 0;
   439	
   440	err_unmap:
 > 441		pci_iounmap(pdev, i2s->reg_base);
   442	err_release:
 > 443		pci_release_region(pdev, BAR_NUM);
   444	err_disable:
   445		pci_disable_device(pdev);
   446		return ret;
   447	}
   448	
   449	static void loongson_i2s_pci_remove(struct pci_dev *pdev)
   450	{
   451		struct loongson_i2s *i2s = dev_get_drvdata(&pdev->dev);
   452	
   453		pci_iounmap(pdev, i2s->reg_base);
   454		pci_release_region(pdev, BAR_NUM);
   455		pci_disable_device(pdev);
   456	}
   457	
   458	static const struct pci_device_id loongson_i2s_ids[] = {
   459		{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x7a27) },
   460		{ },
   461	};
   462	MODULE_DEVICE_TABLE(pci, loongson_i2s_ids);
   463	
   464	static struct pci_driver loongson_i2s_driver = {
   465		.name = "loongson-i2s-pci",
   466		.id_table = loongson_i2s_ids,
   467		.probe = loongson_i2s_pci_probe,
   468		.remove = loongson_i2s_pci_remove,
   469		.driver = {
   470			.owner = THIS_MODULE,
   471			.pm = pm_sleep_ptr(&loongson_i2s_pm),
   472		},
   473	};
 > 474	module_pci_driver(loongson_i2s_driver);
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
