Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCA2F20D9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA911765;
	Mon, 11 Jan 2021 21:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA911765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610397140;
	bh=D5b+BeSXPadqtNFW5/1Ih4iR90juV8qmFlICp6y1IkM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TyMekRGtpiepWwhhEvX4hkFzXcdS49zFlR9VVbF+uhMBNIzXobpO+FHeP2R1yhcPF
	 ZamRq0UpHF2CzZALd98KKtNSMoOYbwgpxmUMWMg5t/kRW+rUFsPPfUngh51+aUEfg9
	 0hUz81EDqa/CwzacFnawd2JHmlzMKruGld23CVvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAD0F804E4;
	Mon, 11 Jan 2021 21:29:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29EC6F80113; Mon, 11 Jan 2021 21:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A83DBF80254;
 Mon, 11 Jan 2021 21:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83DBF80254
IronPort-SDR: GRKTAffE9fOulJ9Wq0Mc6SOqxYIymT63itE7NcRm5NP+vQDevXFs7glIB95iECtxzrQP1Q74Im
 S2ZKAJRU0h7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="175351925"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="175351925"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:44 -0800
IronPort-SDR: bbx21iSLcbM+boKLSUN6i+LxYYyuLdoqT5lL2cIDsDn/IzYJCkZeL5jXLvM8WAG/auwt3s2CfG
 Utuk5Zpn7Azw==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="344995391"
Received: from gkbech1x-mobl.amr.corp.intel.com (HELO [10.212.87.85])
 ([10.212.87.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:43 -0800
Subject: Re: [PATCH] ASoC: SOF: Intel: avoid reverse module dependency
To: Arnd Bergmann <arnd@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
 <20210105190808.613050-1-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <59a36212-2412-2dd3-62f2-69c6f65312b1@linux.intel.com>
Date: Mon, 11 Jan 2021 13:54:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105190808.613050-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/5/21 1:07 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The SOF-ACPI driver is backwards from the normal Linux model, it has a
> generic driver that knows about all the specific drivers, as opposed to
> having hardware specific drivers that link against a common framework.
> 
> This requires ugly Kconfig magic and leads to missed dependencies as
> seen in this link error:
> 
> arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_acpi_probe':
> sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
> 
> Change it to use the normal probe order of starting with a specific
> device in a driver, turning the sof-acpi-dev.c driver into a library.

Thanks Arnd for reporting all this, much appreciated.

The initial design was that we would have one generic platform_driver 
(ACPI) and one generic PCI driver that would deal with all known IDs, 
with descriptors that would point ops and callbacks defined in 
device-specific drivers. It's how all Intel drivers worked so far, from 
HDaudio to Atom/SST and Skylake.

It's not that ugly, but to Arnd's point we do have a lot of #if 
IS_ENABLED at the top level with a larger and larger table of IDs, along 
with Kconfig magic indeed to propagate constraints from top-level to 
device-specific drivers. The error with DSP_CONFIG comes from the fact 
that this never belonged at the top-level, or should have been 
conditionally invoked, as noted by Takashi.

That said, the initial design which dates from 2017 can be revisited now 
that we start having quite a few platforms and more coming. What Arnd 
suggests isn't without merits, it would indeed turn the generic code 
into generic helpers, and have all the platform IDs maintained in 
device-specific drivers. It's a more distributed/scalable solution, the 
only minor drawback I see is that it would require multiple instances of 
the 'platform_driver' and 'pci_driver' structures.

I would also want to keep the top-level selection so that ACPI/PCI/DT 
modules can be disabled in one shot, that would mean an additional 
change to the Makefiles since e.g.
obj-$(CONFIG_SND_SOC_SOF_ACPI) += snd-sof-acpi.o
would need to be set somehow.

Since this is going to be a really invasive change, and past experience 
shows that mucking with Kconfigs will invariably raise a number of 
broken corner cases, if there is support from Mark/Takashi/Jaroslav on 
this idea, we should first test it in the SOF tree so that we get a good 
test coverage and don't break too many eggs in Mark's tree. We would 
also need to concurrently change our CI scripts which are dependent on 
module names.

Also maybe in a first pass we can remove the compilation error with 
IS_REACHABLE and in a second pass do more invasive surgery?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/sof/intel/Kconfig  |  34 ++--------
>   sound/soc/sof/intel/bdw.c    |  51 +++++++++++++--
>   sound/soc/sof/intel/byt.c    | 104 +++++++++++++++++++++++++----
>   sound/soc/sof/intel/shim.h   |  10 ++-
>   sound/soc/sof/sof-acpi-dev.c | 122 ++---------------------------------
>   5 files changed, 156 insertions(+), 165 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index ae9ba834814e..ff9266413a06 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -9,14 +9,6 @@ config SND_SOC_SOF_INTEL_TOPLEVEL
>   
>   if SND_SOC_SOF_INTEL_TOPLEVEL
>   
> -config SND_SOC_SOF_INTEL_ACPI
> -	def_tristate SND_SOC_SOF_ACPI
> -	select SND_SOC_SOF_BAYTRAIL  if SND_SOC_SOF_BAYTRAIL_SUPPORT
> -	select SND_SOC_SOF_BROADWELL if SND_SOC_SOF_BROADWELL_SUPPORT
> -	help
> -	  This option is not user-selectable but automagically handled by
> -	  'select' statements at a higher level.
> -
>   config SND_SOC_SOF_INTEL_PCI
>   	def_tristate SND_SOC_SOF_PCI
>   	select SND_SOC_SOF_MERRIFIELD  if SND_SOC_SOF_MERRIFIELD_SUPPORT
> @@ -58,10 +50,12 @@ config SND_SOC_SOF_INTEL_COMMON
>   	  This option is not user-selectable but automagically handled by
>   	  'select' statements at a higher level.
>   
> -if SND_SOC_SOF_INTEL_ACPI
> +if SND_SOC_SOF_ACPI
>   
> -config SND_SOC_SOF_BAYTRAIL_SUPPORT
> +config SND_SOC_SOF_BAYTRAIL
>   	bool "SOF support for Baytrail, Braswell and Cherrytrail"
> +	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
> +	select SND_INTEL_DSP_CONFIG
>   	help
>   	  This adds support for Sound Open Firmware for Intel(R) platforms
>   	  using the Baytrail, Braswell or Cherrytrail processors.
> @@ -75,17 +69,11 @@ config SND_SOC_SOF_BAYTRAIL_SUPPORT
>   	  Say Y if you want to enable SOF on Baytrail/Cherrytrail.
>   	  If unsure select "N".
>   
> -config SND_SOC_SOF_BAYTRAIL
> -	tristate
> -	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
> -	select SND_INTEL_DSP_CONFIG
> -	help
> -	  This option is not user-selectable but automagically handled by
> -	  'select' statements at a higher level.
> -
> -config SND_SOC_SOF_BROADWELL_SUPPORT
> +config SND_SOC_SOF_BROADWELL
>   	bool "SOF support for Broadwell"
>   	select SND_INTEL_DSP_CONFIG
> +	select SND_SOC_SOF_INTEL_COMMON
> +	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
>   	help
>   	  This adds support for Sound Open Firmware for Intel(R) platforms
>   	  using the Broadwell processors.
> @@ -100,14 +88,6 @@ config SND_SOC_SOF_BROADWELL_SUPPORT
>   	  Say Y if you want to enable SOF on Broadwell.
>   	  If unsure select "N".
>   
> -config SND_SOC_SOF_BROADWELL
> -	tristate
> -	select SND_SOC_SOF_INTEL_COMMON
> -	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
> -	help
> -	  This option is not user-selectable but automagically handled by
> -	  'select' statements at a higher level.
> -
>   endif ## SND_SOC_SOF_INTEL_ACPI
>   
>   if SND_SOC_SOF_INTEL_PCI
> diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
> index 50a4a73e6b9f..542e885733a2 100644
> --- a/sound/soc/sof/intel/bdw.c
> +++ b/sound/soc/sof/intel/bdw.c
> @@ -15,6 +15,8 @@
>   #include <linux/module.h>
>   #include <sound/sof.h>
>   #include <sound/sof/xtensa.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-acpi-intel-match.h>
>   #include "../ops.h"
>   #include "shim.h"
>   #include "../sof-audio.h"
> @@ -590,7 +592,7 @@ static struct snd_soc_dai_driver bdw_dai[] = {
>   };
>   
>   /* broadwell ops */
> -const struct snd_sof_dsp_ops sof_bdw_ops = {
> +static const struct snd_sof_dsp_ops sof_bdw_ops = {
>   	/*Device init */
>   	.probe          = bdw_probe,
>   
> @@ -651,13 +653,54 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
>   
>   	.arch_ops = &sof_xtensa_arch_ops,
>   };
> -EXPORT_SYMBOL_NS(sof_bdw_ops, SND_SOC_SOF_BROADWELL);
>   
> -const struct sof_intel_dsp_desc bdw_chip_info = {
> +static const struct sof_intel_dsp_desc bdw_chip_info = {
>   	.cores_num = 1,
>   	.host_managed_cores_mask = 1,
>   };
> -EXPORT_SYMBOL_NS(bdw_chip_info, SND_SOC_SOF_BROADWELL);
> +
> +static const struct sof_dev_desc sof_acpi_broadwell_desc = {
> +	.machines = snd_soc_acpi_intel_broadwell_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_imr_base = -1,
> +	.irqindex_host_ipc = 0,
> +	.chip_info = &bdw_chip_info,
> +	.default_fw_path = "intel/sof",
> +	.default_tplg_path = "intel/sof-tplg",
> +	.default_fw_filename = "sof-bdw.ri",
> +	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
> +	.ops = &sof_bdw_ops,
> +};
> +
> +static const struct acpi_device_id sof_broadwell_match[] = {
> +	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, sof_broadwell_match);
> +
> +static int sof_broadwell_probe(struct platform_device *dev)
> +{
> +	int ret = snd_intel_acpi_dsp_driver_probe(dev, "INT3438");
> +	if (ret != SND_INTEL_DSP_DRIVER_SOF) {
> +		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
> +		return -ENODEV;
> +	}
> +
> +	return sof_acpi_probe(dev, &sof_acpi_broadwell_desc);
> +}
> +
> +/* acpi_driver definition */
> +static struct platform_driver snd_sof_acpi_driver = {
> +	.probe = sof_broadwell_probe,
> +	.remove = sof_acpi_remove,
> +	.driver = {
> +		.name = "sof-audio-broadwell",
> +		.pm = &sof_acpi_pm,
> +		.acpi_match_table = sof_broadwell_match,
> +	},
> +};
> +module_platform_driver(snd_sof_acpi_driver);
>   
>   MODULE_LICENSE("Dual BSD/GPL");
>   MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
> diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
> index 19260dbecac5..9fa688c7711e 100644
> --- a/sound/soc/sof/intel/byt.c
> +++ b/sound/soc/sof/intel/byt.c
> @@ -15,6 +15,8 @@
>   #include <linux/module.h>
>   #include <sound/sof.h>
>   #include <sound/sof/xtensa.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-acpi-intel-match.h>
>   #include "../ops.h"
>   #include "shim.h"
>   #include "../sof-audio.h"
> @@ -657,8 +659,6 @@ EXPORT_SYMBOL_NS(tng_chip_info, SND_SOC_SOF_MERRIFIELD);
>   
>   #endif /* CONFIG_SND_SOC_SOF_MERRIFIELD */
>   
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -
>   static void byt_reset_dsp_disable_int(struct snd_sof_dev *sdev)
>   {
>   	/* Disable Interrupt from both sides */
> @@ -822,7 +822,7 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
>   }
>   
>   /* baytrail ops */
> -const struct snd_sof_dsp_ops sof_byt_ops = {
> +static const struct snd_sof_dsp_ops sof_byt_ops = {
>   	/* device init */
>   	.probe		= byt_acpi_probe,
>   	.remove		= byt_remove,
> @@ -892,16 +892,14 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
>   
>   	.arch_ops = &sof_xtensa_arch_ops,
>   };
> -EXPORT_SYMBOL_NS(sof_byt_ops, SND_SOC_SOF_BAYTRAIL);
>   
> -const struct sof_intel_dsp_desc byt_chip_info = {
> +static const struct sof_intel_dsp_desc byt_chip_info = {
>   	.cores_num = 1,
>   	.host_managed_cores_mask = 1,
>   };
> -EXPORT_SYMBOL_NS(byt_chip_info, SND_SOC_SOF_BAYTRAIL);
>   
>   /* cherrytrail and braswell ops */
> -const struct snd_sof_dsp_ops sof_cht_ops = {
> +static const struct snd_sof_dsp_ops sof_cht_ops = {
>   	/* device init */
>   	.probe		= byt_acpi_probe,
>   	.remove		= byt_remove,
> @@ -972,15 +970,99 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
>   
>   	.arch_ops = &sof_xtensa_arch_ops,
>   };
> -EXPORT_SYMBOL_NS(sof_cht_ops, SND_SOC_SOF_BAYTRAIL);
>   
> -const struct sof_intel_dsp_desc cht_chip_info = {
> +static const struct sof_intel_dsp_desc cht_chip_info = {
>   	.cores_num = 1,
>   	.host_managed_cores_mask = 1,
>   };
> -EXPORT_SYMBOL_NS(cht_chip_info, SND_SOC_SOF_BAYTRAIL);
>   
> -#endif /* CONFIG_SND_SOC_SOF_BAYTRAIL */
> +/* BYTCR uses different IRQ index */
> +static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
> +	.machines = snd_soc_acpi_intel_baytrail_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_imr_base = 2,
> +	.irqindex_host_ipc = 0,
> +	.chip_info = &byt_chip_info,
> +	.default_fw_path = "intel/sof",
> +	.default_tplg_path = "intel/sof-tplg",
> +	.default_fw_filename = "sof-byt.ri",
> +	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
> +	.ops = &sof_byt_ops,
> +};
> +
> +static const struct sof_dev_desc sof_acpi_baytrail_desc = {
> +	.machines = snd_soc_acpi_intel_baytrail_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_imr_base = 2,
> +	.irqindex_host_ipc = 5,
> +	.chip_info = &byt_chip_info,
> +	.default_fw_path = "intel/sof",
> +	.default_tplg_path = "intel/sof-tplg",
> +	.default_fw_filename = "sof-byt.ri",
> +	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
> +	.ops = &sof_byt_ops,
> +};
> +
> +static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
> +	.machines = snd_soc_acpi_intel_cherrytrail_machines,
> +	.resindex_lpe_base = 0,
> +	.resindex_pcicfg_base = 1,
> +	.resindex_imr_base = 2,
> +	.irqindex_host_ipc = 5,
> +	.chip_info = &cht_chip_info,
> +	.default_fw_path = "intel/sof",
> +	.default_tplg_path = "intel/sof-tplg",
> +	.default_fw_filename = "sof-cht.ri",
> +	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
> +	.ops = &sof_cht_ops,
> +};
> +
> +static const struct acpi_device_id sof_baytrail_match[] = {
> +	{ "80860F28", (unsigned long)&sof_acpi_baytrail_desc },
> +	{ "808622A8", (unsigned long)&sof_acpi_cherrytrail_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, sof_baytrail_match);
> +
> +static int sof_baytrail_probe(struct platform_device *pdev)
> +{
> +	const struct sof_dev_desc *desc = device_get_match_data(&pdev->dev);
> +	const struct acpi_device_id *id;
> +
> +	id = acpi_match_device(dev->driver->acpi_match_table, dev);
> +	if (!id)
> +		return -ENODEV;
> +
> +	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
> +	if (ret != SND_INTEL_DSP_DRIVER_SOF) {
> +		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
> +		return -ENODEV;
> +	}
> +
> +	dev_dbg(dev, "ACPI DSP detected");
> +
> +	if (!desc)
> +		return -ENODEV;
> +
> +	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
> +		desc = &sof_acpi_baytrailcr_desc;
> +
> +	return sof_acpi_probe(pdev, desc);
> +}
> +
> +/* acpi_driver definition */
> +static struct platform_driver snd_sof_baytrail_driver = {
> +	.probe = sof_baytrail_probe,
> +	.remove = sof_acpi_remove,
> +	.driver = {
> +		.name = "sof-audio-baytrail",
> +		.pm = &sof_acpi_pm,
> +		.acpi_match_table = sof_baytrail_match,
> +	},
> +};
> +module_platform_driver(snd_sof_baytrail_driver);
>   
>   MODULE_LICENSE("Dual BSD/GPL");
>   MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
> diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
> index 1e0afb5c8720..872116ee622b 100644
> --- a/sound/soc/sof/intel/shim.h
> +++ b/sound/soc/sof/intel/shim.h
> @@ -166,14 +166,12 @@ struct sof_intel_dsp_desc {
>   	int ssp_base_offset;		/* base address of the SSPs */
>   };
>   
> +extern const struct dev_pm_ops sof_acpi_pm;
> +extern int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc);
> +extern int sof_acpi_remove(struct platform_device *pdev);
> +
>   extern const struct snd_sof_dsp_ops sof_tng_ops;
> -extern const struct snd_sof_dsp_ops sof_byt_ops;
> -extern const struct snd_sof_dsp_ops sof_cht_ops;
> -extern const struct snd_sof_dsp_ops sof_bdw_ops;
>   
> -extern const struct sof_intel_dsp_desc byt_chip_info;
> -extern const struct sof_intel_dsp_desc cht_chip_info;
> -extern const struct sof_intel_dsp_desc bdw_chip_info;
>   extern const struct sof_intel_dsp_desc tng_chip_info;
>   
>   struct sof_intel_stream {
> diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
> index 2a369c2c6551..32654e042ec4 100644
> --- a/sound/soc/sof/sof-acpi-dev.c
> +++ b/sound/soc/sof/sof-acpi-dev.c
> @@ -36,70 +36,7 @@ MODULE_PARM_DESC(sof_acpi_debug, "SOF ACPI debug options (0x0 all off)");
>   
>   #define SOF_ACPI_DISABLE_PM_RUNTIME BIT(0)
>   
> -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -static const struct sof_dev_desc sof_acpi_broadwell_desc = {
> -	.machines = snd_soc_acpi_intel_broadwell_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_imr_base = -1,
> -	.irqindex_host_ipc = 0,
> -	.chip_info = &bdw_chip_info,
> -	.default_fw_path = "intel/sof",
> -	.default_tplg_path = "intel/sof-tplg",
> -	.default_fw_filename = "sof-bdw.ri",
> -	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
> -	.ops = &sof_bdw_ops,
> -};
> -#endif
> -
> -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -
> -/* BYTCR uses different IRQ index */
> -static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
> -	.machines = snd_soc_acpi_intel_baytrail_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_imr_base = 2,
> -	.irqindex_host_ipc = 0,
> -	.chip_info = &byt_chip_info,
> -	.default_fw_path = "intel/sof",
> -	.default_tplg_path = "intel/sof-tplg",
> -	.default_fw_filename = "sof-byt.ri",
> -	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
> -	.ops = &sof_byt_ops,
> -};
> -
> -static const struct sof_dev_desc sof_acpi_baytrail_desc = {
> -	.machines = snd_soc_acpi_intel_baytrail_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_imr_base = 2,
> -	.irqindex_host_ipc = 5,
> -	.chip_info = &byt_chip_info,
> -	.default_fw_path = "intel/sof",
> -	.default_tplg_path = "intel/sof-tplg",
> -	.default_fw_filename = "sof-byt.ri",
> -	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
> -	.ops = &sof_byt_ops,
> -};
> -
> -static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
> -	.machines = snd_soc_acpi_intel_cherrytrail_machines,
> -	.resindex_lpe_base = 0,
> -	.resindex_pcicfg_base = 1,
> -	.resindex_imr_base = 2,
> -	.irqindex_host_ipc = 5,
> -	.chip_info = &cht_chip_info,
> -	.default_fw_path = "intel/sof",
> -	.default_tplg_path = "intel/sof-tplg",
> -	.default_fw_filename = "sof-cht.ri",
> -	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
> -	.ops = &sof_cht_ops,
> -};
> -
> -#endif
> -
> -static const struct dev_pm_ops sof_acpi_pm = {
> +const struct dev_pm_ops sof_acpi_pm = {
>   	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
>   	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
>   			   snd_sof_runtime_idle)
> @@ -118,40 +55,17 @@ static void sof_acpi_probe_complete(struct device *dev)
>   	pm_runtime_enable(dev);
>   }
>   
> -static int sof_acpi_probe(struct platform_device *pdev)
> +int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc)
>   {
>   	struct device *dev = &pdev->dev;
> -	const struct acpi_device_id *id;
> -	const struct sof_dev_desc *desc;
>   	struct snd_sof_pdata *sof_pdata;
>   	const struct snd_sof_dsp_ops *ops;
>   	int ret;
>   
> -	id = acpi_match_device(dev->driver->acpi_match_table, dev);
> -	if (!id)
> -		return -ENODEV;
> -
> -	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
> -	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
> -		dev_dbg(dev, "SOF ACPI driver not selected, aborting probe\n");
> -		return -ENODEV;
> -	}
> -
> -	dev_dbg(dev, "ACPI DSP detected");
> -
>   	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
>   	if (!sof_pdata)
>   		return -ENOMEM;
>   
> -	desc = device_get_match_data(dev);
> -	if (!desc)
> -		return -ENODEV;
> -
> -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
> -		desc = &sof_acpi_baytrailcr_desc;
> -#endif
> -
>   	/* get ops for platform */
>   	ops = desc->ops;
>   	if (!ops) {
> @@ -193,8 +107,9 @@ static int sof_acpi_probe(struct platform_device *pdev)
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(sof_acpi_probe);
>   
> -static int sof_acpi_remove(struct platform_device *pdev)
> +int sof_acpi_remove(struct platform_device *pdev)
>   {
>   	if (!(sof_acpi_debug & SOF_ACPI_DISABLE_PM_RUNTIME))
>   		pm_runtime_disable(&pdev->dev);
> @@ -204,33 +119,6 @@ static int sof_acpi_remove(struct platform_device *pdev)
>   
>   	return 0;
>   }
> -
> -#ifdef CONFIG_ACPI
> -static const struct acpi_device_id sof_acpi_match[] = {
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
> -	{ "INT3438", (unsigned long)&sof_acpi_broadwell_desc },
> -#endif
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -	{ "80860F28", (unsigned long)&sof_acpi_baytrail_desc },
> -	{ "808622A8", (unsigned long)&sof_acpi_cherrytrail_desc },
> -#endif
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(acpi, sof_acpi_match);
> -#endif
> -
> -/* acpi_driver definition */
> -static struct platform_driver snd_sof_acpi_driver = {
> -	.probe = sof_acpi_probe,
> -	.remove = sof_acpi_remove,
> -	.driver = {
> -		.name = "sof-audio-acpi",
> -		.pm = &sof_acpi_pm,
> -		.acpi_match_table = ACPI_PTR(sof_acpi_match),
> -	},
> -};
> -module_platform_driver(snd_sof_acpi_driver);
> +EXPORT_SYMBOL_GPL(sof_acpi_remove);
>   
>   MODULE_LICENSE("Dual BSD/GPL");
> -MODULE_IMPORT_NS(SND_SOC_SOF_BAYTRAIL);
> -MODULE_IMPORT_NS(SND_SOC_SOF_BROADWELL);
> 
