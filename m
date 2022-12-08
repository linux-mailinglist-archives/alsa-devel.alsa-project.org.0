Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCE6471D3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 15:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308501918;
	Thu,  8 Dec 2022 15:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308501918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670510010;
	bh=P8AfDNVwbM3u2ixBXw0ZWg+vjkCNL40fMtxjN5eLzPE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKF/BHd4BLuzEE1vgrz0tijERyoUYT0q3BVSesuJjPpG22nlIJxGHbLt/G9TrRb20
	 oxTdCHkhfhO3GZMitZonBCcK41zBEp5VH/Wd31xRISSvWynufCiw1zjTt2iO11zc0j
	 IjuxUtj3zId6O1Hh553c9HqlhB7OIAsNQUJT/Mkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD869F8027D;
	Thu,  8 Dec 2022 15:32:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C04D0F8024C; Thu,  8 Dec 2022 15:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5100DF80089
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 15:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5100DF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CAD8FGIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670509946; x=1702045946;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P8AfDNVwbM3u2ixBXw0ZWg+vjkCNL40fMtxjN5eLzPE=;
 b=CAD8FGInWbiUxxDZ9CcsX272N/lNPBkKxsIn29B1e+z84eAWlWjE+jQi
 fjPmMhcg53YirXL88KRl9WI65q+JNHbVv63127F0pvm+GvJLFzke526nA
 2DS0Gk7Lg9TyLq5J+Mtwm3E0tvQJs4erlSaB9CiMHTT7TPtWXtaHsS1an
 SZhqd7n+Zc82rcU7gzRVZU838r5mjma5craTrPtsvPGDmKHm+7MUEPIV4
 X9JTK2eAEq4x0DThigxImgcT7vt63ojSajQ6L5djCBaGX062B9rGbtHXO
 k6QzR/O3FcNfcnrYF2u3NECVwDNTYUjF/4Md5jkEmpWwLVFNGZOQVYqIf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="296872565"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="296872565"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 06:32:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="715619055"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="715619055"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.223])
 ([10.99.249.223])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 06:32:18 -0800
Message-ID: <be91b5a8-7671-41d3-df9d-ff0aeaca6e9a@linux.intel.com>
Date: Thu, 8 Dec 2022 15:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V6 4/5] ASoC: codecs: Configure aw883xx chip register as
 well as Kconfig and Makefile
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
 <20221208122313.55118-5-wangweidong.a@awinic.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221208122313.55118-5-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhangjianming@awinic.com, duanyibo@awinic.com, yijiangtao@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 12/8/2022 1:23 PM, wangweidong.a@awinic.com wrote:

(...)

> diff --git a/sound/soc/codecs/aw883xx/aw883xx_init.c b/sound/soc/codecs/aw883xx/aw883xx_init.c
> new file mode 100644
> index 000000000000..2ef62fdebb57
> --- /dev/null
> +++ b/sound/soc/codecs/aw883xx/aw883xx_init.c
> @@ -0,0 +1,615 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * aw883xx.c --  ALSA Soc AW883XX codec support
> + *
> + * Copyright (c) 2022 AWINIC Technology CO., LTD
> + *
> + * Author: Bruce zhao <zhaolei@awinic.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/regmap.h>
> +#include <linux/syscalls.h>
> +#include <linux/uaccess.h>
> +#include <linux/version.h>
> +#include <linux/workqueue.h>

Again headers, picking at random: firmware.h, of_gpio, uaccess.h, 
version.h, from quick check seem unnecessary and likely some others can 
also be removed.

> +#include <sound/control.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "aw883xx.h"
> +#include "aw883xx_bin_parse.h"
> +#include "aw883xx_pid_2049_reg.h"
> +

(...)

