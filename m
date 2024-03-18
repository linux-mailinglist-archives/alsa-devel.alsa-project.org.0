Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2487E57A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 10:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399BD240A;
	Mon, 18 Mar 2024 10:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399BD240A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710753220;
	bh=g8C3AW8Pp9g1XGrLlgppqk+fTtxc6q/BL7/maZ9K/aU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bte4REavcijeQRVK+xxSSZTKqt7f6zu6V82mQC9cazmw97E7WfukYNrj+cSQGZIkf
	 tfK6oSIppfRN17D9EhWzDYfVshpVTzWMGuIsxZlbdAL5rlq9jYIWUK23Gk31XsBJny
	 Yox9Vx8mt5jdyPFldoVhEmO0jf580XSGwCJS2zHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04FB3F805A1; Mon, 18 Mar 2024 10:13:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23127F805A1;
	Mon, 18 Mar 2024 10:13:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DBD0F804E7; Mon, 18 Mar 2024 10:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A81AFF80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 10:12:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A81AFF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nTDg4H9M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710753170; x=1742289170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g8C3AW8Pp9g1XGrLlgppqk+fTtxc6q/BL7/maZ9K/aU=;
  b=nTDg4H9MKvijePDtRrlKZzbIJX0NYvhSgLbj+m9iiqtzKZXY2zEGoyA5
   Fgt68TqdB3rqsRF/cxQCmTbsA/psUri9FeXTEgKwZh8Lmor2/D2BDWxFV
   M2nieWMi/8vHydtAWqJSam5+JItodHzyBKbRdlaj1TDVLhkCdaycwFvs1
   wA3Sbsl1nxGf3QLr8AooEjkWMhaBLAwgFMMmDGMBsLeCFvZCTLO0DOqKP
   mFPPsRFLghdwDlgtLMQpZlT6+7rLbo/0mt21LrPofT5UN8LH3GJHXe4p0
   ZLUQeeYfJLzSgb9hUtk3bfDHy/c8e6HGWU0JVqvzOnVEtPWzo6Pq1vIpe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5680032"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000";
   d="scan'208";a="5680032"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000";
   d="scan'208";a="13510543"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:12:40 -0700
Message-ID: <89231582-bc4e-4729-8dc1-bac190c28e00@linux.intel.com>
Date: Mon, 18 Mar 2024 10:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "13916275206@139.com" <13916275206@139.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "mengdong.lin@intel.com" <mengdong.lin@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "Lu, Kevin" <kevin-lu@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "soyer@irl.hu" <soyer@irl.hu>, "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>
References: <20240305132646.638-1-shenghao-ding@ti.com>
 <2efb5250-25f3-465e-81fc-cb885027b481@linux.intel.com>
 <4e2006ff96a446978dd1996eeaa42099@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <4e2006ff96a446978dd1996eeaa42099@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DLHMFFRHDH4CM7BBD5ZSHFSOFZEGWNKJ
X-Message-ID-Hash: DLHMFFRHDH4CM7BBD5ZSHFSOFZEGWNKJ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLHMFFRHDH4CM7BBD5ZSHFSOFZEGWNKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/16/2024 1:44 PM, Ding, Shenghao wrote:
> Thanks for your comments. Kindly see the feedback
> 
>> -----Original Message-----
>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Sent: Wednesday, March 6, 2024 12:05 AM
>> To: Ding, Shenghao <shenghao-ding@ti.com>; broonie@kernel.org
>> Cc: andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com;
>> perex@perex.cz; pierre-louis.bossart@linux.intel.com;
>> 13916275206@139.com; alsa-devel@alsa-project.org; linux-
>> kernel@vger.kernel.org; liam.r.girdwood@intel.com; bard.liao@intel.com;
>> mengdong.lin@intel.com; yung-chuan.liao@linux.intel.com; Lu, Kevin
>> <kevin-lu@ti.com>; tiwai@suse.de; soyer@irl.hu; Baojun.Xu@fpt.com;
>> Navada Kanyana, Mukund <navada@ti.com>
>> Subject: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
>> driver
>>
>> On 3/5/2024 2:26 PM, Shenghao Ding wrote:
>>> The tas2783 is a smart audio amplifier with integrated MIPI SoundWire
>>> interface (Version 1.2.1 compliant), I2C, and I2S/TDM interfaces
>>> designed for portable applications. An on-chip DSP supports Texas
>>> Instruments SmartAmp speaker protection algorithm. The integrated
>>> speaker voltage and current sense provides for real-time monitoring of
>> loudspeakers.
>>>
>>> The ASoC component provides the majority of the functionality of the
>>> device, all the audio functions.
>>>
>>> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
>>>
>>> ---
>>
>> ...
> ...
>>> +struct tasdevice_priv {
>>> +	struct snd_soc_component *component;
>>
>> Apart from being assigned this field seems to be unused.
> This field can help to get the point to "struct tasdevice_priv" in tasdevice_sdw_pcm_hw_free,
> tasdevice_sdw_hw_params, tasdevice_mute
> 

This field is unused in those functions, in all of them you get 
component from dai, via dai->component, and tas_priv from this component 
via snd_soc_component_get_drvdata, which is wrapper around 
dev_get_drvdata, which just returns dev->driver_data.

