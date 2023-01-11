Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414F2665C81
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 14:29:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7CACE77D;
	Wed, 11 Jan 2023 14:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7CACE77D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673443755;
	bh=k7MGDdueXV0hxglws6KfXGvJ46M4lOKkMqZznlffKp0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Djf5FRk8E54wWLOgvsRtZF4dKG6aLNMKtBJs7gbeJ4bxp0RW30I2MpzzLhUqbPO4X
	 4hRjyOAPjZuPXFzKWEyfTEBMD1dyX8RqO6dfFMJTYZhBWYTBrP1py5ThQ1JCdpSF0M
	 IAMmlsof22lBw7VRDh20ETkmE4uyjFRTd6ObrfuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DE5F80424;
	Wed, 11 Jan 2023 14:28:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3C5F8030F; Wed, 11 Jan 2023 14:28:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70A87F8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70A87F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TQQhbHCm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673443687; x=1704979687;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k7MGDdueXV0hxglws6KfXGvJ46M4lOKkMqZznlffKp0=;
 b=TQQhbHCmXUJPr5kiero7QRR0SJyknuNAiE+2RQ3SzDWCRUdAd8MEPIQu
 r6USRCJSu03TpkY7oxoBl/GLfHG0dcIReS7uGy3DqSmvM7C0hqaXwG1e5
 JbHwX3l9TRiJnY/1NZG2drdwCixfojcXDBMNpC51oHcpEySYhKDVt9oey
 U3/mcAiBK/uO+TGslP3/QMZgZM8m9V7gfN3M544t6iQZozMkbWYaa+Iyl
 mMRkFQkHFozrltpvB437r7hlgJBa/SkRwq9uz/X5pYYF284ZQGb+Dwoij
 eOzXlfdkqSZmIeSOZrVdHPxCGx8AECqhP8Z5L51VXwM7Iy+IhywLvq8ej A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409655477"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="409655477"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:27:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831360000"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="831360000"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:27:08 -0800
Message-ID: <f7ca6b33-19b2-7a59-da0c-c34e441e0063@linux.intel.com>
Date: Wed, 11 Jan 2023 14:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/19] ASoC: amd: ps: create platform devices based on acp
 config
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Mario.Limonciello@amd.com,
 arungopal.kondaveeti@amd.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/11/2023 10:02 AM, Vijendar Mukunda wrote:
> Create platform devices for sdw controllers and PDM controller
> based on ACP pin config selection and ACPI fw handle for
> pink sardine platform.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>   include/linux/soundwire/sdw_amd.h |  18 +++
>   sound/soc/amd/ps/acp63.h          |  24 ++-
>   sound/soc/amd/ps/pci-ps.c         | 248 ++++++++++++++++++++++++++++--
>   3 files changed, 277 insertions(+), 13 deletions(-)
>   create mode 100644 include/linux/soundwire/sdw_amd.h
> 

...

> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index e86f23d97584..85154cf0b2a2 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -14,6 +14,7 @@
>   #include <linux/interrupt.h>
>   #include <sound/pcm_params.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/soundwire/sdw_amd.h>
>   
>   #include "acp63.h"
>   
> @@ -134,12 +135,68 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>   	return IRQ_NONE;
>   }
>   
> -static void get_acp63_device_config(u32 config, struct pci_dev *pci,
> -				    struct acp63_dev_data *acp_data)
> +static int sdw_amd_scan_controller(struct device *dev)
> +{
> +	struct acp63_dev_data *acp_data;
> +	struct fwnode_handle *link;
> +	char name[32];
> +	u8 count = 0;
> +	u32 acp_sdw_power_mode = 0;
> +	int index;
> +	int ret;
> +
> +	acp_data = dev_get_drvdata(dev);
> +	acp_data->acp_sdw_power_off = true;
> +	/* Found controller, find links supported */
> +	ret = fwnode_property_read_u8_array((acp_data->sdw_fw_node),
> +					    "mipi-sdw-master-count", &count, 1);
> +
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to read mipi-sdw-master-count: %d\n", ret);
> +		return -EINVAL;
> +	}
> +
> +	/* Check count is within bounds */
> +	if (count > AMD_SDW_MAX_CONTROLLERS) {
> +		dev_err(dev, "Controller count %d exceeds max %d\n",
> +			count, AMD_SDW_MAX_CONTROLLERS);
> +		return -EINVAL;
> +	}
> +
> +	if (!count) {
> +		dev_warn(dev, "No SoundWire controllers detected\n");
> +		return -EINVAL;
> +	}
> +	dev_dbg(dev, "ACPI reports %d Soundwire Controller devices\n", count);
> +	acp_data->sdw_master_count  = count;

Double space before '='.

> +	for (index = 0; index < count; index++) {
> +		snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", index);
> +		link = fwnode_get_named_child_node(acp_data->sdw_fw_node, name);
> +		if (!link) {
> +			dev_err(dev, "Master node %s not found\n", name);
> +			return -EIO;
> +		}
> +
> +		fwnode_property_read_u32(link, "amd-sdw-power-mode",
> +					 &acp_sdw_power_mode);
> +		if (acp_sdw_power_mode != AMD_SDW_POWER_OFF_MODE)
> +			acp_data->acp_sdw_power_off = false;
> +	}
> +	return 0;
> +}
> +
> +static int get_acp63_device_config(u32 config, struct pci_dev *pci, struct acp63_dev_data *acp_data)
>   {
>   	struct acpi_device *dmic_dev;
> +	struct acpi_device *sdw_dev;
> +	struct device *dev;
>   	const union acpi_object *obj;
>   	bool is_dmic_dev = false;
> +	bool is_sdw_dev = false;
> +	int ret;
> +
> +	dev = &pci->dev;
>   
>   	dmic_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_DMIC_ADDR, 0);

If you set dev above, you might as well use it throughout the function 
context? Like above in ACPI_COMPANION?

>   	if (dmic_dev) {
> @@ -149,22 +206,84 @@ static void get_acp63_device_config(u32 config, struct pci_dev *pci,
>   			is_dmic_dev = true;
>   	}
>   
> +	sdw_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_SDW_ADDR, 0);
> +	if (sdw_dev) {
> +		is_sdw_dev = true;
> +		acp_data->sdw_fw_node = acpi_fwnode_handle(sdw_dev);
> +		ret = sdw_amd_scan_controller(dev);

Or just use &pci->dev here, so there is no need for separate variable?



