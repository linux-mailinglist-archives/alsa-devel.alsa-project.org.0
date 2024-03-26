Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CF88C685
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A833D2408;
	Tue, 26 Mar 2024 16:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A833D2408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466057;
	bh=N5vpAX5ok4BXjms0T9fuLUBgLvF4hsCxME6vnFJ3oyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b3/3tnwq57UCf40Z1816j9W5uymFQz87+Xz4Tq6sRbN31ezwqXw2QM3NjTbDyOr98
	 Q+hoby17r1hMNXClzpbCtwhN5qAifNogy4u65yS+iWAx/O0sP/3S/w61ZcEGRtFNEA
	 4I0nii/nb6sRol4vSgPz1fGJf2u0T5Lhrkv8hcA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F3AF8057E; Tue, 26 Mar 2024 16:13:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 133C6F805A9;
	Tue, 26 Mar 2024 16:13:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC278F8055C; Tue, 26 Mar 2024 16:13:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACB78F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB78F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XW/2J1Dj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711466015; x=1743002015;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N5vpAX5ok4BXjms0T9fuLUBgLvF4hsCxME6vnFJ3oyc=;
  b=XW/2J1DjcVvPhq7DN9c510/xWqnckHBepJHJaeONgnYO5HNktLhqW+C/
   CPL+NPI9naxyzN+l9DUlIBPAQTDObBJcJpKJaFiwhHni2h3z+7AO25x0p
   +8PRqT8N03/Dsc6hpHRQ8ZYTW3IXwZbsOBwEa9RIeDEUMjJSw6+DBR7Em
   63m+IPf2zXjtzWZmgbNdHsa50E7aerIeiljC7ZjM9bmd0+MS/GDjmbKPk
   s+AE5c82M6BJKer2H5OEqSs/f3Wq0e0Zbyy/+NxyrYR7kP5E9xkdjog6z
   W++C4mZVCf0/1b5cIsYQkWyeIaOpft95k2WN37/zBcAzbpKGp4EY1jl4j
   w==;
X-CSE-ConnectionGUID: u0dD4gwJQWaBvU9E7qvHMw==
X-CSE-MsgGUID: WDnG7NpNTX+Ac0HhbEN5OQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="9489023"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="9489023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="15862590"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO [10.212.65.108])
 ([10.212.65.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:13:28 -0700
Message-ID: <bc8d97e2-6742-4ca3-bd6a-143fe88f617b@linux.intel.com>
Date: Tue, 26 Mar 2024 10:00:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
Content-Language: en-US
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "13916275206@139.com" <13916275206@139.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "mengdong.lin@intel.com" <mengdong.lin@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "Lu, Kevin" <kevin-lu@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
 "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>
References: <20240319135811.186-1-shenghao-ding@ti.com>
 <34f404cd-a12d-4ffa-9398-72de3be244b3@linux.intel.com>
 <51a81ac8aace456aae7d07634912367c@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <51a81ac8aace456aae7d07634912367c@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KCWL6DXYFZP5FZF6B7OBWKJW5DX2VBRP
X-Message-ID-Hash: KCWL6DXYFZP5FZF6B7OBWKJW5DX2VBRP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCWL6DXYFZP5FZF6B7OBWKJW5DX2VBRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +
>>> +	/* Check Calibrated Data V2 */
>>> +	if (tmp_val[0] == 2783) {
>>> +		const struct calibdatav2_info calib_info = {
>>> +			.number_of_devices = tmp_val[1],
>>> +			.crc32_indx = 3 + tmp_val[1] * 6,
>>> +			.byt_sz = 12 + tmp_val[1] * 24,
>>> +			.cali_data = &tmp_val[3]
>>> +		};
>>> +
>>> +		if (calib_info.number_of_devices >
>> TAS2783_MAX_DEV_NUM ||
>>> +			calib_info.number_of_devices == 0) {
>>> +			dev_dbg(tas_dev->dev, "No dev in calibrated data
>> V2.");
>>
>> the log is not aligned with the first condition where you have too many
>> devices.
>>
>> It's not clear why it's not an error.
> playback still work without calibrated data stored in UEFI, for example bypass mode.
> Even if in case of bypass mode, algo can still work with default calibrated data.
> So, not an error.

I would use a dev_info with a clearer message that defaults are used,
e.g. along the lines of

dev_info(tas_dev->dev, "using default calibration data, no device found
in EFI data v2").

dev_warn would work as well if this is really not expected.
