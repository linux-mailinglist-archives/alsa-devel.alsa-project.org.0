Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C2565921
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 16:58:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D552B1725;
	Mon,  4 Jul 2022 16:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D552B1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656946715;
	bh=ZKLiAWk+H1XBmiTsrrlG7iFkrk1JyypPAdX3bL8bSF0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S11sYOqmHGizUXRAqpi1UDEEtYElySrWEgDvd9lxmq4rYfsaBnAPMIqUhM89tHndQ
	 1vVIhrFPMQ62fsORbhUXUWEGm+H6a+OycMuO0DYQ5PzkvEv/sRjT2mY/tkFUUdqeyA
	 C0goh9v7G5dVMQxPUwZ4o7CivpJKcrJneNGaGpLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A1CF8016E;
	Mon,  4 Jul 2022 16:57:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E757F80165; Mon,  4 Jul 2022 16:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CA20F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 16:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA20F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SYKJqDVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656946649; x=1688482649;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZKLiAWk+H1XBmiTsrrlG7iFkrk1JyypPAdX3bL8bSF0=;
 b=SYKJqDVf8xoOake6jpB+6sMf4Poq9MkfBKfU7ryv9/TACpLoqb65ufph
 GPJG1yWayC2rmelUssoseeXoJTyBazAJ0LF/cfdqoah8O5zt9apNIgrEY
 /k4aNaTYeRScG6UPn/YVUi2mtDXiffSt4a1oMzjxQ/kqya55J/CNIBfx2
 m1bIpTKjdCNec7u8WLpiBvVI6qaSMkByetzABMnvuaow1KSJHjIUkx757
 Qfx/05QARnUGrN7OVotZf35zojDtRT0lxBmr1gG5p8iWHvGkUTC1Hnmn7
 gFQ8eEG24MJ6U775vZUYHxnOnUCrqNQTwRtoUzKrq0ESpKgX9kCQIiYkW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263571053"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="263571053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 07:57:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="619320137"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.83])
 ([10.99.241.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 07:57:21 -0700
Message-ID: <684b0081-5dc7-73c1-67c0-b707941b7043@linux.intel.com>
Date: Mon, 4 Jul 2022 16:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND V2 2/3] ASoC: amd: add Machine driver for Jadeite
 platform
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220704140837.1215534-1-Vijendar.Mukunda@amd.com>
 <20220704140837.1215534-2-Vijendar.Mukunda@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220704140837.1215534-2-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
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

On 7/4/2022 4:08 PM, Vijendar Mukunda wrote:
> Add Machine driver for Jadeite platform which uses ES8336 codec.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> 
> Changes since v1:
>        - as sysclk is fixed, moved code to startup() callback.
>        - Removed unused macros (ST_PLAT_CLK & ST_ES8336_GPIO_QUIRK) from code.
> ---
>   sound/soc/amd/acp-es8336.c | 324 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 324 insertions(+)
>   create mode 100644 sound/soc/amd/acp-es8336.c
> 
> diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
> new file mode 100644
> index 000000000000..eec3d57092fa
> --- /dev/null
> +++ b/sound/soc/amd/acp-es8336.c
> @@ -0,0 +1,324 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Machine driver for AMD Stoney platform using ES8336 Codec
> + *
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + */
> +
> +#include <sound/core.h>
> +#include <sound/soc.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/jack.h>
> +#include <linux/gpio.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +
> +#include "../codecs/es8316.h"

Any reason to include this header? From quick check I see that it only 
defines ES8316_* defines and those don't seem to be used anywhere in 
this driver?

(...)

> +
> +static int st_es8336_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

No need to provide .remove handler when it only returns.

