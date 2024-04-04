Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FFC898388
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 10:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2CB2C7E;
	Thu,  4 Apr 2024 10:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2CB2C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712220865;
	bh=Q9rxavh+3jGPYQmhPcwtJShwvPawHe7CzUPk3kXsc38=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LRAzpbt2gQBlRYWd12dUgjeD2r4yS8eyqDUqJwWDt6jqraDZO16wkOOLfDxIsgZXI
	 FDi9JzjRHPYFVX1J6mnJ8Ao0nI5Lrx6oPl02rtV+LnG1q3Ye3/huVSXtVCNzEol/0s
	 dylT85OSHRXW0Ny+JrfFmGsosNP5F+NZNPsXxVYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EE5BF805A1; Thu,  4 Apr 2024 10:53:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11CE9F8057F;
	Thu,  4 Apr 2024 10:53:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36553F8055C; Thu,  4 Apr 2024 10:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC49AF8016E
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 10:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC49AF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HlAxAo5N
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-513d3746950so844880e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Apr 2024 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712220413;
 x=1712825213; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
        b=HlAxAo5NCt0LxU8Sv8clVhj+LusEf0bNl4ZYxizX7sGSji1OkgMQehF+Qcz0m/QMZI
         5bMRai297APSOlKT3W4AiLwzTMRRwno4GktL3PIbzEC4Eh0gwAYRpmdeFg9eW78MuDhG
         mhSPXdTykHeRXz2RdXnBhPdL0RSqN6Z8suyf7/Ld4MouBTOvxY76yCla7UP4ZyUGD7ul
         KWEisNsCAmvHFw9Fd8HSattpmMG7dP4Ps3N6D/uvGM6cYa3YCX3Tp+kBZ6X71PAt7A52
         kYfE9PNNLYAylzVwuBrMX+Ko5iUtD7cvlGB6w3xV5D3s64Z6VbMP+XdXmLlBzeBQ8vxT
         6FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712220413; x=1712825213;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
        b=CLV8MtULdYa2/RDmhdAgOmROzGQ7fgfyqtLEQtnXdOKdS8iD79Jhz1iZQ729QBSDCd
         Bx5xr8ZpiiWT0+lXj3ANKwjP5QHhzgkOUm6rW6DEWML+dpP6yHElvcfvWDrl7ghLA2Ea
         D8u5mk+/6zZaLMPg8Sxe4DhqCNdlCLnqcROPrsQeeSg7m2ekWhiYOwlWLr8wDr+lbHdd
         jKWaf3k1DO1zP0UHR9ViDEYLczrbekEyVTqvSrJKixaatXl+6eQZPUNNLGDTMvM/4fO1
         67I9uZMwm2PNZLImcSgoJG2CyJJNvN5xTWQjDoyUXhutMaAE6kJIeRaQ0Dtx8FWV8FW0
         MICA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUolJcB+bvSd29dM1NhB1RlG6qo2hojshqcBwQDBGZ4hMYySzMlxk7kY/DHbsEwRYBFDZ+HS91CdoFCbZiltxZyxxJFENL9U+DV2QQ=
X-Gm-Message-State: AOJu0Yyl9olGm+GMMjtTVUCBUkqw9jaQCerEzxnj6FKrAaBdpwNIDOf5
	QShfu7nJApVrG8r1qO535MIFQ+TtPTWs2CTVBcMb7AKhJMpQBh1rmYzrlDzMjCs=
X-Google-Smtp-Source: 
 AGHT+IGfmakMeTh3jAGVQJKJ+VTm2R438vkeBhF7L+wEWqOROEyvzepKwPfwlLVcE3mN6ey9Em+MkA==
X-Received: by 2002:ac2:4c8f:0:b0:513:d01e:b68 with SMTP id
 d15-20020ac24c8f000000b00513d01e0b68mr1237043lfl.3.1712220413384;
        Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0041550e03bc6sm1869265wmo.44.2024.04.04.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
  Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam  Girdwood <lgirdwood@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 05/16] ASoC: meson: Replace dpcm_playback/capture to
 playback/capture_only
Date: Thu, 04 Apr 2024 10:46:13 +0200
In-reply-to: <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jedblplab.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: VTBVNBAMZU6LEG23T2KV4LGBPDL6QL4B
X-Message-ID-Hash: VTBVNBAMZU6LEG23T2KV4LGBPDL6QL4B
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VTBVNBAMZU6LEG23T2KV4LGBPDL6QL4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 01 Apr 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Looks OK

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c         | 8 ++++----
>  sound/soc/meson/meson-card-utils.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 3180aa4d3a15..21bf1453af43 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  	lb->stream_name = lb->name;
>  	lb->cpus->of_node = pad->cpus->of_node;
>  	lb->cpus->dai_name = "TDM Loopback";
> -	lb->dpcm_capture = 1;
> +	lb->capture_only = 1;
>  	lb->no_pcm = 1;
>  	lb->ops = &axg_card_tdm_be_ops;
>  	lb->init = axg_card_tdm_dai_lb_init;
> @@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable playback is the interface has no tx slots */
>  	if (!tx)
> -		link->dpcm_playback = 0;
> +		link->capture_only = 1;
>  
>  	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
>  		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
> @@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable capture is the interface has no rx slots */
>  	if (!rx)
> -		link->dpcm_capture = 0;
> +		link->playback_only = 1;
>  
>  	/* ... but the interface should at least have one of them */
>  	if (!tx && !rx) {
> @@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
>  		return ret;
>  
>  	/* Add loopback if the pad dai has playback */
> -	if (link->dpcm_playback) {
> +	if (!link->capture_only) {
>  		ret = axg_card_add_tdm_loopback(card, index);
>  		if (ret)
>  			return ret;
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index ed6c7e2f609c..1a4ef124e4e2 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  	link->dpcm_merged_rate = 1;
>  
>  	if (is_playback)
> -		link->dpcm_playback = 1;
> +		link->playback_only = 1;
>  	else
> -		link->dpcm_capture = 1;
> +		link->capture_only = 1;
>  
>  	return meson_card_set_link_name(card, link, node, "fe");
>  }


-- 
Jerome
