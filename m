Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B9CE897
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 18:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2301654;
	Mon,  7 Oct 2019 18:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2301654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570464341;
	bh=fNTHyuGU1CHrlDJ6oxhx5eRGIeYsvvpz7pe4DEa0aHs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYGF554feIKLl9lzQv9QqnjbJXfYj+kyPhwDZU0B3+3ECDNYg3YADUdgFWsgGGHOn
	 mjcmqdGBcCJp4xTxOrS6gt87oNp02/7LHhTgO5KLJwGHj6NptP/XQFNFvbkFrxRaIY
	 whfRuY+jqfoxTK3gnHYDDG3AVXM5fb1w2VkoyN0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C505F802BD;
	Mon,  7 Oct 2019 18:03:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3F26F802BE; Mon,  7 Oct 2019 18:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E3B7F800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 18:03:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 63689A003F;
 Mon,  7 Oct 2019 18:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 63689A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1570464231; bh=NZb5/D+rnz/kRHXNzldZdD36U2AB8mw11hoRen9P4PU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WW6YpdhncuWVEmbLg6yMJNK/qFDzLYKajE2iKCBytRwZfKcZaBw3v8h0zMmnr6bDe
 1ePxGMm2LoWn5LUPMzKdTnH75uqxnDvPCwkHbQ7rmfebdmv3tuE0mkWOCEPmcAEYBe
 +v2O+Mv8gztdoyESc/Q9/5Gr4sHsON7xJZA1Rr0I=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  7 Oct 2019 18:03:47 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191006152232.17701-1-perex@perex.cz>
 <fd997c93-c7c9-6ede-90c2-a94df93a613e@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d79e7cdd-2f94-1f00-0025-907682ab9988@perex.cz>
Date: Mon, 7 Oct 2019 18:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fd997c93-c7c9-6ede-90c2-a94df93a613e@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH v3] ALSA: hda: add Intel DSP configuration
 / probe code
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 07. 10. 19 v 16:05 Pierre-Louis Bossart napsal(a):
> 
> 
> On 10/6/19 10:22 AM, Jaroslav Kysela wrote:
>> For distributions, we need one place where we can decide
>> which driver will be activated for the auto-configation of the
>> Intel's HDA hardware with DSP. Actually, we cover three drivers:
>>
>> * Legacy HDA
>> * Intel SST
>> * Intel Sound Open Firmware (SOF)
>>
>> All those drivers registers similar PCI IDs, so the first
>> driver probed from the PCI stack can win. But... it is not
>> guaranteed that the correct driver wins.
>>
>> This commit changes Intel's NHLT ACPI module to a common
>> DSP probe module for the Intel's hardware. All above sound
>> drivers calls this code. The user can force another behaviour
>> using the module parameter 'dsp_driver' located in
>> the 'snd-intel-dspcfg' module.
>>
>> This change allows to add specific dmi checks for the specific
>> systems. The examples are taken from the pull request:
>>
>>    https://github.com/thesofproject/linux/pull/927
>>
>> Tested on Lenovo Carbon X1 7th gen.
> 
> Thanks Jaroslav, I like the ideas in the patch, the flags+DMI table is 
> quite elegant.
> 
> We will need to do additional checks for the quirks, e.g. I know there 
> is a 'Phaser' Chromebook with HDaudio and I don't recall if they use 
> DMICs. I also don't know if we always have the NHTL information when the 
> legacy BIOS is used.
> 
> It's likely that we will have multiple iterations before getting this 
> right. And we'll have to add SoundWire support as well (which isn't that 
> hard, I already have all the ACPI parsing needed to detect if a link is 
> enabled).
> 
> Some additional comments below.
> 
>> +module_param(dsp_driver, int, 0444);
>> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
>> +
>> +#define FLAG_SST		(1<<0)
>> +#define FLAG_SOF		(1<<1)
>> +#define FLAG_SOF_ONLY_IF_DMIC	(1<<16)
>> +
>> +struct config_entry {
>> +	u32 flags;
>> +	u16 device;
>> +	const struct dmi_system_id *dmi_table;
>> +};
>> +
>> +/*
>> + * configuration table - the order of entries is important!
> 
> It's not really the order but the exclusion between SST and SOF for the 
> same PCI ID?

Yes, I'll rephrase this as:

* configuration table
* - the order of similar PCI ID entries is important!
* - the first successful match will win

>> + */
>> +static const struct config_entry config_table[] = {
>> +/* Cometlake-LP */
>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
>> +	{
>> +		/* prefer SST */
>> +		.flags = FLAG_SST,
>> +		.device = 0x02c8,
>> +	},
>> +#elif IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
>> +	{
>> +		.flags = FLAG_SOF,
> 
> need to add FLAG_SOF_ONLY_IF_DMIC

Aaghrr. We have 0x02C8 not 0x02c8 in hda_intel.c so I didn't found them using
the case-sensitive grep. I will fix that.

>> +		.device = 0x02c8,
>> +	},
>> +#endif
>> +/* Cometlake-H */
>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
>> +	{
>> +		.flags = FLAG_SST,
>> +		.device = 0x06c8,
>> +	},
>> +#elif IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
>> +	{
>> +		.flags = FLAG_SOF,
> 
> | FLAG_SOF_ONLY_IF_DMIC
> 
>> +		.device = 0x06c8,
>> +	},
>> +#endif
>> +/* Merrifield */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
>> +	{
>> +		.flags = FLAG_SOF,
>> +		.device = 0x119a,
>> +	},
>> +#endif
>> +/* Broxton-T */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>> +	{
>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>> +		.device = 0x1a98,
>> +	},
>> +#endif
>> +/* Geminilake */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>> +	{
>> +		.flags = FLAG_SOF,
> 
> can we have more than one table per PCI ID? e.g. in this case it'd be 
> good to have the DMIC case separate from Google.

Yes, first match wins. So we need to add flags = FLAG_SOF |
FLAG_SOF_ONLY_IF_DMIC entry bellow the dmi exceptions for device == 0x3198, too?

> 
>> +		.device = 0x3198,
>> +		.dmi_table = (const struct dmi_system_id []) {
>> +			{
>> +				.ident = "Google Chromebooks",
>> +				.matches = {
>> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
>> +				}
>> +			},
>> +			{}
>> +		}
>> +	},
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
> 
> should it be elif, as done for CometLake/CML?

I though that the SST driver is the default for 0x3198. Or the legacy driver
is in the game, too? If yes, we need to add conditional SST entries.

>> +	{
>> +		.flags = FLAG_SST,
>> +		.device = 0x3198,
>> +	},
>> +#endif
>> +/* Icelake */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
>> +	{
>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>> +		.device = 0x34c8,
>> +	},
>> +#endif
>> +/* Elkhart Lake */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
>> +	{
>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>> +		.device = 0x4b55,
>> +	},
>> +#endif
>> +/* Appololake (Broxton-P) */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>> +	{
>> +		.flags = FLAG_SOF,
>> +		.device = 0x5a98,
>> +		.dmi_table = (const struct dmi_system_id []) {
>> +			{
>> +				.ident = "Up Squared",
>> +				.matches = {
>> +					DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
>> +					DMI_MATCH(DMI_BOARD_NAME, "UP-APL01"),
>> +				}
>> +			},
>> +			{}
>> +		}
>> +	},
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
> 
> elif?

Same. What's the default driver for APL?

> 
>> +	{
>> +		.flags = FLAG_SST,
>> +		.device = 0x5a98,
>> +	},
>> +#endif
>> +/* Cannonlake */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
>> +	{
>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>> +		.device = 0x9dc8,
>> +	},
>> +#endif
>> +/* Sunrise Point-LP */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_SKYLAKE)
>> +	{
>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>> +		.device = 0x9d70,
>> +	},
>> +#endif
>> +/* Kabylake-LP */
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_KABYLAKE)
>> +	{
>> +		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
>> +		.device = 0x9d71,
>> +	},
>> +#endif
> 
> SKL and SKL are not supported by SOF for now, and SST doesn't support 
> HDaudio+DMIC combinations
> 
> This should be FLAG_SST but only for Google Chromebooks, e.g.
> 
> 
> 		.flags = FLAG_SST,
> 		.device = 0x9d70 or 0x9d71
> 		.dmi_table = (const struct dmi_system_id []) {
> 			{
> 				.ident = "Google Chromebooks",
> 				.matches = {
> 					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> 				}
> 			},
> 			{}
> 		}
> 	},
> 

Added. Will be in v4. Thanks for all of the input.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
