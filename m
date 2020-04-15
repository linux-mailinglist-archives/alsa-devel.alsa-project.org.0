Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A261AA986
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 16:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CAED1665;
	Wed, 15 Apr 2020 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CAED1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586960045;
	bh=g9zc9gWFrZts6nCro79E4zNLwGrqjr25+7GmsmkzvQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FT4ipF4ulfe6cdA4r87PJ5StwO4VQ+oLhD3NNWk19/GQEjps2KoToafsgyK9AI6DH
	 08MpVPUZRjdPK/pGa5YMnc/i+bSDjeUZzP5p8G3BuA/2tj1XtQIq18hfROyHCY2Ba8
	 hUgL854bpw0Ag5yYKrFNjWgNSHpSXWkAgNBNTibg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B62F80115;
	Wed, 15 Apr 2020 16:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFA1FF80115; Wed, 15 Apr 2020 16:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1215DF80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1215DF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZdESDpha"
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82A8720857
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586959932;
 bh=g9zc9gWFrZts6nCro79E4zNLwGrqjr25+7GmsmkzvQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZdESDpha5XBMMH2NumasO7B5X8dXw9HFSztHTSiLifxEnAtw7voFnYGdpI6EuoHdU
 /ExqpEmsqp0/LnjQX+zOXaD6GTUv5AQ5l84baZvQtB4517udMY6ZG9NdsAZfO/Opr3
 DN9/nwsr2l7i0O6illGKVq5zZAke9OzzviJ626A8=
Received: by mail-qt1-f176.google.com with SMTP id w24so13237079qts.11
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 07:12:12 -0700 (PDT)
X-Gm-Message-State: AGi0PuaZpVMG/Solt6iUJMla/7VTY9L3qyYWHUNjL4a4W3hUDhmByJaP
 4X/TBBcOPpnKfu2U6YvopGoG1RfSkkSPS0Mihg==
X-Google-Smtp-Source: APiQypKpcfRLgsq5L44xqX/Nd5yT1RL98k+9haGwOML5QU4TMV8UysP823kpICcUXqUoiZVvAG/C9S9NizqCtatbW/E=
X-Received: by 2002:ac8:6695:: with SMTP id d21mr21432863qtp.110.1586959931603; 
 Wed, 15 Apr 2020 07:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <68208297b49e85adfddf843bc205d154790a49de.1585726761.git.shengjiu.wang@nxp.com>
 <20200414154643.GA29098@bogus>
 <CAA+D8AP2CiRT7qkNa7yBDH0Dbd=i1eyqL4g4zobRmR-vEx4VBQ@mail.gmail.com>
In-Reply-To: <CAA+D8AP2CiRT7qkNa7yBDH0Dbd=i1eyqL4g4zobRmR-vEx4VBQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Apr 2020 09:11:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Uk1zPT=JyZczH5WRWP617Mqhaur+LwbKKYDBGBhd-cQ@mail.gmail.com>
Message-ID: <CAL_Jsq+Uk1zPT=JyZczH5WRWP617Mqhaur+LwbKKYDBGBhd-cQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Apr 14, 2020 at 9:56 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> Hi Rob
>
> On Tue, Apr 14, 2020 at 11:49 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Apr 01, 2020 at 04:45:39PM +0800, Shengjiu Wang wrote:
> > > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > > IP module found on i.MX8MN.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/sound/fsl,easrc.yaml  | 101 ++++++++++++++++++
> > >  1 file changed, 101 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > new file mode 100644
> > > index 000000000000..14ea60084420
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > @@ -0,0 +1,101 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP Asynchronous Sample Rate Converter (ASRC) Controller
> > > +
> > > +maintainers:
> > > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^easrc@.*"
> > > +
> > > +  compatible:
> > > +    const: fsl,imx8mn-easrc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Peripheral clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: mem
> > > +
> > > +  dmas:
> > > +    maxItems: 8
> > > +
> > > +  dma-names:
> > > +    items:
> > > +      - const: ctx0_rx
> > > +      - const: ctx0_tx
> > > +      - const: ctx1_rx
> > > +      - const: ctx1_tx
> > > +      - const: ctx2_rx
> > > +      - const: ctx2_tx
> > > +      - const: ctx3_rx
> > > +      - const: ctx3_tx
> > > +
> > > +  firmware-name:
> > > +    allOf:
> > > +      - $ref: /schemas/types.yaml#/definitions/string
> > > +      - const: imx/easrc/easrc-imx8mn.bin
> > > +    description: The coefficient table for the filters
> > > +
> > > +  fsl,asrc-rate:
> >
> > fsl,asrc-rate-hz
>
> Can we keep "fsl,asrc-rate", because I want this property
> align with the one in fsl,asrc.txt.  These two asrc modules
> can share same property name.

Oh, yes.

So with the example fixed:

Reviewed-by: Rob Herring <robh@kernel.org>
