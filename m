Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F77DBF40
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 18:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB206950;
	Mon, 30 Oct 2023 18:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB206950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698687728;
	bh=HQPbEJwDYJoTRJSOJp2zhcD6tw8Fd/fvwRJqyc7v2D0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TIPvxVLRaZ0N0+LB9Ad+L6JZE5NmZc0+KGoSh7ZLF+LPeySMUDTgF3b+3XJjxFhd0
	 6FF8JGREz0LvP5xb47ZE8/S9jte4tvCMpXAvsTcusKq3h9feTari8T0bPShjzDsCNZ
	 XcbBY1Q5ZZB54CpeBljaGAT7O0AKDJw8gZ/6pd2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BC54F8014B; Mon, 30 Oct 2023 18:41:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EA3F80166;
	Mon, 30 Oct 2023 18:41:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20FE7F8016D; Mon, 30 Oct 2023 18:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AAB5F8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 18:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAB5F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eA42OAlg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698687667; x=1730223667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HQPbEJwDYJoTRJSOJp2zhcD6tw8Fd/fvwRJqyc7v2D0=;
  b=eA42OAlgSy3h051sZQmYkkfgaMeuGTZYD+aXispD+Nr/cuwn6JOBNGJq
   WkfmDc+VQndVHusfYzKpIFNCN4mVpEodb1WxvXRHeTKVnEK4N2RF1xcPc
   M69a5Je/Yqgc8Avw48psWZ82tw2Uy1WGQ7GCiSxYcS5mNCAtUYPee/z3n
   dLbO83fCl/ChOabrq7mqfG72QosR4cezd+fjgyOltf6nvbdZCBnZ74w/g
   J6DutoNEdHWT974rEwWvVfZcg3Xg4GEwY1LShf72eVnnOCZlqBpA/uTpJ
   Kvq8L8wPSoSynLpWopQTsanHTdwGeFnGrjYUhjWzFM9Q7TKKZ4AXnt7hb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9652517"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="9652517"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 10:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="710163443"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="710163443"
Received: from wezedi-mobl1.amr.corp.intel.com (HELO [10.212.223.192])
 ([10.212.223.192])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 10:40:59 -0700
Message-ID: <9b94488e-206d-419b-92ed-e70aab11907b@linux.intel.com>
Date: Mon, 30 Oct 2023 12:40:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Baojun Xu <baojun.xu@ti.com>, lgirdwood@gmail.com, perex@perex.cz,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kevin-lu@ti.com,
 shenghao-ding@ti.com, peeyush@ti.com, navada@ti.com, tiwai@suse.de
References: <20231028092409.96813-1-baojun.xu@ti.com>
 <7f4465c1-5e8e-4c5f-bbff-d2c930326986@linux.intel.com>
 <9d922584-288a-4b73-83ef-477d1bc58521@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9d922584-288a-4b73-83ef-477d1bc58521@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PX3BC5H4UT5KM5HYZT57OFGSRUSTFM3J
X-Message-ID-Hash: PX3BC5H4UT5KM5HYZT57OFGSRUSTFM3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PX3BC5H4UT5KM5HYZT57OFGSRUSTFM3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/30/23 12:20, Mark Brown wrote:
> On Mon, Oct 30, 2023 at 11:05:39AM -0500, Pierre-Louis Bossart wrote:
> 
>>> +static bool tas2783_readable_register(struct device *dev, unsigned int reg)
>>> +{
>>> +	switch (reg) {
>>> +	case 0x000 ... 0x080:	/* Data port 0. */
> 
>> No, this is wrong. All the data port 'standard' registers are "owned" by
>> the SoundWire core and handled during the port prepare/configure/bank
>> switch routines. Do not use them for regmap.
> 
>> In other words, you *shall* only define vendor-specific registers in
>> this codec driver.
> 
> This seems to come up a moderate amount and is an understandable thing
> to do - could you (or someone else who knows SoundWire) perhaps send a
> patch for the regmap SoundWire integration which does some validation
> here during registration and at least prints a warning?

Good suggestion, we could indeed check that the registers are NOT in the
range [0,0xBF] for all ports - only the range [0xC0..FF] is allowed for
implementation-defined values. I'll try to cook something up.

> Also worth noting that the default is going to be that the registers are
> readable if the driver doesn't configure anything at all so perhaps at
> least for just readability this might be worth revisiting.

Having the interrupt registers as readable could be problematic, there's
a known race condition where the drivers need to do a read after a
write, and I am a bit worried if we have two agents reading the same
thing. It's the only case I am aware of where a read establishes a state.

>>> +static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
>>> +	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
>>> +	SND_SOC_DAPM_AIF_OUT("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
>>> +		0, 0),
>>> +	SND_SOC_DAPM_SPK("SPK", NULL),
>>> +	SND_SOC_DAPM_OUTPUT("OUT"),
>>> +	SND_SOC_DAPM_INPUT("DMIC")
>>> +};
> 
>> Can you clarify what "ASI" is?
> 
> ASI seems to be a fairly commonly used name in TI devices...  In general
> naming that corresponds to the datasheet should be fine, especially for
> internal only things like this sort of DAPM widget.  I'd guess it's
> something like Audio Serial Interface but not actually gone and looked.

I was only asking was the acronym stood for to make it easier to
look-up. Not asking for any technical details.
