Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B676F8D23A
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:33:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7BB1668;
	Wed, 14 Aug 2019 13:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7BB1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565782425;
	bh=oyE87BvBzWNj0nI7yODY2MjgvFu0lYcY7Xl09aoKQN0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VO9ppqCUw5KB6HohkWtMHTWTwnsqtRpiu5dNo+A6ICYCC3ie2717lc/lkF5Wcf0+v
	 n0ejhI5i6NpX1XyXjEUIeG76dF8iA518n9HemFOb606sNwUEWxHT/iOC1jX3juwvbt
	 1oWz/eX78DhlJ6fFJ5yrdwcU5IHZknjVPe/dpVFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D48D8F805A0;
	Wed, 14 Aug 2019 13:31:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442D5F8048D; Wed, 14 Aug 2019 13:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432CAF803F4
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432CAF803F4
Received: by mail-ed1-f68.google.com with SMTP id h13so6773859edq.10
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnH5gEWlUPqTFMc04DMHRK5rlUo9OFLR8LpIJiKaA88=;
 b=nxsR187BhlECxhr6nxo7peYQTzN9gzTOOd31QZtb/vIGeASjszekhcIhWhXubSPkHF
 2hWuhhZ7UTSKnWUqUnBcIlWPB93XN9+O2+mGPmQyGzsIibOkYrwr/IGgGN9p0G7ugLpH
 YBPwsc0M+yF1ywiwqFMmFgC9eNV9p9AGDPBVXt3cFvMIMxs6pU6Eelv9lRQQHvXVlMWT
 Dph2A8rLJ/hRtcnNYTkjJ+m5bQPv5bApE/XVjlXRoFe/Ox761eKzr64/Zp674txFRp2y
 /E1T7VDAX/8c4CaIMSZz+CMc9BcAs9QNw4Qx0+9X8ovOQaWqiZ8levHQpm083eE+Esdt
 LJRA==
X-Gm-Message-State: APjAAAVzmqJLkXvn9LabjhlZct/d6HL96En2XpPsQvOZHeYYvLFhBwke
 bVEXlUKiJsrgROjWEcPWWUFBHA3nu/g=
X-Google-Smtp-Source: APXvYqx80Reh2fj9pNrw0s1vHiFwpBEUvntgxkAua8/ihdpywxiloD+teGPWYPGh5WdqqYPyyQnnFw==
X-Received: by 2002:a50:a4ad:: with SMTP id w42mr46083224edb.230.1565782300083; 
 Wed, 14 Aug 2019 04:31:40 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id v7sm2560475ede.71.2019.08.14.04.31.39
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 04:31:39 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id v15so4294380wml.0
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:31:39 -0700 (PDT)
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr7844443wmf.47.1565782298812;
 Wed, 14 Aug 2019 04:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-16-codekipper@gmail.com>
In-Reply-To: <20190814060854.26345-16-codekipper@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 14 Aug 2019 19:31:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v65OdwwDg0Ezc0eXShvp1crQfmt6ZKAkWpOH9Dz94HFrEw@mail.gmail.com>
Message-ID: <CAGb2v65OdwwDg0Ezc0eXShvp1crQfmt6ZKAkWpOH9Dz94HFrEw@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 15/15] ASoC: sun4i-i2s: Adjust regmap
	settings
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

On Wed, Aug 14, 2019 at 2:09 PM <codekipper@gmail.com> wrote:
>
> From: Marcus Cooper <codekipper@gmail.com>
>
> Bypass the regmap cache when flushing the i2s FIFOs and modify the tables
> to reflect this.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index d3c8789f70bb..ecfc1ed79379 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -876,9 +876,11 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
>  {
>         /* Flush RX FIFO */
> +       regcache_cache_bypass(i2s->regmap, true);
>         regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
>                            SUN4I_I2S_FIFO_CTRL_FLUSH_RX,
>                            SUN4I_I2S_FIFO_CTRL_FLUSH_RX);
> +       regcache_cache_bypass(i2s->regmap, false);
>
>         /* Clear RX counter */
>         regmap_write(i2s->regmap, SUN4I_I2S_RX_CNT_REG, 0);
> @@ -897,9 +899,11 @@ static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
>  static void sun4i_i2s_start_playback(struct sun4i_i2s *i2s)
>  {
>         /* Flush TX FIFO */
> +       regcache_cache_bypass(i2s->regmap, true);
>         regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
>                            SUN4I_I2S_FIFO_CTRL_FLUSH_TX,
>                            SUN4I_I2S_FIFO_CTRL_FLUSH_TX);
> +       regcache_cache_bypass(i2s->regmap, false);
>
>         /* Clear TX counter */
>         regmap_write(i2s->regmap, SUN4I_I2S_TX_CNT_REG, 0);
> @@ -1053,13 +1057,7 @@ static const struct snd_soc_component_driver sun4i_i2s_component = {
>
>  static bool sun4i_i2s_rd_reg(struct device *dev, unsigned int reg)
>  {
> -       switch (reg) {
> -       case SUN4I_I2S_FIFO_TX_REG:
> -               return false;
> -
> -       default:
> -               return true;
> -       }
> +       return true;

The commit log needs to explain why this is relevant. And I'm not sure why one
would read back the TX FIFO. Also, if it's always true, just drop the callback.

ChenYu

>  }
>
>  static bool sun4i_i2s_wr_reg(struct device *dev, unsigned int reg)
> @@ -1078,6 +1076,8 @@ static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
>  {
>         switch (reg) {
>         case SUN4I_I2S_FIFO_RX_REG:
> +       case SUN4I_I2S_FIFO_TX_REG:
> +       case SUN4I_I2S_FIFO_STA_REG:
>         case SUN4I_I2S_INT_STA_REG:
>         case SUN4I_I2S_RX_CNT_REG:
>         case SUN4I_I2S_TX_CNT_REG:
> @@ -1088,23 +1088,12 @@ static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
>         }
>  }
>
> -static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
> -{
> -       switch (reg) {
> -       case SUN8I_I2S_FIFO_TX_REG:
> -               return false;
> -
> -       default:
> -               return true;
> -       }
> -}
> -
>  static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
>  {
>         if (reg == SUN8I_I2S_INT_STA_REG)
>                 return true;
>         if (reg == SUN8I_I2S_FIFO_TX_REG)
> -               return false;
> +               return true;
>
>         return sun4i_i2s_volatile_reg(dev, reg);
>  }
> @@ -1175,7 +1164,7 @@ static const struct regmap_config sun8i_i2s_regmap_config = {
>         .reg_defaults   = sun8i_i2s_reg_defaults,
>         .num_reg_defaults       = ARRAY_SIZE(sun8i_i2s_reg_defaults),
>         .writeable_reg  = sun4i_i2s_wr_reg,
> -       .readable_reg   = sun8i_i2s_rd_reg,
> +       .readable_reg   = sun4i_i2s_rd_reg,
>         .volatile_reg   = sun8i_i2s_volatile_reg,
>  };
>
> @@ -1188,7 +1177,7 @@ static const struct regmap_config sun50i_i2s_regmap_config = {
>         .reg_defaults   = sun50i_i2s_reg_defaults,
>         .num_reg_defaults       = ARRAY_SIZE(sun50i_i2s_reg_defaults),
>         .writeable_reg  = sun4i_i2s_wr_reg,
> -       .readable_reg   = sun8i_i2s_rd_reg,
> +       .readable_reg   = sun4i_i2s_rd_reg,
>         .volatile_reg   = sun8i_i2s_volatile_reg,
>  };
>
> --
> 2.22.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
