Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B108FAEF
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 08:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7AD86E;
	Fri, 16 Aug 2019 08:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7AD86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565936945;
	bh=QokzLQuy31xu9JIjTWGXGTt5k2a9z+MeZRmnhxAYNGw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tl+lbYIr7X19EHEw1iVMtHMJHksWaf9SEy28PDz3R21KHPBwNIf/Fjlsise/OzL7G
	 q2dhI2w1V0cE9b3M4doUDF3pRXb75jD+L1oCg7ILXPJKQFoMj6J59nar90bzJ7p9l7
	 soegOzgwScmbiRhLS9rhSR/vo3cmehuHXrUvmI4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09582F801DB;
	Fri, 16 Aug 2019 08:27:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB466F80214; Fri, 16 Aug 2019 08:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 745C0F801DB
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 08:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 745C0F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GDQS3E3w"
Received: by mail-lf1-x144.google.com with SMTP id b29so3334166lfq.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 23:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+lm26ypr1HFcyJ7hZ74u9revSRfSoVfoTCtYpt3Woco=;
 b=GDQS3E3wgsOcpEmUdh/7FrM+PIwG363gn6bd/2WcIDTYecvOS6uKIzzZah8q/y++LL
 JAPEsMUEGYHVt/cJCJ5RH4/KRZVEZ5zHs1HjqBD4Lh8P+yeCfaGzm/qZNWcwRr5klPFP
 gXkGm26epRrNG7drbO05XPe6GKCVNb2zU9wlzDMI/y2bi0BCxZvj4P4PKKQO/e4Yq1cj
 PL/z1F1uN+BlT8QbNG3TZ35AKbl35qDVdizIf6yQ8DE5/3XDtXBHeQ/NulYnxZt288Su
 +3D9HTDceHmk6mPD/4ZZXrjPfd/p2H5DtdIGAfhXjLoiv0yPkL3TGoclyQgG0hDjF5l7
 6lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+lm26ypr1HFcyJ7hZ74u9revSRfSoVfoTCtYpt3Woco=;
 b=FA1Ia/yAcLtpQ9uwVFFTXg0/zzTaZwKb/pGDo3kiHFjapS1v2ULUIoDgJ30mvVtFcy
 AQjw1SCN+EtEtIi91zOcD2jDLLEz9DodO5CvleECndPOrA9/D0oyT2FMUUXQM5lPzPid
 nnDCQgFJZwb8kgWzXTS2JO+fPquXZrGBSYxU6sS550ZVXtB+SwanVg4kZZ09croVgpWX
 qgCk1qG3SvJLU7/0fEW5ktQSryXLphjQO7rsrokZb/H3vD9jrFF/pnHx2FY8dls1rXjC
 DZ7MiplqCAraWIrLaoXaGvoTclMP2EGHqo/WzyYoSG0AfkGN7fOHIaCxMx7wHpsCFLE2
 dPCg==
X-Gm-Message-State: APjAAAVIv8iSuEnFgWlaphRJl84/7444tOeMBOEK/Dd+MDW6MXmrNha2
 TkxjzMiuzF9nxb7aseG+ZDCuOuxnEhzGofY5cDQ=
X-Google-Smtp-Source: APXvYqw/pzogfFsM3txv21J7mmVAMuAg5bLpt1moRRMwMAytRKI/2ywz6QY1qaZduB8tnnRHj850nAkh/ETZxUwIOXg=
X-Received: by 2002:ac2:465e:: with SMTP id s30mr4431231lfo.19.1565936836466; 
 Thu, 15 Aug 2019 23:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-3-codekipper@gmail.com>
 <20190814070923.wwkw7hybjvy3p4br@flea>
In-Reply-To: <20190814070923.wwkw7hybjvy3p4br@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Fri, 16 Aug 2019 08:27:05 +0200
Message-ID: <CAEKpxBkOu0+zek9f=4grNEhyPS=Ly3nweCUCgaz6y8M61xvpaQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 02/15] ASoC: sun4i-i2s: Add set_tdm_slot
	functionality
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

On Wed, 14 Aug 2019 at 13:08, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Wed, Aug 14, 2019 at 08:08:41AM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Codecs without a control connection such as i2s based HDMI audio and
> > the Pine64 DAC require a different amount of bit clocks per frame than
> > what is calculated by the sample width. Use the tdm slot bindings to
> > provide this mechanism.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 8201334a059b..7c37b6291df0 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -195,6 +195,9 @@ struct sun4i_i2s {
> >       struct regmap_field     *field_rxchansel;
> >
> >       const struct sun4i_i2s_quirks   *variant;
> > +
> > +     unsigned int    tdm_slots;
> > +     unsigned int    slot_width;
> >  };
> >
> >  struct sun4i_i2s_clk_div {
> > @@ -346,7 +349,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
> >       if (i2s->variant->has_fmt_set_lrck_period)
> >               regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
> >                                  SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> > -                                SUN8I_I2S_FMT0_LRCK_PERIOD(32));
> > +                                SUN8I_I2S_FMT0_LRCK_PERIOD(word_size));
> >
> >
> >       /* Set sign extension to pad out LSB with 0 */
> >       regmap_field_write(i2s->field_fmt_sext, 0);
> > @@ -450,7 +453,8 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> >       regmap_field_write(i2s->field_fmt_sr, sr);
> >
> >       return sun4i_i2s_set_clk_rate(dai, params_rate(params),
> > -                                   params_width(params));
> > +                                   i2s->tdm_slots ?
> > +                                   i2s->slot_width : params_width(params));
>
> This is slightly more complicated than that.

At this point we're only supporting 2 channels with fixed slot
settings. I've added a comment to state
that we're using the tdm_slot at the moment as an indicator to
override the slot width. Do you think
that is enough for now?.

Thanks,
CK
>
> On the H3 (and all related ones), the CHAN_CFG_TX_SLOT_NUM and
> _RX_SLOT_NUM fields in the CHAN_CFG register need to be set to the
> number of slots as well.
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
