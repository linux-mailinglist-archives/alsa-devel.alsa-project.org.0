Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330271D8D3C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 03:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A348417AF;
	Tue, 19 May 2020 03:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A348417AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589852655;
	bh=Mthvrb3Q8MKMPCNba2NFNQ8/8G07kkARjENWvz6SJrI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MJsflfTKBSDbpgItudLcMzsM5+sO8uFvbZJ8DCw9lBej+fZFwj+pk8SMslOsFlm7I
	 /Cvvo2+bTlwR1fWNhPJDew9ADCew64gLeuJgK60Q3mt93t11vPwBt2zv5J4KcA/PMk
	 Lv8HOnDNNZJBKPz3k16Z4L3YOjaVnvkOc+5EMk+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D54E7F801F8;
	Tue, 19 May 2020 03:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57CD1F801A3; Tue, 19 May 2020 03:42:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E3E4F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 03:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3E4F80110
IronPort-SDR: NhRl7sLFMEoualLaUMSecPwpALZ68xHdRoMfTineLiRxtNccwxzjarR95ONb7ZqY26zq+DWlFA
 KkOaP+pOylyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 18:42:21 -0700
IronPort-SDR: bw5j2w6GbR0IrJjbawCi9e6RVfiNQSWN5RZPdGlcWKvqCdOiQkkGVv7+S+Z6LdJBO/0hEULosM
 v2OBSOb2nHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,408,1583222400"; d="scan'208";a="299957758"
Received: from kciepluc-mobl.ger.corp.intel.com ([10.254.182.89])
 by orsmga008.jf.intel.com with ESMTP; 18 May 2020 18:42:21 -0700
Message-ID: <afb8d24d294a1c03541e279b95d2c7d740fe3c91.camel@linux.intel.com>
Subject: Re: [PATCH 1/7] ASoC: add soc-link.c
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 18 May 2020 18:42:04 -0700
In-Reply-To: <875zcs68m4.wl-kuninori.morimoto.gx@renesas.com>
References: <877dx868op.wl-kuninori.morimoto.gx@renesas.com>
 <875zcs68m4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Tue, 2020-05-19 at 10:01 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ALSA SoC has many dai_link->xxx() functions.
> But, it is implemented randomly at random place.
> 
> This patch creates new soc-link.c to collect dai_link related
> operation into it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-link.h | 13 +++++++++++++
>  include/sound/soc.h      |  1 +
>  sound/soc/Makefile       |  2 +-
>  sound/soc/soc-core.c     | 11 +++--------
>  sound/soc/soc-link.c     | 36 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 54 insertions(+), 9 deletions(-)
>  create mode 100644 include/sound/soc-link.h
>  create mode 100644 sound/soc/soc-link.c
> 
> diff --git a/include/sound/soc-link.h b/include/sound/soc-link.h
> new file mode 100644
> index 000000000000..7fc5cead5942
> --- /dev/null
> +++ b/include/sound/soc-link.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * soc-link.h
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
2020?
> + * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> + */
> +#ifndef __SOC_LINK_H
> +#define __SOC_LINK_H
> +
> +int snd_soc_link_init(struct snd_soc_pcm_runtime *rtd);
> +
> +#endif /* __SOC_LINK_H */
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index a7fa64260108..81d5337963ce 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1449,5 +1449,6 @@ static inline void
> snd_soc_dapm_mutex_unlock(struct snd_soc_dapm_context *dapm)
>  }
>  
>  #include <sound/soc-component.h>
> +#include <sound/soc-link.h>
Why do we need to include this in soc.h? Is it to ensure that soc-
link.h included in all files that include soc.h?

I think the right way to do this would be include soc-link.h where it
is needed, say for example in soc-pcm.c etc.
>  
>  #endif
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index 861a21b79484..70a5f19ea3a1 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o
> soc-dai.o soc-component.o
> -snd-soc-core-objs += soc-pcm.o soc-io.o soc-devres.o soc-ops.o
> +snd-soc-core-objs += soc-pcm.o soc-io.o soc-devres.o soc-ops.o soc-
> link.o
>  snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
>  
>  ifneq ($(CONFIG_SND_SOC_TOPOLOGY),)
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e697258d2ffc..d5450e61626a 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1049,14 +1049,9 @@ static int soc_init_pcm_runtime(struct
> snd_soc_card *card,
>  	rtd->pmdown_time = pmdown_time;
>  
>  	/* do machine specific initialization */
> -	if (dai_link->init) {
> -		ret = dai_link->init(rtd);
> -		if (ret < 0) {
> -			dev_err(card->dev, "ASoC: failed to init %s:
> %d\n",
> -				dai_link->name, ret);
> -			return ret;
> -		}
> -	}
> +	ret = snd_soc_link_init(rtd);
> +	if (ret < 0)
> +		return ret;
>  
>  	if (dai_link->dai_fmt) {
>  		ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link-
> >dai_fmt);
> diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
> new file mode 100644
> index 000000000000..4bdd8d0dd93a
> --- /dev/null
> +++ b/sound/soc/soc-link.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// soc-link.c
> +//
> +// Copyright (C) 2019 Renesas Electronics Corp.
2020?
Thanks,
Ranjani

