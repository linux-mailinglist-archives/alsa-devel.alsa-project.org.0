Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE562262CF5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 12:21:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA4D16F6;
	Wed,  9 Sep 2020 12:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA4D16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599646898;
	bh=Ah/NEsdPaoJCHpeWY0SrJJdYjkOt1mz1z4WBIH2SZ/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4gGJw5zhbfP6rNlJKxT89pkqv2hiCoLdoq0N5bxH+sBjOaktKF9Ib2boz4eIw0Eb
	 sNJJ3/B/i3emB1nWsJ8Dvk1J99Gjr3+0ay+jZ6BCU8PjuM1xGiZldJL5byYvIxFWc8
	 uCIhsSnHaCfkjXd039eeTUnyBgopqISzd7lv9DnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D1AAF800E9;
	Wed,  9 Sep 2020 12:19:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3F10F80227; Wed,  9 Sep 2020 12:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A38F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 12:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A38F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nvSB7U1Y"
Received: by mail-wm1-x342.google.com with SMTP id l9so1780710wme.3
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYtyV9sjpexCNQizdjqRW/SdiWDHf0KUeZqsLzbBBXw=;
 b=nvSB7U1YSQLRXpNDcMP9RUL4PGdEF8Pp4cI2ebpoYmMzEcjiDJLpG6b3HJObeEVAxL
 cijYVLuZEmfuyeKiiZN8Q6lt2h87SXNCljv8Xm5odSlNFG3IzsWZMaKBsHIF8GcmTvzX
 tAKWudAP91pOakcxDjcrP8IsABvDDWwVina9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYtyV9sjpexCNQizdjqRW/SdiWDHf0KUeZqsLzbBBXw=;
 b=KSClXoHdD6wlKU4+KQm/qvwabYIxwzvIsHQlzz8cx0VwNwiO/06xnkBdaStEMsUYnT
 3z4sd50l/ObFE0Ap8cucrobf549u/qJDj7TGlShCxzypQBzWXHdyegda7ANwbVzxrJjE
 jJmI9etraUx2mC6eRHRd8s+v3/tL+HWQj4HZ3rgD11uUWCDuyCB+THS/ERR3BZl8f8JU
 293DL6Lq7eqXlYVzEjRK3f4iEZueVzmgPGeRuenfiFfPhNbH53wO5Nq4a8q6UQ9C6/B4
 xoZlMvleAEoUAffiBMSIlg6UXn5XHp/ELLc1UoEYWYvGvusMDvh9j6UMByFadPjNXu5Q
 wCrw==
X-Gm-Message-State: AOAM5333mUhac/CtnW+Q/BvNqqJ47Xsbgjpq8iqip96Ed6UzBpB9zvIH
 VCIMRMJJib1S48oej1cjKxdzkDiVkdznd3Qgzhd7XA==
X-Google-Smtp-Source: ABdhPJyiGLD2o5Mp0hKfuqc3sTpSUwV4QU2ftFwRMsUfKEu8ElxuFddp9M1CKV0LCUYsOZUPyqBuF/zKTLMFrnRTRBU=
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr2821349wmj.101.1599646782754; 
 Wed, 09 Sep 2020 03:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
 <20200908203357.GA861143@bogus>
 <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
In-Reply-To: <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 9 Sep 2020 18:19:16 +0800
Message-ID: <CAFv8NwJXyzUsCQZu1cU0t7NUJDpS_DyxZM=ZhU+jGoQj97i3Jw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

On Wed, Sep 9, 2020 at 5:23 PM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Wed, Sep 9, 2020 at 4:34 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> > > Add devicetree bindings documentation file for sc7180 sound card.
> > >
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
> > >  1 file changed, 143 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > new file mode 100644
> > > index 000000000000..ae809346ca80
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > > @@ -0,0 +1,143 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > > +
> > > +maintainers:
> > > +  - Rohit kumar <rohitkr@codeaurora.org>
> > > +  - Cheng-Yi Chiang <cychiang@chromium.org>
> > > +
> > > +description:
> > > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,sc7180-sndcard
> > > +
> > > +  audio-routing:
> > > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > > +    description:
> > > +      A list of the connections between audio components. Each entry is a
> > > +      pair of strings, the first being the connection's sink, the second
> > > +      being the connection's source.
> > > +
> > > +  model:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    description: User specified audio sound card name
> > > +
> > > +  headset-jack:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle of the codec for headset detection
> > > +
> > > +  hdmi-jack:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle of the codec for hdmi jack detection
> >
> > You already have links to these devices. Why duplicate it here?
> >
> > What if you had 2 headsets? This doesn't scale.
> >
> Hi Rob, thanks for reviewing.
> There was some discussion in
> https://patchwork.kernel.org/patch/11737905/#23571643 about how to
> specify the dailink that has a headset jack.
> I would like to pass the information of headset jack and hdmi jack to
> the machine driver so the machine driver can call
> snd_soc_component_set_jack to set jack when init the corresponding link.
> Headset jack and hdmi jack will be treated differently for button and
> event type.
> Because of this, we can not just set a property "jack" in the link.
>
> As for the 2 headsets case (I guess you mean hp jack and mic jack), on
> this board we will not have this use case.
> If someone really wants to build hp jack and mic jack on the board
> based on this machine driver, we can add two more property hp-jack and
> mic-jack to specify that,
> as the machine driver will need to know the different jack types
> anyway. What do you think ?
>
> Or could you please suggest a proper way to pass such information ?
>
> Thanks!
> >
Alternatively we can probably do

                dai-link@0 {
                        link-name = "MultiMedia0";
                        reg = <0>;
                        cpu {
                                sound-dai = <&lpass_cpu 0>;
                        };
                        headset_jack;
                        codec {
                                sound-dai = <&alc5682 0>;
                        };
                };
                dai-link@2 {
                        link-name = "MultiMedia2";
                        reg = <2>;
                        cpu {
                                sound-dai = <&lpass_hdmi 0>;
                        };
                        hdmi_jack;
                        codec {
                                sound-dai = <&msm_dp>;
                        };
                };

Or even put the flag into codec {}.
Please let me know if you feel this is a better way.
I think it will make the driver code a little more complicated, but
the interface on dts might looks cleaner.
Thanks!

> > Rob
