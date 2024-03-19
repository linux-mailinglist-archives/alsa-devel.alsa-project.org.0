Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8F8800CF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 16:36:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3001527AA;
	Tue, 19 Mar 2024 16:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3001527AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710862592;
	bh=4jp40Xof18diM6c7MgxIyUriMqgrk7eSdZm+iU5lWEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lNTCadkTcShMkN4KpmsmD5Q4qh5PdG+rzuCDhccxG1mOVYOu6sqSIYnIaeIqDA4Wj
	 BsjNCfzbwUFKrCZ5PHsd2kNHicufC34tPqMSgJTwP6WmEXIqE2BOkV2Jxw4Dpfrb7O
	 R7YlUaRoraKR7w3g18whV1BQq0To05PoX0IwvmU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06D3CF8057A; Tue, 19 Mar 2024 16:35:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B0F2F80587;
	Tue, 19 Mar 2024 16:35:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2FE6F804E7; Tue, 19 Mar 2024 16:35:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FF14F80088
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 16:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF14F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X4L0mDUT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710862533; x=1742398533;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4jp40Xof18diM6c7MgxIyUriMqgrk7eSdZm+iU5lWEA=;
  b=X4L0mDUTWtIbEj6a0C468CIwdaKb9v9dab5aNrtIHZaq3ueX0zeOo5Lh
   M9Rq4MKQixGZAovO1AVwX84gpjduPb87UPrFOaR/sshtcGmlPJH6LubGB
   Z2MY+w44pi3w2uRUMphuAExuLoXm+/bFCIWOi5DOeZES5TXGG/3ZwiPuL
   tWDu8D9qWU7vjqor9wwloOFCsvDSJojJ1cdnQBC4oXUsm4mYaPG+SuILH
   C20I2wkR6ZSqRd0I5rUPu7+faU28ar06+sVMHPeimRowOdjFAaXJaJjP1
   8QAwc6ftWiF3nWwEP8f5FYd+kfsl7sSLLJ1B6GCHiBkKYKfCxu2k6VhY5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5607719"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000";
   d="scan'208";a="5607719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000";
   d="scan'208";a="18304219"
Received: from akiruban-mobl.amr.corp.intel.com (HELO [10.213.182.233])
 ([10.213.182.233])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:35:25 -0700
Message-ID: <34f404cd-a12d-4ffa-9398-72de3be244b3@linux.intel.com>
Date: Tue, 19 Mar 2024 10:35:25 -0500
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
 baojun.xu@ti.com, soyer@irl.hu, Baojun.Xu@fpt.com, navada@ti.com
References: <20240319135811.186-1-shenghao-ding@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240319135811.186-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HPO6XPEQ2LGYNJY7LZFEO7SXLWRVLNJH
X-Message-ID-Hash: HPO6XPEQ2LGYNJY7LZFEO7SXLWRVLNJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPO6XPEQ2LGYNJY7LZFEO7SXLWRVLNJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static bool tas2783_readable_register(struct device *dev,
> +	unsigned int reg)
> +{
> +	switch (reg) {
> +	/* Page 0 */
> +	case 0x8000 ... 0x807F:
> +		return true;
> +	default:
> +		return false;

so only the registers in 0x8000..807F are readable. That's the usual
non-SDCA vendor-specific areas ...


> +static const struct regmap_config tasdevice_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.readable_reg = tas2783_readable_register,
> +	.volatile_reg = tas2783_volatile_register,
> +	.max_register = 0x44ffffff,

.... but here you show support for a much larger register set in SDCA space.

I am having a hard-time believing that none of these SDCA registers are
readable?

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
> +	/* Check Calibrated Data V1 */
> +	crc = crc32(~0, cali_data.data, TAS2783_CALIDATAV1_BYTE_SIZE) ^ ~0;
> +	if (crc == tmp_val[TAS2783_CALIDATAV1_CRC32_INDX]) {
> +		/* Date and time of when calibration was done. */
> +		tas2783_apply_calibv1(tas_dev, tmp_val);
> +		dev_dbg(tas_dev->dev, "V1: %ptTs",

Is this really needed/helpful?

> +			&tmp_val[TAS2783_CALIDATAV1_TIMESTAMP_INDX]);
> +		return;
> +	}
> +
> +	/* Check Calibrated Data V2 */
> +	if (tmp_val[0] == 2783) {
> +		const struct calibdatav2_info calib_info = {
> +			.number_of_devices = tmp_val[1],
> +			.crc32_indx = 3 + tmp_val[1] * 6,
> +			.byt_sz = 12 + tmp_val[1] * 24,
> +			.cali_data = &tmp_val[3]
> +		};
> +
> +		if (calib_info.number_of_devices > TAS2783_MAX_DEV_NUM ||
> +			calib_info.number_of_devices == 0) {
> +			dev_dbg(tas_dev->dev, "No dev in calibrated data V2.");

the log is not aligned with the first condition where you have too many
devices.

It's not clear why it's not an error.

> +			return;
> +		}
> +		crc = crc32(~0, cali_data.data, calib_info.byt_sz)
> +			^ ~0;
> +		if (crc == tmp_val[calib_info.crc32_indx]) {
> +			tas2783_apply_calibv2(tas_dev, &calib_info);
> +			dev_dbg(tas_dev->dev, "V2: %ptTs",

same, is this needed?
> +				&tmp_val[TAS2783_CALIDATAV2_TIMESTAMP_INDX]);
> +		} else {
> +			dev_dbg(tas_dev->dev,
> +				"V2: CRC 0x%08x not match 0x%08x\n",
> +				crc, tmp_val[calib_info.crc32_indx]);

is this not an error?

> +		}
> +	} else {
> +		dev_err(tas_dev->dev, "Non-2783 chip\n");
> +	}
> +}

the error level seem inconsistent and it's not clear why errors are ignored?

