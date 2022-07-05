Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5775676AE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 663BE16B9;
	Tue,  5 Jul 2022 20:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 663BE16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657046408;
	bh=f5YXzxxxFtDhdqaCfbKXU2l4xFbQoZoTCeioTH5pT2I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbtfbuyJyl1kpwa/G0/8k/VGMhFIFkYuFKtIVENe9GiXSE28jdQokanmUmry8HqRL
	 69ebJU6rgjd6/LSu8mD0dqrWAE5en95Ia9ebxasC+2+JJX8dHK3ZHieDdVK92a5YPR
	 QuRZCybcrHRG97jYmiacAzjDA2ZEhz/3xmvEtj9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1292F800CB;
	Tue,  5 Jul 2022 20:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30E80F8015B; Tue,  5 Jul 2022 20:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C31F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 20:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C31F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lKx0Tt9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657046340; x=1688582340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f5YXzxxxFtDhdqaCfbKXU2l4xFbQoZoTCeioTH5pT2I=;
 b=lKx0Tt9G9tfuwukvSIO+nQxWbA6yp9TmyrOkBklJx2m4Lp66iKGnrboT
 qOq4BKhhkPg/srOoTBVaqpp2lhw4arVpSO1fiSs+S0cm6ALp1P4P0dKSt
 MxwYUDU4AaykhajnicIvqxDjRXegyXSU/zlrkcAtKxjQarLu7MG50juF1
 J4ofbW3Hn4ikj3wJVZmTcIvtagitJGfOa320/LGn1VeO+aSrM0TMV0hwU
 S4D8HZ6/V+YdjW3i74GsSAagRsI4zvsmeUm2MH7zHzlHy5WvTpZV4YQGX
 o2eUwJazLiUPuVWuFJoge1aR6by832hN+DlcIexqKsQ533iC0FKsnz6xG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="284556202"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="284556202"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 11:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="919833300"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2022 11:38:51 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o8nRi-000JTq-M8;
 Tue, 05 Jul 2022 18:38:50 +0000
Date: Wed, 6 Jul 2022 02:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] ASoC: Intel: catpt: remove duplicating driver
 data retrieval
Message-ID: <202207060256.1n5oG24B-lkp@intel.com>
References: <20220702223243.51364-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702223243.51364-1-andriy.shevchenko@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kbuild-all@lists.01.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, llvm@lists.linux.dev,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next linus/master v5.19-rc5 next-20220705]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-Intel-catpt-remove-duplicating-driver-data-retrieval/20220703-063325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220706/202207060256.1n5oG24B-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a83f7416086fbf505f7f585fa3718fed2ee1ac75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/ASoC-Intel-catpt-remove-duplicating-driver-data-retrieval/20220703-063325
        git checkout a83f7416086fbf505f7f585fa3718fed2ee1ac75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/intel/catpt/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/intel/catpt/device.c:252:45: warning: variable 'id' is uninitialized when used here [-Wuninitialized]
           ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
                                                      ^~
   sound/soc/intel/catpt/device.c:244:33: note: initialize the variable 'id' to silence this warning
           const struct acpi_device_id *id;
                                          ^
                                           = NULL
   1 warning generated.


vim +/id +252 sound/soc/intel/catpt/device.c

7a10b66a5df965 Cezary Rojewski      2020-09-29  238  
7a10b66a5df965 Cezary Rojewski      2020-09-29  239  static int catpt_acpi_probe(struct platform_device *pdev)
7a10b66a5df965 Cezary Rojewski      2020-09-29  240  {
7a10b66a5df965 Cezary Rojewski      2020-09-29  241  	const struct catpt_spec *spec;
7a10b66a5df965 Cezary Rojewski      2020-09-29  242  	struct catpt_dev *cdev;
7a10b66a5df965 Cezary Rojewski      2020-09-29  243  	struct device *dev = &pdev->dev;
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  244  	const struct acpi_device_id *id;
7a10b66a5df965 Cezary Rojewski      2020-09-29  245  	struct resource *res;
7a10b66a5df965 Cezary Rojewski      2020-09-29  246  	int ret;
7a10b66a5df965 Cezary Rojewski      2020-09-29  247  
a83f7416086fbf Andy Shevchenko      2022-07-03  248  	spec = device_get_match_data(dev);
a83f7416086fbf Andy Shevchenko      2022-07-03  249  	if (!spec)
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  250  		return -ENODEV;
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  251  
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12 @252  	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  253  	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  254  		dev_dbg(dev, "CATPT ACPI driver not selected, aborting probe\n");
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  255  		return -ENODEV;
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  256  	}
ec8a15d3a7c7d6 Pierre-Louis Bossart 2020-11-12  257  
7a10b66a5df965 Cezary Rojewski      2020-09-29  258  	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
7a10b66a5df965 Cezary Rojewski      2020-09-29  259  	if (!cdev)
7a10b66a5df965 Cezary Rojewski      2020-09-29  260  		return -ENOMEM;
7a10b66a5df965 Cezary Rojewski      2020-09-29  261  
7a10b66a5df965 Cezary Rojewski      2020-09-29  262  	catpt_dev_init(cdev, dev, spec);
7a10b66a5df965 Cezary Rojewski      2020-09-29  263  
7a10b66a5df965 Cezary Rojewski      2020-09-29  264  	/* map DSP bar address */
7a10b66a5df965 Cezary Rojewski      2020-09-29  265  	cdev->lpe_ba = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
7a10b66a5df965 Cezary Rojewski      2020-09-29  266  	if (IS_ERR(cdev->lpe_ba))
7a10b66a5df965 Cezary Rojewski      2020-09-29  267  		return PTR_ERR(cdev->lpe_ba);
7a10b66a5df965 Cezary Rojewski      2020-09-29  268  	cdev->lpe_base = res->start;
7a10b66a5df965 Cezary Rojewski      2020-09-29  269  
7a10b66a5df965 Cezary Rojewski      2020-09-29  270  	/* map PCI bar address */
7a10b66a5df965 Cezary Rojewski      2020-09-29  271  	cdev->pci_ba = devm_platform_ioremap_resource(pdev, 1);
7a10b66a5df965 Cezary Rojewski      2020-09-29  272  	if (IS_ERR(cdev->pci_ba))
7a10b66a5df965 Cezary Rojewski      2020-09-29  273  		return PTR_ERR(cdev->pci_ba);
7a10b66a5df965 Cezary Rojewski      2020-09-29  274  
7a10b66a5df965 Cezary Rojewski      2020-09-29  275  	/* alloc buffer for storing DRAM context during dx transitions */
7a10b66a5df965 Cezary Rojewski      2020-09-29  276  	cdev->dxbuf_vaddr = dmam_alloc_coherent(dev, catpt_dram_size(cdev),
7a10b66a5df965 Cezary Rojewski      2020-09-29  277  						&cdev->dxbuf_paddr, GFP_KERNEL);
7a10b66a5df965 Cezary Rojewski      2020-09-29  278  	if (!cdev->dxbuf_vaddr)
7a10b66a5df965 Cezary Rojewski      2020-09-29  279  		return -ENOMEM;
7a10b66a5df965 Cezary Rojewski      2020-09-29  280  
7a10b66a5df965 Cezary Rojewski      2020-09-29  281  	ret = platform_get_irq(pdev, 0);
7a10b66a5df965 Cezary Rojewski      2020-09-29  282  	if (ret < 0)
7a10b66a5df965 Cezary Rojewski      2020-09-29  283  		return ret;
7a10b66a5df965 Cezary Rojewski      2020-09-29  284  	cdev->irq = ret;
7a10b66a5df965 Cezary Rojewski      2020-09-29  285  
7a10b66a5df965 Cezary Rojewski      2020-09-29  286  	platform_set_drvdata(pdev, cdev);
7a10b66a5df965 Cezary Rojewski      2020-09-29  287  
7a10b66a5df965 Cezary Rojewski      2020-09-29  288  	ret = devm_request_threaded_irq(dev, cdev->irq, catpt_dsp_irq_handler,
7a10b66a5df965 Cezary Rojewski      2020-09-29  289  					catpt_dsp_irq_thread,
7a10b66a5df965 Cezary Rojewski      2020-09-29  290  					IRQF_SHARED, "AudioDSP", cdev);
7a10b66a5df965 Cezary Rojewski      2020-09-29  291  	if (ret)
7a10b66a5df965 Cezary Rojewski      2020-09-29  292  		return ret;
7a10b66a5df965 Cezary Rojewski      2020-09-29  293  
7a10b66a5df965 Cezary Rojewski      2020-09-29  294  	return catpt_probe_components(cdev);
7a10b66a5df965 Cezary Rojewski      2020-09-29  295  }
7a10b66a5df965 Cezary Rojewski      2020-09-29  296  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
