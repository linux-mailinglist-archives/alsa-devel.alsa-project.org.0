Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2FFB61D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 18:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54377166A;
	Wed, 13 Nov 2019 18:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54377166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573665384;
	bh=bBiZgNCVY/OAS17Vv7A9WaI9CTNZOiehELZyqrceZno=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjnN7pAuD/M29v1FK0xtgvrEk1PjB2i61UDB6iTU+T+h/fo+4knu+aBgbRcjm3Zah
	 G+OQ3SqzTkZfqO0sPEatnV4flAk9Jwy5yL4SJNFydGzITXR0wfx5HekQOp1/BFTlRK
	 vQlqW3KLvCOaWxxbbYWmtW0d1Dcm4OR5Y8fDj4oI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FAE8F80088;
	Wed, 13 Nov 2019 18:14:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832A0F80086; Wed, 13 Nov 2019 18:14:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81895F80084
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 18:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81895F80084
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 09:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; 
 d="gz'50?scan'50,208,50";a="214353986"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2019 09:14:22 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iUwDm-0004ix-2p; Thu, 14 Nov 2019 01:14:22 +0800
Date: Thu, 14 Nov 2019 01:13:23 +0800
From: kbuild test robot <lkp@intel.com>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <201911140107.jmq1Jul0%lkp@intel.com>
References: <1573629249-13272-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ezvk6v7c7l2ankx4"
Content-Disposition: inline
In-Reply-To: <1573629249-13272-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>, kbuild-all@lists.01.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v5 6/6] ASoC: amd: Added ACP3x
 system resume and runtime pm
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


--ezvk6v7c7l2ankx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ravulapati,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[also build test WARNING on next-20191113]
[cannot apply to v5.4-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Ravulapati-Vishnu-vardhan-rao/ASoC-amd-Create-multiple-I2S-platform-device-Endpoint/20191113-230604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-randconfig-h001-20191113 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/amd/raven/pci-acp3x.c: In function 'acp3x_power_on':
   sound/soc/amd/raven/pci-acp3x.c:29:6: warning: unused variable 'ret' [-Wunused-variable]
     int ret = 0;
         ^~~
   sound/soc/amd/raven/pci-acp3x.c: In function 'acp3x_power_off':
>> sound/soc/amd/raven/pci-acp3x.c:68:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   sound/soc/amd/raven/pci-acp3x.c: In function 'acp3x_power_on':
   sound/soc/amd/raven/pci-acp3x.c:50:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^

vim +68 sound/soc/amd/raven/pci-acp3x.c

    24	
    25	static int acp3x_power_on(void __iomem *acp3x_base)
    26	{
    27		u32 val;
    28		u32 timeout = 0;
  > 29		int ret = 0;
    30	
    31		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
    32	
    33		if (val == 0)
    34			return val;
    35	
    36		if (!((val & ACP_PGFSM_STATUS_MASK) ==
    37					ACP_POWER_ON_IN_PROGRESS))
    38			rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
    39				acp3x_base + mmACP_PGFSM_CONTROL);
    40		while (++timeout < DELAY) {
    41			val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
    42			if (!val)
    43				break;
    44			udelay(1);
    45			if (timeout > 500) {
    46				pr_err("ACP is Not Powered ON\n");
    47				return -ETIMEDOUT;
    48			}
    49		}
    50	}
    51	static int acp3x_power_off(void __iomem *acp3x_base)
    52	{
    53		u32 val;
    54		u32 timeout = 0;
    55	
    56		rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
    57				acp3x_base + mmACP_PGFSM_CONTROL);
    58		while (++timeout < DELAY) {
    59			val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
    60			if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
    61				return 0;
    62			udelay(1);
    63			if (timeout > 500) {
    64				pr_err("ACP is Not Powered OFF\n");
    65				return -ETIMEDOUT;
    66			}
    67		}
  > 68	}
    69	static int acp3x_reset(void __iomem *acp3x_base)
    70	{
    71		u32 val, timeout;
    72	
    73		rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
    74		timeout = 0;
    75		while (++timeout < DELAY) {
    76			val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
    77			if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
    78								timeout > 100) {
    79				if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
    80					break;
    81				return -ENODEV;
    82			}
    83			cpu_relax();
    84		}
    85		rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
    86		timeout = 0;
    87		while (++timeout < DELAY) {
    88			val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
    89			if (!val)
    90				break;
    91			if (timeout > 100)
    92				return -ENODEV;
    93			cpu_relax();
    94		}
    95		return 0;
    96	}
    97	static int acp3x_init(void __iomem *acp3x_base)
    98	{
    99		int ret;
   100	
   101		/* power on */
   102		ret = acp3x_power_on(acp3x_base);
   103		if (ret) {
   104			pr_err("ACP3x power on failed\n");
   105			return ret;
   106		}
   107		/* Reset */
   108		ret = acp3x_reset(acp3x_base);
   109		if (ret) {
   110			pr_err("ACP3x reset failed\n");
   111			return ret;
   112		}
   113		return 0;
   114	}
   115	static int acp3x_deinit(void __iomem *acp3x_base)
   116	{
   117		int ret;
   118	
   119		/* Reset */
   120		ret = acp3x_reset(acp3x_base);
   121		if (ret) {
   122			pr_err("ACP3x reset failed\n");
   123			return ret;
   124		}
   125		/* power off */
   126		ret = acp3x_power_off(acp3x_base);
   127		if (ret) {
   128			pr_err("ACP3x power off failed\n");
   129			return ret;
   130		}
   131		return 0;
   132	}
   133	static int snd_acp3x_probe(struct pci_dev *pci,
   134				   const struct pci_device_id *pci_id)
   135	{
   136		int ret;
   137		u32 addr, val, i;
   138		struct acp3x_dev_data *adata;
   139		struct platform_device_info pdevinfo[ACP3x_DEVS];
   140		unsigned int irqflags;
   141	
   142		if (pci_enable_device(pci)) {
   143			dev_err(&pci->dev, "pci_enable_device failed\n");
   144			return -ENODEV;
   145		}
   146	
   147		ret = pci_request_regions(pci, "AMD ACP3x audio");
   148		if (ret < 0) {
   149			dev_err(&pci->dev, "pci_request_regions failed\n");
   150			goto disable_pci;
   151		}
   152	
   153		adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
   154				     GFP_KERNEL);
   155		if (!adata) {
   156			ret = -ENOMEM;
   157			goto release_regions;
   158		}
   159	
   160		/* check for msi interrupt support */
   161		ret = pci_enable_msi(pci);
   162		if (ret)
   163			/* msi is not enabled */
   164			irqflags = IRQF_SHARED;
   165		else
   166			/* msi is enabled */
   167			irqflags = 0;
   168	
   169		addr = pci_resource_start(pci, 0);
   170		adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
   171		if (!adata->acp3x_base) {
   172			ret = -ENOMEM;
   173			goto release_regions;
   174		}
   175		pci_set_master(pci);
   176		pci_set_drvdata(pci, adata);
   177		ret = acp3x_init(adata->acp3x_base);
   178		if (ret)
   179			return -ENODEV;
   180	
   181	
   182		val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
   183		switch (val) {
   184		case I2S_MODE:
   185			adata->res = devm_kzalloc(&pci->dev,
   186						  sizeof(struct resource) * 4,
   187						  GFP_KERNEL);
   188			if (!adata->res) {
   189				ret = -ENOMEM;
   190				goto unmap_mmio;
   191			}
   192	
   193			adata->res[0].name = "acp3x_i2s_iomem";
   194			adata->res[0].flags = IORESOURCE_MEM;
   195			adata->res[0].start = addr;
   196			adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
   197	
   198			adata->res[1].name = "acp3x_i2s_sp";
   199			adata->res[1].flags = IORESOURCE_MEM;
   200			adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
   201			adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
   202	
   203			adata->res[2].name = "acp3x_i2s_bt";
   204			adata->res[2].flags = IORESOURCE_MEM;
   205			adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
   206			adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
   207	
   208			adata->res[3].name = "acp3x_i2s_irq";
   209			adata->res[3].flags = IORESOURCE_IRQ;
   210			adata->res[3].start = pci->irq;
   211			adata->res[3].end = adata->res[3].start;
   212	
   213			adata->acp3x_audio_mode = ACP3x_I2S_MODE;
   214	
   215			memset(&pdevinfo, 0, sizeof(pdevinfo));
   216			pdevinfo[0].name = "acp3x_rv_i2s_dma";
   217			pdevinfo[0].id = 0;
   218			pdevinfo[0].parent = &pci->dev;
   219			pdevinfo[0].num_res = 4;
   220			pdevinfo[0].res = &adata->res[0];
   221			pdevinfo[0].data = &irqflags;
   222			pdevinfo[0].size_data = sizeof(irqflags);
   223	
   224			pdevinfo[1].name = "acp3x_i2s_playcap";
   225			pdevinfo[1].id = 0;
   226			pdevinfo[1].parent = &pci->dev;
   227			pdevinfo[1].num_res = 1;
   228			pdevinfo[1].res = &adata->res[1];
   229	
   230			pdevinfo[2].name = "acp3x_i2s_playcap";
   231			pdevinfo[2].id = 1;
   232			pdevinfo[2].parent = &pci->dev;
   233			pdevinfo[2].num_res = 1;
   234			pdevinfo[2].res = &adata->res[2];
   235			for (i = 0; i < ACP3x_DEVS ; i++) {
   236				adata->pdev[i] =
   237					platform_device_register_full(&pdevinfo[i]);
   238				if (IS_ERR(adata->pdev[i])) {
   239					dev_err(&pci->dev, "cannot register %s device\n",
   240						pdevinfo[i].name);
   241					ret = PTR_ERR(adata->pdev[i]);
   242					goto unmap_mmio;
   243				}
   244			}
   245			break;
   246		default:
   247			dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
   248			ret = -ENODEV;
   249			goto unmap_mmio;
   250		}
   251		pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
   252		pm_runtime_use_autosuspend(&pci->dev);
   253		pm_runtime_set_active(&pci->dev);
   254		pm_runtime_put_noidle(&pci->dev);
   255		pm_runtime_enable(&pci->dev);
   256		return 0;
   257	
   258	unmap_mmio:
   259		ret = acp3x_deinit(adata->acp3x_base);
   260		if (ret)
   261			dev_err(&pci->dev, "ACP de-init failed\n");
   262		else
   263			dev_info(&pci->dev, "ACP de-initialized\n");
   264		pci_disable_msi(pci);
   265		for (i = 0 ; i < ACP3x_DEVS ; i++)
   266			platform_device_unregister(adata->pdev[i]);
   267		kfree(adata->res);
   268		iounmap(adata->acp3x_base);
   269	release_regions:
   270		pci_release_regions(pci);
   271	disable_pci:
   272		pci_disable_device(pci);
   273	
   274		return ret;
   275	}
   276	static int  snd_acp3x_suspend(struct device *dev)
   277	{
   278		int status;
   279		struct acp3x_dev_data *adata = dev_get_drvdata(dev);
   280	
   281		status = acp3x_deinit(adata->acp3x_base);
   282		if (status)
   283			dev_err(dev, "ACP de-init failed\n");
   284		else
   285			dev_info(dev, "ACP de-initialized\n");
   286	
   287		return 0;
   288	}
   289	static int  snd_acp3x_resume(struct device *dev)
   290	{
   291		int status;
   292		struct acp3x_dev_data *adata = dev_get_drvdata(dev);
   293	
   294		status = acp3x_init(adata->acp3x_base);
   295		if (status) {
   296			dev_err(dev, "ACP init failed\n");
   297			return status;
   298		}
   299		return 0;
   300	}
   301	static const struct dev_pm_ops acp3x_pm = {
   302		.runtime_suspend = snd_acp3x_suspend,
   303		.runtime_resume =  snd_acp3x_resume,
   304		.resume =       snd_acp3x_resume,
   305	};
   306	static void snd_acp3x_remove(struct pci_dev *pci)
   307	{
   308		int i, ret;
   309		struct acp3x_dev_data *adata = pci_get_drvdata(pci);
   310	
   311		if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
   312			for (i = 0 ; i <  ACP3x_DEVS ; i++)
   313				platform_device_unregister(adata->pdev[i]);
   314		}
   315		ret = acp3x_deinit(adata->acp3x_base);
   316		if (ret)
   317			dev_err(&pci->dev, "ACP de-init failed\n");
   318		else
   319			dev_info(&pci->dev, "ACP de-initialized\n");
   320		iounmap(adata->acp3x_base);
   321		pm_runtime_disable(&pci->dev);
   322		pm_runtime_get_noresume(&pci->dev);
   323		pci_disable_msi(pci);
   324		pci_release_regions(pci);
   325		pci_disable_device(pci);
   326	}
   327	static const struct pci_device_id snd_acp3x_ids[] = {
   328		{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x15e2),
   329		.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
   330		.class_mask = 0xffffff },
   331		{ 0, },
   332	};
   333	MODULE_DEVICE_TABLE(pci, snd_acp3x_ids);
   334	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--ezvk6v7c7l2ankx4
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ezvk6v7c7l2ankx4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--ezvk6v7c7l2ankx4--
