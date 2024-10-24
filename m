Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4E9ADE71
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 10:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D622B6A;
	Thu, 24 Oct 2024 10:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D622B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729757208;
	bh=oPU8wiykirsXlfsK3FEHZM1SuFheE2lq9GeofLJroZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bh3m4n1kypzKAT9N9gBzsM3mEhdnruKAGXUwW+w4lT+pv0TnxrXm1FKl1W0/JhOCF
	 za1tCmbeFKraJTujczShUvHi20p3FQoLPz9ZRqymnkaToP+9FehAbA6OTUzMXZSati
	 NRk+inDMSQgblnw1ZKHdJGpoGsOmAOZztY0T+DdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 179F3F805A0; Thu, 24 Oct 2024 10:06:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 459EEF805B2;
	Thu, 24 Oct 2024 10:06:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CB31F8016C; Thu, 24 Oct 2024 10:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E847F80104
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 10:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E847F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Yu5ytOnL
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so415838f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Oct 2024 01:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729757177;
 x=1730361977; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
        b=Yu5ytOnLYHf38aFQfg58FLcLmhum2iG6/3hLaphl8Vc5FLvoRyWi19I4w/Kud9q9JB
         ZNTHUnY91/ReGSurPrCav7zAMCg15AFBinvs0/kizuJ+ChdYQU23xbCsZ+M8VIc7VKqe
         631XUj6IFLEK205ZQ9Sw5tDiVougvR5PAq/iT2c34OcKbGOcGnVsbN3nx1UC+b4latBM
         sYdP/pLjfqZJmB0rSyHSSZrH1RqZLGRP8SszyDEXEgWnU4dD2f9f5I5Moz9LMJCuzu7G
         L2tlV3bD8GlDKFp1GA8gEnGXDucQP57LEpHQ6WVSJ8HEwj8EdvcAi48T9pGwHT093Sv0
         MPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757177; x=1730361977;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
        b=PiJpO2fSiRS99sMWH6USWn/gHOg6SyqrVS71n9hxB6fUBsfeKDsbl62VfKeCAdpyhN
         kBPeMU9M3HmKbENBYRrpfaNuV5/X1PFQUxQFVyRaAwO5JJ/a277v0i7B46JyXnzbvkL1
         ddRBofJaybDa4kzkBbyhBlVhMDlhyJAhgxjptrv4M3Jc2zyCGib1+1s9L8yRiTTNoTlK
         tjvoJxGFDBpE/Ke2IebJOcIGdKf1ZXhCh5eR4L20jZBIId2YC7B0iCsFg+rZUkye/NtP
         X+cUSSsKlNStpLP3B4wqOl4cLYkeKtygvUSiup2ijg3c/q64XZ6pTIMkfCMSD5kHQRYI
         h4lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Ox+HKK9Na87kqmCZQ0dV90pE5AHW2vMFgH+gGb1Kd8Flr2nhg/eI80hMa4oRSbH+B63s2t2A5fB9@alsa-project.org
X-Gm-Message-State: AOJu0YyfIVZ9tdjuv7CDdjovfr8j/btuR2iMAB7Dez1WjMdKqdShRH1g
	c/EffXZni/ea0R76cqjdIYiwN6ajTsSmoK3ZeglvjrZagOYbVbidhuF83BZwRKM=
X-Google-Smtp-Source: 
 AGHT+IEoZMVKgD69poA0dFC1qIUTHJdJvAa3Cg9Ax/TeZWkK7ol7nwHmrhD5d8D+xQZ2BLd9/bn72g==
X-Received: by 2002:adf:e903:0:b0:37c:d001:856f with SMTP id
 ffacd0b85a97d-380458ee3fbmr839512f8f.56.1729757177038;
        Thu, 24 Oct 2024 01:06:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a64daasm10701229f8f.64.2024.10.24.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:06:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Shawn Guo <shawnguo@kernel.org>,  Shengjiu Wang
 <shengjiu.wang@gmail.com>,  Takashi Iwai <tiwai@suse.com>,  Vinod Koul
 <vkoul@kernel.org>,  Xiubo Li <Xiubo.Lee@gmail.com>,
  alsa-devel@alsa-project.org,  imx@lists.linux.dev,
  linux-rpi-kernel@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-stm32@st-md-mailman.stormreply.com,  patches@opensource.cirrus.com
Subject: Re: [PATCH 3/8] ASoC: meson: switch to use rtd->id from rtd->num
In-Reply-To: <87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Thu, 24 Oct 2024 01:29:27 +0000")
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
	<87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com>
Date: Thu, 24 Oct 2024 10:06:15 +0200
Message-ID: <1ja5eudix4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: P5L2FVMS6OSMN7GMVRBAXOXFO7UGPQ5X
X-Message-ID-Hash: P5L2FVMS6OSMN7GMVRBAXOXFO7UGPQ5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5L2FVMS6OSMN7GMVRBAXOXFO7UGPQ5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu 24 Oct 2024 at 01:29, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Now rtd->num is renamed to rtd->id. Let's switch.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Just one comment: I understand why you have split this into multiple
patches, I suppose it will help with the review but I wonder if it
wouldn't be better to squash it all into a single change before
applying ? To avoid exposing the intermediate state. It might be
confusing too. The change would not be that big actually.

Just a suggestion ;)

> ---
>  sound/soc/meson/axg-card.c | 6 +++---
>  sound/soc/meson/gx-card.c  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 5ebf287fe7004..a2dfccb7990f3 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -43,7 +43,7 @@ static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }
> @@ -56,7 +56,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	struct snd_soc_dai *codec_dai;
>  	int ret, i;
>  
> @@ -86,7 +86,7 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	int ret;
>  
>  	/* The loopback rx_mask is the pad tx_mask */
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index 455f6bfc9f8fa..b408cc2bbc919 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -32,7 +32,7 @@ static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct gx_dai_link_i2s_data *be =
> -		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
> +		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }

-- 
Jerome
