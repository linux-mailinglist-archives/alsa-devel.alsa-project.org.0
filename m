Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52190C8E86
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 18:41:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37F71675;
	Wed,  2 Oct 2019 18:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37F71675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570034460;
	bh=tmj5j2XON/c8ENoD7LTDCMDC2tRGJ++Edugv1/w4KGI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRmVd+6+kocnsA5mat23ypWbqKELpxB2ptpXZUCkO8MiCITOSgX/mCUtqLTiv+CDs
	 K36H49los62cvraRFnVVbrcIBUaZ6rBLv6qx+tsi+XDWMMFxyaTuLxBYQQUXH/ySuE
	 Y3K3mRQN9UaXGETEwHENOYYk028bApWJbBtWM9KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8B7F8016F;
	Wed,  2 Oct 2019 18:39:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC4CF80391; Wed,  2 Oct 2019 18:39:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79833F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 18:39:08 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 692D7A003F;
 Wed,  2 Oct 2019 18:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 692D7A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1570034348; bh=IQdBe0T32cl+iyR/4LJuxf3UDu7hwUOshMo2X0x9JPA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MbDqi/tJDBExIfd7UhpJb4mJ5SPmIz8BKyzd+NTB+g8AbGG5HjWu46/RQcGaZ/L/j
 aZ864OM8e143Voi3QWg+Mof7tUAfG+aiAcJCW0q7rlodOjov4ijnWxEf2DWCSKYaMl
 LDwJrVImec/PHJusB8oPdgA/4azPAa6aDs/bfCk0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Oct 2019 18:39:04 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191002113545.13500-1-perex@perex.cz>
 <28b45461-cb0e-0e1f-5007-98c4b15565d1@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3f7aabee-afac-c83e-e529-29e6abc8c104@perex.cz>
Date: Wed, 2 Oct 2019 18:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <28b45461-cb0e-0e1f-5007-98c4b15565d1@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: add Intel DSP configuration /
	probe code
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

Dne 02. 10. 19 v 18:00 Pierre-Louis Bossart napsal(a):
> Thanks Jaroslav, see comments below.
> 
> No real objections on the concept, but we should fold NODSP/LEGACY 
> together, deal with all the PCI IDs handled by SOF and deal with the 
> cases where we want the SKL driver (SKL/KBL/APL Chromebooks with DMICs)

Thank you for your comment. It was just a first shot to resolve the detection
issue properly.

>> diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
>> new file mode 100644
>> index 000000000000..700f86282a83
>> --- /dev/null
>> +++ b/include/sound/intel-dsp-config.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + *  intel-dsp-config.h - Intel DSP config
>> + *
>> + *  Copyright (c) 2019 Jaroslav Kysela <perex@perex.cz>
>> + */
>> +
>> +#ifndef __INTEL_DSP_CONFIG_H__
>> +#define __INTEL_DSP_CONFIG_H__
>> +
>> +struct pci_dev;
>> +
>> +enum {
>> +	SND_INTEL_DSP_DRIVER_ANY = 0,
>> +	SND_INTEL_DSP_DRIVER_NODSP,
>> +	SND_INTEL_DSP_DRIVER_LEGACY,
> 
> not sure what 'LEGACY' means here? This is really the same as NODSP.
> 
>> +	SND_INTEL_DSP_DRIVER_SST,
>> +	SND_INTEL_DSP_DRIVER_SOF,
>> +	SND_INTEL_DSP_DRIVER_LAST = SND_INTEL_DSP_DRIVER_SOF
>> +};
> 
>> +static int dsp_driver;
>> +
>> +module_param(dsp_driver, int, 0444);
>> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=noDSP, 2=legacy, 3=SST, 4=SOF)");
> 
> Same here, noDSP==legacy.

I just had a good feeling to add another state where we know that the DSP is
not present. But yes, for the driver selection it's an extra state and
everything will fall-back to the legacy hda driver.

>> +
>> +static const u16 sof_skl_table[] = {
> 
> we should remove the reference to SKL, this is historical and there are 
> already 2 generations that have little to do with SKL.
> 
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
>> +	0x02c8,	/* Cometlake-LP */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
>> +	0x06c8,	/* Cometlake-H */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>> +	0x3198,	/* Geminilake */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>> +	0x5a98,	/* Broxton-P (Appololake) */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
>> +	0x9dc8, /* Cannonlake */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
>> +	0xa348, /* Coffelake */
>> +#endif
> 
> What about all the other PCI IDs that SOF handles, e.g. TigerLake, etc?

There is no PCI ID clash, only one driver will call the DSP probe and
SND_INTEL_DSP_DRIVER_ANY will be returned in this case.

> Also how do you deal with SKL/KBL cases with DMICs? They would need to 
> use the SST driver (for Chromebooks mainly)

As I noted in the comment, we can add dmi quirks on top. I just do not have
enough information - can I take the hints from the pull request (your code)
you already mentioned?

> Even for APL, the 'official' driver is still SST for Chromebooks. SOF 
> should work but there will probably be missing firmware/topology files.

I can rework this part of course. I'll send v2 patch.

>> +};
>> +
>> +static int snd_intel_dsp_check_device(u16 device, const u16 *table, u32 len)
>> +{
>> +	for (; len > 0; len--, table++) {
>> +		if (*table == device)
>> +			return 1;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
>> +{
>> +	struct nhlt_acpi_table *nhlt;
>> +	int ret = 0;
>> +
>> +	if (snd_intel_dsp_check_device(pci->device, sof_skl_table, ARRAY_SIZE(sof_skl_table))) {
>> +		nhlt = intel_nhlt_init(&pci->dev);
>> +		if (nhlt) {
>> +			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt))
>> +				ret = 1;
>> +			intel_nhlt_free(nhlt);
>> +		}
>> +	}
>> +	return ret;
>> +}
>> +
>> +int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>> +{
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
>> +		return SND_INTEL_DSP_DRIVER_NODSP;
>> +	if (pci->class != 0x040100 && pci->class != 0x040380) {
>> +		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDA legacy driver\n", pci->class);
>> +		return SND_INTEL_DSP_DRIVER_LEGACY;
> 
> Again these two cases are the same. The DSP is not enabled so the 
> HDaudio legacy driver needs to be used.
> 
>> +	}
>> +
>> +	dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
>> +
>> +	/* DMIC check for Skylake+ */
>> +	if (snd_intel_dsp_check_dmic(pci)) {
>> +		dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
>> +		return SND_INTEL_DSP_DRIVER_SOF;
> 
> That's not fully correct, see comment above on Chromebooks.

And it's really visible now at least :-) I welcome any hints what's wrong.

>> +	}
>> +
>> +	return SND_INTEL_DSP_DRIVER_ANY;
>> +}
>> +
>> +EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("Intel DSP config driver");
>> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
>> index daede96f28ee..097ff6c10099 100644
>> --- a/sound/hda/intel-nhlt.c
>> +++ b/sound/hda/intel-nhlt.c
>> @@ -102,6 +102,3 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
>>   	return dmic_geo;
>>   }
>>   EXPORT_SYMBOL_GPL(intel_nhlt_get_dmic_geo);
>> -
>> -MODULE_LICENSE("GPL v2");
>> -MODULE_DESCRIPTION("Intel NHLT driver");
>> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
>> index dae47a45b2b8..bd48335d09d7 100644
>> --- a/sound/pci/hda/Kconfig
>> +++ b/sound/pci/hda/Kconfig
>> @@ -12,7 +12,7 @@ config SND_HDA_INTEL
>>   	tristate "HD Audio PCI"
>>   	depends on SND_PCI
>>   	select SND_HDA
>> -	select SND_INTEL_NHLT if ACPI
>> +	select SND_INTEL_DSP_CONFIG
>>   	help
>>   	  Say Y here to include support for Intel "High Definition
>>   	  Audio" (Azalia) and its compatible devices.
>> @@ -23,15 +23,6 @@ config SND_HDA_INTEL
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called snd-hda-intel.
>>   
>> -config SND_HDA_INTEL_DETECT_DMIC
>> -	bool "DMIC detection and probe abort"
>> -	depends on SND_HDA_INTEL
>> -	help
>> -	  Say Y to detect digital microphones on SKL+ devices. DMICs
>> -	  cannot be handled by the HDaudio legacy driver and are
>> -	  currently only supported by the SOF driver.
>> -	  If unsure say N.
>> -
>>   config SND_HDA_TEGRA
>>   	tristate "NVIDIA Tegra HD Audio"
>>   	depends on ARCH_TEGRA
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 240f4ca76391..c76c2deea47c 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -46,7 +46,7 @@
>>   #include <sound/initval.h>
>>   #include <sound/hdaudio.h>
>>   #include <sound/hda_i915.h>
>> -#include <sound/intel-nhlt.h>
>> +#include <sound/intel-dsp-config.h>
>>   #include <linux/vgaarb.h>
>>   #include <linux/vga_switcheroo.h>
>>   #include <linux/firmware.h>
>> @@ -124,7 +124,7 @@ static char *patch[SNDRV_CARDS];
>>   static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
>>   					CONFIG_SND_HDA_INPUT_BEEP_MODE};
>>   #endif
>> -static bool dmic_detect = IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC);
>> +static bool no_dsp_driver;
>>   
>>   module_param_array(index, int, NULL, 0444);
>>   MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
>> @@ -159,8 +159,8 @@ module_param_array(beep_mode, bool, NULL, 0444);
>>   MODULE_PARM_DESC(beep_mode, "Select HDA Beep registration mode "
>>   			    "(0=off, 1=on) (default=1).");
>>   #endif
>> -module_param(dmic_detect, bool, 0444);
>> -MODULE_PARM_DESC(dmic_detect, "DMIC detect on SKL+ platforms");
>> +module_param(no_dsp_driver, bool, 0444);
>> +MODULE_PARM_DESC(no_dsp_driver, "Do not return from probe when another DSP driver claims device");
> 
> maybe: "force this driver to be used and bypass DSP driver selection"
> 
>>   
>>   #ifdef CONFIG_PM
>>   static int param_set_xint(const char *val, const struct kernel_param *kp);
>> @@ -2020,25 +2020,6 @@ static const struct hda_controller_ops pci_hda_ops = {
>>   	.position_check = azx_position_check,
>>   };
>>   
>> -static int azx_check_dmic(struct pci_dev *pci, struct azx *chip)
>> -{
>> -	struct nhlt_acpi_table *nhlt;
>> -	int ret = 0;
>> -
>> -	if (chip->driver_type == AZX_DRIVER_SKL &&
>> -	    pci->class != 0x040300) {
>> -		nhlt = intel_nhlt_init(&pci->dev);
>> -		if (nhlt) {
>> -			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt)) {
>> -				ret = -ENODEV;
>> -				dev_info(&pci->dev, "Digital mics found on Skylake+ platform, aborting probe\n");
>> -			}
>> -			intel_nhlt_free(nhlt);
>> -		}
>> -	}
>> -	return ret;
>> -}
>> -
>>   static int azx_probe(struct pci_dev *pci,
>>   		     const struct pci_device_id *pci_id)
>>   {
>> @@ -2056,6 +2037,17 @@ static int azx_probe(struct pci_dev *pci,
>>   		return -ENOENT;
>>   	}
>>   
>> +	/*
>> +	 * stop probe if another Intel's DSP driver should be activated
>> +	 */
>> +	if (!no_dsp_driver) {
>> +		err = snd_intel_dsp_driver_probe(pci);
>> +		if (err != SND_INTEL_DSP_DRIVER_ANY &&
>> +		    err != SND_INTEL_DSP_DRIVER_NODSP &&
>> +		    err != SND_INTEL_DSP_DRIVER_LEGACY)
> 
> merge these last two
> 
>> +			return -ENODEV;
>> +	}
>> +
> 
> [snip]
> 
>> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
>> index 141dbbf975ac..58ba3e9469ba 100644
>> --- a/sound/soc/intel/skylake/skl.c
>> +++ b/sound/soc/intel/skylake/skl.c
>> @@ -27,6 +27,7 @@
>>   #include <sound/hda_i915.h>
>>   #include <sound/hda_codec.h>
>>   #include <sound/intel-nhlt.h>
>> +#include <sound/intel-dsp-config.h>
>>   #include "skl.h"
>>   #include "skl-sst-dsp.h"
>>   #include "skl-sst-ipc.h"
>> @@ -987,22 +988,10 @@ static int skl_probe(struct pci_dev *pci,
>>   
>>   	switch (skl_pci_binding) {
>>   	case SND_SKL_PCI_BIND_AUTO:
>> -		/*
>> -		 * detect DSP by checking class/subclass/prog-id information
>> -		 * class=04 subclass 03 prog-if 00: no DSP, use legacy driver
>> -		 * class=04 subclass 01 prog-if 00: DSP is present
>> -		 *   (and may be required e.g. for DMIC or SSP support)
>> -		 * class=04 subclass 03 prog-if 80: use DSP or legacy mode
>> -		 */
>> -		if (pci->class == 0x040300) {
>> -			dev_info(&pci->dev, "The DSP is not enabled on this platform, aborting probe\n");
>> +		err = snd_intel_dsp_driver_probe(pci);
>> +		if (err != SND_INTEL_DSP_DRIVER_ANY &&
>> +		    err != SND_INTEL_DSP_DRIVER_SST)
> 
> I didn't see a case where SST was selected?
> 
>>   			return -ENODEV;
>> -		}
>> -		if (pci->class != 0x040100 && pci->class != 0x040380) {
>> -			dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, aborting probe\n", pci->class);
>> -			return -ENODEV;
>> -		}
>> -		dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
>>   		break;
>>   	case SND_SKL_PCI_BIND_LEGACY:
>>   		dev_info(&pci->dev, "Module parameter forced binding with HDaudio legacy, aborting probe\n");
> 
> Do we still need this skl_pci_binding now? I think it's remaining code 
> from the time when we only used the PCI class, which led to breaking 
> Linus' laptop (and others)...
> 
>> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
>> index 479ba249e219..8a5d5c0f95f2 100644
>> --- a/sound/soc/sof/intel/Kconfig
>> +++ b/sound/soc/sof/intel/Kconfig
>> @@ -286,7 +286,7 @@ config SND_SOC_SOF_HDA
>>   	tristate
>>   	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
>>   	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
>> -	select SND_INTEL_NHLT if ACPI
>> +	select SND_INTEL_DSP_CONFIG
>>   	help
>>   	  This option is not user-selectable but automagically handled by
>>   	  'select' statements at a higher level
>> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
>> index d66412a77873..3a9e0e2a150d 100644
>> --- a/sound/soc/sof/sof-pci-dev.c
>> +++ b/sound/soc/sof/sof-pci-dev.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/pm_runtime.h>
>> +#include <sound/intel-dsp-config.h>
>>   #include <sound/soc-acpi.h>
>>   #include <sound/soc-acpi-intel-match.h>
>>   #include <sound/sof.h>
>> @@ -277,6 +278,11 @@ static int sof_pci_probe(struct pci_dev *pci,
>>   	const struct snd_sof_dsp_ops *ops;
>>   	int ret;
>>   
>> +	ret = snd_intel_dsp_driver_probe(pci);
>> +	if (ret != SND_INTEL_DSP_DRIVER_ANY &&
>> +	    ret != SND_INTEL_DSP_DRIVER_SOF)
>> +		return -ENODEV;
>> +
>>   	dev_dbg(&pci->dev, "PCI DSP detected");
>>   
>>   	/* get ops for platform */
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
