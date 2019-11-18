Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE1103836
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:05:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F769169C;
	Wed, 20 Nov 2019 12:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F769169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574247941;
	bh=zpTpZcXeUunmk2WCtafj3g9+kbr+E+fVypMsCRgPtWU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zcl/EXqzGLeCR1zlTgmqbOAScdra05rZrLePeBZKxsyHEPCC+QQ88Nk9ltIaNmweW
	 Ec+RCPSQBo715N7OAYlx40dg1+OWD1tyJWoNzicUov0d8uypti8lOTw3OzJmem1lYV
	 mq+w62RVWkDaHVct6RdU4brR4yLoOsDIWH3pqy8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C07CF80150;
	Wed, 20 Nov 2019 12:02:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B5F9F8013B; Mon, 18 Nov 2019 14:27:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 083B6F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 14:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 083B6F800FF
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 05:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="196125970"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
 by orsmga007.jf.intel.com with ESMTP; 18 Nov 2019 05:27:38 -0800
Date: Mon, 18 Nov 2019 21:34:30 +0800
From: Philip Li <philip.li@intel.com>
To: vishnu <vravulap@amd.com>
Message-ID: <20191118133430.GB3979@intel.com>
References: <alpine.DEB.2.21.1911171159570.2641@hadrien>
 <ff992812-3bf1-4cc0-1e07-e11392cf5dca@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff992812-3bf1-4cc0-1e07-e11392cf5dca@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 kbuild-all@lists.01.org, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Sanju R Mehta <sanju.mehta@amd.com>,
 Julia Lawall <julia.lawall@lip6.fr>, Colin Ian King <colin.king@canonical.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Alexander.Deucher@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [kbuild-all] Re: [PATCH v5 1/6] ASoC: amd:Create
 multiple I2S platform device Endpoint (fwd)
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

On Mon, Nov 18, 2019 at 02:29:01PM +0530, vishnu wrote:
> Hi Julia,
> 
> This is not latest version.I have already send V6 version.
> The comment which you gave is for v5 old version.
sorry Vishnu, this is kbuild side problem. We will check
why we didn't block the report when there's new version.

> 
> 
> Thanks,
> Vishnu
> 
> On 17/11/19 4:31 PM, Julia Lawall wrote:
> > On line 70, adata->res is allocated with a devm function, so it shouldn't
> > be passed to kfree later; that will lead to a double free.
> > 
> > julia
> > 
> > ---------- Forwarded message ----------
> > Date: Sun, 17 Nov 2019 11:44:07 +0800
> > From: kbuild test robot <lkp@intel.com>
> > To: kbuild@lists.01.org
> > Cc: Julia Lawall <julia.lawall@lip6.fr>
> > Subject: Re: [PATCH v5 1/6] ASoC: amd:Create multiple I2S platform device
> >      Endpoint
> > 
> > In-Reply-To: <1573629249-13272-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
> > References: <1573629249-13272-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
> > 
> > Hi Ravulapati,
> > 
> > Thank you for the patch! Perhaps something to improve:
> > 
> > [auto build test WARNING on asoc/for-next]
> > [cannot apply to v5.4-rc7 next-20191115]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Ravulapati-Vishnu-vardhan-rao/ASoC-amd-Create-multiple-I2S-platform-device-Endpoint/20191113-230604
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> > :::::: branch date: 4 days ago
> > :::::: commit date: 4 days ago
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> > 
> > > > sound/soc/amd/raven/pci-acp3x.c:142:1-6: WARNING: invalid free of devm_ allocated data
> > 
> > # https://github.com/0day-ci/linux/commit/79701559637a30a0708febfd5119ad05128b2ba5
> > git remote add linux-review https://github.com/0day-ci/linux
> > git remote update linux-review
> > git checkout 79701559637a30a0708febfd5119ad05128b2ba5
> > vim +142 sound/soc/amd/raven/pci-acp3x.c
> > 
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   21
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   22  static int snd_acp3x_probe(struct pci_dev *pci,
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   23  			   const struct pci_device_id *pci_id)
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   24  {
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   25  	int ret;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   26  	u32 addr, val, i;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   27  	struct acp3x_dev_data *adata;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   28  	struct platform_device_info pdevinfo[ACP3x_DEVS];
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   29  	unsigned int irqflags;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   30
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   31  	if (pci_enable_device(pci)) {
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   32  		dev_err(&pci->dev, "pci_enable_device failed\n");
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   33  		return -ENODEV;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   34  	}
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   35
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   36  	ret = pci_request_regions(pci, "AMD ACP3x audio");
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   37  	if (ret < 0) {
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   38  		dev_err(&pci->dev, "pci_request_regions failed\n");
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   39  		goto disable_pci;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   40  	}
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   41
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   42  	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   43  			     GFP_KERNEL);
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   44  	if (!adata) {
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   45  		ret = -ENOMEM;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   46  		goto release_regions;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   47  	}
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   48
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   49  	/* check for msi interrupt support */
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   50  	ret = pci_enable_msi(pci);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   51  	if (ret)
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   52  		/* msi is not enabled */
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   53  		irqflags = IRQF_SHARED;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   54  	else
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   55  		/* msi is enabled */
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   56  		irqflags = 0;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   57
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   58  	addr = pci_resource_start(pci, 0);
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   59  	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   60  	if (!adata->acp3x_base) {
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   61  		ret = -ENOMEM;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   62  		goto release_regions;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   63  	}
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   64  	pci_set_master(pci);
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12   65  	pci_set_drvdata(pci, adata);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   66
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   67  	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   68  	switch (val) {
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   69  	case I2S_MODE:
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   70  		adata->res = devm_kzalloc(&pci->dev,
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   71  					  sizeof(struct resource) * 4,
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   72  					  GFP_KERNEL);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   73  		if (!adata->res) {
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   74  			ret = -ENOMEM;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   75  			goto unmap_mmio;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   76  		}
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   77
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   78  		adata->res[0].name = "acp3x_i2s_iomem";
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   79  		adata->res[0].flags = IORESOURCE_MEM;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   80  		adata->res[0].start = addr;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   81  		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   82
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   83  		adata->res[1].name = "acp3x_i2s_sp";
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   84  		adata->res[1].flags = IORESOURCE_MEM;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   85  		adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   86  		adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   87
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   88  		adata->res[2].name = "acp3x_i2s_bt";
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   89  		adata->res[2].flags = IORESOURCE_MEM;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   90  		adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   91  		adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   92
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   93  		adata->res[3].name = "acp3x_i2s_irq";
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   94  		adata->res[3].flags = IORESOURCE_IRQ;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   95  		adata->res[3].start = pci->irq;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13   96  		adata->res[3].end = adata->res[3].start;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   97
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   98  		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12   99
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  100  		memset(&pdevinfo, 0, sizeof(pdevinfo));
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  101  		pdevinfo[0].name = "acp3x_rv_i2s_dma";
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  102  		pdevinfo[0].id = 0;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  103  		pdevinfo[0].parent = &pci->dev;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  104  		pdevinfo[0].num_res = 4;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  105  		pdevinfo[0].res = &adata->res[0];
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  106  		pdevinfo[0].data = &irqflags;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  107  		pdevinfo[0].size_data = sizeof(irqflags);
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  108
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  109  		pdevinfo[1].name = "acp3x_i2s_playcap";
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  110  		pdevinfo[1].id = 0;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  111  		pdevinfo[1].parent = &pci->dev;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  112  		pdevinfo[1].num_res = 1;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  113  		pdevinfo[1].res = &adata->res[1];
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  114
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  115  		pdevinfo[2].name = "acp3x_i2s_playcap";
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  116  		pdevinfo[2].id = 1;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  117  		pdevinfo[2].parent = &pci->dev;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  118  		pdevinfo[2].num_res = 1;
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  119  		pdevinfo[2].res = &adata->res[2];
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  120  		for (i = 0; i < ACP3x_DEVS ; i++) {
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  121  			adata->pdev[i] =
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  122  				platform_device_register_full(&pdevinfo[i]);
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  123  			if (IS_ERR(adata->pdev[i])) {
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  124  				dev_err(&pci->dev, "cannot register %s device\n",
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  125  					pdevinfo[i].name);
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  126  				ret = PTR_ERR(adata->pdev[i]);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  127  				goto unmap_mmio;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  128  			}
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  129  		}
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  130  		break;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  131  	default:
> > 00347e4ea8ca4c Colin Ian King                2018-11-16  132  		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  133  		ret = -ENODEV;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  134  		goto unmap_mmio;
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  135  	}
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  136  	return 0;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  137
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  138  unmap_mmio:
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  139  	pci_disable_msi(pci);
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  140  	for (i = 0 ; i < ACP3x_DEVS ; i++)
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13  141  		platform_device_unregister(adata->pdev[i]);
> > 79701559637a30 Ravulapati Vishnu vardhan rao 2019-11-13 @142  	kfree(adata->res);
> > 7894a7e7ea3de6 Vijendar Mukunda              2018-11-12  143  	iounmap(adata->acp3x_base);
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  144  release_regions:
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  145  	pci_release_regions(pci);
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  146  disable_pci:
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  147  	pci_disable_device(pci);
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  148
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  149  	return ret;
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  150  }
> > e30d9128def6ca Maruthi Srinivas Bayyavarapu  2018-11-12  151
> > 
> > ---
> > 0-DAY kernel test infrastructure                 Open Source Technology Center
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
> > 
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
