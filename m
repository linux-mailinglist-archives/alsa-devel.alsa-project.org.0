Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82745591210
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 16:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2895F843;
	Fri, 12 Aug 2022 16:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2895F843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660314085;
	bh=7SfuAmb8mmGQTiSG1CTMf6FTKfJ/9PLlg+perjfDTnI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpnz5BFDG5GYcDcTtJt4wXuHqRdIiierj7oq5s0JJomoVCOUoxwieRFDs3Nmafs6+
	 Op6uGdcwgPNWs4Yzwmkf4M+e/XtjnC59fHnQp5YVkY2kkMFYWhT7y2AEDzMbbdWBDG
	 2INfP9SeMe1jIUKhkXYm+3LArozLwxYzjoawJZhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D378AF804A9;
	Fri, 12 Aug 2022 16:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EB88F8026A; Fri, 12 Aug 2022 16:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C64E0F8026A
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 16:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C64E0F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A2Nvuxqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660313999; x=1691849999;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7SfuAmb8mmGQTiSG1CTMf6FTKfJ/9PLlg+perjfDTnI=;
 b=A2Nvuxqbnl3miP2zSSfcAvcy7pbuoHr0GfZ8SeQzDn3/vWzDMCTKkgK5
 /4bjDfhNC8btAp9jeLwGU1vsvPRa16E/yBRF/bQ1DfWFcB1tZqyzJTm9B
 8kQiKdxH+0bZVW+QHjbo/sowuYhGyJxJwh+RyhJZNvXujXo9ByDHmRpU2
 4lAOE0vGA+1tNq0JD0n2GGsGay5FC+4D7BTEQ+QKwG51GPN042uk+Sep/
 QxyIdHZwqdWM5o3GpkzdTdD5qTcJM/Jb8YWyomiyoSuo6u4msFI9efOz4
 ztqYjFwERI3VxbZti3juJKHU3FXDKHlau5dhY46CUdy0viQWv7NWWkuge g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="278554022"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="278554022"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 07:19:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="634655774"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.73])
 ([10.99.241.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 07:19:51 -0700
Message-ID: <08ef0e7e-bc7a-9db5-23a4-4fd4fb70dd9a@linux.intel.com>
Date: Fri, 12 Aug 2022 16:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/13] ASoC: amd: add acp6.2 init/de-init functions
Content-Language: en-US
To: Syed Saba kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
 <20220812120731.788052-4-Syed.SabaKareem@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220812120731.788052-4-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com
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

On 8/12/2022 2:07 PM, Syed Saba kareem wrote:
> Add Pink Sardine platform ACP6.2 PCI driver init/deinit functions.
> 
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/ps/acp62.h  |  12 +++++
>   sound/soc/amd/ps/pci-ps.c | 109 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 121 insertions(+)
> 
> diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
> index e91762240c93..8e734f190b11 100644
> --- a/sound/soc/amd/ps/acp62.h
> +++ b/sound/soc/amd/ps/acp62.h
> @@ -10,6 +10,18 @@
>   #define ACP_DEVICE_ID 0x15E2
>   #define ACP62_PHY_BASE_ADDRESS 0x1240000
>   
> +#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
> +#define ACP_PGFSM_CNTL_POWER_ON_MASK	1
> +#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0
> +#define ACP_PGFSM_STATUS_MASK		3
> +#define ACP_POWERED_ON			0
> +#define ACP_POWER_ON_IN_PROGRESS	1
> +#define ACP_POWERED_OFF			2
> +#define ACP_POWER_OFF_IN_PROGRESS	3
> +
> +#define ACP_ERROR_MASK 0x20000000
> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
> +
>   static inline u32 acp62_readl(void __iomem *base_addr)
>   {
>   	return readl(base_addr - ACP62_PHY_BASE_ADDRESS);
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 25169797275c..2014f415af15 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -8,6 +8,7 @@
>   #include <linux/pci.h>
>   #include <linux/module.h>
>   #include <linux/io.h>
> +#include <linux/delay.h>
>   
>   #include "acp62.h"
>   
> @@ -15,6 +16,103 @@ struct acp62_dev_data {
>   	void __iomem *acp62_base;
>   };
>   
> +static int acp62_power_on(void __iomem *acp_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	val = acp62_readl(acp_base + ACP_PGFSM_STATUS);
> +
> +	if (!val)
> +		return val;
> +
> +	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
> +		acp62_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp62_readl(acp_base + ACP_PGFSM_STATUS);
> +		if (!val)
> +			return 0;
> +		udelay(1);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp62_reset(void __iomem *acp_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	acp62_writel(1, acp_base + ACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp62_readl(acp_base + ACP_SOFT_RESET);
> +		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
> +			break;
> +		cpu_relax();
> +	}
> +	acp62_writel(0, acp_base + ACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp62_readl(acp_base + ACP_SOFT_RESET);
> +		if (!val)
> +			return 0;
> +		cpu_relax();
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static void acp62_enable_interrupts(void __iomem *acp_base)
> +{
> +	acp62_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);

In function before you just write decimal 1 and 0, and here and later in 
patch you use hex values? Should probably be consistent.

> +}
> +
> +static void acp62_disable_interrupts(void __iomem *acp_base)
> +{
> +	acp62_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
> +		     ACP_EXTERNAL_INTR_STAT);
> +	acp62_writel(0x00, acp_base + ACP_EXTERNAL_INTR_CNTL);
> +	acp62_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static int acp62_init(void __iomem *acp_base)
> +{
> +	int ret;
> +
> +	/* power on */
Unnecessary comment? Called function name is already self explanatory, 
no need to repeat it.
> +	ret = acp62_power_on(acp_base);
> +	if (ret) {
> +		pr_err("ACP power on failed\n");
> +		return ret;
> +	}
> +	acp62_writel(0x01, acp_base + ACP_CONTROL);
> +	/* Reset */
Same here?
> +	ret = acp62_reset(acp_base);
> +	if (ret) {
> +		pr_err("ACP reset failed\n");
> +		return ret;
> +	}
> +	acp62_writel(0x03, acp_base + ACP_CLKMUX_SEL);
> +	acp62_enable_interrupts(acp_base);
> +	return 0;
> +}
> +
> +static int acp62_deinit(void __iomem *acp_base)
> +{
> +	int ret;
> +
> +	acp62_disable_interrupts(acp_base);
> +	/* Reset */
Again
> +	ret = acp62_reset(acp_base);
> +	if (ret) {
> +		pr_err("ACP reset failed\n");
> +		return ret;
> +	}
> +	acp62_writel(0x00, acp_base + ACP_CLKMUX_SEL);
> +	acp62_writel(0x00, acp_base + ACP_CONTROL);
> +	return 0;
> +}
> +
>   static int snd_acp62_probe(struct pci_dev *pci,
>   			   const struct pci_device_id *pci_id)
>   {
> @@ -56,6 +154,10 @@ static int snd_acp62_probe(struct pci_dev *pci,
>   	}
>   	pci_set_master(pci);
>   	pci_set_drvdata(pci, adata);
> +	ret = acp62_init(adata->acp62_base);
> +	if (ret)
> +		goto release_regions;
> +
>   	return 0;
>   release_regions:
>   	pci_release_regions(pci);
> @@ -67,6 +169,13 @@ static int snd_acp62_probe(struct pci_dev *pci,
>   
>   static void snd_acp62_remove(struct pci_dev *pci)
>   {
> +	struct acp62_dev_data *adata;
> +	int ret;
> +
> +	adata = pci_get_drvdata(pci);
> +	ret = acp62_deinit(adata->acp62_base);
> +	if (ret)
> +		dev_err(&pci->dev, "ACP de-init failed\n");
>   	pci_release_regions(pci);
>   	pci_disable_device(pci);
>   }

