Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CBF252B5
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 16:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26FB01669;
	Tue, 21 May 2019 16:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26FB01669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558450284;
	bh=P+lhutAzpIJwVwkc0+lR2YN7lncF8e2ZcRs37sEVHqs=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=punjYO6l8ooXMeC3CLXC2FmBtKfjZ5EzjDG4wEM+iz0TiY9RePFCqNPKKrHjGlwxx
	 oKziRnFFTpuzrPdC5w78T2r2RxAQ/b9YiP/4YymHyz7uehJszu8JQGgwlrJUbPGxdl
	 bCdm03LbKEu9KMEKsOY6k7w+WhgyhRIewq+ueB0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B86DF89709;
	Tue, 21 May 2019 16:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5BA5F806E7; Tue, 21 May 2019 16:48:44 +0200 (CEST)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49453F89707
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49453F89707
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 07:38:26 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 21 May 2019 07:38:26 -0700
Received: from vgonzale-mobl.amr.corp.intel.com (unknown [10.254.21.162])
 by linux.intel.com (Postfix) with ESMTP id ADC8B5803C2;
 Tue, 21 May 2019 07:38:25 -0700 (PDT)
To: Rander Wang <rander.wang@linux.intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20190521070741.65866-1-rander.wang@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eda328c6-7083-4595-8f8d-a7cd2831fa93@linux.intel.com>
Date: Tue, 21 May 2019 09:38:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521070741.65866-1-rander.wang@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [RFC] ASoC: Intel: skl_hda_dsp_common: set long
 name for skl_hda_card
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

On 5/21/19 2:07 AM, Rander Wang wrote:
> skl_hda_generic machine driver is used by many different devices
> and userspace uses the card long name to differentiate devices.
> The card long name is figured out by DMI info and is in format
> of "vendor-product-version-board". Ucm file is searched by this
> card long name and one problem is different devices can't share
> one ucm file based on this type of long name. We have three different
> product devices with the same codecs and audio settings, and these
> devices can share the same ucm setting, but now we need to provide
> three ucm files with different long names, because we can't get a
> same long name from DMI info.
> 
> The solution is to provide card long name in machine driver like
> bytcr_rt5640 and ASoC will use this long name to generate final long
> name. The card long name is composed of codec name, input and output
> enabled by devices. The long name should be initialized after hda codec
> is initialized and before sound card checking long name which is done
> after dai link initialization, so the long name is set in codec dai
> link initialization function.
> 
> Possible card long names may be:
> skl-hda-ALC233-config135440
> skl-hda-ALC700-config69649
> skl-hda-ALC3204-config135185

Is this really what we want to do?

The configs are derived from the codec capabilities, which are typically 
a superset of what is actually supported on the production device. It's 
not usual e.g. to have a codec support an S/PDIF output but there is no 
physical connector. If you expose capabilities to the user that are not 
there, that's not so good. We have this example in one SOF device where 
the Digital output does nothing.

Also the number of combinations could really be quite large, unlike for 
bytcr_rt5640 where the options were limited to 1-2 bits here you have 5 
options with 4 bits each. How many UCM files are we going to end-up 
maintaining out of the possible 1M?

There is an alternate solution: you *could* use the DMI-base name and 
the include mechanism to reuse the same config if you wanted to. It's 
limiting in the sense that for every new platform we'll have to figure 
out which config it uses, but it'll be exactly what the user needs.

> 
> Tested on intel hda platform whiskylake with SOF driver and gemilake
> with intel SST driver
> 
> Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> ---
>   sound/soc/intel/boards/skl_hda_dsp_common.c | 54 +++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
> index 8b68f41a5b88..0193d2138e16 100644
> --- a/sound/soc/intel/boards/skl_hda_dsp_common.c
> +++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
> @@ -11,11 +11,18 @@
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
> +#include <sound/hda_codec.h>
> +#include "../../../pci/hda/hda_jack.h"
> +#include "../../../pci/hda/hda_local.h"
> +#include "../../../pci/hda/hda_auto_parser.h"
> +#include "../../../pci/hda/hda_generic.h"
>   #include "../../codecs/hdac_hdmi.h"
> +#include "../../codecs/hdac_hda.h"
>   #include "../skylake/skl.h"
>   #include "skl_hda_dsp_common.h"
>   
>   #define NAME_SIZE	32
> +static char skl_hda_long_name[NAME_SIZE];
>   
>   int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
>   {
> @@ -39,6 +46,52 @@ int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
>   	return 0;
>   }
>   
> +int skl_hda_long_name_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_rtdcom_list *new_rtdcom;
> +	struct snd_soc_component *component;
> +	struct hdac_hda_priv *hda_pvt;
> +	struct auto_pin_cfg *autocfg;
> +	struct hda_gen_spec *spec;
> +	struct snd_soc_card *card;
> +	const char *name;
> +	int config;
> +
> +	name = rtd->dai_link->codecs->name;
> +	card = rtd->card;
> +
> +	list_for_each_entry(new_rtdcom, &rtd->component_list, list) {
> +		component = new_rtdcom->component;
> +		if (name && strcmp(component->name, name) == 0) {
> +			hda_pvt = snd_soc_component_get_drvdata(component);
> +
> +			if (!hda_pvt)
> +				return -EINVAL;
> +
> +			spec = hda_pvt->codec.spec;
> +			autocfg = &spec->autocfg;
> +
> +			/*
> +			 * config is figured out by combining the number of
> +			 * enabled input and output.
> +			 */
> +			config = autocfg->speaker_outs | (autocfg->hp_outs << 4)
> +				| (autocfg->dig_outs << 8)
> +				| (autocfg->line_outs << 12)
> +				| (autocfg->num_inputs << 16);
> +			snprintf(skl_hda_long_name, sizeof(skl_hda_long_name),
> +				 "skl-hda-%s-config%d",
> +				 hda_pvt->codec.core.chip_name,
> +				 config);
> +
> +			card->long_name = skl_hda_long_name;
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /* skl_hda_digital audio interface glue - connects codec <--> CPU */
>   struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
>   	/* Back End DAI links */
> @@ -79,6 +132,7 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
>   		.dpcm_playback = 1,
>   		.dpcm_capture = 1,
>   		.no_pcm = 1,
> +		.init = skl_hda_long_name_init,
>   	},
>   	{
>   		.name = "Digital Playback and Capture",
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
