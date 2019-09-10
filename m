Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A478AF26B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 22:54:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0379F16BE;
	Tue, 10 Sep 2019 22:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0379F16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568148893;
	bh=XypTzAjiNGFhtQKWGkfGjXgs+juMdwOxirRA9wS76Qo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUP58rYHEfqiNrKVk/3w5N50gPfe3jogRgTNWx1yXWjw6+cJ7BMm/Tz4unWC+p6rz
	 bW6BkxbcCdNLYE4qK8V3r+7Tuqagtu+V1g88mb2yobso2yKYS5U1tj8+sbSXQ2aE2f
	 EwdRVB3WzwgFgPWsdW8SX0NTQgSQoLbNSmnFP9Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 272DAF804AB;
	Tue, 10 Sep 2019 22:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43197F800C9; Tue, 10 Sep 2019 22:52:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F57DF800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 22:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F57DF800C9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 13:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="214439784"
Received: from rmarszew-mobl1.ger.corp.intel.com (HELO [10.251.24.188])
 ([10.251.24.188])
 by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2019 13:52:14 -0700
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
 <20190910182916.29693-4-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <536bafff-963b-c6ed-bdac-f8a522a799c1@linux.intel.com>
Date: Tue, 10 Sep 2019 15:36:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910182916.29693-4-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Cc: libin.yang@intel.com
Subject: Re: [alsa-devel] [PATCH v3 03/10] ASoC: hdac_hda: add support for
 HDMI/DP as a HDA codec
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



On 9/10/19 1:29 PM, Kai Vehmanen wrote:
> Handle all HDA codecs using same logic, including HDMI/DP.
> 
> Call to snd_hda_codec_build_controls() is delayed for HDMI/DP HDA
> devices. This is needed to discover the PCM device numbers as
> defined in topology.
> 
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/soc/codecs/hdac_hda.c | 95 ++++++++++++++++++++++++++++++++-----
>   sound/soc/codecs/hdac_hda.h | 12 ++++-
>   2 files changed, 94 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
> index 91242b6f8ea7..3d4362158b29 100644
> --- a/sound/soc/codecs/hdac_hda.c
> +++ b/sound/soc/codecs/hdac_hda.c
> @@ -16,11 +16,8 @@
>   #include <sound/hdaudio_ext.h>
>   #include <sound/hda_codec.h>
>   #include <sound/hda_register.h>
> -#include "hdac_hda.h"
>   
> -#define HDAC_ANALOG_DAI_ID		0
> -#define HDAC_DIGITAL_DAI_ID		1
> -#define HDAC_ALT_ANALOG_DAI_ID		2
> +#include "hdac_hda.h"
>   
>   #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
>   			SNDRV_PCM_FMTBIT_U8 | \
> @@ -121,7 +118,46 @@ static struct snd_soc_dai_driver hdac_hda_dais[] = {
>   		.formats = STUB_FORMATS,
>   		.sig_bits = 24,
>   	},
> -}
> +},
> +{
> +	.id = HDAC_HDMI_0_DAI_ID,
> +	.name = "intel-hdmi-hifi1",
> +	.ops = &hdac_hda_dai_ops,
> +	.playback = {
> +		.stream_name    = "hifi1",
> +		.channels_min   = 1,
> +		.channels_max   = 16,

IIRC HDMI only deals with 8ch?

> +		.rates          = SNDRV_PCM_RATE_8000_192000,

And frequencies above 32kHz

> +		.formats        = STUB_FORMATS,
> +		.sig_bits = 24,
> +	},
> +},
> +{
> +	.id = HDAC_HDMI_1_DAI_ID,
> +	.name = "intel-hdmi-hifi2",
> +	.ops = &hdac_hda_dai_ops,
> +	.playback = {
> +		.stream_name    = "hifi2",
> +		.channels_min   = 1,
> +		.channels_max   = 16,
> +		.rates          = SNDRV_PCM_RATE_8000_192000,
> +		.formats        = STUB_FORMATS,
> +		.sig_bits = 24,
> +	},
> +},
> +{
> +	.id = HDAC_HDMI_2_DAI_ID,
> +	.name = "intel-hdmi-hifi3",
> +	.ops = &hdac_hda_dai_ops,
> +	.playback = {
> +		.stream_name    = "hifi3",
> +		.channels_min   = 1,
> +		.channels_max   = 16,
> +		.rates          = SNDRV_PCM_RATE_8000_192000,
> +		.formats        = STUB_FORMATS,
> +		.sig_bits = 24,
> +	},
> +},
>   
>   };
>   
> @@ -135,10 +171,11 @@ static int hdac_hda_dai_set_tdm_slot(struct snd_soc_dai *dai,
>   
>   	hda_pvt = snd_soc_component_get_drvdata(component);
>   	pcm = &hda_pvt->pcm[dai->id];
> +
>   	if (tx_mask)
> -		pcm[dai->id].stream_tag[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
> +		pcm->stream_tag[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
>   	else
> -		pcm[dai->id].stream_tag[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
> +		pcm->stream_tag[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
>   
>   	return 0;
>   }
> @@ -278,6 +315,12 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
>   	struct hda_pcm *cpcm;
>   	const char *pcm_name;
>   
> +	/*
> +	 * map DAI ID to the closest matching PCM name, using the naming
> +	 * scheme used by hda-codec snd_hda_gen_build_pcms() and for
> +	 * HDMI in hda_codec patch_hdmi.c)
> +	 */
> +
>   	switch (dai->id) {
>   	case HDAC_ANALOG_DAI_ID:
>   		pcm_name = "Analog";
> @@ -288,13 +331,22 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
>   	case HDAC_ALT_ANALOG_DAI_ID:
>   		pcm_name = "Alt Analog";
>   		break;
> +	case HDAC_HDMI_0_DAI_ID:
> +		pcm_name = "HDMI 0";
> +		break;
> +	case HDAC_HDMI_1_DAI_ID:
> +		pcm_name = "HDMI 1";
> +		break;
> +	case HDAC_HDMI_2_DAI_ID:
> +		pcm_name = "HDMI 2";
> +		break;
>   	default:
>   		dev_err(&hcodec->core.dev, "invalid dai id %d\n", dai->id);
>   		return NULL;
>   	}
>   
>   	list_for_each_entry(cpcm, &hcodec->pcm_list_head, list) {
> -		if (strpbrk(cpcm->name, pcm_name))
> +		if (strstr(cpcm->name, pcm_name))
>   			return cpcm;
>   	}
>   
> @@ -302,6 +354,18 @@ static struct hda_pcm *snd_soc_find_pcm_from_dai(struct hdac_hda_priv *hda_pvt,
>   	return NULL;
>   }
>   
> +static bool is_hdmi_codec(struct hda_codec *hcodec)
> +{
> +	struct hda_pcm *cpcm;
> +
> +	list_for_each_entry(cpcm, &hcodec->pcm_list_head, list) {
> +		if (cpcm->pcm_type == HDA_PCM_TYPE_HDMI)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   static int hdac_hda_codec_probe(struct snd_soc_component *component)
>   {
>   	struct hdac_hda_priv *hda_pvt =
> @@ -366,16 +430,23 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
>   		dev_dbg(&hdev->dev, "no patch file found\n");
>   	}
>   
> +	/* configure codec for 1:1 PCM:DAI mapping */
> +	hcodec->mst_no_extra_pcms = 1;
> +
>   	ret = snd_hda_codec_parse_pcms(hcodec);
>   	if (ret < 0) {
>   		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
>   		goto error;
>   	}
>   
> -	ret = snd_hda_codec_build_controls(hcodec);
> -	if (ret < 0) {
> -		dev_err(&hdev->dev, "unable to create controls %d\n", ret);
> -		goto error;
> +	/* HDMI controls need to be created in machine drivers */
> +	if (!is_hdmi_codec(hcodec)) {
> +		ret = snd_hda_codec_build_controls(hcodec);
> +		if (ret < 0) {
> +			dev_err(&hdev->dev, "unable to create controls %d\n",
> +				ret);
> +			goto error;
> +		}
>   	}
>   
>   	hcodec->core.lazy_cache = true;
> diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
> index 6b1bd4f428e7..5d0979f6f215 100644
> --- a/sound/soc/codecs/hdac_hda.h
> +++ b/sound/soc/codecs/hdac_hda.h
> @@ -6,6 +6,16 @@
>   #ifndef __HDAC_HDA_H__
>   #define __HDAC_HDA_H__
>   
> +enum {
> +	HDAC_ANALOG_DAI_ID = 0,
> +	HDAC_DIGITAL_DAI_ID,
> +	HDAC_ALT_ANALOG_DAI_ID,
> +	HDAC_HDMI_0_DAI_ID,
> +	HDAC_HDMI_1_DAI_ID,
> +	HDAC_HDMI_2_DAI_ID,
> +	HDAC_LAST_DAI_ID = HDAC_HDMI_2_DAI_ID,
> +};
> +
>   struct hdac_hda_pcm {
>   	int stream_tag[2];
>   	unsigned int format_val[2];
> @@ -13,7 +23,7 @@ struct hdac_hda_pcm {
>   
>   struct hdac_hda_priv {
>   	struct hda_codec codec;
> -	struct hdac_hda_pcm pcm[2];
> +	struct hdac_hda_pcm pcm[HDAC_LAST_DAI_ID];
>   };
>   
>   #define hdac_to_hda_priv(_hdac) \
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
