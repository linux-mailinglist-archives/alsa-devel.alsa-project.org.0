Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C272480B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 17:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C70822;
	Tue,  6 Jun 2023 17:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C70822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686066113;
	bh=+Yd7V++zdvA2vEUkR1sYRPT7hNptU858SN5zGbFEXrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SbwfF3NTG3uujfKDsBwMk3XzcuqYtE94cZYo93c+O6sM8COcHlGPvhEYMtS6E5Wwu
	 FkWp97DK0gGmDfMgl6u1tDmVU2udafmQG0pa8UfglQMdwD7XyuG9Q/AOd1dlX7wewa
	 DbxbU6nJ9R2ljrRtdVuK+r71HAhZIedFAZzcyalo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE3D2F80254; Tue,  6 Jun 2023 17:40:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A30CF80290;
	Tue,  6 Jun 2023 17:40:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F2E3F80494; Tue,  6 Jun 2023 17:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E60BEF800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 17:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60BEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TwzyV5dZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686066025; x=1717602025;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Yd7V++zdvA2vEUkR1sYRPT7hNptU858SN5zGbFEXrY=;
  b=TwzyV5dZjPNKDyT1lX8de+pvutymGTutF29p5sfmi4ix6/FwJln0XFjY
   8a6tX9yXHFJ7DMEZi+56T6ERRb8fzE+1+ve06kKhAIC+AK3U2zbO40gnA
   pOZkoGxnUXxderz+h4+tEJm+LOxIvG1U7EDvnZK0oFfNXL2GtYGFGx2ah
   a4iJW22iGjfLvf/6zmeWM0DjQ8msKChO0+TKZenevyrfGKaTR/IcmuQzp
   rRJWatClOv8OY2C+TCpcqKyK5gAe9AyPWilxgtB6br5e5GgPb31imXe/R
   4gBtaOPrKLVZAnT7DHMunoNn43lB5CxMJym0na5WbOA/PsPckNNgj2yRT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422550126"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="422550126"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="955816512"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="955816512"
Received: from pdonvalk-mobl2.amr.corp.intel.com (HELO [10.255.231.168])
 ([10.255.231.168])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:06 -0700
Message-ID: <00aeb130-b3d0-ebab-51da-4e590eef8c7b@linux.intel.com>
Date: Tue, 6 Jun 2023 09:00:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V3 1/9] ASoC: amd: ps: create platform devices based on
 acp config
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
 <20230606060724.2038680-2-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230606060724.2038680-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CGOB6RGM7IZPXP5W74YDBZWFQ6DCSULB
X-Message-ID-Hash: CGOB6RGM7IZPXP5W74YDBZWFQ6DCSULB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGOB6RGM7IZPXP5W74YDBZWFQ6DCSULB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +/**
> + * acp_pdev_mask corresponds to platform device mask based on audio endpoint combinations.
> + * acp_pdev_mask will be calculated based on ACPI Scan under ACP PCI device and
> + * ACP PIN Configuration.
> + * Based acp_pdev_mask, platform devices will be created.
> + * Below are possible platform device combinations.
> + * 1) ACP PDM Controller, dmic-codec, machine driver platform device node
> + * 2) ACP PDM Controller , dmic-codec, SW0 SoundWire manager instance, platform device for
> + *    SoundWire DMA driver
> + * 3) SW0, SW1 SoundWire manager instances, platform device for SoundWire DMA driver
> + * 4) ACP PDM Controller, dmic-codec, SDW0, SDW1 manager instances, platform device for
> + *    SoundWire DMA driver
> + * ACP63_PDM_DEV_MASK corresponds to platform device mask for ACP PDM controller.
> + * ACP63_SDW_DEV_MASK corresponds to platform device mask for SDW manager instances.
> + * ACP63_SDW_PDM_DEV_MASK corresponds to platform device mask for ACP PDM + SDW manager combination
> + */
> +enum acp_pdev_mask {
> +	ACP63_PDM_DEV_MASK = 1,
> +	ACP63_SDW_DEV_MASK,
> +	ACP63_SDW_PDM_DEV_MASK,
> +};

This does not look like a mask, the definitions prevent bit-wise
operations from happening.

Either use BIT(0), BIT(1), BIT(2) or GENMASK(1, 0), or demote this to a
regular enum (e.g. pdev_config or something)

> +
>  struct pdm_stream_instance {
>  	u16 num_pages;
>  	u16 channels;
> @@ -95,14 +144,38 @@ struct pdm_dev_data {
>  	struct snd_pcm_substream *capture_stream;
>  };
>  
> +/**
> + * struct acp63_dev_data - acp pci driver context
> + * @acp63_base: acp mmio base
> + * @res: resource
> + * @pdev: array of child platform device node structures
> + * @acp_lock: used to protect acp common registers
> + * @sdw_fw_node: SoundWire controller fw node handle
> + * @pdev_mask: platform device mask
> + * @pdev_count: platform devices count
> + * @pdm_dev_index: pdm platform device index
> + * @sdw_manager_count: SoundWire manager instance count
> + * @sdw0_dev_index: SoundWire Manager-0 platform device index
> + * @sdw1_dev_index: SoundWire Manager-1 platform device index
> + * @sdw_dma_dev_index: SoundWire DMA controller platform device index
> + * @acp_reset: flag set to true when bus reset is applied across all
> + * the active SoundWire manager instances
> + */
> +
>  struct acp63_dev_data {
>  	void __iomem *acp63_base;
>  	struct resource *res;
>  	struct platform_device *pdev[ACP63_DEVS];
>  	struct mutex acp_lock; /* protect shared registers */
> +	struct fwnode_handle *sdw_fw_node;
>  	u16 pdev_mask;
>  	u16 pdev_count;
>  	u16 pdm_dev_index;
> +	u8 sdw_manager_count;
> +	u16 sdw0_dev_index;
> +	u16 sdw1_dev_index;
> +	u16 sdw_dma_dev_index;
> +	bool acp_reset;
>  };
>  
>  int snd_amd_acp_find_config(struct pci_dev *pci);
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 54752d6040d6..816c22e7f1ab 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/pci.h>
> +#include <linux/bitops.h>
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/delay.h>
> @@ -15,6 +16,7 @@
>  #include <sound/pcm_params.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/iopoll.h>
> +#include <linux/soundwire/sdw_amd.h>
>  
>  #include "acp63.h"
>  
> @@ -119,37 +121,162 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>  	return IRQ_NONE;
>  }
>  
> -static void get_acp63_device_config(u32 config, struct pci_dev *pci,
> -				    struct acp63_dev_data *acp_data)
> +static int sdw_amd_scan_controller(struct device *dev)
> +{
> +	struct acp63_dev_data *acp_data;
> +	struct fwnode_handle *link;
> +	char name[32];
> +	u32 sdw_manager_bitmap;
> +	u8 count = 0;
> +	u32 acp_sdw_power_mode = 0;
> +	int index;
> +	int ret;
> +
> +	acp_data = dev_get_drvdata(dev);
> +	acp_data->acp_reset = true;
> +	/* Found controller, find links supported */
> +	ret = fwnode_property_read_u32_array((acp_data->sdw_fw_node), "mipi-sdw-manager-list",
> +					     &sdw_manager_bitmap, 1);

IIRC this is only defined in the DisCo 2.0 spec, previous editions had a
'mipi-master-count'. A comment would not hurt to point to the minimal
DisCo spec version.

> +
> +	if (ret) {
> +		dev_err(dev, "Failed to read mipi-sdw-manager-list: %d\n", ret);
> +		return -EINVAL;
> +	}
> +	count = hweight32(sdw_manager_bitmap);
> +	/* Check count is within bounds */
> +	if (count > AMD_SDW_MAX_MANAGERS) {
> +		dev_err(dev, "Manager count %d exceeds max %d\n", count, AMD_SDW_MAX_MANAGERS);
> +		return -EINVAL;
> +	}
> +
> +	if (!count) {
> +		dev_dbg(dev, "No SoundWire Managers detected\n");
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "ACPI reports %d SoundWire Manager devices\n", count);
> +	acp_data->sdw_manager_count = count;
> +	for (index = 0; index < count; index++) {
> +		snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", index);
> +		link = fwnode_get_named_child_node(acp_data->sdw_fw_node, name);
> +		if (!link) {
> +			dev_err(dev, "Manager node %s not found\n", name);
> +			return -EIO;
> +		}
> +
> +		ret = fwnode_property_read_u32(link, "amd-sdw-power-mode", &acp_sdw_power_mode);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * when SoundWire configuration is selected from acp pin config,
> +		 * based on manager instances count, acp init/de-init sequence should be
> +		 * executed as part of PM ops only when Bus reset is applied for the active
> +		 * SoundWire manager instances.
> +		 */
> +		if (acp_sdw_power_mode != AMD_SDW_POWER_OFF_MODE) {
> +			acp_data->acp_reset = false;
> +			return 0;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int get_acp63_device_config(u32 config, struct pci_dev *pci, struct acp63_dev_data *acp_data)
>  {
>  	struct acpi_device *dmic_dev;
> +	struct acpi_device *sdw_dev;
>  	const union acpi_object *obj;
>  	bool is_dmic_dev = false;
> +	bool is_sdw_dev = false;
> +	int ret;
>  
>  	dmic_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_DMIC_ADDR, 0);
>  	if (dmic_dev) {
> +		/* is_dmic_dev flag will be set when ACP PDM controller device exists */
>  		if (!acpi_dev_get_property(dmic_dev, "acp-audio-device-type",

usually properties start with the 'mipi-' or 'vendor-' prefix. Is there
a missing 'amd-' here or is 'acp-' unique enough?
