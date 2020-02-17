Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F7160BA6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 08:35:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73AA21679;
	Mon, 17 Feb 2020 08:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73AA21679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581924925;
	bh=UcilPhArBNE/wmmP5/5ySUGm1hc3QybTK1jWMcx8etw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JavsJSMw65/aSKrHfrErvJVuEY1uaymP3NZQDY/8Nj1yNkYX4go0v5vNhMcRN32Kg
	 jR0AuwrKosCifGUvTEg9liqyFusDfD1XumV3W7x05TvOZ+zk83sos+4nyG8KFKy5A6
	 A0Zh7TBDJR4L7eAjiQMRlnb8Zq86EC9vdi/cVGao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CFDF801F4;
	Mon, 17 Feb 2020 08:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4982F80172; Mon, 17 Feb 2020 08:33:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C5A2F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C5A2F800B6
Received: by mail-ed1-f66.google.com with SMTP id r21so19552229edq.0
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSSCawygB3nvTAtWswavRnt6s9D1sDcPs8tiWUcv5Cc=;
 b=G0J5j01J7tkJ7QAIS7xRAeUFSjAltScqDcrzEojmuVIMaknMlADbRhqt3iZY+nA4zf
 l8s2IhuNZcTKrnJS3Viml1ZtJu2xjasi4ZXRylm1iHdtbB0NkGzpMdzixubihuW8LNl7
 P+1BY4WBkZbpNvsp99wltyY9en9lwEt3AbyWKMJDOAI+xITFQ2EkeeR+06NsUkm8SP6y
 XkKeiDzd6X1t8SPMvfOj6eBmAxhaZEtbC8i9fR+KyYcmYPvB7Ve1PLzNWSr+jYJIqS2a
 u8aAu3cXQM3DOpPtILvE2Lyphpx8UCg1MHMZeSMuzlA9MZqxK/lVFwX3xLfEemDbd45l
 cnYQ==
X-Gm-Message-State: APjAAAX2GWZG5HOjeljwl0fkmoo2YoxHuW2hHwXmcwDVRx5H+SLH4ybt
 0kLwxeVqk2R0o5EAQ/NsoBRaaMQAToc=
X-Google-Smtp-Source: APXvYqxlEWUZKlqD/2ZfVC8GyN+0IfJ3uivdVzrYAxDKUEQ9uuiFefqZyrmqs2xaTfndBMNwwX2NlA==
X-Received: by 2002:aa7:db44:: with SMTP id n4mr12724201edt.357.1581924814366; 
 Sun, 16 Feb 2020 23:33:34 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54])
 by smtp.gmail.com with ESMTPSA id y4sm856755ejp.50.2020.02.16.23.33.33
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:33:34 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id t14so17194915wmi.5
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:33:33 -0800 (PST)
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr22012620wmg.16.1581924813434; 
 Sun, 16 Feb 2020 23:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-9-samuel@sholland.org>
In-Reply-To: <20200217021813.53266-9-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:33:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v67wvWEYM4ttKVmgM6Pou+00tuvwb8nMvjR+Y+F-p2cA=g@mail.gmail.com>
Message-ID: <CAGb2v67wvWEYM4ttKVmgM6Pou+00tuvwb8nMvjR+Y+F-p2cA=g@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 8/8] ASoC: sun50i-codec-analog: Enable DAPM
	for earpiece switch
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

Hi,

On Mon, Feb 17, 2020 at 10:18 AM Samuel Holland <samuel@sholland.org> wrote:
>
> By including the earpiece mute switch in the DAPM graph, both the
> earpiece amplifier and the Mixer/DAC inputs can be powered off when
> the earpiece is muted.
>
> The mute switch is between the source selection and the amplifier,
> as per the diagram in the SoC manual.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun50i-codec-analog.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
> index 84bb76cad74f..6c89b0716bbd 100644
> --- a/sound/soc/sunxi/sun50i-codec-analog.c
> +++ b/sound/soc/sunxi/sun50i-codec-analog.c
> @@ -232,11 +232,6 @@ static const struct snd_kcontrol_new sun50i_a64_codec_controls[] = {
>                        SUN50I_ADDA_EARPIECE_CTRL1,
>                        SUN50I_ADDA_EARPIECE_CTRL1_ESP_VOL, 0x1f, 0,
>                        sun50i_codec_earpiece_vol_scale),
> -
> -       SOC_SINGLE("Earpiece Playback Switch",
> -                  SUN50I_ADDA_EARPIECE_CTRL1,
> -                  SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE, 1, 0),
> -
>  };
>
>  static const char * const sun50i_codec_hp_src_enum_text[] = {
> @@ -295,6 +290,11 @@ static const struct snd_kcontrol_new sun50i_codec_earpiece_src[] = {
>                       sun50i_codec_earpiece_src_enum),
>  };
>
> +static const struct snd_kcontrol_new sun50i_codec_earpiece_switch =
> +       SOC_DAPM_SINGLE("Playback Switch",
> +                       SUN50I_ADDA_EARPIECE_CTRL1,
> +                       SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_MUTE, 1, 0);
> +
>  static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
>         /* DAC */
>         SND_SOC_DAPM_DAC("Left DAC", NULL, SUN50I_ADDA_MIX_DAC_CTRL,
> @@ -341,6 +341,8 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
>
>         SND_SOC_DAPM_MUX("Earpiece Source Playback Route",
>                          SND_SOC_NOPM, 0, 0, sun50i_codec_earpiece_src),
> +       SND_SOC_DAPM_SWITCH("Earpiece",
> +                           SND_SOC_NOPM, 0, 0, &sun50i_codec_earpiece_switch),

I would suggest naming this something a bit more specific, in case someone
uses "Earpiece" as a widget name at the board level. Also, having the
"Earpiece" come before the "Earpiece Amp" in the route doesn't make much
sense. However, this creates an issue with the name of the created kcontrol...
Any other ideas?

ChenYu


>         SND_SOC_DAPM_OUT_DRV("Earpiece Amp", SUN50I_ADDA_EARPIECE_CTRL1,
>                              SUN50I_ADDA_EARPIECE_CTRL1_ESPPA_EN, 0, NULL, 0),
>         SND_SOC_DAPM_OUTPUT("EARPIECE"),
> @@ -462,7 +464,8 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
>         { "Earpiece Source Playback Route", "DACR", "Right DAC" },
>         { "Earpiece Source Playback Route", "Left Mixer", "Left Mixer" },
>         { "Earpiece Source Playback Route", "Right Mixer", "Right Mixer" },
> -       { "Earpiece Amp", NULL, "Earpiece Source Playback Route" },
> +       { "Earpiece", "Playback Switch", "Earpiece Source Playback Route" },
> +       { "Earpiece Amp", NULL, "Earpiece" },
>         { "EARPIECE", NULL, "Earpiece Amp" },
>  };
>
> --
> 2.24.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
