Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED249E76B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 17:24:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB0D170F;
	Thu, 27 Jan 2022 17:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB0D170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643300672;
	bh=ebe8Db9zos3Y0K66TIduyt3eige+Mebuckpp/7lIeWk=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nGOqFaitpAlsZwCT3gprwwMr9uYJBT52kZ7zzRxqclP8ozGjOXEL0CepXMb3GmX5Y
	 vmr2AsJKLvRdiBa6P1Cz5o6cWm/+XkPizLF36dXrDztEfcJpKnWuabjPN1mfBLpImF
	 jphG8wC0yCMdRzMDiIxvJl3+Jt2ov7f7nZgGp/U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7CFF8025A;
	Thu, 27 Jan 2022 17:23:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B108F80254; Thu, 27 Jan 2022 17:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CE2BF800C8
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 17:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE2BF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="fZcrsbxT"
Received: by mail-wm1-x32e.google.com with SMTP id c192so2315286wma.4
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 08:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=dszbD2iJpZiPeHo8KU4CPZgugNBsta//XmHDun3F64c=;
 b=fZcrsbxTVL6oEX16YFICUECpoqbUxOVzhN91OZM/+KQu155OI7WSTG0MiQZJgjExmx
 jp0sIHft9IaJptYG6xxadWut2UoUpBdZjQx5gv7u1MkTlRl1hZUMLS10XNBqLS12Kqc0
 fUGz36q/7SAVtW2er4/vNtRl/IAv5P9dXGTRghcXk838xHFTh0rpWC3QJ1hL6MFMFpmZ
 IOudqk9T82+pKnR3a4nT1d5H50M3AZIqsuTo+VhmilYtZbr/+DsaUTUQrPVXWALYkJoQ
 ua9KX5MavqeNx/aTRA4/yfAgHvPRa2gKr2mV89ocCP23NjXS4WJhAaF53CwKPll5S9QB
 nuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=dszbD2iJpZiPeHo8KU4CPZgugNBsta//XmHDun3F64c=;
 b=IituEt2gPogoLvZZDh4BHNdgHDEupVEYeV1WIKjbj0r3PYHRgyB6gJJkMHP6NF+7P5
 QNYSa5Bkvrj9sbGbUoXpY0zcD2t/U70k4RVNmqecCPOEieRBk1/hS//x8Z14JyabfCIM
 UeSXBch7wCOvhr+EF68xXHz+yd58uaFfYW8yFnTupt97gUEnYqLqloIjIEkaxciR9dI4
 9+cGmu+rOYzry/owCaL78QvMI77CGxh3aLiqxzu22tnoomjMgdy8wSC+v1QTh2KuoCbb
 bOjdheuBoJRlhTr4g7BhKSbdO4qJVM3C4pXaVsOG5Wz/f+TNojZwcpCdXBreEjWaUwOT
 C47A==
X-Gm-Message-State: AOAM533x/eRsm7SOuOPP5TvhIJ1zmOH1lq4hPSHgsmW+Gks84f3TW7up
 eJcXI7+393PZhI1o5oNO8QZPRQ==
X-Google-Smtp-Source: ABdhPJx68OlAQYPxDB8R5MGosp8NvBZZ+3uApWKaznWHP31o8jTnJGFiSqqrgwHrSvAVTiOnIthV0w==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr12306751wmc.89.1643300601853; 
 Thu, 27 Jan 2022 08:23:21 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id v124sm6289832wme.30.2022.01.27.08.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 08:23:21 -0800 (PST)
References: <20220126231427.1638089-1-robh@kernel.org>
 <1jtudp1rc1.fsf@starbuckisacylon.baylibre.com>
 <CAL_JsqL77E+5ftqgHPdWQzfp98Oh3d=QZRQ8Z6v91OfSeprxig@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Date: Thu, 27 Jan 2022 17:20:49 +0100
In-reply-to: <CAL_JsqL77E+5ftqgHPdWQzfp98Oh3d=QZRQ8Z6v91OfSeprxig@mail.gmail.com>
Message-ID: <1jlez1172f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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


On Thu 27 Jan 2022 at 08:35, Rob Herring <robh@kernel.org> wrote:

> On Thu, Jan 27, 2022 at 3:05 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Wed 26 Jan 2022 at 17:14, Rob Herring <robh@kernel.org> wrote:
>>
>> > 'sound-dai' is a common property, but has duplicate type definitions.
>> > Create a new common definition to define the type and then update all
>> > the other occurrences to just define how many entries there are just
>> > like other phandle+arg properties.
>> >
>> > The constraints on the number of entries is based on the examples and
>> > could be wrong.
>> >
>> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> > Signed-off-by: Rob Herring <robh@kernel.org>
>> > ---
>> > Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
>> > phandle-array schemas") in my tree.
>> > ---
>> >  .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
>> >  .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
>> >  .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
>> >  .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
>> >  .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
>> >  .../bindings/sound/samsung,midas-audio.yaml   |  2 --
>> >  .../bindings/sound/samsung,odroid.yaml        |  9 +++------
>> >  .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
>> >  8 files changed, 42 insertions(+), 21 deletions(-)
>> >  create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
>> > index 2e35aeaa8781..8b5be4b92f35 100644
>> > --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
>> > +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
>> > @@ -57,7 +57,7 @@ patternProperties:
>> >            rate
>> >
>> >        sound-dai:
>> > -        $ref: /schemas/types.yaml#/definitions/phandle-array
>> > +        maxItems: 1
>> >          description: phandle of the CPU DAI
>> >
>> >      patternProperties:
>> > @@ -71,7 +71,7 @@ patternProperties:
>> >
>> >          properties:
>> >            sound-dai:
>> > -            $ref: /schemas/types.yaml#/definitions/phandle-array
>> > +            maxItems: 1
>>
>> No min or max here. Links may have more than one codec.
>>
>> Ex:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#n158
>
> What do you mean? Every 'sound-dai' there only has 1 phande+args. Each
> codec is a child node.

Yes it is a child - sorry I misunderstood.
I thought the MaxItems: 1 would limit the number of codecs

For the amlogic part:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Rob

