Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B69FACE8DE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 18:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4518C1612;
	Mon,  7 Oct 2019 18:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4518C1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570464955;
	bh=nZcAUvKn1lDM/Hf+V7jjwy2BxPnsrpdKjGzGP6mvl0E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vl9a/4mAairzMX3Inf2rBFkEUK2uniplqOUTtobtBOb4aHxr0GG6VezYEcK7P30W8
	 iYIkyyG9G3JyXrOgBye4BN78R4CO/JIoLF4gzFzgA/8M+Yu1tMie+spLauhff+MbgW
	 p+WwFxrRNRSPRJvq6NgV7VkGvEhYej7o9wxKDCqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EEB6F802BE;
	Mon,  7 Oct 2019 18:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B9EF802BE; Mon,  7 Oct 2019 18:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B440F800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 18:14:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 38FEAA003E;
 Mon,  7 Oct 2019 18:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 38FEAA003E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1570464844; bh=JH1M2tTYqnA+645nxMbq3gxdi7bemumYieZeyxx0pV4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kEj2+PNeBL2yVBBkxIW4wFkpYutNAu21xIl90zIMEjAFAmm0nlC6cKcQf/SNEzIIb
 dznMEyexZzg7no+4quHka1O7fs3M6KKshigFWqsoOUbludo9YFQ8I7lkXxD4YO2R8t
 q84xtZREa+5eJmoRE/mCPAQ5bvljjCapCK6mJAL4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  7 Oct 2019 18:14:00 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191006152232.17701-1-perex@perex.cz>
 <s5h5zl1jpcx.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <faa55989-4e04-3463-384f-1bb35e5d3816@perex.cz>
Date: Mon, 7 Oct 2019 18:13:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h5zl1jpcx.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 07. 10. 19 v 3:50 Takashi Iwai napsal(a):
> On Sun, 06 Oct 2019 17:22:32 +0200,
> Jaroslav Kysela wrote:
>>
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
>>   https://github.com/thesofproject/linux/pull/927
>>
>> Tested on Lenovo Carbon X1 7th gen.
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Since I've been still traveling, just a few nitpicking:
> 
>> --- a/sound/hda/Makefile
>> +++ b/sound/hda/Makefile
>> @@ -14,5 +14,8 @@ obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
>>  #extended hda
>>  obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
>>  
>> -snd-intel-nhlt-objs := intel-nhlt.o
>> -obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o
>> +snd-intel-dspcfg-objs := intel-dsp-config.o
>> +ifneq ($(CONFIG_ACPI),)
>> +  snd-intel-dspcfg-objs += intel-nhlt.o
>> +endif
> 
> This can be simplified by
>   snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o

Yes, I added the ACPI condition later and didn't return back to Makefile.
Fixed in v4 (will post after comments from Pierre-Louis).

>> --- /dev/null
>> +++ b/sound/hda/intel-dsp-config.c
>> @@ -0,0 +1,247 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2019 Jaroslav Kysela <perex@perex.cz>
>> +
>> +#include <sound/core.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/dmi.h>
>> +#include <sound/intel-nhlt.h>
>> +#include <sound/intel-dsp-config.h>
> 
> Please put sound/core.h after linux/*.h inclusions.
> Also in general the inclusions are arranged in the alphabetical order
> nowadays.

Uff. Rules and rules for rules. Will fix that in v4.

>> +int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>> +{
>> +	const struct config_entry *cfg;
>> +
>> +	if (dsp_driver > 0 && dsp_driver <= SND_INTEL_DSP_DRIVER_LAST)
>> +		return dsp_driver;
>> +
>> +	/* Intel vendor only */
>> +	if (snd_BUG_ON(pci->vendor != 0x8086))
>> +		return SND_INTEL_DSP_DRIVER_ANY;
>> +
>> +	/*
>> +	 * detect DSP by checking class/subclass/prog-id information
>> +	 * class=04 subclass 03 prog-if 00: no DSP, use legacy driver
>> +	 * class=04 subclass 01 prog-if 00: DSP is present
>> +	 *  (and may be required e.g. for DMIC or SSP support)
>> +	 * class=04 subclass 03 prog-if 80: use DSP or legacy mode
>> +	 */
>> +	if (pci->class == 0x040300)
>> +		return SND_INTEL_DSP_DRIVER_LEGACY;
>> +	if (pci->class != 0x040100 && pci->class != 0x040380) {
>> +		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDA legacy driver\n", pci->class);
>> +		return SND_INTEL_DSP_DRIVER_LEGACY;
>> +	}
> 
> If we treat this as an error, we should provide a code to work around
> this (e.g. quirk entry or such), so that the error can be avoided
> later.
It' s really an error. This path should not be executed with the known,
functional hardware. The user might use dsp_driver module parameter to change
the behaviour.

> 
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
> ....
>> @@ -124,7 +124,7 @@ static char *patch[SNDRV_CARDS];
>>  static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
>>  					CONFIG_SND_HDA_INPUT_BEEP_MODE};
>>  #endif
>> -static bool dmic_detect = IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC);
>> +static bool no_dsp_driver;
>>  
>>  module_param_array(index, int, NULL, 0444);
>>  MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
>> @@ -159,8 +159,8 @@ module_param_array(beep_mode, bool, NULL, 0444);
>>  MODULE_PARM_DESC(beep_mode, "Select HDA Beep registration mode "
>>  			    "(0=off, 1=on) (default=1).");
>>  #endif
>> -module_param(dmic_detect, bool, 0444);
>> -MODULE_PARM_DESC(dmic_detect, "DMIC detect on SKL+ platforms");
>> +module_param(no_dsp_driver, bool, 0444);
>> +MODULE_PARM_DESC(no_dsp_driver, "Force this driver to be used and bypass the DSP driver selection");
> 
> A negative option is often confusing, e.g. you may pass like
> no_dsp_driver=no.  Better to use a positive form if possible.

I just tried to copy the dmic_detect value, but yes, it might be confusion. I
will change that in v4.

				Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
