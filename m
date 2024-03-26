Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C140788C693
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:15:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA7F299C;
	Tue, 26 Mar 2024 16:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA7F299C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466156;
	bh=IXO2Ah9koWHS0go21qzTnPnEoE9lxBreFqClDNUhmqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YJUBtQU4RDt/2I+xCB7bqjQjTAzNxTeArQhrSvMuI5HueCLHEuwi0m+SzVrgfKPV7
	 qjpYAGA58ZRz0FZLKuujiwLZtBR6piafGsN/JMNYmNBNhj19mCg+zvXckxcTIiGnHs
	 XGJgR9eZcnTSypnkhsMt6g7AHw+oVm7MMHOOGFGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F727F805AC; Tue, 26 Mar 2024 16:15:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E0AF80570;
	Tue, 26 Mar 2024 16:15:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B7DF802DB; Tue, 26 Mar 2024 16:15:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E71F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E71F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=alYwVYnM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711466115; x=1743002115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IXO2Ah9koWHS0go21qzTnPnEoE9lxBreFqClDNUhmqY=;
  b=alYwVYnMioNPqC/wIqTa810L6SFJMrXtqOXgh21xVpHothfJstFOnwHI
   WdhM4AE+H2lPX5ZtkEvpq4LADGJuBbd1q/m6jUxS3ClKtDw20ttp1jO0Q
   w/5o5Gao8eq8D7NhknemSy6DuSy9IKOvTZOI2PZXAOmvEOfiys7ZmJgXG
   BgbdKWhdF7OQmarcu0fY9orU5mcghLGXsa+XbXkPF96bb67tyowgBOVfj
   3b02S4sIgEoyHfbZrLxBJ8KnDAHetOAkBgduJ+j00Y/NAcXixsuaXVdiu
   LiE1vYe97IxgMuywmWkDRuPLVi2MMJEOqtRosnxQKFZkmsSAuue7L59oM
   A==;
X-CSE-ConnectionGUID: 6wqA9GN0SASD0HdQW1BWTA==
X-CSE-MsgGUID: jIfXSzvfRdqr/zEOr4mJww==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6418684"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="6418684"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914883002"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="914883002"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:15:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp8Vz-0000000GKtR-3fxl;
	Tue, 26 Mar 2024 17:15:03 +0200
Date: Tue, 26 Mar 2024 17:15:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v1 7/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Message-ID: <ZgLmd64URUOJ0pB9@smile.fi.intel.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-7-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326010905.2147-7-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 4MDRK2GGJ454MTV72FP2JQOT6UHXXDXB
X-Message-ID-Hash: 4MDRK2GGJ454MTV72FP2JQOT6UHXXDXB
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MDRK2GGJ454MTV72FP2JQOT6UHXXDXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 26, 2024 at 09:09:04AM +0800, Baojun Xu wrote:
> Firmware binary load lib code for tas2781 spi driver.

...

> +// tas2781_spi_fwlib.c -- TASDEVICE firmware support

Please, remove file names from the files. This is just a burden: in case the
file gets renamed, often people forgot to update its contents.

Same applies to all such cases.

...

> +#define ERROR_PRAM_CRCCHK			0x0000000
> +#define ERROR_YRAM_CRCCHK			0x0000001
> +#define	PPC_DRIVER_CRCCHK			0x00000200

Stray TAB after define.

...

> +	/* In most projects are many audio cases, such as music, handfree,
> +	 * receiver, games, audio-to-haptics, PMIC record, bypass mode,
> +	 * portrait, landscape, etc. Even in multiple audios, one or
> +	 * two of the chips will work for the special case, such as
> +	 * ultrasonic application. In order to support these variable-numbers
> +	 * of audio cases, flexible configs have been introduced in the
> +	 * dsp firmware.

DSP

> +	 */

/*
 * The correct style of the multi-line comments
 * outside of net subsystem is depicted here. Please,
 * follow and update all the comments accordingly.
 */

...

> +	cfg_info = kzalloc(sizeof(struct tasdevice_config_info), GFP_KERNEL);

sizeof(*cfg_info)
Same applies to all similar cases.


> +	if (!cfg_info) {
> +		*status = -ENOMEM;
> +		goto out;
> +	}

...

> +	if (tas_priv->rcabin.fw_hdr.binary_version_num >= 0x105) {
> +		if (config_offset + 64 > (int)config_size) {

Explicit casting and to signed (sic!) is prone to mistakes. Can you refactor
to get rid of the casting?

> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
> +			goto out;
> +		}
> +		config_offset += 64;
> +	}

...

> +	if (config_offset + 4 > (int)config_size) {

Ditto.

> +		*status = -EINVAL;
> +		dev_err(tas_priv->dev, "add config: Out of boundary\n");
> +		goto out;
> +	}

...

> +	/* convert data[offset], data[offset + 1], data[offset + 2] and
> +	 * data[offset + 3] into host
> +	 */

See above about comment style.

...

> +	cfg_info->nblocks =
> +		be32_to_cpup((__be32 *)&config_data[config_offset]);

Castings to bitwise types is something that should not happen.
So, this looks like homegrown version of get_unaligned_be32().

...

> +	bk_da = cfg_info->blk_data = kcalloc(cfg_info->nblocks,
> +		sizeof(struct tasdev_blk_data *), GFP_KERNEL);

sizeof(*bk_da) ?

> +	if (!bk_da) {
> +		*status = -ENOMEM;
> +		goto out;
> +	}

...

> +		if (bk_da[i]->block_type == TASDEVICE_BIN_BLK_PRE_POWER_UP) {
> +			if (bk_da[i]->dev_idx == 0)
> +				cfg_info->active_dev =
> +					(1 << tas_priv->ndev) - 1;
> +			else
> +				cfg_info->active_dev |= 1 <<
> +					(bk_da[i]->dev_idx - 1);

Use BIT()

> +

Stray blank line.

> +		}

...

> +		bk_da[i]->yram_checksum =
> +			be16_to_cpup((__be16 *)&config_data[config_offset]);
> +		config_offset += 2;
> +		bk_da[i]->block_size =
> +			be32_to_cpup((__be32 *)&config_data[config_offset]);
> +		config_offset += 4;
> +
> +		bk_da[i]->n_subblks =
> +			be32_to_cpup((__be32 *)&config_data[config_offset]);

get_unaligned_beXX() in all cases, beyond and above.

...

> +out:

Useless label, return directly.

> +	return cfg_info;

This also applies to many places in the code.

...

So, I have stopped here as I believe you have already enough material to rework
the series. I believe with my comments addressed you may shrink the code base
by ~5%.

Also next version probably needs a cover letter to explain a bit
what is this for and why you split patches in the unusual way and how you
suggested to get them working in between (to pass bisectability test).

-- 
With Best Regards,
Andy Shevchenko


