Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A207D782C96
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 16:49:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0DDB7F1;
	Mon, 21 Aug 2023 16:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0DDB7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692629354;
	bh=z/sAa1IJAYlQYXxIT9CdQ54Bgm5M0LUT0D4Zccze5GE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uazsO8D2Ihy4PRaGxvuPPHOEAK4692UIf/08UpsqyZuwczntZQbzVamKLd2C9BC4I
	 o0gK0SM0XlPM6rNzRq7BnbILruSH3y0ELHkQbHPEccHjKMqTd/AbpZPaVIGhUxoZ3q
	 w8rb5ZFogeD184BaiN/AoQFw5pjsieKI4d1MRfkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C64AF80508; Mon, 21 Aug 2023 16:48:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 275CBF8016C;
	Mon, 21 Aug 2023 16:48:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA40AF80199; Mon, 21 Aug 2023 16:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA1DCF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1DCF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A/7wAQUV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692629294; x=1724165294;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z/sAa1IJAYlQYXxIT9CdQ54Bgm5M0LUT0D4Zccze5GE=;
  b=A/7wAQUVna+jmSe5Ex+DV7dc5xrfbdKDlLOfSkpB6Qbc5ygLc1XB4Nq4
   YCISd2xCr8kOn2P7rbIDl8wKoLW/+FgeAyY7jl3/ZE3fskyoNI6tkABGr
   3g54dvJgS4BUm0LrAgZx6OmBiXAGw3jJDjeuPm0D8ouGQoWcPp9Sp8ueU
   AvfPKV4tslGJC1UvNIDPnQt/dd6xGLShBpc/BYdAalvVomBKDRTTcNCEO
   vB8CkM+NJM4JmG90LJtFLlTI4wcAC0Ew/CkCU1UweX8wUBZgf9zsAzPUL
   NcnqNcgjUk2pXhA4FERQLvwv/984WMQQEsYoefubeS3WEAoztT7GkaFYC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353180736"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="353180736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729456087"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="729456087"
Received: from bogatsen-mobl1.gar.corp.intel.com (HELO [10.213.186.228])
 ([10.213.186.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:48:05 -0700
Message-ID: <146f393a-665b-110b-b55b-d3452c3123e8@linux.intel.com>
Date: Mon, 21 Aug 2023 09:43:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, robh+dt@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, mengdong.lin@intel.com, baojun.xu@ti.com,
 thomas.gfeller@q-drop.com, peeyush@ti.com, navada@ti.com,
 broonie@kernel.org, gentuser@gmail.com
References: <20230818085558.1431-1-shenghao-ding@ti.com>
 <9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com>
 <87il9a9hu2.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87il9a9hu2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZIJRM33ZHKCLBEIH3XWC2LPA7EIWMGN4
X-Message-ID-Hash: ZIJRM33ZHKCLBEIH3XWC2LPA7EIWMGN4
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIJRM33ZHKCLBEIH3XWC2LPA7EIWMGN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +static void tas2781_hda_playback_hook(struct device *dev, int action)
>>> +{
>>> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
>>> +
>>> +	dev_dbg(tas_priv->dev, "%s: action = %d\n", __func__, action);
>>> +	switch (action) {
>>> +	case HDA_GEN_PCM_ACT_OPEN:
>>> +		pm_runtime_get_sync(dev);
>>
>> test if this actually works?
> 
> To be fair, most of driver codes don't check it, including the
> HD-audio core.  (Actually, over 900 of 1300 calls have no check in the
> whole tree.)
> 
> It implies that forcing the check in each place is moot; rather the
> helper needs to be coded not to fail, IMO.

Maybe that's true for HDaudio, for the SoundWire parts we absolutely
need to detect if the resume worked. There are more steps involved, the
clock-stop mode entry/exit, context restoration, re-enumeration, etc.

I think it'd be a mistake to sit on our hands and assume the world is
perfect. We have to track cases where the codec isn't properly resumed
and prevent it from accessing resources that are just unavailable.

>>> +static int tas2781_system_suspend(struct device *dev)
>>> +{
>>> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	dev_dbg(tas_priv->dev, "System Suspend\n");
>>> +
>>> +	ret = pm_runtime_force_suspend(dev);
>>> +	if (ret)
>>> +		return ret;
>>
>> that's usually the other way around, for system suspend you either want
>> the device to be pm_runtime active, or if it's already suspended do nothing.
>>
>> This is very odd to me.
> 
> This is a normal procedure, as stated in pm_runtime_force_suspend()
> definition:
> 
> /**
>  * pm_runtime_force_suspend - Force a device into suspend state if needed.
> ....
>  * Typically this function may be invoked from a system suspend callback to make
>  * sure the device is put into low power state and it should only be used during
>  * system-wide PM transitions to sleep states.  It assumes that the analogous
>  * pm_runtime_force_resume() will be used to resume the device.

It's possible that it's fine for HDaudio, it wouldn't work in all cases
for SoundWire where we have to make sure all pm_runtime suspended
devices are brought back to D0 and then the regular system suspend
happens. That's mainly because pm_runtime suspend relies on clock stop
and system suspend does not.

In other words, this isn't a generic solution at all.

