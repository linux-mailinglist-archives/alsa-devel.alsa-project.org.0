Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9013C2A287F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 11:47:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8F416F7;
	Mon,  2 Nov 2020 11:47:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8F416F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604314075;
	bh=Z92vQUuAE8bfEoOcK60/nDs/n+Go8ta1H+ZPtxpdUK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvVxRX9V5pPyqpgWijluLWK8ZMgriCJ2jshy7hkEnZOxlwRCPsQ52Vw2pptPZ5pAs
	 fMfBTcViigbDZ+96jrzzfii4IsrmsvlH+/61acE10LNJ5PVhRZj2OWXOycpM1t3r7b
	 k0JObkVBfL1fcd8u5C1FAU06MkucaqIpO6hJs30k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC0AF8012B;
	Mon,  2 Nov 2020 11:46:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEBB6F80232; Mon,  2 Nov 2020 11:46:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC58DF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 11:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC58DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JbF7Xzcx"
Received: by mail-io1-xd42.google.com with SMTP id n12so2796637ioc.2
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 02:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VRpjL02zuTcuiv/Rvb/qTyae7wJ0n/tsrDk8nGGEoq0=;
 b=JbF7Xzcx6Wu8FIV7/iG4L8/z373ZoWlCO6auRph8RxolPKUCY1c9JzvvbI3Ea8+Uwf
 623DoaDsaJKCpWEQpXNj98q9gCj1aDehvtpItUkRrmtnB8aAV6mbbK04ddWHMkKMYtl7
 4oFJG1NT4N39UbIQ64IZIa0hXFMu0mTCuVoaXGy4E2hUE7fq1sNC37u1OnLRK+srC62G
 gfLCwVF7Pxw1UMQ/VlJ9hmuYmHSRgkVb/yWTy7xhVu91Rqz72oua6GOBx3TI2A2tO1oE
 MW6MhUJSrVNgZbnseXvs+TSZ8ZsJonOti3crmrOCtAmx7l1ybcV9Qx+yIWni9YtIGJ0B
 y6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VRpjL02zuTcuiv/Rvb/qTyae7wJ0n/tsrDk8nGGEoq0=;
 b=BS66H1KbufKAQwVn11Mf6r5Zjkb34G9s7HBXKaakliCnfI/xUAjVLtPDIX9AzpbBxK
 Ak17AmcfLg3ZuHJOk0NWTnQkv9MEfdW4cNHfliK3G9eqqe0tTqlDVVVlMYEL3jfVOIxv
 JkUNQVFACho1uJ1gBia6GwIIE+Ww1XXAEHT90sIjMgxI+1WmqY7QNj3tzaYhVvUN83Xk
 c77Gehzoj0vsCGLb4eIqstUFE+4c5fuop5R/qEiyw6fvr1JAjFPkOMcxtzsMZ6MlApFC
 yCTGFDoIXbmqOjCjMvDOIuqWQ/oPY0g8r1BEfm+jEfMswyndBuKwXEN2wb5erCIH5ete
 I+2A==
X-Gm-Message-State: AOAM530KCKR2BdfaNJH1QLamBytEjj2x5Pjt47rwkV6ipKvZFcOXtnQR
 OeSEbWpsOiKqbIgAZpQ6UQK7YB3fBqH35ahLAxDWgQ==
X-Google-Smtp-Source: ABdhPJxKwVLNAuofbLNcJ13qTFoIFIxwQPlrQC3KzP9RuGcr//5ixy6TdSJ29X5luQ0fmV1hraBbt8Ty1Pv6VXZ7MzI=
X-Received: by 2002:a6b:7a0b:: with SMTP id h11mr2777649iom.76.1604313974919; 
 Mon, 02 Nov 2020 02:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
 <20201102062408.331572-3-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201102062408.331572-3-ajye_huang@compal.corp-partner.google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 2 Nov 2020 18:46:04 +0800
Message-ID: <CA+Px+wV9Lmdphp4iMgF1d72vewb2m9aiZzywvavLGgtkAczCDQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To: Ajye Huang <ajye.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
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

On Mon, Nov 2, 2020 at 2:24 PM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> In addition, having mixer control to switch between DMICs by
> using "dmic-gpios" property.
>
> Refer to this one as an example,
> commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

I am not sure if it would be better if you use another email (e.g.
@gmail) for signoff.

> +static int dmic_get(struct snd_kcontrol *kcontrol,
> +                   struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
> +
> +       if (data)

You don't need to check for NULL.  If snd_soc_card_get_drvdata()
returns NULL, it shouldn't run into here.  See other
snd_soc_card_get_drvdata() calls in the file.

> +static int dmic_set(struct snd_kcontrol *kcontrol,
> +                   struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
> +
> +       if (data) {

Ditto.

> +               if (IS_ERR(data->dmic_sel)) {
> +                       dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
> +                               PTR_ERR(data->dmic_sel));
> +                               return PTR_ERR(data->dmic_sel);

Remove 1 level indent.
