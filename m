Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA845DFF7
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 10:36:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A21916AF;
	Wed,  3 Jul 2019 10:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A21916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562142993;
	bh=6Foy+rCnxDxZSJXoQE4XmVz0ApuyTP2jfg4T72PZysw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=URuXYd9ZS16ulFE36bw/mKWtyITZXne4XUWYwm5VM/9RXYpQPxWXkrFPcUkCaW2cW
	 bZHiV8BaddOZptVmw9c0Lt7P7RaLoIH+XhZ5cpq39RevnER16tK9JaejL4VdLxIP5R
	 2d+WAeb77pUhPw/UGGHlI4z7m22nFplG1snQOB6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72075F800EA;
	Wed,  3 Jul 2019 10:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42F6BF800EA; Wed,  3 Jul 2019 10:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14827F800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 10:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14827F800C5
Received: by mail-ed1-f66.google.com with SMTP id w20so1233563edd.2
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 01:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J82z1LlQmnxvq8BGCR47A7grHNbwxVExo4k//gkAz/g=;
 b=NlUxMe4pJIOuUMiZGSW0rSxnbJnbEGIBJf1K0ISXbCxe8fbWxJDNlhPfcn1J7KLb8v
 bT0EzroVgcgWM5S0gEbW/iL/BGCXtVyWGul9b5yjLn/orK35T9+AR8uStGaYa4HHuYJS
 22z4J7smKLek5ouVkKS34yvcxlKfz1CRfRclDvg0/udCpJ+M8xyuNYd8MsyYs8epS6X8
 EnMFMhUqCM0+b7zCw01i2wTwC2Kj22Xf2cOn/eNrROfa8u2ymfvYfny6gpTkiOnaI75j
 x9/YsOz4BRS1H5I3czAjVpKKcWISJK9D7WY1mVJCbsTGe1FArxfOxwaUtanrWSEiySIk
 U1dg==
X-Gm-Message-State: APjAAAVrB5RMvUOnYUXsxUTWBDaqPbLdbGhgjEqz2vGjz9CZ8ku26JJB
 6cowehuPZcZaeYEbT7WzFZNI178zqyc=
X-Google-Smtp-Source: APXvYqy0nYdsKCSLDpBbUWAWt5vW4wlJxkdT0RSsnePn7rfEEp8ZU50oGFBWrnaGJpZpB/EbvVka2w==
X-Received: by 2002:aa7:d888:: with SMTP id u8mr40797580edq.264.1562142883069; 
 Wed, 03 Jul 2019 01:34:43 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id h10sm467589eda.85.2019.07.03.01.34.40
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 01:34:41 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id n4so1694940wrw.13
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 01:34:40 -0700 (PDT)
X-Received: by 2002:a5d:5009:: with SMTP id e9mr23708360wrt.279.1562142880511; 
 Wed, 03 Jul 2019 01:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190702191613.11084-1-luca@z3ntu.xyz>
In-Reply-To: <20190702191613.11084-1-luca@z3ntu.xyz>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 3 Jul 2019 16:34:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v66gX83sR-aWgFKBX+BH7Mud_PaAMvw4eNctQZFMkBYo=g@mail.gmail.com>
Message-ID: <CAGb2v66gX83sR-aWgFKBX+BH7Mud_PaAMvw4eNctQZFMkBYo=g@mail.gmail.com>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 ~martijnbraam/pmos-upstream@lists.sr.ht, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: sunxi: sun50i-codec-analog: Add
	earpiece
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

On Wed, Jul 3, 2019 at 3:17 AM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> This adds the necessary registers and audio routes to play audio using
> the Earpiece, that's supported on the A64.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> So, first of all: This is my first audio patch and I hope I didn't make
> too many mistakes :) , especially with the routes at the bottom of
> the patch.
>
> What I'm really unsure about, is how the enable & mute registers should
> be handled. Should I put both registers into a SOC_DOUBLE("Earpiece
> Playback Switch",...)?

What we normally have with sunxi is the "Enable" switches typically
control whether a given function is active or not. With the earpiece
output, it controls the amplifier for the output. This should be modeled
as a separate DAPM widget, without a control, and let the framework
deal with it.

The mute controls the signal, so you can just keep as a control.

>  sound/soc/sunxi/sun50i-codec-analog.c | 51 +++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
> index d105c90c3706..6c19fea992c5 100644
> --- a/sound/soc/sunxi/sun50i-codec-analog.c
> +++ b/sound/soc/sunxi/sun50i-codec-analog.c
> @@ -49,6 +49,15 @@
>  #define SUN50I_ADDA_OR_MIX_CTRL_DACR           1
>  #define SUN50I_ADDA_OR_MIX_CTRL_DACL           0
>
> +#define SUN50I_ADDA_EARPIECE_CTRL0     0x03
> +#define SUN50I_ADDA_EARPIECE_CTRL0_EAR_RAMP_TIME       4
> +#define SUN50I_ADDA_EARPIECE_CTRL0_ESPSR               0
> +
> +#define SUN50I_ADDA_EARPIECE_CTRL1     0x04
> +#define SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_EN    7
> +#define SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE  6
> +#define SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL     0
> +
>  #define SUN50I_ADDA_LINEOUT_CTRL0      0x05
>  #define SUN50I_ADDA_LINEOUT_CTRL0_LEN          7
>  #define SUN50I_ADDA_LINEOUT_CTRL0_REN          6
> @@ -172,6 +181,10 @@ static const DECLARE_TLV_DB_RANGE(sun50i_codec_lineout_vol_scale,
>         2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
>  );
>
> +static const DECLARE_TLV_DB_RANGE(sun50i_codec_earpiece_vol_scale,
> +       0, 1, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
> +       2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
> +);
>
>  /* volume / mute controls */
>  static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
> @@ -225,6 +238,19 @@ static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
>                    SUN50I_ADDA_LINEOUT_CTRL0_LEN,
>                    SUN50I_ADDA_LINEOUT_CTRL0_REN, 1, 0),
>
> +       SOC_SINGLE_TLV("Earpiece Playback Volume",
> +                      SUN50I_ADDA_EARPIECE_CTRL1,
> +                      SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL, 0x1f, 0,
> +                      sun50i_codec_earpiece_vol_scale),
> +
> +       SOC_SINGLE("Earpiece Playback Switch (enable)",
> +                  SUN50I_ADDA_EARPIECE_CTRL1,
> +                  SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_EN, 1, 0),

As mentioned above, this should be a DAPM widget instead.

> +
> +       SOC_SINGLE("Earpiece Playback Switch",
> +                  SUN50I_ADDA_EARPIECE_CTRL1,
> +                  SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE, 1, 0),
> +
>  };
>
>  static const char * const sun50i_codec_hp_src_enum_text[] = {
> @@ -257,6 +283,20 @@ static const struct snd_kcontrol_new sun50i_codec_lineout_src[] = {
>                       sun50i_codec_lineout_src_enum),
>  };
>
> +static const char * const sun50i_codec_earpiece_src_enum_text[] = {
> +       "DACR", "DACL", "Right Analog Mixer", "Left Analog Mixer",

I suggest dropping "Analog" to match what other controls, such as the
Headphone Source" control, uses.

ChenYu

> +};
> +
> +static SOC_ENUM_SINGLE_DECL(sun50i_codec_earpiece_src_enum,
> +                           SUN50I_ADDA_EARPIECE_CTRL0,
> +                           SUN50I_ADDA_EARPIECE_CTRL0_ESPSR,
> +                           sun50i_codec_earpiece_src_enum_text);
> +
> +static const struct snd_kcontrol_new sun50i_codec_earpiece_src[] = {
> +       SOC_DAPM_ENUM("Earpiece Source Playback Route",
> +                     sun50i_codec_earpiece_src_enum),
> +};
> +
>  static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
>         /* DAC */
>         SND_SOC_DAPM_DAC("Left DAC", NULL, SUN50I_ADDA_MIX_DAC_CTRL,
> @@ -285,6 +325,10 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
>                          SND_SOC_NOPM, 0, 0, sun50i_codec_lineout_src),
>         SND_SOC_DAPM_OUTPUT("LINEOUT"),
>
> +       SND_SOC_DAPM_MUX("Earpiece Source Playback Route",
> +                        SND_SOC_NOPM, 0, 0, sun50i_codec_earpiece_src),
> +       SND_SOC_DAPM_OUTPUT("EARPIECE"),
> +
>         /* Microphone inputs */
>         SND_SOC_DAPM_INPUT("MIC1"),
>
> @@ -388,6 +432,13 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
>         { "Line Out Source Playback Route", "Mono Differential",
>                 "Right Mixer" },
>         { "LINEOUT", NULL, "Line Out Source Playback Route" },
> +
> +       /* Earpiece Routes */
> +       { "Earpiece Source Playback Route", "DACL", "Left DAC" },
> +       { "Earpiece Source Playback Route", "DACR", "Right DAC" },
> +       { "Earpiece Source Playback Route", "Left Analog Mixer", "Left Mixer" },
> +       { "Earpiece Source Playback Route", "Right Analog Mixer", "Right Mixer" },
> +       { "EARPIECE", NULL, "Earpiece Source Playback Route" },
>  };
>
>  static const struct snd_soc_component_driver sun50i_codec_analog_cmpnt_drv = {
> --
> 2.22.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
