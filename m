Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C823A132
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 10:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A961669;
	Mon,  3 Aug 2020 10:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A961669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596444142;
	bh=s7TeGvLgT1PyT8cinSBVpAu52TQvntv8EogDQydQjp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P+RJ4lBckBlVdgftnk9rA0Qa/ZBKeumRTrnKIVHWM8Rhdv27shpjjlGVE5LTxainh
	 3rpfLKCm+CqzzEYdEmg8xTI9NTmIlkmAEODXoexPQQMwqrfgl7QuCCzUo+o3vFTWmh
	 4mXZIvC+aIp6uaqPz4kp3dsXoOYhSaK8R+hMs92Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82B02F80148;
	Mon,  3 Aug 2020 10:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A9C2F80218; Mon,  3 Aug 2020 10:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E821BF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 10:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E821BF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Bw8H8gOu"
Received: by mail-wm1-x342.google.com with SMTP id c19so3325035wmd.1
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cq5+lj+HxdPKUksR7gRNmns7ju/WhDWUsP3NFKOReq8=;
 b=Bw8H8gOuWbx14/g/EG6O1Y8+gAH1srU5wsQImYaHnDeDvfgbsnQKLIlyY2i6Yk44la
 kqnaNemfWLvh+APs8IfLgZPvzxWXxtXUuHX7Ic8rW+ccSp6HA2zUh8KrW1aoQICqaqJq
 DX4cOJ6oyKiLOXjJwV24MKgUSxxNtoZN9DJvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cq5+lj+HxdPKUksR7gRNmns7ju/WhDWUsP3NFKOReq8=;
 b=DASvvdOQqFtflRQcPyiULBeeLhZ0dD6gjxoX25qD/4qQd/mjTRmwFScU2JJoJWp5kp
 l00HVM2ETYQIzl2DPUeM9UOKQjnMCgBcaVtrwsFh5Xw5sv6+50ukP1MQQOJ2yBHuHDk+
 k0lkcUtV1eypHAy3ittyxsK5O2WxKVcDp8y7De6iWIAeEz+o1u84nNT/tKlsI9NbXwXU
 MA3PvBkEkcNDLVjR56GEjNUbL5c+RtovSiZKh0WuZ7ySB2aeopkb+uL/CisSmvGbxj4m
 B1Lo28iWfUYKUyPXdeYJeFTqJ4mQOcMODiNSkQGqrTboKXIUxxq1hS6d+vSM4ISdlkQP
 7SKw==
X-Gm-Message-State: AOAM532FU9db3sBM2LWmKZv8k//8dnji5sSZDB9HhRCgd9k4YS3CM1Yb
 lkAXCcaLu9Qr1M+2zXcW3+89+YlTd42huqqRSm7ONg==
X-Google-Smtp-Source: ABdhPJyAahynHEVEn2oNVJMFau2e96vW5t5i5ugRhfFM5wveqNbnogUdLR+Dmsz70dO7HSAwUKUwpj9F129+6y4tr7I=
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr14528398wmh.42.1596444027706; 
 Mon, 03 Aug 2020 01:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200731084023.2678931-1-cychiang@chromium.org>
 <20200731084023.2678931-2-cychiang@chromium.org>
 <20200731183248.GB531472@bogus>
In-Reply-To: <20200731183248.GB531472@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 3 Aug 2020 16:40:00 +0800
Message-ID: <CAFv8Nw+e=tO+720-CDXy2Fk84qxk2C2Tbrh19ngmsBRY4D1M1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Dylan Reid <dgreid@chromium.org>,
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

On Sat, Aug 1, 2020 at 2:32 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jul 31, 2020 at 04:40:22PM +0800, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 113 ++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..ce8a5a2d9df9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,113 @@
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
> > +description:
> > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > +
> > +definitions:
>
> Please don't use 'definitions'. Either just duplicate it or you can do
> 'patternProperties'.
>
Removed dai definition in v4.
> > +
> > +  dai:
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        maxItems: 1
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        description: phandle array of the codec or CPU DAI
>
> This is a common property. You can assume we have a common schema
> definition for it. IOW, 'sound-dai: true' is enough as it's always a
> single phandle+args.
>
In the examples I found,
Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml,
Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
use:

      sound-dai:
        $ref: /schemas/types.yaml#/definitions/phandle
        description: phandle of the CPU DAI

Documentation/devicetree/bindings/sound/simple-card.yaml
just use

      sound-dai:
        maxItems: 1

In v4, I used 'sound-dai: true' as suggested.

But I am a bit confused about assuming there is a common schema
definition for it.
I checked the code at https://github.com/devicetree-org/dt-schema but
did not found the definition for it.
Did I miss something here ?

Thanks for the help!

> > +
> > +    required:
> > +      - sound-dai
> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      const: qcom,sc7180-sndcard
> > +
> > +  audio-routing:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      A list of the connections between audio components. Each entry is a
> > +      pair of strings, the first being the connection's sink, the second
> > +      being the connection's source.
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  aux-dev:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the codec for headset detection
> > +
> > +patternProperties:
> > +  "^dai-link(@[0-9]+)?$":
> > +    description:
> > +      Each subnode represents a dai link. Subnodes of each dai links would be
> > +      cpu/codec dais.
> > +
> > +    type: object
> > +
> > +    properties:
> > +      link-name:
> > +        description: Indicates dai-link name and PCM stream name.
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        maxItems: 1
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
> > +    sound {
> > +        compatible = "qcom,sc7180-sndcard";
> > +        model = "sc7180-snd-card";
> > +
> > +        audio-routing =
> > +                    "Headphone Jack", "HPOL",
> > +                    "Headphone Jack", "HPOR";
> > +
> > +        aux-dev = <&alc5682>;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        dai-link@0 {
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
> > +        dai-link@1 {
> > +            link-name = "MultiMedia1";
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
> > 2.28.0.163.g6104cc2f0b6-goog
> >
