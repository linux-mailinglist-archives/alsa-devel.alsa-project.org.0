Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5721AF525
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 23:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49184166F;
	Sat, 18 Apr 2020 23:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49184166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587245538;
	bh=i8hul0rFZw8p4JRDe/0XUV8P+/lPUgtbQoMVaylvCpo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/KQmNDNI3Tinfkd1Fu54Tc3VBieVRk/5LsqG8tmNzdSWc2mzdDO3IY7X9YroeqJF
	 yJ2lxOHwNnhI+ZYW9c2pG6tCyuIGm+4DZVLmDJp17HQbouebVUe8OksuZhK5oZAhLV
	 gQjjTV+VSko70QaGyloyNu99kE4c42UtVi4l83m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F3F2F8016F;
	Sat, 18 Apr 2020 23:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB45F8014E; Sat, 18 Apr 2020 23:30:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827F4F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 23:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827F4F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PBweGkuN"
Received: by mail-il1-x141.google.com with SMTP id x2so4498245ilp.13
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nKuUM6IHW8RYHdTcFjqmk2a4BW3C6dzC42TENSM2aLE=;
 b=PBweGkuNrIIhqTHUkOqGVSkGqJB1PNvsadvz8LjfFnZ6P4CKIZCf1OAKrTNC4fy/ci
 4Rp54B1F6f+fHirPVBzu+pGSLCRXannDPndxPXIipkYN04OXsDitRYo8dMu6UkvQ7wka
 mHlk2SqG72sY3ogGch4dFZJ5dabTsi5z1+3kdAhCfWGUt7A+bnu61TA2CtygquAFmihW
 ia+COjjURroAkwcgnA79DX9SyvVhL0/SIcGzfzTafYQuR5zcQ3p1u0mLakhEy0SG5eMN
 ukpZ34SJsxEsGD8VCPxfd/24Qf4ZqKsbkfRiDsxCLI5BV5p0WpoconaIixFeUU6D9fyd
 Snhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nKuUM6IHW8RYHdTcFjqmk2a4BW3C6dzC42TENSM2aLE=;
 b=ebVTPU82ULwEiqZOwKmDw9p8EhIbjNa0Qawm/EVqfFT8LT1Smxyps4lnVEtSX5fPzs
 hu7+lu+BIZsejbUBR1vgDAElgDQjA/F+XLX4HktltQ3/m6cuTv9ZT7TvnjZsC9ORiM6l
 DRyd8czwtmwlfLCllahJwV7kldjZ2U2HAzgH6/osY3209tCJku2mc7FYvWRmPhBlSSpu
 Cc5LDBXd5ozYPsGHjJHnS8xrnwFA9oCHI1prqoyKLbhQ3Y2T5VFVj/1Xrq/E8Fy4m8bi
 bRvb3lDUyvBmhey2VGcY4suoIwxLcZj0Cu1esWHWcnHWfApS4NMbVHjZAn+EUBBQ6NVY
 4kCQ==
X-Gm-Message-State: AGi0PuZwiLHqb7yZkCZd8SRxyUBBdvRPGGk688xVFS1hPysGytW3XPmK
 hGmp15VdT1YgQNS0z7dbhhE2rJ6eF3GFo8oIbII=
X-Google-Smtp-Source: APiQypJzTdzColiYA6jI5kUE3R3feOOH5KcSAgB1jGYlnjTxo7vews7lVZM8Ee7P9ayUu0/SV24dV3u7niNPl+4w1Io=
X-Received: by 2002:a92:540f:: with SMTP id i15mr8784006ilb.59.1587245427254; 
 Sat, 18 Apr 2020 14:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200418143923.19608-1-peron.clem@gmail.com>
 <20200418143923.19608-5-peron.clem@gmail.com>
In-Reply-To: <20200418143923.19608-5-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 18 Apr 2020 23:30:16 +0200
Message-ID: <CAJiuCcdH0=wdKfmAquNfv=0AT_S8qx0Nasbb4m6itWXjUyw8_g@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: sun4i-i2s: Set sign extend sample
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marcus Cooper <codekipper@gmail.com>
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

Hi,

On Sat, 18 Apr 2020 at 16:39, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> From: Marcus Cooper <codekipper@gmail.com>
>
> On the newer SoCs such as the H3 and A64 this is set by default
> to transfer a 0 after each sample in each slot. However the A10
> and A20 SoCs that this driver was developed on had a default
> setting where it padded the audio gain with zeros.
>
> This isn't a problem whilst we have only support for 16bit audio
> but with larger sample resolution rates in the pipeline then SEXT
> bits should be cleared so that they also pad at the LSB. Without
> this the audio gets distorted.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a23c9f2a3f8c..e5f00be8cdcf 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -663,6 +663,12 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_=
i2s *i2s,
>         }
>         regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
>                            SUN4I_I2S_CTRL_MODE_MASK, val);
> +
> +       /* Set sign extension to pad out LSB with 0 */
> +       regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> +                          SUN4I_I2S_FMT1_REG_SEXT_MASK,
> +                          SUN4I_I2S_FMT1_REG_SEXT(0));

My apologies, I made a mistake during the rebase between old Marcus
Cooper patches and new one.
And sadly I lost the defines required here without noticing it.

Will send a v2.

Sorry for that,
Clement

> +
>         return 0;
>  }
>
> @@ -765,6 +771,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_=
i2s *i2s,
>                            SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_=
OUT,
>                            val);
>
> +       /* Set sign extension to pad out LSB with 0 */
> +       regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> +                          SUN8I_I2S_FMT1_REG_SEXT_MASK,
> +                          SUN8I_I2S_FMT1_REG_SEXT(0));
> +
>         return 0;
>  }
>
> @@ -867,6 +878,11 @@ static int sun50i_i2s_set_soc_fmt(const struct sun4i=
_i2s *i2s,
>                            SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_=
OUT,
>                            val);
>
> +       /* Set sign extension to pad out LSB with 0 */
> +       regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> +                          SUN8I_I2S_FMT1_REG_SEXT_MASK,
> +                          SUN8I_I2S_FMT1_REG_SEXT(0));
> +
>         return 0;
>  }
>
> --
> 2.20.1
>
