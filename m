Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B41446BCD
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Nov 2021 02:32:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468E6167E;
	Sat,  6 Nov 2021 02:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468E6167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636162323;
	bh=02topxTHAKThTBTO3zqDJ42JdAkAX0HtqC0Y3dyHDO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6QUELviWm8/YHsxz5t8qqjAgUjKmdwMNE/S5LDwgxny5Vjf9CBBsNsXCAtB2Co5E
	 ALl5IfroZM2YiheApfn76qVDMtD/u8HiXb4AdYv4Zf7WLmEfT6e6OY4i5R8DDAyjFA
	 nEFV4QNI/R/eIWa7EOmAIjpFJKfcU/YFbqqP3E10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C48F8012A;
	Sat,  6 Nov 2021 02:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEA22F8026A; Sat,  6 Nov 2021 02:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F724F80224
 for <alsa-devel@alsa-project.org>; Sat,  6 Nov 2021 02:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F724F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bSUfk72v"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E8FF611AE
 for <alsa-devel@alsa-project.org>; Sat,  6 Nov 2021 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636162233;
 bh=02topxTHAKThTBTO3zqDJ42JdAkAX0HtqC0Y3dyHDO4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bSUfk72v4gVL76Pufs+Vep/nBUKmVCUx7AEjw4b8a+DvrEpt0bPhp/BiReiKv4E3l
 mYAiv/VypSVL8AmEslrvfQvjoLHycS2WI4SD7RHYIPA3u1ZwOmdOCIuX1HFqBzc25M
 Y4J1viSGnQL+EDyvlB66JRtKPwKvd+2rUwZw8Fe4ONPlghum73i1+l8T7pnJUpeq8e
 mXABvTQuLsy+JI6wdZJ0/wvUt8e6hNHpXlRsTqyDEq9129Zi9IwA+XkkFm66mWWqAd
 tE7f8LFr24Lp2K6E8xFNvVzWwApBVPbxNvtdc1AcV+y3fjgsdHIkusncqVq9d4PPa9
 O2o9jSN5p4dFw==
Received: by mail-ed1-f50.google.com with SMTP id v11so36319246edc.9
 for <alsa-devel@alsa-project.org>; Fri, 05 Nov 2021 18:30:33 -0700 (PDT)
X-Gm-Message-State: AOAM530yFNkDQKqVuRRii6SSuz+osNFyBzXytwexhXm9N8uoj8ZvuAb+
 DX2p6Nz4n3EIoeBXdJunkxv1/94+MVc1A0DEqQ==
X-Google-Smtp-Source: ABdhPJxnUmIJLji323JYPjuxpKBPy6Ndvgj+6MG4lN/0vDFEDITAF/DyPe1a/jS0M0oVZrMBXPAX17mREqfK/9RxrPY=
X-Received: by 2002:a17:906:66d2:: with SMTP id
 k18mr25705246ejp.320.1636162231741; 
 Fri, 05 Nov 2021 18:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
 <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
In-Reply-To: <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 5 Nov 2021 20:30:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
Message-ID: <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 5:57 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
>
> On 10/30/2021 12:37 AM, Stephen Boyd wrote:
> Thanks for Your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
> >> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >> new file mode 100644
> >> index 0000000..3a781c8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >> @@ -0,0 +1,170 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Google SC7280-Herobrine ASoC sound card driver
> >> +
> >> +maintainers:
> >> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> +  - Judy Hsiao <judyhsiao@chromium.org>
> >> +
> >> +description:
> >> +  This binding describes the SC7280 sound card which uses LPASS for audio.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - google,sc7280-herobrine
> >> +
> >> +  audio-routing:
> >> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >> +    description:
> >> +      A list of the connections between audio components. Each entry is a
> >> +      pair of strings, the first being the connection's sink, the second
> >> +      being the connection's source.
> >> +
> >> +  model:
> >> +    $ref: /schemas/types.yaml#/definitions/string
> >> +    description: User specified audio sound card name
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 0
> >> +
> >> +patternProperties:
> >> +  "^dai-link@[0-9a-f]$":
> >> +    description:
> >> +      Each subnode represents a dai link. Subnodes of each dai links would be
> >> +      cpu/codec dais.
> >> +
> >> +    type: object
> >> +
> >> +    properties:
> >> +      link-name:
> >> +        description: Indicates dai-link name and PCM stream name.
> >> +        $ref: /schemas/types.yaml#/definitions/string
> >> +        maxItems: 1
> >> +
> >> +      reg:
> >> +        maxItems: 1
> >> +        description: dai link address.
> >> +
> >> +      cpu:
> >> +        description: Holds subnode which indicates cpu dai.
> >> +        type: object
> >> +        properties:
> >> +          sound-dai: true
> > Is sound-dai required? And additionalProperties is false? I think we
> > need that yet again.
> Okay. Will mark additionalPropertiesas true.

'additiionalProperties: true' is almost never right. It's generally
only correct for schemas that are incomplete collections of
properties.

Rob
