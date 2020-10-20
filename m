Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFF294287
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 20:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354DB172F;
	Tue, 20 Oct 2020 20:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354DB172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603220039;
	bh=UZNLonspBZqsWQ25WIlZU18DsVV9O+ggFbEDsQLS7xI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3OFKK2DOuCInIaPbIfZ3HYMWN0S09BTEbrWzQ9Kl1KPxjgey3UG90kmMGCSYyOo6
	 o1qwkoqVk+Y81pAm11wYJbs4B82dZK7161n2eghSSkX3DpYwB22LmGWUvRyy2yBsQE
	 EXTBir30c+Oi7pFQMq85d4gLQnKf00QdjPwDZQao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA7D1F804AC;
	Tue, 20 Oct 2020 20:52:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48741F804AB; Tue, 20 Oct 2020 20:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97D1AF8049C
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 20:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D1AF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dbg1dsuc"
Received: by mail-wr1-x443.google.com with SMTP id n18so3510408wrs.5
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jYFdycc4cemOIaYFUQzd2hjpOFiC6YIkhXB4IeoEDOc=;
 b=dbg1dsucJfSwBHh00T6Mc9TxIy2cA3D0xo1Vm098iBuTl3wM9obmhlk2Rgw+3Fe9DE
 lhn/KcJI0CzGJ6oaNtkW3L2DYRWLDfMqxzbcRxS7Ipt1zizebN8Dh7Zxgafe7FBS9DOS
 DhU2QoyTkvFT2KdsWGAohFct9ghNqDtSzxfoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jYFdycc4cemOIaYFUQzd2hjpOFiC6YIkhXB4IeoEDOc=;
 b=lj6FfC8PA21D8/9ppUJm7w1N0wYEy1Z2ZMngJf7KbyIxgBZj4svgAOG961ihFRNV8v
 rIIR1xLHFwP8vAg2MAikiWGA9V5RhZCnxK8Ln4gzuFLizFunZBBkoO5tVEJyjUBw9KP9
 baCJlZdj2TgVQxJVcESUw2gVAaj4oycrf0BrPfGy5TVSHBx1UKJXFG605rxI6wD+G7wF
 Y2n20ZtwpLEVkY3XYonQmicMlxXURbTVHC7ErJmheCs5aRCrLgu5OIsZBIuSryPxT8FG
 8NVhw4jhz0g7xg1JtifQz9ejclntEB+VRwtbZrVxjFJcmAsByki4TzvuiJTrVFoLjsnF
 BsGg==
X-Gm-Message-State: AOAM5326SjjXVKmGKDTzc307/JeglyCAlI70nLz2wpAyXbPP0gIMYFNo
 7JUmUNLURF/IiRak8j52tYDxlFSfe1vhzsbvU/Ssaw==
X-Google-Smtp-Source: ABdhPJzwG1O5oS9ghCKoJUxg59+XPLW7h0AAeoCd9EgHF2nhb1cMfI/IvqKJePI2HX9vcvnVxX2frJft2ThKtBNDJrA=
X-Received: by 2002:a5d:4001:: with SMTP id n1mr5162648wrp.426.1603219922351; 
 Tue, 20 Oct 2020 11:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
In-Reply-To: <20201020143711.GC9448@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 21 Oct 2020 02:51:33 +0800
Message-ID: <CAFv8NwKuLjLeM1KLeV8Br2TZC8L7DO6KWHL=pXvhAUV5+wSBPg@mail.gmail.com>
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

On Tue, Oct 20, 2020 at 10:37 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 20, 2020 at 09:37:05PM +0800, Cheng-yi Chiang wrote:
>
> > May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
> > machine driver for 2mic" ?
>
> > https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com
>
> > I think adding code in the machine driver makes the intent straightforward.
> > If we want the machine driver to be fully configurable,
> > we can always add more code to handle properties like gpio, route,
> > widget (mux, text selection) passed in from the device tree.
>
> If the device has both front and rear mics and only one can be active at
> once that seems obvious and sensible.  If the devices only have one of
> these then this seems like a bad idea.
>

trogdor board: only front mic.
pompom board: having both front mic and rear mic. Only one of them
will be used at a time. It is toggled by mixer control backed by a
gpio.

My proposed solution: instead of using compatible strings, expose only
dmic-gpio property.
When the machine driver sees this property, it uses the dapm widgets
and controls created in the machine driver.

> > But I feel that we don't need a machine driver to be that configurable
> > from the device tree.
> > I think having the logic scattered in various dtsi files and relying
> > on manual inspection to understand the usage would be less
> > maintainable than only exposing needed property like gpio.
> > Especially in the complicated case where we need to create a mux
> > widget with callback toggling the gpio like this:
>
> I don't understand what "logic scattered in various dtsi files" means,
> sorry.
>
I mean I don't want to use device property to pass in widget name,
type, text and callbacks.
Let me give an example:

- Board trogdor uses front mic, rt5682, and max98357a.
- Board pompom is based on board trogdor, but it has front mic and rear mic.
If we somehow managed to add the code to pass in widget, route, type,
text, and callbacks needed for dmic control, we will need to put a
bunch of properties in trogdor-pompom.dtsi file.
- Board ABC is based on trogdor as well, and it has front mic and rear
mic, but with a different speaker amp.

To use widget, route, type, text and callbacks for front mic and rear
mic, in trogdor-ABC.dtsi file we would copy some properties used in
trogdor-pompom.dtsi file. To support the different combination of
codec, we would need some modification of the route and widget.

Now the support of front mic and rear mic switch is scattered in
trogdor-ABC.dtsi and trogdor-pompom.dtsi files.
For example, when we change the code to parse or build the widget and
route, we need to fix both trogdor-pompom.dtsi and trogdor-ABC.dtsi.

Alternatively, if we only expose dmic-gpio property and put
surrounding code in the machine driver, we can use this dmic-gpio
property, plus the sound card name to identify the needed widget and
route.

> > Yes, that should work to describe the dailink we are using.
> > But a more tricky issue is how to do calls like setting PLL in dai startup ops.
>
> ...
>
> > I think that asking a generic machine driver to do configuration like
> > this with only a limited interface of device property
> > might be too much of an ask for the machine driver.
>
> Richard was looking at some basic configuration for PLLs.

That sounds promising. If we don't need to include the codec driver
header file explicitly, that can make machine drivers simpler.
Maybe for most of the simple cases we don't even need a dedicated
machine driver.

>
> > Would you mind if I simplify the compatible string like Srinivas
> > suggested, and send a v12?
>
> > As for other two kinds of variations that I am aware of:
>
> > 1. front mic / rear mic
> > 2. replace alc5682 with adau7002
>
> The CODEC change is going to be described in the DT no matter what -
> you'll have a reference to the CODEC node but it may make sense if
> there's enough custom code around it.  For front vs rear mic the
> simplest thing would just be to not mention which if this is a hardware
> fixed thing, otherwise a control.
>

Would you suggest checking whether the codec node is a rt5682 node,
and call required PLL calls accordingly ?

"For front vs rear mic the simplest thing would just be to not mention
which if this is a hardware fixed thing, otherwise a control."
Sorry I am not sure if I understand this correctly. Please correct me
if I am wrong.

- For default case having 1 mic: not mention this at all
- For front mic / rear mic case: see gpio property and use an
additional control.

> > We can set different board names and different compatible strings to
> > achieve such variation.
> > So that it would make sense to describe configuration in compatible
> > strings like you suggested, and also provides UCM a way to distinguish
> > different boards.
>
> I don't recall having suggested distinguishing these things with a
> compatible string, especially not the microphones.  UCM can already use
> the display names for the boards to distinguish things.

My apology that I made the wrong interpretation when I read your reply
"These feel more like things that fit with compatible" regarding
replacing alc5682 with adau7002. Please let me know which one solution
you prefer:
-  deriving this information from codec node
-  deriving this information from different sound card name

Thanks so much!
