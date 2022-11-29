Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4863C614
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 18:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B34168C;
	Tue, 29 Nov 2022 18:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B34168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669741484;
	bh=Fb39RWbxqtwTO7AZZkD+MqgY7EAraRBYG/dUjKsOxd0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glsjyhUwsvu7me5tBedisWfkydJNXV1kAeEx6M0S2VzXlNwmayQPLyRgQDvJ6G5bN
	 +jKb3LKc+YuFh0P33CfM/GCEx64oW3SuetgQZwrcBffcRbiOfhKCJk2F6+1QSMZCNL
	 vQt3eM5Yz1D0VJQ0K71HLYhLrn7aaIzSoM5xTGns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79310F80137;
	Tue, 29 Nov 2022 18:03:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE3C2F801F7; Tue, 29 Nov 2022 18:03:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC91F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 18:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC91F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ljTM73sT"
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-14286d5ebc3so17787986fac.3
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=;
 b=ljTM73sTaDXWg3oaSywePDjqX298nSKxGHlaRqrv/LsDQrh3Mk9juSNxGkuzLumWxy
 /O1+AvGM4FAywdTpyxCQGuYt9iKWmSXYzMbOF8AqODsFHqIaEIKHAcDeYgoOxqm3Fr4o
 TBRSen1aQi9VAoZMPuBILu+kBDk8UQm+R3FRy3pdzsmnDkxBuftdOqpEmxAanK+Th54j
 b8OVtjKBlDakl7FEtLr3q1dHi6yezL2+/uByMQUdbFwTiXZVM3v9O0eFVdNSo9ZoknNt
 vw3QrBqFV9EaNlDr4769W5eAGUfmEToEGJFnua/uUW+Qw2+N1owsFPR77QI/qPD9Wf6L
 rAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAXWficdb5Gh5FzYn9UMAwDhZ8CYJoMoqCIJ7//eDF4=;
 b=ERbwRCEcYyU/TVVmyO1Ih4UAPjHprspzwsK4GgV9FKAx88W1MVlc02SB6BSHO73IKG
 6boniZQaB2AFSdRg0CmWXqTuCjWG5VjyG8k8n39w6WkSaSU7tbNH3seMjXGOryhD84hz
 4QIqTPGL5WN9jao5tJEmSDEp2/triuYzirw3R4n29KMASFbjVOANY60/ytiTnflTWk6T
 xEXmnMimDSpOudWXBs5VIxrJy+rK6qq+9nbGvv+RiHwtO/AN3Yn+Y6zBsRFNXsCrQux0
 UN3tR5XePFHhATud8a+81tZa7L7+a9zER7zD5bxvJArVWBpTXtkCZiOzsFffLcdNld3N
 VqBg==
X-Gm-Message-State: ANoB5plsCssl7gbDOZvuvqjZGqq9yKSx41d8sAxcKPrCDq5NXZ8u+TSW
 X/xvemCcFvzdnBeap8RusVmQapQWl1Y3mZJTKmQgxw==
X-Google-Smtp-Source: AA0mqf6Tdo6X8IWcObQq2o/3ErG6HPcwPrWCjYttmbMFTp3CWvG1wKOXHHCA+4UMzfOIMYG1UrxXlV2FAe3l3HjF3RI=
X-Received: by 2002:a05:6870:7988:b0:13c:84e6:96d2 with SMTP id
 he8-20020a056870798800b0013c84e696d2mr36802093oab.72.1669741416887; Tue, 29
 Nov 2022 09:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
 <20221124085436.24900-3-jiaxin.yu@mediatek.com>
In-Reply-To: <20221124085436.24900-3-jiaxin.yu@mediatek.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 18:03:26 +0100
Message-ID: <CAG3jFyvLAHfxtKVoFFUOwUacO+t+FC3x5J9Eg-qWOUVBnU8JfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: hdmi-codec: Add event handler for hdmi TX
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: neil.armstrong@linaro.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, allen-kh.cheng@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, 24 Nov 2022 at 09:54, Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> If the speaker and hdmi are connect to the same port of I2S,
> when try to switch to speaker playback, we will find that hdmi
> is always turned on automatically. The way of switching is
> through SOC_DAPM_PIN_SWITCH, however, such events can not be
> handled in hdmi-codec driver.
>
> So add event handler for hdmi TX to solve the above issue.
>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  include/sound/hdmi-codec.h    |  6 ++++++
>  sound/soc/codecs/hdmi-codec.c | 37 +++++++++++++++++++++++++++++++----
>  2 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 48ad33aba393..dcbc09254144 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -81,6 +81,12 @@ struct hdmi_codec_ops {
>                        struct hdmi_codec_daifmt *fmt,
>                        struct hdmi_codec_params *hparms);
>
> +       /*
> +        * PCM trigger callback.
> +        * Mandatory
> +        */
> +       int (*trigger)(struct device *dev, int cmd);
> +
>         /*
>          * Shuts down the audio stream.
>          * Mandatory
> diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
> index 0b1cdb2d6049..cb4479372e09 100644
> --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -276,7 +276,31 @@ struct hdmi_codec_priv {
>         u8 iec_status[AES_IEC958_STATUS_SIZE];
>  };
>
> +static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
> +               struct snd_kcontrol *kcontrol, int event)

checkpatch --strict caught this alignment issue.

ASoC: hdmi-codec: Add event handler for hdmi TX
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: sound/soc/codecs/hdmi-codec.c:280:
+static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
+        struct snd_kcontrol *kcontrol, int event)



> +{
> +       struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +       struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               if (hcp->hcd.ops->trigger)
> +                       hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               if (hcp->hcd.ops->trigger)
> +                       hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_STOP);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct snd_soc_dapm_widget hdmi_widgets[] = {
> +       SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0, hdmi_tx_event,
> +                              SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU),
>         SND_SOC_DAPM_OUTPUT("TX"),
>         SND_SOC_DAPM_OUTPUT("RX"),
>  };
> @@ -808,18 +832,23 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
>         struct hdmi_codec_daifmt *daifmt;
>         struct snd_soc_dapm_route route[] = {
>                 {
> -                       .sink = "TX",
> +                       .sink = dai->driver->capture.stream_name,
> +                       .source = "RX",
> +               },
> +               {
> +                       .sink = "SDB",
>                         .source = dai->driver->playback.stream_name,
>                 },
>                 {
> -                       .sink = dai->driver->capture.stream_name,
> -                       .source = "RX",
> +                       .sink = "TX",
> +                       .source = "SDB",
>                 },
> +
>         };
>         int ret;
>
>         dapm = snd_soc_component_get_dapm(dai->component);
> -       ret = snd_soc_dapm_add_routes(dapm, route, 2);
> +       ret = snd_soc_dapm_add_routes(dapm, route, ARRAY_SIZE(route));
>         if (ret)
>                 return ret;
>
> --
> 2.18.0
>
