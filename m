Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D936A18E779
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Mar 2020 09:05:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FA7486E;
	Sun, 22 Mar 2020 09:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FA7486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584864324;
	bh=1mChDyXxQzyawi/OpETPRJOYjRetoQEJvPRClP15Tc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t5ZE14He7mA/nvHNhbUabsraO8Zl+X5zmO4jcPqKeGUfx0AmrsuWC3ruexSIUGhda
	 jCqVHq2eRVH3U0MgW7vN+H59zAs5+FTweit0J0y1L2oZ/hwIOn3jxA4lZNj6Eojz1c
	 Pao8EJoVS+yce5H29u/j2uPFahIqs1AX+0XgUiLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 241D1F800C7;
	Sun, 22 Mar 2020 09:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 774ECF801F8; Sun, 22 Mar 2020 09:03:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96045F800F6
 for <alsa-devel@alsa-project.org>; Sun, 22 Mar 2020 09:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96045F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aaQ6VVng"
Received: by mail-qk1-x742.google.com with SMTP id q188so6642371qke.8
 for <alsa-devel@alsa-project.org>; Sun, 22 Mar 2020 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXVv3O+6eypP6m1WWp+RaUMVY3oNb3TdV/pq+HroePk=;
 b=aaQ6VVngPHL4EX4wx6NHsYw7h7DHQ+Co8ZaQT3+ricC2dvlwjh+yjYyPlppiu5w/2k
 tgkrJS24DpcYVsN2SpS/m73nsrtXWgQIGP7QgVvGNH4yAQ2CJE9QjUVZJ1VfIBICkwH0
 qvjOKpniEAAWaNNgl1uYm8KivgOm5uRZc3en9aqZAAXmjfpsLdzzCP8ek3KY89OLurBW
 p8wpNTqbZFt4IZED75rsXMFWhez2a+r2ZHH7FKSFRHG8M5QY8gx/87zDOMkj8C1jj4EB
 9HF/lMB0LHe6RNVgiVSRzidRYxSbSPJc6tZgDTmiQKo3kSc125VgkAv7i4O5/7LQZ10t
 gVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXVv3O+6eypP6m1WWp+RaUMVY3oNb3TdV/pq+HroePk=;
 b=fkxZ+ugVjkn3RzE7/ZmGZOCOCTzf1kH4vKkW37TNUrECVwQXDJ4t9RaZo53F+X/xVa
 P6qzpIL82otvcpa6WLSgw3Nr0wnS4vtgT/1e6rUiO2bSv9xqFUaEVodWdF91MoRGy35A
 elTJEdBjzKmveLFdlcQCMKWWZHKoaN4MCsKESQfrdnyEf+1VcNgx50ACRryoIpI1Hiop
 iN79dezPzhh0SUvb/3vfHZh0njvH37IbgXeC4+uJ2G7GaqKncoT7b17XNqEHg6u2Hq4A
 PAW05ylvYcIJnHsO4enz0DBymHaOD4oissDso+Te2vW2rJBV87m8Ro4MC6xVKJy4gKSp
 PvlQ==
X-Gm-Message-State: ANhLgQ2WqvPQEAgOEeeMPYpzkwHezdK6F1a90UtYkKD6x8fPWLaMqjbd
 EPfB4+VRRICkikUEzDkcz4hM27r+MMflK8LZ2ec=
X-Google-Smtp-Source: ADFU+vv15vjlLfsa664H8VI+98Ko/0kGJBPM66yGAqwLj6B2pgF+uXCCQ0y20KBRdMdMu0RQlW+glQ8BaD4Y4HxhOxA=
X-Received: by 2002:a37:4a85:: with SMTP id
 x127mr16083800qka.152.1584864189047; 
 Sun, 22 Mar 2020 01:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <71b6ad3d0ea79076fded2373490ec1eb8c418d21.1583725533.git.shengjiu.wang@nxp.com>
 <20200320174812.GA27070@bogus>
In-Reply-To: <20200320174812.GA27070@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 22 Mar 2020 16:02:57 +0800
Message-ID: <CAA+D8AMC0fuTxDiWEjOVx11eDuGb9WeMhFTzxFx-3fYKvf=-jw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Sat, Mar 21, 2020 at 1:50 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 09, 2020 at 11:58:33AM +0800, Shengjiu Wang wrote:
> > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > IP module found on i.MX8MN.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > new file mode 100644
> > index 000000000000..ff22f8056a63
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > @@ -0,0 +1,101 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^easrc@.*"
> > +
> > +  compatible:
> > +    const: fsl,imx8mn-easrc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: mem
> > +
> > +  dmas:
> > +    maxItems: 8
> > +
> > +  dma-names:
> > +    items:
> > +      - const: ctx0_rx
> > +      - const: ctx0_tx
> > +      - const: ctx1_rx
> > +      - const: ctx1_tx
> > +      - const: ctx2_rx
> > +      - const: ctx2_tx
> > +      - const: ctx3_rx
> > +      - const: ctx3_tx
> > +
> > +  fsl,easrc-ram-script-name:
>
> 'firmware-name' is the established property name for this.

will use "firmware-name"

>
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/string
> > +      - const: imx/easrc/easrc-imx8mn.bin
>
> Though if there's only 1 possible value, why does this need to be in DT?
>
> > +    description: The coefficient table for the filters
>
> If the firmware is only 1 thing, then perhaps this should just be a DT
> property rather than a separate file. It depends on who owns/creates
> this file. If fixed for the platform, then DT is a good fit. If updated
> separately from DT and boot firmware, then keeping it separate makes
> sense.
>
The firmware is not fixed for the platform, it is updated separately from
DT.  So we can keep it separately.

best regards
wang shengjiu
