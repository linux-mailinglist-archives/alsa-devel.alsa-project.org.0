Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A416093E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 04:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C085166E;
	Mon, 17 Feb 2020 04:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C085166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581911414;
	bh=X9NqEjRk9ipZho0yMV72iDHGV9Vj6LWmZoh+Y+57rHk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7VE4VAqxpuIR2W6dfzlmJvL/0NJOJcvicUL4HzQIo/WEakmaE0l8tWqKglop7ZW3
	 6DnzCmiKpYc5hzmVFSK1Z/IGAIgv3oVqAJnmEyt7cfuUMMaC1u3VsLuANeIpBR3GEt
	 LMmchdfQ1fYoHRbj/7uZgvbUBuFn/KFs9VDg6NG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B10D0F8015E;
	Mon, 17 Feb 2020 04:48:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC29F80172; Mon, 17 Feb 2020 04:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44FA8F800C4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 04:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44FA8F800C4
Received: by mail-ed1-f67.google.com with SMTP id p23so19009093edr.5
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1P9UDUTmYMSZh58iCz9VgX9ylC6V1SoZoKFa2vjdalQ=;
 b=FIX+STzGIwy11LshavKQAbSyT9FYWMfkTtBxZbpC9u45WRuLmR7Cf35hf9F6Wsrft0
 kF2C0UKXKpx8ebS9f03im6CueRTGf2Ux8EqtT+4DakWyz/jNQ3GmfhKquWnboFsOI6Z5
 yrCK8bu2+OaYcbmw0uYFZ2WoMIQ2aCe4ujn8ADjoGIyxzs7lRje5/FR5lS7clPVsTN3A
 Vboa87MPuvQ28FvyiK6hDRR+NItDsPW4oGHhElOD+gBH8/k8zARcOTIjbZaUcEPFziRj
 359t6g3gNgQ56m0EISdpyJLqgBPsyMKj8HIH9m/JOgoOgYz27nIX/9Jjsy23D6MqqdUG
 1YqA==
X-Gm-Message-State: APjAAAUA4aoKIH0Van451oIaSIMW6rrJb4TbY95TGsL/qy4m6C1xMBoc
 HQyOdutm4ufELd29khV1d2Fw/A0Qwoc=
X-Google-Smtp-Source: APXvYqyGKJADXbd2mRjM7iyPsa6LVMhxikZ96L7EnXa5VQ9NjhC3LqtgU3uYQs+aK0tR/xfxmwB4vQ==
X-Received: by 2002:aa7:d8d4:: with SMTP id k20mr12868070eds.380.1581911303501; 
 Sun, 16 Feb 2020 19:48:23 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id c19sm844507ejm.47.2020.02.16.19.48.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 19:48:23 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id t3so17872830wru.7
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:48:22 -0800 (PST)
X-Received: by 2002:a5d:6805:: with SMTP id w5mr19709664wru.64.1581911302119; 
 Sun, 16 Feb 2020 19:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-5-samuel@sholland.org>
In-Reply-To: <20200217021813.53266-5-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 11:48:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v677p8u8_0jhcbN07QsyVc21dKJmeK6=rxLCbde+AOqreQ@mail.gmail.com>
Message-ID: <CAGb2v677p8u8_0jhcbN07QsyVc21dKJmeK6=rxLCbde+AOqreQ@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 4/8] ASoC: sun50i-codec-analog: Make
	headphone routes stereo
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
> This matches the hardware more accurately, and is necessary for
> including the (stereo) headphone mute switch in the DAPM graph.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun50i-codec-analog.c | 28 +++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
> index 17165f1ddb63..f98851067f97 100644
> --- a/sound/soc/sunxi/sun50i-codec-analog.c
> +++ b/sound/soc/sunxi/sun50i-codec-analog.c
> @@ -311,9 +311,15 @@ static const struct snd_soc_dapm_widget sun50i_a64_codec_widgets[] = {
>          */
>
>         SND_SOC_DAPM_REGULATOR_SUPPLY("cpvdd", 0, 0),
> -       SND_SOC_DAPM_MUX("Headphone Source Playback Route",
> +       SND_SOC_DAPM_MUX("Left Headphone Source",
>                          SND_SOC_NOPM, 0, 0, sun50i_codec_hp_src),
> -       SND_SOC_DAPM_OUT_DRV("Headphone Amp", SUN50I_ADDA_HP_CTRL,
> +       SND_SOC_DAPM_MUX("Right Headphone Source",

Please don't remove the widget suffix. The suffix was chosen to work with
alsa-lib's control parsing code. The term "Playback Route" is appropriate
because it is playback only, and it is a routing switch, not a source or
sink.

Also, what's wrong with just having a single "stereo" widget instead of
two "mono" widgets? I added stereo (2-channel) support to DAPM quite
some time ago. You just have to have two routes in and out.

ChenYu

> +                        SND_SOC_NOPM, 0, 0, sun50i_codec_hp_src),
> +       SND_SOC_DAPM_OUT_DRV("Left Headphone Amp",
> +                            SND_SOC_NOPM, 0, 0, NULL, 0),
> +       SND_SOC_DAPM_OUT_DRV("Right Headphone Amp",
> +                            SND_SOC_NOPM, 0, 0, NULL, 0),
> +       SND_SOC_DAPM_SUPPLY("Headphone Amp", SUN50I_ADDA_HP_CTRL,
>                              SUN50I_ADDA_HP_CTRL_HPPA_EN, 0, NULL, 0),
>         SND_SOC_DAPM_OUTPUT("HP"),
>
> @@ -405,13 +411,19 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
>         { "Right ADC", NULL, "Right ADC Mixer" },
>
>         /* Headphone Routes */
> -       { "Headphone Source Playback Route", "DAC", "Left DAC" },
> -       { "Headphone Source Playback Route", "DAC", "Right DAC" },
> -       { "Headphone Source Playback Route", "Mixer", "Left Mixer" },
> -       { "Headphone Source Playback Route", "Mixer", "Right Mixer" },
> -       { "Headphone Amp", NULL, "Headphone Source Playback Route" },
> +       { "Left Headphone Source", "DAC", "Left DAC" },
> +       { "Left Headphone Source", "Mixer", "Left Mixer" },
> +       { "Left Headphone Amp", NULL, "Left Headphone Source" },
> +       { "Left Headphone Amp", NULL, "Headphone Amp" },
> +       { "HP", NULL, "Left Headphone Amp" },
> +
> +       { "Right Headphone Source", "DAC", "Right DAC" },
> +       { "Right Headphone Source", "Mixer", "Right Mixer" },
> +       { "Right Headphone Amp", NULL, "Right Headphone Source" },
> +       { "Right Headphone Amp", NULL, "Headphone Amp" },
> +       { "HP", NULL, "Right Headphone Amp" },
> +
>         { "Headphone Amp", NULL, "cpvdd" },
> -       { "HP", NULL, "Headphone Amp" },
>
>         /* Microphone Routes */
>         { "Mic1 Amplifier", NULL, "MIC1"},
> --
> 2.24.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
