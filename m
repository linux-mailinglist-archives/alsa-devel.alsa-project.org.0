Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996EF10089F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 16:48:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344F3169C;
	Mon, 18 Nov 2019 16:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344F3169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574092138;
	bh=0neHZ72TGa877XAlNHwUufv7rXbas/u6y5HU3iDLf8Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szHlZlfvCUgxX7v9/Bvm861Pp9MgVxzb9iMIFDRHNnl6drRBQHGd5n0vFlPrH2mpV
	 eoSuF5wa4uNT1LyEiZKNjxxyPkA6WPASXbt9PvA6jYSNYAXxAI6zrTRhvtW6DEqzze
	 /1x9g79J6wcFO//4SZ12nqWJ8cmRG4A5zLQaKxbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77B2FF8014E;
	Mon, 18 Nov 2019 16:45:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5A96F80141; Mon, 18 Nov 2019 16:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD097F800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 16:45:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD097F800F1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 07:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="289292868"
Received: from nmdeliwa-mobl1.amr.corp.intel.com (HELO [10.251.155.92])
 ([10.251.155.92])
 by orsmga001.jf.intel.com with ESMTP; 18 Nov 2019 07:45:22 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574085861-22818-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574085861-22818-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6c389fa0-a0a0-a79e-f63e-10e3616962be@linux.intel.com>
Date: Mon, 18 Nov 2019 09:40:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1574085861-22818-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com, Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Alexander.Deucher@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH v7 1/6] ASoC: amd:Create multiple I2S
 platform device endpoint
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>   static int snd_acp3x_probe(struct pci_dev *pci,
>   			   const struct pci_device_id *pci_id)
>   {
> -	int ret;
> -	u32 addr, val;
>   	struct acp3x_dev_data *adata;
> -	struct platform_device_info pdevinfo;
> +	struct platform_device_info pdevinfo[ACP3x_DEVS];
>   	unsigned int irqflags;
> +	int ret, val, i;
> +	u32 addr;
>   
>   	if (pci_enable_device(pci)) {

if you are using devm_ across the board then you could also use 
pcim_enable_device() here?

>   		dev_err(&pci->dev, "pci_enable_device failed\n");
> @@ -40,10 +40,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   	}
>   
>   	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
> -			     GFP_KERNEL);
> +							     GFP_KERNEL);
>   	if (!adata) {
>   		ret = -ENOMEM;
> -		goto release_regions;
> +		goto adata_free;
>   	}
>   
>   	/* check for msi interrupt support */
> @@ -56,7 +56,8 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   		irqflags = 0;
>   
>   	addr = pci_resource_start(pci, 0);
> -	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
> +	adata->acp3x_base = devm_ioremap(&pci->dev, addr,
> +					pci_resource_len(pci, 0));
>   	if (!adata->acp3x_base) {
>   		ret = -ENOMEM;
>   		goto release_regions;
> @@ -68,11 +69,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   	switch (val) {
>   	case I2S_MODE:
>   		adata->res = devm_kzalloc(&pci->dev,
> -					  sizeof(struct resource) * 2,
> +					  sizeof(struct resource) * 4,
>   					  GFP_KERNEL);
>   		if (!adata->res) {
>   			ret = -ENOMEM;
> -			goto unmap_mmio;
> +			goto release_regions;
>   		}
>   
>   		adata->res[0].name = "acp3x_i2s_iomem";
> @@ -80,28 +81,52 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   		adata->res[0].start = addr;
>   		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
>   
> -		adata->res[1].name = "acp3x_i2s_irq";
> -		adata->res[1].flags = IORESOURCE_IRQ;
> -		adata->res[1].start = pci->irq;
> -		adata->res[1].end = pci->irq;
> +		adata->res[1].name = "acp3x_i2s_sp";
> +		adata->res[1].flags = IORESOURCE_MEM;
> +		adata->res[1].start = addr + ACP3x_I2STDM_REG_START;
> +		adata->res[1].end = addr + ACP3x_I2STDM_REG_END;
> +
> +		adata->res[2].name = "acp3x_i2s_bt";
> +		adata->res[2].flags = IORESOURCE_MEM;
> +		adata->res[2].start = addr + ACP3x_BT_TDM_REG_START;
> +		adata->res[2].end = addr + ACP3x_BT_TDM_REG_END;
> +
> +		adata->res[3].name = "acp3x_i2s_irq";
> +		adata->res[3].flags = IORESOURCE_IRQ;
> +		adata->res[3].start = pci->irq;
> +		adata->res[3].end = adata->res[3].start;
>   
>   		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
>   
>   		memset(&pdevinfo, 0, sizeof(pdevinfo));
> -		pdevinfo.name = "acp3x_rv_i2s";
> -		pdevinfo.id = 0;
> -		pdevinfo.parent = &pci->dev;
> -		pdevinfo.num_res = 2;
> -		pdevinfo.res = adata->res;
> -		pdevinfo.data = &irqflags;
> -		pdevinfo.size_data = sizeof(irqflags);
> -
> -		adata->pdev = platform_device_register_full(&pdevinfo);
> -		if (IS_ERR(adata->pdev)) {
> -			dev_err(&pci->dev, "cannot register %s device\n",
> -				pdevinfo.name);
> -			ret = PTR_ERR(adata->pdev);
> -			goto unmap_mmio;
> +		pdevinfo[0].name = "acp3x_rv_i2s_dma";
> +		pdevinfo[0].id = 0;
> +		pdevinfo[0].parent = &pci->dev;
> +		pdevinfo[0].num_res = 4;
> +		pdevinfo[0].res = &adata->res[0];
> +		pdevinfo[0].data = &irqflags;
> +		pdevinfo[0].size_data = sizeof(irqflags);
> +
> +		pdevinfo[1].name = "acp3x_i2s_playcap";
> +		pdevinfo[1].id = 0;
> +		pdevinfo[1].parent = &pci->dev;
> +		pdevinfo[1].num_res = 1;
> +		pdevinfo[1].res = &adata->res[1];
> +
> +		pdevinfo[2].name = "acp3x_i2s_playcap";
> +		pdevinfo[2].id = 1;
> +		pdevinfo[2].parent = &pci->dev;
> +		pdevinfo[2].num_res = 1;
> +		pdevinfo[2].res = &adata->res[2];
> +		for (i = 0; i < ACP3x_DEVS ; i++) {
> +			adata->pdev[i] =
> +				platform_device_register_full(&pdevinfo[i]);
> +			if (IS_ERR(adata->pdev[i])) {
> +				dev_err(&pci->dev, "cannot register %s device\n",
> +					pdevinfo[i].name);
> +				ret = PTR_ERR(adata->pdev[i]);
> +				goto unmap_mmio;
> +			}
>   		}
>   		break;
>   	default:
> @@ -112,10 +137,22 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   	return 0;
>   
>   unmap_mmio:
> +	if (val == I2S_MODE)
> +		for (i = 0 ; i < ACP3x_DEVS ; i++)
> +			platform_device_unregister(adata->pdev[i]);
> +	devm_kfree(&pci->dev, adata->res);
> +	devm_kfree(&pci->dev, adata);
>   	pci_disable_msi(pci);
> -	iounmap(adata->acp3x_base);
> +	pci_release_regions(pci);
> +	pci_disable_device(pci);
>   release_regions:
> +	devm_kfree(&pci->dev, adata);
> +	pci_disable_msi(pci);
>   	pci_release_regions(pci);
> +	pci_disable_device(pci);
> +adata_free:
> +	pci_release_regions(pci);
> +	pci_disable_device(pci);
>   disable_pci:
>   	pci_disable_device(pci);

this error flow is probably wrong, you should not repeat the same 
sequences when going from one label to the other.

it should be something like (not verified, example only)

	devm_kfree(&pci->dev, adata->res);
release_regions:
	devm_kfree(&pci->dev, adata);
    	pci_disable_msi(pci);
adata_free:
	pci_release_regions(pci);
disable_pci:
	pci_disable_device(pci);

Stopping the review here.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
