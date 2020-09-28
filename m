Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1D27A69E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 06:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A15C1AF4;
	Mon, 28 Sep 2020 06:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A15C1AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601268128;
	bh=5cAnfZpulTGW80o13infgg6CNHHEX6bfKprcBLns928=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5860Oqt5jU7I8NMFU6+KUcLThrHQxMDkR/OOVvVoybIEn18iooOLY6IQUOcBIbb0
	 ZFg4uzAdXkTQj1b4ZPnbfha4yxLsiBk9HpibAhIzv66+6w2XV+fQfzgzYydo0DkaZf
	 od2NbaketcNSgBEaVjPAXnmzqnWJD791qb131i3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA507F80228;
	Mon, 28 Sep 2020 06:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31F21F801F9; Mon, 28 Sep 2020 06:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A615F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 06:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A615F800FD
Received: by mail-lj1-f194.google.com with SMTP id a15so7197418ljk.2
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MDGs++4RRj95+aWDmWU1XgAa7yuF3b9Kk32dL6Y6dKY=;
 b=fxtm9xxmGB1Dw3y6s4Pz+PNn+jPHjg7/lSHNMOCXZNCCb1+oNiei+zxKjVz4c5jqwr
 nJO2qpqYjgVfCZibSmErvg7uqxp4L1NflPIsMp2wwpZSkNzkGTKIZTYthxuDseMQad22
 /utScCgHvVfDkT4fPUGst0/CGOD+mhrJOKl3wvS/FQuNvjESit3idZQeZY2v7DhhOYov
 UmSgRyek5nzLyH5xLptNudflL3ziB9oYvBNlFk/20B9sr5y6Y//A7k90XG6YJ9LUAOPv
 hWhwiHn0mq36Lmk1617EaourukugXiy+eUS6gWc2ed8rprxl8Y89zQwVaQQhKbu6tMMK
 Ocug==
X-Gm-Message-State: AOAM5331YOOtm7GqwHd/DXLYMS+QnlPP1ZcLZ4MofVUhs+iMZgqP9Fgw
 wbgeT9p8NwEeyKJqEaGxgB637lcwsPczFg==
X-Google-Smtp-Source: ABdhPJw46l+WVFjEs/6KR92bNkTg3WplYbSPqt6gLH8ZWmsMDm/zjguOs4D49euGfIeUynUq8FcrbQ==
X-Received: by 2002:a2e:9cc2:: with SMTP id g2mr4517081ljj.77.1601268016630;
 Sun, 27 Sep 2020 21:40:16 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id j23sm5691890ljh.96.2020.09.27.21.40.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 21:40:16 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id b22so9481526lfs.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:40:16 -0700 (PDT)
X-Received: by 2002:a19:dd5:: with SMTP id 204mr3065459lfn.551.1601268015876; 
 Sun, 27 Sep 2020 21:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-2-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-2-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 12:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65AhnqD6ec20h9vtd2GjqVsf_yz5+7VSa8giJuFJnd5ag@mail.gmail.com>
Message-ID: <CAGb2v65AhnqD6ec20h9vtd2GjqVsf_yz5+7VSa8giJuFJnd5ag@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 01/20] ASoC: sun4i-i2s: Add support for
 H6 I2S
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
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
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> H6 I2S is very similar to that in H3, except it supports up to 16
> channels.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 224 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 224 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index f23ff29e7c1d..2baf6c276280 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -124,6 +124,21 @@
>  #define SUN8I_I2S_RX_CHAN_SEL_REG      0x54
>  #define SUN8I_I2S_RX_CHAN_MAP_REG      0x58
>
> +/* Defines required for sun50i-h6 support */
> +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK  GENMASK(21, 20)
> +#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)       ((offset) << 20)
> +#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK         GENMASK(19, 16)
> +#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)                ((chan - 1) << 16=
)
> +#define SUN50I_H6_I2S_TX_CHAN_EN_MASK          GENMASK(15, 0)
> +#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)     (((1 << num_chan) - 1))
> +
> +#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG 0x44
> +#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG 0x48
> +
> +#define SUN50I_H6_I2S_RX_CHAN_SEL_REG  0x64
> +#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG 0x68
> +#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG 0x6C
> +
>  struct sun4i_i2s;
>
>  /**
> @@ -474,6 +489,62 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i=
_i2s *i2s,
>         return 0;
>  }
>
> +static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> +                                     const struct snd_pcm_hw_params *par=
ams)
> +{
> +       unsigned int channels =3D params_channels(params);
> +       unsigned int slots =3D channels;
> +       unsigned int lrck_period;
> +
> +       if (i2s->slots)
> +               slots =3D i2s->slots;
> +
> +       /* Map the channels for playback and capture */
> +       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543=
210);
> +       regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543=
210);

Nit, since it supports up to 16 channels, you might want to map all 16 of t=
hem
now, instead of having to come back and fix it later.

Code wise, this patch is

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

I don't have a scope nor logic analyzer, so I wasn't able to participate in=
 the
LRCK discussion.
