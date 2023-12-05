Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8DE805B13
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 18:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1C661CE;
	Tue,  5 Dec 2023 18:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1C661CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701796998;
	bh=MeDMLrXfTdh4yho03MywBVkvXJzOkrKUTV/2+kLOfuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H2bftNpUMg3e5z26BVrLKx1dKRCEa2x+Y5G6RKXVz6OoZOsEcTQqaZ8DOgasRoJIt
	 NCD/HcbskKoB8rvTo+gcUFZnWcdmX9MUCv/VAj57ySVLwA3qRga/xYuQTtmPqa0gHq
	 Jj6fkIk0+9juHOJPlQMVA3T7aUaemAuc7I0KJ4B0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3529F80571; Tue,  5 Dec 2023 18:22:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E3F1F80579;
	Tue,  5 Dec 2023 18:22:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8175DF8024E; Tue,  5 Dec 2023 18:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AAC4F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 18:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AAC4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aenZMG1o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701796959; x=1733332959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MeDMLrXfTdh4yho03MywBVkvXJzOkrKUTV/2+kLOfuo=;
  b=aenZMG1oW0eUUJHxxGniIzDNDOPr7Sh7wDhQ07fAsqeB/tjj9u1hfyX+
   xwiEXKgt3WNJxi1ONpZisoA1+2tcLBG6+bsbEKY4+kv+n7Wrr8SuXut+P
   YhNm/Az874vLULzLEUnhraRv1o6YSottr0yhSkE3yhGrbJ20YpeI2Uv6l
   3ZbX2W57URK0DJsbvPT1p+fvYbQ4inzohm6B0DX68fx8mi5iaPSLMhKuW
   58vk6+hRfdbtr2ryfndkNrkbR2W+iLJ8+PH1Gk1kI8UX3qp/5u7OUUv/Q
   aKrS/rnlieGLRJX7xY4Sa6h59G/ZzCkd2C8yqLNqs24a9/V0wLIJx8zlW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458246971"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="458246971"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774702299"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="774702299"
Received: from mbapna-mobl1.amr.corp.intel.com (HELO [10.212.151.198])
 ([10.212.151.198])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 09:22:33 -0800
Message-ID: <830d8e26-dbb9-4b9c-bbab-a5c4c49a7ffd@linux.intel.com>
Date: Tue, 5 Dec 2023 11:22:32 -0600
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
 <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
 <9c3846ae0da417c0fe5d4fa2d9d4134143184dda.camel@irl.hu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9c3846ae0da417c0fe5d4fa2d9d4134143184dda.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SL5R3A4DEOY257K6CHV7YLRFIRWPXSB7
X-Message-ID-Hash: SL5R3A4DEOY257K6CHV7YLRFIRWPXSB7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SL5R3A4DEOY257K6CHV7YLRFIRWPXSB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>>>>> +static void tas2563_fixup_i2c(struct hda_codec *cdc,
>>>>> +	const struct hda_fixup *fix, int action)
>>>>> +{
>>>>> +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");
>>>>
>>>> Any specific reason to use an Intel ACPI identifier? Why not use
>>>> "TIAS2563" ?
>>>>
>>> INT8866 is in the ACPI.
>>> I don't know why Lenovo uses this name.
>>> I think it's more internal than intel.
>>>
>>>    Scope (_SB.I2CD)
>>>     {
>>>         Device (TAS)
>>>         {
>>>             Name (_HID, "INT8866")  // _HID: Hardware ID
>>
>> Ouch, I hope they checked with Intel that this isn't an HID already in
>> use...
>>
> It looks the INT prefix is not reserved. (yet)
> https://uefi.org/ACPI_ID_List?acpi_search=INT

It's been de-facto reclaimed by Intel over the years, apparently using
INTC or INTL was too hard for some of my colleagues...

There are lots of INT devices in the kernel today, here's a small list
for sound/soc/codecs only

rt274.c:        { "INT34C2", 0 },
rt286.c:        { "INT343A", 0 },
rt298.c:        { "INT343A", 0 },
ssm4567.c:      { "INT343B", 0 },

Those INT values were added by Intel teams though, it's really odd to
see Lenovo use an INT-based HID. Should really use 104C2563 or something.


>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct dev_pm_ops tas2563_hda_pm_ops = {
>>>>> +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume)
>>>>
>>>> where's the pm_runtime stuff?
>>>>
>>>
>>> The amp stores its state in software shutdown mode.
>>> The tas2563_hda_playback_hook wakes/shutdowns the amp, not the
>>> pm_runtime.
>>
>> My point was that you have all these pm_runtime_ calls in the code, but
>> nothing that provides pm_runtime suspend-resume functions so not sure
>> what exactly the result is?
>>
>>
> I think nothing. I haven't experienced anything unusual recently.

you can probably see from the /sys directory what the pm_runtime power
state is, most likely the status is 'unknown'.
