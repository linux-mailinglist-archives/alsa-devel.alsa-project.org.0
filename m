Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69029D175
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 19:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68BB8851;
	Wed, 28 Oct 2020 19:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68BB8851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603909580;
	bh=M1whgnZOJadzH3ZqD/41ILHdWSiXvpcDWZEAb4SE7+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAWSL0ZfSefitwxayeveSQw/ql7JjNhrB6tSk/oJMZvehYVRfw7ibgaJ0Ki8YDPRx
	 RlE9Sfh4GqgcxaNy1CHkqOjm+4ArIwGX5OIdeY1Bh8F+fgk1JOsqsTv+yuQpp/eY6M
	 IEduPVVCOid2l4iBIMk91YlqOSTM27gWxt+rox88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFC5F80249;
	Wed, 28 Oct 2020 19:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5DFF80212; Wed, 28 Oct 2020 19:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2919F80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 19:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2919F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZsVc/sMc"
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B53C8247FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603909476;
 bh=M1whgnZOJadzH3ZqD/41ILHdWSiXvpcDWZEAb4SE7+E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZsVc/sMcFdoTr2EbAio4ExRQYe6ZkSHBFnZCxMP68LWN9WYrH+2VyT2tSKR2Ojf/A
 9oe34hjYGRJXOQk6CJtOwIaR3LHZJJex29m5yEmePDcpnV/3bP1aoTGP84XxdCboTc
 0cYjviCsnee5IKV6nD3qG7D6Emrx9hwprSG2tkXE=
Received: by mail-oi1-f178.google.com with SMTP id x1so497597oic.13
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 11:24:36 -0700 (PDT)
X-Gm-Message-State: AOAM533KHC0uJV0S6d6bEu8fEKbavJpGFHp38W+6awwz8QdfeXc1Z2KH
 5WCDLB6AV5dWb7t9VfMZ4L6QB6karKzrKX6rcA==
X-Google-Smtp-Source: ABdhPJyXpqjoGHD1yMAHx6mddJw4rJxGdzINyVXxqgHhTZozTbPMuEIK/CXamZ0Se8Ri+6CmN549wosnDEPFnTMsC9k=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr221994oib.106.1603909475904; 
 Wed, 28 Oct 2020 11:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
 <20201026170947.10567-2-srinivas.kandagatla@linaro.org>
 <20201028150135.GA4009047@bogus>
 <31981724-b260-e94d-ebc6-ccea21763531@linaro.org>
In-Reply-To: <31981724-b260-e94d-ebc6-ccea21763531@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 Oct 2020 13:24:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLUYCrqbgxJPc_CTH9MtQo=h4JBqcmpgwJgWncyLN2gtQ@mail.gmail.com>
Message-ID: <CAL_JsqLUYCrqbgxJPc_CTH9MtQo=h4JBqcmpgwJgWncyLN2gtQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Add SM8250 sound card
 bindings
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Patrick Lai <plai@codeaurora.org>
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

On Wed, Oct 28, 2020 at 10:19 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 28/10/2020 15:01, Rob Herring wrote:
> > On Mon, Oct 26, 2020 at 05:09:46PM +0000, Srinivas Kandagatla wrote:
> >> This patch adds bindings required for SM8250 based soundcards
> >> for example Qualcomm Robotics RB5 Development Kit which makes
> >> use of ADSP and Internal LPASS codec.
> >
> > You didn't send to DT list...
>
> Ah.. my bad.. I did not realize that I missed it!
>
> >
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   .../bindings/sound/qcom,sm8250.yaml           | 161 ++++++++++++++++=
++
> >>   1 file changed, 161 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,sm82=
50.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml =
b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> new file mode 100644
> >> index 000000000000..b8f97fe6e92c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> @@ -0,0 +1,161 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Technologies Inc. SM8250 ASoC sound card driver
> >> +
> >> +maintainers:
> >> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> +
> >> +description:
> >> +  This bindings describes SC8250 SoC based sound cards
> >> +  which uses LPASS internal codec for audio.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - const: qcom,qrb5165-rb5
> >> +      - items:
> >> +        - const: qcom,sm8250
> >
> > This collides with the top level SoC compatible resulting in:
> >
>
> I did run dt_binding_check before sending out this patch, I might have
> missed it somehow because the make dt_binding_check did not
> end/termnitate in any errors, however if I had scrolled 15-20 Page ups
> it does have this error log!

make -sk

:)

> > /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/=
sound/qcom,sm8250.example.dt.yaml: sound: $nodename:0: '/' was expected
> >       From schema: /builds/robherring/linux-dt-bindings/Documentation/d=
evicetree/bindings/arm/qcom.yaml
> > /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/=
sound/qcom,sm8250.example.dt.yaml: sound: compatible: ['qcom,qrb5165-rb5'] =
is not valid under any of the given schemas (Possible causes of the failure=
):
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible: ['qcom,qrb5165-=
rb5'] is too short
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,apq8016-sbc']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,apq8074-dragonboard']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,msm8960-cdp']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['fairphone,fp2', 'lge,hammerhead', 'sony,xperia-amami'=
, 'sony,xperia-castor', 'sony,xperia-honami']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,msm8916=
-mtp/1' was expected
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['longcheer,l8150', 'samsung,a3u-eur', 'samsung,a5u-eur=
']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,msm8996=
-mtp' was expected
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c=
1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,ipq8064-ap148']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq=
8074-hk10-c2']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,sc7180-idp']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['xiaomi,lavender']
> >       /builds/robherring/linux-dt-bindings/Documentation/devicetree/bin=
dings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165=
-rb5' is not one of ['qcom,ipq6018-cp01-c1']
> >
> >       From schema: /builds/robherring/linux-dt-bindings/Documentation/d=
evicetree/bindings/arm/qcom.yaml
> >
> Documentation/devicetree/bindings/arm/qcom.yaml does have
> qcom,qrb5165-rb5 entry under [qcom,sm8250]
>
> Can you help me understand why is this not a valid compatible?

Those compatibles are used at the top level for the SoC. You can't use
the same compatible to mean 2 different things.

Rob
