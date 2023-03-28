Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66F6CBC2C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 12:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E321C1ED;
	Tue, 28 Mar 2023 12:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E321C1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679998359;
	bh=8CDsWAyvwLbajFmNrgYdd3DXC7kLoSn+eSVeKLFRIQc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYyFYV4DdaFh/OnTxTP0cTRJHwpJfDEJwMDcJadCIkJ/3FTdwzVxgIOsa7TVOf/sN
	 DCKBvbgnoGQCXo+WX3f5RraHCH0cpiJq2M8vQcvk38oRwpTaMFkbCe7ELSfc9vcHnH
	 63V3yVTQmyKBSrTUFZgKqEvqBZi+vn+WCuo2yS64=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 286D3F8024E;
	Tue, 28 Mar 2023 12:11:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A55BDF80272; Tue, 28 Mar 2023 12:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11116F80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 12:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11116F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cvIcSMum
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679998297; x=1711534297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8CDsWAyvwLbajFmNrgYdd3DXC7kLoSn+eSVeKLFRIQc=;
  b=cvIcSMumccd9DOOkP0W9o8+7W81OOYIT+o6tR1y1ty5FtbmmOz0aBW+x
   Oc4Nu7koAVdqPC3iA7mBId8w0zqxKRgPt2jDtjIFE4gbOMRtrrQQ0Xnxd
   z5m8D/Q4KpwHUzHYd2zjvg7ORLJaO7BYJ3FlDcChZI4QyVus1Hdo6PeEX
   1+5V0ZRAJxEsu1eR/0JzwloxN3LbtvQQ0jVU4olEgg1LMrrnFf1PtkC8P
   G/rwzNeJQcL3CO5GP8QzBroyg+RfCyeIScW+MSHqYhU00MGgg/rOyNLDE
   mF2KkYHu+CUURWevMZIHbTtLJNYs7pj1iP7Qbwkxu2CbJyTvRdEdKWjaf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324421804"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="324421804"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="753083829"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="753083829"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:11:28 -0700
Message-ID: <34017b95-5bb3-79a0-e819-17ee113fa6c8@linux.intel.com>
Date: Tue, 28 Mar 2023 12:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9] ASoC: tas2781: Add tas2781 driver
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com
References: <20230328094940.1796-1-13916275206@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230328094940.1796-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6BKXFRQFRZJ5WT3NY7PNZYLMD5VUCOBP
X-Message-ID-Hash: 6BKXFRQFRZJ5WT3NY7PNZYLMD5VUCOBP
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BKXFRQFRZJ5WT3NY7PNZYLMD5VUCOBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/28/2023 11:49 AM, Shenghao Ding wrote:
> Create tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v9:
>   - rewording some commets
>   - Add comments on fimware parsing error handling -- all the memory resources
>      will be released in the end of tasdevice_rca_ready (fw_parse_data,
>      fw_parse_program_data & fw_parse_configuration_data).
>   - Add comments on fw_parse_calibration_data -- DSP can still work with default
>      calibrated data, memory resource related to calibrated data will be released
>      in the tasdevice_codec_remove.
> 	modified:   sound/soc/codecs/Kconfig
> 	modified:   sound/soc/codecs/Makefile
> 	new file:   sound/soc/codecs/tas2781-dsp.c
> 	new file:   sound/soc/codecs/tas2781-dsp.h
> 	new file:   sound/soc/codecs/tas2781-i2c.c
> 	new file:   sound/soc/codecs/tas2781.h
> ---

...

> +
> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block, const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +
> +	if (offset + 4 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->type = SMS_HTONL(data[offset], data[offset + 1],
> +		data[offset + 2], data[offset + 3]);
> +	offset += 4;
> +
> +	if (offset + 1 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: PChkSumPresent error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->is_pchksum_present = data[offset];
> +	offset++;
> +
> +	if (offset + 1 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: mnPChkSum error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->pchksum = data[offset];
> +	offset++;
> +
> +	if (offset + 1 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: YChkSumPresent error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->is_ychksum_present = data[offset];
> +	offset++;
> +
> +	if (offset + 1 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: mnYChkSum error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->ychksum = data[offset];
> +	offset++;
> +
> +	if (offset + 4 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: blk_size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->blk_size = SMS_HTONL(data[offset], data[offset + 1],
> +		data[offset + 2], data[offset + 3]);
> +	offset += 4;
> +
> +	if (offset + 4 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: nSublocks error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	block->nr_subblocks = SMS_HTONL(data[offset], data[offset + 1],
> +		data[offset + 2], data[offset + 3]);
> +	offset += 4;
> +
> +	if (offset + block->blk_size > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: nSublocks error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
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


I have a question regarding those
if (offset + x > fmw->size) {
	do error
}
offset += x;

Can you instead of doing check before every assignment, just check once 
if you have enough data to parse, before parsing whole piece of data 
instead?

For above function it would be something like:

static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
	struct tasdev_blk *block, const struct firmware *fmw, int offset)
{
	const unsigned char *data = fmw->data;

	if (offset + 16 + block->blk_size > fmw->size) {
		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
		offset = -EINVAL;
		goto out;
	}
	block->type = SMS_HTONL(data[offset], data[offset + 1],
		data[offset + 2], data[offset + 3]);
	block->is_pchksum_present = data[offset + 4];
	block->pchksum = data[offset + 5];
	block->is_ychksum_present = data[offset + 6];
	block->ychksum = data[offset + 7];
	block->blk_size = SMS_HTONL(data[offset + 8], data[offset + 9],
		data[offset + 10], data[offset + 11]);
	block->nr_subblocks = SMS_HTONL(data[offset + 12], data[offset + 13],
		data[offset + 14], data[offset + 15]);
	offset += 16;

	block->data = kmemdup(&data[offset], block->blk_size, GFP_KERNEL);
	if (!block->data) {
		offset = -ENOMEM;
		goto out;
	}
	offset += block->blk_size;

out:
	return offset;
}

Additionally if you defined 'struct tasdev_blk' to reflect data which 
you copy here it can probably be simplified further to simple memcpy, 
instead of doing field by field assignments, which would reduce amount 
of code significantly and make it easier to read.


Above applies to all similar parsing in the patch.


> +static int fw_parse_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdevice_data *img_data, const struct firmware *fmw,
> +	int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +	struct tasdev_blk *blk;
> +	unsigned int i;
> +

...

> +
> +#define SMS_HTONS(a, b)		((((a)&0x00FF)<<8) | ((b)&0x00FF))
> +#define SMS_HTONL(a, b, c, d)	((((a)&0x000000FF)<<24) | \
> +	(((b)&0x000000FF)<<16) | (((c)&0x000000FF)<<8) | \
> +	((d)&0x000000FF))
> +

Kernel has htons and htonl (in 
source/include/linux/byteorder/generic.h), but I assume that this means 
that your FW may use different endianness than host cpu (big endian?), 
so I would suggest using be16_to_cpu and be32_to_cpu macros instead, as 
this should be more understandable in this case.


