Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0206660B6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D10697640;
	Wed, 11 Jan 2023 17:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D10697640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455072;
	bh=JO/X1hLLWdoPZeV4e0U1XRXlWg6KprX6CGLGaYJyPyU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lgHLPyhUBIA72ZSQ0JMO1WhuYl6p0wsihFo5AeXuge4bAS2aAMvK2lZy2dwPD8480
	 oysDyZOnLU0UoGZVf/j4DiMt44MslrGfyHRKew33Zyg6eo2RxRnd9qG8/rqeIRJK25
	 8DgqxvPdQZzMrMM119EJ2N1t5W3H9l2bD98NsHzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C91DBF8053D;
	Wed, 11 Jan 2023 17:36:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBECBF80551; Wed, 11 Jan 2023 17:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD82F8030F
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD82F8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sb65Cw9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454957; x=1704990957;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JO/X1hLLWdoPZeV4e0U1XRXlWg6KprX6CGLGaYJyPyU=;
 b=Sb65Cw9ep7Ezlbgn6J+ETAa0tgTfDAu/k7n9GTIKAfGKE+2+iMPJdmLY
 BFf9pKd92TGmhYMC9s1G/s0nmxqe8u61IOmXUkT+n3lTfQNHtv8IfY6O8
 Iew5zvx7rLj/4+C0ecCjoNxghjhnR7p72k1701DlmwExKHoP3kCFQrNoO
 h+/TWBjP9i+X9PaQqN1XHl45YfIvHTJ43BkG4w5XCnNb56s+dQ9kDn9JC
 JLkRzbTyQsmysCzU2X5zyt2YoK0MpS/uGxM4nmA/NYvtuBMKd1iYZ1Ppx
 JaJir+Cjcp0PvwH4mICEm3YgQh0jcpZE8a+E9fhf3UvWKSZ75K1Tyb4/L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324703963"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324703963"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408108"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408108"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:01 -0800
Message-ID: <9f2229fb-499b-f802-993b-56a7ad2ce361@linux.intel.com>
Date: Wed, 11 Jan 2023 07:32:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 01/19] ASoC: amd: ps: create platform devices based on acp
 config
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
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
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Mario.Limonciello@amd.com,
 arungopal.kondaveeti@amd.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




> +#define AMD_SDW_CLK_STOP_MODE		1

there are multiple modes for clock stop in SoundWire, and multiple ways
for the link manager to deal with clock stop, you want a comment to
describe what this define refers to.

> +#define AMD_SDW_POWER_OFF_MODE		2
> +
> +struct acp_sdw_pdata {
> +	u16 instance;
> +	struct mutex *sdw_lock;

need a comment on what this lock protects.

> +};
> +#endif
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index b7535c7d093f..ed979e6d0c1d 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -10,7 +10,7 @@
>  #define ACP_DEVICE_ID 0x15E2
>  #define ACP63_REG_START		0x1240000
>  #define ACP63_REG_END		0x1250200
> -#define ACP63_DEVS		3
> +#define ACP63_DEVS		5
>  
>  #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
>  #define ACP_PGFSM_CNTL_POWER_ON_MASK	1
> @@ -55,8 +55,14 @@
>  
>  #define ACP63_DMIC_ADDR		2
>  #define ACP63_PDM_MODE_DEVS		3
> -#define ACP63_PDM_DEV_MASK		1
>  #define ACP_DMIC_DEV	2
> +#define ACP63_SDW0_MODE_DEVS		2
> +#define ACP63_SDW0_SDW1_MODE_DEVS	3
> +#define ACP63_SDW0_PDM_MODE_DEVS	4
> +#define ACP63_SDW0_SDW1_PDM_MODE_DEVS   5
> +#define ACP63_DMIC_ADDR			2
> +#define ACP63_SDW_ADDR			5
> +#define AMD_SDW_MAX_CONTROLLERS		2
>  
>  enum acp_config {
>  	ACP_CONFIG_0 = 0,
> @@ -77,6 +83,12 @@ enum acp_config {
>  	ACP_CONFIG_15,
>  };
>  
> +enum acp_pdev_mask {
> +	ACP63_PDM_DEV_MASK = 1,
> +	ACP63_SDW_DEV_MASK,
> +	ACP63_SDW_PDM_DEV_MASK,
> +};
> +
>  struct pdm_stream_instance {
>  	u16 num_pages;
>  	u16 channels;
> @@ -107,7 +119,15 @@ struct acp63_dev_data {
>  	struct resource *res;
>  	struct platform_device *pdev[ACP63_DEVS];
>  	struct mutex acp_lock; /* protect shared registers */
> +	struct fwnode_handle *sdw_fw_node;
>  	u16 pdev_mask;
>  	u16 pdev_count;
>  	u16 pdm_dev_index;
> +	u8 sdw_master_count;

for new contributions, it's recommended to use manager and peripheral.

> +	u16 sdw0_dev_index;
> +	u16 sdw1_dev_index;

probably need a comment on what the 0 and 1 refer to, it's not clear if
there's any sort of dependency/link with the 'sdw_master_count' above.

If this is related to the two controllers mentioned in the cover letter,
then an explanation of the sdw_master_count would be needed as well
(single variable for two controllers?)

> +	u16 sdw_dma_dev_index;
> +	bool is_dmic_dev;
> +	bool is_sdw_dev;
> +	bool acp_sdw_power_off;
>  };
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index e86f23d97584..85154cf0b2a2 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -14,6 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <sound/pcm_params.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/soundwire/sdw_amd.h>
>  
>  #include "acp63.h"
>  
> @@ -134,12 +135,68 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
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

one line?

> +		return -EINVAL;
> +	}
> +
> +	/* Check count is within bounds */
> +	if (count > AMD_SDW_MAX_CONTROLLERS) {
> +		dev_err(dev, "Controller count %d exceeds max %d\n",
> +			count, AMD_SDW_MAX_CONTROLLERS);

No. controllers and masters are different concepts, see the DisCo
specification for SoundWire. A Controller can have multiple Masters.

> +		return -EINVAL;
> +	}
> +
> +	if (!count) {
> +		dev_warn(dev, "No SoundWire controllers detected\n");
> +		return -EINVAL;
> +	}

is this really a warning, looks like a dev_dbg or info to me.

> +	dev_dbg(dev, "ACPI reports %d Soundwire Controller devices\n", count);

the term device is incorrect here, the DisCo spec does not expose ACPI
devices for each master.

"ACPI reports %d Managers"

> +	acp_data->sdw_master_count  = count;
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

does power-off mean 'clock-stop'?

> +	}
> +	return 0;
> +}
> +

> +		if (is_dmic_dev && is_sdw_dev) {
> +			switch (acp_data->sdw_master_count) {
> +			case 1:
> +				acp_data->pdev_mask = ACP63_SDW_PDM_DEV_MASK;
> +				acp_data->pdev_count = ACP63_SDW0_PDM_MODE_DEVS;
> +				break;
> +			case 2:
> +				acp_data->pdev_mask = ACP63_SDW_PDM_DEV_MASK;
> +				acp_data->pdev_count = ACP63_SDW0_SDW1_PDM_MODE_DEVS;
> +				break;

so the cover letter is indeed wrong and confuses two controllers for two
managers.

> +			default:
> +				return -EINVAL;
> +			}
> +		} else if (is_dmic_dev) {
>  			acp_data->pdev_mask = ACP63_PDM_DEV_MASK;
>  			acp_data->pdev_count = ACP63_PDM_MODE_DEVS;
> +		} else if (is_sdw_dev) {
> +			switch (acp_data->sdw_master_count) {
> +			case 1:
> +				acp_data->pdev_mask = ACP63_SDW_DEV_MASK;
> +				acp_data->pdev_count = ACP63_SDW0_MODE_DEVS;
> +				break;
> +			case 2:
> +				acp_data->pdev_mask = ACP63_SDW_DEV_MASK;
> +				acp_data->pdev_count = ACP63_SDW0_SDW1_MODE_DEVS;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
>  		}
>  		break;
> +	default:
> +		break;
>  	}
> +	return 0;
>  }

