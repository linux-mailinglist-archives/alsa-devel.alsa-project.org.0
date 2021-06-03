Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CA39AE55
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 00:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5245F171F;
	Fri,  4 Jun 2021 00:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5245F171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622760171;
	bh=+H54fwxeoX5tGttBIDAcdisu9Tqn3Kqw8B9ZQOHgJiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+s25tbmsrd5unP6hjH0jT82v8nqGrdqXlTatvi9JWnVUCsyywZYyCqlcHy/8ksiH
	 S+kpmwMHI7DdoJKgTHgx1io5Y1qtau83YRMVSKTHFLB1sHXvgQYr6UGwoMOKNnyhR+
	 L6LxejmhlmTiqYaYHIj+qh3a8cc6zA5qslFKIXWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C29D4F8025B;
	Fri,  4 Jun 2021 00:41:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C7DF80254; Fri,  4 Jun 2021 00:41:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A1AF80100
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 00:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A1AF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VHKdAmXj"
Received: by mail-ot1-x32c.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so7316356otp.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Jun 2021 15:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MakzHmrhP8vAXjgFSVERlwbbPQz/I4RXtNHBxH/9Tqs=;
 b=VHKdAmXjQ4mWJlaUmDx/2T6K5khw/jG/8HRArFGaS5PZAhyt5H9ths7x65e9eiWwVy
 wVe7U4TCdZ4W9x+r1xnAzGyfLoKSkCOg8CL1xoqwU6s8AcHLMifmR/f714catM/cJHxP
 6Q9oafZgsflYNWsgqYoAyys8ALdxUI/Wg7hF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MakzHmrhP8vAXjgFSVERlwbbPQz/I4RXtNHBxH/9Tqs=;
 b=qIdnOCvYjRERHmBGqnMErYCsGQqDQO4w5zMhZPLibb4lbdgBt9gAzEd0SlRYBErUkC
 YlW+hmJNE379CCq22alGGBTMISxmByEM5V4pJsFlhifKB0iOsSsfsIjJSOy1OFzsngya
 gBrTOf0YbgJIwEE0IiZYzqADYFMGiDKEluxOTYGY49pP/R1HR85zPBV4NiDaLecnjogl
 Qmh8/FVbtFvU3tYjI/a2lDV2TdiLlj5EYVun3g9UtmSYcdGuoQuPudJuqXMw516LuCPC
 lK20Uf/i+or54oSdgTSlVae6CCQDP0IQyM/CyZ+hQbgWhn5lLjkkJ6siAVGDbCewJtly
 ZGEg==
X-Gm-Message-State: AOAM532tLi1NwiMJNGxgyZAqe1erIu160th0LIEpIEx2/7DmFcw8NOmX
 8IxJsxX9DRiUWaW+HXc6IcPuzwJM8LpTAw==
X-Google-Smtp-Source: ABdhPJz/ftf9vbudewv2ZtNV6CxhdKH57YlrKIi+n8+kr6CVTGyIAMcyaZ1qx7VhCNFESoXAS6dpDQ==
X-Received: by 2002:a05:6830:1507:: with SMTP id
 k7mr1286086otp.71.1622760069364; 
 Thu, 03 Jun 2021 15:41:09 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id c188sm62595ooc.29.2021.06.03.15.41.09
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 15:41:09 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so7326435oth.8
 for <alsa-devel@alsa-project.org>; Thu, 03 Jun 2021 15:41:09 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr1137987ybi.276.1622760058683; 
 Thu, 03 Jun 2021 15:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210603150830.229423-1-judyhsiao@chromium.org>
In-Reply-To: <20210603150830.229423-1-judyhsiao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Jun 2021 15:40:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzBgbhhVQvG+UGD2yaLJkwiq0qQHdFNQ2Ey8RKmV+qTg@mail.gmail.com>
Message-ID: <CAD=FV=VzBgbhhVQvG+UGD2yaLJkwiq0qQHdFNQ2Ey8RKmV+qTg@mail.gmail.com>
Subject: Re: [v5] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To: Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Judy Hsiao <judyhsiao@google.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

Judy,

On Thu, Jun 3, 2021 at 8:08 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> @@ -315,12 +353,54 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>         return ret;
>  }
>
> +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> +               struct snd_soc_dai *dai)
> +{
> +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
> +       int ret;
> +       /*
> +        * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
> +        * data flow starts. This allows other codec to have some delay before
> +        * the data flow.
> +        * (ex: to drop start up pop noise before capture starts).
> +        */

nit: there's usually a blank line between the variable declarations
and the first line of code, even if the first line of code is a
comment.


> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               ret = regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_ENABLE);
> +       else
> +               ret = regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_ENABLE);
> +
> +       if (ret) {
> +               dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * Check mi2s_was_prepared before enabling BCLK as lpass_cpu_daiops_prepare can
> +        * be called multiple times. It's paired with the clk_disable in
> +        * lpass_cpu_daiops_shutdown.
> +        */
> +       if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
> +               drvdata->mi2s_was_prepared[dai->driver->id] = true;
> +               ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +               if (ret) {
> +                       dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +                       clk_disable(drvdata->mi2s_osr_clk[id]);

Can you explain why this clk_disable() is here? Your function didn't
turn this clock on, so why should it be turning it off in the error
case?


> +                       drvdata->mi2s_was_prepared[dai->driver->id] = false;
> +                       return ret;
> +               }

Why not put the `drvdata->mi2s_was_prepared[dai->driver->id] = true;`
_after_ you check for errors. Then you don't need to undo it in the
error case. I presume that your prepare() function isn't reentrant and
can't be called at the same time as your shutdown (right?).

Other than that, I don't have any objections to this patch anymore. I
probably won't add a formal "Reviewed-by", though, since I _really_
don't know anything about the issue at hand or the code. I just
stumbled upon this because I was getting the clock splat at bootup. If
someone feels like this needs me to spin up enough to understand /
really review this patch then please yell.

-Doug
