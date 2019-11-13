Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FAFB647
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 18:21:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6B01679;
	Wed, 13 Nov 2019 18:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6B01679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573665718;
	bh=8tYlej7A7ewYUnh7In30LfUtB33ityUw5WgV4vt+Vtw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luAn9jcuafdJ4Z2HEeflukdR0p9QTfS82A7D3gwgNlfQQ1+aFDtYjoorc3VuDZs95
	 igOD0kzZzOs49kyR34gZq1d9cXtgFYgsrQda8FdWjXRykVKtUroXqYSnfzfSdmaFl6
	 rEmcSN3prUzZFATj/j4+dRz7ejxLUejaqdOZJOm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1E4F800CE;
	Wed, 13 Nov 2019 18:18:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06FDDF800BC; Wed, 13 Nov 2019 18:18:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D66DF80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 18:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D66DF80088
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 09:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="229813256"
Received: from dmsnyder-mobl1.amr.corp.intel.com (HELO [10.252.193.15])
 ([10.252.193.15])
 by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 09:18:13 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573629249-13272-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573629249-13272-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7161a222-8e88-704b-0a3e-a468a2639e4f@linux.intel.com>
Date: Wed, 13 Nov 2019 10:39:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573629249-13272-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sanju R Mehta <sanju.mehta@amd.com>, Mark Brown <broonie@kernel.org>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
> index 01b283a..c40f960 100644
> --- a/sound/soc/amd/raven/acp3x.h
> +++ b/sound/soc/amd/raven/acp3x.h
> @@ -7,6 +7,7 @@
>   
>   #include "chip_offset_byte.h"
>   
> +#define DELAY	600

you probably want a prefix here to avoid conflicts


> +static int acp3x_power_on(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout = 0;
> +	int ret = 0;
> +
> +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +
> +	if (val == 0)
> +		return val;
> +
> +	if (!((val & ACP_PGFSM_STATUS_MASK) ==
> +				ACP_POWER_ON_IN_PROGRESS))
> +		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> +			acp3x_base + mmACP_PGFSM_CONTROL);
> +	while (++timeout < DELAY) {

so here timeout can reach 600.

> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +		if (!val)
> +			break;
> +		udelay(1);
> +		if (timeout > 500) {

but here you abort at 500.
Looks like the first test is not needed?

> +			pr_err("ACP is Not Powered ON\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +}
> +static int acp3x_power_off(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout = 0;
> +
> +	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
> +			acp3x_base + mmACP_PGFSM_CONTROL);
> +	while (++timeout < DELAY) {

same here

> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
> +			return 0;
> +		udelay(1);
> +		if (timeout > 500) {
> +			pr_err("ACP is Not Powered OFF\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +}
> +static int acp3x_reset(void __iomem *acp3x_base)
> +{
> +	u32 val, timeout;
> +
> +	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < DELAY) {
> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> +		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
> +							timeout > 100) {

and here

> +			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
> +				break;
> +			return -ENODEV;
> +		}
> +		cpu_relax();
> +	}
> +	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < DELAY) {
> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> +		if (!val)
> +			break;
> +		if (timeout > 100)

and here.


> @@ -133,9 +248,19 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   		ret = -ENODEV;
>   		goto unmap_mmio;
>   	}
> +	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);

I think it's the largest value I've ever seen for autosuspend.
It is necessary? If yes you should document why.

> +	pm_runtime_use_autosuspend(&pci->dev);
> +	pm_runtime_set_active(&pci->dev);
> +	pm_runtime_put_noidle(&pci->dev);
> +	pm_runtime_enable(&pci->dev);
>   	return 0;
>   
>   unmap_mmio:
> +	ret = acp3x_deinit(adata->acp3x_base);
> +	if (ret)
> +		dev_err(&pci->dev, "ACP de-init failed\n");
> +	else
> +		dev_info(&pci->dev, "ACP de-initialized\n");

dev_dbg?

>   	pci_disable_msi(pci);
>   	for (i = 0 ; i < ACP3x_DEVS ; i++)
>   		platform_device_unregister(adata->pdev[i]);
> @@ -148,23 +273,57 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   
>   	return ret;
>   }
> +static int  snd_acp3x_suspend(struct device *dev)
> +{
> +	int status;
> +	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
> +
> +	status = acp3x_deinit(adata->acp3x_base);
> +	if (status)
> +		dev_err(dev, "ACP de-init failed\n");
> +	else
> +		dev_info(dev, "ACP de-initialized\n");

dev_dbg?


>   static void snd_acp3x_remove(struct pci_dev *pci)
>   {
> -	int i;
> +	int i, ret;
>   	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
>   
>   	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
>   		for (i = 0 ; i <  ACP3x_DEVS ; i++)
>   			platform_device_unregister(adata->pdev[i]);
>   	}
> +	ret = acp3x_deinit(adata->acp3x_base);
> +	if (ret)
> +		dev_err(&pci->dev, "ACP de-init failed\n");
> +	else
> +		dev_info(&pci->dev, "ACP de-initialized\n");

dev_dbg?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
