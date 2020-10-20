Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D67293D76
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 15:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEED61723;
	Tue, 20 Oct 2020 15:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEED61723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603201165;
	bh=flW6cyKMebei88/lQQ7mZQ1TrWlLlASz/wk+DvFsozE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E793eP2UE87EX0B9+yGY+/IZ2LojnxOi9idU6C6kUUhuVoGz/QMKc0MBpnJ1DuKLh
	 te1P+prWfAhn/ti+xynXQka1/RYBXRf5WSil5CZgdepBUMxP9TsVHFslJZzaQQSN2C
	 Y2HFyEmfjLp2It6VZSqPE+Sn1qeVkFgx2UBQWCeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37200F80216;
	Tue, 20 Oct 2020 15:37:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03412F801F2; Tue, 20 Oct 2020 15:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F859F8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 15:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F859F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TPK9GUXw"
Received: by mail-wr1-x444.google.com with SMTP id e17so2161569wru.12
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dd/4tB1jhfJBU76uhWYvJK/M1Y4WZsbkyJFSG8k8QQo=;
 b=TPK9GUXwppf2mM1kCN3ve/x60CKUztqZ+989Nh8aqFSLGa+l7mbzE/LqA70BHIvGZz
 9t62mD+eV+mTcXERLQfsqGiscvH12E6jUFihaaN9G4Q/H5OP5vn/D7cAcdZLOAKnGAP4
 3CcOZMOSIaLcag5ahYLat4UtdM8iVyx44UW/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dd/4tB1jhfJBU76uhWYvJK/M1Y4WZsbkyJFSG8k8QQo=;
 b=H+oc+AYVcJnLRSSHKmzBBNi6WAwdWknWG9a9eF6HH/NdKFrxEmsTgxrTwTnGcErB3t
 iAxz8VCQzWLgAf3ioROacuA8QGKDEvxrPv8c92whjBGt8vwPAKGncppMALhzyxPtFPXN
 fqp+2CNfXv9mkTIqdieWmmWTyJqkkbDgWX0cCFqz6kiEjakF9gKcEh5X9aPCk4DAY+Ep
 OH64KCvD7lNrm+h1L++3ImQGNUxeImAhWq5267TOHxEoa3W/jhK3l6Iw/laiLdkQ2Ad2
 ADAyqjgsTSO/KM0lItFLiCpNlk7RsHwAfHf37Qq54rzm9DJLe/fDFso64gq1572xJjlA
 /WPA==
X-Gm-Message-State: AOAM533GW5JJR7PNPMDn7dY0v7O3daxNGF5sqAJZkDGisHeXytcW7SIr
 iMVuxDcVN36QojNJJE7LhgqudFOHRm3+htM221roXQ==
X-Google-Smtp-Source: ABdhPJxbiebIvIYWJ8VjSbDQyhf4y6aT7O3DnC5CYOzHre4Bqv+imNt5qgF8Ub9UZZ8/En/AxSVEIthwU9StfwKT0vc=
X-Received: by 2002:adf:cc82:: with SMTP id p2mr3646265wrj.177.1603201052544; 
 Tue, 20 Oct 2020 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
In-Reply-To: <20201015161251.GF4390@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 20 Oct 2020 21:37:05 +0800
Message-ID: <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Fri, Oct 16, 2020 at 12:13 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 15, 2020 at 03:59:26PM +0800, Cheng-yi Chiang wrote:
> > On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla
>
> > > > +properties:
> > > > +  compatible:
> > > > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
>
> > > This information can come from the dai link description itself, why
> > > should compatible string have this information?
>
> > I think dailink description is not enough to specify everything
> > machine driver needs to know.
> > E.g. there is a variation where there are front mic and rear mic. We
> > need to tell the machine driver about it so
> > it can create proper widget, route, and controls.
>
> That sounds like something that could be better described with
> properties (including for example the existing bindings used for setting
> up things like analogue outputs and DAPM routes)?
>

Hi Mark, thank you for the comments.

May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
machine driver for 2mic" ?

https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com

I think adding code in the machine driver makes the intent straightforward.
If we want the machine driver to be fully configurable,
we can always add more code to handle properties like gpio, route,
widget (mux, text selection) passed in from the device tree.
But I feel that we don't need a machine driver to be that configurable
from the device tree.
I think having the logic scattered in various dtsi files and relying
on manual inspection to understand the usage would be less
maintainable than only exposing needed property like gpio.
Especially in the complicated case where we need to create a mux
widget with callback toggling the gpio like this:

+static const char * const dmic_mux_text[] = {
+       "Front Mic",
+       "Rear Mic",
+};
+
+static SOC_ENUM_SINGLE_DECL(sc7180_dmic_enum,
+                           SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new sc7180_dmic_mux_control =
+       SOC_DAPM_ENUM_EXT("DMIC Select Mux", sc7180_dmic_enum,
+                         dmic_get, dmic_set);
+
+SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &sc7180_dmic_mux_control),

Passing all the logic along with the callback of dmic_get, dmic_set
from the device tree would be too hard to maintain.

> > The codec combination also matters. There will be a variation where
> > rt5682 is replaced with adau7002 for dmic.
> > Although machine driver can derive some information by looking at dailink,
> > I think specifying it explicitly in the compatible string is easier to
> > tell what machine driver should do, e.g.
> > setting PLL related to rt5682 or not.
>
> These feel more like things that fit with compatible, though please take
> a look at Morimoto-san's (CCed) work on generic sound cards for more
> complex devices:
>
>    https://lore.kernel.org/alsa-devel/87imbeybq5.wl-kuninori.morimoto.gx@renesas.com/
>
> This is not yet implemented but it'd be good to make sure that the
> Qualcomm systems can be handled too in future.

Yes, that should work to describe the dailink we are using.
But a more tricky issue is how to do calls like setting PLL in dai startup ops.

                /* Configure PLL1 for codec */
                ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
                                          DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);

I think that asking a generic machine driver to do configuration like
this with only a limited interface of device property
might be too much of an ask for the machine driver.

>
> > You can see widget, route, controls are used according to the configuration.
> > The alternative approach is to check whether "dmic-gpio" property
> > exists to decide adding these stuff or not.
> > But it makes the intent less easier to understand.
>
> OTOH if you have lots of compatibles then it can get hard to work out
> exactly which one corresponds to a given board.

Totally agree. Glad we have only three variations up to now.

Would you mind if I simplify the compatible string like Srinivas
suggested, and send a v12?

As for other two kinds of variations that I am aware of:

1. front mic / rear mic
2. replace alc5682 with adau7002

We can set different board names and different compatible strings to
achieve such variation.
So that it would make sense to describe configuration in compatible
strings like you suggested, and also provides UCM a way to distinguish
different boards.
What do you think ?

Thanks!
