Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB3949E4BF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 15:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421061B11;
	Thu, 27 Jan 2022 15:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421061B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643294221;
	bh=PW79X8cPn6ViAnKzMlHMh+jPKdZ8Vtts2c4SdW32Gzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHLkDkXUfsdxmi6hZZQv3a75gjeK9OmS8zdceSGKffndc3f9IjD4/pWSpzWBpWWhU
	 pwUuBmpnoRjg8kCBhkLGP/FB5GjWmDb9S/vSWtb8+kIevZHVxGkDPE3q3zPz3r8B/E
	 g5oDkx2t9z7XKIj4caxx9VODyYubSxfGHYEv0ieg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93810F80118;
	Thu, 27 Jan 2022 15:35:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 244A7F80118; Thu, 27 Jan 2022 15:35:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AF83F80118
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 15:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF83F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AUOiVeCe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E90FE61D0B
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 14:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47267C340E4
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643294144;
 bh=PW79X8cPn6ViAnKzMlHMh+jPKdZ8Vtts2c4SdW32Gzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AUOiVeCeNZFf4AWa8FOVXHRuBed/o2o6B/EcNapzB8ePPOMhpmyKkIqo++Qm62r4J
 vHRhxxSrHzO7jdW8TUe1ZtOCuvacFsfdGkgHKBBeKW0pBsrRodg9PxEWBVjR0JIvfy
 A+1YmBxZKEaWwwYfBzbUYkQeX+89pa7zoeFNoU44h41wVWTBvbnbucJ3VrSqhjLYS/
 xz5mbETro1Rwxjm0MlXTAhBRD6Ge1fmkZYCjP279qf6UAK5y4IPY9/FgtdfVmFUUVg
 whN4SzEt0zXclfVCPhbjJ4WdDWLVEnuoIDJ2yFOQnN4+AC4j7k5ksBOxWpqzPPf8af
 KzvhYU8HVMdQA==
Received: by mail-qk1-f176.google.com with SMTP id o10so2785368qkg.0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 06:35:44 -0800 (PST)
X-Gm-Message-State: AOAM5309JnQNWUrwbjdAW7Ur/fbsMwgkvrmjF6VSFlHgyOFpCyN715G5
 7rgBugEn5A3zoDS6O/GY1ahXlOoOjSt32xSXRg==
X-Google-Smtp-Source: ABdhPJx+l2xwFUQU3YA/Xj/VasojClh5ePxxWVUY3Xu0vur1D3RTeupyBC0V/insZdon7g+GJkRzbH8lNDYDwIUaVWs=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr937625qkn.643.1643294143207; 
 Thu, 27 Jan 2022 06:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20220126231427.1638089-1-robh@kernel.org>
 <1jtudp1rc1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jtudp1rc1.fsf@starbuckisacylon.baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jan 2022 08:35:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL77E+5ftqgHPdWQzfp98Oh3d=QZRQ8Z6v91OfSeprxig@mail.gmail.com>
Message-ID: <CAL_JsqL77E+5ftqgHPdWQzfp98Oh3d=QZRQ8Z6v91OfSeprxig@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Fabio Estevam <festevam@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
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

On Thu, Jan 27, 2022 at 3:05 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 26 Jan 2022 at 17:14, Rob Herring <robh@kernel.org> wrote:
>
> > 'sound-dai' is a common property, but has duplicate type definitions.
> > Create a new common definition to define the type and then update all
> > the other occurrences to just define how many entries there are just
> > like other phandle+arg properties.
> >
> > The constraints on the number of entries is based on the examples and
> > could be wrong.
> >
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
> > phandle-array schemas") in my tree.
> > ---
> >  .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
> >  .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
> >  .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
> >  .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
> >  .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
> >  .../bindings/sound/samsung,midas-audio.yaml   |  2 --
> >  .../bindings/sound/samsung,odroid.yaml        |  9 +++------
> >  .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
> >  8 files changed, 42 insertions(+), 21 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> > index 2e35aeaa8781..8b5be4b92f35 100644
> > --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> > @@ -57,7 +57,7 @@ patternProperties:
> >            rate
> >
> >        sound-dai:
> > -        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +        maxItems: 1
> >          description: phandle of the CPU DAI
> >
> >      patternProperties:
> > @@ -71,7 +71,7 @@ patternProperties:
> >
> >          properties:
> >            sound-dai:
> > -            $ref: /schemas/types.yaml#/definitions/phandle-array
> > +            maxItems: 1
>
> No min or max here. Links may have more than one codec.
>
> Ex:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#n158

What do you mean? Every 'sound-dai' there only has 1 phande+args. Each
codec is a child node.

Rob
