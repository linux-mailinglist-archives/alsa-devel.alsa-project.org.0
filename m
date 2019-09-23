Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78680BBB41
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 20:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0423616A4;
	Mon, 23 Sep 2019 20:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0423616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569263175;
	bh=e0hzL/BdJ5aCQZcVJt1sQU9pnllCvVAXPFAxxXydRaE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iACwBkR48TF+YPizf9Xfanail1p59tZGabNOTQav67KH/fE9tzWBosGdgNAwwlI3u
	 cIDRD19KzfFV3tMUOyHSWv4FsTQk8Y1HCPmrZtMfVgH48nGod4w0fjGCuS91md+IZU
	 sbp5Gb02/rvUYGxAFVchjG2VZIh40Ow/B0frsNp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE23F8031A;
	Mon, 23 Sep 2019 20:24:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01859F8044C; Mon, 23 Sep 2019 20:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E3B6F80213
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 20:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E3B6F80213
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 11:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="363713718"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 23 Sep 2019 11:24:22 -0700
Received: from aabousam-mobl1.amr.corp.intel.com
 (aabousam-mobl1.amr.corp.intel.com [10.251.27.167])
 by linux.intel.com (Postfix) with ESMTP id 87DDC5802B1;
 Mon, 23 Sep 2019 11:24:22 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190923165739.3975-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cf20bc02-adb1-0207-5fb2-7b9f0479885e@linux.intel.com>
Date: Mon, 23 Sep 2019 13:24:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923165739.3975-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: Skylake SST driver - blacklist the
 PCI device IDs for the auto probe
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

On 9/23/19 11:57 AM, Jaroslav Kysela wrote:
> There are basically three drivers for the PCI devices for
> the recent Intel hardware with the build-in DSPs. The legacy HDA
> driver has dmic_detect module option for the auto detection
> of the platforms with the digital microphone. Because the SOF
> driver is preferred, just skip PCI probe in the Skylake SST
> driver when the PCI device ID clashes by default. The user
> can override the auto behaviour with the pci_binding
> module parameter.

Thanks Jaroslav for re-opening this mutual-exclusion issue.

I think we want to deal with this in two alternate ways
1. static built-time exclusion based on Kconfigs
2. probe-time exclusion based on quirks (CPU ID + DMI)

For example with a SKL/KBL/APL chromebook w/ DMIC we'd want to use the 
SST driver and for GLK+ we want to use SOF. For any device with 
HDAudio+DMIC we'd want SOF, same for any device with SoundWire when it's 
fully supported.

I can't recall if I shared the patches I worked on a couple of months 
ago, but they are still at https://github.com/thesofproject/linux/pull/927

the first part essentially does the same thing as this patch, the second 
relies on quirks. I've been busy with other things but indeed it's high 
time we closed this for distributions.

> Boot log from Lenovo Carbon X1 (7th gen) with the default settings:
> 
>    snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, aborting probe
>    snd_soc_skl 0000:00:1f.3: SOF driver is preferred on this platform, aborting probe
>    sof-audio-pci 0000:00:1f.3: warning: No matching ASoC machine driver found
>    sof-audio-pci 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>    ....
> 
> Perhaps, it may be more wise to create one shared module and all
> three drivers should call the driver detection routine(s) from one
> place.

We did look into this and it's a bit complicated in terms of plumbing.

> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/intel/skylake/skl.c | 37 +++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index 141dbbf975ac..cace55ca8d55 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -38,6 +38,39 @@ static int skl_pci_binding;
>   module_param_named(pci_binding, skl_pci_binding, int, 0444);
>   MODULE_PARM_DESC(pci_binding, "PCI binding (0=auto, 1=only legacy, 2=only asoc");
>   
> +/*
> + *
> + */
> +static int skl_sof_support(struct pci_dev *pci)
> +{
> +	/* the SOF driver has same PCI IDs */
> +	if (pci->vendor == 0x8086) {
> +		switch (pci->device) {
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
> +		case 0x02c8: /* CML-LP */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
> +		case 0x06c8: /* CML-H */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
> +		case 0x3198: /* GLK */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
> +		case 0x5a98: /* BXT-P */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
> +		case 0x9dc8: /* CNL */
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
> +		case 0xa348: /* CFL */
> +#endif
> +		case 0x0000: /* a dummy value when no SOF driver enabled */
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
>   /*
>    * initialize the PCI registers
>    */
> @@ -1002,6 +1035,10 @@ static int skl_probe(struct pci_dev *pci,
>   			dev_err(&pci->dev, "Unknown PCI class/subclass/prog-if information (0x%06x) found, aborting probe\n", pci->class);
>   			return -ENODEV;
>   		}
> +		if (skl_sof_support(pci)) {
> +			dev_info(&pci->dev, "SOF driver is preferred on this platform, aborting probe\n");
> +			return -ENODEV;
> +		}
>   		dev_info(&pci->dev, "DSP detected with PCI class/subclass/prog-if info 0x%06x\n", pci->class);
>   		break;
>   	case SND_SKL_PCI_BIND_LEGACY:
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
