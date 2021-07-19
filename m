Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F71C3CEAF7
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 20:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4491662;
	Mon, 19 Jul 2021 20:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4491662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626719238;
	bh=W5FZC5YiULn3apcmunDg82f3EeXtcCnULPuMVgWXLFE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUE6/7goPAZIxKZpux+8EIu7AtLt99tZVV5r9+rJfkQ39uhWY41Lao0yVVwsYskck
	 hkJCfhn94ioPu1qM4Aw1rkEC796yVeXz0O6L9pBHCyOxXO2zVUGsLIoNI3nfLHaY09
	 p2ngit058++C/0uahQb8zGSOAV5mIrU24sy1k1jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89125F804E3;
	Mon, 19 Jul 2021 20:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6CBF804E2; Mon, 19 Jul 2021 20:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66596F80256
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 20:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66596F80256
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190697627"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="190697627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:24:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="414430038"
Received: from rraymond-mobl1.amr.corp.intel.com (HELO [10.209.130.70])
 ([10.209.130.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:24:30 -0700
Subject: Re: [PATCH V3 04/12] ASoC: amd: create acp5x platform devices
To: Vijendar Mukunda <vijendar.mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210719165140.16143-1-vijendar.mukunda@amd.com>
 <20210719165140.16143-5-vijendar.mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <035b3dbe-bbe0-bf0b-3893-d176418658f7@linux.intel.com>
Date: Mon, 19 Jul 2021 13:07:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719165140.16143-5-vijendar.mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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



On 7/19/21 11:51 AM, Vijendar Mukunda wrote:
> ACP5.x IP has multiple I2S controllers and DMA controller.
> Create platform devices for I2S HS controller instance, I2S SP controller
> instance and DMA contrller.

typo: controller

> Pass PCI resources like MMIO, irq to these platform devices.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/vangogh/acp5x.h     | 10 ++++
>  sound/soc/amd/vangogh/pci-acp5x.c | 95 ++++++++++++++++++++++++++++++-
>  2 files changed, 102 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
> index 708586109315..bbf29fd2b12f 100644
> --- a/sound/soc/amd/vangogh/acp5x.h
> +++ b/sound/soc/amd/vangogh/acp5x.h
> @@ -22,6 +22,16 @@
>  #define ACP_ERR_INTR_MASK	0x20000000
>  #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
>  
> +#define ACP5x_DEVS 0x03

3?

> +#define	ACP5x_REG_START	0x1240000
> +#define	ACP5x_REG_END	0x1250200
> +#define ACP5x_I2STDM_REG_START	0x1242400
> +#define ACP5x_I2STDM_REG_END	0x1242410
> +#define ACP5x_HS_TDM_REG_START	0x1242814
> +#define ACP5x_HS_TDM_REG_END	0x1242824
> +#define I2S_MODE 0x00
> +#define ACP5x_I2S_MODE 0x00
> +
>  /* common header file uses exact offset rather than relative
>   * offset which requires substraction logic from base_addr

typo: subtraction

>   * for accessing ACP5x MMIO space registers
> diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
> index 523b962fe35e..3cc15a15b745 100644
> --- a/sound/soc/amd/vangogh/pci-acp5x.c
> +++ b/sound/soc/amd/vangogh/pci-acp5x.c
> @@ -8,11 +8,16 @@
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
>  
>  #include "acp5x.h"
>  
>  struct acp5x_dev_data {
>  	void __iomem *acp5x_base;
> +	bool acp5x_audio_mode;
> +	struct resource *res;
> +	struct platform_device *pdev[3];

pdev[ACP5x_DEVS] ?

>  };
>  
>  static int acp5x_power_on(void __iomem *acp5x_base)
> @@ -114,9 +119,12 @@ static int snd_acp5x_probe(struct pci_dev *pci,
>  			   const struct pci_device_id *pci_id)
>  {
>  	struct acp5x_dev_data *adata;
> -	int ret;
> -	u32 addr;
> +	struct platform_device_info pdevinfo[3];
> +	unsigned int irqflags;
> +	int ret, i;
> +	u32 addr, val;
>  
> +	irqflags = IRQF_SHARED;
>  	if (pci->revision != 0x50)
>  		return -ENODEV;
>  
> @@ -150,6 +158,83 @@ static int snd_acp5x_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto release_regions;
>  
> +	val = acp_readl(adata->acp5x_base + ACP_PIN_CONFIG);
> +	switch (val) {
> +	case I2S_MODE:
> +		adata->res = devm_kzalloc(&pci->dev,
> +					  sizeof(struct resource) * 4,

what is this 4 value?

> +					  GFP_KERNEL);
> +		if (!adata->res) {
> +			ret = -ENOMEM;
> +			goto de_init;
> +		}
> +
> +		adata->res[0].name = "acp5x_i2s_iomem";
> +		adata->res[0].flags = IORESOURCE_MEM;
> +		adata->res[0].start = addr;
> +		adata->res[0].end = addr + (ACP5x_REG_END - ACP5x_REG_START);
> +
> +		adata->res[1].name = "acp5x_i2s_sp";
> +		adata->res[1].flags = IORESOURCE_MEM;
> +		adata->res[1].start = addr + ACP5x_I2STDM_REG_START;
> +		adata->res[1].end = addr + ACP5x_I2STDM_REG_END;
> +
> +		adata->res[2].name = "acp5x_i2s_hs";
> +		adata->res[2].flags = IORESOURCE_MEM;
> +		adata->res[2].start = addr + ACP5x_HS_TDM_REG_START;
> +		adata->res[2].end = addr + ACP5x_HS_TDM_REG_END;
> +
> +		adata->res[3].name = "acp5x_i2s_irq";
> +		adata->res[3].flags = IORESOURCE_IRQ;
> +		adata->res[3].start = pci->irq;
> +		adata->res[3].end = adata->res[3].start;
> +
> +		adata->acp5x_audio_mode = ACP5x_I2S_MODE;
> +
> +		memset(&pdevinfo, 0, sizeof(pdevinfo));
> +		pdevinfo[0].name = "acp5x_i2s_dma";
> +		pdevinfo[0].id = 0;
> +		pdevinfo[0].parent = &pci->dev;
> +		pdevinfo[0].num_res = 4;
> +		pdevinfo[0].res = &adata->res[0];
> +		pdevinfo[0].data = &irqflags;
> +		pdevinfo[0].size_data = sizeof(irqflags);
> +
> +		pdevinfo[1].name = "acp5x_i2s_playcap";
> +		pdevinfo[1].id = 0;
> +		pdevinfo[1].parent = &pci->dev;
> +		pdevinfo[1].num_res = 1;
> +		pdevinfo[1].res = &adata->res[1];
> +
> +		pdevinfo[2].name = "acp5x_i2s_playcap";
> +		pdevinfo[2].id = 1;
> +		pdevinfo[2].parent = &pci->dev;
> +		pdevinfo[2].num_res = 1;
> +		pdevinfo[2].res = &adata->res[2];
> +
> +		for (i = 0; i < ACP5x_DEVS; i++) {
> +			adata->pdev[i] =
> +				platform_device_register_full(&pdevinfo[i]);
> +			if (IS_ERR(adata->pdev[i])) {
> +				dev_err(&pci->dev, "cannot register %s device\n",
> +					pdevinfo[i].name);
> +				ret = PTR_ERR(adata->pdev[i]);
> +				goto unregister_devs;
> +			}
> +		}
> +		break;
> +	default:
> +		dev_info(&pci->dev, "ACP audio mode : %d\n", val);
> +	}
> +	return 0;
> +
> +unregister_devs:
> +	if (val == I2S_MODE)

nit-pick: you can't reach this point outside of the I2S_MODE, so this test is not useful


> +		for (i = 0; i < ACP5x_DEVS; i++)
> +			platform_device_unregister(adata->pdev[i]);

only unregister what you registered?

for (--i; i > 0; i--)

> +de_init:
> +	if (acp5x_deinit(adata->acp5x_base))
> +		dev_err(&pci->dev, "ACP de-init failed\n");
>  release_regions:
>  	pci_release_regions(pci);
>  disable_pci:
> @@ -161,9 +246,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
>  static void snd_acp5x_remove(struct pci_dev *pci)
>  {
>  	struct acp5x_dev_data *adata;
> -	int ret;
> +	int i, ret;
>  
>  	adata = pci_get_drvdata(pci);
> +	if (adata->acp5x_audio_mode == ACP5x_I2S_MODE) {
> +		for (i = 0; i < ACP5x_DEVS; i++)
> +			platform_device_unregister(adata->pdev[i]);
> +	}
>  	ret = acp5x_deinit(adata->acp5x_base);
>  	if (ret)
>  		dev_err(&pci->dev, "ACP de-init failed\n");
> 
