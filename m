Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE9A5947
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 16:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB1316DB;
	Mon,  2 Sep 2019 16:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB1316DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567434379;
	bh=IMwiL89R0mGqCkVu1k4h8hke8NAQqLQCzlHV+LEm/xQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qbTDVk3z444WWkJuBwDFviLO2IfcOQBycWXF4CwirP4wqUoESIu6XrSDSbXGJSzmz
	 9jo+WjvqCYomyfXcpTWSR7f2VuLNlYgTZIduEfNN2iQjNR3BzGi8EG9XV/eny7VQzz
	 KbescWWsf6tk55TUxjsKy9LgI6IRpFtwABCLCR/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE891F803D0;
	Mon,  2 Sep 2019 16:24:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 671DBF803D0; Mon,  2 Sep 2019 16:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7669BF8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 16:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7669BF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eG5ApBOQ"
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA0E322DCC
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567434266;
 bh=B74PQ5o385KMtSFx606GqW7Hji/64H+L+7SO8wzLMGg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eG5ApBOQMdx43szlZ3hRfFK3JhjJnHU1h9N6fzJZ5gSFAGo+DUwYCQAzqPRtkeL/Z
 egjx2sk3s2NgyQuuh7m09MlzWLOaXz87O/ehHQQMF+Ukgb9LnuLBl275xwetBiplq0
 SJsZX23mHLern4Z4WajFyMqxkRO1LaFCSNuEgAlY=
Received: by mail-qk1-f179.google.com with SMTP id s14so12669971qkm.4
 for <alsa-devel@alsa-project.org>; Mon, 02 Sep 2019 07:24:26 -0700 (PDT)
X-Gm-Message-State: APjAAAXOLpm7pfSDGCrP1YKLkuqWV4GlfJCMv57BWAX5hAiQiOkwHuFZ
 SgtWum6ItIqKtBvkmeXsa/3vfCfbCSS5xmIbwg==
X-Google-Smtp-Source: APXvYqxVgrKxDU9AKZPVkiZjyBgcLWuDoOAhBqYHYxpm22jPeoe3HQJTqnHt0BhMxQu7W0O02Nt2wgbZXPnLf8rZcYc=
X-Received: by 2002:a37:682:: with SMTP id 124mr28156982qkg.393.1567434265875; 
 Mon, 02 Sep 2019 07:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
 <20190830210607.22644-2-miquel.raynal@bootlin.com>
 <20190902044231.GA17348@bogus> <20190902155113.40b00fa0@xps13>
In-Reply-To: <20190902155113.40b00fa0@xps13>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Sep 2019 15:24:13 +0100
X-Gmail-Original-Message-ID: <CAL_JsqJJ31wfXnLGSp5Hzkb2L7VeDoOki+eBqUkm2LWEtsA58A@mail.gmail.com>
Message-ID: <CAL_JsqJJ31wfXnLGSp5Hzkb2L7VeDoOki+eBqUkm2LWEtsA58A@mail.gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alexandre@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/3] dt-bindings: sound: Add Xilinx
	logicPD-I2S FPGA IP bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Sep 2, 2019 at 2:51 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Rob,
>
> Thanks for the review, one question below.
>
> Rob Herring <robh@kernel.org> wrote on Mon, 02 Sep 2019 14:39:09 +0100:
>
> > On Fri, Aug 30, 2019 at 11:06:06PM +0200, Miquel Raynal wrote:
> > > Document the logicPD I2S FPGA block bindings in yaml.
> > >
> > > Syntax verified with dt-doc-validate.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../bindings/sound/xlnx,logicpd-i2s.yaml      | 57 +++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml b/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> > > new file mode 100644
> > > index 000000000000..cbff641af199
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/xlnx,logicpd-i2s.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Device-Tree bindings for Xilinx logicPD I2S FPGA block
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +
> > > +description: |
> > > +  The IP supports I2S playback/capture audio. It acts as a slave and
> > > +  clocks should come from the codec. It only supports two channels and
> > > +  S16_LE format.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: xlnx,logicpd-i2s
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description:
> > > +      Base address and size of the IP core instance.
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    items:
> > > +      - description: tx interrupt
> > > +      - description: rx interrupt
> > > +    description:
> > > +      Either the Tx interruption or the Rx interruption or both.
> >
> > The schema says either tx or both. Doesn't really matter here as it's
> > just numbers.
>
> I see , I'll drop the 'items' entry.
>
> >
> > > +
> > > +  interrupt-names:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    items:
> > > +      - const: tx
> > > +      - const: rx
> >
> > But here it does matter.
> >
> > The easiest way to express this is:
> >
> > oneOf:
> >   - items:
> >       - enum: [ tx, rx ]
> >   - items:
> >       - const: tx
> >       - const: rx
> >
>
> Does this enforce an order? (I don't know if it matters, though, but in
> the bellow example I put the Rx interrupt first).

Yes. It does matter and should be defined what the order it.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
