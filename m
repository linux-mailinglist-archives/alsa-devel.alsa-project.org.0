Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8F591211
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 16:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6717F950;
	Fri, 12 Aug 2022 16:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6717F950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660314103;
	bh=elrodQBYvoyAiCUHaz/zd2XJmNYPAM6SM/vqf4Qaa1o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f0l5QsReuuBXZpRYMiYOA+u2yaXQGVLZW079g4KKd+bDq+4to7QI4P6ffyFlkG5eL
	 pWY7TN38SSZn1lZBENDXOlyi1J8uhpahH5d07Hp8sdn8juQRR7yQViC5xmvFBn3+Js
	 jQoHfYWnJdiNzF2L3V4G39PksfIgz+6wy+vA9B6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04230F80553;
	Fri, 12 Aug 2022 16:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 721DAF80552; Fri, 12 Aug 2022 16:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D1FF8054A
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 16:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D1FF8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N4QoXPFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660314012; x=1691850012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=elrodQBYvoyAiCUHaz/zd2XJmNYPAM6SM/vqf4Qaa1o=;
 b=N4QoXPFHfLINYl+3mN4JzPqz6HqpEusBIvnelL5HfeuvSFeOk+QO1tEO
 PrlNQ/QeIHOt9LnCT8CI4CvZ5RgHRtiH9spHrWbKiOnfgODg35E3eZV9S
 ZmSbnytR9LwvMJ4xV7N3Pf/ORhlwuJF2PSqzH19yStl6stDHtOnEsiJV1
 n7m2+R8yIxfYN0Sp+WnaF7rL0Sc7OEumk69+rvq6Tnk62qhSIB5tUf8O0
 rqVQErg4oXGd1NnZ/3dAIwWjZsqMwOB1oEjC6kcriFVUnKRhNuwJOWZ2d
 B0GiA0B0FBj+y0yUzyGN3kT1BeaW1YhQwwMNDNnNCzIDpVZvmN5KXpShP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="290355873"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="290355873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 07:20:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="634655841"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.73])
 ([10.99.241.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 07:20:03 -0700
Message-ID: <f55c444b-d1c7-9d61-1f0c-c6bfe32ca2db@linux.intel.com>
Date: Fri, 12 Aug 2022 16:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/13] ASoC: amd: add platform devices for acp6.2 pdm
 driver and dmic driver
Content-Language: en-US
To: Syed Saba kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
 <20220812120731.788052-5-Syed.SabaKareem@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220812120731.788052-5-Syed.SabaKareem@amd.com>
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
> ACP6.2 IP has PDM decoder block.
> Create a platform device for it, so that the PDM platform driver
> can be bound to this device.
> Pass PCI resources like MMIO to this platform device.
> 
> Create a platform device for generic dmic codec driver.
> 
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/ps/acp62.h  | 23 +++++++++++
>   sound/soc/amd/ps/pci-ps.c | 83 ++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 104 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
> index 8e734f190b11..ab56e1f8c31b 100644
> --- a/sound/soc/amd/ps/acp62.h
> +++ b/sound/soc/amd/ps/acp62.h
> @@ -9,6 +9,10 @@
>   
>   #define ACP_DEVICE_ID 0x15E2
>   #define ACP62_PHY_BASE_ADDRESS 0x1240000
> +#define ACP6x_REG_START		0x1240000
> +#define ACP6x_REG_END		0x1250200
> +#define ACP6x_DEVS		2
> +#define ACP6x_PDM_MODE		1
>   
>   #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
>   #define ACP_PGFSM_CNTL_POWER_ON_MASK	1
> @@ -22,6 +26,25 @@
>   #define ACP_ERROR_MASK 0x20000000
>   #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
>   
> +enum acp_config {
> +	ACP_CONFIG_0 = 0,
> +	ACP_CONFIG_1,
> +	ACP_CONFIG_2,
> +	ACP_CONFIG_3,
> +	ACP_CONFIG_4,
> +	ACP_CONFIG_5,
> +	ACP_CONFIG_6,
> +	ACP_CONFIG_7,
> +	ACP_CONFIG_8,
> +	ACP_CONFIG_9,
> +	ACP_CONFIG_10,
> +	ACP_CONFIG_11,
> +	ACP_CONFIG_12,
> +	ACP_CONFIG_13,
> +	ACP_CONFIG_14,
> +	ACP_CONFIG_15,
> +};
> +
>   static inline u32 acp62_readl(void __iomem *base_addr)
>   {
>   	return readl(base_addr - ACP62_PHY_BASE_ADDRESS);
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 2014f415af15..94201f75427a 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -9,11 +9,16 @@
>   #include <linux/module.h>
>   #include <linux/io.h>
>   #include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
>   
>   #include "acp62.h"
>   
>   struct acp62_dev_data {
>   	void __iomem *acp62_base;
> +	struct resource *res;
> +	bool acp62_audio_mode;
> +	struct platform_device *pdev[ACP6x_DEVS];
>   };
>   
>   static int acp62_power_on(void __iomem *acp_base)
> @@ -117,8 +122,11 @@ static int snd_acp62_probe(struct pci_dev *pci,
>   			   const struct pci_device_id *pci_id)
>   {
>   	struct acp62_dev_data *adata;
> +	struct platform_device_info pdevinfo[ACP6x_DEVS];
> +	int index, ret;
> +	int val = 0x00;
> +	struct acpi_device *adev;
>   	u32 addr;
> -	int ret;
>   
>   	/* Pink Sardine device check */
>   	switch (pci->revision) {
> @@ -157,8 +165,75 @@ static int snd_acp62_probe(struct pci_dev *pci,
>   	ret = acp62_init(adata->acp62_base);
>   	if (ret)
>   		goto release_regions;
> +	val = acp62_readl(adata->acp62_base + ACP_PIN_CONFIG);
> +	switch (val) {
> +	case ACP_CONFIG_0:
> +	case ACP_CONFIG_1:
> +	case ACP_CONFIG_2:
> +	case ACP_CONFIG_3:
> +	case ACP_CONFIG_9:
> +	case ACP_CONFIG_15:
> +		dev_info(&pci->dev, "Audio Mode %d\n", val);
> +		break;
> +	default:
> +
> +		/* Checking DMIC hardware*/
> +		adev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), 0x02, 0);
> +

You can probably remove one level of indentation in following code if 
you do:
		if (!adev)
			break;

> +		if (adev) {
> +			const union acpi_object *obj;
> +
> +			if (!acpi_dev_get_property(adev, "acp-audio-device-type",
> +						   ACPI_TYPE_INTEGER, &obj) &&
> +						   obj->integer.value == 2) {
> +				adata->res = devm_kzalloc(&pci->dev,
> +							  sizeof(struct resource), GFP_KERNEL);
> +
> +				if (!adata->res) {
> +					ret = -ENOMEM;
> +					goto de_init;
> +				}
> +
> +				adata->res->name = "acp_iomem";
> +				adata->res->flags = IORESOURCE_MEM;
> +				adata->res->start = addr;
> +				adata->res->end = addr + (ACP6x_REG_END - ACP6x_REG_START);
> +				adata->acp62_audio_mode = ACP6x_PDM_MODE;
>   
> +				memset(&pdevinfo, 0, sizeof(pdevinfo));
> +				pdevinfo[0].name = "acp_ps_pdm_dma";
> +				pdevinfo[0].id = 0;
> +				pdevinfo[0].parent = &pci->dev;
> +				pdevinfo[0].num_res = 1;
> +				pdevinfo[0].res = adata->res;
> +
> +				pdevinfo[1].name = "dmic-codec";
> +				pdevinfo[1].id = 0;
> +				pdevinfo[1].parent = &pci->dev;
> +
> +				for (index = 0; index < ACP6x_DEVS; index++) {
> +					adata->pdev[index] =
> +						platform_device_register_full(&pdevinfo[index]);
> +
> +					if (IS_ERR(adata->pdev[index])) {
> +						dev_err(&pci->dev,
> +							"cannot register %s device\n",
> +							 pdevinfo[index].name);
> +						ret = PTR_ERR(adata->pdev[index]);
> +						goto unregister_devs;
> +					}
> +				}
> +			}
> +		}
> +		break;
> +	}
>   	return 0;
> +unregister_devs:
> +	for (--index; index >= 0; index--)
> +		platform_device_unregister(adata->pdev[index]);
> +de_init:
> +	if (acp62_deinit(adata->acp62_base))
> +		dev_err(&pci->dev, "ACP de-init failed\n");
>   release_regions:
>   	pci_release_regions(pci);
>   disable_pci:
> @@ -170,9 +245,13 @@ static int snd_acp62_probe(struct pci_dev *pci,
>   static void snd_acp62_remove(struct pci_dev *pci)
>   {
>   	struct acp62_dev_data *adata;
> -	int ret;
> +	int ret, index;
>   
>   	adata = pci_get_drvdata(pci);
> +	if (adata->acp62_audio_mode == ACP6x_PDM_MODE) {
> +		for (index = 0; index < ACP6x_DEVS; index++)
> +			platform_device_unregister(adata->pdev[index]);
> +	}
>   	ret = acp62_deinit(adata->acp62_base);
>   	if (ret)
>   		dev_err(&pci->dev, "ACP de-init failed\n");

