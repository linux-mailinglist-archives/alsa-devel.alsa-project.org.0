Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960AB80595F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 17:02:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F42B208;
	Tue,  5 Dec 2023 17:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F42B208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701792123;
	bh=eX8OhMZSokhyU5v3JSffkIZ6nySYH16Uvt5sYcjUftY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yc7afxG1r3wuid20pNVNe+tqxTa+HfCfajicnD++/O0rrOWczJTXiu6ND3C7RzYWo
	 DyyiyYAiHL1iHt9CRluvV4R7gPCUfeQ973PA51lY3mrPd8RE/C/gPeNDTWv5aoBUh9
	 DJ38TBb5QnH+hgpu7yQz9fqYumVhyNSFop3Ue9Oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA6FEF80568; Tue,  5 Dec 2023 17:01:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC96F800AC;
	Tue,  5 Dec 2023 17:01:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0702CF8024E; Tue,  5 Dec 2023 17:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96BEBF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 17:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BEBF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LRjxj5Cw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701792078; x=1733328078;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eX8OhMZSokhyU5v3JSffkIZ6nySYH16Uvt5sYcjUftY=;
  b=LRjxj5CwejeaFmrX2HYqI/mmSFf4NbHcsb0C/a1Q5fs7EpzQMmAKSUGh
   mHHjR43jM2WPu9ShE9ziiyO4sCunEmAJLWFixP19d7tkJo1V+RLyJoCEG
   h73dgNaI84UXy7DVXmPeJyPKWXaaxqkEAmMpETw4zZIGqLKOFd8Z1ouTk
   hCG0xtGLooCM0DGhoQEwcxA4F1HDTag/na4PNMJnCNJ5aSwwxbA9b+sqE
   keBEHAz5ZLwTueGnPAOJ+wu6cktT1QceQpeS+yXVUv05tAH6SJLwKX6Qi
   NH2aXY5wd/8gb4ho5go9ef46jVVnRvhFT+gvK9aM3VtncJg7bGaF76KY1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="758203"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="758203"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 08:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="914845112"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="914845112"
Received: from mbapna-mobl1.amr.corp.intel.com (HELO [10.212.151.198])
 ([10.212.151.198])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 08:01:09 -0800
Message-ID: <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
Date: Tue, 5 Dec 2023 10:01:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
Content-Language: en-US
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <cover.1701733441.git.soyer@irl.hu>
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
 <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AEMOX2M6FXDEEGUCH2ESAGWCV5Y6PYG6
X-Message-ID-Hash: AEMOX2M6FXDEEGUCH2ESAGWCV5Y6PYG6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEMOX2M6FXDEEGUCH2ESAGWCV5Y6PYG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>> +
>>> +static void tas2563_fixup_i2c(struct hda_codec *cdc,
>>> +	const struct hda_fixup *fix, int action)
>>> +{
>>> +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");
>>
>> Any specific reason to use an Intel ACPI identifier? Why not use
>> "TIAS2563" ?
>>
> INT8866 is in the ACPI.
> I don't know why Lenovo uses this name.
> I think it's more internal than intel.
> 
>    Scope (_SB.I2CD)
>     {
>         Device (TAS)
>         {
>             Name (_HID, "INT8866")  // _HID: Hardware ID

Ouch, I hope they checked with Intel that this isn't an HID already in
use...

>             Name (_UID, Zero)  // _UID: Unique ID
>             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource
> Settings
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     I2cSerialBusV2 (0x004C, ControllerInitiated,
> 0x00061A80,
>                         AddressingMode7Bit, "\\_SB.I2CD",
>                         0x00, ResourceConsumer, , Exclusive,
>                         )
>                     I2cSerialBusV2 (0x004D, ControllerInitiated,
> 0x00061A80,
>                         AddressingMode7Bit, "\\_SB.I2CD",
>                         0x00, ResourceConsumer, , Exclusive,
>                         )
>                     GpioInt (Edge, ActiveLow, SharedAndWake, PullNone,
> 0x0000,
>                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>                         )
>                         {   // Pin list
>                             0x0020
>                         }
>                 })
>                 Return (RBUF) /* \_SB_.I2CD.TAS_._CRS.RBUF */
>             }
> 
>             Method (_STA, 0, NotSerialized)  // _STA: Status
>             {
>                 Return (0x0F)
>             }
>         }
>     }

>>> +static int tas2563_system_resume(struct device *dev)
>>> +{
>>> +	int ret;
>>> +	struct tas2563_data *tas2563 = dev_get_drvdata(dev);
>>> +
>>> +	dev_dbg(tas2563->dev, "System Resume\n");
>>> +
>>> +	ret = pm_runtime_force_resume(dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	for (int i = 0; i < tas2563->ndev; ++i)
>>> +		tas2563_tasdev_setup(tas2563, &tas2563->tasdevs[i]);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct dev_pm_ops tas2563_hda_pm_ops = {
>>> +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume)
>>
>> where's the pm_runtime stuff?
>>
> 
> The amp stores its state in software shutdown mode.
> The tas2563_hda_playback_hook wakes/shutdowns the amp, not the
> pm_runtime.

My point was that you have all these pm_runtime_ calls in the code, but
nothing that provides pm_runtime suspend-resume functions so not sure
what exactly the result is?


