Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC685BC97
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 13:52:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEE0E72;
	Tue, 20 Feb 2024 13:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEE0E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708433537;
	bh=cFxAPeixrrkBcvkFKM9uK9ciH82I1tyfkh8gtrX7CMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EZLMPgsdG7gsmPqb5HAgBAhhMk4WyU0WS8y+1Afn66AoFAGbpTGBLPzm14xNt0Fh9
	 3BtsswYKRiZjSqdWmweGqTy7U3aHTnZS6DkRJhCmKE57gA87CrQJZ6OhIL9ZjHcgoc
	 QN4tRUv0twT1QeBVljM62TcIF3YhzJdSGjs0wtXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDDB7F8057F; Tue, 20 Feb 2024 13:51:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07FFCF804B0;
	Tue, 20 Feb 2024 13:51:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F257DF804B0; Tue, 20 Feb 2024 13:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FC1FF8047D
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 13:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC1FF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GrsKDNVD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708432563; x=1739968563;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cFxAPeixrrkBcvkFKM9uK9ciH82I1tyfkh8gtrX7CMc=;
  b=GrsKDNVDdelJSYW7X/bJWcC+TJFoS9X7yCJfoJBt+3bK1gIKLIE/9GQy
   mtTg49CS2t0j0Hz1HoS8iJ/tSGxBKUkz3Cu0G632jsPvypwguXlpMBKVL
   bKqLuEd8P9ahPT75hB9ojVUIUrYDeyq1+NA1LUThOuxcrY8I3Aa7ooZzA
   usDQuDlgEawFdugVM0irMdy0gkiV47ECu/ztedzxQ/bSVoRpiwiMZsBy+
   n85obpHQas961Z4X0zW21W1xeVO8KsNYPNX52Ss656WjSVyG3hd7y5SsD
   5r/RFsTYhrJiWCEACi3pxnRHTcH2K1PB6+6D/AJ5pFBTncREOsoIP3/mv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13942907"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="13942907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 04:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="35528286"
Received: from pjayasek-mobl.amr.corp.intel.com (HELO [10.246.112.112])
 ([10.246.112.112])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 04:32:45 -0800
Message-ID: <ae5b3c49-308e-465c-8bc6-c0e1ac79f19f@linux.intel.com>
Date: Tue, 20 Feb 2024 07:32:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] ASoc: tas2783: Add tas2783 codec driver
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 bard.liao@intel.com, mengdong.lin@intel.com,
 yung-chuan.liao@linux.intel.com, baojun.xu@ti.com, kevin-lu@ti.com,
 tiwai@suse.de, soyer@irl.hu
References: <20240219022153.553-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240219022153.553-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AEZJWKXEHKILI6OXHRJ4TOCMXEYXCVO6
X-Message-ID-Hash: AEZJWKXEHKILI6OXHRJ4TOCMXEYXCVO6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEZJWKXEHKILI6OXHRJ4TOCMXEYXCVO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's starting to look good, but the use of the dev_num is conceptually 
broken. The only way to reliably identify a device is the combination of 
link_id and unique_id. The information is present for both ACPI and DT 
systems. See comments below.
-Pierre

> +static void tas2783_apply_calib(struct tasdevice_priv *tas_dev,
> +	unsigned int *cali_data)
> +{
> +	struct regmap *map = tas_dev->regmap;
> +	u8 *cali_start;
> +	u16 dev_num;
> +	int ret;
> +
> +	if (!tas_dev->sdw_peripheral) {
> +		dev_err(tas_dev->dev, "%s: peripheral doesn't exist.\n",
> +			__func__);
> +		return;
> +	}
> +
> +	dev_num = clamp(tas_dev->sdw_peripheral->dev_num, 1, 4) - 1;

Not following what restrictions you are trying to enforce on the device 
number. That's a value selected by the manager. You absolutely cannot 
assume the value is between 1 and 4, the max value is 11.

> +	/*
> +	 * The area saving tas2783 calibrated data is specified by its
> +	 * dev_num. cali_start is the first address of current tas2783's
> +	 * calibrated data.
> +	 */
> +	cali_start = (u8 *)(cali_data + dev_num * sizeof(tas2783_cali_reg));
> +	for (int i = 0; i < ARRAY_SIZE(tas2783_cali_reg); i++) {
> +		ret = regmap_bulk_write(map, tas2783_cali_reg[i],
> +			&cali_start[4 * i], 4);
> +		if (ret) {
> +			dev_err(tas_dev->dev, "Cali failed %x:%d\n",
> +				tas2783_cali_reg[i], ret);
> +			break;
> +		}
> +	}
> +}
> +
> +/*
> + * Load the calibration data, including speaker impedance, f0, etc.
> + * Calibration is done by the manufacturer in the factory. The calibration
> + * data are used by the algorithm for calculating the speaker temperature,
> + * speaker membrane excursion and f0 in real time during playback.
> + * The DSP will work with default data values if calibrated data are
> + * missing or are invalid.
> + * Layout of calibrated Data in UEFI:
> + *	Calibrated Data of Dev 0 (20 bytes)
> + *	Calibrated Data of Dev 1 (20 bytes)
> + *	Calibrated Data of Dev 2 (20 bytes)
> + *	Calibrated Data of Dev 3 (20 bytes)

You will have a hard-time matching those device indices with the 
dev_num, which depends on the enumeration order and the bus allocation.

The only stable board-specific value is to use a combination of link_id 
and unique_id (possibly controller id as well).


> + *	CRC (4 bytes)
> + */

> +static int tasdevice_comp_probe(struct snd_soc_component *comp)
> +{
> +	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(comp);
> +	acpi_handle handle = ACPI_HANDLE(tas_dev->dev);
> +	const struct firmware *fw_entry = NULL;
> +	const char *sub = NULL;
> +	int ret, value_sdw;
> +
> +	if (handle) {
> +		sub = acpi_get_subsystem_id(handle);
> +		if (IS_ERR(sub))
> +			sub = NULL;
> +	}
> +
> +	tas_dev->component = comp;
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
> +		scnprintf(tas_dev->dspfw_binaryname,
> +			TAS2783_DSPFW_FILENAME_LEN, "%s-tas2783.bin",
> +			comp->name_prefix);
> +	} else {
> +		/* Compatible with the previous naming rule */
> +		if (sub) {
> +		/*
> +		 * subsystem_id-link_id[0,1,...,N]-dev_num[1,...,4].bin stores
> +		 * the dsp firmware including speaker protection algorithm,
> +		 * audio acoustic algorithm, speaker characters and algorithm
> +		 * params, it must be copied into firmware folder.

no the dev_num cannot be used. It's only used for host-device 
communication and cannot be used to identify a device position.

The link_id+unique_unique is the only way to go.

But in addition you want want to consider a platform-specific prefix 
which contains the OEM name or device SKU.

> +		 */
> +			scnprintf(tas_dev->dspfw_binaryname,
> +				TAS2783_DSPFW_FILENAME_LEN,
> +				"%s-%d-%d.bin", sub,
> +				tas_dev->sdw_peripheral->bus->link_id,
> +				tas_dev->sdw_peripheral->dev_num);
> +		} else {
> +		/*
> +		 * tas2783-link_id[0,1,...,N]-dev_num[1,...,4].bin stores
> +		 * the dsp firmware including speaker protection algorithm,
> +		 * audio acoustic algorithm, speaker characters and algorithm
> +		 * params, it must be copied into firmware folder.
> +		 */
> +			scnprintf(tas_dev->dspfw_binaryname,
> +				TAS2783_DSPFW_FILENAME_LEN,
> +				"tas2783-%d-%d.bin",
> +				tas_dev->sdw_peripheral->bus->link_id,
> +				tas_dev->sdw_peripheral->dev_num);
> +		}
> +	}
> +
> +	ret = request_firmware(&fw_entry, tas_dev->dspfw_binaryname,
> +		tas_dev->dev);
> +	if (ret) {
> +		dev_err(tas_dev->dev,
> +			"%s: request_firmware %x open status: %d.\n", __func__,
> +			tas_dev->sdw_peripheral->id.unique_id, ret);
> +		goto out;
> +	}
> +
> +	tasdevice_dspfw_ready(fw_entry, tas_dev);
> +
> +	/* Select left/right channel based on device number. */
> +	value_sdw = 0x1a;
> +	value_sdw |= (tas_dev->sdw_peripheral->dev_num & BIT(0)) << 4;
> +	dev_dbg(tas_dev->dev, "%s: dev_num = %u", __func__,
> +		tas_dev->sdw_peripheral->dev_num);
> +	regmap_write(tas_dev->regmap, TAS2783_REG_TDM_RX_CFG, value_sdw);
> +	if (ret != 0)
> +		dev_warn(tas_dev->dev, "%s: L/R setting failed: %d.\n",
> +			__func__, ret);
> +
> +out:
> +	if (fw_entry)
> +		release_firmware(fw_entry);
> +	return 0;
> +}

> +static int tasdevice_io_init(struct device *dev,
> +	struct sdw_slave *slave)
> +{
> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(tas_priv->regmap, false);
> +
> +	if (tas_priv->first_hw_init) {
> +		regcache_cache_bypass(tas_priv->regmap, true);
> +	} else {
> +	/*
> +	 * PM runtime is only enabled when a Slave reports as Attached
> +	 * Update count of parent 'active' children
> +	 */

weird indentation for comments in multiple places.

> +		pm_runtime_set_active(&slave->dev);
> +	}
> +
> +	/* sw reset */
> +	ret = regmap_write(tas_priv->regmap, TAS2873_REG_SWRESET,
> +		TAS2873_REG_SWRESET_RESET);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "Reset failed.\n");
> +		goto out;
> +	}
> +
> +	if (tas_priv->first_hw_init) {
> +		regcache_cache_bypass(tas_priv->regmap, false);
> +		regcache_mark_dirty(tas_priv->regmap);
> +	}
> +
> +	tas_priv->first_hw_init = true;
> +	tas_priv->hw_init = true;
> +
> +out:
> +	return ret;
> +}


