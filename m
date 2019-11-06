Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4AF1BBD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 17:54:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837CD16C0;
	Wed,  6 Nov 2019 17:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837CD16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573059293;
	bh=zUbltybQTItEq+x15PRpufymtjkwlKSHD3kxK/R6doY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=swjYQD6GD4nBKgOqBoNHQvjDdqd2ry/lM5hJuIUoIGC2dLp7AexXrpKEIvkTQgtmh
	 TOTWFrao/fkCRGC5GHlmEBfBwadMsctHv0ik0i/HsEPv4aZHX+QjBIbecwM+SL51VO
	 6865SF0DdVmKfC/9tPHq0NPk8Xgsi/dSNtqZCFmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D998AF8060D;
	Wed,  6 Nov 2019 17:53:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 360E1F803F4; Wed,  6 Nov 2019 17:53:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93BA6F80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 17:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BA6F80291
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 08:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="353532513"
Received: from pdblomfi-mobl.gar.corp.intel.com (HELO [10.254.107.145])
 ([10.254.107.145])
 by orsmga004.jf.intel.com with ESMTP; 06 Nov 2019 08:52:58 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573137364-5592-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c30bea61-8db4-fb7a-bead-c665f88b3091@linux.intel.com>
Date: Wed, 6 Nov 2019 10:43:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573137364-5592-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v2 7/7] ASoC: amd: Added ACP3x
 system resume and runtime pm ops
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



On 11/7/19 8:36 AM, Ravulapati Vishnu vardhan rao wrote:
> When system wide suspend happens, ACP will be powered off
> and when system resumes,for audio usecase to continue,
> all the runtime configuration data needs to be programmed again.
> Added resume pm call back to ACP pm ops and
> also Added runtime PM operations for ACP3x PCM platform device.
> Device will enter into D3 state when there is no activity
> on audio I2S lines.

spaces after punctuation and use of capital letters at the start of a 
sentence?

> 
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/pci-acp3x.c | 47 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
> index 7727c9d..d567585 100644
> --- a/sound/soc/amd/raven/pci-acp3x.c
> +++ b/sound/soc/amd/raven/pci-acp3x.c
> @@ -9,6 +9,9 @@
>   #include <linux/io.h>
>   #include <linux/platform_device.h>
>   #include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/delay.h>
> +#include <sound/pcm.h>
>   
>   #include "acp3x.h"
>   
> @@ -247,6 +250,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   		}
>   		break;
>   	}
> +	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
> +	pm_runtime_use_autosuspend(&pci->dev);
> +	pm_runtime_set_active(&pci->dev);
> +	pm_runtime_put_noidle(&pci->dev);
> +	pm_runtime_enable(&pci->dev);
>   	return 0;
>   
>   unmap_mmio:
> @@ -268,6 +276,39 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>   	return ret;
>   }
>   
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
> +
> +	return 0;
> +}
> +static int  snd_acp3x_resume(struct device *dev)
> +{
> +	int status;
> +	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
> +
> +	status = acp3x_init(adata->acp3x_base);
> +	if (status) {
> +		dev_err(dev, "ACP init failed\n");
> +		return status;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops acp3x_pm = {
> +	.runtime_suspend = snd_acp3x_suspend,
> +	.runtime_resume =  snd_acp3x_resume,
> +	.resume =       snd_acp3x_resume,
> +};

that should have been combined with the previous patch, you resume inits 
in the platform device resume and only add it to the PCI level here.

> +
>   static void snd_acp3x_remove(struct pci_dev *pci)
>   {
>   	int i, ret;
> @@ -283,7 +324,8 @@ static void snd_acp3x_remove(struct pci_dev *pci)
>   	else
>   		dev_info(&pci->dev, "ACP de-initialized\n");
>   	iounmap(adata->acp3x_base);
> -
> +	pm_runtime_disable(&pci->dev);
> +	pm_runtime_get_noresume(&pci->dev);
>   	pci_disable_msi(pci);
>   	pci_release_regions(pci);
>   	pci_disable_device(pci);
> @@ -302,6 +344,9 @@ static struct pci_driver acp3x_driver  = {
>   	.id_table = snd_acp3x_ids,
>   	.probe = snd_acp3x_probe,
>   	.remove = snd_acp3x_remove,
> +	.driver = {
> +		.pm = &acp3x_pm,
> +	}
>   };
>   
>   module_pci_driver(acp3x_driver);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
