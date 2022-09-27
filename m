Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C695EBBA0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 09:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7445E82B;
	Tue, 27 Sep 2022 09:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7445E82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664264164;
	bh=aGdiIa2AskwQtLlBRejm6EBBRYZSm6Aal1pnfF0CKs4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r1qSY0Ob3RQjBjyJDXEZmjVox/9sx2Or7plRVlw6AUNpeft8rhqHmjBcxVRRrvgnD
	 hH9mcHkkDSvQrsxlA/auih/YL5LkAhcpDTlLyux90HFMKTloUwC07XaeYVVoUpDrAJ
	 LnSoKZzPrAicvKJCTbzYrkjksj6aRt68epjyr6hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C96CDF800AA;
	Tue, 27 Sep 2022 09:35:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDCFDF800AA; Tue, 27 Sep 2022 09:35:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1712CF800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 09:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1712CF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SKKRSin+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664264100; x=1695800100;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aGdiIa2AskwQtLlBRejm6EBBRYZSm6Aal1pnfF0CKs4=;
 b=SKKRSin+KYAvazdQZtdeaf44hceVLt2OGChARlZPR7mvbpALYGJ6xWCz
 yv/i96wGb7Uyro4DiQB6gRKo9jWy7GgnLMJlee1FZZBVLsSQT5Bncn/CZ
 iYp7kDMm+SyTG56nGwSOmdMrcZDI4+T41aFS0bko6B3AJ2nK31nIoEozk
 yq8EmRZz33I9cDI81aW6rOuNNUzaFgUA2tFlK0DS5sOsN10ULLMQqG8D/
 GyUp3mGmI9khNTQDKrq3+dPGZMLlHjP8EEjHgViVTh9ZxkqgeLAE94P54
 ekoyXQT/2F7IydD25c0yoza4nuU6ublJngCJ2krEL+x9PivU0W81BuijN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327602359"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="327602359"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:34:56 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="572558408"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="572558408"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.206])
 ([10.99.249.206])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:34:52 -0700
Message-ID: <b54daa61-ba1d-81d4-5238-ca7cc2a41b48@linux.intel.com>
Date: Tue, 27 Sep 2022 09:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Content-Language: en-US
To: Eugeniu Rosca <erosca@de.adit-jv.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 Zhang Yanmin <yanmin.zhang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ramesh Babu <ramesh.babu@intel.com>, Dean Jenkins <Dean_Jenkins@mentor.com>,
 Ramesh Babu B <ramesh.babu.b@intel.com>, xiao jin <jin.xiao@intel.com>
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

On 9/26/2022 6:35 PM, Eugeniu Rosca wrote:
> From: xiao jin <jin.xiao@intel.com>
> 
> After start of fe and be, fe might go to close without triggering
> STOP, and substream->runtime is freed. However, be is still at
> START state and its substream->runtime still points to the
> freed runtime.
> 

Well if it is being freed, maybe pointer should be set to NULL instead 
in place that happens?

> Later on, FE is opened/started again, and triggers STOP.
> snd_pcm_do_stop => dpcm_fe_dai_trigger
>                  => dpcm_fe_dai_do_trigger
>                  => dpcm_be_dai_trigger
>                  => dpcm_do_trigger
>                  => soc_pcm_trigger
>                  => skl_platform_pcm_trigger
> skl_platform_pcm_trigger accesses the freed old runtime data and
> kernel panic.
> 
> The patch fixes it by assigning be_substream->runtime in
> dpcm_be_dai_startup when be's state is START.
> 
> Signed-off-by: xiao jin <jin.xiao@intel.com>
> Signed-off-by: Zhang Yanmin <yanmin.zhang@intel.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>   sound/soc/soc-pcm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 4f60c0a83311..6ca1d02065ce 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1608,6 +1608,8 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
>   		if (be->dpcm[stream].users++ != 0)
>   			continue;
>   
> +		be_substream->runtime = be->dpcm[stream].runtime;
> +
>   		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
>   		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
>   			continue;
> @@ -1615,7 +1617,6 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
>   		dev_dbg(be->dev, "ASoC: open %s BE %s\n",
>   			stream ? "capture" : "playback", be->dai_link->name);
>   
> -		be_substream->runtime = be->dpcm[stream].runtime;
>   		err = __soc_pcm_open(be, be_substream);
>   		if (err < 0) {
>   			be->dpcm[stream].users--;

