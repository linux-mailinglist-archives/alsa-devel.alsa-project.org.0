Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8427A6B4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7BF91AFD;
	Mon, 28 Sep 2020 07:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7BF91AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601269373;
	bh=NnVgfQCA3yMXo2zXvRvVKEt9HOgJHxqT5wOrBaLy7Z0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBVpQHUKm6l1O1quC5hreoOzJnLRgGv+MLK17+CR7BHawnPQaAztcLPjkwk1hurOn
	 I/0UR0K/bOTELG3zjMA4eR0aoUI7OVpJ+/ifSpTLGbaEs+coZ80RXEE3Vh/RJNW92Z
	 utevenZ+eRse/DX5gXWMOVga0F+3gv/hDShPZxgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2202F80228;
	Mon, 28 Sep 2020 07:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A510AF801F9; Mon, 28 Sep 2020 07:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CA7FF800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA7FF800FD
Received: by mail-lf1-f67.google.com with SMTP id y11so9556292lfl.5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uJ0Z1+alQsvst1vnVb83YEvZMpgNSPYBJqhAVUeQTf0=;
 b=jXvGQJK6v6qRlhezTFjowdUklzR5s0jlYkfwLfhypPrNy5M3JOqJ6RKfpFZWco0ZFw
 C+tO+aKL2GX6wBdAG8xCbxhIi9udep0viQpSplEttpBjH2irDN5/26qawDBH5iLQ53xR
 Z4yicWSfKJcKXNxo5Nd86drM62F9OOTBZTwizoLxZQ9nI/qZdBVYlpyzwEOckEYavuIz
 0MMQpDD9MkjFJkrl54klTIVRI+egl+8a8R0elySUB1/K187bcYyt4xACGq7+Db0L2Rxv
 QJdj+06VgbiTkEUgjC8LYKaM6vS2+W8GGTnw68xuot6hDmpZ1vcKsZQe8485zjUNaJBW
 YLqA==
X-Gm-Message-State: AOAM532fHb5dxFZCS2mV2dqqPDBh9czSY15B3bIrasIPbTELODiDaN/c
 iQ6BOc5ZdI6SN7fQTluHoE/xbnLWW1MCqA==
X-Google-Smtp-Source: ABdhPJxRYP+WAzI2IiS8x/yBKFq4lPqXWr6rw3Bs4DiPfYwmwj851qiJZu6hrf1pLgPIjJpKJTirmA==
X-Received: by 2002:ac2:5190:: with SMTP id u16mr2989670lfi.290.1601269257743; 
 Sun, 27 Sep 2020 22:00:57 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id b25sm2721962lfc.298.2020.09.27.22.00.57
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 22:00:57 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id m5so9552251lfp.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:00:57 -0700 (PDT)
X-Received: by 2002:a19:dd5:: with SMTP id 204mr3081226lfn.551.1601269257025; 
 Sun, 27 Sep 2020 22:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-3-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-3-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 13:00:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v669XXerfrgK9WzAoMHwArn765yS9Db4_xwwQSXpnm2zqQ@mail.gmail.com>
Message-ID: <CAGb2v669XXerfrgK9WzAoMHwArn765yS9Db4_xwwQSXpnm2zqQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 02/20] ASoC: sun4i-i2s: Change
 set_chan_cfg() params
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> As slots and slot_width can be overwritter in case set_tdm() is
> called. Avoid to have this logic in set_chan_cfg().

It doesn't seem that set_tdm_slot() would get called concurrently
with hw_params(), at least not for the simple-card family. If so
then we'd have more problems like mismatched slots/slot-width
due to no serialization when interacting with those values.

> Instead pass the required values as params to set_chan_cfg().
>
> This will also avoid a bug when we will enable 20/24bits support,
> i2s->slot_width is not actually used in the lrck_period computation.
>
> Suggested-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 2baf6c276280..0633b9fba3d7 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
>         unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
>         s8      (*get_sr)(const struct sun4i_i2s *, int);
>         s8      (*get_wss)(const struct sun4i_i2s *, int);
> -       int     (*set_chan_cfg)(const struct sun4i_i2s *,
> -                               const struct snd_pcm_hw_params *);
> +       int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
> +                               unsigned int channels,  unsigned int slot=
s,
> +                               unsigned int slot_width);
>         int     (*set_fmt)(const struct sun4i_i2s *, unsigned int);
>  };
>
> @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2=
s *i2s, int width)
>  }
>
>  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> -                                 const struct snd_pcm_hw_params *params)
> +                                 unsigned int channels, unsigned int slo=
ts,
> +                                 unsigned int slot_width)
>  {
> -       unsigned int channels =3D params_channels(params);
> -
>         /* Map the channels for playback and capture */
>         regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>         regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
> @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4=
i_i2s *i2s,
>  }
>
>  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> -                                 const struct snd_pcm_hw_params *params)
> +                                 unsigned int channels, unsigned int slo=
ts,
> +                                 unsigned int slot_width)
>  {
> -       unsigned int channels =3D params_channels(params);
> -       unsigned int slots =3D channels;
>         unsigned int lrck_period;
>
> -       if (i2s->slots)
> -               slots =3D i2s->slots;
> -

Based on the bug you highlighted in your expanded commit log, the simpler f=
ix
would be to look at i2s->slot_width in addition to i2s->slots, and replace
params_physical_width(params) accordingly.

Also, I would put fixes (even preparatory ones) before patches that introdu=
ce
support for new features and hardware. That makes them easier to backport i=
f
needed.


ChenYu


>         /* Map the channels for playback and capture */
>         regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>         regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
> @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4=
i_i2s *i2s,
>         case SND_SOC_DAIFMT_DSP_B:
>         case SND_SOC_DAIFMT_LEFT_J:
>         case SND_SOC_DAIFMT_RIGHT_J:
> -               lrck_period =3D params_physical_width(params) * slots;
> +               lrck_period =3D slot_width * slots;
>                 break;
>
>         case SND_SOC_DAIFMT_I2S:
> -               lrck_period =3D params_physical_width(params);
> +               lrck_period =3D slot_width;
>                 break;
>
>         default:
