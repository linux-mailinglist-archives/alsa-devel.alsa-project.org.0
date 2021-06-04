Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9B39B589
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 11:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A988D1725;
	Fri,  4 Jun 2021 11:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A988D1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622797825;
	bh=CD6fWYYMLYbluQkt+xCWvvss45ot4i/G6Q9iYgpLtmI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HFrUXjjKMcBg/7gP8T9xLcXkQSlZnlfN112sTTFC3liNTkCWqJjKgDnevYdUvnDNu
	 YTU0HiRJNZqqbWwehT1f98+ugs7Sz2OiTJww5T5uxPLc7iMnavGW2DesaV2XGWVZd5
	 zCnqGEu+p8m2+fF14oR60QZ7lHPOM/+/at41gZOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DA4F8049C;
	Fri,  4 Jun 2021 11:08:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 659B5F8016D; Fri,  4 Jun 2021 08:44:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E0BF8016D
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 08:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E0BF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WHIr3VY8"
Received: by mail-ot1-x329.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so8170308oth.8
 for <alsa-devel@alsa-project.org>; Thu, 03 Jun 2021 23:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZRiSVppg0ZlBYVhcB4ErKCtM122hAuAKgFRj04v9HVk=;
 b=WHIr3VY8zEefaxZiU1528tpn2CwnkE4ufl9trTxGNRIHCVQe379yppwInMxbZ9Xcn9
 Dhu9jAr3KOnRLtJw8yx4LyxcgOgDcM00fquwCtshh7DU3zQC+72uokbHi8FmaaYl2IDm
 4g3mrTu/fppEefniTzWChucMnMnlro449O4tX6rwKgGe0MfDKGlAIplaBZeY4kIk01+n
 Fzuz6Lzbnut8bAvNSRK3IUpM0LQ24+CNtf9zobcRF0AfyV0VRb3OxV8fKOt7haaP5dxA
 cRXJkn0VEWYPMzdBjOPpyENdiId23pRjN/AzZC6cY0RVj1eHuEvcRauIfbiAn9HpHge5
 X9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZRiSVppg0ZlBYVhcB4ErKCtM122hAuAKgFRj04v9HVk=;
 b=LFi48qkvLEJQJPLWk5/rbwUH5UhSM/s05Wfr2ojC8FKXyrWOvtOJoyg0ref2nT41FS
 vqjERA2LwAPTZgzkaGAlN9EkFkyMjhADaNexJZHmUx3ZJ4mZv02lika/rBc4EJ9k2wEI
 39BMn/TBmN3XVzqqZTGX+QY7SwI+F/bqrmBSRDIXfueqlXXOmf/rIDGD1zq6Ia2mR4us
 a21ujSUSONwzM/4wkEap9aiU4lbAomfEWuVL1aecELf8Io50GfOOIGHykjW+DYAmVOgr
 YDythlgTKSv6uEQm9aE1MyR1O3bBDfqQGdKKlXVM81M0Ios31Eu+vfikK6tHH7q7NAoB
 +Qng==
X-Gm-Message-State: AOAM5316XfTa7VcOVR1ThLdLljSlYnEAJv49G8+SVuntaCJotFcM50gO
 QQAvIyCm5/eeNBp8TprytIhx4L9npu5JsSS1WfUGRQ==
X-Google-Smtp-Source: ABdhPJxyX675lxoE/7buRpTzB80RyGpYWHkJc5IANYCHhlHWCZ95hgeATUiEkZ0pMkOLDw3winaJ0plBbSOXp9tPGbE=
X-Received: by 2002:a05:6830:154b:: with SMTP id
 l11mr2475621otp.322.1622789050492; 
 Thu, 03 Jun 2021 23:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210603150830.229423-1-judyhsiao@chromium.org>
 <CAD=FV=VzBgbhhVQvG+UGD2yaLJkwiq0qQHdFNQ2Ey8RKmV+qTg@mail.gmail.com>
In-Reply-To: <CAD=FV=VzBgbhhVQvG+UGD2yaLJkwiq0qQHdFNQ2Ey8RKmV+qTg@mail.gmail.com>
From: Judy Hsiao <judyhsiao@google.com>
Date: Fri, 4 Jun 2021 14:43:34 +0800
Message-ID: <CAJaago9842xqpHHfF2=6PJ3SfpzuYoQAicC5BJrTpB44SYBBuQ@mail.gmail.com>
Subject: Re: [v5] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture
 begin
To: Doug Anderson <dianders@chromium.org>
X-Mailman-Approved-At: Fri, 04 Jun 2021 11:08:39 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Taniya Das <tdas@codeaurora.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>
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

On Fri, Jun 4, 2021 at 6:41 AM Doug Anderson <dianders@chromium.org> wrote:

> Judy,
>
> On Thu, Jun 3, 2021 at 8:08 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
> >
> > @@ -315,12 +353,54 @@ static int lpass_cpu_daiops_trigger(struct
> snd_pcm_substream *substream,
> >         return ret;
> >  }
> >
> > +static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
> > +               struct snd_soc_dai *dai)
> > +{
> > +       struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> > +       struct lpaif_i2sctl *i2sctl = drvdata->i2sctl;
> > +       unsigned int id = dai->driver->id;
> > +       int ret;
> > +       /*
> > +        * Ensure lpass BCLK/LRCLK is enabled bit before playback/capture
> > +        * data flow starts. This allows other codec to have some delay
> before
> > +        * the data flow.
> > +        * (ex: to drop start up pop noise before capture starts).
> > +        */
>
> nit: there's usually a blank line between the variable declarations
> and the first line of code, even if the first line of code is a
> comment.
> Thanks, noted.
>
> > +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > +               ret = regmap_fields_write(i2sctl->spken, id,
> LPAIF_I2SCTL_SPKEN_ENABLE);
> > +       else
> > +               ret = regmap_fields_write(i2sctl->micen, id,
> LPAIF_I2SCTL_MICEN_ENABLE);
> > +
> > +       if (ret) {
> > +               dev_err(dai->dev, "error writing to i2sctl reg: %d\n",
> ret);
> > +               return ret;
> > +       }
> > +
> > +       /*
> > +        * Check mi2s_was_prepared before enabling BCLK as
> lpass_cpu_daiops_prepare can
> > +        * be called multiple times. It's paired with the clk_disable in
> > +        * lpass_cpu_daiops_shutdown.
> > +        */
> > +       if (!drvdata->mi2s_was_prepared[dai->driver->id]) {
> > +               drvdata->mi2s_was_prepared[dai->driver->id] = true;
> > +               ret = clk_enable(drvdata->mi2s_bit_clk[id]);
> > +               if (ret) {
> > +                       dev_err(dai->dev, "error in enabling mi2s bit
> clk: %d\n", ret);
> > +                       clk_disable(drvdata->mi2s_osr_clk[id]);
>
> Can you explain why this clk_disable() is here? Your function didn't
> turn this clock on, so why should it be turning it off in the error
> case?
>
The OSR CLK is disabled in the error case, not the BCLK.

>
>
> > +                       drvdata->mi2s_was_prepared[dai->driver->id] =
> false;
> > +                       return ret;
> > +               }
>
> Why not put the `drvdata->mi2s_was_prepared[dai->driver->id] = true;`
> _after_ you check for errors. Then you don't need to undo it in the
> error case.

Noted, thanks.

> I presume that your prepare() function isn't reentrant and
> can't be called at the same time as your shutdown (right?).
>
https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-pcm.c#L658
https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-pcm.c#L825
I think yes,
snd_soc_pcm_dai_prepare and snd_soc_dai_shutdown are both guard by
mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);

>
> Other than that, I don't have any objections to this patch anymore. I
> probably won't add a formal "Reviewed-by", though, since I _really_
> don't know anything about the issue at hand or the code. I just
> stumbled upon this because I was getting the clock splat at bootup. If
> someone feels like this needs me to spin up enough to understand /
> really review this patch then please yell.
>
> -Doug
>
