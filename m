Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55436CA7BE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 16:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDDD210;
	Mon, 27 Mar 2023 16:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDDD210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679927553;
	bh=ZzKtHhDArkoXCCLzATYG9vE13jPDCh6NMhFB6ze5+nY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhhYcP4bNo9Lj+rXsN52raMKGReR5PaZoM1G5VOZJxgfmZ1iIBrVrBLWFBq1E9eg7
	 nRsC4ceuhDAF9tenQBUZqGgeWaoS0JdPd/dQlOY0SganWHxr0w8UbOlCkMOWkFg2Rx
	 M/u8xIWZPQ7uXqvWVkeNHw1vYY21VREqKwHxISvM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B45FF8024E;
	Mon, 27 Mar 2023 16:31:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BD96F80272; Mon, 27 Mar 2023 16:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCBD0F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 16:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBD0F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D2ZS+xxS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679927490; x=1711463490;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZzKtHhDArkoXCCLzATYG9vE13jPDCh6NMhFB6ze5+nY=;
  b=D2ZS+xxSAMG2NDBuE3wzRNPsMR9iyynYJ0QA1u7rHibzTfDDu77IHj6y
   cOzHaAHRNubeU/KEG30RqtxfO3GAUCEdWjf9jb/QNZsCZ7qrzuBKO4oWk
   p2GbQQfbfUrrHAaklJBNsCOWgn/jVln3E+yItoTT2cb90i3yaztr22sM7
   RvZEYRC3TJzJaNGPjpDVyH933hFGkpxpjzdNPix9+4urDizWe9NbQxeEP
   vaQm5hSScPTH0YBDXSXmbOi5tR05mV43kAkuoiMGoByciuPH6iQFZzkKB
   5UB1urg4V1WRip50TEsSksagXAwSS9zEN/vfQKhbb13z7iHZFpT7OqqQ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320677863"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="320677863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 07:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="676982848"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="676982848"
Received: from dchheda-mobl2.amr.corp.intel.com (HELO [10.212.176.72])
 ([10.212.176.72])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 07:30:58 -0700
Message-ID: <18a04b79-bbba-2f58-8e9c-5446aa0eb34d@linux.intel.com>
Date: Mon, 27 Mar 2023 09:20:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v8] ASoC: tas2781: Add tas2781 driver
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz
References: <20230327105157.21752-1-13916275206@139.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230327105157.21752-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O3YVNMUTM6KERQXDUC5JWBN4X4JMATK5
X-Message-ID-Hash: O3YVNMUTM6KERQXDUC5JWBN4X4JMATK5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3YVNMUTM6KERQXDUC5JWBN4X4JMATK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code looks much better, and now that you've replaced all the -1
error codes with -EINVAL or -ENOMEM we can see clearly cases with memory
leaks in the error handling path.

> +	/* Skip the unused prog_size */
> +	offset += (4 * (TASDEVICE_MAXPROGRAM_NUM_KERNEL -
> +		tas_fmw->nr_programs));
> +
> +	if (offset + 4 > fmw->size) {
> +		dev_err(tas_dev->dev, "%s: Configurations error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	tas_fmw->nr_configurations = SMS_HTONL(buf[offset], buf[offset + 1],
> +		buf[offset + 2], buf[offset + 3]);
> +	offset += 4;
> +
> +	/* The max of conf for more than equal to 4 pcs of tas2781s is
> +	 * different from the one less than 4 pcs of tas2781s.
> +	 */

Consider rewording, this comment is just confusing. Not sure what 'pcs'
means here, and "more than equal' and 'one less than' should be replaced
by 'greater than' and 'lower than'.

> +static int fw_parse_data(struct tasdevice_fw *tas_fmw,
> +	struct tasdevice_data *img_data, const struct firmware *fmw,
> +	int offset)
> +{
> +	const unsigned char *data = (unsigned char *)fmw->data;
> +	struct tasdev_blk *blk;
> +	unsigned int i;
> +	int n;
> +
> +	if (offset + 64 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: Name error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	memcpy(img_data->name, &data[offset], 64);
> +	offset += 64;
> +
> +	n = strlen((char *)&data[offset]);
> +	n++;
> +	if (offset + n > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: Description error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	offset += n;
> +
> +	if (offset + 2 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: Blocks error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	img_data->nr_blk = SMS_HTONS(data[offset], data[offset + 1]);
> +	offset += 2;
> +
> +	img_data->dev_blks = kcalloc(img_data->nr_blk,
> +		sizeof(struct tasdev_blk), GFP_KERNEL);
> +	if (!img_data->dev_blks) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +	for (i = 0; i < img_data->nr_blk; i++) {
> +		blk = &(img_data->dev_blks[i]);
> +		offset = fw_parse_block_data(tas_fmw, blk, fmw, offset);
> +		if (offset < 0) {
> +			offset = -EINVAL;
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	return offset;

memory leak on img_data->dev_blks, you need to free memory in the error
handling path.

> +}
> +
> +static int fw_parse_calibration_data(struct tasdevice_priv *tas_dev,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	struct tasdevice_calibration *calibration;
> +	unsigned char *data = (unsigned char *)fmw->data;
> +	unsigned int i, n;
> +
> +	if (offset + 2 > fmw->size) {
> +		dev_err(tas_dev->dev, "%s: Calibrations error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	tas_fmw->nr_calibrations = SMS_HTONS(data[offset], data[offset + 1]);
> +	offset += 2;
> +
> +	if (tas_fmw->nr_calibrations != 1) {
> +		dev_err(tas_dev->dev,
> +			"%s: only support one calibraiton(%d)!\n",
> +			__func__, tas_fmw->nr_calibrations);
> +		goto out;
> +	}
> +
> +	tas_fmw->calibrations = kcalloc(tas_fmw->nr_calibrations,
> +		sizeof(struct tasdevice_calibration), GFP_KERNEL);
> +	if (!tas_fmw->calibrations) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +	for (i = 0; i < tas_fmw->nr_calibrations; i++) {
> +		if (offset + 64 > fmw->size) {
> +			dev_err(tas_dev->dev, "Calibrations error\n");
> +			offset = -EINVAL;

memory leak on tas_fmw->calibrations, you need to change the error
handling path.

> +			goto out;
> +		}
> +		calibration = &(tas_fmw->calibrations[i]);
> +		offset += 64;
> +
> +		n = strlen((char *)&data[offset]);
> +		n++;
> +		if (offset + n > fmw->size) {
> +			dev_err(tas_dev->dev, "Description err\n");
> +			offset = -EINVAL;
> +			goto out;
> +		}
> +		offset += n;
> +
> +		if (offset + 1 > fmw->size) {
> +			dev_err(tas_dev->dev, "%s: Prog err, offset = %d\n",
> +				__func__, offset);
> +			offset = -EINVAL;
> +			goto out;
> +		}
> +		offset++;
> +
> +		if (offset + 1 > fmw->size) {
> +			dev_err(tas_dev->dev, "%s: Conf err, offset = %d\n",
> +				__func__, offset);
> +			offset = -EINVAL;
> +			goto out;
> +		}
> +		offset++;
> +
> +		offset = fw_parse_data(tas_fmw, &(calibration->dev_data), fmw,
> +			offset);
> +		if (offset < 0)
> +			goto out;
> +	}
> +
> +out:
> +	return offset;
> +}
> +
> +static int fw_parse_program_data(struct tasdevice_priv *tas_dev,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	unsigned char *buf = (unsigned char *)fmw->data;
> +	struct tasdevice_prog *program;
> +	int i;
> +
> +	if (offset + 2 > fmw->size) {
> +		dev_err(tas_dev->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	tas_fmw->nr_programs = SMS_HTONS(buf[offset], buf[offset + 1]);
> +	offset += 2;
> +
> +	if (tas_fmw->nr_programs == 0) {
> +		/*Not error in calibration Data file, return directly*/
> +		dev_info(tas_dev->dev, "%s: No Programs data, maybe calbin\n",
> +			__func__);
> +		goto out;
> +	}
> +
> +	tas_fmw->programs =
> +		kcalloc(tas_fmw->nr_programs, sizeof(struct tasdevice_prog),
> +			GFP_KERNEL);
> +	if (!tas_fmw->programs) {
> +		offset = -ENOMEM;
> +		goto out;
> +	}
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		int n = 0;
> +
> +		program = &(tas_fmw->programs[i]);
> +		if (offset + 64 > fmw->size) {
> +			dev_err(tas_dev->dev, "%s: mpName error\n", __func__);
> +			offset = -EINVAL;
> +			goto out;

and memory leak here as well.

Stopping the review here, please revisit the error handling. you
probably need two labels when memory is allocated, and a kfree() for one
of the two.
