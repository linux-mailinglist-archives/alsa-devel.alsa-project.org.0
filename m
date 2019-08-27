Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A014D9DC58
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 06:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1677F166F;
	Tue, 27 Aug 2019 06:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1677F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566879314;
	bh=cARya4J3ab+XI7jkrxEfunoSFphweSz4GYqm+J1prEI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZoVs/VVY60DpYm7mTaSHiMgi+9q/exc42Ee+7Xh8qn+riC4ZH1INdKx2aueVPeQP
	 OHpzJn9hoapcJhM6mOekvp2vQjk4dEDOIR2Nt1VbcMMzlkXzHQw70GQeZyKvuabxpO
	 oTcYJKYdBxUSP/asFKAQpevA/DtIOJ+5/ywC566Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8116FF802A1;
	Tue, 27 Aug 2019 06:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96996F80274; Tue, 27 Aug 2019 06:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6508F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 06:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6508F800E7
Received: by mail-ed1-f68.google.com with SMTP id h8so29466280edv.7
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 21:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5cHZyGdjYh3gEAKmcObYNldhgaeKgV4aSEBGnXJjJM=;
 b=XQ7PcIxPpEgCeIEq0UWbAn9j3N3ntHqYyLOxCZS0/b8UDHDawBn6RkTCEUVOdGpBMw
 bl1Otw2NCi0XpaicxaZ7Si4gOGot+Er51/jjj9GTZhDThbuuPh0SyVKjJotDz33JfLBn
 Fbc5fkpkveJIv5vv4kZgkRoLIHxpDNVwKVwBzF4YKNoMSw9i7A0gO/Wa+d5cAFsVQ2uY
 bWXAGIblT+uBDo3gzNrPhbiBucwGcd9jrD3+9gOdcL8Yl9mZ5+r1xNi51Rb73s69+ky0
 AovlC+qkMp2Wr/hqzDAxDX+UvDhWgrh/rxl8/Iu1m+wXc5J4xFPai/U1Q5Oo4yYfxOyq
 QFuA==
X-Gm-Message-State: APjAAAUg7YvlcH+XukziCnaB6KUHTsaGw/i0/pdo3GSWNSFonIE2sQeY
 sn0N1QPed7V2v8omDbMPRDzm8UjlsDo=
X-Google-Smtp-Source: APXvYqyGfga+GjN/UBm2/xjmdV6YmqbTSvD26iumrLjjbowoKua+ZkQrqDFrPQRf3htcjfXQTkPa5A==
X-Received: by 2002:a50:f7c6:: with SMTP id i6mr21892497edn.281.1566879196106; 
 Mon, 26 Aug 2019 21:13:16 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id j37sm1723783ede.23.2019.08.26.21.13.15
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2019 21:13:15 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id e8so1412750wme.1
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 21:13:15 -0700 (PDT)
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr23286711wmi.61.1566879195343; 
 Mon, 26 Aug 2019 21:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-2-codekipper@gmail.com>
In-Reply-To: <20190826180734.15801-2-codekipper@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 12:13:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v651jVp+J2eyWh7vw-yHmFTVy4eaMjHV0FvOF17C5_Hswg@mail.gmail.com>
Message-ID: <CAGb2v651jVp+J2eyWh7vw-yHmFTVy4eaMjHV0FvOF17C5_Hswg@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v6 1/3] ASoC: sun4i-i2s:
 incorrect regmap for A83T
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 27, 2019 at 2:07 AM <codekipper@gmail.com> wrote:
>
> From: Marcus Cooper <codekipper@gmail.com>
>
> The regmap configuration is set up for the legacy block on the
> A83T whereas it uses the new block with a larger register map.

Looking at the code Allwinner previously released [1], that doesn't seem to be
the case. Keep in mind that the register map shown in the user manual is for
the TDM interface, which we don't actually support right now.

The file shows the base address as 0x01c22800, and the last defined register
is SUNXI_RXCHMAP at 0x3c.

The I2S driver [2] also shows that it is the old register map size, but with
TX_FIFO and INT_STA swapped around. This might mean that it would need a
separate regmap_config, as the read/write callbacks need to be changed to
fit the swapped registers.

Finally, the TDM driver [3], which matches the TDM section in the manual, shows
a larger register map.

A83T is SUN8IW6, while SUN8IW7 refers to the H3.

ChenYu

[1] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/hdmiaudio/sunxi-hdmipcm.h
[2] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/i2s0/sunxi-i2s0.h
[3] https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/sound/soc/sunxi/daudio0/sunxi-daudio0.h

> Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 57bf2a33753e..34575a8aa9f6 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1100,7 +1100,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
>  static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
>         .has_reset              = true,
>         .reg_offset_txdata      = SUN8I_I2S_FIFO_TX_REG,
> -       .sun4i_i2s_regmap       = &sun4i_i2s_regmap_config,
> +       .sun4i_i2s_regmap       = &sun8i_i2s_regmap_config,
>         .field_clkdiv_mclk_en   = REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
>         .field_fmt_wss          = REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
>         .field_fmt_sr           = REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
> --
> 2.23.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20190826180734.15801-2-codekipper%40gmail.com.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
