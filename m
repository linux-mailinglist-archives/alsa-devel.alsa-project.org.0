Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37233398FAC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 18:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B706616FA;
	Wed,  2 Jun 2021 18:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B706616FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622650138;
	bh=qffgA95KvaNd1nKG4sOz+Kltytud/7UblM+zoMhqZfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mrbqOviIx8oBg5UUgsDN5qL34PTTWS+ngJjsVcmHKKnaqvqEA7qjbREeqlBT2MnFl
	 GpExwtpQ5jf0vHp5frlsxiSlYe/k1pky1l1PtyKpiWQRBfLJZlf1fhY0wNMG8U6uSi
	 FhPl7YQcRJdN5B6MkwIf67QpJ2qipTMk15frhYuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1384CF80141;
	Wed,  2 Jun 2021 18:07:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01548F80424; Wed,  2 Jun 2021 18:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C8CEF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 18:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C8CEF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j/5O522W"
Received: by mail-oi1-x229.google.com with SMTP id f30so1850997oij.7
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YAZ7ZSfiugbOhQydoUaMJhIYB+bVGqv38BgoX6VqAHE=;
 b=j/5O522W9LSYYrKW9y59tk17EqPiEy6B3Mu6d/DngVNcdt76RphieNTFg+qkPe4exg
 iBRQnfM8P80qgcNaqPaWwfvPVjh6MlmlBCULycBD0OeICSAKNTxsgOiQ55CjE11/Cl+F
 qhHg+o4kbAQ2kNsd1RWdyTiprF2aXGBdBysLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YAZ7ZSfiugbOhQydoUaMJhIYB+bVGqv38BgoX6VqAHE=;
 b=jlpiOHGXp9w51olygcG26vCznxU2KCaQ5ePmX+DlW7iQqXOI7siwTWMHKLPCEeo5Q7
 unsYgQKkr4o3Gye6lA5RMvoyUwRM1ATAn8xrULVh63e7hClBbOrhYNjEWsnl5+eJqgFw
 txQkS0dAp9ktfep+hMQl1le1KEgZ3kSSzV7vjkl1EMno1xr9eTa70u/jKKCVF4GfjZF+
 G5rNILsBWFuefpdfcpbp4M1Ig8hhqVXTzVRmeTeHB+lpXRPA+OvoM3So36s3W6GdJpbn
 DI0fH6mDTnj5msXjuJkdSxJis/+RKq29doFcsY+wFh7H6E5grEUU2ZMRAVZwmhDlmk6m
 WT/A==
X-Gm-Message-State: AOAM533tuoWohVo8R/1tApRjTzT3Tq1kIbIchjcs6c2IaUYpvlHhPruc
 3OPvCjHScgfsgnUSeXxrf7KnRZDisuSXdA==
X-Google-Smtp-Source: ABdhPJwWWIALnltD+LAkPQs0Gd3UghkG0ATB3SJs3UVuPuQ6IO3mUW89ZeuGhjHDTaLIAuHPXXS5uw==
X-Received: by 2002:a05:6808:190:: with SMTP id
 w16mr4328970oic.92.1622650037254; 
 Wed, 02 Jun 2021 09:07:17 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48])
 by smtp.gmail.com with ESMTPSA id t4sm46355ool.41.2021.06.02.09.07.17
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 09:07:17 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so2863041otp.11
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 09:07:17 -0700 (PDT)
X-Received: by 2002:ab0:c07:: with SMTP id a7mr21690857uak.120.1622650025634; 
 Wed, 02 Jun 2021 09:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210602155312.207401-1-judyhsiao@chromium.org>
In-Reply-To: <20210602155312.207401-1-judyhsiao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 09:06:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_-oV7A_YPOFnCqUk5o=LBvf6KP1tNyVXTp=eeRkPaYQ@mail.gmail.com>
Message-ID: <CAD=FV=V_-oV7A_YPOFnCqUk5o=LBvf6KP1tNyVXTp=eeRkPaYQ@mail.gmail.com>
Subject: Re: [v4] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
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

Hi,

On Wed, Jun 2, 2021 at 8:54 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>
> This patch fixes PoP noise of around 15ms observed during audio
> capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
> introducing some delay before capture start and clock enable.
>
> Co-developed-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> (am from https://patchwork.kernel.org/patch/12276369/)
> (also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)
>
> ---
> Chages Since V3:
>         -- Check BCLK is off before enabling it in lpass_cpu_daiops_prepare as
>            lpass_cpu_daiops_prepare can be called multiple times.
>         -- Check BCLK is on before disabling it in lpass_cpu_daiops_shutdown to
>            fix the WARN. It is because BCLK may not be enabled if
>            lpass_cpu_daiops_prepare is not called before lpass_cpu_daiops_shutdown.
>         -- Adds more comments.
> Changes Since V2:
>         -- Updated comments as per linux style
>         -- Removed unrelated changes.
> Changes Since V1:
>         -- Enableed BCLK and LRCLK in dai ops prepare API instead of startup API
>         -- Added comments
>
>  sound/soc/qcom/lpass-cpu.c | 83 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index af8cb64924a0..b572d7874554 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -93,8 +94,28 @@ static void lpass_cpu_daiops_shutdown(struct snd_pcm_substream *substream,
>                 struct snd_soc_dai *dai)
>  {
>         struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> +       unsigned int id = dai->driver->id;
>
>         clk_disable_unprepare(drvdata->mi2s_osr_clk[dai->driver->id]);
> +       /*
> +        * To ensure LRCLK disabled even in device node validation
> +        * Will not impact if disabled in lpass_cpu_daiops_trigger()
> +        * suspend.
> +        */
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               regmap_fields_write(i2sctl->spken, id, LPAIF_I2SCTL_SPKEN_DISABLE);
> +       else
> +               regmap_fields_write(i2sctl->micen, id, LPAIF_I2SCTL_MICEN_DISABLE);
> +
> +       /*
> +        * BCLK may not be enabled if lpass_cpu_daiops_prepare is called before
> +        * lpass_cpu_daiops_shutdown. It's paired with the clk_enable in
> +        * lpass_cpu_daiops_prepare.
> +        */
> +       if (__clk_is_enabled(drvdata->mi2s_bit_clk[dai->driver->id]))
> +               clk_disable(drvdata->mi2s_bit_clk[dai->driver->id]);

Not a full review of this patch, but the above pattern is almost never
correct. There's a reason that the __clk_is_enabled() is only in
"clk-provider.h"--it's not intended to be called by clients.

Possibly a good solution (this is not code I've ever looked at) is to
just have a boolean in your structure like "was_prepared". Then if
"was_prepared" you can disable the clock. Also in the
lpass_cpu_daiops_prepare() function you should only enable the clock
if "!was_prepared" already.


> @@ -288,7 +321,8 @@ static int lpass_cpu_daiops_trigger(struct snd_pcm_substream *substream,
>
>                 ret = clk_enable(drvdata->mi2s_bit_clk[id]);
>                 if (ret) {
> -                       dev_err(dai->dev, "error in enabling mi2s bit clk: %d\n", ret);
> +                       dev_err(dai->dev,
> +                               "error in enabling mi2s bit clk: %d\n", ret);

Why is there an unrelated change to wrapping here? Seems like you
could drop this part of the change. If you really need to make this
change (you probably don't since the 80 column rule has been relaxed
and it's also existing code) then you could change it in a separate
patch.


> +       /*
> +        * Check BCLK is off before enabling it as lpass_cpu_daiops_prepare can
> +        * be called multiple times. It's paired with the clk_disable in
> +        * lpass_cpu_daiops_shutdown.
> +        */
> +       if (!__clk_is_enabled(drvdata->mi2s_bit_clk[dai->driver->id])) {
> +               ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> +               if (ret) {
> +                       dev_err(dai->dev,
> +                               "error in enabling mi2s bit clk: %d\n", ret);
> +                       clk_disable(drvdata->mi2s_osr_clk[id]);

If the clk_enable() failed then you shouldn't call clk_disable().
