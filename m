Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBE4382A09
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 12:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5519583D;
	Mon, 17 May 2021 12:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5519583D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621248096;
	bh=z3IIby9tvZVZe4Gj2QDiU+q5c/pYvimCVIrb+xiXpyA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBw+mZ9ddVk9Nhl8320tdIs6gV4+m0mjzZhm63wQirA3lleYv67VL3XzfoRpmHZWJ
	 5Z7H+1PxxogqX6ye6GLQeGJrM0QmYQ/VawZaoV9Pn/unbieGrWs9cDudpurvxnm0bR
	 NBrlJlpuaxZ83xVgNCbucZjwc3RGpZ/AqEhQscuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FCEF80246;
	Mon, 17 May 2021 12:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B36F8020B; Mon, 17 May 2021 12:40:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43015F80169
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 12:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43015F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lJIewHJ5"
Received: by mail-qt1-x82e.google.com with SMTP id t7so4462579qtn.3
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9t98eUjKj6gDcKcxxVBCrgjV/xSgE7bQnCfYmjhVhU=;
 b=lJIewHJ5kTyrY82X8MK8oal0zVdmDeiJCgaEtxhPmMYOhq7KtcgyCz4etI5570uBmn
 y44cJr/tus37yOQpjgmi3O/XyNHHsWlA6JcQqZAC4oFATVuPrfTIp4NR6sqwImtLxpmD
 aD8JLo7IEjsNxQ1e6gDJA5uTeb6U8nDB1nEv21anaoh4vEMT2QVjmuCNVooxFsqhbpkh
 XXkL9Y5c4Nzc0i9F4mfXfQHtYmi6IxbV+9hKTFDEd7pgFAqGjoOW/5VluHEneOeIN3Fz
 /1daKx1wOzHg2rdXO682JxGj/vREANmVqxEYQqUuX2j3i/pnCVxKwif/gHNszzh9P6Jx
 py7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9t98eUjKj6gDcKcxxVBCrgjV/xSgE7bQnCfYmjhVhU=;
 b=RcinRYGRX8Fihvo/ftuGzJoLLFxlhh+Ze1bPQEIuaMrUaS7pw6JzjWlmYMOw/RGlAS
 WUhZaF3vb5BpslMdm/ONp6eh4BTUWoKQnUmJS2PyO0EhmpUB+b4gbHWh9ah2jbnlJaFr
 BIVQrFKEvEyMj0/V4i2Z8cSBVE09EHZ2SikbtEIIOzpc6Cufz73zNvfCu9py5L6OvKO0
 20zolbgnR9ER06gqv01MyLpgiiXaH3cGdrFOPl5vZc05/j5vQiMGEenL45xPm1Mw/g3r
 +0vbkPsyKjaVmaKecjPw9nXchRb6cKT+Du21bJC1ZO/i4RrKZEbnn11meAVHziaxitbW
 AQ8A==
X-Gm-Message-State: AOAM530GlaI4m3wQusIqkQiNZL0EKbhKV/wC1OXdFVF4qx3VNTyDfCV4
 3m39xXGpFGEfTtu92MqRQyUUQYi7Ol4oeVgInvU=
X-Google-Smtp-Source: ABdhPJxP2yInzaLOWHJ5yaYXJgH9PtDXyh5iBmZ7BS7Et2hKC0KXRWFB5kV1XtbtFyN7JRNeEd4rI0s5qieH76fQIF4=
X-Received: by 2002:ac8:4cda:: with SMTP id l26mr50675557qtv.54.1621247992548; 
 Mon, 17 May 2021 03:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <1620630441-14358-1-git-send-email-shengjiu.wang@nxp.com>
 <1620630441-14358-2-git-send-email-shengjiu.wang@nxp.com>
 <20210511190057.GA2416585@robh.at.kernel.org>
In-Reply-To: <20210511190057.GA2416585@robh.at.kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 17 May 2021 18:39:41 +0800
Message-ID: <CAA+D8APEdrK0rVz_Mcad6k0ZGS2k9wkXJ6-NOykQ-NdDzFXhrg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: imx-akcodec: Add binding doc
 for akcodec machine driver
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Thu, May 13, 2021 at 4:07 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 10, 2021 at 03:07:21PM +0800, Shengjiu Wang wrote:
> > Imx-akcodec is a new added machine driver for supporting
> > ak4458/ak5558/ak5552/ak4497 codec on i.MX platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - update doc accoring to Rob's comment, use the common porperties.
> >
> >  .../bindings/sound/imx-audio-akcodec.yaml     | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > new file mode 100644
> > index 000000000000..0812c4779b59
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-akcodec.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/imx-audio-akcodec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX audio complex with AK4458/AK5558/AK5552/AK4497 codec
> > +
> > +maintainers:
> > +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8mq-audio-akcodec
> > +      - fsl,imx-audio-akcodec
>
> We gone from individual codecs to a family of codecs. Is there something
> specific for the machine driver about this set of codecs? Why can't it
> be *any* codec?

Yes, there is something specific. but let me do further updates for this in the
next version, then the document name needs to be changed to
"imx-audio-card".

best regards
wang shengjiu
