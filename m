Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2A74ED6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F4D91B10;
	Thu, 25 Jul 2019 15:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F4D91B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060178;
	bh=G+tYvpl3R/jPhEv0OJ2Kfc65RtM6HNqpLkLbVlcAh/U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdQMZHiMvmYAAo57nWM12DtQQqDThUUzRcZnbMJOyh54LJbGET/a3gywvKju57EDX
	 iAXWDBwi5Yh1Dhnu6GjOn4NRfyXyoRcaLHs7CQRZi8wnAtj0ClLWixJkEWbSHtaO+g
	 aEzwVjyhLUkAXXzOEFo63dcsoKbbi2NTG+NxkCrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F74F8045F;
	Thu, 25 Jul 2019 15:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76C5F8044B; Thu, 25 Jul 2019 15:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4B0EF80448
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B0EF80448
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 06:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; d="scan'208";a="345430331"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 25 Jul 2019 06:07:07 -0700
Received: from xiliu-mobl1.amr.corp.intel.com (unknown [10.252.200.163])
 by linux.intel.com (Postfix) with ESMTP id EBD98580107;
 Thu, 25 Jul 2019 06:07:06 -0700 (PDT)
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20190725053523.16542-1-christophe.jaillet@wanadoo.fr>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bf0899e7-42ff-b2e9-6f51-decc0b0de3ff@linux.intel.com>
Date: Thu, 25 Jul 2019 08:07:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725053523.16542-1-christophe.jaillet@wanadoo.fr>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Fix some acpi vs apci typo in
	somme comments
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

On 7/25/19 12:35 AM, Christophe JAILLET wrote:
> Fix some typo to have the filaname given in a comment match the real name
> of the file.
> Some 'acpi' have erroneously been written 'apci'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

yes, thanks for the corrections.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/common/soc-acpi-intel-bxt-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-byt-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-cht-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-cnl-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-glk-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-hda-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-icl-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-kbl-match.c     | 2 +-
>   sound/soc/intel/common/soc-acpi-intel-skl-match.c     | 2 +-
>   10 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
> index 229e39586868..4a5adae1d785 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * soc-apci-intel-bxt-match.c - tables and support for BXT ACPI enumeration.
> + * soc-acpi-intel-bxt-match.c - tables and support for BXT ACPI enumeration.
>    *
>    * Copyright (c) 2018, Intel Corporation.
>    *
> diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> index b94b482ac34f..1cc801ba92eb 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * soc-apci-intel-byt-match.c - tables and support for BYT ACPI enumeration.
> + * soc-acpi-intel-byt-match.c - tables and support for BYT ACPI enumeration.
>    *
>    * Copyright (c) 2017, Intel Corporation.
>    */
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index b7f11f6be1cf..d0fb43c2b9f6 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * soc-apci-intel-cht-match.c - tables and support for CHT ACPI enumeration.
> + * soc-acpi-intel-cht-match.c - tables and support for CHT ACPI enumeration.
>    *
>    * Copyright (c) 2017, Intel Corporation.
>    */
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
> index c36c0aa4f683..771b0ef21051 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * soc-apci-intel-cnl-match.c - tables and support for CNL ACPI enumeration.
> + * soc-acpi-intel-cnl-match.c - tables and support for CNL ACPI enumeration.
>    *
>    * Copyright (c) 2018, Intel Corporation.
>    *
> diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
> index 616eb09e78a0..60dea358fa04 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * soc-apci-intel-glk-match.c - tables and support for GLK ACPI enumeration.
> + * soc-acpi-intel-glk-match.c - tables and support for GLK ACPI enumeration.
>    *
>    * Copyright (c) 2018, Intel Corporation.
>    *
> diff --git a/sound/soc/intel/common/soc-acpi-intel-hda-match.c b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
> index 68ae43f7b4b2..cc972d2ac691 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-hda-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
> @@ -2,7 +2,7 @@
>   // Copyright (c) 2018, Intel Corporation.
>   
>   /*
> - * soc-apci-intel-hda-match.c - tables and support for HDA+ACPI enumeration.
> + * soc-acpi-intel-hda-match.c - tables and support for HDA+ACPI enumeration.
>    *
>    */
>   
> diff --git a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
> index d27853e7a369..34eb0baaa951 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * soc-apci-intel-hsw-bdw-match.c - tables and support for ACPI enumeration.
> + * soc-acpi-intel-hsw-bdw-match.c - tables and support for ACPI enumeration.
>    *
>    * Copyright (c) 2017, Intel Corporation.
>    */
> diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> index 0b430b9b3673..38977669b576 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * soc-apci-intel-icl-match.c - tables and support for ICL ACPI enumeration.
> + * soc-acpi-intel-icl-match.c - tables and support for ICL ACPI enumeration.
>    *
>    * Copyright (c) 2018, Intel Corporation.
>    *
> diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> index 4b331058e807..e200baa11011 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * soc-apci-intel-kbl-match.c - tables and support for KBL ACPI enumeration.
> + * soc-acpi-intel-kbl-match.c - tables and support for KBL ACPI enumeration.
>    *
>    * Copyright (c) 2018, Intel Corporation.
>    *
> diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
> index 0c9c0edd35b3..42fa40a8d932 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * soc-apci-intel-skl-match.c - tables and support for SKL ACPI enumeration.
> + * soc-acpi-intel-skl-match.c - tables and support for SKL ACPI enumeration.
>    *
>    * Copyright (c) 2018, Intel Corporation.
>    *
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
