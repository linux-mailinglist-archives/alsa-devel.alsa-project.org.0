Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6496893B9A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 15:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D3432356;
	Mon,  1 Apr 2024 15:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D3432356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711979477;
	bh=24GpNitRdLxcpU9jAh6COt2T6RMVSkeQ4bQuoCoY/hA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xvl/flJCIme6/92X288i5fUzbK6X6rH29sFMCb+/eOn3uFNxXC3RLkhkZZ9Q0G8vc
	 LF80qZUBNkQV8spsI4hWAvCqeDbqk4aaylkigVR1fGQScj4jKmKzYgXNWgl4IXq1d5
	 k0v8mCDNLjAit7gg9qwYyfOK2ML9fLeEeu69D1bg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D3B7F80568; Mon,  1 Apr 2024 15:50:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96EC2F80580;
	Mon,  1 Apr 2024 15:50:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E97C6F80236; Mon,  1 Apr 2024 15:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A33BF80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 15:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A33BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LOtQYCrQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711979433; x=1743515433;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=24GpNitRdLxcpU9jAh6COt2T6RMVSkeQ4bQuoCoY/hA=;
  b=LOtQYCrQfWmuRP+TEyQruXNxkZ3nUYtRrUPU+qVDAc+/uNL2OK1iyQF0
   OPbhbuba2XZWZyJPi0Ry3LUoZ4MibKJ+kHtnsuHU7MFM384lMqGxUYz0d
   gisvUDDkFEzzCeXazUval/bmrP5bM9/ifEHVRhFjDGKYHhXJZ7jULKeS6
   zIauwyoFOv8s+WESknDcx+bgCgJPwHrCGa13rgLtK8OblnbNJnXOVPgP/
   Vb4SmaCP08W2xvdgCBjjJl/e136hLwrpqJAvnqkdXMde1N91ZmlvNOSj4
   eWlf+Sf68wq2TWeBZGCt4I5oCPmgir3pDPSgERCR5roiJCQW5iiVhULoQ
   w==;
X-CSE-ConnectionGUID: zYZ2q0HFQwShQl6wa9sQHQ==
X-CSE-MsgGUID: OFmla4qFQkSlob0BMjI6iQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="6961911"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="6961911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 06:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="55191337"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 06:50:26 -0700
Message-ID: <df80758b-f3d6-4456-8600-1a19fab75407@linux.intel.com>
Date: Mon, 1 Apr 2024 08:50:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] ASoc: tas2783: Add tas2783 codec driver
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 bard.liao@intel.com, yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
 tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu, Baojun.Xu@fpt.com,
 navada@ti.com, v-po@ti.com
References: <20240331021458.1418-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240331021458.1418-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VOBYQBFK64LXU6Y7RZGHINB7LXB6IR4K
X-Message-ID-Hash: VOBYQBFK64LXU6Y7RZGHINB7LXB6IR4K
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOBYQBFK64LXU6Y7RZGHINB7LXB6IR4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you for the update, I only have a couple of nit-picks and a set of
questions on when firmware is supposed to be downloaded. See below.
Regards,
-Pierre

> +static int tasdevice_sdw_hw_params(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tasdevice_priv *tas_priv =
> +		snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream;
> +	int ret;
> +
> +	dev_dbg(dai->dev, "%s: dai_name %s", __func__, dai->name);

nit-pick: do you really need this sort of logs?

> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	if (!tas_priv->sdw_peripheral)
> +		return -EINVAL;
> +
> +	/* SoundWire specific configuration */
> +	snd_sdw_params_to_config(substream, params,
> +		&stream_config, &port_config);
> +
> +	/* port 1 for playback */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		port_config.num = 1;
> +	else
> +		port_config.num = 2;
> +
> +	ret = sdw_stream_add_slave(tas_priv->sdw_peripheral,
> +		&stream_config, &port_config, 1, sdw_stream);
> +	if (ret) {
> +		dev_err(dai->dev, "%s: Unable to configure port\n", __func__);
> +		return ret;
> +	}
> +
> +	dev_dbg(dai->dev, "%s: format: %i rate: %i\n", __func__,
> +		params_format(params), params_rate(params));
> +
> +	return 0;
> +}

> +static int tasdevice_playback(struct tasdevice_priv *tas_dev, int mute)
> +{
> +	struct regmap *map = tas_dev->regmap;
> +	int ret;
> +
> +	if (mute) {
> +		/* FU23 mute (0x40400108) */
> +		ret = regmap_write(map,
> +			SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP,
> +			TAS2783_SDCA_ENT_FU23,
> +			TAS2783_SDCA_CTL_FU_MUTE, 0), 1);
> +		if (ret) {
> +			dev_err(tas_dev->dev, "%s: FU23 mute failed.\n",
> +				__func__);
> +			goto out;
> +		}
> +
> +		ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
> +			TAS2783_REG_PWR_MODE_MASK |
> +			TAS2783_REG_AEF_MASK,
> +			TAS2783_REG_PWR_MODE_ACTIVE |
> +			TAS2783_REG_PWR_MODE_SW_PWD);
> +		if (ret) {
> +			dev_err(tas_dev->dev, "%s: shutdown failed.\n",

nit-pick: is this really a shutdown or a "PWR Mute" for symmetry with...

> +				__func__);
> +		}
> +	} else {
> +		/* FU23 Unmute, 0x40400108. */
> +		ret = regmap_write(map,
> +			SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP,
> +			TAS2783_SDCA_ENT_FU23,
> +			TAS2783_SDCA_CTL_FU_MUTE, 0), 0);
> +		if (ret) {
> +			dev_err(tas_dev->dev,
> +				"%s: FU23 Unmute failed.\n", __func__);
> +			goto out;
> +		}
> +		ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
> +			TAS2783_REG_PWR_MODE_MASK,
> +			TAS2783_REG_PWR_MODE_ACTIVE);
> +		if (ret) {
> +			dev_err(tas_dev->dev,
> +				"%s: PWR Unmute failed.\n", __func__);

... this log?

> +		}
> +	}
> +out:
> +	return ret;
> +}

> +static int tasdevice_comp_probe(struct snd_soc_component *comp)
> +{
> +	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(comp);
> +	unsigned char dspfw_binaryname[TAS2783_DSPFW_FILENAME_LEN];
> +	acpi_handle handle = ACPI_HANDLE(tas_dev->dev);
> +	const struct firmware *fw_entry = NULL;
> +	const char *sub = NULL;
> +	int ret;
> +
> +	if (handle) {
> +		sub = acpi_get_subsystem_id(handle);
> +		if (IS_ERR(sub))
> +			sub = NULL;
> +	}
> +
> +	/*
> +	 * Each tas2783 in the system has its own dspfw.
> +	 */
> +	if (comp->name_prefix) {
> +		/*
> +		 * name_prefix.bin stores the dsp firmware including speaker
> +		 * protection algorithm, audio acoustic algorithm, speaker
> +		 * characters and algorithm params, it must be copied into
> +		 * firmware folder.
> +		 */
> +		scnprintf(dspfw_binaryname, TAS2783_DSPFW_FILENAME_LEN,
> +			"%s-tas2783.bin", comp->name_prefix);
> +	} else {
> +		/* Compatible with the previous naming rule */
> +		if (sub) {
> +			/*
> +			 * subsys_id-link_id[0,1,...,N]-unique_id
> +			 * [0x8,...,0xf].bin stores the dsp firmware including
> +			 * speaker protection algorithm, audio acoustic
> +			 * algorithm, speaker characters and algorithm params,
> +			 * it must be copied into firmware folder.
> +			 */
> +			scnprintf(dspfw_binaryname, TAS2783_DSPFW_FILENAME_LEN,
> +				"%s-%d-0x%x.bin", sub,
> +				tas_dev->sdw_peripheral->bus->link_id,
> +				tas_dev->sdw_peripheral->id.unique_id);
> +		} else {
> +			/*
> +			 * tas2783-link_id[0,1,...,N]-unique_id
> +			 * [0x8,...,0xf].bin stores the dsp firmware including
> +			 * speaker protection algorithm, audio acoustic
> +			 * algorithm, speaker characters and algorithm params,
> +			 * it must be copied into firmware folder.
> +			 */
> +			scnprintf(dspfw_binaryname, TAS2783_DSPFW_FILENAME_LEN,
> +				"tas2783-%d-0x%x.bin",
> +				tas_dev->sdw_peripheral->bus->link_id,
> +				tas_dev->sdw_peripheral->id.unique_id);
> +		}
> +	}
> +
> +	ret = request_firmware(&fw_entry, dspfw_binaryname, tas_dev->dev);
> +	if (ret) {
> +		dev_err(tas_dev->dev,
> +			"%s: request_firmware %x open status: %d.\n", __func__,
> +			tas_dev->sdw_peripheral->id.unique_id, ret);
> +		goto out;
> +	}
> +
> +	tasdevice_dspfw_ready(fw_entry, tas_dev);

Question: is there a specific reason why all this functionality needs to
be done in a component probe instead of when the device reports as ATTACHED?

Since you have an interaction with userspace for the firmware, and
firmware download takes time, you would want to do this as early as
possible.

Usually the component probe is part of the card creation, so you could
add card-related or control related things. Downloading firmware does
not strike me as a card-related activity?

Another question is whether the firmware needs to be downloaded again
during system/pm_runtime resume? That may depend on how power is managed
at the hardware level, but in theory an SDCA device should report to the
host whether the firmware is still valid or needs to be downloaded.


> +
> +out:
> +	if (fw_entry)
> +		release_firmware(fw_entry);
> +	return 0;
> +}
