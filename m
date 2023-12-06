Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FD807489
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 17:08:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4F086E;
	Wed,  6 Dec 2023 17:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4F086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701878889;
	bh=iF42xifAlQE9L9Ww4BClL77KuEmCTAx16tvJqKHki3o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V4WlvH/0RsezwKws8uQg+dlh3kPwjUJ9+a2z2T14kM9Bt4+T0FTZiM81Ewa5kRZWc
	 xf77LriRdaZJqNsvaZywcGBQHbYh98815+2HNoj9/SW/V1b21eAMWy5HdjtM+w38qD
	 2oALid8HKSlK+IEpcWMCa4IRjM/sQAIFSN5oBn6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C731F8057C; Wed,  6 Dec 2023 17:07:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61B1CF8055C;
	Wed,  6 Dec 2023 17:07:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E8D8F8024E; Wed,  6 Dec 2023 17:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABDF7F800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 17:07:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDF7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fwIgRtzq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701878848; x=1733414848;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=iF42xifAlQE9L9Ww4BClL77KuEmCTAx16tvJqKHki3o=;
  b=fwIgRtzqEkkDq6978St+lCIUFGno3qCLup8C6wVA35MF7yA24QU+Tcbp
   YiaRhVN688XiMOVxYSdh2qMLpOiSP2EZGvqle+JK/rLzVQ5ye/r/QuSLW
   Zsox8trHx2kMp/gRIc01ZS9mtO8PjlOlqFBOnDK1ujdKNWWZp2pndQsMR
   xBE1ikjK18Og/N9FDR9bhwLu8W9d3PG5YYJny9/LOph4MB8mBg9Cr/Oel
   4sC1ippFe3da7B9MNlBPHva0hau7lNG3TheWs1DpIJTnTbMC62/3Q8Vbl
   lx2SAXUVivCaibwQ4tRs9azdy2yR14coRerAurIy3gdlt4DL8tVDk6UsG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7380576"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600";
   d="scan'208";a="7380576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889395632"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600";
   d="scan'208";a="889395632"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:07:18 -0800
Message-ID: <4cd78962-027c-4bbb-a42a-6ccbca81ac8e@linux.intel.com>
Date: Wed, 6 Dec 2023 17:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <cover.1701733441.git.soyer@irl.hu>
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
 <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
 <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
 <9c3846ae0da417c0fe5d4fa2d9d4134143184dda.camel@irl.hu>
 <830d8e26-dbb9-4b9c-bbab-a5c4c49a7ffd@linux.intel.com>
Content-Language: en-US
In-Reply-To: <830d8e26-dbb9-4b9c-bbab-a5c4c49a7ffd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DT4IHIS7R64DXGWDCUGWMVT6QAD6TKJP
X-Message-ID-Hash: DT4IHIS7R64DXGWDCUGWMVT6QAD6TKJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DT4IHIS7R64DXGWDCUGWMVT6QAD6TKJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/5/2023 6:22 PM, Pierre-Louis Bossart wrote:
> 
> 
>>>>>> +static void tas2563_fixup_i2c(struct hda_codec *cdc,
>>>>>> +	const struct hda_fixup *fix, int action)
>>>>>> +{
>>>>>> +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");
>>>>>
>>>>> Any specific reason to use an Intel ACPI identifier? Why not use
>>>>> "TIAS2563" ?
>>>>>

Will just note that prefix should probably be TXNW (not TIAS) as 
discussed recently on list.

>>>> INT8866 is in the ACPI.
>>>> I don't know why Lenovo uses this name.
>>>> I think it's more internal than intel.
>>>>
>>>>     Scope (_SB.I2CD)
>>>>      {
>>>>          Device (TAS)
>>>>          {
>>>>              Name (_HID, "INT8866")  // _HID: Hardware ID
>>>
>>> Ouch, I hope they checked with Intel that this isn't an HID already in
>>> use...
>>>
>> It looks the INT prefix is not reserved. (yet)
>> https://uefi.org/ACPI_ID_List?acpi_search=INT
> 
> It's been de-facto reclaimed by Intel over the years, apparently using
> INTC or INTL was too hard for some of my colleagues...
> 

Perhaps it should be reserved then, so it is present on above list?

> There are lots of INT devices in the kernel today, here's a small list
> for sound/soc/codecs only
> 
> rt274.c:        { "INT34C2", 0 },
> rt286.c:        { "INT343A", 0 },
> rt298.c:        { "INT343A", 0 },
> ssm4567.c:      { "INT343B", 0 },
> 
> Those INT values were added by Intel teams though, it's really odd to
> see Lenovo use an INT-based HID. Should really use 104C2563 or something.

I will just note that those RT ones are used on quite old RVPs, and yes 
I would have also preferred if they had used "real" IDs, but it is 
unlikely that anyone fixes it after all this time ;).

Adding Andy to CC, as he commented recently about problematic 
assignments of ACPI IDs on this list, maybe he can shed some light on 
the "INT" prefix.
