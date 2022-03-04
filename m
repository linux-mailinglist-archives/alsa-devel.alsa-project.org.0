Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EE4CD852
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:53:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FAC1AE0;
	Fri,  4 Mar 2022 16:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FAC1AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646409182;
	bh=ukmPw8e/kPC1izHT3lZA7k4/DJV8mtopSUZBBD9F7qs=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvHayc1NO6NeYkEeBIRgR16hyzwDq5ckQfGPJhrTio+UyqGW7MgKGG6DQZKSVjKRy
	 IaSsyZKYTKGHho0f/PVdiXY1zOXJyf9kTHZJ4v4CVNSZcHH+OVsKIJ/3XAC9i1xFAK
	 0N+CkU8x1oPe5p5nAUy0Z/z3dF8jlLWlP7uQd2XI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D4C8F800FA;
	Fri,  4 Mar 2022 16:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A226F801EC; Fri,  4 Mar 2022 16:51:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48CF0F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48CF0F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ROOAgIGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646409109; x=1677945109;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukmPw8e/kPC1izHT3lZA7k4/DJV8mtopSUZBBD9F7qs=;
 b=ROOAgIGmnJhy/q1xSabyDyLlFpmZj91p+3CxIDrjy2n6igHVPAqu48HR
 tXVBYcsQWXpcrMDk2/hq+7bEhqmGx1AYCeO9xraPfCjnz6ApyUbfmDQII
 Kej1b5fj95se3UJ3vb8xcC3w+gdmmEyhcUT37Is2/dC8H7i3wzIZTOqln
 me4exDNqc0YC8faEXkGxQNqHDnZ5I5DJwEbAyZaajL1/UyekLRt6OSiPJ
 Pbij6sgTTJISvLGv8qwpP+ysj3AUYMIjlBXBxGhjr0GDuAiWY4kqkauVc
 T/zTLaH8ptyEznlPhAOaEvhiUAHrn8PVrxhSkgjNynqgtvGZtmYMwjsi1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="251575313"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="251575313"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 07:51:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="576911752"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 07:51:43 -0800
Message-ID: <10962335d20c89c965ad7a686250d807a103f777.camel@linux.intel.com>
Subject: Re: [PATCH v3 03/17] ASoC: Intel: Introduce AVS driver
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 07:51:36 -0800
In-Reply-To: <20220304145755.2844173-4-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-4-cezary.rojewski@intel.com>
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
> Declare base structures and core DSP operations for the avs solution.
> The base structures describe PCI HDAudio bus device and platform-type
> differentiations. First set of operations added controls the
> lifecycle
> of any Audio DSP core: (un)powering, (un)resetting and (un)stalling.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/Kconfig         |  11 ++++
>  sound/soc/intel/Makefile        |   1 +
>  sound/soc/intel/avs/Makefile    |   5 ++
>  sound/soc/intel/avs/avs.h       |  71 +++++++++++++++++++++
>  sound/soc/intel/avs/dsp.c       | 107
> ++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/registers.h |  22 +++++++
>  6 files changed, 217 insertions(+)
>  create mode 100644 sound/soc/intel/avs/Makefile
>  create mode 100644 sound/soc/intel/avs/avs.h
>  create mode 100644 sound/soc/intel/avs/dsp.c
>  create mode 100644 sound/soc/intel/avs/registers.h
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index f3a4a907b29d..e9768c4aa1a9 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -209,5 +209,16 @@ config SND_SOC_INTEL_KEEMBAY
>  	  If you have a Intel Keembay platform then enable this option
>  	  by saying Y or m.
>  
> +config SND_SOC_INTEL_AVS
> +	tristate "Intel AVS driver"
> +	depends on PCI && ACPI
> +	depends on COMMON_CLK
> +	select SND_SOC_ACPI
> +	select SND_HDA_EXT_CORE
> +	help
> +	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
> +	  capabilities. This includes Skylake, Kabylake, Amberlake and
> +	  Apollolake.
> +
>  # ASoC codec drivers
>  source "sound/soc/intel/boards/Kconfig"
> diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
> index 7c5038803be7..d44b2652c707 100644
> --- a/sound/soc/intel/Makefile
> +++ b/sound/soc/intel/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
>  obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
>  obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
>  obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
> +obj-$(CONFIG_SND_SOC_INTEL_AVS) += avs/
>  
>  # Machine support
>  obj-$(CONFIG_SND_SOC) += boards/
> diff --git a/sound/soc/intel/avs/Makefile
> b/sound/soc/intel/avs/Makefile
> new file mode 100644
> index 000000000000..5f7976a95fe2
> --- /dev/null
> +++ b/sound/soc/intel/avs/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +snd-soc-avs-objs := dsp.o
> +
> +obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> new file mode 100644
> index 000000000000..d4e6310e4bf7
> --- /dev/null
> +++ b/sound/soc/intel/avs/avs.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright(c) 2021 Intel Corporation. All rights reserved.
> + *
> + * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
> + *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
> + */
> +
> +#ifndef __SOUND_SOC_INTEL_AVS_H
> +#define __SOUND_SOC_INTEL_AVS_H
> +
> +#include <linux/device.h>
> +#include <sound/hda_codec.h>
> +
> +struct avs_dev;
> +
> +struct avs_dsp_ops {
> +	int (* const power)(struct avs_dev *, u32, bool);
> +	int (* const reset)(struct avs_dev *, u32, bool);
> +	int (* const stall)(struct avs_dev *, u32, bool);
> +};
> +
> +#define avs_dsp_op(adev, op, ...) \
> +	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
> +
> +#define avs_platattr_test(adev, attr) \
> +	((adev)->spec->attributes & AVS_PLATATTR_##attr)
AVS_PLATATTR_* don't seem to be defined in this patch?

Thanks,
Ranjani

