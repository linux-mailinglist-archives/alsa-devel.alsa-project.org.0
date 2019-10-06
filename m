Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61BCCD2C5
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 17:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30AF985D;
	Sun,  6 Oct 2019 17:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30AF985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570375647;
	bh=A78yt4y8w8FadBl6htvVZB/sykFJnPesC37QPt+f/gM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rn3GLFi0LxbrBcjcJqqybLg7Svbf+4ITL/i/93Cw5vzVedCoDqA+XxPKNprrXQmJD
	 iGrPY97JiFvdqk5hHT78uJb3PaLIqnJjRXYEmlsAfPUrC6fbzV6EBZGzzxFeHu+Kum
	 FVJFayJc3FiIRaO+4Pi0rtvwZiw2Y5f7QGLaq1Bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F2DF80308;
	Sun,  6 Oct 2019 17:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B68F0F8038F; Sun,  6 Oct 2019 17:25:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53681F80137
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 17:25:37 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 839FCA003F;
 Sun,  6 Oct 2019 17:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 839FCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1570375537; bh=nqLIZBFbD3dAjJHL9DKzm81XJTbF8IXK2zze52ONL+I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Iu6TqJ0dxFlTIzU268nHgfyV4VetBiETCqjPlBvWrG2YTBdTZ8fmRalg/85dhiMor
 nZPjUy5kNOv5KBCL7z2IW5Ziu9I3GhYMNjPh9ARqO+QmYmx9rx1xl0YYYGTcuufRoS
 pSe8dMUXgHh9oraYvcQG/+4jM/YSOJTURegZjj18=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun,  6 Oct 2019 17:25:33 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191002164307.28642-1-perex@perex.cz>
 <30dad9e7-12ef-7796-59fd-171693611357@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <31a9b692-b49c-044a-ae9f-aee9356be05a@perex.cz>
Date: Sun, 6 Oct 2019 17:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <30dad9e7-12ef-7796-59fd-171693611357@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH v2] ALSA: hda: add Intel DSP configuration
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

Dne 02. 10. 19 v 19:06 Pierre-Louis Bossart napsal(a):
> 
>> +module_param(dsp_driver, int, 0444);
>> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=noDSP, 2=legacy, 3=SST, 4=SOF)");
> 
> remove noDSP?
> 
>> +
>> +static const u16 sof_skl_table[] = {
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
>> +	0x02c8,	/* Cometlake-LP */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
>> +	0x06c8,	/* Cometlake-H */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>> +	0x3198,	/* Geminilake */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
>> +	0x9dc8, /* Cannonlake */
>> +#endif
>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
>> +	0xa348, /* Coffelake */
>> +#endif
> 
> I am lost here, is this to handle the cases between legacy and SOF? If 
> yes, we need to add all PCI IDs after gemini lake.
> 
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
>> +		return SND_INTEL_DSP_DRIVER_LEGACY;
>> +	if (pci->class != 0x040100 && pci->class != 0x040380) {
>> +		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDA legacy driver\n", pci->class);
>> +		return SND_INTEL_DSP_DRIVER_LEGACY;
>> +	}
>> +
>> +	dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
>> +
>> +	/* Prefer SST driver for Broxton-P (Appololake) */
>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL) || IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>> +	if (pci->device == 0x5a98)
>> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
>> +		return SND_INTEL_DSP_DRIVER_SST;
>> +#else
>> +		return SND_INTEL_DSP_DRIVER_SOF;
>> +#endif
>> +#endif
> 
> This should be done with quirks, where we select SST for Chromebooks for 
> APL, SKL, KBL.
> 
> Using the PCI ID + class only will break at least one device, I remotely 
> debugged Hans de Goede's APL platform and saw the same issues with HDMI 
> probe as on Linus' laptop.
> 
> I am running out of time for this week, so will check updates next week.

I reworked the logic in the code (v3 of the patch) to use one table with the
configuration entries for all platforms including dmi based quirks. Please,
review it, if you see any problems there. I believe that we are reaching
really nice and clean solution for this problem.

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
