Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1739227EF9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 13:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6005B16AD;
	Tue, 21 Jul 2020 13:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6005B16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595331136;
	bh=u9LEuAAOGFD89FV8+kf9UWaz3Rn1GTHC1JcZrQhNTYE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GodmgHk/UOnAP2ycTZ7pXnPoygHqQM882s6xI1STL2Ifrsn0WxfMAiHGdvsj4YHxF
	 c/ukwmgZNoDQHi4vKxJnyiZOolV0JXtDtPod1zEI9XeAC0e5V6tVfJ5DvBIAC7+kZi
	 cWSOegCJsbPoE4vGzP57ZEXeaG6P18ORHtDgT//c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA43F80268;
	Tue, 21 Jul 2020 13:30:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 003E0F8024A; Tue, 21 Jul 2020 13:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DDACF80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 13:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDACF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZnnrxRa4"
Received: by mail-wr1-x444.google.com with SMTP id a15so5897194wrh.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 04:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDCzyRG0rg1IT+D0XJL6mCguANQqA8rXobavVZvW96Y=;
 b=ZnnrxRa4si/xuCUdSQINme4yglZDejh1OO0DnrcmRn5h18itVyWY4KRvRkI/WNZ/Ll
 E/VPLadw2MbujNKNCVgXWitzmPWRAKdk5XTCel3V5qpcX6FGrqmGTmm4p15DMboso/NS
 FV4C1to8Pfy/qNsRbWTocSYQZzf6KtgCql62o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDCzyRG0rg1IT+D0XJL6mCguANQqA8rXobavVZvW96Y=;
 b=NcWRNXvBi1NUml0d1b/kUNu78tXVdQGRl7HyDVPuE+4ux0/LCtJ7p2QPEvdMRrk7E3
 NgTAVKYx5F9XkRit2rhc8AZWGxEnQ0SPtGI8ie5jaXn8flTt3gjyeYbIyFudruC3vxEv
 H6T6/VPqbWcgdfFFBnJMA4Ixy+CMI30FhWNiLDFsIDXrCMavub0a5MLmI3lq7ZnPkUag
 FYmumO1eBGwxTydsloKvzPw89sZS5TD/FIXnhkEnz6bLSC6R7+9wD/cgcxt7dd6Me0Su
 fc7Ssdx3ZmGpIl8Yatm/6610CCaDQtzSHWYnFyCe6npWdJQOuK3mOJxV9vT9hQPPFJFM
 fyHA==
X-Gm-Message-State: AOAM533RXz1peAavg6gRpQmM9gIqqABeZzriDOCaoHbOxp/WJBLpfXGl
 Co088KivNMXj7EgDOwVBvZ3dhFokbbtbltDcQDviJQ==
X-Google-Smtp-Source: ABdhPJwbrVnmzJ0PnXN6sJ8jR7GyGTkbutQcRFVK+AheZaDBzYwZNbSJrjKJ1Gle1sfdgNlgwcpeGqJ0VnvJV9KH3Mw=
X-Received: by 2002:a05:6000:1209:: with SMTP id
 e9mr12809989wrx.404.1595331021943; 
 Tue, 21 Jul 2020 04:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200717120207.3471030-1-cychiang@chromium.org>
 <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 21 Jul 2020 19:29:55 +0800
Message-ID: <CAFv8NwLpVCy4CY8_h0qd7aAEPmaKa3gQYmA3sT1b9fs6fxwtLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
 Dylan Reid <dgreid@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Fri, Jul 17, 2020 at 11:03 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>

Thanks for the review!

> On Fri, Jul 17, 2020 at 5:02 AM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
>
> A bit of a mechanical review since my audio knowledge is not strong.
>
>
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..d60d2880d991
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > +
> > +maintainers:
> > +  - Rohit kumar <rohitkr@codeaurora.org>
> > +  - Cheng-Yi Chiang <cychiang@chromium.org>
> > +
> > +description: |
> > +  This binding describes the SC7180 sound card, which uses LPASS for audio.
>
> nit: you don't need the pipe at the end of the "description" line.
> That means that newlines are important and you don't need it.
>
>
Thanks for the explanation. Fixed in v2.
> > +definitions:
>
> I haven't yet seen much yaml using definitions like this.  It feels
> like overkill for some of these properties, especially ones that are
> only ever used once in the "properties:" section and are/or are really
> simple.
>
>
ACK. In v2 I only kept dai definition and removed others.

> > +  link-name:
> > +    description: Indicates dai-link name and PCM stream name.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    maxItems: 1
> > +
> > +  dai:
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        maxItems: 1
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: phandle array of the codec or CPU DAI
> > +
> > +    required:
> > +      - sound-dai
> > +
> > +  unidirectional:
> > +    description: Specify direction of unidirectional dai link.
> > +                 0 for playback only. 1 for capture only.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> So if the property isn't there then it's _not_ unidirectional and if
> it is there then this specifies the direction, right?  I almost wonder
> if this should just be two boolean properties, like:
>
> playback-only;
> capture-only;
>
> ...but I guess I'd leave it to Rob and/or Mark to say what they liked
> better.  In any case if you keep it how you have it then you should
> use yaml to force it to be either 0 or 1 if present.
>
>
ACK
Use playback-only and capture-only in v2 instead.

> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      enum:
> > +        - qcom,sc7180-sndcard
>
> Just:
>
> properties:
>   compatible:
>     const: qcom,sc7180-sndcard
>
>

Fixed in v2.

>
> > +  audio-routing:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |-
> > +      A list of the connections between audio components. Each entry is a
> > +      pair of strings, the first being the connection's sink, the second
> > +      being the connection's source.
>
> You don't need the "|-" after the "description:".  That says newlines
> are important but strip the newline from the end.
>
Fixed in v2.
>
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +patternProperties:
> > +  "^dai-link-[0-9]+$":
> > +    description: |
> > +      Each subnode represents a dai link. Subnodes of each dai links would be
> > +      cpu/codec dais.
>
> From looking at "simple-card.yaml", I'm gonna guess that instead of
> encoding the link number in the name of the node that you should
> actually use a unit address and a reg in the subnodes.

Thanks for the explanation. Fixed in v2.
I think this naming is better, although there is no usage in the
machine driver for the reg.

>
> ...also, again your description doesn't need the "|" at the end.
> Maybe <https://yaml-multiline.info/> will be useful to you?
>
>

Thanks for the explanation and the pointer!

> > +    type: object
> > +
> > +    properties:
> > +      link-name:
> > +        $ref: "#/definitions/link-name"
> > +
> > +      unidirectional:
> > +        $ref: "#/definitions/unidirectional"
> > +
> > +      cpu:
> > +        $ref: "#/definitions/dai"
> > +
> > +      codec:
> > +        $ref: "#/definitions/dai"
> > +
> > +    required:
> > +      - link-name
> > +      - cpu
> > +      - codec
> > +
> > +    additionalProperties: false
> > +
> > +examples:
> > +
> > +  - |
> > +    snd {
>
> Can you use the full node name "sound" here?
>
>
Fixed in v2.
> > +        compatible = "qcom,sc7180-sndcard";
> > +        model = "sc7180-snd-card";
> > +
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&sec_mi2s_active &sec_mi2s_dout_active
> > +                     &sec_mi2s_ws_active &pri_mi2s_active
> > +                     &pri_mi2s_dout_active &pri_mi2s_ws_active
> > +                     &pri_mi2s_din_active &pri_mi2s_mclk_active>;
>
> I think pinctrl is usually not in the dt examples.
>
Fixed in v2.

> ...also, shouldn't the mi2s pinctrl be in the i2s nodes, not in the
> overall sound node?

Yes. Thanks for pointing this out. Fixed in dts file in chromium.

>
>
> > +        audio-routing =
> > +                    "Headphone Jack", "HPOL",
> > +                    "Headphone Jack", "HPOR";
> > +
> > +        dai-link-0 {
> > +            link-name = "MultiMedia0";
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 0>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&alc5682 0>;
> > +            };
> > +        };
> > +
> > +        dai-link-1 {
> > +            link-name = "MultiMedia1";
> > +            unidirectional = <0>;
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 1>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&max98357a>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.28.0.rc0.105.gf9edc3c819-goog
> >
