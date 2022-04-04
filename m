Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72134F1938
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 18:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C39F16C2;
	Mon,  4 Apr 2022 18:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C39F16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649088996;
	bh=m1mU6BlU2B4FGrW+3lCN164st5AaCcn5BL7QiunBPA8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AfZZfM5RLrqCTbji3Q2Y2aMVOjgP4mwLkIU2BWX5geGsaOA4NexW/60+Y5/ndZ0Fw
	 tlQvKHtvbpDFTF4A822bwQ3Q2Aj/bKd22UJYls9FNNdtXpnkbF235RloXPxpjubSFq
	 qNLSIRVSIU0TbJEzrJ8Uox4DpMtLFVQVhGkvOa4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5B32F801F7;
	Mon,  4 Apr 2022 18:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B70DCF80162; Mon,  4 Apr 2022 18:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1D9FF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 18:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D9FF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Pd+LCB7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649088929; x=1680624929;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=m1mU6BlU2B4FGrW+3lCN164st5AaCcn5BL7QiunBPA8=;
 b=Pd+LCB7lZ1+FJ1lxeo78DFjGlC5V3hdnZCrU4YAkoQWoTs98YoR++NM0
 sxvYfULQ6/rcnuYu1CUde65n8Y5cMCD2Ntn9tAbTXkeaQMnBExsNe8JBP
 oMAK5MGI0zqjE01SV3bHYWGcuDvd5I4tnnkQ5ho7qY3q5rpTtgnrkv/JP
 oTLL1RzhdTgLwkIotHzlOi+q5XcVfoPN7GpKY+pLvPOmp+iXsmjZdK2QM
 HU5r5EArpZ+3t+ZdAkx8BywN0kNJ0eu/a7ZpBkAdECOmozy8uIoklAFij
 pDgHqj89X6GEGGmEaPrBAcrEDpJmRqNvR5Cyz/9XqcQYU7wV3CR8kQXhp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="346991902"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="346991902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 09:15:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; d="scan'208";a="523636963"
Received: from tpbigam-mobl1.amr.corp.intel.com (HELO [10.212.232.52])
 ([10.212.232.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 09:15:23 -0700
Message-ID: <34a05d7b-ee42-acd2-56ea-f8adae74f169@linux.intel.com>
Date: Mon, 4 Apr 2022 11:15:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] ASoC: codecs: add support for ES8326
Content-Language: en-US
To: "zhuning@everest-semi.com" <zhuning@everest-semi.com>,
 alsa-devel <alsa-devel@alsa-project.org>
References: <2022032612075311484468@everest-semi.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2022032612075311484468@everest-semi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
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



On 3/25/22 23:07, zhuning@everest-semi.com wrote:
>  From 18deaac165343c049bb5ac7a71d222576caec9fc Mon Sep 17 00:00:00 2001
> From: yangxiaohua <yangxiaohua@everest-semi.com>
> Date: Thu, 10 Mar 2022 16:59:29 +0800
> Subject: [PATCH 1/1] ASoC: codecs: add support for ES8326
> 
> The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>

You need to copy maintainers (added in CC:), and you're also missing a 
Signed-off-by when sending patches developed by someone else.

Also please use git send-email, it looks like the indentations were 
removed by your email client.

> ---
>   sound/soc/codecs/Kconfig  |   5 +
>   sound/soc/codecs/Makefile |   2 +
>   sound/soc/codecs/es8326.c | 753 ++++++++++++++++++++++++++++++++++++++
>   sound/soc/codecs/es8326.h | 184 ++++++++++
>   4 files changed, 944 insertions(+)
>   create mode 100755 sound/soc/codecs/es8326.c
>   create mode 100755 sound/soc/codecs/es8326.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index c2627f7489a4..66bc2358e31e 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -95,6 +95,7 @@ config SND_SOC_ALL_CODECS
>    imply SND_SOC_DA9055
>    imply SND_SOC_DMIC
>    imply SND_SOC_ES8316
> + imply SND_SOC_ES8326
>    imply SND_SOC_ES8328_SPI
>    imply SND_SOC_ES8328_I2C
>    imply SND_SOC_ES7134
> @@ -867,6 +868,10 @@ config SND_SOC_ES8316
>    tristate "Everest Semi ES8316 CODEC"
>    depends on I2C
>   
> +config SND_SOC_ES8326
> + tristate "Everest Semi ES8326 CODEC"
> + depends on I2C
> +
>   config SND_SOC_ES8328
>    tristate
>   
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index b4e11c3e4a08..73043d5bc1ea 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -95,6 +95,7 @@ snd-soc-dmic-objs := dmic.o
>   snd-soc-es7134-objs := es7134.o
>   snd-soc-es7241-objs := es7241.o
>   snd-soc-es8316-objs := es8316.o
> +snd-soc-es8326-objs := es8326.o
>   snd-soc-es8328-objs := es8328.o
>   snd-soc-es8328-i2c-objs := es8328-i2c.o
>   snd-soc-es8328-spi-objs := es8328-spi.o
> @@ -437,6 +438,7 @@ obj-$(CONFIG_SND_SOC_DMIC) += snd-soc-dmic.o
>   obj-$(CONFIG_SND_SOC_ES7134) += snd-soc-es7134.o
>   obj-$(CONFIG_SND_SOC_ES7241) += snd-soc-es7241.o
>   obj-$(CONFIG_SND_SOC_ES8316)    += snd-soc-es8316.o
> +obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
>   obj-$(CONFIG_SND_SOC_ES8328) += snd-soc-es8328.o
>   obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
>   obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
> diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
> new file mode 100755
> index 000000000000..a80649e04aa6
> --- /dev/null
> +++ b/sound/soc/codecs/es8326.c
> @@ -0,0 +1,753 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * es8326.c -- es8326 ALSA SoC audio driver
> + * Copyright Everest Semiconductor Co., Ltd
> + *
> + * Authors: David Yang <yangxiaohua@everest-semi.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <sound/jack.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/tlv.h>
> +#include "es8326.h"
> +
> +struct es8326_priv {
> + struct clk *mclk;
> + struct snd_pcm_hw_constraint_list *sysclk_constraints;
> + struct i2c_client *i2c;
> + struct regmap *regmap;
> + struct snd_soc_component *component;
> + struct delayed_work jack_detect_work;
> + bool amic;
> + bool start;
> + bool muted;
> + bool hp_inserted;
> + bool spk_gpio_level;
> + bool hp_det_level;
> + struct snd_soc_jack *jack;
> + int irq;
> + /* The lock protects the situation that an irq is generated
> + * while the previous irq is still being processed.
> + */
> + struct mutex lock;
> + u8 amic1_src;
> + u8 amic2_src;
> + u8 mic1_src;
> + u8 mic2_src;
> + u8 jack_pol;
> + bool jd_inverted;
> + unsigned int sysclk;
> +};
