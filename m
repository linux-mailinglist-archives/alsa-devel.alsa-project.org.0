Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB3207BD6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 20:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6623F18B2;
	Wed, 24 Jun 2020 20:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6623F18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593025065;
	bh=DZ2kbG9urYV0E43KVtSrRIn0vwitF7O28mAWuhXImKA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hel6+jqCDbVWCjlVTFLH2O5UTzR8az+wGQsQg+WYvF1tX7Vtb0zitFu1/RuU2doxl
	 bFKqZZ3oqWHzi+m52ujkA7K+evhpZMmdemwP+tb9thRcqmCXCoC1kAAOQ0DIR+2oWy
	 bVqokMGdGfka4wphOzKv2z5xX+nPW75VcoIk1DgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94736F8015B;
	Wed, 24 Jun 2020 20:56:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1F29F8015A; Wed, 24 Jun 2020 20:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88FEBF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 20:55:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 750CCA003F;
 Wed, 24 Jun 2020 20:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 750CCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593024954; bh=yA9SzuFSGDLyG2J9swRwCnPzRODDVukJio3yerv7Urs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ke+LWn0zlpTEQt8bAHxyupHf82uTStPciGsGW6C79FjeXOX2D/24iQIRmNjcPqu1I
 QuDk7Nk6g249UlEIPAHP66LvpUrd0HGSYmCO4qxUpGdMSEoH+qyVeZHZDcFAzA0Jrv
 l6xjDBpE0Bjc3YyV+n9bLcvsPpYBZ32i3ihbLPE0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Jun 2020 20:55:45 +0200 (CEST)
Subject: Re: [PATCH V3] ASoC: amd: add logic to check dmic hardware runtime
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org
References: <1593025336-21482-1-git-send-email-Vijendar.Mukunda@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <94c72bc7-6448-6d6f-d59d-4d6b30d20107@perex.cz>
Date: Wed, 24 Jun 2020 20:55:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593025336-21482-1-git-send-email-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com, hui.wang@canonical.com,
 Virendra-Pratap.Arya@amd.com, Mark Brown <broonie@kernel.org>
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

Dne 24. 06. 20 v 21:02 Vijendar Mukunda napsal(a):
> Add logic to check DMIC hardware exists or not on
> the platform at runtime.
> 
> Add module param for overriding DMIC hardware check
> at runtime.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> ---
> v3: changed  dmic_acpi_check module param as bint
> v2: changed module param usage -1 as default, 0 - skip, 1 - force
>   sound/soc/amd/renoir/rn-pci-acp3x.c | 29 +++++++++++++++++++++++++++++
>   sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index 859ed67..d1faea5 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -5,6 +5,7 @@
>   //Copyright 2020 Advanced Micro Devices, Inc.
>   
>   #include <linux/pci.h>
> +#include <linux/acpi.h>
>   #include <linux/module.h>
>   #include <linux/io.h>
>   #include <linux/delay.h>
> @@ -18,6 +19,16 @@ static int acp_power_gating;
>   module_param(acp_power_gating, int, 0644);
>   MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
>   
> +/**
> + * dmic_acpi_check = -1 - Checks ACPI method to know DMIC hardware status runtime
> + *                 = 0 - Skips the DMIC device creation and returns probe failure
> + *                 = 1 - Assumes that platform has DMIC support and skips ACPI
> + *                       method check
> + */
> +static int dmic_acpi_check = ACP_DMIC_AUTO;
> +module_param(dmic_acpi_check, bint, 0644);
> +MODULE_PARM_DESC(dmic_acpi_check, "checks Dmic hardware runtime");
> +
>   struct acp_dev_data {
>   	void __iomem *acp_base;
>   	struct resource *res;
> @@ -157,6 +168,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>   {
>   	struct acp_dev_data *adata;
>   	struct platform_device_info pdevinfo[ACP_DEVS];
> +	acpi_handle handle;
> +	acpi_integer dmic_status;
>   	unsigned int irqflags;
>   	int ret, index;
>   	u32 addr;
> @@ -201,6 +214,22 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>   	if (ret)
>   		goto disable_msi;
>   
> +	if (!dmic_acpi_check) {
> +		ret = -ENODEV;
> +		goto de_init;
> +	} else if (dmic_acpi_check == ACP_DMIC_AUTO) {
> +		handle = ACPI_HANDLE(&pci->dev);
> +		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
> +		if (ACPI_FAILURE(ret)) {
> +			ret = -EINVAL;
> +			goto de_init;
> +		}
> +		if (!dmic_status) {
> +			ret = -ENODEV;
> +			goto de_init;
> +		}
> +	}
> +
>   	adata->res = devm_kzalloc(&pci->dev,
>   				  sizeof(struct resource) * 2,
>   				  GFP_KERNEL);
> diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
> index 75228e3..1462039 100644
> --- a/sound/soc/amd/renoir/rn_acp3x.h
> +++ b/sound/soc/amd/renoir/rn_acp3x.h
> @@ -55,6 +55,8 @@
>   
>   #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
>   #define MIN_BUFFER MAX_BUFFER
> +#define	ACP_DMIC_AUTO   -1
> +
>   struct pdm_dev_data {
>   	u32 pdm_irq;
>   	void __iomem *acp_base;
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
