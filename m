Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519896CBC7A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 12:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B48D1EE;
	Tue, 28 Mar 2023 12:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B48D1EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679999081;
	bh=Geahv+dwmJea+gJ1RquT1QpcjFoZC1hMncJ+5QUhhUY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YpqSpRbOAHjHhkdtp/QbqQaosHjyVQ9b8dlsm3NPg8pWhyW6CjbzD4OO6VOWF+8pg
	 XEize3dhfNxzEFtvMA84csx1FAh9B3ki4qIn78EaTb4019nNra6VvKbknR+A+5YNtC
	 nGYfCMpRtgt4y9/+QYKJjxzl2UXXMOXFTqVfHKL0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9329AF8024E;
	Tue, 28 Mar 2023 12:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5588F80272; Tue, 28 Mar 2023 12:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9627BF80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 12:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9627BF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C1ITgizD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679999022; x=1711535022;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Geahv+dwmJea+gJ1RquT1QpcjFoZC1hMncJ+5QUhhUY=;
  b=C1ITgizD9t6YDcfkeBj75yleOgrCgbz6ooFSxyZgWJoNu4DoRyXnub8C
   o1BrjcRyXYWL6zLPDqqenGYAb29dVSyj3T5Al5lvq//4yri6ZITND85Ce
   U2SRC/Z1HrqKqUIXDCkEYgM3/d9vXWcy8kEWcyO1sXLgLPtjNpOgmI8gq
   9uKJNb89yskHcMcHgYnb4pcuExbBM6dQH41aEiONhwcZt0pLpS8lUn9A1
   OAHvfRsdDAC2x92yWEjGWtnJ4fwDP+W9t6SF2ulY6YEqhZ28qD51piRZe
   ziOOF2a/0sgq3FAQ/mOE7S5as/sPydlybBX5662nrb5XgQ3Johd3pFth1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="403140847"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="403140847"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="716444819"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="716444819"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:23:35 -0700
Message-ID: <2c15c579-c62d-b972-0b56-a3632e767132@linux.intel.com>
Date: Tue, 28 Mar 2023 12:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic
 topology
Content-Language: en-US
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20230328092854.156478-1-shumingf@realtek.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230328092854.156478-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZUCXURSRNMBU526YQYBVNUZDTUXPXSU3
X-Message-ID-Hash: ZUCXURSRNMBU526YQYBVNUZDTUXPXSU3
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com, bard.liao@intel.com, Yijun.Shen@dell.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUCXURSRNMBU526YQYBVNUZDTUXPXSU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/28/2023 11:28 AM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This is the initial codec driver for rt712 SDCA (Mic topology).
> The host should connect with rt712 SdW2 interface.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>   sound/soc/codecs/Kconfig           |   7 +
>   sound/soc/codecs/Makefile          |   2 +
>   sound/soc/codecs/rt712-sdca-dmic.c | 991 +++++++++++++++++++++++++++++
>   sound/soc/codecs/rt712-sdca-dmic.h | 106 +++
>   4 files changed, 1106 insertions(+)
>   create mode 100644 sound/soc/codecs/rt712-sdca-dmic.c
>   create mode 100644 sound/soc/codecs/rt712-sdca-dmic.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 03630d13d35f..8d41fc509637 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -203,6 +203,7 @@ config SND_SOC_ALL_CODECS
>   	imply SND_SOC_RT711_SDW
>   	imply SND_SOC_RT711_SDCA_SDW
>   	imply SND_SOC_RT712_SDCA_SDW
> +	imply SND_SOC_RT712_SDCA_DMIC_SDW
>   	imply SND_SOC_RT715_SDW
>   	imply SND_SOC_RT715_SDCA_SDW
>   	imply SND_SOC_RT1308_SDW
> @@ -1521,6 +1522,12 @@ config SND_SOC_RT712_SDCA_SDW
>   	select REGMAP_SOUNDWIRE
>   	select REGMAP_SOUNDWIRE_MBQ
>   
> +config SND_SOC_RT712_SDCA_DMIC_SDW
> +	tristate "Realtek RT712 SDCA DMIC Codec - SDW"
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	select REGMAP_SOUNDWIRE_MBQ
> +
>   config SND_SOC_RT715
>   	tristate
>   
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 25ebce58a0ba..dac48236db02 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -233,6 +233,7 @@ snd-soc-rt700-objs := rt700.o rt700-sdw.o
>   snd-soc-rt711-objs := rt711.o rt711-sdw.o
>   snd-soc-rt711-sdca-objs := rt711-sdca.o rt711-sdca-sdw.o
>   snd-soc-rt712-sdca-objs := rt712-sdca.o rt712-sdca-sdw.o
> +snd-soc-rt712-sdca-dmic-objs := rt712-sdca-dmic.o
>   snd-soc-rt715-objs := rt715.o rt715-sdw.o
>   snd-soc-rt715-sdca-objs := rt715-sdca.o rt715-sdca-sdw.o
>   snd-soc-rt9120-objs := rt9120.o
> @@ -601,6 +602,7 @@ obj-$(CONFIG_SND_SOC_RT700)     += snd-soc-rt700.o
>   obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
>   obj-$(CONFIG_SND_SOC_RT711_SDCA_SDW)     += snd-soc-rt711-sdca.o
>   obj-$(CONFIG_SND_SOC_RT712_SDCA_SDW)     += snd-soc-rt712-sdca.o
> +obj-$(CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW)     += snd-soc-rt712-sdca-dmic.o
>   obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
>   obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
>   obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
> diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
> new file mode 100644
> index 000000000000..e5d765d84369
> --- /dev/null
> +++ b/sound/soc/codecs/rt712-sdca-dmic.c
> @@ -0,0 +1,991 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// rt712-sdca-dmic.c -- rt712 SDCA DMIC ALSA SoC audio driver
> +//
> +// Copyright(c) 2023 Realtek Semiconductor Corp.
> +//
> +//
> +
> +#include <linux/bitops.h>
> +#include <sound/core.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <sound/initval.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/pm_runtime.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/slab.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/tlv.h>

Ordering of those includes seems bit weird to me, can't you include 
sound/ ones after linux/ ones?

And a bit of nitpicking linux/moduleparam.h seems redundant if you 
include linux/module.h

And I'm not sure why do you need linux/delay.h, I don't see any *sleep 
or *delay functions in the patch?

> +#include "rt712-sdca.h"
> +#include "rt712-sdca-dmic.h"
> +

...
