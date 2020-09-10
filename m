Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C162639E4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 04:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7861668;
	Thu, 10 Sep 2020 04:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7861668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599703950;
	bh=2uezBTr6eFGczbdsUWdqujDYx5/ivjW8Ur9iwwONq44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a9VFGb+n4RJzp7k8paqJUjOb1/gCh6c+czGNRgvfOrn2TB+BDw3Wd5zD3nNX1NU4m
	 cHFeYwIpcMpFKBkB6f4BrpvGnC9HH9zaCTHdw4hUzne4PhCgM6Svj7iNjBGw9IGUKQ
	 4VN49166XItNFXet1AiQEDZT2QYZ66uhC5GPSL+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C88E5F8026F;
	Thu, 10 Sep 2020 04:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF647F80264; Thu, 10 Sep 2020 04:10:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F14AF8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 04:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F14AF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JkDoPoqK"
Received: by mail-wr1-x441.google.com with SMTP id w5so4913651wrp.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 19:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlSzeOt9N0W/7KOltCPrNSI8OJ7kFIa46v5Vs5ruAzE=;
 b=JkDoPoqKHm57pQylGVVBMb+2P4mUUyI14KYTHy2HW1JlsrjY4xP6wdtHeD5MFKdcE2
 URp+KWtbpiWbb/kbbYrMULGf9pcBMt1wV3jT5bmtmIq4TCLFYRe2zKmn3uVk+80GLzG6
 UBm7deRjVDb0LhAjTWLBs6RoLDkArABarz6zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlSzeOt9N0W/7KOltCPrNSI8OJ7kFIa46v5Vs5ruAzE=;
 b=OufPemYsvyDUzVU4GzWas2w9l8Pe1WpcxA/9YOb8x52OE6cxjsjDcmMfAcGFcUDGt9
 pM+KDtc4cvC/cfn3f5qHgvUDCzaXxd5U9/txjUlqw52GLNZR+nKTkCNFMGyLEaTVbWFD
 FdjfMwt9s0Xf84xuSI/JzfsSW68Lkm0h3HuJNRvhhNxb0EH03lqyJIpGeSYj5PBKm5c8
 8eb7WowBJrWE5VNvmt1IRasTiSWtrTTadc/CF9zuwi25r7X78AOoV06IXRJZ3Dv0oV81
 /v4aMVnlnuze1iYURNLyV5WJHZSCr+Xt7BOKPWQ1uEonpROIl+Bl53UFg18IHZlvXZeS
 8KFQ==
X-Gm-Message-State: AOAM532KAxoWIejVkW5eOlO0JyRFr+iwdYL31VMva4HMwwwpRZLqZjie
 SobqFT9QJq9ICyk/Gsj4WGrg6do9B5NvcXFeG9K7pA==
X-Google-Smtp-Source: ABdhPJzfvrq3ETFzz+i1NYsPH/dvVMCxkhygsXwY9sjZ5D5c8EGzXWs4p8/HuJYhmQ5eijuyWmC6iuTdYlluAj54gYQ=
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr6416336wrt.159.1599703839398; 
 Wed, 09 Sep 2020 19:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
 <20200908203357.GA861143@bogus>
 <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
 <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
In-Reply-To: <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Thu, 10 Sep 2020 10:10:12 +0800
Message-ID: <CAFv8NwJQpfLW9syXyUpPusfwS39DTp2wi+MQ=aMTzPqpO3vPig@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Thu, Sep 10, 2020 at 1:49 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 9, 2020 at 3:24 AM Cheng-yi Chiang <cychiang@chromium.org> wrote:
> >
> > On Wed, Sep 9, 2020 at 4:34 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> > > > Add devicetree bindings documentation file for sc7180 sound card.
> > > >
> > > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > > ---
> > > >  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
> > > >  1 file changed, 143 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > > new file mode 100644
> > > > index 000000000000..ae809346ca80
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > > @@ -0,0 +1,143 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > > > +
> > > > +maintainers:
> > > > +  - Rohit kumar <rohitkr@codeaurora.org>
> > > > +  - Cheng-Yi Chiang <cychiang@chromium.org>
> > > > +
> > > > +description:
> > > > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: qcom,sc7180-sndcard
> > > > +
> > > > +  audio-routing:
> > > > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > > > +    description:
> > > > +      A list of the connections between audio components. Each entry is a
> > > > +      pair of strings, the first being the connection's sink, the second
> > > > +      being the connection's source.
> > > > +
> > > > +  model:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    description: User specified audio sound card name
> > > > +
> > > > +  headset-jack:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description: phandle of the codec for headset detection
> > > > +
> > > > +  hdmi-jack:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description: phandle of the codec for hdmi jack detection
> > >
> > > You already have links to these devices. Why duplicate it here?
> > >
> > > What if you had 2 headsets? This doesn't scale.
> > >
> > Hi Rob, thanks for reviewing.
> > There was some discussion in
> > https://patchwork.kernel.org/patch/11737905/#23571643 about how to
> > specify the dailink that has a headset jack.
> > I would like to pass the information of headset jack and hdmi jack to
> > the machine driver so the machine driver can call
> > snd_soc_component_set_jack to set jack when init the corresponding link.
> > Headset jack and hdmi jack will be treated differently for button and
> > event type.
> > Because of this, we can not just set a property "jack" in the link.
>
> Don't design your binding around some driver architecture. Limitations
> of ASoC are not reasons for your binding.
>
> For DP and HDMI, we assume HPD is supported generally as that's a
> standard function for HDMI/DP controllers. There's a 'no-hpd' property
> for cases of broken HPD. That hardware description is part of the
> device HPD is connected to which is the HDMI/DP controller/bridge or
> the connector node in the case of a GPIO line. That doesn't belong in
> the virtual sound card.
>
> I would assume a codec to be similar. The codec node (the alc5682
> node) should have any jack related properties (or possibly implicitly
> support it by default).


Thanks for the explanation. Now I can follow your thoughts.
I see that the sound card driver should assume that there is jack/hpd
available on HDMI/codec unless it is specified in HDMI/codec node
(should not specified in sound card).

>
>
> > As for the 2 headsets case (I guess you mean hp jack and mic jack), on
> > this board we will not have this use case.
> > If someone really wants to build hp jack and mic jack on the board
> > based on this machine driver, we can add two more property hp-jack and
> > mic-jack to specify that,
> > as the machine driver will need to know the different jack types
> > anyway. What do you think ?
>
> I was thinking more of a case of having 2 of the same thing. Perhaps 2
> HDMI outputs. Or if you have DP instead of HDMI? Just going to add
> 'dp-jack'?


I agree that this may not scale. It will become an abuse of binding interface.
Sound card drivers should have more knowledge/control on this kind of
configuration.
I think this can be taken care of inside the sound card driver.
If a machine wants a different configuration, we can use compatible
strings to achieve that.
This will be more flexible than the limited binding interface.

Thanks for the discussion, I will remove headset-jack and hdmi-jack in v8.
>
>
> Rob
