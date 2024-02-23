Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2986077A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 01:14:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A3F847;
	Fri, 23 Feb 2024 01:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A3F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708647285;
	bh=4EONJpHLKVvplBQ1JdsOvXRqsXqzysjuQvWLs1B0/2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CytmrU5ERxp1QoC0KJuKLuLt4g20WxPJ36jyoUWqL/HFHejqPuYeU23RKQNWbN9zV
	 hP6iKeeimBWXCgJHlHa0pLl9XLEKRmBM74e2Hk0SX9dxd6dUc+X9yGobt2o/00lVNz
	 och5U5HWUWTXWcq9wpWPf56JzVM+Vx47M7EqoJWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78896F8057D; Fri, 23 Feb 2024 01:14:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2749CF80587;
	Fri, 23 Feb 2024 01:14:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DADDAF80496; Fri, 23 Feb 2024 01:14:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE335F80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 01:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE335F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=na8BMeIg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708647243; x=1740183243;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4EONJpHLKVvplBQ1JdsOvXRqsXqzysjuQvWLs1B0/2M=;
  b=na8BMeIgboQ0GVLwh6EapNFw/3BDEnMgZzhy+qNxHdbGRnSTuU3zWgOS
   AG5JoOuTu7iVdfqCPLnNsRn4JnSO3ak3rvDEVGJRmyfP+qI2keLQSnvc5
   VEYxTQdTqhtUA5fo7zcdZDe5ct6YZ4SsPAQb4KbSsTm6Inz9jrDxHy1Lf
   7LpYiJ1oEdVVYPrMQFX51Fi4r3gj+WfgH3UxphmAcxpMpOwRJ/nOsnD/A
   nsjbq6NtLnYaURszOvCZpa0E+oy2hcyQ1qi2OHBFnGeFMluPlcO906FNv
   kYBHI+A6X1HP3S/b8I+/y8OqjdgzItkxo3SzGBEfmJPBm+FAI2m9n736m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13497031"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="13497031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 16:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="10363862"
Received: from smsalasl-mobl.amr.corp.intel.com (HELO [10.246.128.93])
 ([10.246.128.93])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 16:13:55 -0800
Message-ID: <10f53a13-a0ff-40f9-b089-f5baacdb76b6@linux.intel.com>
Date: Thu, 22 Feb 2024 19:13:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] ASoc: tas2783: Add tas2783 codec driver
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 bard.liao@intel.com, mengdong.lin@intel.com,
 yung-chuan.liao@linux.intel.com, baojun.xu@ti.com, kevin-lu@ti.com,
 tiwai@suse.de, soyer@irl.hu
References: <20240222074000.659-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240222074000.659-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AYGUCMOHDCAES7YVY4UDJDBBMVBFCBMJ
X-Message-ID-Hash: AYGUCMOHDCAES7YVY4UDJDBBMVBFCBMJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYGUCMOHDCAES7YVY4UDJDBBMVBFCBMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/22/24 2:40 AM, Shenghao Ding wrote:
> The tas2783 is a smart audio amplifier with integrated MIPI SoundWire
> interface (Version 1.2.1 compliant), I2C, and I2S/TDM interfaces designed
> for portable applications. An on-chip DSP supports Texas Instruments
> SmartAmp speaker protection algorithm. The integrated speaker voltage and
> current sense provides for real-time monitoring of lodspeakers.

loudspeakers.


> +static void tas2783_apply_calib(struct tasdevice_priv *tas_dev,
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

I think we are at the 4th iteration where I have to repeat myself...

In the SoundWire spec, the unique_id is *LINK SPECIFIC*, and only used 
at the bus level within the context of a link to help avoid enumeration 
conflicts

If you are using the unique_id as a SYSTEM-UNIQUE value to lookup EFI 
data, this is a TI-specific requirement that needs to be documented. 
That also means you need to double-check for errors so make sure there 
are no board configurations where the same unique_id is used in multiple 
links, or by devices other than tas2783.



