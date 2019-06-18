Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656CF4AB04
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 21:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC41116C4;
	Tue, 18 Jun 2019 21:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC41116C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560886129;
	bh=4Jr7lNY8kgILOX1h+k9mJ4RT1tPkrI0q4VF1XFk2OzY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d68gKaJDAAo29JPrekK4Qn9zem4OMkoFcgiSXwQG6AZaPhBC6b59Q+e4BYHne5p0R
	 +1CKy/6zrN5mlvUjwJHInIQE8hR9b74jva7mPgei3weZrBE8tkDwOQC8s4f+LHehgO
	 0ImGzl2CdoCPE8qDyhp/lzmL3vo1ZXnutwybaHrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65E69F8971C;
	Tue, 18 Jun 2019 21:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F475F896F4; Tue, 18 Jun 2019 21:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B53DF80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 21:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B53DF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 12:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="334964569"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.108])
 ([10.252.15.108])
 by orsmga005.jf.intel.com with ESMTP; 18 Jun 2019 12:26:51 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7ceb9ba8-74d9-4985-e760-40003dfbef3e@intel.com>
Date: Tue, 18 Jun 2019 21:26:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: Intel: use common helpers to
 detect CPUs
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

On 2019-05-28 22:02, Pierre-Louis Bossart wrote:
> We have duplicated code in multiple locations (atom, machine drivers,
> SOF) to detect Baytrail, Cherrytrail and other SOCs. This is not very
> elegant, and introduces dependencies on CONFIG_X86 that prevent
> COMPILE_TEST from working.
> 
> Add common helpers to provide same functionality in a cleaner
> way. This will also help support the DMI-based quirks being introduced
> to handle SOF/SST autodetection.
> 
> FIXME:
> 0. does this fix COMPILE_TEST issues reported by Randy?
> 
> 1. should the include file moved to include/sound? this would be handy
> for the SOF/SST mutual exclusion?
> 
> 2. is there a better way to do this for all Intel chips or do we keep
> this in sound/? Andy?
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/intel/atom/sst/sst_acpi.c           |  65 +---------
>   sound/soc/intel/boards/bxt_da7219_max98357a.c |  11 +-
>   sound/soc/intel/boards/bytcht_es8316.c        |  12 +-
>   sound/soc/intel/boards/bytcr_rt5640.c         |  16 +--
>   sound/soc/intel/boards/bytcr_rt5651.c         |  17 +--
>   sound/soc/intel/boards/cht_bsw_rt5645.c       |  16 +--
>   sound/soc/intel/boards/sof_rt5682.c           |  11 +-
>   sound/soc/intel/common/soc-intel-quirks.h     | 115 ++++++++++++++++++
>   sound/soc/sof/sof-acpi-dev.c                  |  57 +--------
>   9 files changed, 135 insertions(+), 185 deletions(-)
>   create mode 100644 sound/soc/intel/common/soc-intel-quirks.h
> 
> diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
> index ae17ce4677a5..06c4a2da900c 100644
> --- a/sound/soc/intel/atom/sst/sst_acpi.c
> +++ b/sound/soc/intel/atom/sst/sst_acpi.c
> @@ -38,12 +38,11 @@
>   #include <acpi/platform/aclinux.h>
>   #include <acpi/actypes.h>
>   #include <acpi/acpi_bus.h>
> -#include <asm/cpu_device_id.h>
> -#include <asm/iosf_mbi.h>
>   #include <sound/soc-acpi.h>
>   #include <sound/soc-acpi-intel-match.h>
>   #include "../sst-mfld-platform.h"
>   #include "../../common/sst-dsp.h"
> +#include "../../common/soc-intel-quirks.h"
>   #include "sst.h"
>   
>   /* LPE viewpoint addresses */
> @@ -243,64 +242,6 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   	return 0;
>   }
>   
> -static int is_byt(void)
> -{
> -	bool status = false;
> -	static const struct x86_cpu_id cpu_ids[] = {
> -		{ X86_VENDOR_INTEL, 6, 55 }, /* Valleyview, Bay Trail */
> -		{}
> -	};
> -	if (x86_match_cpu(cpu_ids))
> -		status = true;
> -	return status;
> -}
> -
> -static bool is_byt_cr(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	int status = 0;
> -
> -	if (!is_byt())
> -		return false;
> -
> -	if (iosf_mbi_available()) {
> -		u32 bios_status;
> -		status = iosf_mbi_read(BT_MBI_UNIT_PMC, /* 0x04 PUNIT */
> -				       MBI_REG_READ, /* 0x10 */
> -				       0x006, /* BIOS_CONFIG */
> -				       &bios_status);
> -
> -		if (status) {
> -			dev_err(dev, "could not read PUNIT BIOS_CONFIG\n");
> -		} else {
> -			/* bits 26:27 mirror PMIC options */
> -			bios_status = (bios_status >> 26) & 3;
> -
> -			if (bios_status == 1 || bios_status == 3) {
> -				dev_info(dev, "Detected Baytrail-CR platform\n");
> -				return true;
> -			}
> -
> -			dev_info(dev, "BYT-CR not detected\n");
> -		}
> -	} else {
> -		dev_info(dev, "IOSF_MBI not available, no BYT-CR detection\n");
> -	}
> -
> -	if (platform_get_resource(pdev, IORESOURCE_IRQ, 5) == NULL) {
> -		/*
> -		 * Some devices detected as BYT-T have only a single IRQ listed,
> -		 * causing platform_get_irq with index 5 to return -ENXIO.
> -		 * The correct IRQ in this case is at index 0, as on BYT-CR.
> -		 */
> -		dev_info(dev, "Falling back to Baytrail-CR platform\n");
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -
>   static int sst_acpi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -325,7 +266,7 @@ static int sst_acpi_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	if (is_byt())
> +	if (soc_intel_is_byt())
>   		mach->pdata = &byt_rvp_platform_data;
>   	else
>   		mach->pdata = &chv_platform_data;
> @@ -343,7 +284,7 @@ static int sst_acpi_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (is_byt_cr(pdev)) {
> +	if (soc_intel_is_byt_cr(pdev)) {
>   		/* override resource info */
>   		byt_rvp_platform_data.res_info = &bytcr_res_info;
>   	}
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index d8c7d64bb1d7..d476c55f2efe 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -16,7 +16,6 @@
>    * GNU General Public License for more details.
>    */
>   
> -#include <asm/cpu_device_id.h>
>   #include <linux/input.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> @@ -29,6 +28,7 @@
>   #include "../../codecs/hdac_hdmi.h"
>   #include "../../codecs/da7219.h"
>   #include "../../codecs/da7219-aad.h"
> +#include "../common/soc-intel-quirks.h"
>   
>   #define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
>   #define BXT_MAXIM_CODEC_DAI	"HiFi"
> @@ -579,11 +579,6 @@ static struct snd_soc_dai_link broxton_dais[] = {
>   	},
>   };
>   
> -static const struct x86_cpu_id glk_ids[] = {
> -	{ X86_VENDOR_INTEL, 6, 0x7A }, /* Geminilake CPU_ID */
> -	{}
> -};
> -
>   #define NAME_SIZE	32
>   static int bxt_card_late_probe(struct snd_soc_card *card)
>   {
> @@ -593,7 +588,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>   	int err, i = 0;
>   	char jack_name[NAME_SIZE];
>   
> -	if (x86_match_cpu(glk_ids))
> +	if (soc_intel_is_glk())
>   		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
>   					ARRAY_SIZE(gemini_map));
>   	else
> @@ -656,7 +651,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
>   
>   	broxton_audio_card.dev = &pdev->dev;
>   	snd_soc_card_set_drvdata(&broxton_audio_card, ctx);
> -	if (x86_match_cpu(glk_ids)) {
> +	if (soc_intel_is_glk()) {
>   		unsigned int i;
>   
>   		broxton_audio_card.name = "glkda7219max";
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index e8c585ffd04d..d08715ac3945 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -30,8 +30,6 @@
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
>   #include <asm/platform_sst_audio.h>
>   #include <sound/jack.h>
>   #include <sound/pcm.h>
> @@ -40,6 +38,7 @@
>   #include <sound/soc-acpi.h>
>   #include "../atom/sst-atom-controls.h"
>   #include "../common/sst-dsp.h"
> +#include "../common/soc-intel-quirks.h"
>   
>   /* jd-inv + terminating entry */
>   #define MAX_NO_PROPS 2
> @@ -430,11 +429,6 @@ static struct snd_soc_card byt_cht_es8316_card = {
>   	.resume_post = byt_cht_es8316_resume,
>   };
>   
> -static const struct x86_cpu_id baytrail_cpu_ids[] = {
> -	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT }, /* Valleyview */
> -	{}
> -};
> -
>   static const struct acpi_gpio_params first_gpio = { 0, 0, false };
>   
>   static const struct acpi_gpio_mapping byt_cht_es8316_gpios[] = {
> @@ -506,8 +500,8 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>   	dmi_id = dmi_first_match(byt_cht_es8316_quirk_table);
>   	if (dmi_id) {
>   		quirk = (unsigned long)dmi_id->driver_data;
> -	} else if (x86_match_cpu(baytrail_cpu_ids) &&
> -	    mach->mach_params.acpi_ipc_irq_index == 0) {
> +	} else if (soc_intel_is_byt() &&
> +		   mach->mach_params.acpi_ipc_irq_index == 0) {
>   		/* On BYTCR default to SSP0, internal-mic-in2-map, mono-spk */
>   		quirk = BYT_CHT_ES8316_SSP0 | BYT_CHT_ES8316_INTMIC_IN2_MAP |
>   			BYT_CHT_ES8316_MONO_SPEAKER;
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index dc22df9a99fb..7aae7b78efba 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -28,7 +28,6 @@
>   #include <linux/dmi.h>
>   #include <linux/input.h>
>   #include <linux/slab.h>
> -#include <asm/cpu_device_id.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
> @@ -38,6 +37,7 @@
>   #include "../../codecs/rt5640.h"
>   #include "../atom/sst-atom-controls.h"
>   #include "../common/sst-dsp.h"
> +#include "../common/soc-intel-quirks.h"
>   
>   enum {
>   	BYT_RT5640_DMIC1_MAP,
> @@ -1130,18 +1130,6 @@ static struct snd_soc_card byt_rt5640_card = {
>   	.resume_post = byt_rt5640_resume,
>   };
>   
> -static bool is_valleyview(void)
> -{
> -	static const struct x86_cpu_id cpu_ids[] = {
> -		{ X86_VENDOR_INTEL, 6, 55 }, /* Valleyview, Bay Trail */
> -		{}
> -	};
> -
> -	if (!x86_match_cpu(cpu_ids))
> -		return false;
> -	return true;
> -}
> -
>   struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
>   	u64 aif_value;       /* 1: AIF1, 2: AIF2 */
>   	u64 mclock_value;    /* usually 25MHz (0x17d7940), ignored */
> @@ -1190,7 +1178,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>   	 * swap SSP0 if bytcr is detected
>   	 * (will be overridden if DMI quirk is detected)
>   	 */
> -	if (is_valleyview()) {
> +	if (soc_intel_is_byt()) {
>   		if (mach->mach_params.acpi_ipc_irq_index == 0)
>   			is_bytcr = true;
>   	}
> diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
> index ca657c3e5726..6df6435ea394 100644
> --- a/sound/soc/intel/boards/bytcr_rt5651.c
> +++ b/sound/soc/intel/boards/bytcr_rt5651.c
> @@ -30,8 +30,6 @@
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/machine.h>
>   #include <linux/slab.h>
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
> @@ -39,6 +37,7 @@
>   #include <sound/soc-acpi.h>
>   #include "../../codecs/rt5651.h"
>   #include "../atom/sst-atom-controls.h"
> +#include "../common/soc-intel-quirks.h"
>   
>   enum {
>   	BYT_RT5651_DMIC_MAP,
> @@ -852,16 +851,6 @@ static struct snd_soc_card byt_rt5651_card = {
>   	.resume_post = byt_rt5651_resume,
>   };
>   
> -static const struct x86_cpu_id baytrail_cpu_ids[] = {
> -	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT }, /* Valleyview */
> -	{}
> -};
> -
> -static const struct x86_cpu_id cherrytrail_cpu_ids[] = {
> -	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_AIRMONT },     /* Braswell */
> -	{}
> -};
> -
>   static const struct acpi_gpio_params ext_amp_enable_gpios = { 0, 0, false };
>   
>   static const struct acpi_gpio_mapping cht_rt5651_gpios[] = {
> @@ -932,7 +921,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>   	 * swap SSP0 if bytcr is detected
>   	 * (will be overridden if DMI quirk is detected)
>   	 */
> -	if (x86_match_cpu(baytrail_cpu_ids)) {
> +	if (soc_intel_is_byt()) {
>   		if (mach->mach_params.acpi_ipc_irq_index == 0)
>   			is_bytcr = true;
>   	}
> @@ -1001,7 +990,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Cherry Trail devices use an external amplifier enable gpio */
> -	if (x86_match_cpu(cherrytrail_cpu_ids) && !byt_rt5651_gpios)
> +	if (soc_intel_is_cht() && !byt_rt5651_gpios)
>   		byt_rt5651_gpios = cht_rt5651_gpios;
>   
>   	if (byt_rt5651_gpios) {
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
> index 32dbeaf1ab94..de5fe58ae3b4 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5645.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
> @@ -26,7 +26,6 @@
>   #include <linux/clk.h>
>   #include <linux/dmi.h>
>   #include <linux/slab.h>
> -#include <asm/cpu_device_id.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
> @@ -34,6 +33,7 @@
>   #include <sound/soc-acpi.h>
>   #include "../../codecs/rt5645.h"
>   #include "../atom/sst-atom-controls.h"
> +#include "../common/soc-intel-quirks.h"
>   
>   #define CHT_PLAT_CLK_3_HZ	19200000
>   #define CHT_CODEC_DAI1	"rt5645-aif1"
> @@ -509,18 +509,6 @@ static char cht_rt5645_codec_name[SND_ACPI_I2C_ID_LEN];
>   static char cht_rt5645_codec_aif_name[12]; /*  = "rt5645-aif[1|2]" */
>   static char cht_rt5645_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
>   
> -static bool is_valleyview(void)
> -{
> -	static const struct x86_cpu_id cpu_ids[] = {
> -		{ X86_VENDOR_INTEL, 6, 55 }, /* Valleyview, Bay Trail */
> -		{}
> -	};
> -
> -	if (!x86_match_cpu(cpu_ids))
> -		return false;
> -	return true;
> -}
> -
>   struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
>   	u64 aif_value;       /* 1: AIF1, 2: AIF2 */
>   	u64 mclock_value;    /* usually 25MHz (0x17d7940), ignored */
> @@ -585,7 +573,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	 * swap SSP0 if bytcr is detected
>   	 * (will be overridden if DMI quirk is detected)
>   	 */
> -	if (is_valleyview()) {
> +	if (soc_intel_is_byt()) {
>   		if (mach->mach_params.acpi_ipc_irq_index == 0)
>   			is_bytcr = true;
>   	}
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index e441dc979966..355fd9730a44 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -10,8 +10,6 @@
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/dmi.h>
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
>   #include <sound/core.h>
>   #include <sound/jack.h>
>   #include <sound/pcm.h>
> @@ -21,6 +19,7 @@
>   #include <sound/soc-acpi.h>
>   #include "../../codecs/rt5682.h"
>   #include "../../codecs/hdac_hdmi.h"
> +#include "../common/soc-intel-quirks.h"
>   
>   #define NAME_SIZE 32
>   
> @@ -304,12 +303,6 @@ static struct snd_soc_card sof_audio_card_rt5682 = {
>   	.late_probe = sof_card_late_probe,
>   };
>   
> -static const struct x86_cpu_id legacy_cpi_ids[] = {
> -	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT }, /* Baytrail */
> -	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_AIRMONT }, /* Cherrytrail */
> -	{}
> -};
> -
>   static struct snd_soc_dai_link_component rt5682_component[] = {
>   	{
>   		.name = "i2c-10EC5682:00",
> @@ -498,7 +491,7 @@ static int sof_audio_probe(struct platform_device *pdev)
>   	if (!ctx)
>   		return -ENOMEM;
>   
> -	if (x86_match_cpu(legacy_cpi_ids)) {
> +	if (soc_intel_is_byt() || soc_intel_is_cht()) {
>   		is_legacy_cpu = 1;
>   		dmic_num = 0;
>   		hdmi_num = 0;
> diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
> new file mode 100644
> index 000000000000..4718fd3cf636
> --- /dev/null
> +++ b/sound/soc/intel/common/soc-intel-quirks.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * soc-intel-quirks.h - prototypes for quirk autodetection
> + *
> + * Copyright (c) 2019, Intel Corporation.
> + *
> + */
> +
> +#ifndef _SND_SOC_INTEL_QUIRKS_H
> +#define _SND_SOC_INTEL_QUIRKS_H
> +
> +#if IS_ENABLED(CONFIG_X86)
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +#include <asm/iosf_mbi.h>
> +
> +#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> +
> +#define SOC_INTEL_IS_CPU(soc, type)				\
> +static inline bool soc_intel_is_##soc(void)			\
> +{								\
> +	static const struct x86_cpu_id soc##_cpu_ids[] = {	\
> +		ICPU(type),					\

I understand there is a separate discussion going on, hope I don't get 
fried for throwing small code review.

Consider using same arg name for both ICPU and SOC_INTEL_IS_CPU macros, 
whether it's "model" or "type". It's more readable that way.

> +		{}						\
> +	};							\
> +	const struct x86_cpu_id *id;				\
> +								\
> +	id = x86_match_cpu(soc##_cpu_ids);			\
> +	if (id)							\
> +		return true;					\
> +	return false;						\

Tenary operator should prove usefull here.

> +}
> +
> +SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
> +SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
> +SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
> +SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);

Hmm. Maybe go all-in and define SOC_INTEL_IS_CPU macro for the #else 
part too? Let it simply ignore args and retun false. If so, usages above 
could be moved outside of #ifndef block. Apart from _byt_cr case, that is.

This might save even more space in the future if you device to put more 
_IS_CPU for different platforms.

> +
> +static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int status = 0;
> +
> +	if (!soc_intel_is_byt())
> +		return false;
> +
> +	if (iosf_mbi_available()) {
> +		u32 bios_status;
> +
> +		status = iosf_mbi_read(BT_MBI_UNIT_PMC, /* 0x04 PUNIT */
> +				       MBI_REG_READ, /* 0x10 */
> +				       0x006, /* BIOS_CONFIG */
> +				       &bios_status);
> +
> +		if (status) {
> +			dev_err(dev, "could not read PUNIT BIOS_CONFIG\n");
> +		} else {
> +			/* bits 26:27 mirror PMIC options */
> +			bios_status = (bios_status >> 26) & 3;
> +
> +			if (bios_status == 1 || bios_status == 3) {
> +				dev_info(dev, "Detected Baytrail-CR platform\n");
> +				return true;
> +			}
> +
> +			dev_info(dev, "BYT-CR not detected\n");
> +		}
> +	} else {
> +		dev_info(dev, "IOSF_MBI not available, no BYT-CR detection\n");
> +	}
> +
> +	if (!platform_get_resource(pdev, IORESOURCE_IRQ, 5)) {
> +		/*
> +		 * Some devices detected as BYT-T have only a single IRQ listed,
> +		 * causing platform_get_irq with index 5 to return -ENXIO.
> +		 * The correct IRQ in this case is at index 0, as on BYT-CR.
> +		 */
> +		dev_info(dev, "Falling back to Baytrail-CR platform\n");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +#else
> +
> +static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
> +{
> +	return false;
> +}
> +
> +static inline bool soc_intel_is_byt(void)
> +{
> +	return false;
> +}
> +
> +static inline bool soc_intel_is_cht(void)
> +{
> +	return false;
> +}
> +
> +static inline bool soc_intel_is_apl(void)
> +{
> +	return false;
> +}
> +
> +static inline bool soc_intel_is_glk(void)
> +{
> +	return false;
> +}
> +
> +#endif
> +
> + #endif /* _SND_SOC_INTEL_QUIRKS_H */
> diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
> index 38062dd00dd2..93a8e15bbd2c 100644
> --- a/sound/soc/sof/sof-acpi-dev.c
> +++ b/sound/soc/sof/sof-acpi-dev.c
> @@ -15,10 +15,7 @@
>   #include <sound/soc-acpi.h>
>   #include <sound/soc-acpi-intel-match.h>
>   #include <sound/sof.h>
> -#ifdef CONFIG_X86
> -#include <asm/iosf_mbi.h>
> -#endif
> -
> +#include "../intel/common/soc-intel-quirks.h"
>   #include "ops.h"
>   
>   /* platform specific devices */
> @@ -105,56 +102,6 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
>   	.arch_ops = &sof_xtensa_arch_ops
>   };
>   
> -#ifdef CONFIG_X86 /* TODO: move this to common helper */
> -
> -static bool is_byt_cr(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	int status;
> -
> -	if (iosf_mbi_available()) {
> -		u32 bios_status;
> -		status = iosf_mbi_read(BT_MBI_UNIT_PMC, /* 0x04 PUNIT */
> -				       MBI_REG_READ, /* 0x10 */
> -				       0x006, /* BIOS_CONFIG */
> -				       &bios_status);
> -
> -		if (status) {
> -			dev_err(dev, "could not read PUNIT BIOS_CONFIG\n");
> -		} else {
> -			/* bits 26:27 mirror PMIC options */
> -			bios_status = (bios_status >> 26) & 3;
> -
> -			if (bios_status == 1 || bios_status == 3) {
> -				dev_info(dev, "Detected Baytrail-CR platform\n");
> -				return true;
> -			}
> -
> -			dev_info(dev, "BYT-CR not detected\n");
> -		}
> -	} else {
> -		dev_info(dev, "IOSF_MBI not available, no BYT-CR detection\n");
> -	}
> -
> -	if (platform_get_resource(pdev, IORESOURCE_IRQ, 5) == NULL) {
> -		/*
> -		 * Some devices detected as BYT-T have only a single IRQ listed,
> -		 * causing platform_get_irq with index 5 to return -ENXIO.
> -		 * The correct IRQ in this case is at index 0, as on BYT-CR.
> -		 */
> -		dev_info(dev, "Falling back to Baytrail-CR platform\n");
> -		return true;
> -	}
> -
> -	return false;
> -}
> -#else
> -static int is_byt_cr(struct platform_device *pdev)
> -{
> -	return 0;
> -}
> -#endif
> -
>   static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
>   	.machines = snd_soc_acpi_intel_cherrytrail_machines,
>   	.resindex_lpe_base = 0,
> @@ -209,7 +156,7 @@ static int sof_acpi_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
> -	if (desc == &sof_acpi_baytrail_desc && is_byt_cr(pdev))
> +	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
>   		desc = &sof_acpi_baytrailcr_desc;
>   #endif
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
