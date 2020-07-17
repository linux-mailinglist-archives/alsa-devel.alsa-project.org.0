Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC7A223F0F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 17:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 233121615;
	Fri, 17 Jul 2020 17:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 233121615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594998234;
	bh=8sDjfq/IG2PDXRYJmC55H23rgSfCu/D3F3sS0XGudkw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGvTPl5cGYdanqj5B8MpVNJI4CYsBY2ku33/cwuUyxDiCsiGW1VHfT5kVfaqba0JK
	 1yBSOs2QJ6bj2eOSE9l7Xg733vaRYQXWs7+Y2S6WeE0JXwNEKJ+TiUdeHPBndQSJvp
	 DK/YTAEHAL3vn6vXh9CnS4IrvcD2BlQgFKcFkqGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4D9F80110;
	Fri, 17 Jul 2020 17:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73921F80217; Fri, 17 Jul 2020 17:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF4CF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 17:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF4CF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YooeeixG"
Received: by mail-vk1-xa44.google.com with SMTP id q85so2179652vke.4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Aj8c3ItAShnnsLNIQ3E8MXZ0tu8sMgycVZ8H2IhzgY=;
 b=YooeeixG0/jkhNIRHh3/Ok41dsT/OX3z2lbp1dsvYYWgOvjgGAeQzWt4/nwPKnz3Mv
 uXq028FmcWMT8/xVvpnT5J5b/dVVSVDK5eofaCaIcodv7fnB3wrg/uKVe0+25lcrLv/3
 WamTri+dPxncC4RrX/4vmXrs97xe8dnN1V6/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Aj8c3ItAShnnsLNIQ3E8MXZ0tu8sMgycVZ8H2IhzgY=;
 b=jYGxp/oRTzmuLj9B4F294jQJesvoGJ7ZkJpeTeqOZOdVwjbfkKC3Jlg10zS4PFgi9f
 XY7GNpptlWNUeYM3XpG4TYAmXxoKo/sc1k+Axq+V9swXf64HAXVMqntDpvEOYWZp38ES
 4feEbOk0KWtko5ofbbjS0JRD4Cus1ehG2q/HN+WdXmZ0y8oDkx78JhZQ4xhm/uA/F+I3
 06nsEsWZJgEnEt8d9ms46Wyq/hNTmeo1dkEs7XpjO+nZNyFUw44BDitvYxTAbvczJJle
 hNx/T0u/Ji9szzO+SbFvlkrz0gsCAbbkNb5m9rWbf5rIBtWjQWr90G0cJWv0OKXDRS6x
 EYEA==
X-Gm-Message-State: AOAM531oc9e9ZGIA1Etal4/7nMb00RhNQ9Q2fH36vd3YvRGMZB3m2rvF
 zHOsEgtaka16CZtf/88n8uG1jlGo0Yo=
X-Google-Smtp-Source: ABdhPJz1HUG9pteU4EGaLZ6hMBt5CjN2BKtIeT0jB34q3Hfc+eDsPyGFtVHu85vfsFSUgxR2qhaccw==
X-Received: by 2002:ac5:c912:: with SMTP id t18mr7583896vkl.54.1594998121520; 
 Fri, 17 Jul 2020 08:02:01 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id a71sm995936vsd.12.2020.07.17.08.02.00
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 08:02:00 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id m21so2179855vkp.1
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 08:02:00 -0700 (PDT)
X-Received: by 2002:a1f:3d4a:: with SMTP id k71mr7624402vka.65.1594998119832; 
 Fri, 17 Jul 2020 08:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200717120207.3471030-1-cychiang@chromium.org>
In-Reply-To: <20200717120207.3471030-1-cychiang@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 08:01:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
Message-ID: <CAD=FV=XFayyvT-b9C3f4pXNkboH7kb7ikyi9qJxmNvowOfkjqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
To: Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 tzungbi@chromium.org, Dylan Reid <dgreid@chromium.org>,
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

Hi,

On Fri, Jul 17, 2020 at 5:02 AM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> Add devicetree bindings documentation file for sc7180 sound card.
>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)

A bit of a mechanical review since my audio knowledge is not strong.


>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> new file mode 100644
> index 000000000000..d60d2880d991
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang <cychiang@chromium.org>
> +
> +description: |
> +  This binding describes the SC7180 sound card, which uses LPASS for audio.

nit: you don't need the pipe at the end of the "description" line.
That means that newlines are important and you don't need it.


> +definitions:

I haven't yet seen much yaml using definitions like this.  It feels
like overkill for some of these properties, especially ones that are
only ever used once in the "properties:" section and are/or are really
simple.


> +  link-name:
> +    description: Indicates dai-link name and PCM stream name.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    maxItems: 1
> +
> +  dai:
> +    type: object
> +    properties:
> +      sound-dai:
> +        maxItems: 1
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: phandle array of the codec or CPU DAI
> +
> +    required:
> +      - sound-dai
> +
> +  unidirectional:
> +    description: Specify direction of unidirectional dai link.
> +                 0 for playback only. 1 for capture only.
> +    $ref: /schemas/types.yaml#/definitions/uint32

So if the property isn't there then it's _not_ unidirectional and if
it is there then this specifies the direction, right?  I almost wonder
if this should just be two boolean properties, like:

playback-only;
capture-only;

...but I guess I'd leave it to Rob and/or Mark to say what they liked
better.  In any case if you keep it how you have it then you should
use yaml to force it to be either 0 or 1 if present.


> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - qcom,sc7180-sndcard

Just:

properties:
  compatible:
    const: qcom,sc7180-sndcard



> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |-
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.

You don't need the "|-" after the "description:".  That says newlines
are important but strip the newline from the end.


> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +patternProperties:
> +  "^dai-link-[0-9]+$":
> +    description: |
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.

From looking at "simple-card.yaml", I'm gonna guess that instead of
encoding the link number in the name of the node that you should
actually use a unit address and a reg in the subnodes.

...also, again your description doesn't need the "|" at the end.
Maybe <https://yaml-multiline.info/> will be useful to you?


> +    type: object
> +
> +    properties:
> +      link-name:
> +        $ref: "#/definitions/link-name"
> +
> +      unidirectional:
> +        $ref: "#/definitions/unidirectional"
> +
> +      cpu:
> +        $ref: "#/definitions/dai"
> +
> +      codec:
> +        $ref: "#/definitions/dai"
> +
> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +
> +    additionalProperties: false
> +
> +examples:
> +
> +  - |
> +    snd {

Can you use the full node name "sound" here?


> +        compatible = "qcom,sc7180-sndcard";
> +        model = "sc7180-snd-card";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&sec_mi2s_active &sec_mi2s_dout_active
> +                     &sec_mi2s_ws_active &pri_mi2s_active
> +                     &pri_mi2s_dout_active &pri_mi2s_ws_active
> +                     &pri_mi2s_din_active &pri_mi2s_mclk_active>;

I think pinctrl is usually not in the dt examples.

...also, shouldn't the mi2s pinctrl be in the i2s nodes, not in the
overall sound node?


> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        dai-link-0 {
> +            link-name = "MultiMedia0";
> +            cpu {
> +                sound-dai = <&lpass_cpu 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&alc5682 0>;
> +            };
> +        };
> +
> +        dai-link-1 {
> +            link-name = "MultiMedia1";
> +            unidirectional = <0>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 1>;
> +            };
> +
> +            codec {
> +                sound-dai = <&max98357a>;
> +            };
> +        };
> +    };
> --
> 2.28.0.rc0.105.gf9edc3c819-goog
>
