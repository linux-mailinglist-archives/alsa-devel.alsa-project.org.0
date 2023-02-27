Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66536A49FC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 19:40:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E633082E;
	Mon, 27 Feb 2023 19:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E633082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677523202;
	bh=XI4+ng0G/han3RQEY/xW6B4U/2rCkKwLGFaf1iDMkc4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JT0A80B3edPU4REXn1KplFXqMvBIqmvdyc7CV+rBt1jUXJ7X1pYsibw9a8M9PZhTm
	 +P1k7FTL6U5Mk9BiWMW5KPwhk9buk2ssQRe3OQ2YDV+YR+LQi5Ip/JeSlh7r01eeaT
	 wsUBphJlEVS5/KPtivU9kKDsBj4a0ZxWpZ2qucg0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10739F8051B;
	Mon, 27 Feb 2023 19:38:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12630F80520; Mon, 27 Feb 2023 19:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A90F5F804FE
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 19:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90F5F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k8FLzPwP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677523126; x=1709059126;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XI4+ng0G/han3RQEY/xW6B4U/2rCkKwLGFaf1iDMkc4=;
  b=k8FLzPwP5IjwPkkuPyjoNrMxeYCLNz2BPeHoNJeccLwecwzCNad7qSDn
   PXtOp8bWGx9ByA47fb7VagDkRzKAf7dnXN9aCVX9oeL3FkEbFpQD366E3
   /LWw1y0APXyW/PjYHbJleSHosFY45NvjZSuPI8cts/dsJI4HRFOB4InuO
   +1b7jA8Geh3jVETNMS0ePqXcj6BXQKLzY6Jj7NT4MRrTY1jfs0Kv+cGIo
   2dg3905OszWiIHxt2gi1wzyUzTptUDW//LzxD/WUfMv7+WWSy30zPrvU8
   h/Qe+BXhKGPjictRxKveHAsUcYhztGNcDvrWYPY2mWSRx/HriWFwRpyw3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332660742"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="332660742"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 10:38:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="737837214"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="737837214"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 10:38:32 -0800
Message-ID: <d95d15f3-34c3-32df-1a50-0ebce35bf81f@linux.intel.com>
Date: Mon, 27 Feb 2023 13:19:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ASoC: max98363: add soundwire amplifier driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
 <0fb47fe7-719b-0773-fc14-3d62d7d33619@linux.intel.com>
 <Y/zsqjOWFKrpDtl8@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y/zsqjOWFKrpDtl8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LI5DY7TMCBVWRX6IR4AXRADDBNCZ544G
X-Message-ID-Hash: LI5DY7TMCBVWRX6IR4AXRADDBNCZ544G
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>, lgirdwood@gmail.com,
 tiwai@suse.com, krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LI5DY7TMCBVWRX6IR4AXRADDBNCZ544G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/27/23 12:47, Mark Brown wrote:
> On Mon, Feb 27, 2023 at 10:17:45AM -0500, Pierre-Louis Bossart wrote:
> 
>>> +static struct reg_default max98363_reg[] = {
>>> +	{MAX98363_R0040_SCP_INIT_STAT_1, 0x00},
>>> +	{MAX98363_R0041_SCP_INIT_MASK_1, 0x00},
>>> +	{MAX98363_R0042_SCP_INIT_STAT_2, 0x00},
>>> +	{MAX98363_R0044_SCP_CTRL, 0x00},
>>> +	{MAX98363_R0045_SCP_SYSTEM_CTRL, 0x00},
>>> +	{MAX98363_R0046_SCP_DEV_NUMBER, 0x00},
>>> +	{MAX98363_R004D_SCP_BUS_CLK, 0x00},
>>> +	{MAX98363_R0050_SCP_DEV_ID_0, 0x21},
>>> +	{MAX98363_R0051_SCP_DEV_ID_1, 0x01},
>>> +	{MAX98363_R0052_SCP_DEV_ID_2, 0x9F},
>>> +	{MAX98363_R0053_SCP_DEV_ID_3, 0x87},
>>> +	{MAX98363_R0054_SCP_DEV_ID_4, 0x08},
>>> +	{MAX98363_R0055_SCP_DEV_ID_5, 0x00},
> 
>> That seems wrong, why would you declare standard registers that are
>> known to the bus and required to be implemented?
> 
> This is the register defaults table, it gets used to initialise the
> register cache and optimise resync after suspend - all this does is
> supply defaults for the cache.  That said...
> 
> I would suggest it's better to not supply defaults for ID registers and
> read them back from the device otherwise things might get confused.

The 'device_id' register is the good counter example: it includes a
'unique_id' field to deal with cases where there are identical devices
on the same link. The unique_id is usually set with board-specific
pin-strapping, so there's no good default value here. In previous Maxim
98373 amplifier configurations the unique IDs were 3 and 7 IIRC. The
codec driver should not, rather shall not, assume any specific value here.

>>> +static const struct regmap_config max98363_sdw_regmap = {
>>> +	.reg_bits = 32,
>>> +	.val_bits = 8,
>>> +	.max_register = MAX98363_R21FF_REV_ID,
>>> +	.reg_defaults  = max98363_reg,
>>> +	.num_reg_defaults = ARRAY_SIZE(max98363_reg),
>>> +	.readable_reg = max98363_readable_register,
>>> +	.volatile_reg = max98363_volatile_reg,
> 
>> I don't see why the SoundWire standard registers are part of regmap?
> 
> ...if there's an issue with the SoundWire core modifying the registers
> directly then the driver would need to mark all the core registers as
> volatile so that they're not cached otherwise there will be collisions.
> Or is it the case that we always need to go via the SoundWire core for
> the generic registers, so they should just never be written at all?

It's really that the SoundWire core will 'own' or take care of all
'standard' programming registers. There is no good reason for a codec
driver to interfere with standard port programming or clock stop. The
bus provides a set of callbacks that can be used for vendor-specific
registers and sequences.

Put differently, SoundWire codec drivers should only deal with
non-standard vendor-specific registers.


> 
>>> +	if (max98363->dvddio) {
>>> +		ret = regulator_enable(max98363->dvddio);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +	}
>>> +
>>> +	if (max98363->vdd) {
>>> +		ret = regulator_enable(max98363->vdd);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +	}
> 
>> that is very very odd. It's the first time we see a SoundWire codec
>> driver that has a power dependency, and it's quite likely that it's too
>> late to enable power resources *AFTER* dealing with all the
>> initialization and enumeration.
> 
>> It's not even clear to me how this device would be enumerated.
> 
>> You'd need to explain what part of the amplifier is controlled by those
>> regulator, otherwise it's impossible to review and understand if the
>> driver does the 'right thing'
> 
> It's also buggy to have regulators treated as optional unless they may
> be physically absent.
