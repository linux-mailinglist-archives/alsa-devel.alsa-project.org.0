Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1DA88C687
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F0127AB;
	Tue, 26 Mar 2024 16:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F0127AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466070;
	bh=OmwQm3heyvidD10nwGyEHU8v8fgAtD9vjQhNMPL7aDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qaop8g7XABgMdqLdn5v6S7nlkiNx6nmHs0jsdSjunMjlPH/ZwEmqETOaXV2M1Fy+l
	 lOXKBTQZNnA0S8A/0UKyMMQ5+n61nuhsEIErtAgmSYIAxnObhPMymdyuo/Yc+49UTu
	 DBl5gQLocybrrJ9ybbCeIkURTVE5gUVBJK4kRMqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 577F1F805BF; Tue, 26 Mar 2024 16:14:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C8FF805C7;
	Tue, 26 Mar 2024 16:14:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D2DF805B3; Tue, 26 Mar 2024 16:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8520F80236
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8520F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e7B8heXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711466017; x=1743002017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OmwQm3heyvidD10nwGyEHU8v8fgAtD9vjQhNMPL7aDA=;
  b=e7B8heXgbBXCREnSVfCXZhnEhPuk4Uq4ALioa8g1kWV1zzlK5opA3lze
   rb+I6UTB+d5kOrkG8kYrgj1SCGqYSZvwWVWxQgtpY45wTns3VjjUcYnSI
   iNza44iMXv1bWbz6mPa6Xpzlry6KHwrAILS5aV7M6GuxtIr/nOc2NZjVR
   f0lNRIfNfAgEfLEimBQWbl2zS9WWfBHiEFJSqIKofS2LHPEn/nqifwjn+
   431VM1Uc+fucBg57UpYqdxm8ed3HcHwFKQGNcvZSGdougDJiEVwPHmYw8
   aJLs9hWL9IiZ3POuZ1qmHDHqwziP6dwwkuHDJzxrM87Ho8B9Xx4Gw3ggi
   g==;
X-CSE-ConnectionGUID: 4GC4dGkpTEOhbfPSRbwnag==
X-CSE-MsgGUID: Zf9eLhmlQp2P9wtkd2WQCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="9489056"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="9489056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="15862599"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO [10.212.65.108])
 ([10.212.65.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:13:31 -0700
Message-ID: <a95c6ec2-d99a-41b4-add3-6ec5ef6d6830@linux.intel.com>
Date: Tue, 26 Mar 2024 10:13:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Content-Language: en-US
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
 broonie@kernel.org, soyer@irl.hu
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-7-baojun.xu@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240326010905.2147-7-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CAVNDI2M4ZGV76XMLCBOCX6XK2J47K7L
X-Message-ID-Hash: CAVNDI2M4ZGV76XMLCBOCX6XK2J47K7L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAVNDI2M4ZGV76XMLCBOCX6XK2J47K7L/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static const char deviceNumber[TASDEVICE_DSP_TAS_MAX_DEVICE] = {
> +	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4
> +};

A comment on those values wouldn't hurt...

> +static struct tasdevice_config_info *tasdevice_add_config(
> +	struct tasdevice_priv *tas_priv, unsigned char *config_data,
> +	unsigned int config_size, int *status)
> +{
> +	struct tasdevice_config_info *cfg_info;
> +	struct tasdev_blk_data **bk_da;
> +	unsigned int config_offset = 0;
> +	unsigned int i;
> +
> +	/* In most projects are many audio cases, such as music, handfree,
> +	 * receiver, games, audio-to-haptics, PMIC record, bypass mode,
> +	 * portrait, landscape, etc. Even in multiple audios, one or
> +	 * two of the chips will work for the special case, such as
> +	 * ultrasonic application. In order to support these variable-numbers
> +	 * of audio cases, flexible configs have been introduced in the
> +	 * dsp firmware.
> +	 */
> +	cfg_info = kzalloc(sizeof(struct tasdevice_config_info), GFP_KERNEL);
> +	if (!cfg_info) {
> +		*status = -ENOMEM;
> +		goto out;
> +	}
> +
> +	if (tas_priv->rcabin.fw_hdr.binary_version_num >= 0x105) {
> +		if (config_offset + 64 > (int)config_size) {
> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
> +			goto out;
> +		}
> +		config_offset += 64;
> +	}
> +
> +	if (config_offset + 4 > (int)config_size) {
> +		*status = -EINVAL;
> +		dev_err(tas_priv->dev, "add config: Out of boundary\n");
> +		goto out;

memory leaks for each of those goto out;

You need to use different labels and free-up what was allocated before.

> +	}
> +
> +	/* convert data[offset], data[offset + 1], data[offset + 2] and
> +	 * data[offset + 3] into host
> +	 */
> +	cfg_info->nblocks =
> +		be32_to_cpup((__be32 *)&config_data[config_offset]);
> +	config_offset += 4;
> +
> +	/* Several kinds of dsp/algorithm firmwares can run on tas2781,
> +	 * the number and size of blk are not fixed and different among
> +	 * these firmwares.
> +	 */
> +	bk_da = cfg_info->blk_data = kcalloc(cfg_info->nblocks,
> +		sizeof(struct tasdev_blk_data *), GFP_KERNEL);
> +	if (!bk_da) {
> +		*status = -ENOMEM;
> +		goto out;
> +	}
> +	cfg_info->real_nblocks = 0;
> +	for (i = 0; i < cfg_info->nblocks; i++) {
> +		if (config_offset + 12 > config_size) {
> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev,
> +				"%s: Out of boundary: i = %d nblocks = %u!\n",
> +				__func__, i, cfg_info->nblocks);
> +			break;
> +		}
> +		bk_da[i] = kzalloc(sizeof(struct tasdev_blk_data), GFP_KERNEL);
> +		if (!bk_da[i]) {
> +			*status = -ENOMEM;
> +			break;
> +		}
> +
> +		bk_da[i]->dev_idx = config_data[config_offset];
> +		config_offset++;
> +
> +		bk_da[i]->block_type = config_data[config_offset];
> +		config_offset++;
> +
> +		if (bk_da[i]->block_type == TASDEVICE_BIN_BLK_PRE_POWER_UP) {
> +			if (bk_da[i]->dev_idx == 0)
> +				cfg_info->active_dev =
> +					(1 << tas_priv->ndev) - 1;
> +			else
> +				cfg_info->active_dev |= 1 <<
> +					(bk_da[i]->dev_idx - 1);
> +
> +		}
> +		bk_da[i]->yram_checksum =
> +			be16_to_cpup((__be16 *)&config_data[config_offset]);
> +		config_offset += 2;
> +		bk_da[i]->block_size =
> +			be32_to_cpup((__be32 *)&config_data[config_offset]);
> +		config_offset += 4;
> +
> +		bk_da[i]->n_subblks =
> +			be32_to_cpup((__be32 *)&config_data[config_offset]);
> +
> +		config_offset += 4;
> +
> +		if (config_offset + bk_da[i]->block_size > config_size) {
> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev,
> +				"%s: Out of boundary: i = %d blks = %u!\n",
> +				__func__, i, cfg_info->nblocks);
> +			break;
> +		}
> +		/* instead of kzalloc+memcpy */
> +		bk_da[i]->regdata = kmemdup(&config_data[config_offset],
> +			bk_da[i]->block_size, GFP_KERNEL);
> +		if (!bk_da[i]->regdata) {
> +			*status = -ENOMEM;
> +			goto out;
> +		}
> +
> +		config_offset += bk_da[i]->block_size;
> +		cfg_info->real_nblocks += 1;
> +	}
> +
> +out:
> +	return cfg_info;

error handling needs to be revisited/redone.

> +}
> +
> +int tasdevice_spi_rca_parser(void *context, const struct firmware *fmw)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	struct tasdevice_config_info **cfg_info;
> +	struct tasdevice_rca_hdr *fw_hdr;
> +	struct tasdevice_rca *rca;
> +	unsigned int total_config_sz = 0;
> +	unsigned char *buf;
> +	int offset = 0;
> +	int ret = 0;
> +	int i;
> +
> +	rca = &(tas_priv->rcabin);
> +	fw_hdr = &(rca->fw_hdr);
> +	if (!fmw || !fmw->data) {
> +		dev_err(tas_priv->dev, "Failed to read %s\n",
> +			tas_priv->rca_binaryname);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	buf = (unsigned char *)fmw->data;
> +
> +	fw_hdr->img_sz = be32_to_cpup((__be32 *)&buf[offset]);
> +	offset += 4;
> +	if (fw_hdr->img_sz != fmw->size) {
> +		dev_err(tas_priv->dev,
> +			"File size not match, %d %u", (int)fmw->size,
> +			fw_hdr->img_sz);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fw_hdr->checksum = be32_to_cpup((__be32 *)&buf[offset]);
> +	offset += 4;
> +	fw_hdr->binary_version_num = be32_to_cpup((__be32 *)&buf[offset]);
> +	if (fw_hdr->binary_version_num < 0x103) {
> +		dev_err(tas_priv->dev, "File version 0x%04x is too low",
> +			fw_hdr->binary_version_num);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	offset += 4;
> +	fw_hdr->drv_fw_version = be32_to_cpup((__be32 *)&buf[offset]);
> +	offset += 8;
> +	fw_hdr->plat_type = buf[offset];
> +	offset += 1;
> +	fw_hdr->dev_family = buf[offset];
> +	offset += 1;
> +	fw_hdr->reserve = buf[offset];
> +	offset += 1;
> +	fw_hdr->ndev = buf[offset];
> +	offset += 1;

buf[offset++] would read better?

> +	if (fw_hdr->ndev != tas_priv->ndev) {
> +		dev_err(tas_priv->dev,
> +			"ndev(%u) in rcabin mismatch ndev(%u) in DTS\n",
> +			fw_hdr->ndev, tas_priv->ndev);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	if (offset + TASDEVICE_DEVICE_SUM > fw_hdr->img_sz) {
> +		dev_err(tas_priv->dev, "rca_ready: Out of boundary!\n");
> +		ret = -EINVAL;
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		goto out;
> +	}
> +
> +	for (i = 0; i < TASDEVICE_DEVICE_SUM; i++, offset++)
> +		fw_hdr->devs[i] = buf[offset];
> +
> +	fw_hdr->nconfig = be32_to_cpup((__be32 *)&buf[offset]);
> +	offset += 4;
> +
> +	for (i = 0; i < TASDEVICE_CONFIG_SUM; i++) {
> +		fw_hdr->config_size[i] = be32_to_cpup((__be32 *)&buf[offset]);
> +		offset += 4;
> +		total_config_sz += fw_hdr->config_size[i];
> +	}
> +
> +	if (fw_hdr->img_sz - total_config_sz != (unsigned int)offset) {
> +		dev_err(tas_priv->dev, "Bin file error!\n");
> +		ret = -EINVAL;
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		goto out;
> +	}
> +
> +	cfg_info = kcalloc(fw_hdr->nconfig, sizeof(*cfg_info), GFP_KERNEL);
> +	if (!cfg_info) {
> +		ret = -ENOMEM;
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		goto out;
> +	}
> +	rca->cfg_info = cfg_info;
> +	rca->ncfgs = 0;
> +	for (i = 0; i < (int)fw_hdr->nconfig; i++) {
> +		rca->ncfgs += 1;
> +		cfg_info[i] = tasdevice_add_config(tas_priv, &buf[offset],
> +			fw_hdr->config_size[i], &ret);
> +		if (ret) {
> +			tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +			goto out;
> +		}
> +		offset += (int)fw_hdr->config_size[i];
> +	}
> +out:
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(tasdevice_spi_rca_parser, SND_SOC_TAS2781_FMWLIB);
> +
> +/* fixed m68k compiling issue: mapping table can save code field */
> +static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block)
> +{
> +
> +	struct blktyp_devidx_map *p =
> +		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
> +	struct tasdevice_dspfw_hdr *fw_hdr = &(tas_fmw->fw_hdr);
> +	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &(fw_hdr->fixed_hdr);
> +
> +	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);

useless init for n

> +	unsigned char dev_idx = 0;
> +
> +	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
> +		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
> +		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
> +	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
> +		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
> +		n = ARRAY_SIZE(ppc3_mapping_table);
> +	}
> +
> +	for (i = 0; i < n; i++) {
> +		if (block->type == p[i].blktyp) {
> +			dev_idx = p[i].dev_idx;
> +			break;
> +		}
> +	}
> +
> +	return dev_idx;
> +}

> +
> +static int fw_parse_variable_header_kernel(
> +	struct tasdevice_priv *tas_priv, const struct firmware *fmw,
> +	int offset)
> +{
> +	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
> +	struct tasdevice_dspfw_hdr *fw_hdr = &(tas_fmw->fw_hdr);
> +	struct tasdevice_prog *program;
> +	struct tasdevice_config *config;
> +	const unsigned char *buf = fmw->data;
> +	unsigned short max_confs;
> +	unsigned int i;
> +
> +	if (offset + 12 + 4 * TASDEVICE_MAXPROGRAM_NUM_KERNEL > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	fw_hdr->device_family = be16_to_cpup((__be16 *)&buf[offset]);
> +	if (fw_hdr->device_family != 0) {
> +		dev_err(tas_priv->dev, "%s:not TAS device\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	offset += 2;
> +	fw_hdr->device = be16_to_cpup((__be16 *)&buf[offset]);
> +	if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||> +
> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block, const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +
> +	if (offset + 16 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* convert data[offset], data[offset + 1], data[offset + 2] and
> +	 * data[offset + 3] into host
> +	 */
> +	block->type = be32_to_cpup((__be32 *)&data[offset]);
> +	offset += 4;
> +
> +	block->is_pchksum_present = data[offset];
> +	offset++;
> +
> +	block->pchksum = data[offset];
> +	offset++;
> +
> +	block->is_ychksum_present = data[offset];
> +	offset++;
> +
> +	block->ychksum = data[offset];
> +	offset++;
> +
> +	block->blk_size = be32_to_cpup((__be32 *)&data[offset]);
> +	offset += 4;
> +
> +	block->nr_subblocks = be32_to_cpup((__be32 *)&data[offset]);
> +	offset += 4;
> +
> +	/* fixed m68k compiling issue:
> +	 * 1. mapping table can save code field.
> +	 * 2. storing the dev_idx as a member of block can reduce unnecessary
> +	 *    time and system resource comsumption of dev_idx mapping every
> +	 *    time the block data writing to the dsp.
> +	 */
> +	block->dev_idx = map_dev_idx(tas_fmw, block);
> +
> +	if (offset + block->blk_size > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: nSublocks error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	/* instead of kzalloc+memcpy */
> +	block->data = kmemdup(&data[offset], block->blk_size, GFP_KERNEL);
> +	if (!block->data) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +	offset += block->blk_size;
> +
> +out:
> +	return offset;
> +}
> +
> +static int fw_parse_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdevice_data *img_data, const struct firmware *fmw,
> +	int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +	struct tasdev_blk *blk;
> +	unsigned int i;
> +
> +	if (offset + 4 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	img_data->nr_blk = be32_to_cpup((__be32 *)&data[offset]);
> +	offset += 4;
> +
> +	img_data->dev_blks = kcalloc(img_data->nr_blk,
> +		sizeof(struct tasdev_blk), GFP_KERNEL);
> +	if (!img_data->dev_blks) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i = 0; i < img_data->nr_blk; i++) {
> +		blk = &(img_data->dev_blks[i]);
> +		offset = fw_parse_block_data_kernel(tas_fmw, blk, fmw, offset);
> +		if (offset < 0) {
> +			offset = -EINVAL;
> +			break;
> +		}
> +	}
> +
> +out:
> +	return offset;
> +}
> +
> +static int fw_parse_program_data_kernel(
> +	struct tasdevice_priv *tas_priv, struct tasdevice_fw *tas_fmw,
> +	const struct firmware *fmw, int offset)
> +{
> +	struct tasdevice_prog *program;
> +	unsigned int i;
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		program = &(tas_fmw->programs[i]);
> +		if (offset + 72 > fmw->size) {
> +			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
> +			offset = -EINVAL;
> +			goto out;
> +		}
> +		/*skip 72 unused byts*/
> +		offset += 72;
> +
> +		offset = fw_parse_data_kernel(tas_fmw, &(program->dev_data),
> +			fmw, offset);
> +		if (offset < 0)
> +			goto out;
> +	}
> +
> +out:
> +	return offset;
> +}
> +
> +static int fw_parse_configuration_data_kernel(
> +	struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +	struct tasdevice_config *config;
> +	unsigned int i;
> +
> +	for (i = 0; i < tas_fmw->nr_configurations; i++) {
> +		config = &(tas_fmw->configs[i]);
> +		if (offset + 80 > fmw->size) {
> +			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
> +			offset = -EINVAL;
> +			goto out;
> +		}
> +		memcpy(config->name, &data[offset], 64);
> +		/*skip extra 16 bytes*/
> +		offset += 80;
> +
> +		offset = fw_parse_data_kernel(tas_fmw, &(config->dev_data),
> +			fmw, offset);
> +		if (offset < 0)
> +			goto out;
> +	}
> +
> +out:
> +	return offset;
> +}
> +		fw_hdr->device == 6) {
> +		dev_err(tas_priv->dev, "Unsupported dev %d\n", fw_hdr->device);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	offset += 2;
> +	fw_hdr->ndev = deviceNumber[fw_hdr->device];
> +
> +	if (fw_hdr->ndev != tas_priv->ndev) {
> +		dev_err(tas_priv->dev,
> +			"%s: ndev(%u) in dspbin mismatch ndev(%u) in DTS\n",
> +			__func__, fw_hdr->ndev, tas_priv->ndev);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +
> +	tas_fmw->nr_programs = be32_to_cpup((__be32 *)&buf[offset]);
> +	offset += 4;
> +
> +	if (tas_fmw->nr_programs == 0 || tas_fmw->nr_programs >
> +		TASDEVICE_MAXPROGRAM_NUM_KERNEL) {
> +		dev_err(tas_priv->dev, "mnPrograms is invalid\n");
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +
> +	tas_fmw->programs = kcalloc(tas_fmw->nr_programs,
> +		sizeof(struct tasdevice_prog), GFP_KERNEL);
> +	if (!tas_fmw->programs) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		program = &(tas_fmw->programs[i]);
> +		program->prog_size = be32_to_cpup((__be32 *)&buf[offset]);
> +		offset += 4;
> +	}
> +
> +	/* Skip the unused prog_size */
> +	offset += 4 * (TASDEVICE_MAXPROGRAM_NUM_KERNEL - tas_fmw->nr_programs);
> +
> +	tas_fmw->nr_configurations = be32_to_cpup((__be32 *)&buf[offset]);
> +	offset += 4;
> +
> +	/* The max number of config in firmware greater than 4 pieces of
> +	 * tas2781s is different from the one lower than 4 pieces of
> +	 * tas2781s.
> +	 */
> +	max_confs = (fw_hdr->ndev >= 4) ?
> +		TASDEVICE_MAXCONFIG_NUM_KERNEL_MULTIPLE_AMPS :
> +		TASDEVICE_MAXCONFIG_NUM_KERNEL;
> +	if (tas_fmw->nr_configurations == 0 ||
> +		tas_fmw->nr_configurations > max_confs) {
> +		dev_err(tas_priv->dev, "%s: Conf is invalid\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (offset + 4 * max_confs > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: mpConfigurations err\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +
> +	tas_fmw->configs = kcalloc(tas_fmw->nr_configurations,
> +		sizeof(struct tasdevice_config), GFP_KERNEL);
> +	if (!tas_fmw->configs) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		config = &(tas_fmw->configs[i]);
> +		config->cfg_size = be32_to_cpup((__be32 *)&buf[offset]);
> +		offset += 4;
> +	}
> +
> +	/* Skip the unused configs */
> +	offset += 4 * (max_confs - tas_fmw->nr_programs);
> +
> +out:
> +	return offset;

same here, error handling is not quite right

I'll stop the review here.
