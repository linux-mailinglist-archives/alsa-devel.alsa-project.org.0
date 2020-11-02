Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD862A2C5D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 15:15:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A391709;
	Mon,  2 Nov 2020 15:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A391709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604326537;
	bh=KzkPibOsFDyCp+HUXw881QpMJO8KttiDpWptfqyTzBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zze9gZrmOL9odvXGS56MXUad8nhDokTdOi1FLA6E4fknazyEojY2PX9YPPMp7FEQ/
	 QRniy7qUAvusZT6VR52SR3yTrKlPJ6UNcLeo4Mv4YJPOw7r6Qe7mJ80UAbJwTkCRnl
	 dZv0uBsSXhVzpdnV7hKxnTVhgpry4ernQpF1bioA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B76F80083;
	Mon,  2 Nov 2020 15:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10C7AF80083; Mon,  2 Nov 2020 15:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A45F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A45F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ZM4LaTgz"
Received: by mail-lf1-x141.google.com with SMTP id f9so17669965lfq.2
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 06:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxbCraeiLdRhhJpaK4sNkK6tPwuu92CTTqqZ8+wCJio=;
 b=ZM4LaTgzml5bUPWSYTKj3diGMPNamkdpShH5l8t1VMnmUehipaDrX71br6RaGOveNc
 /yl8Xzi0wn8Cxlsb498dQw5DOCL5LLMqIUxozIqEL8Jv/Dfj/H+Bb9yIVxfgwO2Qgwq3
 eUytQo5ExrWGWR6O4ZESs3SNl+spxTGTn5gsYW9CwiSsMuMHxhVbhV+NhCgL3wDzIWn4
 Ht6OUKJNYAkn1Hfq3yRM9OUyYjva3aGEPid7gLU80nOcfW8sb4adbwyvbbNYDBFH4WqG
 26EaYiNDR9YIwdHeFIDLSJilMRqoe/8Z2OeUaLrrI1jXOwP2uh3xV7We0sPiS4LFhUPm
 1lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxbCraeiLdRhhJpaK4sNkK6tPwuu92CTTqqZ8+wCJio=;
 b=RX3O9ucv3KXb2avQ1VdYn4bVkoWjWLkLUSWBuOub5muEqge/3IpMWkhxnrW5F2CE00
 FBXVbQuE9G6ZnO53TkTBLCwKaGMpBVn/0TxXoO1e4DgXwrefXka/s5tuE8kT0WUo/5fy
 CR7zxv5fpbp1Hmk6AuIhhjPPFL2Vk82C+Wn/ppw/41a5A1ZjAIlBTyooFyYPMZ9Jp3DD
 1lcaIVP+6wIgOI19j5sgCpE1w6ISu3Uy7csOasIf+AmKXxNqfRh/orIhBxsY6QlutN1O
 NYKwk2t4M+1cFXFi7FlD+k4pgYqapafnrAU9uydWQ3c2WFGYhq1xwnDfeMNwh8WGUGBI
 XW/A==
X-Gm-Message-State: AOAM533RjPySmAsUHVr5TKUkkw6pMe10FHdpBfOTDhCf6J0qdbJ2zUwS
 hdviAJahO47Y2cxYvR3UspO2FD/c3+rFg1LTZ+jkqA==
X-Google-Smtp-Source: ABdhPJzqeipx/W1I0SHKEcjfqh+sscD2n/q6sWL0P3hkangcPzWHpBBKHArZunBT2LjnW+rq6DfD3qni7BR6JlMFOpE=
X-Received: by 2002:a19:a56:: with SMTP id 83mr4927665lfk.131.1604326435967;
 Mon, 02 Nov 2020 06:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
 <20201102062408.331572-3-ajye_huang@compal.corp-partner.google.com>
 <CA+Px+wV9Lmdphp4iMgF1d72vewb2m9aiZzywvavLGgtkAczCDQ@mail.gmail.com>
In-Reply-To: <CA+Px+wV9Lmdphp4iMgF1d72vewb2m9aiZzywvavLGgtkAczCDQ@mail.gmail.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 2 Nov 2020 22:13:45 +0800
Message-ID: <CALprXBZ-nO5NtgEeS+G4bhE=EHcwvtZOOa67ea4k=CXyT+JpJg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Mon, Nov 2, 2020 at 6:46 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Nov 2, 2020 at 2:24 PM Ajye Huang <ajye.huang@gmail.com> wrote:
> >
> > In addition, having mixer control to switch between DMICs by
> > using "dmic-gpios" property.
> >
> > Refer to this one as an example,
> > commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")
> >
> > Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>
> I am not sure if it would be better if you use another email (e.g.
> @gmail) for signoff.
>
hi, Tzung-Bi
Thank you for your review, it's our company's rule to use  this PD account

> > +static int dmic_get(struct snd_kcontrol *kcontrol,
> > +                   struct snd_ctl_elem_value *ucontrol)
> > +{
> > +       struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> > +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
> > +
> > +       if (data)
>
> You don't need to check for NULL.  If snd_soc_card_get_drvdata()
> returns NULL, it shouldn't run into here.  See other
> snd_soc_card_get_drvdata() calls in the file.
>
your are right, I will remove on v4

> > +static int dmic_set(struct snd_kcontrol *kcontrol,
> > +                   struct snd_ctl_elem_value *ucontrol)
> > +{
> > +       struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> > +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
> > +
> > +       if (data) {
>
> Ditto.
>
I will remove it on v4

> > +               if (IS_ERR(data->dmic_sel)) {
> > +                       dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
> > +                               PTR_ERR(data->dmic_sel));
> > +                               return PTR_ERR(data->dmic_sel);
>
> Remove 1 level indent.
Your are really attentive, I will remove the indent on v4, thank you so much.
