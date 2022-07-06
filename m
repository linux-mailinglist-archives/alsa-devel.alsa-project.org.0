Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD456859A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A84886;
	Wed,  6 Jul 2022 12:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A84886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657103474;
	bh=ONO+cXKG0+FIU3+e4JoQ8UGPbjw6H/ATH5tTCg6b4ac=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ijj1CSg9bCur2/Q3AzwRq1gHSkQJ31LIC+Bv92cPV2MiIxv/7M0m/rVP+XQDzJadj
	 qa0Ysow8SvZCk+5NlgiktOLeLSSQDzNCc0rFToor7gSSzyQiYzROq+2gqRrv6acTon
	 clmZPqy3E4a5L/0R9ZReKfFA156/RliaKOPxH1Ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7ED3F8012A;
	Wed,  6 Jul 2022 12:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BD3FF8023A; Wed,  6 Jul 2022 12:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4668CF800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 12:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4668CF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EHks8XnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657103409; x=1688639409;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ONO+cXKG0+FIU3+e4JoQ8UGPbjw6H/ATH5tTCg6b4ac=;
 b=EHks8XnHzJpEvyL8wTgd75IMLEs9UqreSTlAmb5BYYv6IjnIvUrAJ1KG
 BH/JW+neEfPCtKk0W0OaTrQ2kxAQx+ejR7MDj6wGbCMXlwcehh2uNf3os
 joLpJrdaDKhsXRS2VqJvI7No81Gz3FT2QRNYnzdfQLaSIfYwXz8yYkN5f
 gCwJBXuDDb1b4/4X/LhDtCmBXstbMANiJREi0bbyCMWEMlfKDn+1qb8E5
 gEURQKVBonZtCYZTeou2iOUUGBcr+tICHujkpgSZa3Hu6/CrlzDp+keUr
 QPRVqCRT3Ma4hS40lV6x1ZKcvtX6dJV3qd4S8zdzMEl2MVPjYMwUy1aFA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="309255809"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="309255809"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:30:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="568010663"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.46])
 ([10.99.249.46])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:30:01 -0700
Message-ID: <3d16471d-62f0-a0fc-24f5-df414de87b07@linux.intel.com>
Date: Wed, 6 Jul 2022 12:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] add tas2780
Content-Language: en-US
To: Raphael-Xu <13691752556@139.com>, broonie@kernel.org
References: <20220706095721.18974-1-13691752556@139.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220706095721.18974-1-13691752556@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, raphael-xu@ti.com, shenghao-ding@ti.com,
 navada@ti.com
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

On 7/6/2022 11:57 AM, Raphael-Xu wrote:
> diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
> new file mode 100644
> index 000000000000..e6923c791b49
> --- /dev/null
> +++ b/sound/soc/codecs/tas2780.c
> @@ -0,0 +1,693 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Driver for the Texas Instruments TAS2780 Mono
> +//		Audio amplifier
> +// Copyright (C) 2022 Texas Instruments Inc.
> +

I noticed one more thing, are all those headers really needed?

> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
I see no module parameters in code?

> +#include <linux/err.h>
> +#include <linux/init.h>
This seems to be used mainly for marking functions as __init etc. which 
doesn't seem to be done here?

> +#include <linux/pm.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regmap.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <sound/soc.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/initval.h>
This one also seems to define things that aren't used in code?

> +#include <sound/tlv.h>


