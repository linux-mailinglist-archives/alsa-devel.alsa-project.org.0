Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465F4CD9A0
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F099F1E84;
	Fri,  4 Mar 2022 18:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F099F1E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646413401;
	bh=xsK3gWPyAKNBjJ0d4txFuwZSRXpBS0aDHOCm/7OyI1s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NbUIfopDKkTaGGKeIH/d+jLkhtGeyiVxnwzM2VfTBFhtq9ROe7MXrkKLfnw+BqXbN
	 NY4/wscDX5yv1Oo/8WzF5HvDCH0MUFMRET5wUIFV1rehjdmr3/wgIazfdkkF8E3rDN
	 NUzR6E4A9NJQ4TS3mheWX7Htt0Zd6H3mLSA699y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C05F801F5;
	Fri,  4 Mar 2022 18:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71490F800F0; Fri,  4 Mar 2022 18:02:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FF47F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF47F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f58rZ8Ou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646413325; x=1677949325;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xsK3gWPyAKNBjJ0d4txFuwZSRXpBS0aDHOCm/7OyI1s=;
 b=f58rZ8OuJjzuM1lZqsj/v79fcdsskUhn/zZsbv1FIfuwv5/RB+B70MzL
 kyv7sSk+RTM5oACfrUNT49//adbMNej93JEx1sEENRJJA1a28VbGfjnS6
 hRXX+2JiKjdkgbmj9uJtAdZGSH2CCD6o0pCR7M6qjy8jOGrsKzo0khAuH
 OZBGa/FuR1zlxjSfilZFOEyeNH12aVJa4yR7mEDixOWQwj+70+b2RWX/m
 AIDFHYdGWNGz8od/YIicrwSt1VDAwScFB5GGt/XOZiD3Rc3asBnqv3FI2
 iqyWcskUsbryQ3CBkk/JpSqwynr+0K1durvYmEWI/gw/AG98tvFCn+/LO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="254207659"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="254207659"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:00:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="710390972"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:59:59 -0800
Message-ID: <2b75e00683d7f7c33ecdf78a9889748aeb50555a.camel@linux.intel.com>
Subject: Re: [PATCH v3 17/17] ASoC: Intel: avs: Code loading over HDA
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:59:59 -0800
In-Reply-To: <20220304145755.2844173-18-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-18-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Compared to SKL and KBL, younger cAVS platforms are meant to re-use
> one
Younger? you mean newer?
> of HDAudio streams during boot procedure causing CLDMA to become
> obsolete. Once transferred, given stream is returned to pool
> available
> for audio streaming.
> 
> Module loading handler is dummy as library and module code became
> inseparable in later firmware generations.
replace dummy with "stub" maybe? lets use inclusive terms
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/Kconfig      |   1 +
>  sound/soc/intel/avs/avs.h    |   5 +
>  sound/soc/intel/avs/loader.c | 211
> +++++++++++++++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index e9768c4aa1a9..d025ca0c77fa 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -215,6 +215,7 @@ config SND_SOC_INTEL_AVS
>  	depends on COMMON_CLK
>  	select SND_SOC_ACPI
>  	select SND_HDA_EXT_CORE
> +	select SND_HDA_DSP_LOADER
>  	help
>  	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
>  	  capabilities. This includes Skylake, Kabylake, Amberlake and
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> index fb3520f32488..6dc5d17ccf21 100644
> --- a/sound/soc/intel/avs/avs.h
> +++ b/sound/soc/intel/avs/avs.h
> @@ -45,6 +45,7 @@ struct avs_dsp_ops {
>  	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
>  
>  #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
> +#define AVS_PLATATTR_IMR		BIT_ULL(1)
>  
>  #define avs_platattr_test(adev, attr) \
>  	((adev)->spec->attributes & AVS_PLATATTR_##attr)
> @@ -239,5 +240,9 @@ int avs_cldma_load_basefw(struct avs_dev *adev,
> struct firmware *fw);
>  int avs_cldma_load_library(struct avs_dev *adev, struct firmware
> *lib, u32 id);
>  int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
>  			       struct avs_module_entry *mods, u32
> num_mods);
> +int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw);
> +int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib,
> u32 id);
> +int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
> +			     struct avs_module_entry *mods, u32
> num_mods);
>  
>  #endif /* __SOUND_SOC_INTEL_AVS_H */
> diff --git a/sound/soc/intel/avs/loader.c
> b/sound/soc/intel/avs/loader.c
> index 2134aaabe2c6..6520f23fc70e 100644
> --- a/sound/soc/intel/avs/loader.c
> +++ b/sound/soc/intel/avs/loader.c
> @@ -9,6 +9,7 @@
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <sound/hdaudio.h>
>  #include <sound/hdaudio_ext.h>
>  #include "avs.h"
>  #include "cldma.h"
> @@ -18,8 +19,11 @@
>  #define AVS_ROM_STS_MASK		0xFF
>  #define AVS_ROM_INIT_DONE		0x1
>  #define SKL_ROM_BASEFW_ENTERED		0xF
> +#define APL_ROM_FW_ENTERED		0x5
>  #define AVS_ROM_INIT_POLLING_US		5
>  #define SKL_ROM_INIT_TIMEOUT_US		1000000
> +#define APL_ROM_INIT_TIMEOUT_US		300000
> +#define APL_ROM_INIT_RETRIES		3
>  
>  #define AVS_FW_INIT_POLLING_US		500
>  #define AVS_FW_INIT_TIMEOUT_US		3000000
> @@ -261,6 +265,204 @@ int avs_cldma_transfer_modules(struct avs_dev
> *adev, bool load,
>  	return 0;
>  }
>  
> +static int
> +avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool
> purge)
> +{
> +	const struct avs_spec *const spec = adev->spec;
> +	unsigned int corex_mask, reg;
> +	int ret;
> +
> +	corex_mask = spec->core_init_mask & ~AVS_MAIN_CORE_MASK;
> +
> +	ret = avs_dsp_op(adev, power, spec->core_init_mask, true);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = avs_dsp_op(adev, reset, AVS_MAIN_CORE_MASK, false);
> +	if (ret < 0)
> +		goto err;
> +
> +	reinit_completion(&adev->fw_ready);
> +	avs_dsp_op(adev, int_control, true);
> +
> +	/* set boot config */
> +	ret = avs_ipc_set_boot_config(adev, dma_id, purge);
> +	if (ret) {
> +		ret = AVS_IPC_RET(ret);
> +		goto err;
> +	}
> +
> +	/* await ROM init */
> +	ret = snd_hdac_adsp_readq_poll(adev, spec->rom_status, reg,
> +				       (reg & 0xF) == AVS_ROM_INIT_DONE
> ||
> +				       (reg & 0xF) ==
> APL_ROM_FW_ENTERED,
> +				       AVS_ROM_INIT_POLLING_US,
> APL_ROM_INIT_TIMEOUT_US);
> +	if (ret < 0) {
> +		dev_err(adev->dev, "rom init timeout: %d\n", ret);
> +		goto err;
> +	}
> +
> +	/* power down non-main cores */
> +	if (corex_mask)
> +		avs_dsp_op(adev, power, corex_mask, false);
What if this fails?
> +
> +	return 0;
> +
> +err:
> +	avs_dsp_core_disable(adev, spec->core_init_mask);
> +	return ret;
> +}
> +
> +static int avs_imr_load_basefw(struct avs_dev *adev)
> +{
> +	int ret;
> +
> +	/* DMA id ignored when flashing from IMR as no transfer occurs.
> */
> +	ret = avs_hda_init_rom(adev, 0, false);
> +	if (ret < 0) {
> +		dev_err(adev->dev, "rom init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&adev->fw_ready,
> +				msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS
> ));
> +	if (!ret) {
> +		dev_err(adev->dev, "firmware ready timeout\n");
> +		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
> +{
> +	struct snd_pcm_substream substream;
> +	struct snd_dma_buffer dmab;
> +	struct hdac_ext_stream *estream;
> +	struct hdac_stream *hstream;
> +	struct hdac_bus *bus = &adev->base.core;
> +	unsigned int sdfmt, reg;
> +	int ret, i;
> +
> +	/* configure hda dma */
> +	memset(&substream, 0, sizeof(substream));
> +	substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
> +	estream = snd_hdac_ext_stream_assign(bus, &substream,
> +					     HDAC_EXT_STREAM_TYPE_HOST)
> ;
> +	if (!estream)
> +		return -ENODEV;
> +	hstream = hdac_stream(estream);
> +
> +	/* code loading performed with default format */
> +	sdfmt = snd_hdac_calc_stream_format(48000, 1,
> SNDRV_PCM_FORMAT_S32_LE, 32, 0);
> +	ret = snd_hdac_dsp_prepare(hstream, sdfmt, fw->size, &dmab);
> +	if (ret < 0)
> +		goto release_stream;
> +
> +	/* enable SPIB for hda stream */
> +	snd_hdac_ext_stream_spbcap_enable(bus, true, hstream->index);
> +	ret = snd_hdac_ext_stream_set_spib(bus, estream, fw->size);
> +	if (ret)
> +		goto cleanup_resources;
> +
> +	memcpy(dmab.area, fw->data, fw->size);
> +
> +	for (i = 0; i < APL_ROM_INIT_RETRIES; i++) {
> +		unsigned int dma_id = hstream->stream_tag - 1;
> +
> +		ret = avs_hda_init_rom(adev, dma_id, true);
> +		if (!ret)
> +			break;
> +		dev_info(adev->dev, "#%d rom init fail: %d\n", i + 1,
> ret);
> +	}
> +	if (ret < 0)
> +		goto cleanup_resources;
> +
> +	/* transfer firmware */
> +	snd_hdac_dsp_trigger(hstream, true);
> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_FW_REG_STATUS(adev),
> reg,
> +				       (reg & AVS_ROM_STS_MASK) ==
> APL_ROM_FW_ENTERED,
> +				       AVS_FW_INIT_POLLING_US,
> AVS_FW_INIT_TIMEOUT_US);
> +	snd_hdac_dsp_trigger(hstream, false);
> +	if (ret < 0) {
> +		dev_err(adev->dev, "transfer fw failed: %d\n", ret);
> +		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
> +	}
> +
> +cleanup_resources:
> +	/* disable SPIB for hda stream */
> +	snd_hdac_ext_stream_spbcap_enable(bus, false, hstream->index);
> +	snd_hdac_ext_stream_set_spib(bus, estream, 0);
> +
> +	snd_hdac_dsp_cleanup(hstream, &dmab);
> +release_stream:
> +	snd_hdac_ext_stream_release(estream,
> HDAC_EXT_STREAM_TYPE_HOST);
> +
> +	return ret;
> +}
> +
> +int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib,
> u32 id)
> +{
> +	struct snd_pcm_substream substream;
> +	struct snd_dma_buffer dmab;
> +	struct hdac_ext_stream *estream;
> +	struct hdac_stream *stream;
> +	struct hdac_bus *bus = &adev->base.core;
> +	unsigned int sdfmt;
> +	int ret;
> +
> +	/* configure hda dma */
> +	memset(&substream, 0, sizeof(substream));
> +	substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
> +	estream = snd_hdac_ext_stream_assign(bus, &substream,
> +					     HDAC_EXT_STREAM_TYPE_HOST)
> ;
> +	if (!estream)
> +		return -ENODEV;
> +	stream = hdac_stream(estream);
> +
> +	/* code loading performed with default format */
> +	sdfmt = snd_hdac_calc_stream_format(48000, 1,
> SNDRV_PCM_FORMAT_S32_LE, 32, 0);
> +	ret = snd_hdac_dsp_prepare(stream, sdfmt, lib->size, &dmab);
> +	if (ret < 0)
> +		goto release_stream;
> +
> +	/* enable SPIB for hda stream */
> +	snd_hdac_ext_stream_spbcap_enable(bus, true, stream->index);
> +	snd_hdac_ext_stream_set_spib(bus, estream, lib->size);
> +
> +	memcpy(dmab.area, lib->data, lib->size);
> +
> +	/* transfer firmware */
> +	snd_hdac_dsp_trigger(stream, true);
> +	ret = avs_ipc_load_library(adev, stream->stream_tag - 1, id);
> +	snd_hdac_dsp_trigger(stream, false);
> +	if (ret) {
> +		dev_err(adev->dev, "transfer lib %d failed: %d\n", id,
> ret);
> +		ret = AVS_IPC_RET(ret);
> +	}
> +
> +	/* disable SPIB for hda stream */
> +	snd_hdac_ext_stream_spbcap_enable(bus, false, stream->index);
> +	snd_hdac_ext_stream_set_spib(bus, estream, 0);
> +
> +	snd_hdac_dsp_cleanup(stream, &dmab);
> +release_stream:
> +	snd_hdac_ext_stream_release(estream,
> HDAC_EXT_STREAM_TYPE_HOST);
> +
> +	return ret;
> +}
> +
> +int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
> +			     struct avs_module_entry *mods, u32
> num_mods)
What is the difference between transfer_modules and load_library?

Thanks,Ranjani

