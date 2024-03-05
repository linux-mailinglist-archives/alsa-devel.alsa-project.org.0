Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB85D8723C0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 17:10:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A6383E;
	Tue,  5 Mar 2024 17:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A6383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709655006;
	bh=x/RwPfGG3M4kAN4+nuFyXwS1UjmW9zc1MOTJXtv8PN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FuehJPVOt/6MdPJ+9CZAiEaRMdrKjHMw+sPUEanoLa5IqaGN+UAXQK6TNwp2As7ok
	 kvDDlqWRcJlCVwL8Wmy2OkA81meGl04voc7ULdqOAmtdxO0Ff+DXb+rp5G3cH3GGrY
	 coyqZURyVxkLPqjRVDhvrwTFTYgLqp+rsgHJJawU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41CE5F80587; Tue,  5 Mar 2024 17:09:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 717BCF80578;
	Tue,  5 Mar 2024 17:09:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76768F80087; Tue,  5 Mar 2024 17:09:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59EB0F80087
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 17:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59EB0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CAgBCQ2M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709654967; x=1741190967;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x/RwPfGG3M4kAN4+nuFyXwS1UjmW9zc1MOTJXtv8PN4=;
  b=CAgBCQ2MeTNxVABgWubBKSOtoAGWb+G7MrCSyLlUk5PJBFgG9tnk+QyC
   t439sNfzpmD0LivizpIAdq3IQiEArc4w1D7AgMBaq0lNKby8fuxi4/aJB
   PmYistMTrC+u3x2y73p7NY4i0yEY+BzAMVqKFwhQ2VgbV4NMG/8kVUNLl
   Z88x5XOssIRhjVWBW8/fiXfnhk6Ut4MwT/PfOjxsTS+v6ranZ20ThoBRM
   NDKiJrGV2/kxy6pibc8GtmbKPcGm96TAvK6fVY0kQyZ1jfbDeEyCjT1uK
   twLJxLIpyrSidhaDKsiW4AG108c7lXLg2RZMat5SjKJufyUb1ATexCHcy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4385012"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000";
   d="scan'208";a="4385012"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000";
   d="scan'208";a="13986647"
Received: from mvmorris-mobl1.amr.corp.intel.com (HELO [10.212.86.111])
 ([10.212.86.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:08:06 -0800
Message-ID: <52752743-b4fc-44b3-96d8-21c8cfd2bc3c@linux.intel.com>
Date: Tue, 5 Mar 2024 10:03:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec driver
Content-Language: en-US
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 bard.liao@intel.com, mengdong.lin@intel.com,
 yung-chuan.liao@linux.intel.com, kevin-lu@ti.com, tiwai@suse.de,
 soyer@irl.hu, Baojun.Xu@fpt.com, navada@ti.com
References: <20240305132646.638-1-shenghao-ding@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240305132646.638-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DLR7N2XFZLM2KKYSRVG6WOSOOLIRWHDK
X-Message-ID-Hash: DLR7N2XFZLM2KKYSRVG6WOSOOLIRWHDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLR7N2XFZLM2KKYSRVG6WOSOOLIRWHDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static void tas2783_apply_calibv1(struct tasdevice_priv *tas_dev,
> +	unsigned int *cali_data)
> +{
> +	struct regmap *map = tas_dev->regmap;
> +	u8 *cali_start;
> +	u16 offset;
> +	int ret;
> +
> +	if (!tas_dev->sdw_peripheral) {
> +		dev_err(tas_dev->dev, "%s: peripheral doesn't exist.\n",
> +			__func__);
> +		return;
> +	}
> +
> +	offset = tas_dev->sdw_peripheral->id.unique_id -
> +		TAS2783_UNIQUE_ID_BASE;
> +	if (offset >= TAS2783_MAX_DEV_NUM) {
> +		dev_err(tas_dev->dev, "%s: offset(%u) is out of range.\n",
> +			 __func__, offset);
> +		return;
> +	}
> +
> +	/*
> +	 * The area saving tas2783 calibrated data is specified by its
> +	 * unique_id offset. cali_start is the first address of current
> +	 * tas2783's calibrated data.
> +	 */
> +	cali_start = (u8 *)(cali_data + offset * sizeof(tas2783_cali_reg));
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
> +static void tas2783_apply_calibv2(struct tasdevice_priv *tas_dev,
> +	unsigned int *cali_data)
> +{
> +	const unsigned int arr_size = ARRAY_SIZE(tas2783_cali_reg);
> +	struct regmap *map = tas_dev->regmap;
> +	unsigned int dev_sum = cali_data[1], i, j, k;

this is horrible to read, at the very least move initializations to a
different line. I personally stick to one variable per line.

> +	u8 *cali_start;
> +	u16 dev_info;
> +	int ret;
> +
> +	if (!tas_dev->sdw_peripheral) {
> +		dev_err(tas_dev->dev, "%s: peripheral doesn't exist.\n",
> +			__func__);
> +		return;
> +	}
> +
> +	dev_info = tas_dev->sdw_peripheral->bus->link_id |
> +		tas_dev->sdw_peripheral->id.unique_id << 16;
> +
> +	/*
> +	 * The area saving tas2783 calibrated data is specified by its
> +	 * unique_id offset. cali_start is the first address of current
> +	 * tas2783's calibrated data.
> +	 */
> +	cali_start = (u8 *)&cali_data[3];
> +	for (i = 0; i < dev_sum; i++) {
> +		k = i * (arr_size + 1) + 3;
> +		if (dev_info != cali_data[k]) {
> +			for (j = 0; j < arr_size; j++) {
> +				k = 4 * (k + 1 + j);
> +				ret = regmap_bulk_write(map,
> +					tas2783_cali_reg[j],
> +					&cali_start[k], 4);
> +				if (ret) {
> +					dev_err(tas_dev->dev,
> +						"Cali failed %x:%d\n",
> +						tas2783_cali_reg[j], ret);
> +					break;
> +				}
> +			}
> +			break;
> +		}
> +	}
> +}

You may want to explain what v1 and v2 versions of the calibration do,
and why you need two versions in the first place.
The code has this weird indentation that makes it hard to read.
Also please use __func__ in the dev_err message, nothing is more
annoying that having two identical logs in different functions.

> +
> +/*
> + * Load the calibration data, including speaker impedance, f0, etc.
> + * Calibration is done by the manufacturer in the factory. The calibration
> + * data are used by the algorithm for calculating the speaker temperature,
> + * speaker membrane excursion and f0 in real time during playback.
> + * The DSP will work with default data values if calibrated data are
> + * missing or are invalid.
> + * Layout of calibrated Data in UEFI(total 256 bytes):
> + * V2:
> + *	ChipID (2783, 4 bytes)
> + *	Device-Sum (4 bytes)
> + *	TimeStamp of Calibration (4 bytes)
> + *	for (i = 0; i < Device-Sum; i++) {
> + *		Device #i info () {
> + *			SDW link id (2bytes)
> + *			SDW unique_id (2bytes)
> + *		}
> + *		Calibrated Data of Device #i (20 bytes)
> + *	}
> + *	CRC (4 bytes)
> + *	Reserved (the rest)
> + * Or
> + * V1:
> + *	Calibrated Data of Dev 0(unique_id offset 0) (20 bytes)
> + *	Calibrated Data of Dev 1(unique_id offset 1) (20 bytes)
> + *	Calibrated Data of Dev 2(unique_id offset 2) (20 bytes)
> + *	Calibrated Data of Dev 3(unique_id offset 3) (20 bytes)
> + *	Calibrated Data of Dev 4(unique_id offset 4) (20 bytes)
> + *	Calibrated Data of Dev 5(unique_id offset 5) (20 bytes)
> + *	Calibrated Data of Dev 6(unique_id offset 6) (20 bytes)
> + *	Calibrated Data of Dev 7(unique_id offset 7) (20 bytes)
> + *	TimeStamp of Calibration (4 bytes)
> + *	CRC (4 bytes)
> + *	Reserved (88 bytes)

This information should be moved earlier to help reviewers who read a
patch sequentially.

If you took the time to define two separate UEFI layouts, it's probably
because some initial devices only support the first version? In that
case, you should still detect and make sure multi-link solutions do not
rely on the v1?

> + */
> +static void tas2783_calibration(struct tasdevice_priv *tas_dev)
> +{
> +	efi_guid_t efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc,
> +			0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
> +	static efi_char16_t efi_name[] = L"CALI_DATA";
> +	struct calibration_data cali_data;
> +	unsigned int *tmp_val;
> +	unsigned int crc;
> +	efi_status_t status;
> +
> +	cali_data.total_sz = 0;
> +
> +	status = efi.get_variable(efi_name, &efi_guid, NULL,
> +		&cali_data.total_sz, NULL);
> +	if (status == EFI_BUFFER_TOO_SMALL
> +		&& cali_data.total_sz < TAS2783_MAX_CALIDATA_SIZE) {
> +		status = efi.get_variable(efi_name, &efi_guid, NULL,
> +			&cali_data.total_sz,
> +			cali_data.data);
> +		dev_dbg(tas_dev->dev, "%s: cali get %lx bytes result:%ld\n",
> +			__func__, cali_data.total_sz, status);
> +	}
> +	if (status != 0) {
> +		/* Failed got calibration data from EFI. */
> +		dev_dbg(tas_dev->dev, "No calibration data in UEFI.");
> +		return;
> +	}
> +
> +	tmp_val = (unsigned int *)cali_data.data;
> +
> +	if (tmp_val[0] == 2783) {

Goodness, what guaranteers that the '2783' value is NOT a calibrated value?

V2:
*	ChipID (2783, 4 bytes)

V1:
*	Calibrated Data of Dev 0(unique_id offset 0) (20 bytes)

Comparing binary values is very risky. Usually you need some sort of CRC
to avoid conflicts...

> +		/* Calibrated Data V2 */
> +		unsigned int dev_sum = tmp_val[1];
> +
> +		if (dev_sum > TAS2783_MAX_DEV_NUM ||

I thought dev_sum meant some sort of 'sum' in the CRC sense, but it's
really number_of_devices, isn't it?

> +			dev_sum == 0) {
> +			dev_dbg(tas_dev->dev, "No dev in calibrated data V2.");
> +			return;
> +		}
> +		crc = crc32(~0, cali_data.data, 12 + dev_sum * 24) ^ ~0;
> +		if (crc == tmp_val[3 + dev_sum * 6]) {
> +			tas2783_apply_calibv2(tas_dev, tmp_val);
> +			dev_dbg(tas_dev->dev, "V2: %ptTs", &tmp_val[40]);
> +		} else {
> +			dev_dbg(tas_dev->dev,
> +				"V2: CRC 0x%08x not match 0x%08x\n",
> +				crc, tmp_val[41]);
> +		}
> +	} else {
> +		/* Calibrated Data V1 */
> +		/* 8 devs * 20 bytes calibrated data/dev + 4 bytes Timestamp */
> +		crc = crc32(~0, cali_data.data, 164) ^ ~0;
> +		if (crc == tmp_val[41]) {
> +			/* Date and time of when calibration was done. */
> +			tas2783_apply_calibv1(tas_dev, tmp_val);
> +			dev_dbg(tas_dev->dev, "V1: %ptTs", &tmp_val[40]);
> +		} else {
> +			dev_dbg(tas_dev->dev,
> +				"V1: CRC 0x%08x not match 0x%08x\n",
> +				crc, tmp_val[41]);
> +		}

The CRC check should be used to determine if the v1 or v2 should be
used. This is really broken IMHO, you could detect the wrong layout then
flag that the CRC is bad without even trying the other layout...

> +	}
> +}
> +
> +static void tasdevice_dspfw_ready(const struct firmware *fmw,
> +	void *context)
> +{
> +	struct tasdevice_priv *tas_dev =
> +		(struct tasdevice_priv *) context;
> +	struct tas2783_firmware_node *p;
> +	struct regmap *map = tas_dev->regmap;
> +	unsigned char *buf = NULL;
> +	int offset = 0, img_sz;
> +	int ret;
> +
> +	if (!fmw || !fmw->data) {
> +		dev_warn(tas_dev->dev,
> +			"%s: failed to read %s: work in bypass-dsp mode.\n",
> +			__func__, tas_dev->dspfw_binaryname);
> +		return;
> +	}
> +	buf = (unsigned char *)fmw->data;
> +
> +	img_sz = get_unaligned_le32(&buf[offset]);
> +	offset  += sizeof(img_sz);
> +	if (img_sz != fmw->size) {
> +		dev_warn(tas_dev->dev, "%s: size not matching, %d %u.",
> +			__func__, (int)fmw->size, img_sz);
> +		return;
> +	}
> +
> +	while (offset < img_sz) {
> +		p = (struct tas2783_firmware_node *)(buf + offset);
> +		if (p->length > 1) {
> +			ret = regmap_bulk_write(map, p->download_addr,
> +			buf + offset + sizeof(unsigned int) * 5, p->length);
> +		} else {
> +			ret = regmap_write(map, p->download_addr,
> +				*(buf + offset + sizeof(unsigned int) * 5));
> +		}
> +
> +		if (ret != 0) {
> +			dev_dbg(tas_dev->dev,
> +				"%s: load FW fail: %d, work in bypass.\n",
> +				__func__, ret);
> +			return;
> +		}
> +		offset += sizeof(unsigned int) * 5 + p->length;

what is '5'? Using a define is best to avoid such magic numbers.

> +	}
> +
> +	tas2783_calibration(tas_dev);
> +}
> +

> +static int tasdevice_mute(struct snd_soc_dai *dai, int mute,
> +	int direction)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tasdevice_priv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct regmap *map = tas_dev->regmap;
> +	int ret;
> +
> +	dev_dbg(tas_dev->dev, "%s: %d.\n", __func__, mute);
> +
> +	if (mute) {
> +		if (direction == SNDRV_PCM_STREAM_CAPTURE) {
> +			ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
> +				TAS2783_REG_AEF_MASK,
> +				TAS2783_REG_AEF_INACTIVE);
> +			if (ret)
> +				dev_err(tas_dev->dev,
> +					"%s: Disable AEF failed.\n", __func__);
> +		} else {
> +			/* FU23 mute (0x40400108) */
> +			ret = regmap_write(map,
> +				SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP,
> +				TAS2783_SDCA_ENT_FU23,
> +				TAS2783_SDCA_CTL_FU_MUTE, 0), 1);
> +			if (ret) {
> +				dev_err(tas_dev->dev,
> +					"%s: FU23 mute failed.\n", __func__);
> +				goto out;
> +			}
> +			/*
> +			 * Both playback and echo data will be shutdown in
> +			 * playback stream.

[1] echo reference data is usually not part of the playback stream but
provided over a capture stream. Please clarify this comment.

> +			 */
> +			ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
> +				TAS2783_REG_PWR_MODE_MASK |
> +				TAS2783_REG_AEF_MASK,
> +				TAS2783_REG_PWR_MODE_ACTIVE |
> +				TAS2783_REG_PWR_MODE_SW_PWD);
> +			if (ret) {
> +				dev_err(tas_dev->dev,
> +					"%s: PWR&AEF shutdown failed.\n",
> +					__func__);
> +				goto out;
> +			}
> +			tas_dev->pstream = false;
> +		}
> +	} else {
> +		/* FU23 Unmute, 0x40400108. */
> +		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> +			ret = regmap_write(map,
> +				SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP,
> +				TAS2783_SDCA_ENT_FU23,
> +				TAS2783_SDCA_CTL_FU_MUTE, 0), 0);
> +			if (ret) {
> +				dev_err(tas_dev->dev,
> +					"%s: FU23 Unmute failed.\n", __func__);
> +				goto out;
> +			}
> +			ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
> +				TAS2783_REG_PWR_MODE_MASK,
> +				TAS2783_REG_PWR_MODE_ACTIVE);
> +			if (ret) {
> +				dev_err(tas_dev->dev,
> +					"%s: PWR Unmute failed.\n", __func__);
> +				goto out;
> +			}
> +			tas_dev->pstream = true;
> +		} else {
> +			/* Capture stream is the echo ref data for voice.
> +			 * Without playback, it can't be active.

That makes case for [1] above.

I also don't get the concept of 'active'. Even when the playback is
muted, you do want to provide a reference stream, don't you?

Also don't we have a potential race condition, you set the 'pstream'
status for the playback but use it for capture. What tells you that this
cannot be executed concurrently?

> +			 */
> +			if (tas_dev->pstream == true) {
> +				ret = regmap_update_bits(map,
> +					TAS2873_REG_PWR_CTRL,
> +					TAS2783_REG_AEF_MASK,
> +					TAS2783_REG_AEF_ACTIVE);
> +				if (ret) {
> +					dev_err(tas_dev->dev,
> +						"%s: AEF enable failed.\n",
> +						__func__);
> +					goto out;
> +				}
> +			} else {
> +				dev_err(tas_dev->dev,
> +					"%s: No playback, no AEF!", __func__);
> +				ret = -EINVAL;
> +			}
> +		}
> +	}
> +out:
> +	if (ret)
> +		dev_err(tas_dev->dev, "Mute or unmute %d failed %d.\n",
> +			mute, ret);
> +
> +	return ret;
> +}

