Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E51CEA08
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 03:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C121C1615;
	Tue, 12 May 2020 03:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C121C1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589246054;
	bh=Z/TcNKEa/6NcIaZq/U4IeraE28alwIBzAINMxlTm1hE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRf7mH4aPpy26LakSwSu6bkQVZUY6lY2RHFfQxN6/ArQl5xUJtkYN7g5qy2ytDUHB
	 clqqXe3qZTYmGDooV9aBJsdkhJO7nZroLSRz/OpySfPbzKUU3bKkF7+4GKT+t8GdkE
	 W5lGjNCMqXL48bLAL2aVek6B6SNaffLSmD0gDlBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C91F3F802C4;
	Tue, 12 May 2020 00:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF342F802DB; Tue, 12 May 2020 00:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CAEFF802C4
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 00:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CAEFF802C4
IronPort-SDR: ZbRo9fLKFIvZRre4GWOsP1YaT3LW9gU+aYkSbMWBirXFUZH10y/TPhXIHB8EAC6n6klpDsyAhg
 UD5eHrysAS2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 15:42:48 -0700
IronPort-SDR: Semr7xDKJaeLTFp2AMVnyxcmV69e7biQ7dXaxkuU7uSBw/32lRc8+/lTlJPkIKfrpmx6lQ2Jxz
 AxiJTpquCm6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="252718118"
Received: from ajgalle-mobl.amr.corp.intel.com ([10.254.179.28])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2020 15:42:48 -0700
Message-ID: <8c0e4cc5f7e63e1cd379c3a39f6721ee0cf4c06a.camel@linux.intel.com>
Subject: Re: [PATCH 01/17] ASoC: soc-dai: add snd_soc_dai_activity()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 11 May 2020 15:42:47 -0700
In-Reply-To: <874ksn9fqf.wl-kuninori.morimoto.gx@renesas.com>
References: <875zd39frp.wl-kuninori.morimoto.gx@renesas.com>
 <874ksn9fqf.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 2020-05-11 at 14:56 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current snd_soc_runtime_action() is counting
> dai->stream_active for Playback/Capture,
> dai->active        for DAI
> 
> 	static void snd_soc_runtime_action(...)
> 	{
> 		...
> 		for_each_rtd_dais(rtd, i, dai) {
> 			dai->stream_active[stream] += action;
> 			dai->active += action;
> 			...
> 		}
> 	}
> 
> But, these are very verbose, because we can calculate
> DAI activity from stream_activity.
> 
> This patch adds snd_soc_dai_activity() which calculate
> DAI activity from DAI stream_activity.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-dai.h |  2 +-
>  sound/soc/soc-dai.c     | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index 2a0a5af1c1ae..887575d59e31 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -137,7 +137,7 @@ int snd_soc_dai_set_tristate(struct snd_soc_dai
> *dai, int tristate);
>  /* Digital Audio Interface mute */
>  int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
>  			     int direction);
> -
> +int snd_soc_dai_activity(struct snd_soc_dai *dai);
>  
>  int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
>  		unsigned int *tx_num, unsigned int *tx_slot,
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 8e5fe012aa1d..aa0826136f57 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -305,6 +305,18 @@ int snd_soc_dai_digital_mute(struct snd_soc_dai
> *dai, int mute,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_dai_digital_mute);
>  
> +int snd_soc_dai_activity(struct snd_soc_dai *dai)
> +{
> +	int stream, active;
> +
> +	active = 0;
> +	for_each_pcm_streams(stream)
> +		active += dai->stream_active[stream];
Morimoto-san,

snd_soc_dai has both stream_active and active. In this function, you're
checking stream_active. Do you think, snd_soc_dai_stream_usage_count()
makes for a better name?

Thanks,
Ranjani
> +
> +	return active;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_dai_activity);
> +
>  int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
>  			  struct snd_pcm_substream *substream,
>  			  struct snd_pcm_hw_params *params)

