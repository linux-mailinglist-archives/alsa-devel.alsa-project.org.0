Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFDC70C53D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 20:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BDA0209;
	Mon, 22 May 2023 20:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BDA0209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684780393;
	bh=XMcOvcpn2XNfm3D+yAL/mRJvyTj4QDvdy7DS505FDp0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PG+QYWD4aQ/Q3vBXwJhueuAimeZY4uV4onfSgPGxNqvObsRGoHkomuajc3tWw9Kwg
	 p9xoCNsAD9bqMZzDd8fIarogBDKP+X0FwfVBJNZB0KeNqhFjhJSFp9EjoOg0eGsGiM
	 pCjS9NgHHzowqM+4RWwKrH6yM1NZAlol4eFyyWBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0BF1F80544; Mon, 22 May 2023 20:32:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B1AAF8053D;
	Mon, 22 May 2023 20:32:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 939ABF80544; Mon, 22 May 2023 20:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C386BF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 20:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C386BF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eWzemtD/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684780330; x=1716316330;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XMcOvcpn2XNfm3D+yAL/mRJvyTj4QDvdy7DS505FDp0=;
  b=eWzemtD/5DiJXrJHALfOxF0GN4+Dldk9YOAV0mdGhdBJqlGRpzxgcaVg
   iqoaNP7bfdELMLErtIp0rkB059PTRLYVQfNfZNTE/3SmBDA0ILun7ubhg
   ukeDam21d/5MEILOBmcYn56TL+w21cdK/jBm3IQB+B0Gg5o8eG0X78s/5
   UbCD2ptSBfC0ao0V/2RzdKT5ennMV67bImJqmYIu7vtRNa7Cm/a8Nbbyn
   CC8h8RMvyIEgRPYOBXwuZVdU4Hk6iAn5ycOAUhH4LuPBRRiNNR/fCSacz
   JBadiIeij/S1kCyDB2Cg0Fw0hZOq73aMXXE0uDJUAqdA+h9xwNBRNPkSS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="356235092"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="356235092"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697740832"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="697740832"
Received: from ljgreene-mobl.amr.corp.intel.com (HELO [10.209.124.121])
 ([10.209.124.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:43 -0700
Message-ID: <1d73963a-de26-a147-6ccb-e5c8c65f579b@linux.intel.com>
Date: Mon, 22 May 2023 11:16:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 1/9] ASoC: amd: ps: create platform devices based on
 acp config
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-2-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230522133122.166841-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YMV7PPYMCMVDP3IOPDDBQBIDXLSOHUUV
X-Message-ID-Hash: YMV7PPYMCMVDP3IOPDDBQBIDXLSOHUUV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMV7PPYMCMVDP3IOPDDBQBIDXLSOHUUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


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
> +		fwnode_property_read_u32(link, "amd-sdw-power-mode",
> +					 &acp_sdw_power_mode);

What happens if this property is not found or doesn't exist?

acp_sdw_power_mode is zero, so....


> +		/*
> +		 * when SoundWire configuration is selected from acp pin config,
> +		 * based on manager instances count, acp init/de-init sequence should be
> +		 * executed as part of PM ops only when Bus reset is applied for the active
> +		 * SoundWire manager instances.
> +		 */
> +		if (acp_sdw_power_mode != AMD_SDW_POWER_OFF_MODE)
> +			acp_data->acp_reset = false;

... here this branch is taken.

Is this intentional?

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

useless init

> +	bool is_sdw_dev = false;

and useless init as well...

> +	int ret;
>  
>  	dmic_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_DMIC_ADDR, 0);
>  	if (dmic_dev) {
> +		/* is_dmic_dev flag will be set when ACP PDM controller device exists */
>  		if (!acpi_dev_get_property(dmic_dev, "acp-audio-device-type",
>  					   ACPI_TYPE_INTEGER, &obj) &&
>  					   obj->integer.value == ACP_DMIC_DEV)
>  			is_dmic_dev = true;
>  	}
>  
> +	sdw_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_SDW_ADDR, 0);
> +	if (sdw_dev) {
> +		acp_data->sdw_fw_node = acpi_fwnode_handle(sdw_dev);
> +		ret = sdw_amd_scan_controller(&pci->dev);
> +		/* is_sdw_dev flag will be set when SoundWire Manager device exists */
> +		if (!ret)
> +			is_sdw_dev = true;

sdw_amd_scan_controller() can return -EINVAL, how is this handled?
Shouldn't you stop execution and return here in the < 0 case?

> +	}
> +
> +	dev_dbg(&pci->dev, "Audio Mode %d\n", config);
>  	switch (config) {
> -	case ACP_CONFIG_0:
> -	case ACP_CONFIG_1:
> +	case ACP_CONFIG_4:
> +	case ACP_CONFIG_5:
> +	case ACP_CONFIG_10:
> +	case ACP_CONFIG_11:
> +		if (is_dmic_dev) {
> +			acp_data->pdev_mask = ACP63_PDM_DEV_MASK;
> +			acp_data->pdev_count = ACP63_PDM_MODE_DEVS;
> +		}
> +		break;
>  	case ACP_CONFIG_2:
>  	case ACP_CONFIG_3:
> -	case ACP_CONFIG_9:
> -	case ACP_CONFIG_15:
> -		dev_dbg(&pci->dev, "Audio Mode %d\n", config);
> +		if (is_sdw_dev) {
> +			switch (acp_data->sdw_manager_count) {
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
> +		}
>  		break;
> -	default:
> -		if (is_dmic_dev) {
> +	case ACP_CONFIG_6:
> +	case ACP_CONFIG_7:
> +	case ACP_CONFIG_12:
> +	case ACP_CONFIG_8:
> +	case ACP_CONFIG_13:
> +	case ACP_CONFIG_14:
> +		if (is_dmic_dev && is_sdw_dev) {
> +			switch (acp_data->sdw_manager_count) {
> +			case 1:
> +				acp_data->pdev_mask = ACP63_SDW_PDM_DEV_MASK;
> +				acp_data->pdev_count = ACP63_SDW0_PDM_MODE_DEVS;
> +				break;
> +			case 2:
> +				acp_data->pdev_mask = ACP63_SDW_PDM_DEV_MASK;
> +				acp_data->pdev_count = ACP63_SDW0_SDW1_PDM_MODE_DEVS;
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +		} else if (is_dmic_dev) {
>  			acp_data->pdev_mask = ACP63_PDM_DEV_MASK;
>  			acp_data->pdev_count = ACP63_PDM_MODE_DEVS;
> +		} else if (is_sdw_dev) {
> +			switch (acp_data->sdw_manager_count) {
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

>  		dev_err(&pci->dev, "ACP platform devices creation failed\n");
