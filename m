Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2904B5D35
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 22:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D5E18AB;
	Mon, 14 Feb 2022 22:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D5E18AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644875315;
	bh=FI0tLnbDla+b3eKuNGbYEegS8GA8qCLi6lHOLwvD6h8=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROmXo/fLfq2QYY8HMSrecyuCZhN2a+DehlAsdFnNK4ysdev+5jxScSEuOpjhvm+7V
	 oy1b1JViYlmWnKd9YLEx/GgzIpP3jNgyNTkBSZyCEqHb4NFUC9gNciY8KNBgCB410M
	 DNjPfh10g678OqHkns7EhF2Pvg0mRVD/FnRNAUSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB0AF800C0;
	Mon, 14 Feb 2022 22:47:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1040F80310; Mon, 14 Feb 2022 22:47:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F25CF800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 22:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F25CF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kEDFFQ9A"
Received: by mail-oi1-x233.google.com with SMTP id y23so18847633oia.13
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KZ8Tp8JYnqcpdvEmr+9vUKPtUjGKxrOWPg9ikND1TsQ=;
 b=kEDFFQ9AnhAiPYpTrzxVGENiaHYM4WNo0h7IYAhmBWdtr2Nehv4FPMpQzGIGBTTSdT
 V2UaMvUYGZkYk57yH9eb+iYHLKrErwgOdY4eUHXzNN6zGjZ4AEMBjYejLDsaYiKpifNI
 ow94ZcKv1MDiVK1Cw9O4RE9jJAmxCrV45JbGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KZ8Tp8JYnqcpdvEmr+9vUKPtUjGKxrOWPg9ikND1TsQ=;
 b=LP8ytQG7KnOHGiXQuwRLGFM6yjuQpxjGuQrah3khGUF7Dw7JEV7YltLdTRZV/Lj1FH
 txVDaIceldyaFMVaDao2BFhEOgMe9FyTmgYUqh3LzWMYX2PjGliupqhUTXktFB4CXwZp
 m36jy6WMop19EuKZn7YCkvU//j4bMxJ25ZlBMQzn+roDYYYGM5OEWWpHWpyOMCk0h1UQ
 HYKSv7LZ+csymHQ3xgg8kTa1xToyRsCGYWlApRIL/ECmqj8pSyf29j1ZAFqIItx/A3oR
 HUuFhwWWdn7CTIl6pXXwmNB6RPzb993NvMgnx8qupd3ZGV+5GBKoa8DZjE93wAj/94gH
 F3wg==
X-Gm-Message-State: AOAM531Klz6lzRE2m/HI0baWVnubBVxg80PMI7bGBK0pzDna3hv/KIkL
 zfGos4zGmA6Y9NXzEkXZFoguANbIDusM6d4j6ApV3g==
X-Google-Smtp-Source: ABdhPJy6QtgovTMrBoMRA7cWoi8cXunIMQ3hmVjFFwyt7eXnabvshXHxsyp6QmnTk4CMzG+koej6x98aKMZeKBq0p4E=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr412149oig.40.1644875238208; Mon, 14 Feb
 2022 13:47:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 13:47:17 -0800
MIME-Version: 1.0
In-Reply-To: <1644668672-29790-2-git-send-email-quic_srivasam@quicinc.com>
References: <1644668672-29790-1-git-send-email-quic_srivasam@quicinc.com>
 <1644668672-29790-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 14 Feb 2022 13:47:17 -0800
Message-ID: <CAE-0n52uBY7GzjtFwV67y5mfqZRoK9ooW-kT3=4sH=8NtVK7FQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codec: wcd938x: Add switch control for
 selecting CTIA/OMTP Headset
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-12 04:24:31)
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index eff200a..08d16a9 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -194,6 +194,7 @@ struct wcd938x_priv {
>         int ear_rx_path;
>         int variant;
>         int reset_gpio;
> +       int us_euro_gpio;
>         u32 micb1_mv;
>         u32 micb2_mv;
>         u32 micb3_mv;
> @@ -4196,6 +4197,33 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>                 dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>  }
>
> +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool active)
> +{
> +       int value;
> +
> +       struct wcd938x_priv *wcd938x;
> +
> +       if (!component) {

So component is NULL

> +               dev_err(component->dev, "%s component is NULL\n", __func__);

And now we deref component. Great NULL pointer exception Batman! Please
test your code and remove useless checks. It makes the code harder to
read and slows things down.

> +               return false;
> +       }
> +
> +       wcd938x = snd_soc_component_get_drvdata(component);
> +       if (!wcd938x) {
> +               dev_err(component->dev, "%s private data is NULL\n", __func__);

Is this possible? I doubt it so can we just remove it?

> +               return false;
> +       }
> +
> +       value = gpio_get_value(wcd938x->us_euro_gpio);
> +
> +       gpio_set_value(wcd938x->us_euro_gpio, !value);
> +       /* 20us sleep required after changing the gpio state*/

Add a space before ending comment with */

> +       usleep_range(20, 30);
> +
> +       return true;
> +}
> +
> +
>  static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device *dev)
>  {
>         struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
> @@ -4208,6 +4236,16 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>                 return wcd938x->reset_gpio;
>         }
>
> +       wcd938x->us_euro_gpio = of_get_named_gpio(dev->of_node, "us-euro-gpios", 0);

Why do we need to use of GPIO APIs here? Can this driver be converted to
use GPIO descriptors via the gpiod APIs?

> +       if (wcd938x->us_euro_gpio < 0) {
> +               dev_err(dev, "Failed to get us-euro-gpios gpio: err = %d\n", wcd938x->us_euro_gpio);
> +       } else {
> +               cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
> +               gpio_direction_output(wcd938x->us_euro_gpio, 0);
> +               /* 20us sleep required after pulling the reset gpio to LOW */
> +               usleep_range(20, 30);
> +       }
> +
