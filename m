Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 169DEC8F68
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E36F166C;
	Wed,  2 Oct 2019 19:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E36F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570036112;
	bh=GEhSZzZzZVot63Yr92rXngNC5I3PiQnO25y5+Ltcuhg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=chSMv9INyZqyq7NuYhdD6acS1oSzKpW+qGx4wr/AXJVDSLVs+HFkIp1eMYljte6uf
	 oG+ZHYaxpDNXViKH0HuxXYIf33PXn/AMebeVLdCHpsheKpe0R6KBhy24dfsZiJjHdu
	 znmJKpCn8/IisvUKsbae8SaKTN0UXLH4TD/nsHfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EE7F803F3;
	Wed,  2 Oct 2019 19:06:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DECD9F80391; Wed,  2 Oct 2019 19:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CDD3F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 19:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CDD3F8016F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 10:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; d="scan'208";a="216520503"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 02 Oct 2019 10:06:39 -0700
Received: from abapat-mobl1.amr.corp.intel.com (unknown [10.251.1.101])
 by linux.intel.com (Postfix) with ESMTP id 554505803E4;
 Wed,  2 Oct 2019 10:06:39 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191002164307.28642-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <30dad9e7-12ef-7796-59fd-171693611357@linux.intel.com>
Date: Wed, 2 Oct 2019 12:06:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002164307.28642-1-perex@perex.cz>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +module_param(dsp_driver, int, 0444);
> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=noDSP, 2=legacy, 3=SST, 4=SOF)");

remove noDSP?

> +
> +static const u16 sof_skl_table[] = {
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
> +	0x02c8,	/* Cometlake-LP */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
> +	0x06c8,	/* Cometlake-H */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
> +	0x3198,	/* Geminilake */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
> +	0x9dc8, /* Cannonlake */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
> +	0xa348, /* Coffelake */
> +#endif

I am lost here, is this to handle the cases between legacy and SOF? If 
yes, we need to add all PCI IDs after gemini lake.

> +};
> +
> +static int snd_intel_dsp_check_device(u16 device, const u16 *table, u32 len)
> +{
> +	for (; len > 0; len--, table++) {
> +		if (*table == device)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
> +{
> +	struct nhlt_acpi_table *nhlt;
> +	int ret = 0;
> +
> +	if (snd_intel_dsp_check_device(pci->device, sof_skl_table, ARRAY_SIZE(sof_skl_table))) {
> +		nhlt = intel_nhlt_init(&pci->dev);
> +		if (nhlt) {
> +			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt))
> +				ret = 1;
> +			intel_nhlt_free(nhlt);
> +		}
> +	}
> +	return ret;
> +}
> +
> +int snd_intel_dsp_driver_probe(struct pci_dev *pci)
> +{
> +	if (dsp_driver > 0 && dsp_driver <= SND_INTEL_DSP_DRIVER_LAST)
> +		return dsp_driver;
> +
> +	/* Intel vendor only */
> +	if (snd_BUG_ON(pci->vendor != 0x8086))
> +		return SND_INTEL_DSP_DRIVER_ANY;
> +
> +	/*
> +	 * detect DSP by checking class/subclass/prog-id information
> +	 * class=04 subclass 03 prog-if 00: no DSP, use legacy driver
> +	 * class=04 subclass 01 prog-if 00: DSP is present
> +	 *  (and may be required e.g. for DMIC or SSP support)
> +	 * class=04 subclass 03 prog-if 80: use DSP or legacy mode
> +	 */
> +	if (pci->class == 0x040300)
> +		return SND_INTEL_DSP_DRIVER_LEGACY;
> +	if (pci->class != 0x040100 && pci->class != 0x040380) {
> +		dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, selecting HDA legacy driver\n", pci->class);
> +		return SND_INTEL_DSP_DRIVER_LEGACY;
> +	}
> +
> +	dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
> +
> +	/* Prefer SST driver for Broxton-P (Appololake) */
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL) || IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
> +	if (pci->device == 0x5a98)
> +#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
> +		return SND_INTEL_DSP_DRIVER_SST;
> +#else
> +		return SND_INTEL_DSP_DRIVER_SOF;
> +#endif
> +#endif

This should be done with quirks, where we select SST for Chromebooks for 
APL, SKL, KBL.

Using the PCI ID + class only will break at least one device, I remotely 
debugged Hans de Goede's APL platform and saw the same issues with HDMI 
probe as on Linus' laptop.

I am running out of time for this week, so will check updates next week.

> +
> +	/* DMIC check for Skylake+ */
> +	if (snd_intel_dsp_check_dmic(pci)) {
> +		dev_info(&pci->dev, "Digital mics found on Skylake+ platform, using SOF driver\n");
> +		return SND_INTEL_DSP_DRIVER_SOF;
> +	}
> +
> +	return SND_INTEL_DSP_DRIVER_ANY;
> +}
> +
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
