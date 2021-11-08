Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D14480B9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 15:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F0A1654;
	Mon,  8 Nov 2021 15:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F0A1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636380134;
	bh=izUyU11zdeMT/aRwDCiBBWYzJdGvltLhmfBSK2Tce+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGLQ7zhRCBvQMgyjfWGjG25s42pm7PtPqsW9xO/I5wSbdCPwuU5vLaJ0e+xsy/qpL
	 C4qA9e6n0fHH95sZfAH27zh5zO7pRO1qwr2gBK5NgGLxuj2owN/tlmXESeVbF5IP3t
	 r/CndeqCRqti+iM7Rm9P1Q6vaCK5TK/FxUvwS1IM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20ACAF804B1;
	Mon,  8 Nov 2021 15:00:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 577ABF8049E; Mon,  8 Nov 2021 15:00:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D950F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 15:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D950F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QEyeK430"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B710F61360
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636380044;
 bh=izUyU11zdeMT/aRwDCiBBWYzJdGvltLhmfBSK2Tce+0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QEyeK430sgQd7aECSKa9RkgWB0NZYu4J4DjwHBFbmhTz8214hH0SJU1ea7LJDQ68J
 NznF7o9L13yno2sD0xt6POdHnimDEfPI4fnk0g1oikwXoAB9qUys7yqnp5LkQjILJ2
 cfV2ENmALmBQnYRWdXaDZHR9GVpaYS4SvHKe4f5sWO6OvureXfHag4/caQQJetmLhb
 tkbyAswMmXUS9UGb4efBB+JuzcxGIL9arZxdW4S3NstH7WLX8rPJNuoEnEAHZhF/0Z
 I/uQJbp7vo6cIsb+BVljFsQrniuA6oRqpw0BqOPKdpPSUPP5fnXPg0dE0jdj2w9Asz
 S4macAth01Zeg==
Received: by mail-ed1-f48.google.com with SMTP id v11so60330141edc.9
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 06:00:44 -0800 (PST)
X-Gm-Message-State: AOAM533pwDwDL5ttAw5DOzUtN2IxvAM21nVymLQ/q+ITRIK3qd26eAwk
 RJISAUG0Gj1rTjVgVobYyA9K7TOR4hRWtA0eUg==
X-Google-Smtp-Source: ABdhPJz1YCKek/SoIOKWCmTzcAVXHyiGtNhZcHIUPo0/ukWjKFdSzT5KKPUakqks2jia4+yz0wIt1WJJDG5tCLUAVtA=
X-Received: by 2002:a05:6402:350e:: with SMTP id
 b14mr55082191edd.271.1636380042836; 
 Mon, 08 Nov 2021 06:00:42 -0800 (PST)
MIME-Version: 1.0
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
 <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
 <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
 <b1f2280a-b349-6862-c6e1-f74a5584c9bc@codeaurora.org>
In-Reply-To: <b1f2280a-b349-6862-c6e1-f74a5584c9bc@codeaurora.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 8 Nov 2021 08:00:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL--zFvm=TWN2b2f4XJC3VigNwRq9gyf2PcAAVoiM8A4A@mail.gmail.com>
Message-ID: <CAL_JsqL--zFvm=TWN2b2f4XJC3VigNwRq9gyf2PcAAVoiM8A4A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Gross,
 Andy" <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
 Patrick Lai <plai@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, Nov 8, 2021 at 1:35 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
>
> On 11/6/2021 7:00 AM, Rob Herring wrote:
> Thanks for Your time Rob!!!
> > On Tue, Nov 2, 2021 at 5:57 AM Srinivasa Rao Mandadapu
> > <srivasam@codeaurora.org> wrote:
> >>
> >> On 10/30/2021 12:37 AM, Stephen Boyd wrote:
> >> Thanks for Your time Stephen!!!
> >>> Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
> >>>> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >>>> new file mode 100644
> >>>> index 0000000..3a781c8
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >>>> @@ -0,0 +1,170 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Google SC7280-Herobrine ASoC sound card driver
> >>>> +
> >>>> +maintainers:
> >>>> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >>>> +  - Judy Hsiao <judyhsiao@chromium.org>
> >>>> +
> >>>> +description:
> >>>> +  This binding describes the SC7280 sound card which uses LPASS for audio.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - google,sc7280-herobrine
> >>>> +
> >>>> +  audio-routing:
> >>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >>>> +    description:
> >>>> +      A list of the connections between audio components. Each entry is a
> >>>> +      pair of strings, the first being the connection's sink, the second
> >>>> +      being the connection's source.
> >>>> +
> >>>> +  model:
> >>>> +    $ref: /schemas/types.yaml#/definitions/string
> >>>> +    description: User specified audio sound card name
> >>>> +
> >>>> +  "#address-cells":
> >>>> +    const: 1
> >>>> +
> >>>> +  "#size-cells":
> >>>> +    const: 0
> >>>> +
> >>>> +patternProperties:
> >>>> +  "^dai-link@[0-9a-f]$":
> >>>> +    description:
> >>>> +      Each subnode represents a dai link. Subnodes of each dai links would be
> >>>> +      cpu/codec dais.
> >>>> +
> >>>> +    type: object
> >>>> +
> >>>> +    properties:
> >>>> +      link-name:
> >>>> +        description: Indicates dai-link name and PCM stream name.
> >>>> +        $ref: /schemas/types.yaml#/definitions/string
> >>>> +        maxItems: 1
> >>>> +
> >>>> +      reg:
> >>>> +        maxItems: 1
> >>>> +        description: dai link address.
> >>>> +
> >>>> +      cpu:
> >>>> +        description: Holds subnode which indicates cpu dai.
> >>>> +        type: object
> >>>> +        properties:
> >>>> +          sound-dai: true
> >>> Is sound-dai required? And additionalProperties is false? I think we
> >>> need that yet again.
> >> Okay. Will mark additionalPropertiesas true.
> > 'additiionalProperties: true' is almost never right. It's generally
> > only correct for schemas that are incomplete collections of
> > properties.
> >
> > Rob
>
> As per Stephen Suggestion. thought it's a solution.
>
> The sound-dai required here, and same is fallowed in SC7180 machine
> driver bindings.
>
> Could You please suggest better approach on this?

Exactly what Stephen said, add:

required:
  - sound-dai

additionalProperties: false
