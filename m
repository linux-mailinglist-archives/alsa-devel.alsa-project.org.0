Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D32341AB
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 10:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F0216A6;
	Fri, 31 Jul 2020 10:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F0216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596185845;
	bh=oC95LPdzEPcU1ouZlXz3oyScuYgP2Tnlp9Eudz6kh9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K4ENWjKfE2el5tFFs9ooO9IGFR5o9u9lJ4ZeUjzFlMI48rdV4+YvECtqetlsFtN3X
	 I2uj7CQ3gCvqJWpQyBh3enu6RdI39AoST8SCSsCBBx4UmHDTC+9blzdyr5jba4qaB+
	 FXmTiOwzAmKwjs4fdKmo4t4BUMlhZtehG1wHywCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A907CF801A3;
	Fri, 31 Jul 2020 10:55:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 133D3F8011C; Fri, 31 Jul 2020 10:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C529FF8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 10:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C529FF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gJ1DQMpp"
Received: by mail-wr1-x442.google.com with SMTP id y3so27271218wrl.4
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PyioNdq8CYBvYgbkg8UuSG7Wqo4MUTr2xfEMOw9a9rE=;
 b=gJ1DQMppeYGWIl/xt4mhVBRMBU0vPPeIW+lpH27Uv8zpU3m+ggx5euP9ZtcQhQF/OX
 E64+yzIOVHvWUNyqhXWsVm5YOOfibgDqUixJyt6FHUGiARBRyr4pilLoh8vKs2cWjOsS
 w2zgqojCdQtg0rcRAYhI3V6W7ePsunHAc0g9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PyioNdq8CYBvYgbkg8UuSG7Wqo4MUTr2xfEMOw9a9rE=;
 b=q7o7ZawisHFbop+dcWWXi9b722knCeYZLjPagcNfllP+poekjl7E1K74uKIHPEfaKD
 JqREL4zTV4+1X8o8KNAJweJ4TOJKs+gQIhrDW35qQ52IAg4sfQqUdntZbQnEwCZKRM3r
 rkejRwpHqYo0UfOW6p2jXAM7uhRtWjumcdlH24i59wDxn4S6k1DMOz4S83TJhpAxGfYh
 X785e1O7hhasisN0XEzZjlLIStBQHH5vC5TzXiipOPfSlKpK/EBjNLKgar0/6WqjCuTh
 WITMheoGKJDjNjr2xztQiF5NjQGG9S46dqsfsWP6g3DC0+v3boWJbK8hgltEV182rzEr
 nxOw==
X-Gm-Message-State: AOAM533rBN2ZESJyjaM/ht/YFFmHVt8AbvsC9s47g0NrXoetALDp4bH3
 m2uubDz+3EMK5NI/at3fDN7KIpEMMtOeiPUZ5lMvdA==
X-Google-Smtp-Source: ABdhPJyRhrXp3l6RU/5xr+rqhFrRNMWDU/mr680vSH+27w5AXxfytNKMGTBpF7RmL2K+p94pKbqb9iePJ20hmgfEMro=
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr2466765wrt.159.1596185732557; 
 Fri, 31 Jul 2020 01:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-2-cychiang@chromium.org>
 <c270a068-c96b-63ae-a5ca-ec2081924dac@linaro.org>
In-Reply-To: <c270a068-c96b-63ae-a5ca-ec2081924dac@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 31 Jul 2020 16:55:04 +0800
Message-ID: <CAFv8NwJBqndBozdc9DOr2T67VTnJ1LLEwvze2nJD6xNXh1a+gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Wed, Jul 22, 2020 at 5:25 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 21/07/2020 11:44, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >   .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> >   1 file changed, 130 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..82f9483276eb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,130 @@
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
>
>
> Why do we need this? You should be able to set the jack for codec
> snd_soc_component_set_jack()?
>
>
I put my explanation in the machine driver patch since there is more
context there.

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
> > +      reg:
> > +        description: dai link address.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        maxItems: 1
>
> Why do we need this?? I have not seen the parsing code using this.
>
>
When checking the yaml file using dt_binding_check, I got this warnings:

$  make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
  CHKDT   Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/sound/qcom,sc7180.example.dt.yaml
Documentation/devicetree/bindings/sound/qcom,sc7180.example.dts:32.24-41.15:
Warning (unit_address_vs_reg): /example-0/sound/dai-link@0: node has a
unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/qcom,sc7180.example.dts:43.24-52.15:
Warning (unit_address_vs_reg): /example-0/sound/dai-link@1: node has a
unit name, but no reg or ranges property
  CHECK   Documentation/devicetree/bindings/sound/qcom,sc7180.example.dt.yaml

Should I ignore these warnings because reg is not used in the driver ?

> > +
> > +      playback-only:
> > +        description: Specify that the dai link is only for playback.
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +      capture-only:
> > +        description: Specify that the dai link is only for capture.
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
>
> Are these because the cpu/codec dais are single directional?
>
> If so you can extend snd_soc_dai_link_set_capabilities() and use this
> function.

I found that this is not needed since soc_new_pcm already takes care
of checking capture/playback capability in non-dpcm cases.

>
>
> --srini
>

Thanks for reviewing the patch!



> > +      cpu:
> > +        $ref: "#/definitions/dai"
> > +
> > +      codec:
> > +        $ref: "#/definitions/dai"
> > +
> > +    required:
> > +      - link-name
> > +      - reg
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
> > +            reg = <0>;
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
> > +            reg = <1>;
> > +            link-name = "MultiMedia1";
> > +            playback-only;
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 1>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&max98357a>;
> > +            };
> > +        };
> > +    };
> >
