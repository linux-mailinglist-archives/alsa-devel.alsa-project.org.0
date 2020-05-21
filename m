Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D69661DD5C3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 20:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2321851;
	Thu, 21 May 2020 20:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2321851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590084733;
	bh=IN+009K1m1n4J1xIxafqQzYjfpoiH25ewOSdl3+3yRg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hzJKoSxOd4DBwqnu+S8dBoZ6EbdosyttUQ6Ppo3ONnRM+ujOY0gqD9Afl3iGdGK7E
	 pYjnIVV5/JFFa4NgjS2B0gJNcnokc2CUu6MSY9pl6awT/MBsO0TySr2E0Yh/t3WE/W
	 lryJF1t4SjT0u9ua8Ao0mtffXG/riixHXmiEzP8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F5FF801F8;
	Thu, 21 May 2020 20:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 750D5F801D8; Thu, 21 May 2020 20:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2817EF80161
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 20:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2817EF80161
IronPort-SDR: a0mAVGYSLr68raTVMFMKIDgY3ZLk8Osg04b62wqNZH7kj77hrBoqxFWM0C9Q284oaoc9I65/OA
 aJV6CR4HiFng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 11:10:19 -0700
IronPort-SDR: htoi4CB0pCVOPuU4kwhQWLSl1Wz/45wrjQKN5OCS+8NDCnis3VS+b5F92frtW0VWH0KPCkmV86
 S65apwhRhCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; d="scan'208";a="289837888"
Received: from dclifton-mobl.amr.corp.intel.com ([10.251.134.247])
 by fmsmga004.fm.intel.com with ESMTP; 21 May 2020 11:10:19 -0700
Message-ID: <51622f63fdde93142e5df1867b8fd0a3676654db.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/7] ASoC: add soc-link.c
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 21 May 2020 11:10:19 -0700
In-Reply-To: <87367u59ve.wl-kuninori.morimoto.gx@renesas.com>
References: <874ksa59wc.wl-kuninori.morimoto.gx@renesas.com>
 <87367u59ve.wl-kuninori.morimoto.gx@renesas.com>
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

On Thu, 2020-05-21 at 10:56 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ALSA SoC has many dai_link->xxx() functions.
> But, it is implemented randomly at random place.
> 
> This patch creats new soc-link.c and collect dai_link related
> operation into it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-link.h | 13 +++++++++++++
>  sound/soc/Makefile       |  2 +-
>  sound/soc/soc-core.c     | 12 ++++--------
>  sound/soc/soc-link.c     | 36 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 54 insertions(+), 9 deletions(-)
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
> + * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> + */
> +#ifndef __SOC_LINK_H
> +#define __SOC_LINK_H
> +
> +int snd_soc_link_init(struct snd_soc_pcm_runtime *rtd);
> +
> +#endif /* __SOC_LINK_H */
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
> index e697258d2ffc..955e175643d7 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -38,6 +38,7 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dpcm.h>
>  #include <sound/soc-topology.h>
> +#include <sound/soc-link.h>
>  #include <sound/initval.h>
>  
>  #define CREATE_TRACE_POINTS
> @@ -1049,14 +1050,9 @@ static int soc_init_pcm_runtime(struct
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
> +// Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +//
> +#include <sound/soc.h>
Morimoto-san,

Dont we also need to include soc-link.h in soc-link.c?

Thanks,
Ranjani

