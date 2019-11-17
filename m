Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C9103830
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:04:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BA616A4;
	Wed, 20 Nov 2019 12:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BA616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574247847;
	bh=ZRn46k8kcaJlnO6fstOrvK1FuP9aQGzbHxwBID0yF84=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fqjj1IMPhKQr8azpM2KucP2vu+cuo1wUpJVCPRvvny/pyuOEy2unHSBRMA/ri6s/Q
	 vn1DTlhfKJtdQbNRmgNIDTcLHzZyCR30qsXSjET4PfSwnMo6ZUpRBC+AbHMXBoEOvD
	 gVplb2BOMoY9UZwMJz/CS4qRJUjSdJf7KQgTHEcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 643D6F8013F;
	Wed, 20 Nov 2019 12:02:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9595F80131; Sun, 17 Nov 2019 12:01:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_HELO_NONE,SPF_NEUTRAL,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82088F800E6
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 12:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82088F800E6
X-IronPort-AV: E=Sophos;i="5.68,316,1569276000"; d="scan'208";a="327004952"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Nov 2019 12:01:35 +0100
Date: Sun, 17 Nov 2019 12:01:35 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <alpine.DEB.2.21.1911171159570.2641@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 kbuild-all@lists.01.org, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH v5 1/6] ASoC: amd:Create multiple I2S
 platform device Endpoint (fwd)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On line 70, adata->res is allocated with a devm function, so it shouldn't
be passed to kfree later; that will lead to a double free.

julia

---------- Forwarded message ----------
Date: Sun, 17 Nov 2019 11:44:07 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@lists.01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v5 1/6] ASoC: amd:Create multiple I2S platform device
    Endpoint

In-Reply-To: <1573629249-13272-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573629249-13272-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>

Hi Ravulapati,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[cannot apply to v5.4-rc7 next-20191115]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Ravulapati-Vishnu-vardhan-rao/ASoC-amd-Create-multiple-I2S-platform-device-Endpoint/20191113-230604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> sound/soc/amd/raven/pci-acp3x.c:142:1-6: WARNING: invalid free of devm_ allocated data

# https://github.com/0day-ci/linux/commit/79701559637a30a0708febfd5119ad05128b2ba5
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 79701559637a30a0708febfd5119ad05128b2ba5
vim +142 sound/soc/amd/raven/pci-acp3x.c

e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   21
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   22  static int snd_acp3x_probe(struct pci_dev *pci,
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   23  			   const struct pci_device_id *pci_id)
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   24  {
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   25  	int ret;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   26  	u32 addr, val, i;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   27  	struct acp3x_dev_data *adata;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   28  	struct platform_device_info pdevinfo[ACP3x_DEVS];
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   29  	unsigned int irqflags;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   30
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   31  	if (pci_enable_device(pci)) {
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   32  		dev_err(&pci->dev, "pci_enable_device failed\n");
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   33  		return -ENODEV;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   34  	}
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   35
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   36  	ret = pci_request_regions(pci, "AMD ACP3x audio");
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   37  	if (ret < 0) {
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   38  		dev_err(&pci->dev, "pci_request_regions failed\n");
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   39  		goto disable_pci;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   40  	}
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   41
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   42  	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   43  			     GFP_KERNEL);
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   44  	if (!adata) {
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   45  		ret = -ENOMEM;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   46  		goto release_regions;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   47  	}
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   48
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   49  	/* check for msi interrupt support */
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   50  	ret = pci_enable_msi(pci);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   51  	if (ret)
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   52  		/* msi is not enabled */
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   53  		irqflags = IRQF_SHARED;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   54  	else
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   55  		/* msi is enabled */
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   56  		irqflags = 0;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   57
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   58  	addr = pci_resource_start(pci, 0);
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   59  	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   60  	if (!adata->acp3x_base) {
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   61  		ret = -ENOMEM;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   62  		goto release_regions;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   63  	}
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   64  	pci_set_master(pci);
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   65  	pci_set_drvdata(pci, adata);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   66
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   67  	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   68  	switch (val) {
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   69  	case I2S_MODE:
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   70  		adata->res = devm_kzalloc(&pci->dev,
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   71  					  sizeof(struct resource) * 4,
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   72  					  GFP_KERNEL);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   73  		if (!adata->res) {
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   74  			ret = -ENOMEM;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   75  			goto unmap_mmio;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   76  		}
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   77
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   78  		adata->res[0].name = "acp3x_i2s_iomem";
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   79  		adata->res[0].flags = IORESOURCE_MEM;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   80  		adata->res[0].start = addr;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   81  		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   82
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   83  		adata->res[1].name = "acp3x_i2s_sp";
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   84  		adata->res[1].flags = IORESOURCE_MEM;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   85  		adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   86  		adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   87
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   88  		adata->res[2].name = "acp3x_i2s_bt";
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   89  		adata->res[2].flags = IORESOURCE_MEM;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   90  		adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   91  		adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   92
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   93  		adata->res[3].name = "acp3x_i2s_irq";
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   94  		adata->res[3].flags = IORESOURCE_IRQ;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   95  		adata->res[3].start = pci->irq;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   96  		adata->res[3].end = adata->res[3].start;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   97
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   98  		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   99
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  100  		memset(&pdevinfo, 0, sizeof(pdevinfo));
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  101  		pdevinfo[0].name = "acp3x_rv_i2s_dma";
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  102  		pdevinfo[0].id = 0;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  103  		pdevinfo[0].parent = &pci->dev;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  104  		pdevinfo[0].num_res = 4;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  105  		pdevinfo[0].res = &adata->res[0];
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  106  		pdevinfo[0].data = &irqflags;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  107  		pdevinfo[0].size_data = sizeof(irqflags);
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  108
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  109  		pdevinfo[1].name = "acp3x_i2s_playcap";
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  110  		pdevinfo[1].id = 0;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  111  		pdevinfo[1].parent = &pci->dev;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  112  		pdevinfo[1].num_res = 1;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  113  		pdevinfo[1].res = &adata->res[1];
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  114
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  115  		pdevinfo[2].name = "acp3x_i2s_playcap";
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  116  		pdevinfo[2].id = 1;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  117  		pdevinfo[2].parent = &pci->dev;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  118  		pdevinfo[2].num_res = 1;
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  119  		pdevinfo[2].res = &adata->res[2];
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  120  		for (i = 0; i < ACP3x_DEVS ; i++) {
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  121  			adata->pdev[i] =
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  122  				platform_device_register_full(&pdevinfo[i]);
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  123  			if (IS_ERR(adata->pdev[i])) {
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  124  				dev_err(&pci->dev, "cannot register %s device\n",
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  125  					pdevinfo[i].name);
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  126  				ret = PTR_ERR(adata->pdev[i]);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  127  				goto unmap_mmio;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  128  			}
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  129  		}
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  130  		break;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  131  	default:
00347e4ea8ca4c Colin Ian King                2018-11-16  132  		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  133  		ret = -ENODEV;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  134  		goto unmap_mmio;
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  135  	}
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  136  	return 0;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  137
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  138  unmap_mmio:
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  139  	pci_disable_msi(pci);
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  140  	for (i = 0 ; i < ACP3x_DEVS ; i++)
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  141  		platform_device_unregister(adata->pdev[i]);
79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13 @142  	kfree(adata->res);
7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  143  	iounmap(adata->acp3x_base);
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  144  release_regions:
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  145  	pci_release_regions(pci);
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  146  disable_pci:
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  147  	pci_disable_device(pci);
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  148
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  149  	return ret;
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  150  }
e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  151

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
