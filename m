Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD4649048B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 10:03:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315C417A1;
	Mon, 17 Jan 2022 10:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315C417A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642410200;
	bh=keRU/skMdp6pIErMRq7oexaEZoCct7m+jTvZH+4VMJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i8BT35Sncu39YaiG21vHJtSbwAxgPSAcpJKVvxGbVm2FMELk2F+vg8dNYGhVwoBU2
	 j7nbtnvS7Pz4Vh2+ogljBhhW5V/NU3NMZ0q5Qf5PGfX+Blcvjij0JNXN7GbHOEn6C1
	 /JYkejKpwe48i3q4Jk1h2sH2NcI9W/ViGoKdm5cQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99AEDF800EB;
	Mon, 17 Jan 2022 10:02:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC37F80249; Mon, 17 Jan 2022 10:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CFB2F800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 10:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFB2F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="F04iKpf5"
Received: by mail-lf1-x12f.google.com with SMTP id e3so52198412lfc.9
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5eWNHkxEDcvDnOVa58vimxj0RFzSnZVX78Y15KWp4XE=;
 b=F04iKpf55HWHZUfNd0MND3kcC57yHpdTxP2HADRAYHB8O1xd4GhvxL5ge//KS4A7TS
 gpejjKDT3cDnZAclFrysE8oNstHYfFzAc9Xxt1Z6B96UtuI7T3RYhU56mMNBQZGcPJ1S
 9NeSRFgzrZiCJ3BaQjQFBzJfWoY4POEB95y48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5eWNHkxEDcvDnOVa58vimxj0RFzSnZVX78Y15KWp4XE=;
 b=PShXZ2wZHGbvKZaJkVenG9XGBooWl+PUzNxjiqMEW+coJJujM2MHeIuqshzc3O+Fe9
 zTE0LpRuyQc//FDdTWo/mptdVjvtRNSNnlSsBicjeVtt0cWhyJtu2yM3BMaKqM4MhS3I
 3+1TnNnSxpWFPoyoyo2lD4nMGs9w1QgVFbMjkNe+w7x01958KzPFibBnnrDoneWy3Hgx
 TUSdVEuSjJOJTo5mDS15nWCNVHqEXd+dYYVu0af3iQ05DBuP0xQNhL2kfxYMjql4HeOb
 2zMKOBpwGkTl9YPp4iUqkTWWw/1+nWUUuoWQPTsk9pILRTiKnEkigPGRIUvVw+VJrENW
 URiA==
X-Gm-Message-State: AOAM531dSsWoKj8IEhS0gaFAHvUXMhXpl3YSpAAYzw0MBZ0o5RXfSb69
 nMHrtQ2ub/Ea6AyGdGmPvaHn+RLKtCDdN7sBaHfpJA==
X-Google-Smtp-Source: ABdhPJwK4naYaBZ+8GM/Ab9/Ixhagfb6WfeIhngfxmIkwTvUXsUhPQGr5I/x32U0ZdswDbRkgjWjQoAnUK/H9/TpoSc=
X-Received: by 2002:a2e:b602:: with SMTP id r2mr3683300ljn.392.1642410123234; 
 Mon, 17 Jan 2022 01:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
In-Reply-To: <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Jan 2022 17:01:52 +0800
Message-ID: <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
To: Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
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

On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Now that the cdn-dp driver supports plug-change callbacks, let's wire it
> up.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> (no changes since v1)
>
>  sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> index e2d52d8d0ff9..eeef3ed70037 100644
> --- a/sound/soc/rockchip/rk3399_gru_sound.c
> +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> @@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
>         return 0;
>  }
>
> +static struct snd_soc_jack cdn_dp_card_jack;
> +
> +static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;

Using snd_soc_card_get_codec_dai() might be a better choice throughout this
driver. While it will work for the cdn_dp case, because it is the first DAI
in |rockchip_dais[]|, all the invocations for the other codecs are likely
returning the wrong DAI.

For this particular patch it works either way, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


> +       struct snd_soc_card *card = rtd->card;
> +       int ret;
> +
> +       /* Enable jack detection. */
> +       ret = snd_soc_card_jack_new(card, "DP Jack", SND_JACK_LINEOUT,
> +                                   &cdn_dp_card_jack, NULL, 0);
> +       if (ret) {
> +               dev_err(card->dev, "Can't create DP Jack %d\n", ret);
> +               return ret;
> +       }
> +
> +       return snd_soc_component_set_jack(component, &cdn_dp_card_jack, NULL);
> +}
> +
>  static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
>  {
>         struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
> @@ -315,6 +334,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
>         [DAILINK_CDNDP] = {
>                 .name = "DP",
>                 .stream_name = "DP PCM",
> +               .init = rockchip_sound_cdndp_init,
>                 .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>                         SND_SOC_DAIFMT_CBS_CFS,
>                 SND_SOC_DAILINK_REG(cdndp),
> --
> 2.34.1.703.g22d0c6ccf7-goog
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
