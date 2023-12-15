Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0933814684
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 12:14:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4012CAE8;
	Fri, 15 Dec 2023 12:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4012CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702638899;
	bh=/UKm33n9GHu7W5yUZDsiTWIrSOMpvk4I+p7977w81Gc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=heLmVYusdBR/zzIZ0SLjRcZHK15BPZDifplmvpoCfa1wlQtbeGvBOaZDsKcJ1yhL1
	 nyiLAkIEINtHbONUp5Vb+ZbSp3hD6Czg9alPU0m0ZOb6znOyqXkYWIjzHRAvLNFgpP
	 B8tEAD6AFC7gcjbgxTBUcqsx6eaXgswLQIeesvH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF904F8059F; Fri, 15 Dec 2023 12:14:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F26C8F80570;
	Fri, 15 Dec 2023 12:14:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7630F8016A; Fri, 15 Dec 2023 12:14:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41787F8001F
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 12:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41787F8001F
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rE68w-0002u5-G6; Fri, 15 Dec 2023 12:14:10 +0100
Message-ID: <b8a905a7-8fae-4482-9a6d-d9ed2f5dafbc@leemhuis.info>
Date: Fri, 15 Dec 2023 12:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] ASoC: amd: acp: add pm ops support for renoir
 platform
Content-Language: en-US, de-DE
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, richgong@amd.com,
 posteuca@mutex.one, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 open list <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
 <20231113123345.2196504-2-Syed.SabaKareem@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20231113123345.2196504-2-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1702638853;3116c105;
X-HE-SMSGID: 1rE68w-0002u5-G6
Message-ID-Hash: YOWD4V24OWLIZ7KWOL2TAEH32CLVLQDW
X-Message-ID-Hash: YOWD4V24OWLIZ7KWOL2TAEH32CLVLQDW
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOWD4V24OWLIZ7KWOL2TAEH32CLVLQDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Does anyone know what happened to below patch? It afaics was meant to
fix a regression that made it into 6.6. For details see:

https://lore.kernel.org/lkml/87a5v8szhc.fsf@mutex.one/
https://lore.kernel.org/lkml/ac9d4f7b-c7af-4d21-b0b8-d0f188b94b0f@amd.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

On 13.11.23 13:33, Syed Saba Kareem wrote:
> Add pm ops for renoir platform.
> 
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> ---
>  sound/soc/amd/acp/acp-renoir.c | 38 +++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
> index a591482a0726..8539fbacdf4c 100644
> --- a/sound/soc/amd/acp/acp-renoir.c
> +++ b/sound/soc/amd/acp/acp-renoir.c
> @@ -20,6 +20,7 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dai.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "amd.h"
>  #include "acp-mach.h"
> @@ -195,7 +196,11 @@ static int renoir_audio_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, adata);
>  	acp_enable_interrupts(adata);
>  	acp_platform_register(dev);
> -
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_mark_last_busy(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
>  	return 0;
>  }
>  
> @@ -208,11 +213,42 @@ static void renoir_audio_remove(struct platform_device *pdev)
>  	acp_platform_unregister(dev);
>  }
>  
> +static int __maybe_unused rn_pcm_resume(struct device *dev)
> +{
> +	struct acp_dev_data *adata = dev_get_drvdata(dev);
> +	struct acp_stream *stream;
> +	struct snd_pcm_substream *substream;
> +	snd_pcm_uframes_t buf_in_frames;
> +	u64 buf_size;
> +
> +	spin_lock(&adata->acp_lock);
> +	list_for_each_entry(stream, &adata->stream_list, list) {
> +		substream = stream->substream;
> +		if (substream && substream->runtime) {
> +			buf_in_frames = (substream->runtime->buffer_size);
> +			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
> +			config_pte_for_stream(adata, stream);
> +			config_acp_dma(adata, stream, buf_size);
> +			if (stream->dai_id)
> +				restore_acp_i2s_params(substream, adata, stream);
> +			else
> +				restore_acp_pdm_params(substream, adata);
> +		}
> +	}
> +	spin_unlock(&adata->acp_lock);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rn_dma_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, rn_pcm_resume)
> +};
> +
>  static struct platform_driver renoir_driver = {
>  	.probe = renoir_audio_probe,
>  	.remove_new = renoir_audio_remove,
>  	.driver = {
>  		.name = "acp_asoc_renoir",
> +		.pm = &rn_dma_pm_ops,
>  	},
>  };
>  
