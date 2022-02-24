Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836D4C3BCC
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:41:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC6A1AA1;
	Fri, 25 Feb 2022 03:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC6A1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756860;
	bh=LOikF0/rX3AHINd6AeQtehpEpzOfhrfPiCunH6goSBw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6CFNbuSRD68Sdt05CVZwtYaskRtMqpetgVjdz3rUqd2uQC892TeExrBsVb9bQwfz
	 9R1MmrtFFYVV7W1fW/EREumzcHtGh4/eGktcTKMIHt8qA6QEpGcfyxWa8NPSWUeQut
	 d2N819Ptljm8H2Wg5wlrGfsEErfJmc1pftzwlRgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 184C6F804D9;
	Fri, 25 Feb 2022 03:39:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E3A0F804FD; Fri, 25 Feb 2022 03:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21543F800F3
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21543F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jrkrV3Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756756; x=1677292756;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LOikF0/rX3AHINd6AeQtehpEpzOfhrfPiCunH6goSBw=;
 b=jrkrV3RmvvTrcm3rBSeKDiqTFcv9pkTUB5Xm9s99g4CLoWBG04kdO6oa
 1wSukYMTPSfHS8488ljfiEERhxJaOj57XkJlLp5rwzf8lHonWStvGZt1/
 lt1hYXh9aTzj55ehjP2YdRt9uEXX3ZKmC1VvFvGv07frtMyVXfJpIw54u
 fxSyeNhf07nMl8pPiM1rjOjaHWHH+w41+v3+Si/vkq6fKnzoI55b+P1Au
 fmYTk/Ggcd1pwYiF+DJAmuIbgJue16wV82z5z+2hLmb63REW7Eh7tcyTP
 xEXvWU4PBtpg1VoRkgCp8oKSH15ksxKtliFChfE/buX5JL1+tXREg3u3F A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036138"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036138"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832604"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:10 -0800
Message-ID: <bde92ad1-0eda-d70a-4435-4963aa617cb4@linux.intel.com>
Date: Thu, 24 Feb 2022 17:55:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 03/17] ASoC: Intel: Introduce AVS driver
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-4-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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




> +config SND_SOC_INTEL_AVS
> +	tristate "Intel AVS driver"
> +	depends on PCI && ACPI
> +	depends on COMMON_CLK
> +	depends on SND_SOC_INTEL_SKYLAKE_FAMILY=n
> +	default n

default is already n

> +	select SND_SOC_ACPI
> +	select SND_HDA_EXT_CORE
> +	help
> +	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
> +	  capabilities. This includes Skylake, Kabylake, Amberlake and
> +	  Apollolake. This option is mutually exclusive with SKYLAKE
> +	  driver.

The feedback from the RFC was that this is not desirable if you want
anyone to use this driver. The suggested solution was to use the
intel_dspcfg layer with e.g. dsp_driver=4 for avs. That would allow
distributions to build this solution for early adopters.


> +/* Platform specific descriptor */
> +struct avs_spec {
> +	const char *name;
> +
> +	const struct avs_dsp_ops *const dops;

dsp_ops would be clearer. 'd' could refer to just about anything.

> +	const u32 core_init_mask;	/* used during DSP boot */
> +	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
> +};
> +
> +struct avs_dev {
> +	struct hda_bus base;
> +	struct device *dev;

question: could you directly embed a struct device instead of a pointer,
that would simplify the conversion through dev_get_drvdata below.

Unless this *dev is related to the PCI device, in which case you could
add a comment.

> +
> +	void __iomem *adsp_ba;

I would guess 'ba' is base address? this could be added with comments or
kernel-doc

> +	const struct avs_spec *spec;
> +};
> +
> +/* from hda_bus to avs_dev */
> +#define hda_to_avs(hda) container_of(hda, struct avs_dev, base)
> +/* from hdac_bus to avs_dev */
> +#define hdac_to_avs(hdac) hda_to_avs(to_hda_bus(hdac))
> +/* from device to avs_dev */
> +#define to_avs_dev(dev) \
> +({ \
> +	struct hdac_bus *__bus = dev_get_drvdata(dev); \
> +	hdac_to_avs(__bus); \
> +})
> +
> +int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active);

does this mean 'active' affects all bits in the core_mask? that doesn't
seem very intuitive.

> +int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset);
> +int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
> +int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
> +int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);

it's a bit inconsistent to have enable/disable but a boolean for other
functions?


> +#include <linux/module.h>
> +#include <sound/hdaudio_ext.h>
> +#include "avs.h"
> +#include "registers.h"

consider renaming as avs_registers.h?

> +
> +#define AVS_ADSPCS_INTERVAL_US		500
> +#define AVS_ADSPCS_TIMEOUT_US		10000

these values don't match with anything that was previously used for
Intel platforms, where the values could be different depending on
generations.

bxt-sst.c:#define BXT_BASEFW_TIMEOUT    3000
bxt-sst.c:#define BXT_ROM_INIT_TIMEOUT  70
cnl-sst.c:#define CNL_INIT_TIMEOUT      300
cnl-sst.c:#define CNL_BASEFW_TIMEOUT    3000
skl-sst-cldma.h:#define SKL_WAIT_TIMEOUT                500     /* 500
msec */
skl-sst-dsp.h:#define BXT_INIT_TIMEOUT          300
skl-sst-ipc.c:#define IPC_TIMEOUT_MSECS         3000
skl-sst.c:#define SKL_BASEFW_TIMEOUT    300
skl-sst.c:#define SKL_INIT_TIMEOUT      1000

please add a comment on how they were determined or align on hardware
recommendations.

> +int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active)
> +{
> +	u32 value, mask, reg;
> +	int ret;
> +
> +	mask = AVS_ADSPCS_SPA_MASK(core_mask);
> +	value = active ? mask : 0;
> +
> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
> +
> +	mask = AVS_ADSPCS_CPA_MASK(core_mask);
> +	value = active ? mask : 0;
> +
> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
> +				       reg, (reg & mask) == value,
> +				       AVS_ADSPCS_INTERVAL_US,
> +				       AVS_ADSPCS_TIMEOUT_US);
> +	if (ret)
> +		dev_err(adev->dev, "core_mask %d %spower failed: %d\n",
> +			core_mask, active ? "" : "un", ret);

unpower is an odd wording.

> +
> +	return ret;
> +}
> +
> +int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
> +{
> +	u32 value, mask, reg;
> +	int ret;
> +
> +	mask = AVS_ADSPCS_CRST_MASK(core_mask);
> +	value = reset ? mask : 0;
> +
> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
> +
> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
> +				       reg, (reg & mask) == value,
> +				       AVS_ADSPCS_INTERVAL_US,
> +				       AVS_ADSPCS_TIMEOUT_US);
> +	if (ret)
> +		dev_err(adev->dev, "core_mask %d %sreset failed: %d\n",
> +			core_mask, reset ? "" : "un", ret);

unreset is even more odd. enter reset or exit reset.

> +
> +	return ret;
> +}
> +
> +int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
> +{
> +	u32 value, mask, reg;
> +	int ret;
> +
> +	mask = AVS_ADSPCS_CSTALL_MASK(core_mask);
> +	value = stall ? mask : 0;
> +
> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
> +
> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
> +				       reg, (reg & mask) == value,
> +				       AVS_ADSPCS_INTERVAL_US,
> +				       AVS_ADSPCS_TIMEOUT_US);
> +	if (ret)
> +		dev_err(adev->dev, "core_mask %d %sstall failed: %d\n",
> +			core_mask, stall ? "" : "un", ret);

that was probably a copy/paste of stall/unstall in the two cases
above...this one works, the two above not so much.

> +
> +	return ret;
> +}
> +
> +int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask)
> +{
> +	int ret;
> +
> +	ret = avs_dsp_op(adev, power, core_mask, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = avs_dsp_op(adev, reset, core_mask, false);
> +	if (ret)
> +		return ret;
> +
> +	return avs_dsp_op(adev, stall, core_mask, false);
> +}
> +
> +int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask)
> +{
> +	/* Be permissive to allow for full DSP shutdown in disable path. */

that comment isn't very clear, what is permissive here?

> +	avs_dsp_op(adev, stall, core_mask, true);
> +	avs_dsp_op(adev, reset, core_mask, true);
> +
> +	return avs_dsp_op(adev, power, core_mask, false);
> +}
> +
> +MODULE_LICENSE("GPL v2");

"GPL"

> diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
> new file mode 100644
> index 000000000000..e0b6c8ffe633
> --- /dev/null
> +++ b/sound/soc/intel/avs/registers.h

avs_registers.h?

> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright(c) 2021 Intel Corporation. All rights reserved.
> + *
> + * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
> + *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
> + */
> +
> +#ifndef __SOUND_SOC_INTEL_AVS_REGS_H
> +#define __SOUND_SOC_INTEL_AVS_REGS_H
> +
> +/* Intel HD Audio General DSP Registers */
> +#define AVS_ADSP_GEN_BASE		0x0
> +#define AVS_ADSP_REG_ADSPCS		(AVS_ADSP_GEN_BASE + 0x04)
> +
> +#define AVS_ADSPCS_CRST_MASK(cm)	(cm)
> +#define AVS_ADSPCS_CSTALL_MASK(cm)	((cm) << 8)
> +#define AVS_ADSPCS_SPA_MASK(cm)		((cm) << 16)
> +#define AVS_ADSPCS_CPA_MASK(cm)		((cm) << 24)
> +#define AVS_MAIN_CORE_MASK		BIT(0)
> +
> +#endif /* __SOUND_SOC_INTEL_AVS_REGS_H */
