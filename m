Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FE2A8DC3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 04:50:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C8DC1678;
	Fri,  6 Nov 2020 04:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C8DC1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604634629;
	bh=3llWGNeLb0U341sgef5WKBrfFO2cFeWmvhRVa/Ty9Bw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2RTgEb5oobbxnc0Jmi0LLUkQ2t7KD3ZUk/xZug5jRp//Cl/SvTKx+2LCMbrrQCCN
	 F6ZxbDdd1TWVKsSAay97T5x1JZP3KsaS3tgzhPqQzXNDkckelpA5bXRLQ8Jd1Q8yXu
	 yCJ+mpOe1UDXF+FGeX5YDPXL+qBT4jybF0vht/A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA06F8023E;
	Fri,  6 Nov 2020 04:48:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FD1F80234; Fri,  6 Nov 2020 04:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CADE6F80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 04:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CADE6F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Y0OvGdC7"
Received: by mail-lf1-x143.google.com with SMTP id v144so5403497lfa.13
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 19:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ppVeo0b190qF2Ptj5wRZlt8bVEFE8U+FRbqIrPfzfO0=;
 b=Y0OvGdC7Ay1jBPx9c95rwCWL5YO1NKIyLtH3RBjJqksuu5AmwVeqJA3yAVePeFJpD+
 FNnIveyBAgJypsaK51ANwnqRY7vR4BDOlrKMA1BLxssBAe6rezmriag1QbajUoT/ZYrN
 ia/BNKgIUF2Dh8y1MMAUsf9DpJByCV5DJS2VJkfHelErXdtSUlMof+LOnHR2w5t7Lgp8
 qXDVuCE4fh3v7LRCzvKaV2W42Pcpn+WomjbzeSw0L8WQ5PBPJfLgYXwY7wEsOObmFR7E
 MQuyqNeRdqW4WggiOLj3w/oToWlhsUSpLUpGXRyZ/xcdo2KG7q7xYzh1w+ag4jRU6Hmu
 2PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ppVeo0b190qF2Ptj5wRZlt8bVEFE8U+FRbqIrPfzfO0=;
 b=CFDLOcASrNPgrgUyoj1IFMEu5WEKQf/IGnGPf1MwGC+exm4WwXAKKmweIx0v39AQYi
 VsD6Yo+uRF+2JbKRBBWjL/lKYTglxX770MYLPAOMfG1k07YuOBAlOX3MOOC1ZK/Lo2Qc
 TlOKJ1wNgAQzeInBZ9GmhwtwuC61n2z/x0907mugzN7Ft1cK4iuDRUtwZHRBbvRsNo0q
 aNefNgrU2jbyfukhxoUazcMJLxHDMRcZ6zRjFE0SOTexPbJlg0TBB6QyxTtBTJWg8Xcl
 lwHH/c9F0/+C51hMc6a5KTPjmIexAees0xE+EdjMJsc1XrJZeX0Yo9ciLnf+X2PeA9Jp
 Owog==
X-Gm-Message-State: AOAM532Wc24s9cu9hY96PThBfJqoAhlsEmPrxmukmb5AFPyalQVyq0tm
 P7fvAH/vhmqMKxZxZd0s45rV71cFZREwbQnwmEN0OA==
X-Google-Smtp-Source: ABdhPJxbdRyNk08Ob4JHGuI4T01MyHskgm3c1DqN+BTCMCllgLD793w6HxN7Xw1dUaB0tfhybEYmpnLfDVXd/P4HXms=
X-Received: by 2002:a19:4204:: with SMTP id p4mr39766lfa.536.1604634528395;
 Thu, 05 Nov 2020 19:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
 <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
 <20201105184350.GA1611477@bogus>
In-Reply-To: <20201105184350.GA1611477@bogus>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 6 Nov 2020 11:48:37 +0800
Message-ID: <CALprXBYUddwE-+Bnt2qh4ETwZJ2LnwmB1mQNT88vcqxB8kPW4Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: google: dt-bindings: modify machine bindings
 for two MICs case
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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

HI, Rob,

Thank you for the comments.


On Fri, Nov 6, 2020 at 2:43 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 03, 2020 at 06:30:50PM +0800, Ajye Huang wrote:
> > Add a property "dmic-gpios" for switching between two MICs.
> >
> > Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> > ---
> >  .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> > index efc34689d6b5..9e0505467e57 100644
> > --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> > +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> > @@ -34,6 +34,9 @@ properties:
> >    "#size-cells":
> >      const: 0
> >
> > +  dmic-gpios:
> > +    description: GPIO for switching between DMICs
>
> Need to define how many (maxItems: 1).

Yes, I will add in the v6 version.

>
> > +
> >  patternProperties:
> >    "^dai-link(@[0-9])?$":
> >      description:
> > @@ -81,6 +84,7 @@ additionalProperties: false
> >  examples:
> >
> >    - |
> > +    //Example 1
> >      sound {
> >          compatible = "google,sc7180-trogdor";
> >          model = "sc7180-rt5682-max98357a-1mic";
> > @@ -128,3 +132,57 @@ examples:
> >              };
> >          };
> >      };
> > +
> > +  - |
> > +    //Example 2 (2mic case)
> > +    sound {
> > +        compatible = "google,sc7180-trogdor";
> > +        model = "sc7180-rt5682-max98357a-2mic";
> > +
> > +        audio-routing =
> > +                    "Headphone Jack", "HPOL",
> > +                    "Headphone Jack", "HPOR";
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        dmic-gpios = <&tlmm 86 0>;
>
> Do we really need another example for this? Can't you just add it to the
> existing example?

I think just keep One example. I will remove the example2 and put
dmic-gpios = <&tlmm 86 0>; in the first example and
modify the model from "sc7180-rt5682-max98357a-1mic" to
"sc7180-rt5682-max98357a-2mic". It looks clear.

>
> > +
> > +        dai-link@0 {
> > +            link-name = "MultiMedia0";
> > +            reg = <0>;
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
> > +            reg = <1>;
> > +            cpu {
> > +                sound-dai = <&lpass_cpu 1>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&max98357a>;
> > +            };
> > +        };
> > +
> > +        dai-link@2 {
> > +            link-name = "MultiMedia2";
> > +            reg = <2>;
> > +            cpu {
> > +                sound-dai = <&lpass_hdmi 0>;
> > +            };
> > +
> > +            codec {
> > +                sound-dai = <&msm_dp>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.25.1
> >
